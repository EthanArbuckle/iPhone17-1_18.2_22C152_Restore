@interface TVLRGBColorDetector
- (AVCaptureSession)session;
- (BOOL)backlightState;
- (BOOL)ignoreBacklightProximityState;
- (BOOL)proximityState;
- (BOOL)useMotionDetection;
- (CMMotionManager)motionManager;
- (NSMutableArray)brightnessComponents;
- (NSMutableArray)hueComponents;
- (NSMutableArray)saturationComponents;
- (NSOperationQueue)accelerometerQueue;
- (OS_dispatch_queue)sessionBufferQueue;
- (TVLRGBColorDetector)initWithThresholdsForHue:(double)a3 saturation:(double)a4 brightness:(double)a5;
- (TVLRGBColorDetectorDelegate)delegate;
- (double)_pctChange:(double)a3 new:(double)a4 max:(double)a5;
- (double)brightnessErrorMarginPercent;
- (double)brightnessThreshhold;
- (double)hueErrorMarginPercent;
- (double)hueThreshhold;
- (double)maximumMotion;
- (double)pitchMargin;
- (double)saturationErrorMarginPercent;
- (double)saturationThreshhold;
- (double)yawMargin;
- (id)_averageColorForSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (int)backlightNotificationToken;
- (int)proximityNotificationToken;
- (unint64_t)noMotionDuration;
- (unint64_t)rollingAverageForFrames;
- (void)_prepareForDetection;
- (void)_resetRollingAverage;
- (void)_setupCaptureSession;
- (void)_startDetection;
- (void)_stopDetection;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)captureSessionRuntimeErrorDidOccur:(id)a3;
- (void)dealloc;
- (void)endDetection;
- (void)setAccelerometerQueue:(id)a3;
- (void)setBacklightNotificationToken:(int)a3;
- (void)setBacklightState:(BOOL)a3;
- (void)setBrightnessComponents:(id)a3;
- (void)setBrightnessErrorMarginPercent:(double)a3;
- (void)setBrightnessThreshhold:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setHueComponents:(id)a3;
- (void)setHueErrorMarginPercent:(double)a3;
- (void)setHueThreshhold:(double)a3;
- (void)setIgnoreBacklightProximityState:(BOOL)a3;
- (void)setMaximumMotion:(double)a3;
- (void)setMotionManager:(id)a3;
- (void)setNoMotionDuration:(unint64_t)a3;
- (void)setPitchMargin:(double)a3;
- (void)setProximityNotificationToken:(int)a3;
- (void)setProximityState:(BOOL)a3;
- (void)setRollingAverageForFrames:(unint64_t)a3;
- (void)setSaturationComponents:(id)a3;
- (void)setSaturationErrorMarginPercent:(double)a3;
- (void)setSaturationThreshhold:(double)a3;
- (void)setSession:(id)a3;
- (void)setSessionBufferQueue:(id)a3;
- (void)setUseMotionDetection:(BOOL)a3;
- (void)setYawMargin:(double)a3;
- (void)tearDown;
@end

@implementation TVLRGBColorDetector

- (TVLRGBColorDetector)initWithThresholdsForHue:(double)a3 saturation:(double)a4 brightness:(double)a5
{
  v33.receiver = self;
  v33.super_class = (Class)TVLRGBColorDetector;
  v8 = [(TVLRGBColorDetector *)&v33 init];
  v9 = (TVLRGBColorDetector *)v8;
  if (v8)
  {
    *((double *)v8 + 18) = a3;
    *((double *)v8 + 19) = a4;
    *((double *)v8 + 20) = a5;
    v8[8] = 1;
    __asm { FMOV            V0.2D, #5.0 }
    *(_OWORD *)(v8 + 24) = _Q0;
    *((void *)v8 + 5) = 0x4034000000000000;
    *((void *)v8 + 6) = 10;
    *(_OWORD *)(v8 + 56) = _Q0;
    *((void *)v8 + 9) = 0x3FB47AE147AE147BLL;
    v8[11] = 1;
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    hueComponents = v9->_hueComponents;
    v9->_hueComponents = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    saturationComponents = v9->_saturationComponents;
    v9->_saturationComponents = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    brightnessComponents = v9->_brightnessComponents;
    v9->_brightnessComponents = v19;

    v21 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    accelerometerQueue = v9->_accelerometerQueue;
    v9->_accelerometerQueue = v21;

    [(NSOperationQueue *)v9->_accelerometerQueue setQualityOfService:33];
    v23 = (CMMotionManager *)objc_alloc_init(MEMORY[0x263F01788]);
    motionManager = v9->_motionManager;
    v9->_motionManager = v23;

    [(TVLRGBColorDetector *)v9 _setupCaptureSession];
    objc_initWeak(&location, v9);
    v25 = MEMORY[0x263EF83A0];
    id v26 = MEMORY[0x263EF83A0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __70__TVLRGBColorDetector_initWithThresholdsForHue_saturation_brightness___block_invoke;
    handler[3] = &unk_26491E7A0;
    objc_copyWeak(&v31, &location);
    notify_register_dispatch("com.apple.backboard.proximity.changed", &v9->_proximityNotificationToken, v25, handler);

    softBKSHIDServicesRequestProximityDetectionMode(3);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __70__TVLRGBColorDetector_initWithThresholdsForHue_saturation_brightness___block_invoke_5;
    v28[3] = &unk_26491E7A0;
    objc_copyWeak(&v29, &location);
    notify_register_dispatch("com.apple.backboardd.backlight.changed", &v9->_backlightNotificationToken, MEMORY[0x263EF83A0], v28);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  return v9;
}

void __70__TVLRGBColorDetector_initWithThresholdsForHue_saturation_brightness___block_invoke(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t state64 = 0;
    notify_get_state(a2, &state64);
    if (_TVLLogDefault_onceToken_1 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_1, &__block_literal_global_1);
    }
    v4 = _TVLLogDefault_log_1;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_1, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v7 = state64;
      _os_log_impl(&dword_22C7FF000, v4, OS_LOG_TYPE_DEFAULT, "ProximityState changed to %llu", buf, 0xCu);
    }
    [WeakRetained setProximityState:state64 != 0];
  }
}

void __70__TVLRGBColorDetector_initWithThresholdsForHue_saturation_brightness___block_invoke_5(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t state64 = 0;
    notify_get_state(a2, &state64);
    if (_TVLLogDefault_onceToken_1 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_1, &__block_literal_global_1);
    }
    v4 = _TVLLogDefault_log_1;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_1, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v7 = (float)((float)state64 / 100.0);
      _os_log_impl(&dword_22C7FF000, v4, OS_LOG_TYPE_DEFAULT, "Backlight changed to %f", buf, 0xCu);
    }
    [WeakRetained setBacklightState:state64 != 0];
  }
}

- (void)dealloc
{
  int proximityNotificationToken = self->_proximityNotificationToken;
  if (proximityNotificationToken)
  {
    notify_cancel(proximityNotificationToken);
    softBKSHIDServicesRequestProximityDetectionMode(0);
    self->_int proximityNotificationToken = 0;
  }
  int backlightNotificationToken = self->_backlightNotificationToken;
  if (backlightNotificationToken)
  {
    notify_cancel(backlightNotificationToken);
    self->_int backlightNotificationToken = 0;
  }
  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263EF9798] object:self->_session];

  v6.receiver = self;
  v6.super_class = (Class)TVLRGBColorDetector;
  [(TVLRGBColorDetector *)&v6 dealloc];
}

- (void)setBacklightState:(BOOL)a3
{
  if (self->_backlightState != a3)
  {
    self->_backlightState = a3;
    if (!a3 || !self->_ignoreBacklightProximityState)
    {
      v3[0] = MEMORY[0x263EF8330];
      v3[1] = 3221225472;
      v3[2] = __41__TVLRGBColorDetector_setBacklightState___block_invoke;
      v3[3] = &unk_26491E7C8;
      v3[4] = self;
      BOOL v4 = a3;
      dispatch_async(MEMORY[0x263EF83A0], v3);
    }
  }
}

void __41__TVLRGBColorDetector_setBacklightState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 colorDetector:*(void *)(a1 + 32) backlightStateChanged:*(unsigned __int8 *)(a1 + 40)];
}

- (void)endDetection
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__TVLRGBColorDetector_endDetection__block_invoke;
  block[3] = &unk_26491E7F0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __35__TVLRGBColorDetector_endDetection__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopDetection];
  id v2 = [*(id *)(a1 + 32) motionManager];
  [v2 stopDeviceMotionUpdates];
}

- (void)tearDown
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__TVLRGBColorDetector_tearDown__block_invoke;
  block[3] = &unk_26491E7F0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __31__TVLRGBColorDetector_tearDown__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopDetection];
  [*(id *)(a1 + 32) setSession:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 setMotionManager:0];
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  objc_super v6 = [(TVLRGBColorDetector *)self _averageColorForSampleBuffer:a4];
  double v7 = v6;
  if (v6 && (self->_proximityState && !self->_backlightState || self->_ignoreBacklightProximityState))
  {
    double v34 = 0.0;
    double v35 = 0.0;
    uint64_t v32 = 0;
    double v33 = 0.0;
    [v6 getHue:&v35 saturation:&v34 brightness:&v33 alpha:&v32];
    hueComponents = self->_hueComponents;
    v9 = [NSNumber numberWithDouble:v35];
    [(NSMutableArray *)hueComponents addObject:v9];

    saturationComponents = self->_saturationComponents;
    v11 = [NSNumber numberWithDouble:v34];
    [(NSMutableArray *)saturationComponents addObject:v11];

    brightnessComponents = self->_brightnessComponents;
    v13 = [NSNumber numberWithDouble:v33];
    [(NSMutableArray *)brightnessComponents addObject:v13];

    if ([(NSMutableArray *)self->_hueComponents count] == self->_rollingAverageForFrames)
    {
      v14 = [(NSMutableArray *)self->_hueComponents valueForKeyPath:@"@avg.self"];
      v15 = [(NSMutableArray *)self->_saturationComponents valueForKeyPath:@"@avg.self"];
      v16 = [(NSMutableArray *)self->_brightnessComponents valueForKeyPath:@"@avg.self"];
      [v14 floatValue];
      double v18 = (float)(v17 * 360.0);
      [v15 floatValue];
      double v20 = (float)(v19 * 100.0);
      [v16 floatValue];
      double v22 = (float)(v21 * 100.0);
      [(TVLRGBColorDetector *)self _pctChange:self->_hueThreshhold new:v18 max:360.0];
      double v24 = v23;
      [(TVLRGBColorDetector *)self _pctChange:self->_saturationThreshhold new:v20 max:100.0];
      double v26 = v25;
      [(TVLRGBColorDetector *)self _pctChange:self->_brightnessThreshhold new:v22 max:100.0];
      double v28 = v27;
      if (_TVLLogDefault_onceToken_1 != -1) {
        dispatch_once(&_TVLLogDefault_onceToken_1, &__block_literal_global_1);
      }
      id v29 = _TVLLogDefault_log_1;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_1, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134219264;
        double v37 = v18;
        __int16 v38 = 2048;
        double v39 = v20;
        __int16 v40 = 2048;
        double v41 = v22;
        __int16 v42 = 2048;
        double v43 = v24;
        __int16 v44 = 2048;
        double v45 = v26;
        __int16 v46 = 2048;
        double v47 = v28;
        _os_log_impl(&dword_22C7FF000, v29, OS_LOG_TYPE_INFO, "Detected: H:%.0f S:%.0f B:%.0f Delta: H:%.0f S:%.0f B:%.0f", buf, 0x3Eu);
      }
      unint64_t v30 = (unint64_t)[(NSMutableArray *)self->_hueComponents count] >> 1;
      -[NSMutableArray removeObjectsInRange:](self->_hueComponents, "removeObjectsInRange:", 0, v30);
      -[NSMutableArray removeObjectsInRange:](self->_saturationComponents, "removeObjectsInRange:", 0, v30);
      -[NSMutableArray removeObjectsInRange:](self->_brightnessComponents, "removeObjectsInRange:", 0, v30);
      if (fabs(v24) <= self->_hueErrorMarginPercent
        && fabs(v26) <= self->_saturationErrorMarginPercent
        && fabs(v28) <= self->_brightnessErrorMarginPercent)
      {
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __74__TVLRGBColorDetector_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke;
        v31[3] = &unk_26491E818;
        *(double *)&v31[5] = v18;
        *(double *)&v31[6] = v20;
        *(double *)&v31[7] = v22;
        v31[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], v31);
      }
    }
  }
  else
  {
    [(TVLRGBColorDetector *)self _resetRollingAverage];
  }
}

void __74__TVLRGBColorDetector_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F1C550] colorWithHue:*(double *)(a1 + 40) / 360.0 saturation:*(double *)(a1 + 48) / 100.0 brightness:*(double *)(a1 + 56) / 100.0 alpha:1.0];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 colorDetector:*(void *)(a1 + 32) metThresholdConditionsWithColor:v3];
}

- (id)_averageColorForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  v29[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F00650]) initWithCVPixelBuffer:CMSampleBufferGetImageBuffer(a3)];
  [v3 extent];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F00680]) initWithX:v4 Y:v5 Z:v6 W:v7];
  v9 = (void *)MEMORY[0x263F00640];
  uint64_t v10 = *MEMORY[0x263F00960];
  v28[0] = *MEMORY[0x263F00968];
  v28[1] = v10;
  v29[0] = v3;
  v29[1] = v8;
  v11 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  v12 = [v9 filterWithName:@"CIAreaAverage" withInputParameters:v11];

  uint64_t v13 = [v12 outputImage];
  v14 = (void *)v13;
  v15 = 0;
  if (v12 && v13)
  {
    v16 = malloc_type_calloc(4uLL, 1uLL, 0x100004077774924uLL);
    float v17 = (void *)MEMORY[0x263F00628];
    uint64_t v26 = *MEMORY[0x263F00858];
    double v18 = [MEMORY[0x263EFF9D0] null];
    double v27 = v18;
    float v19 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    double v20 = [v17 contextWithOptions:v19];

    objc_msgSend(v20, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v14, v16, 4, *MEMORY[0x263F00868], 0, 0.0, 0.0, 1.0, 1.0);
    LOBYTE(v21) = v16[2];
    LOBYTE(v22) = v16[1];
    LOBYTE(v23) = *v16;
    LOBYTE(v24) = v16[3];
    v15 = [MEMORY[0x263F1C550] colorWithRed:(double)v21 / 255.0 green:(double)v22 / 255.0 blue:(double)v23 / 255.0 alpha:(double)v24 / 255.0];
    free(v16);
  }

  return v15;
}

- (void)_prepareForDetection
{
  if (self->_useMotionDetection
    && [(CMMotionManager *)self->_motionManager isDeviceMotionAvailable])
  {
    objc_initWeak(&location, self);
    [(CMMotionManager *)self->_motionManager setDeviceMotionUpdateInterval:0.1];
    motionManager = self->_motionManager;
    accelerometerQueue = self->_accelerometerQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __43__TVLRGBColorDetector__prepareForDetection__block_invoke;
    v6[3] = &unk_26491E840;
    objc_copyWeak(&v7, &location);
    [(CMMotionManager *)motionManager startDeviceMotionUpdatesToQueue:accelerometerQueue withHandler:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__TVLRGBColorDetector__prepareForDetection__block_invoke_3;
    block[3] = &unk_26491E7F0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __43__TVLRGBColorDetector__prepareForDetection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    [v3 gravity];
    long double v7 = v6;
    long double v9 = v8;
    double v11 = fabs(fabs(atan2(v10, v6)) + -3.14159265) * 180.0;
    double v12 = fabs(fabs(atan2(v9, v7)) + -3.14159265) * 180.0;
    [v5 pitchMargin];
    double v14 = v13;
    [v5 yawMargin];
    double v16 = v15;
    [v3 userAcceleration];
    double v20 = v17 * v17 + v18 * v18 + v19 * v19;
    [v5 maximumMotion];
    double v22 = v21;
    if (_TVLLogDefault_onceToken_1 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_1, &__block_literal_global_1);
    }
    double v23 = v11 / 3.14159265;
    double v24 = v12 / 3.14159265;
    double v25 = (void *)_TVLLogDefault_log_1;
    double v26 = sqrt(v20);
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_1, OS_LOG_TYPE_INFO))
    {
      double v27 = v25;
      *(_DWORD *)buf = 67110656;
      BOOL v37 = v24 <= v14;
      __int16 v38 = 2048;
      double v39 = v12 / 3.14159265;
      __int16 v40 = 1024;
      BOOL v41 = v23 <= v16;
      __int16 v42 = 2048;
      double v43 = v23;
      __int16 v44 = 1024;
      BOOL v45 = v26 <= v22;
      __int16 v46 = 2048;
      double v47 = v26;
      __int16 v48 = 2048;
      uint64_t v49 = [v5 noMotionDuration];
      _os_log_impl(&dword_22C7FF000, v27, OS_LOG_TYPE_INFO, "Motion: P(%d):%f Y(%d):%f M(%d):%f, frames:%lu", buf, 0x3Cu);
    }
    if (v24 > v14 || v23 > v16 || v26 > v22)
    {
      [v5 setNoMotionDuration:0];
      unint64_t v30 = [v5 delegate];
      [v30 colorDetector:v5 movementDetected:v26];

      id v31 = v34;
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      uint64_t v32 = __43__TVLRGBColorDetector__prepareForDetection__block_invoke_2;
LABEL_17:
      v31[2] = v32;
      v31[3] = &unk_26491E7F0;
      v31[4] = v5;
      dispatch_async(MEMORY[0x263EF83A0], v31);
      goto LABEL_18;
    }
    objc_msgSend(v5, "setNoMotionDuration:", objc_msgSend(v5, "noMotionDuration") + 1);
    unint64_t v33 = [v5 noMotionDuration];
    if (v33 >= [v5 rollingAverageForFrames])
    {
      id v31 = block;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      uint64_t v32 = __43__TVLRGBColorDetector__prepareForDetection__block_invoke_22;
      goto LABEL_17;
    }
  }
LABEL_18:
}

uint64_t __43__TVLRGBColorDetector__prepareForDetection__block_invoke_22(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startDetection];
}

uint64_t __43__TVLRGBColorDetector__prepareForDetection__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopDetection];
}

uint64_t __43__TVLRGBColorDetector__prepareForDetection__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startDetection];
}

- (void)_setupCaptureSession
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C7FF000, a2, OS_LOG_TYPE_ERROR, "An error occured. %@", (uint8_t *)&v2, 0xCu);
}

- (void)captureSessionRuntimeErrorDidOccur:(id)a3
{
  uint64_t v3 = [a3 userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263EF9710]];

  if (_TVLLogDefault_onceToken_1 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_1, &__block_literal_global_1);
  }
  double v5 = _TVLLogDefault_log_1;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_1, OS_LOG_TYPE_ERROR)) {
    -[TVLRGBColorDetector captureSessionRuntimeErrorDidOccur:]((uint64_t)v4, v5);
  }
}

- (double)_pctChange:(double)a3 new:(double)a4 max:(double)a5
{
  return vabdd_f64(a4, a3) / a5 * 100.0;
}

- (void)_startDetection
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (![(AVCaptureSession *)self->_session isRunning])
  {
    session = self->_session;
    [(AVCaptureSession *)session startRunning];
  }
}

- (void)_stopDetection
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ([(AVCaptureSession *)self->_session isRunning])
  {
    [(AVCaptureSession *)self->_session stopRunning];
    [(TVLRGBColorDetector *)self _resetRollingAverage];
  }
}

- (void)_resetRollingAverage
{
  if ([(NSMutableArray *)self->_hueComponents count])
  {
    [(NSMutableArray *)self->_hueComponents removeAllObjects];
    [(NSMutableArray *)self->_saturationComponents removeAllObjects];
    brightnessComponents = self->_brightnessComponents;
    [(NSMutableArray *)brightnessComponents removeAllObjects];
  }
}

- (BOOL)useMotionDetection
{
  return self->_useMotionDetection;
}

- (void)setUseMotionDetection:(BOOL)a3
{
  self->_useMotionDetection = a3;
}

- (double)hueErrorMarginPercent
{
  return self->_hueErrorMarginPercent;
}

- (void)setHueErrorMarginPercent:(double)a3
{
  self->_hueErrorMarginPercent = a3;
}

- (double)saturationErrorMarginPercent
{
  return self->_saturationErrorMarginPercent;
}

- (void)setSaturationErrorMarginPercent:(double)a3
{
  self->_saturationErrorMarginPercent = a3;
}

- (double)brightnessErrorMarginPercent
{
  return self->_brightnessErrorMarginPercent;
}

- (void)setBrightnessErrorMarginPercent:(double)a3
{
  self->_brightnessErrorMarginPercent = a3;
}

- (unint64_t)rollingAverageForFrames
{
  return self->_rollingAverageForFrames;
}

- (void)setRollingAverageForFrames:(unint64_t)a3
{
  self->_rollingAverageForFrames = a3;
}

- (double)pitchMargin
{
  return self->_pitchMargin;
}

- (void)setPitchMargin:(double)a3
{
  self->_pitchMargin = a3;
}

- (double)yawMargin
{
  return self->_yawMargin;
}

- (void)setYawMargin:(double)a3
{
  self->_yawMargin = a3;
}

- (double)maximumMotion
{
  return self->_maximumMotion;
}

- (void)setMaximumMotion:(double)a3
{
  self->_maximumMotion = a3;
}

- (BOOL)ignoreBacklightProximityState
{
  return self->_ignoreBacklightProximityState;
}

- (void)setIgnoreBacklightProximityState:(BOOL)a3
{
  self->_ignoreBacklightProximityState = a3;
}

- (TVLRGBColorDetectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TVLRGBColorDetectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVCaptureSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (void)setMotionManager:(id)a3
{
}

- (NSMutableArray)hueComponents
{
  return self->_hueComponents;
}

- (void)setHueComponents:(id)a3
{
}

- (NSMutableArray)saturationComponents
{
  return self->_saturationComponents;
}

- (void)setSaturationComponents:(id)a3
{
}

- (NSMutableArray)brightnessComponents
{
  return self->_brightnessComponents;
}

- (void)setBrightnessComponents:(id)a3
{
}

- (NSOperationQueue)accelerometerQueue
{
  return self->_accelerometerQueue;
}

- (void)setAccelerometerQueue:(id)a3
{
}

- (unint64_t)noMotionDuration
{
  return self->_noMotionDuration;
}

- (void)setNoMotionDuration:(unint64_t)a3
{
  self->_noMotionDuration = a3;
}

- (double)hueThreshhold
{
  return self->_hueThreshhold;
}

- (void)setHueThreshhold:(double)a3
{
  self->_hueThreshhold = a3;
}

- (double)saturationThreshhold
{
  return self->_saturationThreshhold;
}

- (void)setSaturationThreshhold:(double)a3
{
  self->_saturationThreshhold = a3;
}

- (double)brightnessThreshhold
{
  return self->_brightnessThreshhold;
}

- (void)setBrightnessThreshhold:(double)a3
{
  self->_brightnessThreshhold = a3;
}

- (OS_dispatch_queue)sessionBufferQueue
{
  return self->_sessionBufferQueue;
}

- (void)setSessionBufferQueue:(id)a3
{
}

- (int)proximityNotificationToken
{
  return self->_proximityNotificationToken;
}

- (void)setProximityNotificationToken:(int)a3
{
  self->_int proximityNotificationToken = a3;
}

- (BOOL)proximityState
{
  return self->_proximityState;
}

- (void)setProximityState:(BOOL)a3
{
  self->_proximityState = a3;
}

- (int)backlightNotificationToken
{
  return self->_backlightNotificationToken;
}

- (void)setBacklightNotificationToken:(int)a3
{
  self->_int backlightNotificationToken = a3;
}

- (BOOL)backlightState
{
  return self->_backlightState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionBufferQueue, 0);
  objc_storeStrong((id *)&self->_accelerometerQueue, 0);
  objc_storeStrong((id *)&self->_brightnessComponents, 0);
  objc_storeStrong((id *)&self->_saturationComponents, 0);
  objc_storeStrong((id *)&self->_hueComponents, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)captureSessionRuntimeErrorDidOccur:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C7FF000, a2, OS_LOG_TYPE_ERROR, "captureSessionRuntimeErrorDidOccur %{public}@", (uint8_t *)&v2, 0xCu);
}

@end