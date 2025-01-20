@interface COSMagicCodeScanner
- (BOOL)canUseCamera;
- (BOOL)isScanningForCode;
- (BOOL)lensCollectorMode;
- (BOOL)lensOnlyMode;
- (BOOL)registeredForCaptureRunTimeErrorNotification;
- (BOOL)showLensHUD;
- (CALayer)progressBGLayer;
- (CALayer)progressLayer;
- (COSMagicCodeScanner)initWithFrame:(CGRect)a3;
- (COSMagicCodeScannerDelegate)delegate;
- (COSWristAttributeVisualDetector)detector;
- (COSWristDetectionHUD)mlHUD;
- (UILabel)progessLabel;
- (UITapGestureRecognizer)debugUIRecognizer;
- (id)setupCameraSession;
- (void)_changeCameraConfiguration;
- (void)_selectCaptureDevice;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)closeWriter;
- (void)dealloc;
- (void)handleRuntimeError:(id)a3;
- (void)layoutSubviews;
- (void)setCameraAttributes;
- (void)setDebugUIRecognizer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsScanningForCode:(BOOL)a3;
- (void)setLensCollectorMode:(BOOL)a3;
- (void)setLensOnlyMode:(BOOL)a3;
- (void)setMlHUD:(id)a3;
- (void)setProgessLabel:(id)a3;
- (void)setProgressBGLayer:(id)a3;
- (void)setProgressLayer:(id)a3;
- (void)setRegisteredForCaptureRunTimeErrorNotification:(BOOL)a3;
- (void)setShowLensHUD:(BOOL)a3;
- (void)setupAssetWriterIfNeeded;
- (void)startRunning;
- (void)stopRunning;
- (void)toggleDebugUI:(id)a3;
- (void)writeSampleBuffer:(opaqueCMSampleBuffer *)a3 ofType:(id)a4;
@end

@implementation COSMagicCodeScanner

- (COSMagicCodeScanner)initWithFrame:(CGRect)a3
{
  v26.receiver = self;
  v26.super_class = (Class)COSMagicCodeScanner;
  v3 = -[COSMagicCodeScanner initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[NSUserDefaults standardUserDefaults];
    unsigned int v5 = [v4 BOOLForKey:@"COSEnableInternalUI"];

    if (v5)
    {
      v6 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v3 action:"toggleDebugUI:"];
      debugUIRecognizer = v3->_debugUIRecognizer;
      v3->_debugUIRecognizer = v6;

      [(UITapGestureRecognizer *)v3->_debugUIRecognizer setNumberOfTapsRequired:2];
      [(COSMagicCodeScanner *)v3 addGestureRecognizer:v3->_debugUIRecognizer];
    }
    v8 = +[UIScreen mainScreen];
    [v8 bounds];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    MGGetBoolAnswer();
    v17 = +[NSUserDefaults standardUserDefaults];
    v3->_lensCollectorMode = [v17 BOOLForKey:@"LensCollector"];

    if (v3->_lensCollectorMode)
    {
      v3->_lensOnlyMode = 1;
    }
    else
    {
      v18 = +[NSUserDefaults standardUserDefaults];
      v3->_lensOnlyMode = [v18 BOOLForKey:@"LensMode"];

      if (!v3->_lensOnlyMode)
      {
        v25 = +[NSUserDefaults standardUserDefaults];
        v3->_showLensHUD = [v25 BOOLForKey:@"LensHUD"];

        if (!v3->_showLensHUD) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
    }
    v3->_showLensHUD = 1;
LABEL_8:
    v27.origin.x = v10;
    v27.origin.y = v12;
    v27.size.width = v14;
    v27.size.height = v16;
    v19 = -[COSWristDetectionHUD initWithFrame:]([COSWristDetectionHUD alloc], "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v27), 300.0);
    mlHUD = v3->_mlHUD;
    v3->_mlHUD = v19;

    [(COSWristDetectionHUD *)v3->_mlHUD setAlpha:0.5];
    [(COSMagicCodeScanner *)v3 addSubview:v3->_mlHUD];
LABEL_9:
    v21 = [UIApp setupController];
    uint64_t v22 = [v21 visualDetector];
    detector = v3->_detector;
    v3->_detector = (COSWristAttributeVisualDetector *)v22;
  }
  return v3;
}

- (void)dealloc
{
  reader = self->_reader;
  if (reader)
  {
    HCImagePerspectiveReader::~HCImagePerspectiveReader(reader);
    operator delete();
  }
  pixelBufferPyramidArray = self->_pixelBufferPyramidArray;
  if (pixelBufferPyramidArray)
  {
    CFArrayRemoveAllValues(pixelBufferPyramidArray);
    CFRelease(self->_pixelBufferPyramidArray);
  }
  pixelTransferSession = self->_pixelTransferSession;
  if (pixelTransferSession) {
    CFRelease(pixelTransferSession);
  }
  v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)COSMagicCodeScanner;
  [(COSMagicCodeScanner *)&v7 dealloc];
}

- (void)toggleDebugUI:(id)a3
{
  [(CALayer *)self->_progressBGLayer setHidden:[(CALayer *)self->_progressBGLayer isHidden] ^ 1];
  uint64_t v4 = [(CALayer *)self->_progressLayer isHidden] ^ 1;
  progressLayer = self->_progressLayer;

  [(CALayer *)progressLayer setHidden:v4];
}

- (void)setupAssetWriterIfNeeded
{
  v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = +[NSNumber numberWithInt:31457280];
  v13[0] = AVVideoExpectedSourceFrameRateKey;
  v13[1] = AVVideoProfileLevelKey;
  v14[0] = &off_10025BF98;
  v14[1] = AVVideoProfileLevelH264MainAutoLevel;
  v13[2] = AVVideoAverageBitRateKey;
  v13[3] = AVVideoMaxKeyFrameIntervalKey;
  v14[2] = v4;
  v14[3] = &off_10025BFB0;
  unsigned int v5 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  [v3 addEntriesFromDictionary:v5];

  v12[0] = AVVideoCodecTypeH264;
  v11[0] = AVVideoCodecKey;
  v11[1] = AVVideoWidthKey;
  v6 = +[NSNumber numberWithDouble:736.0];
  v12[1] = v6;
  v11[2] = AVVideoHeightKey;
  objc_super v7 = +[NSNumber numberWithDouble:414.0];
  v11[3] = AVVideoCompressionPropertiesKey;
  v12[2] = v7;
  v12[3] = v3;
  v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  if (!self->_assetWriterInput)
  {
    double v9 = (AVAssetWriterInput *)[objc_alloc((Class)AVAssetWriterInput) initWithMediaType:AVMediaTypeVideo outputSettings:v8];
    assetWriterInput = self->_assetWriterInput;
    self->_assetWriterInput = v9;
  }
}

- (id)setupCameraSession
{
  if (self->_session)
  {
LABEL_2:
    self->_watermark = CFAbsoluteTimeGetCurrent();
    v3 = pbb_setupflow_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [(AVCaptureDevice *)self->_device activeFormat];
      *(_DWORD *)buf = 138412290;
      v38 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "activeFormat: %@", buf, 0xCu);
    }
    unsigned int v5 = 0;
    self->_canUseCamera = 1;
    goto LABEL_31;
  }
  v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Xceive", 0);
  queue = self->_queue;
  self->_queue = v6;

  id v8 = objc_alloc_init((Class)AVCaptureVideoDataOutput);
  if (sub_100032540())
  {
    self->_shouldCaptureMagicCodeScan = 1;
  }
  else
  {
    int v9 = sub_10003251C();
    self->_shouldCaptureMagicCodeScan = v9;
    if (!v9) {
      goto LABEL_18;
    }
  }
  CGFloat v10 = +[COSInternalUserStudyAssetManager detailBundle];
  if (v10)
  {
    unsigned int v11 = +[COSMLCaptureDisclosureController disclosureEffectivelyAccepted];

    if (v11)
    {
      CGFloat v12 = pbb_setupflow_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "COSMagicCodeScanner: Is Internal Device...", buf, 2u);
      }

      if (!self->_assetWriter)
      {
        id v13 = objc_alloc((Class)AVAssetWriter);
        CGFloat v14 = +[COSInternalUserStudyAssetManager fileURLPath];
        double v15 = +[NSURL URLWithString:v14];
        id v34 = 0;
        CGFloat v16 = (AVAssetWriter *)[v13 initWithURL:v15 fileType:AVFileTypeMPEG4 error:&v34];
        id v17 = v34;
        assetWriter = self->_assetWriter;
        self->_assetWriter = v16;

        v19 = pbb_setupflow_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = self->_assetWriter;
          *(_DWORD *)buf = 138412290;
          v38 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "COSMagicCodeScanner: Created AssetWriter %@", buf, 0xCu);
        }

        if (!v17)
        {
          [(COSMagicCodeScanner *)self setupAssetWriterIfNeeded];
          [(AVAssetWriter *)self->_assetWriter addInput:self->_assetWriterInput];
        }
      }
    }
  }
LABEL_18:
  v21 = (AVCaptureSession *)objc_alloc_init((Class)AVCaptureSession);
  session = self->_session;
  self->_session = v21;

  [(AVCaptureSession *)self->_session beginConfiguration];
  [v8 setAlwaysDiscardsLateVideoFrames:1];
  CFStringRef v35 = kCVPixelBufferPixelFormatTypeKey;
  v36 = &off_10025BFC8;
  v23 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  [v8 setVideoSettings:v23];

  [v8 setSampleBufferDelegate:self queue:self->_queue];
  [(COSMagicCodeScanner *)self _selectCaptureDevice];
  device = self->_device;
  if (!device)
  {
    v25 = pbb_setupflow_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100172364();
    }
    unint64_t v26 = 0;
    goto LABEL_26;
  }
  if ((id)[(AVCaptureDevice *)device position] == (id)2)
  {
    v25 = pbb_setupflow_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100172398();
    }
    unint64_t v26 = 1;
LABEL_26:

    unsigned int v5 = sub_10006D394(v26);

    goto LABEL_31;
  }
  CGRect v27 = self->_device;
  id v33 = 0;
  v28 = +[AVCaptureDeviceInput deviceInputWithDevice:v27 error:&v33];
  id v29 = v33;
  if (!v29)
  {
    [(AVCaptureSession *)self->_session addOutput:v8];
    [(AVCaptureSession *)self->_session addInput:v28];
    if ([(AVCaptureSession *)self->_session canSetSessionPreset:AVCaptureSessionPreset1920x1080])
    {
      AVCaptureSessionPreset v32 = AVCaptureSessionPreset1920x1080;
    }
    else
    {
      AVCaptureSessionPreset v32 = AVCaptureSessionPresetMedium;
    }
    [(AVCaptureSession *)self->_session setSessionPreset:v32];
    [(AVCaptureSession *)self->_session commitConfiguration];
    [(COSMagicCodeScanner *)self setCameraAttributes];

    goto LABEL_2;
  }
  v30 = pbb_setupflow_log();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    sub_1001723CC();
  }

  unsigned int v5 = sub_10006D394(2uLL);

LABEL_31:

  return v5;
}

- (void)_selectCaptureDevice
{
  v3 = +[AVCaptureDevice defaultDeviceWithDeviceType:AVCaptureDeviceTypeBuiltInUltraWideCamera mediaType:AVMediaTypeVideo position:1];
  uint64_t v4 = +[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
  unsigned int v5 = (char *)[v3 minimumFocusDistance];
  v6 = (char *)[v4 minimumFocusDistance];
  id v7 = v6;
  if (v3) {
    BOOL v8 = (unint64_t)(v5 - 1) >= 0x31;
  }
  else {
    BOOL v8 = 1;
  }
  int v10 = !v8 && (uint64_t)v5 < (uint64_t)v6;
  p_device = (id *)&self->_device;
  id v12 = *p_device;
  if (*p_device) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v10 == 0;
  }
  if (!v13)
  {
    objc_storeStrong(p_device, v3);
    id v12 = *p_device;
  }
  if (!v12) {
    objc_storeStrong(p_device, v4);
  }
  CGFloat v14 = pbb_setupflow_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136316418;
    CGFloat v16 = "-[COSMagicCodeScanner _selectCaptureDevice]";
    __int16 v17 = 2112;
    v18 = v3;
    __int16 v19 = 2048;
    v20 = v5;
    __int16 v21 = 2112;
    uint64_t v22 = v4;
    __int16 v23 = 2048;
    id v24 = v7;
    __int16 v25 = 1024;
    int v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s:\n ultraWideDevice: %@\n ultraWideMinimumFocusDistance: %ld\n defaultDevice: %@\n defaultMinimumFocusDistance: %ld\n useUltrawideMacroCamera: %{BOOL}d", (uint8_t *)&v15, 0x3Au);
  }
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)COSMagicCodeScanner;
  [(COSMagicCodeScanner *)&v8 layoutSubviews];
  previewLayer = self->_previewLayer;
  uint64_t v4 = [(COSMagicCodeScanner *)self layer];
  [v4 bounds];
  double v6 = v5;
  id v7 = [(COSMagicCodeScanner *)self layer];
  [v7 bounds];
  -[AVCaptureVideoPreviewLayer setFrame:](previewLayer, "setFrame:", 0.0, 0.0, v6);
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v8 = a3;
  id v68 = a5;
  if (!self->_isClosingCapture && self->_isScanningForCode)
  {
    detector = self->_detector;
    if (!detector)
    {
      int v10 = [UIApp setupController];
      unsigned int v11 = [v10 visualDetector];
      id v12 = self->_detector;
      self->_detector = v11;

      detector = self->_detector;
    }
    [(COSWristAttributeVisualDetector *)detector ingestSampleBuffer:a4];
    BOOL v13 = +[NSUserDefaults standardUserDefaults];
    unsigned int v14 = [v13 BOOLForKey:@"LiveOnCollection"];

    if (self->_showLensHUD || (self->_lensCollectorMode ? (int v15 = 1) : (int v15 = v14), v15 == 1))
    {
      CGFloat v16 = [(COSWristAttributeVisualDetector *)self->_detector computedConfidences];
      __int16 v17 = [(COSWristAttributeVisualDetector *)self->_detector confidenceSummary];
      v18 = v17;
      if (self->_lensCollectorMode) {
        int v19 = 1;
      }
      else {
        int v19 = v14;
      }
      if (v19 == 1 && (unint64_t)[v17 attribute] >= 5) {
        -[COSWristAttributeVisualDetector exportSample:withClassification:](self->_detector, "exportSample:withClassification:", a4, [v18 attribute]);
      }
      id v20 = &_dispatch_main_q;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006EF6C;
      block[3] = &unk_100244DD8;
      block[4] = self;
      id v21 = v16;
      id v80 = v21;
      id v22 = v18;
      id v81 = v22;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    if (!self->_isClosingCapture
      && self->_shouldCaptureMagicCodeScan
      && self->_hasBegunCapture
      && self->_missWmCount <= 7)
    {
      [(COSMagicCodeScanner *)self writeSampleBuffer:a4 ofType:AVMediaTypeVideo];
    }
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    if (Current < self->_nextFrameTime) {
      goto LABEL_101;
    }
    ImageBuffer = CMSampleBufferGetImageBuffer(a4);
    if (!CVPixelBufferIsPlanar(ImageBuffer))
    {
      v28 = pbb_setupflow_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_100172400();
      }

      goto LABEL_101;
    }
    size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(ImageBuffer, 1uLL);
    size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(ImageBuffer, 1uLL);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(ImageBuffer, 1uLL);
    unint64_t v26 = BytesPerRowOfPlane;
    pixelBuffer = ImageBuffer;
    if (self->_readerUVWidth != WidthOfPlane
      || self->_readerUVHeight != HeightOfPlane
      || self->_readerUVBytesPerRow != BytesPerRowOfPlane)
    {
      reader = self->_reader;
      if (reader)
      {
        HCImagePerspectiveReader::~HCImagePerspectiveReader(reader);
        operator delete();
      }
      self->_readerUVWidth = WidthOfPlane;
      self->_readerUVHeight = HeightOfPlane;
      self->_readerUVBytesPerRow = v26;
      operator new();
    }
    float DecoderProgress = HCImagePerspectiveReader::GetDecoderProgress(self->_reader);
    if (self->_lastWmProgress > 0.0 && Current - self->_lastWmTime > 4.0)
    {
      v30 = pbb_setupflow_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(pixelBufferOut) = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "4 second timeout elapsed; resetting",
          (uint8_t *)&pixelBufferOut,
          2u);
      }

      self->_lastWmTime = Current;
      HCImagePerspectiveReader::Reset(self->_reader);
    }
    uint64_t v78 = 0;
    CFArrayRef pixelBufferPyramidArray = self->_pixelBufferPyramidArray;
    if (pixelBufferPyramidArray)
    {
      if (ImageBuffer && (pixelTransferSession = self->_pixelTransferSession) != 0)
      {
        if (CFArrayGetCount(self->_pixelBufferPyramidArray) >= 1)
        {
          CFIndex v33 = 0;
          do
          {
            ValueAtIndex = (__CVBuffer *)CFArrayGetValueAtIndex(pixelBufferPyramidArray, v33);
            if (VTPixelTransferSessionTransferImage(pixelTransferSession, ImageBuffer, ValueAtIndex)) {
              break;
            }
            ++v33;
            ImageBuffer = ValueAtIndex;
          }
          while (CFArrayGetCount(pixelBufferPyramidArray) > v33);
        }
      }
      else
      {
        CFStringRef v35 = pbb_setupflow_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          sub_1001724AC();
        }
      }
      CFArrayRef pixelBufferPyramidArray = (const __CFArray *)CFArrayGetCount(self->_pixelBufferPyramidArray);
    }
    unint64_t v36 = 0;
    v37 = pixelBuffer;
    do
    {
      unint64_t v38 = v36;
      if (CVPixelBufferLockBaseAddress(v37, 1uLL))
      {
        int v39 = 0;
      }
      else
      {
        BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(v37, 1uLL);
        unsigned int v41 = CVPixelBufferGetBytesPerRowOfPlane(v37, 1uLL);
        int v39 = HCImagePerspectiveReader::ProcessUVFrame((uint64_t)self->_reader, (uint64_t)BaseAddressOfPlane, HeightOfPlane, WidthOfPlane, v41, (uint64_t)&v78);
        CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
      }
      v42 = self->_pixelBufferPyramidArray;
      if (v42) {
        BOOL v43 = (unint64_t)pixelBufferPyramidArray > v38;
      }
      else {
        BOOL v43 = 0;
      }
      if (v43) {
        v37 = (__CVBuffer *)CFArrayGetValueAtIndex(v42, v38);
      }
      if ((unint64_t)pixelBufferPyramidArray <= v38) {
        break;
      }
      if ((_BYTE)v78) {
        break;
      }
      unint64_t v36 = v38 + 1;
    }
    while (!v39);
    if (v39)
    {
      v44 = pbb_setupflow_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        sub_100172434(v39, v44);
      }

LABEL_101:
      self->_lastFrameTime = Current;
      goto LABEL_102;
    }
    if ((_BYTE)v78)
    {
      v45 = +[NSNotificationCenter defaultCenter];
      v46 = +[NSNumber numberWithDouble:DecoderProgress * 100.0];
      [v45 postNotificationName:@"COSMagicCodeDidDecodeNotification" object:v46];

      self->_unsigned int missWmCount = 0;
      float v47 = HCImagePerspectiveReader::GetDecoderProgress(self->_reader);
      float lastWmProgress = self->_lastWmProgress;
      if (!self->_isClosingCapture && self->_shouldCaptureMagicCodeScan && !self->_hasBegunCapture)
      {
        self->_hasBegunCapture = 1;
        v63 = pbb_setupflow_log();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(pixelBufferOut) = 0;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Started Writing...", (uint8_t *)&pixelBufferOut, 2u);
        }

        [(COSMagicCodeScanner *)self writeSampleBuffer:a4 ofType:AVMediaTypeVideo];
      }
      v49 = pbb_setupflow_log();
      double v50 = (float)(v47 - lastWmProgress);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        double v51 = (Current - self->_lastFrameTime) * 1000.0;
        int pixelBufferOut = 134219008;
        CFAbsoluteTime v52 = Current - self->_lastWmTime;
        double pixelBufferOut_4 = v47 * 100.0;
        __int16 v84 = 2048;
        double v85 = v50 * 100.0;
        __int16 v86 = 1024;
        int v87 = v38;
        __int16 v88 = 2048;
        double v89 = v51;
        __int16 v90 = 2048;
        double v91 = v52 * 1000.0;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Progress: %.2f%%  delta: %5.2f%%;  level: %d; frame %.2fms; wm %.2fms",
          (uint8_t *)&pixelBufferOut,
          0x30u);
      }

      self->_float lastWmProgress = v47;
      self->_lastWmTime = Current;
      if (v50 < 0.13) {
        goto LABEL_80;
      }
      double v56 = Current + 0.09;
    }
    else
    {
      unsigned int missWmCount = self->_missWmCount;
      self->_unsigned int missWmCount = missWmCount + 1;
      if (missWmCount + 1 < 0x1F)
      {
LABEL_80:
        if ((self->_showLensHUD || self->_lensOnlyMode) && HCImagePerspectiveReader::IsPayloadReady(self->_reader))
        {
          self->_isScanningForCode = 0;
          id v57 = &_dispatch_main_q;
          v77[0] = _NSConcreteStackBlock;
          v77[1] = 3221225472;
          v77[2] = sub_10006EFBC;
          v77[3] = &unk_100244E00;
          v77[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, v77);

          dispatch_time_t v58 = dispatch_time(0, 6000000000);
          v76[0] = _NSConcreteStackBlock;
          v76[1] = 3221225472;
          v76[2] = sub_10006EFD4;
          v76[3] = &unk_100244E00;
          v76[4] = self;
          dispatch_after(v58, (dispatch_queue_t)&_dispatch_main_q, v76);
        }
        char v59 = MGGetBoolAnswer();
        if (!self->_lensOnlyMode && HCImagePerspectiveReader::IsPayloadReady(self->_reader))
        {
          v74[0] = _NSConcreteStackBlock;
          v74[1] = 3221225472;
          v74[2] = sub_10006F020;
          v74[3] = &unk_100244E50;
          v74[4] = self;
          *(CFAbsoluteTime *)&v74[5] = Current;
          char v75 = v59;
          v60 = objc_retainBlock(v74);
          self->_isClosingCapture = 1;
          if (self->_assetWriter
            && self->_shouldCaptureMagicCodeScan
            && self->_hasBegunCapture
            && +[COSMLCaptureDisclosureController disclosureEffectivelyAccepted])
          {
            [(COSMagicCodeScanner *)self closeWriter];
            v61 = pbb_setupflow_log();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(pixelBufferOut) = 0;
              _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Finish Writing With Completion", (uint8_t *)&pixelBufferOut, 2u);
            }

            assetWriter = self->_assetWriter;
            v72[0] = _NSConcreteStackBlock;
            v72[1] = 3221225472;
            v72[2] = sub_10006F4F4;
            v72[3] = &unk_100244E78;
            v73 = v60;
            [(AVAssetWriter *)assetWriter finishWritingWithCompletionHandler:v72];
          }
          else
          {
            ((void (*)(void *))v60[2])(v60);
          }

          float DecoderProgress = 100.0;
        }
        id v64 = &_dispatch_main_q;
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 3221225472;
        v69[2] = sub_10006F5D8;
        v69[3] = &unk_100244EA0;
        char v71 = v59;
        v69[4] = self;
        float v70 = DecoderProgress;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v69);

        goto LABEL_101;
      }
      double v54 = CFAbsoluteTimeGetCurrent();
      double v55 = (double)(missWmCount - 29) * 0.033;
      if (v55 > 0.1) {
        double v55 = 0.1;
      }
      double v56 = v55 + v54;
    }
    self->_nextFrameTime = v56;
    goto LABEL_80;
  }
LABEL_102:
}

- (void)writeSampleBuffer:(opaqueCMSampleBuffer *)a3 ofType:(id)a4
{
  double v6 = (NSString *)a4;
  if (self->_shouldCaptureMagicCodeScan && self->_hasBegunCapture)
  {
    memset(&v15, 0, sizeof(v15));
    CMSampleBufferGetPresentationTimeStamp(&v15, a3);
    if ([(AVAssetWriter *)self->_assetWriter status] == AVAssetWriterStatusUnknown)
    {
      if ([(AVAssetWriter *)self->_assetWriter startWriting])
      {
        id v7 = pbb_setupflow_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "startWriting", buf, 2u);
        }

        assetWriter = self->_assetWriter;
        CMTime v14 = v15;
        [(AVAssetWriter *)assetWriter startSessionAtSourceTime:&v14];
      }
      else
      {
        int v9 = pbb_setupflow_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_100172604();
        }
      }
    }
    if ((id)[(AVAssetWriter *)self->_assetWriter status] != (id)1)
    {
      int v10 = pbb_setupflow_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v11 = self->_assetWriter;
        id v12 = +[NSNumber numberWithInteger:[(AVAssetWriter *)v11 status]];
        BOOL v13 = [(AVAssetWriter *)self->_assetWriter error];
        *(_DWORD *)buf = 138412802;
        __int16 v17 = v11;
        __int16 v18 = 2112;
        int v19 = v12;
        __int16 v20 = 2112;
        id v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Writer %@ Status was %@ Error %@", buf, 0x20u);
      }
      goto LABEL_19;
    }
    if (AVMediaTypeVideo == v6
      && [(AVAssetWriterInput *)self->_assetWriterInput isReadyForMoreMediaData]
      && ![(AVAssetWriterInput *)self->_assetWriterInput appendSampleBuffer:a3])
    {
      int v10 = pbb_setupflow_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001725D0();
      }
LABEL_19:
    }
  }
}

- (void)closeWriter
{
  v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    double v5 = "-[COSMagicCodeScanner closeWriter]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(AVAssetWriterInput *)self->_assetWriterInput markAsFinished];
}

- (void)_changeCameraConfiguration
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(COSMagicCodeScanner *)self setCameraAttributes];

  +[CATransaction commit];
}

- (void)setCameraAttributes
{
  v2 = self->_device;
  id v4 = 0;
  [(AVCaptureDevice *)v2 lockForConfiguration:&v4];
  id v3 = v4;
  if ([(AVCaptureDevice *)v2 isFocusModeSupported:2])
  {
    -[AVCaptureDevice setFocusPointOfInterest:](v2, "setFocusPointOfInterest:", 0.500999987, 0.500999987);
    [(AVCaptureDevice *)v2 setFocusMode:2];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(AVCaptureDevice *)v2 isAutoFocusRangeRestrictionSupported])
  {
    [(AVCaptureDevice *)v2 setAutoFocusRangeRestriction:1];
  }
  if ([(AVCaptureDevice *)v2 isWhiteBalanceModeSupported:2]) {
    [(AVCaptureDevice *)v2 setWhiteBalanceMode:2];
  }
  if ([(AVCaptureDevice *)v2 isExposureModeSupported:2])
  {
    -[AVCaptureDevice setExposurePointOfInterest:](v2, "setExposurePointOfInterest:", 0.500999987, 0.500999987);
    [(AVCaptureDevice *)v2 setExposureMode:2];
  }
  [(AVCaptureDevice *)v2 unlockForConfiguration];
}

- (void)startRunning
{
  if (!self->_registeredForCaptureRunTimeErrorNotification)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"handleRuntimeError:" name:AVCaptureSessionRuntimeErrorNotification object:0];

    self->_registeredForCaptureRunTimeErrorNotification = 1;
  }
  id v4 = pbb_setupflow_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    CGFloat v16 = "-[COSMagicCodeScanner startRunning]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v15, 0xCu);
  }

  if (self->_canUseCamera)
  {
    if (!self->_previewLayer)
    {
      double v5 = pbb_setupflow_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Magic code scanner: adding preview layer", (uint8_t *)&v15, 2u);
      }

      double v6 = +[AVCaptureVideoPreviewLayer layerWithSession:self->_session];
      previewLayer = self->_previewLayer;
      self->_previewLayer = v6;

      id v8 = [(COSMagicCodeScanner *)self layer];
      [v8 insertSublayer:self->_previewLayer atIndex:0];

      int v9 = self->_previewLayer;
      int v10 = [(COSMagicCodeScanner *)self layer];
      [v10 bounds];
      double v12 = v11;
      BOOL v13 = [(COSMagicCodeScanner *)self layer];
      [v13 bounds];
      -[AVCaptureVideoPreviewLayer setFrame:](v9, "setFrame:", 0.0, 0.0, v12);

      [(AVCaptureVideoPreviewLayer *)self->_previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    }
    [(COSMagicCodeScanner *)self _changeCameraConfiguration];
    [(AVCaptureSession *)self->_session startRunning];
    self->_isScanningForCode = 1;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  self->_lastPayloadTime = Current;
  self->_lastFrameTime = Current;
  self->_lastWmTime = Current;
  self->_nextFrameTime = 0.0;
  self->_float lastWmProgress = 0.0;
  self->_unsigned int missWmCount = 0;
}

- (void)stopRunning
{
  id v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stop Scanning", v5, 2u);
  }

  if (self->_canUseCamera)
  {
    [(AVCaptureSession *)self->_session stopRunning];
    self->_isScanningForCode = 0;
  }
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:AVCaptureSessionRuntimeErrorNotification object:0];

  self->_registeredForCaptureRunTimeErrorNotification = 0;
}

- (void)handleRuntimeError:(id)a3
{
  id v4 = a3;
  double v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    double v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [v4 userInfo];
      sub_10017266C(v7, buf, v6);
    }
  }
  if (self->_isScanningForCode)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100070160;
    block[3] = &unk_100244E00;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    id v8 = pbb_setupflow_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100172638();
    }
  }
}

- (COSMagicCodeScannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSMagicCodeScannerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)canUseCamera
{
  return self->_canUseCamera;
}

- (BOOL)isScanningForCode
{
  return self->_isScanningForCode;
}

- (void)setIsScanningForCode:(BOOL)a3
{
  self->_isScanningForCode = a3;
}

- (COSWristAttributeVisualDetector)detector
{
  return self->_detector;
}

- (UITapGestureRecognizer)debugUIRecognizer
{
  return self->_debugUIRecognizer;
}

- (void)setDebugUIRecognizer:(id)a3
{
}

- (CALayer)progressBGLayer
{
  return self->_progressBGLayer;
}

- (void)setProgressBGLayer:(id)a3
{
}

- (CALayer)progressLayer
{
  return self->_progressLayer;
}

- (void)setProgressLayer:(id)a3
{
}

- (UILabel)progessLabel
{
  return self->_progessLabel;
}

- (void)setProgessLabel:(id)a3
{
}

- (COSWristDetectionHUD)mlHUD
{
  return self->_mlHUD;
}

- (void)setMlHUD:(id)a3
{
}

- (BOOL)showLensHUD
{
  return self->_showLensHUD;
}

- (void)setShowLensHUD:(BOOL)a3
{
  self->_showLensHUD = a3;
}

- (BOOL)lensOnlyMode
{
  return self->_lensOnlyMode;
}

- (void)setLensOnlyMode:(BOOL)a3
{
  self->_lensOnlyMode = a3;
}

- (BOOL)lensCollectorMode
{
  return self->_lensCollectorMode;
}

- (void)setLensCollectorMode:(BOOL)a3
{
  self->_lensCollectorMode = a3;
}

- (BOOL)registeredForCaptureRunTimeErrorNotification
{
  return self->_registeredForCaptureRunTimeErrorNotification;
}

- (void)setRegisteredForCaptureRunTimeErrorNotification:(BOOL)a3
{
  self->_registeredForCaptureRunTimeErrorNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mlHUD, 0);
  objc_storeStrong((id *)&self->_progessLabel, 0);
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_storeStrong((id *)&self->_progressBGLayer, 0);
  objc_storeStrong((id *)&self->_debugUIRecognizer, 0);
  objc_storeStrong((id *)&self->_detector, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assetWriterInput, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end