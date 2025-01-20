@interface VKAVCaptureFrameProvider
- (BOOL)_respondsToDidCapturePhoto;
- (BOOL)_respondsToDidZoom;
- (BOOL)_respondsToIsRunning;
- (BOOL)hasTorch;
- (BOOL)isRunning;
- (BOOL)isTorchOn;
- (CGPoint)interestPoint;
- (VKAVCaptureFrameProvider)initWithConfiguration:(id)a3;
- (double)_luminosityForSampleBuffer:(uint64_t)a1;
- (double)maxZoomFactor;
- (double)minZoomFactor;
- (double)zoomFactor;
- (id)_ciImage;
- (id)previewView;
- (uint64_t)_currentFrame;
- (uint64_t)_stabilityFromSampleBuffer:(uint64_t)a1;
- (void)_avCapturePreparationComplete;
- (void)_avCapturePreparationComplete2;
- (void)_didChangeDimensions;
- (void)_setCurrentFrame:(uint64_t)a1;
- (void)_setRespondsToDidCapturePhoto:(void *)a1;
- (void)_setRespondsToDidZoom:(void *)a1;
- (void)_setRespondsToIsRunning:(void *)a1;
- (void)avCapture:(id)a3 cameraAccessGranted:(BOOL)a4;
- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)capturePhoto;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepare;
- (void)previewView:(id)a3 didMoveToWindow:(id)a4;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setInterestPoint:(CGPoint)a3;
- (void)setRegionOfInterest:(CGRect)a3;
- (void)setTorchOn:(BOOL)a3;
- (void)setZoomFactor:(double)a3;
- (void)snapshotWithCompletion:(id)a3;
- (void)startRunning;
- (void)stopRunning;
@end

@implementation VKAVCaptureFrameProvider

- (VKAVCaptureFrameProvider)initWithConfiguration:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)VKAVCaptureFrameProvider;
  v3 = [(VKFrameProvider *)&v19 initWithConfiguration:a3];
  if (v3)
  {
    v4 = objc_alloc_init(VKAVCapturePreviewView);
    v5 = (void *)*((void *)v3 + 15);
    *((void *)v3 + 15) = v4;

    -[VKAVCapturePreviewView setDelegate:](*((id **)v3 + 15), v3);
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.visionkit.samplebufferqueue", v7);
    v9 = (void *)*((void *)v3 + 18);
    *((void *)v3 + 18) = v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.visionkit.snapshotQueue", v7);
    v11 = (void *)*((void *)v3 + 19);
    *((void *)v3 + 19) = v10;

    v12 = objc_alloc_init(VKAVCapture);
    v13 = (void *)*((void *)v3 + 16);
    *((void *)v3 + 16) = v12;

    -[VKAVCapture setDelegate:](*((void *)v3 + 16), (uint64_t)v3);
    *(_OWORD *)(v3 + 168) = VKMRectUnit;
    *(_OWORD *)(v3 + 184) = *(_OWORD *)&qword_1DB33EB28;
    uint64_t v14 = MEMORY[0x1E4F1DAB8];
    long long v15 = *MEMORY[0x1E4F1DAB8];
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)(v3 + 200) = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)(v3 + 216) = v16;
    long long v17 = *(_OWORD *)(v14 + 32);
    *(_OWORD *)(v3 + 232) = v17;
    *(_OWORD *)(v3 + 248) = v15;
    *(_OWORD *)(v3 + 264) = v16;
    *(_OWORD *)(v3 + 280) = v17;
    *(_OWORD *)(v3 + 312) = v16;
    *(_OWORD *)(v3 + 328) = v17;
    *(_OWORD *)(v3 + 296) = v15;
  }
  return (VKAVCaptureFrameProvider *)v3;
}

- (void)dealloc
{
  v3 = -[VKAVCapture device]((uint64_t)self->_avCapture);
  [v3 removeObserver:self forKeyPath:@"videoZoomFactor"];

  v4 = -[VKAVCapture device]((uint64_t)self->_avCapture);
  [v4 removeObserver:self forKeyPath:@"torchActive"];

  v5 = -[VKAVCapture session]((uint64_t)self->_avCapture);
  [v5 removeObserver:self forKeyPath:@"running"];

  [(AVCaptureDeviceRotationCoordinator *)self->_avDeviceRotationCoordinator removeObserver:self forKeyPath:@"videoRotationAngleForHorizonLevelPreview"];
  v6.receiver = self;
  v6.super_class = (Class)VKAVCaptureFrameProvider;
  [(VKAVCaptureFrameProvider *)&v6 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)VKAVCaptureFrameProviderContext == a6)
  {
    if ([v10 isEqualToString:@"videoZoomFactor"])
    {
      if (self)
      {
        [(VKFrameProvider *)self lock];
        BOOL respondsToDidZoom = self->_respondsToDidZoom;
        [(VKFrameProvider *)self unlock];
        if (respondsToDidZoom)
        {
          objc_initWeak((id *)location, self);
          uint64_t v14 = [(VKFrameProvider *)self delegateQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __75__VKAVCaptureFrameProvider_observeValueForKeyPath_ofObject_change_context___block_invoke;
          block[3] = &unk_1E6BF0D90;
          objc_copyWeak(&v32, (id *)location);
          dispatch_async(v14, block);

          objc_destroyWeak(&v32);
          objc_destroyWeak((id *)location);
        }
      }
    }
    else if ([v10 isEqualToString:@"torchActive"])
    {
      if ([(VKAVCaptureFrameProvider *)self isTorchOn]
        && (-[VKAVCapture isTorchOn]((uint64_t)self->_avCapture) & 1) == 0)
      {
        -[VKAVCapture setTorchOn:]((uint64_t)self->_avCapture, 1);
      }
    }
    else if ([v10 isEqualToString:@"running"])
    {
      if (self)
      {
        [(VKFrameProvider *)self lock];
        BOOL respondsToIsRunning = self->_respondsToIsRunning;
        [(VKFrameProvider *)self unlock];
        if (respondsToIsRunning)
        {
          long long v16 = -[VKAVCapture session]((uint64_t)self->_avCapture);
          char v17 = [v16 isRunning];

          objc_initWeak((id *)location, self);
          v18 = [(VKFrameProvider *)self delegateQueue];
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __75__VKAVCaptureFrameProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
          v28[3] = &unk_1E6BF1BE8;
          objc_copyWeak(&v29, (id *)location);
          char v30 = v17;
          dispatch_async(v18, v28);

          objc_destroyWeak(&v29);
          objc_destroyWeak((id *)location);
        }
      }
    }
    else if ([v10 isEqualToString:@"videoRotationAngleForHorizonLevelPreview"])
    {
      BOOL v19 = [(VKFrameProvider *)self isProcessing];
      [(VKFrameProvider *)self stopProcessing];
      [(AVCaptureDeviceRotationCoordinator *)self->_avDeviceRotationCoordinator videoRotationAngleForHorizonLevelPreview];
      double v21 = v20;
      -[VKAVCapturePreviewView setVideoRotationAngle:](self->_avCapturePreviewView, v20);
      objc_initWeak(&from, self);
      avCapture = self->_avCapture;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __75__VKAVCaptureFrameProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
      v25[3] = &unk_1E6BF0D90;
      objc_copyWeak(&v26, &from);
      -[VKAVCapture setVideoRotationAngle:completion:]((uint64_t)avCapture, v25, v21);
      v23 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 138412546;
        *(void *)&location[4] = v10;
        __int16 v34 = 2048;
        double v35 = v21;
        _os_log_impl(&dword_1DB266000, v23, OS_LOG_TYPE_DEFAULT, "%@ changed to %f", location, 0x16u);
      }

      -[VKAVCaptureFrameProvider _didChangeDimensions]((uint64_t)self);
      if (v19) {
        [(VKFrameProvider *)self startProcessing];
      }
      objc_destroyWeak(&v26);
      objc_destroyWeak(&from);
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)VKAVCaptureFrameProvider;
    [(VKAVCaptureFrameProvider *)&v24 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (BOOL)_respondsToDidZoom
{
  if (!a1) {
    return 0;
  }
  [a1 lock];
  BOOL v2 = a1[345] != 0;
  [a1 unlock];
  return v2;
}

void __75__VKAVCaptureFrameProvider_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    BOOL v2 = [WeakRetained delegate];
    [v2 avCaptureFrameProviderDidZoom:v3];

    id WeakRetained = v3;
  }
}

- (BOOL)_respondsToIsRunning
{
  if (!a1) {
    return 0;
  }
  [a1 lock];
  BOOL v2 = a1[346] != 0;
  [a1 unlock];
  return v2;
}

void __75__VKAVCaptureFrameProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained delegate];
    [v3 avCaptureFrameProvider:v4 didChangeIsRunning:*(unsigned __int8 *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

void __75__VKAVCaptureFrameProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[VKAVCaptureFrameProvider _didChangeDimensions]((uint64_t)WeakRetained);
}

- (void)_didChangeDimensions
{
  if (a1)
  {
    BOOL v2 = -[VKAVCapture videoSettings](*(id **)(a1 + 128));
    id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F24E10]];
    [v3 doubleValue];
    sdouble x = v4;

    v5 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F24D08]];
    [v5 doubleValue];
    double v7 = v6;

    dispatch_queue_t v8 = [(id)a1 previewView];
    [v8 bounds];
    double v44 = v9;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    [(id)a1 regionOfInterest];
    double x = v65.origin.x;
    double y = v65.origin.y;
    double width = v65.size.width;
    double height = v65.size.height;
    IsEmptdouble y = CGRectIsEmpty(v65);
    if (IsEmpty) {
      double v21 = v13;
    }
    else {
      double v21 = width;
    }
    if (IsEmpty) {
      double v22 = v15;
    }
    else {
      double v22 = height;
    }
    CGFloat v42 = v22;
    CGFloat v43 = v21;
    if (IsEmpty) {
      CGFloat v23 = v11;
    }
    else {
      CGFloat v23 = y;
    }
    if (IsEmpty) {
      CGFloat v24 = v44;
    }
    else {
      CGFloat v24 = x;
    }
    if (VKMSizeGetArea(sx, v7) != 0.0 && VKMSizeGetArea(v13, v15) != 0.0)
    {
      memset(&v64, 0, sizeof(v64));
      sdouble y = v7;
      VKMAffineTransformAspectFill(&v64, sx, v7, v13, v15);
      CGAffineTransform v62 = v64;
      memset(&v63, 0, sizeof(v63));
      CGAffineTransformInvert(&v63, &v62);
      memset(&v62, 0, sizeof(v62));
      VKMAffineTransformNormalize(&t2, sx, v7);
      CGAffineTransform t1 = v63;
      CGAffineTransformConcat(&v62, &t1, &t2);
      memset(&t1, 0, sizeof(t1));
      VKMAffineTransformVerticalFlip((uint64_t)&v59, 0.0, 0.0, 1.0, 1.0);
      CGAffineTransform v58 = v62;
      CGAffineTransformConcat(&t1, &v58, &v59);
      CGAffineTransform v58 = t1;
      v66.origin.double x = v24;
      v66.origin.double y = v23;
      v66.size.double height = v42;
      v66.size.double width = v43;
      CGRect v67 = CGRectApplyAffineTransform(v66, &v58);
      double v25 = VKMClampRectToRect(v67.origin.x, v67.origin.y, v67.size.width, v67.size.height, 0.0, 0.0, 1.0, 1.0);
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      CGFloat v31 = v30;
      memset(&v58, 0, sizeof(v58));
      VKMAffineTransformVerticalFlip((uint64_t)&v58, 0.0, 0.0, 1.0, 1.0);
      CGAffineTransform v57 = v58;
      v68.origin.double x = v25;
      double v32 = v25;
      v68.origin.double y = v27;
      CGFloat v33 = v27;
      v68.size.double width = v29;
      v68.size.double height = v31;
      CGRect v69 = CGRectApplyAffineTransform(v68, &v57);
      CGFloat v34 = v69.origin.x;
      CGFloat v35 = v69.origin.y;
      CGFloat v36 = v69.size.width;
      CGFloat v37 = v69.size.height;
      VKMAffineTransformScaleBySize(&v56, sx, sy);
      v70.origin.double x = v34;
      v70.origin.double y = v35;
      v70.size.double width = v36;
      v70.size.double height = v37;
      CGRect v71 = CGRectApplyAffineTransform(v70, &v56);
      CGFloat v38 = v71.origin.x;
      CGFloat v39 = v71.origin.y;
      memset(&v57, 0, sizeof(v57));
      VKMAffineTransformScaleBySize(&v55, v71.size.width, v71.size.height);
      CGAffineTransform v54 = v58;
      CGAffineTransformConcat(&v57, &v54, &v55);
      memset(&v54, 0, sizeof(v54));
      CGAffineTransformMakeTranslation(&v53, v38, v39);
      CGAffineTransform v52 = v57;
      CGAffineTransformConcat(&v54, &v52, &v53);
      memset(&v52, 0, sizeof(v52));
      CGAffineTransform v50 = v63;
      CGAffineTransformInvert(&v51, &v50);
      CGAffineTransform v50 = v54;
      CGAffineTransformConcat(&v52, &v50, &v51);
      v40 = *(NSObject **)(a1 + 144);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__VKAVCaptureFrameProvider__didChangeDimensions__block_invoke;
      block[3] = &unk_1E6BF1C60;
      void block[4] = a1;
      *(double *)&block[5] = v32;
      *(CGFloat *)&block[6] = v33;
      *(CGFloat *)&block[7] = v29;
      *(CGFloat *)&block[8] = v31;
      CGAffineTransform v47 = v57;
      CGAffineTransform v48 = v52;
      CGAffineTransform v49 = v64;
      dispatch_sync(v40, block);
      [(id)a1 resetAllProcessors];
    }
  }
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VKAVCaptureFrameProvider;
  [(VKFrameProvider *)&v10 setDelegate:v6 queue:a4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__VKAVCaptureFrameProvider_setDelegate_queue___block_invoke;
  v8[3] = &unk_1E6BF12B8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  vk_performWhileLocked(self, v8);
}

uint64_t __46__VKAVCaptureFrameProvider_setDelegate_queue___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 344) = objc_opt_respondsToSelector() & 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 345) = objc_opt_respondsToSelector() & 1;
  uint64_t result = objc_opt_respondsToSelector();
  *(unsigned char *)(*(void *)(a1 + 32) + 346) = result & 1;
  return result;
}

- (void)prepare
{
  objc_initWeak(&location, self);
  avCapture = self->_avCapture;
  double v4 = [(VKFrameProvider *)self configuration];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__VKAVCaptureFrameProvider_prepare__block_invoke;
  v5[3] = &unk_1E6BF0CF0;
  objc_copyWeak(&v6, &location);
  -[VKAVCapture prepareWithConfiguration:completion:](avCapture, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __35__VKAVCaptureFrameProvider_prepare__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (a2)
  {
    -[VKAVCaptureFrameProvider _avCapturePreparationComplete]((uint64_t)WeakRetained);
  }
  else if (+[VKAVCapture authorizationStatus]() == 2)
  {
    double v4 = [v7 delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [v7 delegate];
      [v6 avCaptureFrameProvider:v7 cameraAccessGranted:0];
    }
  }
}

- (void)_avCapturePreparationComplete
{
  if (a1)
  {
    BOOL v2 = -[VKAVCapture device](*(void *)(a1 + 128));
    [v2 addObserver:a1 forKeyPath:@"videoZoomFactor" options:1 context:VKAVCaptureFrameProviderContext];

    id v3 = -[VKAVCapture device](*(void *)(a1 + 128));
    [v3 addObserver:a1 forKeyPath:@"torchActive" options:1 context:VKAVCaptureFrameProviderContext];

    double v4 = -[VKAVCapture session](*(void *)(a1 + 128));
    [v4 addObserver:a1 forKeyPath:@"running" options:1 context:VKAVCaptureFrameProviderContext];

    uint64_t v5 = *MEMORY[0x1E4F15AF8];
    id v6 = -[VKAVCapturePreviewView previewLayer](*(id *)(a1 + 120));
    [v6 setVideoGravity:v5];

    id v7 = -[VKAVCapture session](*(void *)(a1 + 128));
    dispatch_queue_t v8 = -[VKAVCapturePreviewView previewLayer](*(id *)(a1 + 120));
    [v8 setSession:v7];

    id v9 = -[VKAVCapture videoDataOutput](*(void *)(a1 + 128));
    [v9 setSampleBufferDelegate:a1 queue:*(void *)(a1 + 144)];

    id v10 = objc_alloc(MEMORY[0x1E4F16458]);
    double v11 = -[VKAVCapture device](*(void *)(a1 + 128));
    double v12 = -[VKAVCapturePreviewView previewLayer](*(id *)(a1 + 120));
    uint64_t v13 = [v10 initWithDevice:v11 previewLayer:v12];
    double v14 = *(void **)(a1 + 136);
    *(void *)(a1 + 136) = v13;

    [*(id *)(a1 + 136) videoRotationAngleForHorizonLevelPreview];
    double v16 = v15;
    -[VKAVCapturePreviewView setVideoRotationAngle:](*(void **)(a1 + 120), v15);
    objc_initWeak(&location, (id)a1);
    uint64_t v17 = *(void *)(a1 + 128);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__VKAVCaptureFrameProvider__avCapturePreparationComplete__block_invoke;
    v18[3] = &unk_1E6BF0D90;
    objc_copyWeak(&v19, &location);
    -[VKAVCapture setVideoRotationAngle:completion:](v17, v18, v16);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (id)previewView
{
  return self->_avCapturePreviewView;
}

- (BOOL)isRunning
{
  return -[VKAVCapture isRunning]((uint64_t)self->_avCapture);
}

- (void)startRunning
{
  v5.receiver = self;
  v5.super_class = (Class)VKAVCaptureFrameProvider;
  [(VKFrameProvider *)&v5 startRunning];
  id v3 = -[VKAVCapture session]((uint64_t)self->_avCapture);

  if (v3)
  {
    -[VKAVCapture startRunning](&self->_avCapture->super.isa);
    BOOL v4 = 0;
  }
  else
  {
    [(VKAVCaptureFrameProvider *)self prepare];
    BOOL v4 = 1;
  }
  self->_startWhenReaddouble y = v4;
}

- (void)stopRunning
{
  -[VKAVCapture stopRunning](&self->_avCapture->super.isa);
  v3.receiver = self;
  v3.super_class = (Class)VKAVCaptureFrameProvider;
  [(VKFrameProvider *)&v3 stopRunning];
}

- (CGPoint)interestPoint
{
  double v3 = -[VKAVCapture interestPoint]((uint64_t)self->_avCapture);
  double v5 = v4;
  id v6 = -[VKAVCapturePreviewView previewLayer](self->_avCapturePreviewView);
  objc_msgSend(v6, "pointForCaptureDevicePointOfInterest:", v3, v5);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (void)setInterestPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = -[VKAVCapturePreviewView previewLayer](self->_avCapturePreviewView);
  objc_msgSend(v6, "captureDevicePointOfInterestForPoint:", x, y);
  double v8 = v7;
  double v10 = v9;

  avCapture = self->_avCapture;
  [(VKAVCapture *)avCapture setInterestPoint:v10];
}

- (BOOL)hasTorch
{
  return -[VKAVCapture hasTorch]((uint64_t)self->_avCapture);
}

- (void)setTorchOn:(BOOL)a3
{
  self->_torchOn = a3;
  -[VKAVCapture setTorchOn:]((uint64_t)self->_avCapture, a3);
}

- (void)setRegionOfInterest:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKAVCaptureFrameProvider;
  -[VKFrameProvider setRegionOfInterest:](&v4, sel_setRegionOfInterest_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[VKAVCaptureFrameProvider _didChangeDimensions]((uint64_t)self);
}

- (void)capturePhoto
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = -[VKAVCapture photoOutput]((uint64_t)self->_avCapture);
    int v8 = 138412546;
    double v9 = v4;
    __int16 v10 = 2112;
    double v11 = self;
    _os_log_impl(&dword_1DB266000, v3, OS_LOG_TYPE_DEFAULT, "-[VKAVCaptureFrameProvider capturePhoto] with photoOutput:%@ self:%@", (uint8_t *)&v8, 0x16u);
  }
  double v5 = [MEMORY[0x1E4F16488] photoSettings];
  id v6 = -[VKAVCapture photoOutput]((uint64_t)self->_avCapture);
  objc_msgSend(v5, "setMaxPhotoDimensions:", objc_msgSend(v6, "maxPhotoDimensions"));

  [v5 setEmbedsDepthDataInPhoto:0];
  [v5 setDepthDataDeliveryEnabled:0];
  double v7 = -[VKAVCapture photoOutput]((uint64_t)self->_avCapture);
  [v7 capturePhotoWithSettings:v5 delegate:self];
}

- (void)snapshotWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (self && self->__currentFrame)
  {
    id v6 = [(VKAVCaptureFrameProvider *)self previewView];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    [(VKFrameProvider *)self regionOfInterest];
    double x = v41.origin.x;
    double y = v41.origin.y;
    double width = v41.size.width;
    double height = v41.size.height;
    if (CGRectIsEmpty(v41))
    {
      double x = v8;
      double y = v10;
      double width = v12;
      double height = v14;
    }
    id v19 = [(VKFrame *)self->__currentFrame info];
    double v20 = v19;
    if (v19) {
      [v19 imageToLayerTransform];
    }
    else {
      memset(&v39, 0, sizeof(v39));
    }
    CGAffineTransformInvert(&v40, &v39);
    v42.origin.double x = x;
    v42.origin.double y = y;
    v42.size.double width = width;
    v42.size.double height = height;
    CGRect v43 = CGRectApplyAffineTransform(v42, &v40);
    CGFloat v21 = v43.origin.x;
    CGFloat v22 = v43.origin.y;
    CGFloat v23 = v43.size.width;
    CGFloat v24 = v43.size.height;

    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy__5;
    v37[4] = __Block_byref_object_dispose__5;
    -[VKAVCaptureFrameProvider _ciImage]((uint64_t)self);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    snapshotQueue = self->_snapshotQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__VKAVCaptureFrameProvider_snapshotWithCompletion___block_invoke;
    block[3] = &unk_1E6BF1C10;
    CGFloat v29 = v21;
    CGFloat v30 = v22;
    CGFloat v31 = v23;
    CGFloat v32 = v24;
    double v33 = v8;
    double v34 = v10;
    double v35 = v12;
    double v36 = v14;
    double v28 = v37;
    void block[4] = self;
    id v27 = v5;
    dispatch_async(snapshotQueue, block);

    _Block_object_dispose(v37, 8);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (uint64_t)_currentFrame
{
  if (result) {
    return *(void *)(result + 392);
  }
  return result;
}

- (id)_ciImage
{
  if (a1 && *(void *)(a1 + 392))
  {
    ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)[*(id *)(a1 + 392) sampleBuffer]);
    CVPixelBufferLockBaseAddress(ImageBuffer, 0);
    BOOL v2 = [MEMORY[0x1E4F1E050] imageWithCVImageBuffer:ImageBuffer];
    CVPixelBufferUnlockBaseAddress(ImageBuffer, 0);
  }
  else
  {
    BOOL v2 = 0;
  }
  return v2;
}

void __51__VKAVCaptureFrameProvider_snapshotWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "imageByCroppingToRect:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  double Width = CGRectGetWidth(*(CGRect *)(a1 + 56));
  double v6 = CGRectGetWidth(*(CGRect *)(a1 + 88));
  double v7 = *(void **)(*(void *)(a1 + 32) + 352);
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1E018] context];
    uint64_t v9 = *(void *)(a1 + 32);
    double v10 = *(void **)(v9 + 352);
    *(void *)(v9 + 352) = v8;

    double v7 = *(void **)(*(void *)(a1 + 32) + 352);
  }
  double v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  [v11 extent];
  double v12 = (CGImage *)objc_msgSend(v7, "createCGImage:fromRect:", v11);
  double v13 = [MEMORY[0x1E4F42A80] imageWithCGImage:v12 scale:0 orientation:Width / v6];
  CGImageRelease(v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__VKAVCaptureFrameProvider_snapshotWithCompletion___block_invoke_2;
  v16[3] = &unk_1E6BF1330;
  id v14 = *(id *)(a1 + 40);
  id v17 = v13;
  id v18 = v14;
  id v15 = v13;
  vk_performBlockOnMainThread(v16);
}

uint64_t __51__VKAVCaptureFrameProvider_snapshotWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl(&dword_1DB266000, v11, OS_LOG_TYPE_DEFAULT, "AVCapturePhotoCaptureDelegate received callback with photo: %@, error: %@", buf, 0x16u);
  }

  if (!self
    || ([(VKFrameProvider *)self lock],
        BOOL v12 = !self->_respondsToDidCapturePhoto,
        [(VKFrameProvider *)self unlock],
        v12))
  {
    CGFloat v21 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[VKAVCaptureFrameProvider captureOutput:didFinishProcessingPhoto:error:](v21);
    }
  }
  else
  {
    double v13 = [v9 metadata];
    id v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]];
    int v15 = [v14 integerValue];

    uint64_t v16 = vk_orientationFromCGImagePropertyOrientation(v15);
    uint64_t v17 = [v9 CGImageRepresentation];
    id v18 = [MEMORY[0x1E4F42A80] imageWithCGImage:v17 scale:v16 orientation:1.0];
    objc_initWeak((id *)buf, self);
    id v19 = [(VKFrameProvider *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__VKAVCaptureFrameProvider_captureOutput_didFinishProcessingPhoto_error___block_invoke;
    block[3] = &unk_1E6BF1C38;
    objc_copyWeak(&v25, (id *)buf);
    id v23 = v18;
    id v24 = v10;
    id v20 = v18;
    dispatch_async(v19, block);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
}

- (BOOL)_respondsToDidCapturePhoto
{
  if (!a1) {
    return 0;
  }
  [a1 lock];
  BOOL v2 = a1[344] != 0;
  [a1 unlock];
  return v2;
}

void __73__VKAVCaptureFrameProvider_captureOutput_didFinishProcessingPhoto_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl(&dword_1DB266000, v4, OS_LOG_TYPE_DEFAULT, "VKAVCaptureFrameProviderDelegate Invoking didCapturePhoto on delegate.", v5, 2u);
    }

    id v4 = [WeakRetained delegate];
    [v4 avCaptureFrameProvider:WeakRetained didCapturePhoto:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __73__VKAVCaptureFrameProvider_captureOutput_didFinishProcessingPhoto_error___block_invoke_cold_1(v4);
  }
}

- (double)minZoomFactor
{
  [(VKAVCapture *)self->_avCapture minZoomFactor];
  return result;
}

- (double)maxZoomFactor
{
  [(VKAVCapture *)self->_avCapture maxZoomFactor];
  return result;
}

- (double)zoomFactor
{
  [(VKAVCapture *)self->_avCapture zoomFactor];
  return result;
}

- (void)setZoomFactor:(double)a3
{
}

- (void)_setRespondsToDidCapturePhoto:(void *)a1
{
  if (a1)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __58__VKAVCaptureFrameProvider__setRespondsToDidCapturePhoto___block_invoke;
    v2[3] = &unk_1E6BF0CC8;
    v2[4] = a1;
    char v3 = a2;
    vk_performWhileLocked(a1, v2);
  }
}

uint64_t __58__VKAVCaptureFrameProvider__setRespondsToDidCapturePhoto___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 344) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_setRespondsToDidZoom:(void *)a1
{
  if (a1)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __50__VKAVCaptureFrameProvider__setRespondsToDidZoom___block_invoke;
    v2[3] = &unk_1E6BF0CC8;
    v2[4] = a1;
    char v3 = a2;
    vk_performWhileLocked(a1, v2);
  }
}

uint64_t __50__VKAVCaptureFrameProvider__setRespondsToDidZoom___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 345) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_setRespondsToIsRunning:(void *)a1
{
  if (a1)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __52__VKAVCaptureFrameProvider__setRespondsToIsRunning___block_invoke;
    v2[3] = &unk_1E6BF0CC8;
    v2[4] = a1;
    char v3 = a2;
    vk_performWhileLocked(a1, v2);
  }
}

uint64_t __52__VKAVCaptureFrameProvider__setRespondsToIsRunning___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 346) = *(unsigned char *)(result + 40);
  return result;
}

void __57__VKAVCaptureFrameProvider__avCapturePreparationComplete__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    -[VKAVCaptureFrameProvider _didChangeDimensions]((uint64_t)WeakRetained);
    -[VKAVCaptureFrameProvider _avCapturePreparationComplete2]((uint64_t)v2);
    id WeakRetained = v2;
  }
}

- (void)_avCapturePreparationComplete2
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "%@ - AVCapturePreviewView doesn't have a window. Can't start running", (uint8_t *)&v2, 0xCu);
}

- (uint64_t)_stabilityFromSampleBuffer:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = (void *)CMGetAttachment(target, @"SceneStabilityMetric", 0);
  if (!v4) {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "stabilityMetrics != ((void *)0)", "-[VKAVCaptureFrameProvider _stabilityFromSampleBuffer:]", 0, 0, @"Missing stability metric");
  }
  [v4 doubleValue];
  double v6 = v5;
  double valuePtr = v5;
  double v7 = -[VKAVCapture device](*(void *)(a1 + 128));
  id v8 = [v7 activePrimaryConstituentDevice];

  id v9 = [v8 deviceType];
  id v10 = (void *)*MEMORY[0x1E4F15828];

  if (v9 == v10)
  {
    double valuePtr = v6 + (1.0 - v6) * 0.25;
    CFNumberRef v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberDoubleType, &valuePtr);
    CMSetAttachment(target, @"SceneStabilityMetric", v11, 1u);
    CFRelease(v11);
    double v6 = valuePtr;
  }
  uint64_t v12 = 3;
  if (v6 < 0.96) {
    uint64_t v12 = 2;
  }
  if (v6 < 0.6) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v12;
  }

  return v13;
}

- (double)_luminosityForSampleBuffer:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  CFDictionaryRef v2 = CMCopyDictionaryOfAttachments(0, a2, 1u);
  MutableCopdouble y = CFDictionaryCreateMutableCopy(0, 0, v2);
  CFRelease(v2);
  uint64_t v4 = [(__CFDictionary *)MutableCopy objectForKeyedSubscript:@"{Exif}"];
  double v5 = v4;
  if (v4)
  {
    double v6 = [v4 objectForKeyedSubscript:@"FNumber"];
    [v6 doubleValue];
    double v8 = v7;

    id v9 = [v5 objectForKeyedSubscript:@"ExposureTime"];
    [v9 doubleValue];
    double v11 = v10;

    uint64_t v12 = [v5 objectForKeyedSubscript:@"ISOSpeedRatings"];
    uint64_t v13 = [v12 objectAtIndexedSubscript:0];
    [v13 doubleValue];
    double v15 = v14;

    if (v11 * v15 == 0.0) {
      double v16 = 0.0;
    }
    else {
      double v16 = v8 * (v8 * 50.0) / (v11 * v15);
    }
  }
  else
  {
    double v16 = 0.0;
  }

  return v16;
}

__n128 __48__VKAVCaptureFrameProvider__didChangeDimensions__block_invoke(uint64_t a1)
{
  v1 = (_OWORD *)(*(void *)(a1 + 32) + 168);
  long long v2 = *(_OWORD *)(a1 + 56);
  _OWORD *v1 = *(_OWORD *)(a1 + 40);
  v1[1] = v2;
  uint64_t v3 = (_OWORD *)(*(void *)(a1 + 32) + 200);
  long long v4 = *(_OWORD *)(a1 + 104);
  long long v5 = *(_OWORD *)(a1 + 88);
  _OWORD *v3 = *(_OWORD *)(a1 + 72);
  v3[1] = v5;
  v3[2] = v4;
  double v6 = (_OWORD *)(*(void *)(a1 + 32) + 248);
  long long v7 = *(_OWORD *)(a1 + 152);
  long long v8 = *(_OWORD *)(a1 + 136);
  _OWORD *v6 = *(_OWORD *)(a1 + 120);
  v6[1] = v8;
  v6[2] = v7;
  uint64_t v9 = *(void *)(a1 + 32) + 296;
  __n128 result = *(__n128 *)(a1 + 168);
  long long v11 = *(_OWORD *)(a1 + 200);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)(a1 + 184);
  *(_OWORD *)(v9 + 32) = v11;
  *(__n128 *)uint64_t v9 = result;
  return result;
}

- (void)previewView:(id)a3 didMoveToWindow:(id)a4
{
  if (a4)
  {
    if (self->_startWhenReady) {
      [(VKAVCaptureFrameProvider *)self startRunning];
    }
  }
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  FormatDescription = CMSampleBufferGetFormatDescription(a4);
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(FormatDescription);
  int32_t v9 = Dimensions;
  unint64_t v10 = HIDWORD(Dimensions);
  long long v11 = objc_alloc_init(VKFrameInfo);
  -[VKFrameInfo setDimensions:](v11, "setDimensions:", (double)v9, (double)(int)v10);
  -[VKFrameInfo setRegionOfInterest:](v11, "setRegionOfInterest:", self->_visionRegionOfInterest.origin.x, self->_visionRegionOfInterest.origin.y, self->_visionRegionOfInterest.size.width, self->_visionRegionOfInterest.size.height);
  long long v12 = *(_OWORD *)&self->_visionToCroppedImageTransform.c;
  v21[0] = *(_OWORD *)&self->_visionToCroppedImageTransform.a;
  v21[1] = v12;
  v21[2] = *(_OWORD *)&self->_visionToCroppedImageTransform.tx;
  [(VKFrameInfo *)v11 setVisionToCroppedImageTransform:v21];
  long long v13 = *(_OWORD *)&self->_visionToLayerTransform.c;
  v20[0] = *(_OWORD *)&self->_visionToLayerTransform.a;
  v20[1] = v13;
  v20[2] = *(_OWORD *)&self->_visionToLayerTransform.tx;
  [(VKFrameInfo *)v11 setVisionToLayerTransform:v20];
  long long v14 = *(_OWORD *)&self->_imageToLayerTransform.c;
  v19[0] = *(_OWORD *)&self->_imageToLayerTransform.a;
  v19[1] = v14;
  v19[2] = *(_OWORD *)&self->_imageToLayerTransform.tx;
  [(VKFrameInfo *)v11 setImageToLayerTransform:v19];
  -[VKFrameInfo setSceneStability:](v11, "setSceneStability:", -[VKAVCaptureFrameProvider _stabilityFromSampleBuffer:]((uint64_t)self, a4));
  -[VKFrameInfo setLuminosity:](v11, "setLuminosity:", -[VKAVCaptureFrameProvider _luminosityForSampleBuffer:]((uint64_t)self, a4));
  double v15 = objc_alloc_init(VKAVCaptureFrame);
  [(VKAVCaptureFrame *)v15 setSampleBuffer:a4];
  [(VKFrame *)v15 setInfo:v11];
  [(VKFrameProvider *)self sendFrame:v15];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__VKAVCaptureFrameProvider_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke;
  v17[3] = &unk_1E6BF12B8;
  v17[4] = self;
  id v18 = v15;
  double v16 = v15;
  dispatch_async(MEMORY[0x1E4F14428], v17);
}

void __79__VKAVCaptureFrameProvider_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke(uint64_t a1)
{
}

- (void)_setCurrentFrame:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 392), a2);
  }
}

- (void)avCapture:(id)a3 cameraAccessGranted:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = [(VKFrameProvider *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(VKFrameProvider *)self delegate];
    [v8 avCaptureFrameProvider:self cameraAccessGranted:v4];
  }
}

- (BOOL)isTorchOn
{
  return self->_torchOn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentFrame, 0);
  objc_storeStrong((id *)&self->_ciContext, 0);
  objc_storeStrong((id *)&self->_snapshotQueue, 0);
  objc_storeStrong((id *)&self->_sampleBufferQueue, 0);
  objc_storeStrong((id *)&self->_avDeviceRotationCoordinator, 0);
  objc_storeStrong((id *)&self->_avCapture, 0);
  objc_storeStrong((id *)&self->_avCapturePreviewView, 0);
}

- (void)captureOutput:(os_log_t)log didFinishProcessingPhoto:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB266000, log, OS_LOG_TYPE_ERROR, "Unexpected error. VKAVCaptureFrameProviderDelegate doesn't respond to didCapturePhoto", v1, 2u);
}

void __73__VKAVCaptureFrameProvider_captureOutput_didFinishProcessingPhoto_error___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB266000, log, OS_LOG_TYPE_ERROR, "Unexpected error. VKAVCaptureFrameProvider no longer exists.", v1, 2u);
}

@end