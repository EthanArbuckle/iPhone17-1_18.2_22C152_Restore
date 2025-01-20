@interface TVLDisplayColorCalibrator
- (BOOL)useSlowALS;
- (CUMessageSession)session;
- (NSArray)detectorMargin;
- (NSArray)detectorTarget;
- (NSNumber)maximumMotion;
- (NSNumber)pitchMargin;
- (NSNumber)stationaryFrames;
- (NSNumber)yawMargin;
- (TVLDisplayColorCalibrator)initWithMessageSession:(id)a3;
- (TVLRGBColorDetector)colorDetector;
- (id)progressEventHandler;
- (unint64_t)role;
- (unint64_t)state;
- (void)_initWithMessageSession:(id)a3;
- (void)_invalidateWithError:(id)a3;
- (void)_postProgressEvent:(unint64_t)a3 withInfo:(id)a4;
- (void)_respondAndInvalidateWithError:(id)a3 responseHandler:(id)a4;
- (void)_sendMessage:(id)a3 withResponse:(id)a4;
- (void)_startPositioning;
- (void)_startReadings;
- (void)_tearDown;
- (void)activate;
- (void)calibrate;
- (void)colorDetector:(id)a3 backlightStateChanged:(BOOL)a4;
- (void)colorDetector:(id)a3 metThresholdConditionsWithColor:(id)a4;
- (void)colorDetector:(id)a3 movementDetected:(double)a4;
- (void)invalidate;
- (void)setColorDetector:(id)a3;
- (void)setProgressEventHandler:(id)a3;
- (void)setSession:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation TVLDisplayColorCalibrator

- (TVLDisplayColorCalibrator)initWithMessageSession:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TVLDisplayColorCalibrator;
  v5 = [(TVLDisplayColorCalibrator *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_role = 1;
    detectorTarget = v5->_detectorTarget;
    v5->_state = 0;
    v5->_detectorTarget = (NSArray *)&unk_26DFE92A0;

    detectorMargin = v6->_detectorMargin;
    v6->_detectorMargin = (NSArray *)&unk_26DFE92B8;

    pitchMargin = v6->_pitchMargin;
    v6->_pitchMargin = (NSNumber *)&unk_26DFE92D0;

    yawMargin = v6->_yawMargin;
    v6->_yawMargin = (NSNumber *)&unk_26DFE92D0;

    maximumMotion = v6->_maximumMotion;
    v6->_maximumMotion = (NSNumber *)&unk_26DFE92E0;

    stationaryFrames = v6->_stationaryFrames;
    v6->_stationaryFrames = (NSNumber *)&unk_26DFE9270;

    v6->_useSlowALS = 0;
    [(TVLDisplayColorCalibrator *)v6 _initWithMessageSession:v4];
  }

  return v6;
}

- (void)_initWithMessageSession:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x263F38568]) initWithTemplate:v4];
  [(TVLDisplayColorCalibrator *)self setSession:v5];

  objc_initWeak(&location, self);
  v6 = [(TVLDisplayColorCalibrator *)self session];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__TVLDisplayColorCalibrator__initWithMessageSession___block_invoke;
  v7[3] = &unk_26491E688;
  objc_copyWeak(&v8, &location);
  [v6 registerRequestID:@"com.apple.tvlatency" options:0 handler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __53__TVLDisplayColorCalibrator__initWithMessageSession___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (_TVLLogDefault_onceToken_4 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
    }
    v9 = _TVLLogDefault_log_4;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v40 = v6;
      _os_log_impl(&dword_22C7FF000, v9, OS_LOG_TYPE_DEFAULT, "Incoming Message: %{public}@", buf, 0xCu);
    }
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __53__TVLDisplayColorCalibrator__initWithMessageSession___block_invoke_21;
    v32[3] = &unk_26491E660;
    id v10 = v6;
    id v33 = v10;
    id v34 = v7;
    v11 = (void (**)(void, void, void, void))MEMORY[0x230F6CE70](v32);
    v12 = [v10 objectForKey:@"MESSAGE"];
    if ([v12 isEqualToString:@"READ_ALS"])
    {
      if ([WeakRetained state] == 2)
      {
        v13 = [v10 objectForKey:@"OPTIONS"];
        objc_super v14 = [v13 objectForKey:@"NUMBER_OF_READINGS"];
        uint64_t v15 = [v14 integerValue];

        if (v15 >= 256) {
          uint64_t v16 = 256;
        }
        else {
          uint64_t v16 = v15;
        }
        v17 = [v13 objectForKey:@"SKIP_READINGS"];
        uint64_t v18 = [v17 integerValue];

        if (v18 >= 256) {
          uint64_t v19 = 256;
        }
        else {
          uint64_t v19 = v18;
        }
        uint64_t v20 = v19 + v16;
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __53__TVLDisplayColorCalibrator__initWithMessageSession___block_invoke_45;
        v29[3] = &unk_26491EB68;
        uint64_t v31 = v19;
        v29[4] = WeakRetained;
        v30 = v11;
        +[TVLALSDataExtractor extract:v20 ALSReadings:v29];

        goto LABEL_25;
      }
      ((void (**)(void, void, void, void *))v11)[2](v11, 0, 0, &unk_26DFE92F0);
    }
    else
    {
      if ([v12 isEqualToString:@"ASK_RETRY"])
      {
        v37 = @"MESSAGE";
        v21 = [MEMORY[0x263EFF9D0] null];
        v38 = v21;
        v22 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        ((void (**)(void, void, void, void *))v11)[2](v11, 0, 0, v22);

        v23 = WeakRetained;
        uint64_t v24 = 4;
        uint64_t v25 = 0;
      }
      else
      {
        if (![v12 isEqualToString:@"FINAL"])
        {
          v13 = [MEMORY[0x263F087E8] errorWithDomain:@"TVLatencyErrorDomain" code:1207 userInfo:0];
          [WeakRetained _respondAndInvalidateWithError:v13 responseHandler:v11];
LABEL_25:

          goto LABEL_26;
        }
        v35 = @"MESSAGE";
        v26 = [MEMORY[0x263EFF9D0] null];
        v36 = v26;
        v27 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        ((void (**)(void, void, void, void *))v11)[2](v11, 0, 0, v27);

        v28 = [v10 objectForKey:@"STATUS"];
        LODWORD(v26) = [v28 BOOLValue];

        if (v26) {
          uint64_t v25 = MEMORY[0x263EFFA78];
        }
        else {
          uint64_t v25 = 0;
        }
        v23 = WeakRetained;
        uint64_t v24 = 3;
      }
      [v23 _postProgressEvent:v24 withInfo:v25];
    }
LABEL_26:
  }
}

void __53__TVLDisplayColorCalibrator__initWithMessageSession___block_invoke_21(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (_TVLLogDefault_onceToken_4 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
  }
  v9 = (id)_TVLLogDefault_log_4;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (a2)
    {
      v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:a2 userInfo:0];
    }
    else
    {
      v11 = 0;
    }
    int v12 = 138543874;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    id v15 = v8;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_22C7FF000, v9, OS_LOG_TYPE_DEFAULT, "Responding To Message: %{public}@ | Response: %{public}@ | Error: %{public}@", (uint8_t *)&v12, 0x20u);
    if (a2) {
  }
    }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __53__TVLDisplayColorCalibrator__initWithMessageSession___block_invoke_45(void *a1, void *a2)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __53__TVLDisplayColorCalibrator__initWithMessageSession___block_invoke_2;
    v12[3] = &unk_26491EB40;
    uint64_t v5 = a1[6];
    id v13 = v4;
    uint64_t v14 = v5;
    id v6 = v4;
    [v3 enumerateObjectsUsingBlock:v12];
    uint64_t v7 = a1[5];
    id v15 = @"ALS_DATA";
    id v8 = (void *)[v6 copy];
    v16[0] = v8;
    v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    (*(void (**)(uint64_t, void, void, void *))(v7 + 16))(v7, 0, 0, v9);
  }
  else
  {
    uint64_t v10 = (void *)a1[4];
    v11 = [MEMORY[0x263F087E8] errorWithDomain:@"TVLatencyErrorDomain" code:1207 userInfo:0];
    [v10 _respondAndInvalidateWithError:v11 responseHandler:a1[5]];
  }
}

void __53__TVLDisplayColorCalibrator__initWithMessageSession___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  if (*(void *)(a1 + 40) <= a3)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [a2 dictionaryRepresentation];
    [v3 addObject:v4];
  }
}

- (void)activate
{
  id v2 = [(TVLDisplayColorCalibrator *)self session];
  [v2 activate];
}

- (void)calibrate
{
  if (_TVLLogDefault_onceToken_4 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
  }
  id v3 = _TVLLogDefault_log_4;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22C7FF000, v3, OS_LOG_TYPE_DEFAULT, "TVLDisplayColorCalibrator:calibrate", (uint8_t *)buf, 2u);
  }
  self->_state = 0;
  [(TVLDisplayColorCalibrator *)self _postProgressEvent:0 withInfo:0];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (DeviceProductType_onceToken_0 != -1) {
    dispatch_once(&DeviceProductType_onceToken_0, &__block_literal_global_268);
  }
  id v5 = (id)DeviceProductType_type_0;
  if (v5) {
    [v4 setObject:v5 forKey:@"DEVICE_TYPE"];
  }
  if (OSBuildVersion_onceToken_0 != -1) {
    dispatch_once(&OSBuildVersion_onceToken_0, &__block_literal_global_273);
  }
  id v6 = (id)OSBuildVersion_build_0;
  if (v6) {
    [v4 setObject:v6 forKey:@"DEVICE_BUILD"];
  }
  uint64_t v7 = +[TVLALSDataExtractor extractALSCalibrationData];
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"ALS_CALIBRATION_DATA"];
  }
  objc_initWeak(buf, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __38__TVLDisplayColorCalibrator_calibrate__block_invoke;
  v11[3] = &unk_26491EBB8;
  objc_copyWeak(&v13, buf);
  id v10 = v4;
  id v12 = v10;
  +[TVLALSDataExtractor extractALSData:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);
}

void __38__TVLDisplayColorCalibrator_calibrate__block_invoke(uint64_t a1, void *a2)
{
  v13[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v3 dictionaryRepresentation];
    [v6 setObject:v7 forKey:@"ALS_DATA"];
  }
  v12[0] = @"MESSAGE";
  v12[1] = @"OPTIONS";
  uint64_t v8 = *(void *)(a1 + 32);
  v13[0] = @"DISPLAY_COLOR_CALIBRATION";
  v13[1] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__TVLDisplayColorCalibrator_calibrate__block_invoke_2;
  v10[3] = &unk_26491E9D8;
  objc_copyWeak(&v11, v4);
  [WeakRetained _sendMessage:v9 withResponse:v10];

  objc_destroyWeak(&v11);
}

void __38__TVLDisplayColorCalibrator_calibrate__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (_TVLLogDefault_onceToken_4 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
    }
    id v6 = _TVLLogDefault_log_4;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v3;
      _os_log_impl(&dword_22C7FF000, v6, OS_LOG_TYPE_DEFAULT, "TVLDisplayColorCalibrator:calibrate:response %@", buf, 0xCu);
    }
    if (v3)
    {
      uint64_t v7 = [v3 objectForKeyedSubscript:@"DETECTOR_TARGET"];
      if ([v7 count] == 3) {
        objc_storeStrong(WeakRetained + 7, v7);
      }
      uint64_t v8 = [v3 objectForKeyedSubscript:@"DETECTOR_MARGIN"];
      if ([v8 count] == 3) {
        objc_storeStrong(WeakRetained + 8, v8);
      }
      v9 = [v3 objectForKeyedSubscript:@"PITCH_MARGIN"];
      if (v9) {
        objc_storeStrong(WeakRetained + 9, v9);
      }
      id v10 = [v3 objectForKeyedSubscript:@"YAW_MARGIN"];
      if (v10) {
        objc_storeStrong(WeakRetained + 10, v10);
      }
      id v11 = [v3 objectForKeyedSubscript:@"MAXIMUM_MOTION"];
      if (v11) {
        objc_storeStrong(WeakRetained + 11, v11);
      }
      id v12 = objc_msgSend(v3, "objectForKeyedSubscript:", @"STATIONARY_FRAMES", v8);
      if (v12) {
        objc_storeStrong(WeakRetained + 12, v12);
      }
      id v13 = [v3 objectForKeyedSubscript:@"USE_SLOW_ALS"];
      uint64_t v14 = v13;
      if (v13) {
        *((unsigned char *)WeakRetained + 8) = [v13 BOOLValue];
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __38__TVLDisplayColorCalibrator_calibrate__block_invoke_98;
      block[3] = &unk_26491EB90;
      objc_copyWeak(&v17, v4);
      dispatch_async(MEMORY[0x263EF83A0], block);
      objc_destroyWeak(&v17);
    }
  }
}

void __38__TVLDisplayColorCalibrator_calibrate__block_invoke_98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startPositioning];
}

- (void)_startPositioning
{
  if (_TVLLogDefault_onceToken_4 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
  }
  id v3 = _TVLLogDefault_log_4;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C7FF000, v3, OS_LOG_TYPE_DEFAULT, "TVLDisplayColorCalibrator:_startPositioning", buf, 2u);
  }
  self->_state = 1;
  colorDetector = self->_colorDetector;
  if (!colorDetector)
  {
    id v5 = [(NSArray *)self->_detectorTarget objectAtIndexedSubscript:0];
    [v5 floatValue];
    float v7 = v6;

    uint64_t v8 = [(NSArray *)self->_detectorTarget objectAtIndexedSubscript:1];
    [v8 floatValue];
    float v10 = v9;

    id v11 = [(NSArray *)self->_detectorTarget objectAtIndexedSubscript:2];
    [v11 floatValue];
    float v13 = v12;

    uint64_t v14 = [[TVLRGBColorDetector alloc] initWithThresholdsForHue:v7 saturation:v10 brightness:v13];
    id v15 = self->_colorDetector;
    self->_colorDetector = v14;

    __int16 v16 = [MEMORY[0x263EFFA40] standardUserDefaults];
    if ([v16 BOOLForKey:@"TVLatencyAutomationMode"])
    {
      if (_TVLLogDefault_onceToken_4 != -1) {
        dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
      }
      id v17 = _TVLLogDefault_log_4;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v33 = 0;
        _os_log_impl(&dword_22C7FF000, v17, OS_LOG_TYPE_DEFAULT, "Ignoring backlight and proximity detection per automation mode flag", v33, 2u);
      }
      [(TVLRGBColorDetector *)self->_colorDetector setIgnoreBacklightProximityState:1];
    }
    uint64_t v18 = self->_colorDetector;
    id v19 = [(NSArray *)self->_detectorMargin objectAtIndexedSubscript:0];
    [v19 floatValue];
    [(TVLRGBColorDetector *)v18 setHueErrorMarginPercent:v20];

    v21 = self->_colorDetector;
    v22 = [(NSArray *)self->_detectorMargin objectAtIndexedSubscript:1];
    [v22 floatValue];
    [(TVLRGBColorDetector *)v21 setSaturationErrorMarginPercent:v23];

    uint64_t v24 = self->_colorDetector;
    uint64_t v25 = [(NSArray *)self->_detectorMargin objectAtIndexedSubscript:2];
    [v25 floatValue];
    [(TVLRGBColorDetector *)v24 setBrightnessErrorMarginPercent:v26];

    v27 = self->_colorDetector;
    [(NSNumber *)self->_pitchMargin floatValue];
    [(TVLRGBColorDetector *)v27 setPitchMargin:v28];
    v29 = self->_colorDetector;
    [(NSNumber *)self->_yawMargin floatValue];
    [(TVLRGBColorDetector *)v29 setYawMargin:v30];
    uint64_t v31 = self->_colorDetector;
    [(NSNumber *)self->_maximumMotion floatValue];
    [(TVLRGBColorDetector *)v31 setMaximumMotion:v32];
    [(TVLRGBColorDetector *)self->_colorDetector setRollingAverageForFrames:[(NSNumber *)self->_stationaryFrames unsignedIntegerValue]];
    [(TVLRGBColorDetector *)self->_colorDetector setDelegate:self];

    colorDetector = self->_colorDetector;
  }
  [(TVLRGBColorDetector *)colorDetector beginDetection];
}

- (void)_startReadings
{
  v10[2] = *MEMORY[0x263EF8340];
  if (_TVLLogDefault_onceToken_4 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
  }
  id v3 = _TVLLogDefault_log_4;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_22C7FF000, v3, OS_LOG_TYPE_DEFAULT, "TVLDisplayColorCalibrator:_startReadings", (uint8_t *)&buf, 2u);
  }
  self->_state = 2;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_initWeak(&buf, self);
  v9[0] = @"MESSAGE";
  v9[1] = @"OPTIONS";
  v10[0] = @"READY";
  v10[1] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__TVLDisplayColorCalibrator__startReadings__block_invoke;
  v6[3] = &unk_26491E9D8;
  objc_copyWeak(&v7, &buf);
  [(TVLDisplayColorCalibrator *)self _sendMessage:v5 withResponse:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&buf);
}

void __43__TVLDisplayColorCalibrator__startReadings__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
}

- (void)invalidate
{
}

- (void)_invalidateWithError:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(TVLDisplayColorCalibrator *)self _tearDown];
  if (v4)
  {
    float v6 = @"TVLDisplayColorCalibratorProgressEventErrorObjectKey";
    v7[0] = v4;
    id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [(TVLDisplayColorCalibrator *)self _postProgressEvent:2 withInfo:v5];
  }
  else
  {
    [(TVLDisplayColorCalibrator *)self _postProgressEvent:3 withInfo:0];
  }
}

- (void)_tearDown
{
  [(TVLRGBColorDetector *)self->_colorDetector tearDown];
  colorDetector = self->_colorDetector;
  self->_colorDetector = 0;
}

- (void)_sendMessage:(id)a3 withResponse:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (_TVLLogDefault_onceToken_4 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
  }
  uint64_t v8 = _TVLLogDefault_log_4;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543362;
    id v17 = v6;
    _os_log_impl(&dword_22C7FF000, v8, OS_LOG_TYPE_DEFAULT, "Outgoing Message: %{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  float v9 = [(TVLDisplayColorCalibrator *)self session];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __55__TVLDisplayColorCalibrator__sendMessage_withResponse___block_invoke;
  v12[3] = &unk_26491EA00;
  objc_copyWeak(&v15, (id *)buf);
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [v9 sendRequestID:@"com.apple.tvlatency" options:0 request:v10 responseHandler:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __55__TVLDisplayColorCalibrator__sendMessage_withResponse___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (_TVLLogDefault_onceToken_4 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
    }
    uint64_t v8 = (id)_TVLLogDefault_log_4;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (a2)
      {
        id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:a2 userInfo:0];
      }
      else
      {
        id v10 = 0;
      }
      *(_DWORD *)id buf = 138543874;
      uint64_t v26 = v9;
      __int16 v27 = 2114;
      id v28 = v6;
      __int16 v29 = 2114;
      float v30 = v10;
      _os_log_impl(&dword_22C7FF000, v8, OS_LOG_TYPE_DEFAULT, "Responding To Message: %{public}@ | Response: %{public}@ | Error: %{public}@", buf, 0x20u);
      if (a2) {
    }
      }
    if (a2)
    {
      uint64_t v11 = *(void *)(a1 + 40);
      if (v11) {
        (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
      }
      float v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:a2 userInfo:0];
      [WeakRetained _invalidateWithError:v12];
LABEL_14:

      goto LABEL_15;
    }
    id v13 = objc_msgSend(MEMORY[0x263EFF9D0], "null", @"MESSAGE");
    uint64_t v24 = v13;
    id v14 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    if ([v6 isEqualToDictionary:v14])
    {
    }
    else
    {
      id v15 = [v6 objectForKey:@"MESSAGE"];
      int v16 = [v15 isEqualToString:@"FAILURE"];

      if (v16)
      {
        uint64_t v17 = *(void *)(a1 + 40);
        if (v17) {
          (*(void (**)(uint64_t, void))(v17 + 16))(v17, 0);
        }
        float v12 = [v6 objectForKey:@"OPTIONS"];
        uint64_t v18 = [v12 objectForKey:@"ERROR_DOMAIN"];
        id v19 = [v12 objectForKey:@"ERROR_CODE"];
        uint64_t v20 = [v19 integerValue];

        v21 = [MEMORY[0x263F087E8] errorWithDomain:v18 code:v20 userInfo:0];
        [WeakRetained _invalidateWithError:v21];

        goto LABEL_14;
      }
    }
    uint64_t v22 = *(void *)(a1 + 40);
    if (v22) {
      (*(void (**)(uint64_t, id))(v22 + 16))(v22, v6);
    }
  }
LABEL_15:
}

- (void)_respondAndInvalidateWithError:(id)a3 responseHandler:(id)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  v16[0] = @"MESSAGE";
  v16[1] = @"OPTIONS";
  v17[0] = @"FAILURE";
  v14[0] = @"ERROR_CODE";
  id v7 = NSNumber;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v9, "code"));
  v14[1] = @"ERROR_DOMAIN";
  v15[0] = v10;
  uint64_t v11 = [v9 domain];
  v15[1] = v11;
  float v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  v17[1] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  (*((void (**)(id, void, void, void *))a4 + 2))(v8, 0, 0, v13);

  [(TVLDisplayColorCalibrator *)self _invalidateWithError:v9];
}

- (void)_postProgressEvent:(unint64_t)a3 withInfo:(id)a4
{
  id v6 = a4;
  if (a3 == 4 || a3 == 2)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F1C810]);
    [v7 prepare];
  }
  else
  {
    id v7 = 0;
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__TVLDisplayColorCalibrator__postProgressEvent_withInfo___block_invoke;
  void v10[3] = &unk_26491EBE0;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  unint64_t v13 = a3;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

uint64_t __57__TVLDisplayColorCalibrator__postProgressEvent_withInfo___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (_TVLLogDefault_onceToken_4 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
  }
  id v2 = (id)_TVLLogDefault_log_4;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) progressEventHandler];
    uint64_t v4 = MEMORY[0x230F6CE70]();
    id v5 = (void *)v4;
    unint64_t v6 = *(void *)(a1 + 56) - 1;
    if (v6 > 3) {
      id v7 = "Start";
    }
    else {
      id v7 = off_26491EC48[v6];
    }
    uint64_t v8 = *(void *)(a1 + 40);
    int v17 = 138412802;
    uint64_t v18 = v4;
    __int16 v19 = 2082;
    uint64_t v20 = v7;
    __int16 v21 = 2114;
    uint64_t v22 = v8;
    _os_log_impl(&dword_22C7FF000, v2, OS_LOG_TYPE_DEFAULT, "Calling Progress Event Handler: %@ with Event: %{public}s | Info %{public}@", (uint8_t *)&v17, 0x20u);
  }
  id v9 = [*(id *)(a1 + 32) progressEventHandler];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 32) progressEventHandler];
    v10[2](v10, *(void *)(a1 + 56), *(void *)(a1 + 40));

    if (*(void *)(a1 + 56) == 3)
    {
      if (_TVLLogDefault_onceToken_4 != -1) {
        dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
      }
      id v11 = (void *)_TVLLogDefault_log_4;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = *(void **)(a1 + 32);
        unint64_t v13 = v11;
        id v14 = [v12 progressEventHandler];
        id v15 = (void *)MEMORY[0x230F6CE70]();
        int v17 = 138412290;
        uint64_t v18 = (uint64_t)v15;
        _os_log_impl(&dword_22C7FF000, v13, OS_LOG_TYPE_DEFAULT, "Deleting Progress Event Handler: %@ | This should not be invoked again!", (uint8_t *)&v17, 0xCu);
      }
      [*(id *)(a1 + 32) setProgressEventHandler:0];
    }
  }
  return [*(id *)(a1 + 48) notificationOccurred:2];
}

- (void)colorDetector:(id)a3 metThresholdConditionsWithColor:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (self->_state == 1)
  {
    id v5 = (objc_class *)MEMORY[0x263F1C810];
    id v6 = a4;
    id v7 = objc_alloc_init(v5);
    [v7 prepare];
    double v15 = 0.0;
    double v16 = 0.0;
    uint64_t v13 = 0;
    double v14 = 0.0;
    [v6 getHue:&v16 saturation:&v15 brightness:&v14 alpha:&v13];

    if (_TVLLogDefault_onceToken_4 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
    }
    uint64_t v8 = _TVLLogDefault_log_4;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 134218496;
      double v18 = v16 * 360.0;
      __int16 v19 = 2048;
      double v20 = v15 * 100.0;
      __int16 v21 = 2048;
      double v22 = v14 * 100.0;
      _os_log_impl(&dword_22C7FF000, v8, OS_LOG_TYPE_DEFAULT, "TVLRGBColorDetector:metThresholdConditionsWithColor H:%.0f S:%.0f B:%.0f", buf, 0x20u);
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __75__TVLDisplayColorCalibrator_colorDetector_metThresholdConditionsWithColor___block_invoke;
    void v10[3] = &unk_26491EC08;
    id v11 = v7;
    id v12 = self;
    id v9 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

uint64_t __75__TVLDisplayColorCalibrator_colorDetector_metThresholdConditionsWithColor___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) notificationOccurred:0];
  id v2 = *(void **)(a1 + 40);

  return [v2 _startReadings];
}

- (void)colorDetector:(id)a3 backlightStateChanged:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v4)
  {
    if (self->_state == 2)
    {
      if (_TVLLogDefault_onceToken_4 != -1) {
        dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
      }
      id v7 = _TVLLogDefault_log_4;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
      {
        id buf = (id)0x104000100;
        _os_log_impl(&dword_22C7FF000, v7, OS_LOG_TYPE_DEFAULT, "TVLDisplayColorCalibrator:backlightStateChanged %d during TVLDisplayColorCalibratorStateReadings", (uint8_t *)&buf, 8u);
      }
      self->_state = 0;
      [v6 endDetection];
      objc_initWeak(&buf, self);
      dispatch_time_t v8 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __65__TVLDisplayColorCalibrator_colorDetector_backlightStateChanged___block_invoke;
      block[3] = &unk_26491EB90;
      objc_copyWeak(&v14, &buf);
      dispatch_after(v8, MEMORY[0x263EF83A0], block);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&buf);
    }
  }
  else
  {
    BOOL useSlowALS = self->_useSlowALS;
    dispatch_time_t v10 = dispatch_time(0, 200000000);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __65__TVLDisplayColorCalibrator_colorDetector_backlightStateChanged___block_invoke_2;
    v11[3] = &__block_descriptor_33_e5_v8__0l;
    BOOL v12 = useSlowALS;
    dispatch_after(v10, MEMORY[0x263EF83A0], v11);
  }
}

void __65__TVLDisplayColorCalibrator_colorDetector_backlightStateChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startPositioning];
}

void __65__TVLDisplayColorCalibrator_colorDetector_backlightStateChanged___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (_TVLLogDefault_onceToken_4 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
  }
  id v2 = _TVLLogDefault_log_4;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 32)) {
      id v3 = @"slow";
    }
    else {
      id v3 = @"fast";
    }
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_22C7FF000, v2, OS_LOG_TYPE_DEFAULT, "Activate ALS in %{public}@ mode", (uint8_t *)&v5, 0xCu);
  }
  id v4 = objc_alloc_init(MEMORY[0x263F34238]);
  [v4 setProperty:MEMORY[0x263EFFA88] forKey:@"ActivateALS"];
  if (*(unsigned char *)(a1 + 32)) {
    [v4 setProperty:MEMORY[0x263EFFA88] forKey:@"UserInteractedWithUI"];
  }
}

- (void)colorDetector:(id)a3 movementDetected:(double)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (self->_state == 2)
  {
    if (_TVLLogDefault_onceToken_4 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_4, &__block_literal_global_4);
    }
    uint64_t v7 = _TVLLogDefault_log_4;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 134217984;
      double v12 = a4;
      _os_log_impl(&dword_22C7FF000, v7, OS_LOG_TYPE_DEFAULT, "TVLDisplayColorCalibrator:movementDetected %f during TVLDisplayColorCalibratorStateReadings", buf, 0xCu);
    }
    self->_state = 0;
    [v6 endDetection];
    objc_initWeak((id *)buf, self);
    dispatch_time_t v8 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__TVLDisplayColorCalibrator_colorDetector_movementDetected___block_invoke;
    block[3] = &unk_26491EB90;
    objc_copyWeak(&v10, (id *)buf);
    dispatch_after(v8, MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

void __60__TVLDisplayColorCalibrator_colorDetector_movementDetected___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startPositioning];
}

- (unint64_t)role
{
  return self->_role;
}

- (id)progressEventHandler
{
  return self->_progressEventHandler;
}

- (void)setProgressEventHandler:(id)a3
{
}

- (TVLRGBColorDetector)colorDetector
{
  return self->_colorDetector;
}

- (void)setColorDetector:(id)a3
{
}

- (CUMessageSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSArray)detectorTarget
{
  return self->_detectorTarget;
}

- (NSArray)detectorMargin
{
  return self->_detectorMargin;
}

- (NSNumber)pitchMargin
{
  return self->_pitchMargin;
}

- (NSNumber)yawMargin
{
  return self->_yawMargin;
}

- (NSNumber)maximumMotion
{
  return self->_maximumMotion;
}

- (NSNumber)stationaryFrames
{
  return self->_stationaryFrames;
}

- (BOOL)useSlowALS
{
  return self->_useSlowALS;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationaryFrames, 0);
  objc_storeStrong((id *)&self->_maximumMotion, 0);
  objc_storeStrong((id *)&self->_yawMargin, 0);
  objc_storeStrong((id *)&self->_pitchMargin, 0);
  objc_storeStrong((id *)&self->_detectorMargin, 0);
  objc_storeStrong((id *)&self->_detectorTarget, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_colorDetector, 0);

  objc_storeStrong(&self->_progressEventHandler, 0);
}

@end