@interface AXPhoenixGestureDetector
- (AXPhoenixGestureDetector)initWithDelegate:(id)a3;
- (BOOL)_initializeAssetDrivenComponentsWithLocalURL:(id)a3 assetVersion:(unint64_t)a4;
- (BOOL)falsePositiveLoggingEnabled;
- (BOOL)needsToUpdateModelToVersion:(int64_t)a3;
- (BOOL)rnnModelEnabled;
- (id)_createClassifierModelURL;
- (id)_createConfiguration;
- (id)_mobileAssetPathForConfigOrNil;
- (id)_mobileAssetURLForModelOrNil;
- (id)_phoenixCompiledModelURL;
- (id)urlOfModelInThisBundle;
- (void)_resetAssetDrivenComponents;
- (void)_setPolicyOption:(int)a3;
- (void)_startClassifierWithCompletion:(id)a3;
- (void)_startWithCompletion:(id)a3;
- (void)_stopClassifier;
- (void)_stopWithCompletion:(id)a3;
- (void)modelDidUpdate:(id)a3 assetVersion:(unint64_t)a4;
- (void)phoenixClassifier:(id)a3 failedWithError:(id)a4;
- (void)phoenixClassifierDidDetectDoubleTap:(id)a3 data:(id)a4 context:(id)a5;
- (void)phoenixClassifierDidDetectTripleTap:(id)a3 data:(id)a4 context:(id)a5;
- (void)phoenixClassifierDidLogFile:(id)a3;
- (void)phoenixMitigator:(id)a3 didFailWithError:(id)a4;
- (void)phoenixMitigator:(id)a3 displayOnDidChange:(BOOL)a4;
- (void)phoenixMitigator:(id)a3 touchOnDidChange:(BOOL)a4;
- (void)reportFalsePositive:(id)a3;
- (void)setDoubleTapPolicy;
- (void)setFalsePositiveLoggingEnabled:(BOOL)a3;
- (void)setGeneralPolicy;
- (void)setRnnModelEnabled:(BOOL)a3;
- (void)setTapSpeed:(float)a3;
- (void)setTripleTapPolicy;
- (void)startWithCompletion:(id)a3;
- (void)stopWithCompletion:(id)a3;
@end

@implementation AXPhoenixGestureDetector

- (AXPhoenixGestureDetector)initWithDelegate:(id)a3
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v16;
  id v16 = 0;
  v14.receiver = v3;
  v14.super_class = (Class)AXPhoenixGestureDetector;
  id v16 = [(AXPhoenixGestureDetector *)&v14 init];
  objc_storeStrong(&v16, v16);
  if (!v16) {
    goto LABEL_6;
  }
  dispatch_queue_attr_t attr = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.accessibility.phoenix.gesturedetector", attr);
  v5 = (void *)*((void *)v16 + 8);
  *((void *)v16 + 8) = v4;

  id v6 = objc_alloc_init(MEMORY[0x263F08A48]);
  v7 = (void *)*((void *)v16 + 2);
  *((void *)v16 + 2) = v6;

  [*((id *)v16 + 2) setMaxConcurrentOperationCount:1];
  [*((id *)v16 + 2) setQualityOfService:33];
  objc_storeStrong((id *)v16 + 4, location[0]);
  if ([v16 _initializeAssetDrivenComponentsWithLocalURL:0 assetVersion:_currentAssetVersion])
  {
    v8 = [AXPhoenixAssetMonitor alloc];
    uint64_t v9 = [(AXPhoenixAssetMonitor *)v8 initWithDelegate:v16];
    v10 = (void *)*((void *)v16 + 9);
    *((void *)v16 + 9) = v9;

    int v12 = 0;
  }
  else
  {
    v17 = 0;
    int v12 = 1;
  }
  objc_storeStrong((id *)&attr, 0);
  if (!v12) {
LABEL_6:
  }
    v17 = (AXPhoenixGestureDetector *)v16;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v16, 0);
  return v17;
}

- (void)_resetAssetDrivenComponents
{
  self->_assetVersion = 0;
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_classifier, 0);
  objc_storeStrong((id *)&self->_mitigator, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
}

- (BOOL)_initializeAssetDrivenComponentsWithLocalURL:(id)a3 assetVersion:(unint64_t)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33[1] = (id)a4;
  [(AXPhoenixGestureDetector *)v35 _resetAssetDrivenComponents];
  objc_storeStrong((id *)&v35->_localURL, location[0]);
  v35->_assetVersion = a4;
  dispatch_queue_t v4 = (AXPhoenixConfiguration *)[(AXPhoenixGestureDetector *)v35 _createConfiguration];
  configuration = v35->_configuration;
  v35->_configuration = v4;

  v33[0] = [(AXPhoenixGestureDetector *)v35 _createClassifierModelURL];
  if (v33[0])
  {
    if (v35->_rnnModelEnabled)
    {
      v26 = [AXPhoenixClassifierRNN alloc];
      v25 = v35;
      v27 = [(AXPhoenixConfiguration *)v35->_configuration classifierConfiguration];
      uint64_t v6 = -[AXPhoenixClassifierRNN initWithDelegate:modelURL:configuration:](v26, "initWithDelegate:modelURL:configuration:", v25, v33[0]);
      classifier = v35->_classifier;
      v35->_classifier = (AXPhoenixClassifier *)v6;
    }
    else
    {
      v23 = [AXPhoenixClassifier alloc];
      v22 = v35;
      v24 = [(AXPhoenixConfiguration *)v35->_configuration classifierConfiguration];
      uint64_t v8 = -[AXPhoenixClassifier initWithDelegate:modelURL:configuration:](v23, "initWithDelegate:modelURL:configuration:", v22, v33[0]);
      uint64_t v9 = v35->_classifier;
      v35->_classifier = (AXPhoenixClassifier *)v8;
    }
    [(AXPhoenixClassifier *)v35->_classifier setFalsePositiveLoggingEnabled:v35->_falsePositiveLoggingEnabled];
    *(float *)&double v10 = v35->_tapSpeed;
    [(AXPhoenixClassifier *)v35->_classifier setTapSpeed:v10];
    if (v35->_classifier)
    {
      v17 = [AXPhoenixMitigator alloc];
      id v16 = v35;
      v18 = [(AXPhoenixConfiguration *)v35->_configuration mitigatorConfiguration];
      uint64_t v11 = -[AXPhoenixMitigator initWithDelegate:configuration:](v17, "initWithDelegate:configuration:", v16);
      mitigator = v35->_mitigator;
      v35->_mitigator = (AXPhoenixMitigator *)v11;

      v20 = [AXPhoenixAnalytics alloc];
      v19 = v35->_configuration;
      id v21 = [(AXPhoenixClassifier *)v35->_classifier version];
      uint64_t v13 = -[AXPhoenixAnalytics initWithConfiguration:modelVersion:assetVersion:](v20, "initWithConfiguration:modelVersion:assetVersion:", v19);
      analytics = v35->_analytics;
      v35->_analytics = (AXPhoenixAnalytics *)v13;

      char v36 = 1;
      int v30 = 1;
    }
    else
    {
      id v29 = (id)AXLogBackTap();
      if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v37, (uint64_t)"-[AXPhoenixGestureDetector _initializeAssetDrivenComponentsWithLocalURL:assetVersion:]", (uint64_t)v33[0]);
        _os_log_error_impl(&dword_2372C8000, (os_log_t)v29, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Could not create classifier from %@. Classifier is nil.", v37, 0x16u);
      }
      objc_storeStrong(&v29, 0);
      char v36 = 0;
      int v30 = 1;
    }
  }
  else
  {
    id v32 = (id)AXLogBackTap();
    os_log_type_t v31 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v38, (uint64_t)"-[AXPhoenixGestureDetector _initializeAssetDrivenComponentsWithLocalURL:assetVersion:]");
      _os_log_error_impl(&dword_2372C8000, (os_log_t)v32, v31, "[PHOENIX] %s Could not create classifier model URL. Model URL is nil.", v38, 0xCu);
    }
    objc_storeStrong(&v32, 0);
    char v36 = 0;
    int v30 = 1;
  }
  objc_storeStrong(v33, 0);
  objc_storeStrong(location, 0);
  return v36 & 1;
}

- (void)startWithCompletion:(id)a3
{
  dispatch_queue_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4->_clientStartedMotion = 1;
  [(AXPhoenixGestureDetector *)v4 _startWithCompletion:location[0]];
  objc_storeStrong(location, 0);
}

- (void)_startWithCompletion:(id)a3
{
  uint64_t v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&v11, v13);
  queue = v13->_queue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __49__AXPhoenixGestureDetector__startWithCompletion___block_invoke;
  uint64_t v8 = &unk_264CCDFC8;
  objc_copyWeak(&v10, &v11);
  id v9 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v9, 0);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v11);
  objc_storeStrong(location, 0);
}

void __49__AXPhoenixGestureDetector__startWithCompletion___block_invoke(id *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v15[2] = a1;
  v15[1] = a1;
  v15[0] = objc_loadWeakRetained(a1 + 5);
  if (v15[0])
  {
    char v14 = 0;
    char v14 = [*((id *)v15[0] + 5) isRunning] & 1;
    if (v14)
    {
      os_log_t oslog = (os_log_t)(id)AXLogBackTap();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v18, (uint64_t)"-[AXPhoenixGestureDetector _startWithCompletion:]_block_invoke");
        _os_log_debug_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_DEBUG, "[PHOENIX] %s Phoenix mitigator already running, starting classifier", v18, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      [v15[0] _startClassifierWithCompletion:a1[4]];
    }
    else
    {
      int v5 = (void *)*((void *)v15[0] + 5);
      uint64_t v8 = MEMORY[0x263EF8330];
      int v9 = -1073741824;
      int v10 = 0;
      id v11 = __49__AXPhoenixGestureDetector__startWithCompletion___block_invoke_2;
      int v12 = &unk_264CCE278;
      id v13 = a1[4];
      [v5 startWithCompletion:&v8];
      objc_storeStrong(&v13, 0);
    }
  }
  else if (a1[4])
  {
    v2 = (void (**)(id, void))a1[4];
    v1 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F08320];
    v17 = @"Nil instance starting accel";
    id v4 = (id)[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v3 = (id)objc_msgSend(v1, "errorWithDomain:code:userInfo:", @"AXPhoenixErrorDomain", 1001);
    v2[2](v2, 0);
  }
  objc_storeStrong(v15, 0);
}

void __49__AXPhoenixGestureDetector__startWithCompletion___block_invoke_2(NSObject *a1, char a2, id obj)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v9 = a1;
  char v8 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  if (v8)
  {
    oslog[0] = (os_log_t)(id)AXLogBackTap();
    os_log_type_t type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v11, (uint64_t)"-[AXPhoenixGestureDetector _startWithCompletion:]_block_invoke_2");
      _os_log_debug_impl(&dword_2372C8000, oslog[0], type, "[PHOENIX] %s Phoenix mitigator started, classifier will start when the display turns on next", v11, 0xCu);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  else
  {
    os_log_t v4 = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v10, (uint64_t)"-[AXPhoenixGestureDetector _startWithCompletion:]_block_invoke", (uint64_t)location);
      _os_log_error_impl(&dword_2372C8000, v4, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Failed to start phoenix mitigator, error %@", v10, 0x16u);
    }
    objc_storeStrong((id *)&v4, 0);
  }
  (*((void (**)(void))a1[4].isa + 2))();
  objc_storeStrong(&location, 0);
}

- (void)stopWithCompletion:(id)a3
{
  os_log_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4->_clientStartedMotion = 0;
  [(AXPhoenixGestureDetector *)v4 _stopWithCompletion:location[0]];
  objc_storeStrong(location, 0);
}

- (void)_stopWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = (id)AXLogBackTap();
  os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v16, (uint64_t)"-[AXPhoenixGestureDetector _stopWithCompletion:]");
    _os_log_debug_impl(&dword_2372C8000, (os_log_t)v13, v12, "[PHOENIX] %s Stopping phoenix gesture detector...", v16, 0xCu);
  }
  objc_storeStrong(&v13, 0);
  objc_initWeak(&v11, v15);
  queue = v15->_queue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __48__AXPhoenixGestureDetector__stopWithCompletion___block_invoke;
  char v8 = &unk_264CCDFC8;
  objc_copyWeak(&v10, &v11);
  id v9 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v9, 0);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v11);
  objc_storeStrong(location, 0);
}

void __48__AXPhoenixGestureDetector__stopWithCompletion___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (location[0])
  {
    [location[0] _stopClassifier];
    if ((*((unsigned char *)location[0] + 80) & 1) == 0) {
      [*((id *)location[0] + 5) stop];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 32);
    v1 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F08320];
    v8[0] = @"Nil instance stopping accel";
    id v4 = (id)[NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
    id v3 = (id)objc_msgSend(v1, "errorWithDomain:code:userInfo:", @"AXPhoenixErrorDomain", 1002);
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)setDoubleTapPolicy
{
}

- (void)setTripleTapPolicy
{
}

- (void)setGeneralPolicy
{
}

- (void)setTapSpeed:(float)a3
{
  self->_tapSpeed = a3;
  *(float *)&double v3 = self->_tapSpeed;
  [(AXPhoenixClassifier *)self->_classifier setTapSpeed:v3];
}

- (void)_setPolicyOption:(int)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v11 = self;
  SEL v10 = a2;
  unsigned int v9 = a3;
  id v8 = (id)AXLogBackTap();
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    log = v8;
    os_log_type_t type = v7;
    int v5 = PolicyOptionToString_0(v9);
    int v6 = v5;
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v12, (uint64_t)"-[AXPhoenixGestureDetector _setPolicyOption:]", (uint64_t)v6);
    _os_log_impl(&dword_2372C8000, log, type, "[PHOENIX] %s Setting policy to %@", v12, 0x16u);

    objc_storeStrong((id *)&v6, 0);
  }
  objc_storeStrong(&v8, 0);
  [(AXPhoenixClassifier *)v11->_classifier setPolicyOption:v9];
}

- (id)_phoenixCompiledModelURL
{
  if (self->_rnnModelEnabled) {
    double v3 = @"BackTapRNN.mlmodelc";
  }
  else {
    double v3 = @"backtap.mlmodelc";
  }
  return v3;
}

- (id)urlOfModelInThisBundle
{
  id v8 = self;
  location[1] = (id)a2;
  id v4 = NSString;
  id v6 = (id)AXAccessibilityPrivateFrameworksDirectory();
  id v5 = [(AXPhoenixGestureDetector *)v8 _phoenixCompiledModelURL];
  location[0] = (id)[v4 stringWithFormat:@"%@/Phoenix.framework/%@", v6, v5];

  if (location[0]) {
    id v9 = (id)[NSURL fileURLWithPath:location[0]];
  }
  else {
    id v9 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v9;
  return v2;
}

- (id)_mobileAssetURLForModelOrNil
{
  localURL = self->_localURL;
  id v4 = [(AXPhoenixGestureDetector *)self _phoenixCompiledModelURL];
  id v5 = -[NSURL URLByAppendingPathComponent:](localURL, "URLByAppendingPathComponent:");

  return v5;
}

- (id)_mobileAssetPathForConfigOrNil
{
  double v3 = [(NSURL *)self->_localURL URLByAppendingPathComponent:@"backtap.json"];
  id v4 = [(NSURL *)v3 path];

  return v4;
}

- (id)_createConfiguration
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v34 = self;
  v33[1] = (id)a2;
  v33[0] = [(AXPhoenixGestureDetector *)self _mobileAssetPathForConfigOrNil];
  if (v33[0])
  {
    id v25 = [[AXPhoenixConfiguration alloc] initWithContentsOfFileAtPath:v33[0]];
    if (v25)
    {
      [v25 setConfigurationAssetVersion:v34->_assetVersion];
      os_log_t v19 = (os_log_t)(id)AXLogBackTap();
      os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v37, (uint64_t)"-[AXPhoenixGestureDetector _createConfiguration]", (uint64_t)v33[0]);
        _os_log_impl(&dword_2372C8000, v19, v18, "[PHOENIX] %s Successfully loaded configuration from %@. Using the following:", v37, 0x16u);
      }
      objc_storeStrong((id *)&v19, 0);
      os_log_t v17 = (os_log_t)(id)AXLogBackTap();
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v17;
        os_log_type_t v7 = v16;
        id v8 = (id)[v25 toStringifiedJSON];
        id v15 = v8;
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v36, (uint64_t)"-[AXPhoenixGestureDetector _createConfiguration]", (uint64_t)v15);
        _os_log_impl(&dword_2372C8000, v6, v7, "[PHOENIX] %s %@", v36, 0x16u);

        objc_storeStrong(&v15, 0);
      }
      objc_storeStrong((id *)&v17, 0);
      id v35 = v25;
      int v26 = 1;
    }
    else
    {
      os_log_t v24 = (os_log_t)(id)AXLogBackTap();
      os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v39, (uint64_t)"-[AXPhoenixGestureDetector _createConfiguration]", (uint64_t)v33[0]);
        _os_log_impl(&dword_2372C8000, v24, v23, "[PHOENIX] %s Could not initialize configuration from %@. Using default configuration.", v39, 0x16u);
      }
      objc_storeStrong((id *)&v24, 0);
      uint64_t v2 = objc_alloc_init(AXPhoenixConfiguration);
      id v3 = v25;
      id v25 = v2;

      [v25 setConfigurationAssetVersion:0];
      os_log_t v22 = (os_log_t)(id)AXLogBackTap();
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = v22;
        os_log_type_t v10 = v21;
        id v11 = (id)[v25 toStringifiedJSON];
        id v20 = v11;
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v38, (uint64_t)"-[AXPhoenixGestureDetector _createConfiguration]", (uint64_t)v20);
        _os_log_impl(&dword_2372C8000, v9, v10, "[PHOENIX] %s %@", v38, 0x16u);

        objc_storeStrong(&v20, 0);
      }
      objc_storeStrong((id *)&v22, 0);
      id v35 = v25;
      int v26 = 1;
    }
    objc_storeStrong(&v25, 0);
  }
  else
  {
    id location = (id)AXLogBackTap();
    os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v41, (uint64_t)"-[AXPhoenixGestureDetector _createConfiguration]");
      _os_log_impl(&dword_2372C8000, (os_log_t)location, v31, "[PHOENIX] %s Could not retrieve configuration path from mobile assets url. Using default configuration.", v41, 0xCu);
    }
    objc_storeStrong(&location, 0);
    id v30 = objc_alloc_init(AXPhoenixConfiguration);
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v12 = oslog;
      os_log_type_t v13 = v28;
      id v14 = (id)[v30 toStringifiedJSON];
      id v27 = v14;
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v40, (uint64_t)"-[AXPhoenixGestureDetector _createConfiguration]", (uint64_t)v27);
      _os_log_impl(&dword_2372C8000, v12, v13, "[PHOENIX] %s %@", v40, 0x16u);

      objc_storeStrong(&v27, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v35 = v30;
    int v26 = 1;
    objc_storeStrong(&v30, 0);
  }
  objc_storeStrong(v33, 0);
  id v4 = v35;
  return v4;
}

- (id)_createClassifierModelURL
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  os_log_t v17 = self;
  v16[1] = (id)a2;
  v16[0] = [(AXPhoenixGestureDetector *)self _mobileAssetURLForModelOrNil];
  id v15 = 0;
  if (!v16[0]
    || (id v14 = v15,
        char v9 = [v16[0] checkResourceIsReachableAndReturnError:&v14],
        objc_storeStrong(&v15, v14),
        (v9 & 1) != 0))
  {
    if (!v16[0])
    {
      id v4 = [(AXPhoenixGestureDetector *)v17 urlOfModelInThisBundle];
      id v5 = v16[0];
      v16[0] = v4;

      id v13 = (id)AXLogBackTap();
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v20, (uint64_t)"-[AXPhoenixGestureDetector _createClassifierModelURL]", (uint64_t)v16[0]);
        _os_log_impl(&dword_2372C8000, (os_log_t)v13, v12, "[PHOENIX] %s MobileAsset URL is nil, so using default %@", v20, 0x16u);
      }
      objc_storeStrong(&v13, 0);
    }
  }
  else
  {
    id v2 = [(AXPhoenixGestureDetector *)v17 urlOfModelInThisBundle];
    id v3 = v16[0];
    v16[0] = v2;
  }
  id obj = v15;
  char v8 = [v16[0] checkResourceIsReachableAndReturnError:&obj];
  objc_storeStrong(&v15, obj);
  if (v8)
  {
    id v18 = v16[0];
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v19, (uint64_t)"-[AXPhoenixGestureDetector _createClassifierModelURL]", (uint64_t)v16[0]);
      _os_log_error_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Model doesn't exist at %@", v19, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v18 = 0;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
  id v6 = v18;
  return v6;
}

- (BOOL)needsToUpdateModelToVersion:(int64_t)a3
{
  return a3 > self->_assetVersion;
}

- (void)_startClassifierWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v24 = (id)AXLogBackTap();
  os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v27, (uint64_t)"-[AXPhoenixGestureDetector _startClassifierWithCompletion:]");
    _os_log_impl(&dword_2372C8000, (os_log_t)v24, v23, "[PHOENIX] %s Starting device motion updates...", v27, 0xCu);
  }
  objc_storeStrong(&v24, 0);
  dispatch_assert_queue_V2((dispatch_queue_t)v26->_queue);
  [(AXPhoenixClassifier *)v26->_classifier reset];
  char v8 = (CMMotionManager *)objc_alloc_init(MEMORY[0x263F01788]);
  cmMotionManager = v26->_cmMotionManager;
  v26->_cmMotionManager = v8;

  unint64_t v22 = 0;
  id v6 = [(AXPhoenixClassifier *)v26->_classifier configuration];
  unint64_t v7 = [v6 accelerometerSampleRateInHz];

  unint64_t v22 = v7;
  double v21 = 1.0 / (double)v7;
  v17[0] = 0;
  v17[1] = v17;
  int v18 = 0x20000000;
  int v19 = 32;
  char v20 = 0;
  objc_initWeak(&from, v26);
  [(CMMotionManager *)v26->_cmMotionManager setDeviceMotionUpdateInterval:v21];
  id v4 = v26->_cmMotionManager;
  motionInputQueue = v26->_motionInputQueue;
  uint64_t v9 = MEMORY[0x263EF8330];
  int v10 = -1073741824;
  int v11 = 0;
  os_log_type_t v12 = __59__AXPhoenixGestureDetector__startClassifierWithCompletion___block_invoke;
  id v13 = &unk_264CCE2C8;
  objc_copyWeak(v15, &from);
  v14[0] = location[0];
  v14[1] = v17;
  [(CMMotionManager *)v4 startDeviceMotionUpdatesToQueue:motionInputQueue withHandler:&v9];
  objc_storeStrong(v14, 0);
  objc_destroyWeak(v15);
  objc_destroyWeak(&from);
  _Block_object_dispose(v17, 8);
  objc_storeStrong(location, 0);
}

void __59__AXPhoenixGestureDetector__startClassifierWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v26 = 0;
  objc_storeStrong(&v26, a3);
  v25[1] = (id)a1;
  v25[0] = objc_loadWeakRetained((id *)(a1 + 48));
  if (v25[0])
  {
    if (v26)
    {
      id v24 = (id)AXLogBackTap();
      os_log_type_t v23 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v30, (uint64_t)"-[AXPhoenixGestureDetector _startClassifierWithCompletion:]_block_invoke", (uint64_t)v26);
        _os_log_error_impl(&dword_2372C8000, (os_log_t)v24, v23, "[PHOENIX] %s Phoenix gesture detector error %@", v30, 0x16u);
      }
      objc_storeStrong(&v24, 0);
      [*((id *)v25[0] + 4) phoenixGestureDetector:v25[0] stoppedWithError:v26];
      id v8 = v25[0];
      uint64_t v17 = MEMORY[0x263EF8330];
      int v18 = -1073741824;
      int v19 = 0;
      char v20 = __59__AXPhoenixGestureDetector__startClassifierWithCompletion___block_invoke_40;
      double v21 = &unk_264CCE2A0;
      id v22 = v26;
      [v8 stopWithCompletion:&v17];
      if (*(void *)(a1 + 32)) {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      objc_storeStrong(&v22, 0);
    }
    else
    {
      if ((*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) & 1) == 0)
      {
        id v16 = (id)AXLogBackTap();
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v29, (uint64_t)"-[AXPhoenixGestureDetector _startClassifierWithCompletion:]_block_invoke");
          _os_log_impl(&dword_2372C8000, (os_log_t)v16, v15, "[PHOENIX] %s Received device motion update. Processing...", v29, 0xCu);
        }
        objc_storeStrong(&v16, 0);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        if (*(void *)(a1 + 32)) {
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        }
      }
      unint64_t v7 = (void *)*((void *)v25[0] + 3);
      [location[0] userAcceleration];
      double v12 = v3;
      double v13 = v4;
      double v14 = v5;
      [location[0] timestamp];
      objc_msgSend(v7, "handleAccelerometerData:withTimestamp:", v12, v13, v14, v6);
    }
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v28, (uint64_t)"-[AXPhoenixGestureDetector _startClassifierWithCompletion:]_block_invoke");
      _os_log_error_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s strongself is nil!!!", v28, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

void __59__AXPhoenixGestureDetector__startClassifierWithCompletion___block_invoke_40(uint64_t a1, char a2, id obj)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v8 = a1;
  char v7 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
  {
    if (v7) {
      double v3 = @"Stopped";
    }
    else {
      double v3 = @"Error stopping";
    }
    __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v9, (uint64_t)"-[AXPhoenixGestureDetector _startClassifierWithCompletion:]_block_invoke", (uint64_t)v3, *(void *)(a1 + 32));
    _os_log_error_impl(&dword_2372C8000, oslog[0], OS_LOG_TYPE_ERROR, "[PHOENIX] %s %@ device motion updates after error %@", v9, 0x20u);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong(&location, 0);
}

- (void)_stopClassifier
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  double v3 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v4, (uint64_t)"-[AXPhoenixGestureDetector _stopClassifier]");
    _os_log_impl(&dword_2372C8000, oslog[0], OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Stopping Accel updates", v4, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  dispatch_assert_queue_V2((dispatch_queue_t)v3->_queue);
  if (v3->_cmMotionManager) {
    [(CMMotionManager *)v3->_cmMotionManager stopDeviceMotionUpdates];
  }
  [(AXPhoenixClassifier *)v3->_classifier reset];
  objc_storeStrong((id *)&v3->_cmMotionManager, 0);
}

- (void)setFalsePositiveLoggingEnabled:(BOOL)a3
{
  BOOL v8 = a3;
  self->_falsePositiveLoggingEnabled = a3;
  [(AXPhoenixClassifier *)self->_classifier setFalsePositiveLoggingEnabled:a3];
  char v6 = 0;
  LOBYTE(v5) = 0;
  if (v8)
  {
    char v7 = +[AXPhoenixDataCollectionManager sharedInstance];
    char v6 = 1;
    int v5 = ![(AXPhoenixDataCollectionManager *)v7 isRunning];
  }
  if (v6) {

  }
  if (v5)
  {
    double v4 = +[AXPhoenixDataCollectionManager sharedInstance];
    [(AXPhoenixDataCollectionManager *)v4 start];
  }
  else if (!v8)
  {
    double v3 = +[AXPhoenixDataCollectionManager sharedInstance];
    [(AXPhoenixDataCollectionManager *)v3 stop];
  }
}

- (void)setRnnModelEnabled:(BOOL)a3
{
  double v14 = self;
  SEL v13 = a2;
  BOOL v12 = a3;
  if (a3 != self->_rnnModelEnabled)
  {
    v14->_rnnModelEnabled = v12;
    objc_initWeak(&location, v14);
    queue = v14->_queue;
    uint64_t v4 = MEMORY[0x263EF8330];
    int v5 = -1073741824;
    int v6 = 0;
    char v7 = __47__AXPhoenixGestureDetector_setRnnModelEnabled___block_invoke;
    BOOL v8 = &unk_264CCE318;
    objc_copyWeak(&v10, &location);
    uint64_t v9 = v14;
    dispatch_async(queue, &v4);
    objc_storeStrong((id *)&v9, 0);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __47__AXPhoenixGestureDetector_setRnnModelEnabled___block_invoke(id *a1)
{
  v10[2] = a1;
  v10[1] = a1;
  v10[0] = objc_loadWeakRetained(a1 + 5);
  if (v10[0])
  {
    id v1 = v10[0];
    uint64_t v3 = MEMORY[0x263EF8330];
    int v4 = -1073741824;
    int v5 = 0;
    int v6 = __47__AXPhoenixGestureDetector_setRnnModelEnabled___block_invoke_2;
    char v7 = &unk_264CCE2F0;
    id v8 = v10[0];
    id v9 = a1[4];
    [v1 _stopWithCompletion:&v3];
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(v10, 0);
}

void __47__AXPhoenixGestureDetector_setRnnModelEnabled___block_invoke_2(id *a1, char a2, id obj)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v25 = a1;
  char v24 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v22[1] = a1;
  if ((v24 & 1) == 0)
  {
    v22[0] = (id)AXLogBackTap();
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v22[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v29, (uint64_t)"-[AXPhoenixGestureDetector setRnnModelEnabled:]_block_invoke_2", (uint64_t)location);
      _os_log_error_impl(&dword_2372C8000, (os_log_t)v22[0], v21, "[PHOENIX] %s Unable to stop phoenix gesture detector before restarting: %@", v29, 0x16u);
    }
    objc_storeStrong(v22, 0);
  }
  char v20 = 0;
  char v20 = [a1[4] _initializeAssetDrivenComponentsWithLocalURL:0 assetVersion:_currentAssetVersion] & 1;
  if (v20)
  {
    if (*((unsigned char *)a1[4] + 80))
    {
      id v3 = a1[4];
      uint64_t v10 = MEMORY[0x263EF8330];
      int v11 = -1073741824;
      int v12 = 0;
      SEL v13 = __47__AXPhoenixGestureDetector_setRnnModelEnabled___block_invoke_53;
      double v14 = &unk_264CCE2F0;
      id v15 = a1[4];
      id v16 = a1[5];
      [v3 _startWithCompletion:&v10];
      objc_storeStrong(&v16, 0);
      objc_storeStrong(&v15, 0);
    }
  }
  else
  {
    id v19 = (id)AXLogBackTap();
    os_log_type_t v18 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v28, (uint64_t)"-[AXPhoenixGestureDetector setRnnModelEnabled:]_block_invoke");
      _os_log_error_impl(&dword_2372C8000, (os_log_t)v19, v18, "[PHOENIX] %s Failed to re-initialize Phoenix after model changed", v28, 0xCu);
    }
    objc_storeStrong(&v19, 0);
    id v17 = (id)[NSString stringWithFormat:@"Failed to reinitialize asset driven components of Phoenix from model change"];
    int v6 = (void *)*((void *)a1[4] + 4);
    id v5 = a1[4];
    int v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08320];
    id v27 = v17;
    id v8 = (id)[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    id v7 = (id)objc_msgSend(v4, "errorWithDomain:code:userInfo:", @"AXPhoenixErrorDomain", 1004);
    objc_msgSend(v6, "phoenixGestureDetector:failedWithError:", v5);

    objc_storeStrong(&v17, 0);
  }
  objc_storeStrong(&location, 0);
}

void __47__AXPhoenixGestureDetector_setRnnModelEnabled___block_invoke_53(void *a1, char a2, id obj)
{
  v16[1] = *MEMORY[0x263EF8340];
  SEL v13 = a1;
  char v12 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v10[1] = a1;
  if (v12)
  {
    id v9 = (id)AXLogBackTap();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v14, (uint64_t)"-[AXPhoenixGestureDetector setRnnModelEnabled:]_block_invoke");
      _os_log_impl(&dword_2372C8000, (os_log_t)v9, OS_LOG_TYPE_INFO, "[PHOENIX] %s Successfully restarted the phoenix gesture detector with new assets.", v14, 0xCu);
    }
    objc_storeStrong(&v9, 0);
  }
  else
  {
    v10[0] = (id)[NSString stringWithFormat:@"Failed to start Phoenix classifier from model change"];
    id v5 = *(void **)(a1[4] + 32);
    uint64_t v4 = a1[5];
    id v3 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08320];
    v16[0] = v10[0];
    id v7 = (id)[NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v6 = (id)objc_msgSend(v3, "errorWithDomain:code:userInfo:", @"AXPhoenixErrorDomain", 1004);
    objc_msgSend(v5, "phoenixGestureDetector:failedWithError:", v4);

    objc_storeStrong(v10, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)reportFalsePositive:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[AXPhoenixDataCollectionManager sharedInstance];
  [(AXPhoenixDataCollectionManager *)v3 reportFalsePositive:location[0]];

  objc_storeStrong(location, 0);
}

- (void)phoenixClassifier:(id)a3 failedWithError:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  objc_initWeak(&v13, v16);
  queue = v16->_queue;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __62__AXPhoenixGestureDetector_phoenixClassifier_failedWithError___block_invoke;
  uint64_t v10 = &unk_264CCE318;
  objc_copyWeak(&v12, &v13);
  id v11 = v14;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v11, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v13);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __62__AXPhoenixGestureDetector_phoenixClassifier_failedWithError___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v11[2] = (id)a1;
  v11[1] = (id)a1;
  v11[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v11[0])
  {
    id location = (id)AXLogBackTap();
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v12, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifier:failedWithError:]_block_invoke", *(void *)(a1 + 32));
      _os_log_error_impl(&dword_2372C8000, (os_log_t)location, v9, "[PHOENIX] %s MotionClassifier failed with error: %@", v12, 0x16u);
    }
    objc_storeStrong(&location, 0);
    [*((id *)v11[0] + 4) phoenixGestureDetector:v11[0] failedWithError:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 32))
    {
      id v1 = v11[0];
      uint64_t v3 = MEMORY[0x263EF8330];
      int v4 = -1073741824;
      int v5 = 0;
      uint64_t v6 = __62__AXPhoenixGestureDetector_phoenixClassifier_failedWithError___block_invoke_57;
      int v7 = &unk_264CCE2A0;
      id v8 = *(id *)(a1 + 32);
      [v1 stopWithCompletion:&v3];
      objc_storeStrong(&v8, 0);
    }
  }
  objc_storeStrong(v11, 0);
}

void __62__AXPhoenixGestureDetector_phoenixClassifier_failedWithError___block_invoke_57(uint64_t a1, char a2, id obj)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v9 = a1;
  char v8 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = (os_log_t)a1;
  if (v8)
  {
    oslog[0] = (os_log_t)(id)AXLogBackTap();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v11, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifier:failedWithError:]_block_invoke", *(void *)(a1 + 32));
      _os_log_impl(&dword_2372C8000, oslog[0], type, "[PHOENIX] %s Stopped phoenix gesture detector on classifier error: %@", v11, 0x16u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  else
  {
    os_log_t v4 = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v10, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifier:failedWithError:]_block_invoke", *(void *)(a1 + 32), (uint64_t)location);
      _os_log_error_impl(&dword_2372C8000, v4, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Failed to stop phoenix gesture detector after classifier error %@, with error %@", v10, 0x20u);
    }
    objc_storeStrong((id *)&v4, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)phoenixClassifierDidDetectDoubleTap:(id)a3 data:(id)a4 context:(id)a5
{
  *(double *)&long long v20 = a4.var0;
  *((void *)&v20 + 1) = *(void *)&a4.var1;
  *(double *)&long long v21 = a4.var2;
  *((void *)&v21 + 1) = *(void *)&a4.var3;
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a5);
  objc_initWeak(&v16, v19);
  queue = v19->_queue;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  uint64_t v10 = __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectDoubleTap_data_context___block_invoke;
  id v11 = &unk_264CCE388;
  objc_copyWeak(&v13, &v16);
  long long v14 = v20;
  long long v15 = v21;
  id v12 = v17;
  dispatch_async(queue, &v7);
  objc_storeStrong(&v12, 0);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectDoubleTap_data_context___block_invoke(uint64_t a1)
{
  v11[2] = (id)a1;
  v11[1] = (id)a1;
  v11[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v11[0])
  {
    uint64_t v10 = (void *)mach_absolute_time();
    id v1 = (void *)*((void *)v11[0] + 5);
    uint64_t v3 = MEMORY[0x263EF8330];
    int v4 = -1073741824;
    int v5 = 0;
    uint64_t v6 = __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectDoubleTap_data_context___block_invoke_2;
    uint64_t v7 = &unk_264CCE360;
    id v8 = *(id *)(a1 + 32);
    v9[0] = v11[0];
    v9[1] = v10;
    objc_msgSend(v1, "shouldTriggerDoubleTapEventWithTapData:completion:", &v3, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    objc_storeStrong(v9, 0);
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(v11, 0);
}

void __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectDoubleTap_data_context___block_invoke_2(void *a1, char a2, id obj, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v14 = a1;
  char v13 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  v10[1] = a1;
  id v4 = objc_alloc(MEMORY[0x263EFF9A0]);
  v10[0] = (id)[v4 initWithDictionary:location];
  [v10[0] addEntriesFromDictionary:a1[4]];
  objc_storeStrong(&location, v10[0]);
  if (v13)
  {
    id v9 = (id)AXLogBackTap();
    os_log_type_t v8 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v16, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifierDidDetectDoubleTap:data:context:]_block_invoke_2");
      _os_log_impl(&dword_2372C8000, (os_log_t)v9, v8, "[PHOENIX] %s Double tap detected", v16, 0xCu);
    }
    objc_storeStrong(&v9, 0);
    [*(id *)(a1[5] + 32) phoenixGestureDetectorDidDetectDoubleTap:a1[5]];
    [*(id *)(a1[5] + 56) logEventWithType:1 machAbsoluteTime:a1[6] context:location completion:&__block_literal_global_1];
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v15, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifierDidDetectDoubleTap:data:context:]_block_invoke", (uint64_t)v11);
      _os_log_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Double tap was mitigated. %@", v15, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [*(id *)(a1[5] + 56) logEventWithType:2 machAbsoluteTime:a1[6] context:location completion:&__block_literal_global_62];
  }
  [*(id *)(a1[5] + 24) setShouldResetBuffer];
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
}

void __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectDoubleTap_data_context___block_invoke_59(NSObject *a1, char a2, id obj)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v7 = a1;
  char v6 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  if ((v6 & 1) == 0)
  {
    oslog[0] = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v8, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifierDidDetectDoubleTap:data:context:]_block_invoke", (uint64_t)location);
      _os_log_error_impl(&dword_2372C8000, oslog[0], OS_LOG_TYPE_ERROR, "[PHOENIX] %s Error creating AXPhoenixAnalyticsEventTypeDoubleTap: %@", v8, 0x16u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  objc_storeStrong(&location, 0);
}

void __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectDoubleTap_data_context___block_invoke_60(NSObject *a1, char a2, id obj)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v7 = a1;
  char v6 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  if ((v6 & 1) == 0)
  {
    oslog[0] = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v8, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifierDidDetectDoubleTap:data:context:]_block_invoke", (uint64_t)location);
      _os_log_error_impl(&dword_2372C8000, oslog[0], OS_LOG_TYPE_ERROR, "[PHOENIX] %s Error creating AXPhoenixAnalyticsEventTypeDoubleTapMitigated: %@", v8, 0x16u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)phoenixClassifierDidDetectTripleTap:(id)a3 data:(id)a4 context:(id)a5
{
  *(double *)&long long v20 = a4.var0;
  *((void *)&v20 + 1) = *(void *)&a4.var1;
  *(double *)&long long v21 = a4.var2;
  *((void *)&v21 + 1) = *(void *)&a4.var3;
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a5);
  objc_initWeak(&v16, v19);
  queue = v19->_queue;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  uint64_t v10 = __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectTripleTap_data_context___block_invoke;
  id v11 = &unk_264CCE388;
  objc_copyWeak(&v13, &v16);
  long long v14 = v20;
  long long v15 = v21;
  id v12 = v17;
  dispatch_async(queue, &v7);
  objc_storeStrong(&v12, 0);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectTripleTap_data_context___block_invoke(uint64_t a1)
{
  v11[2] = (id)a1;
  v11[1] = (id)a1;
  v11[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v11[0])
  {
    uint64_t v10 = (void *)mach_absolute_time();
    id v1 = (void *)*((void *)v11[0] + 5);
    uint64_t v3 = MEMORY[0x263EF8330];
    int v4 = -1073741824;
    int v5 = 0;
    char v6 = __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectTripleTap_data_context___block_invoke_2;
    uint64_t v7 = &unk_264CCE360;
    id v8 = *(id *)(a1 + 32);
    v9[0] = v11[0];
    v9[1] = v10;
    objc_msgSend(v1, "shouldTriggerTripleTapEventWithTapData:completion:", &v3, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    objc_storeStrong(v9, 0);
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(v11, 0);
}

void __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectTripleTap_data_context___block_invoke_2(void *a1, char a2, id obj, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v14 = a1;
  char v13 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  v10[1] = a1;
  id v4 = objc_alloc(MEMORY[0x263EFF9A0]);
  v10[0] = (id)[v4 initWithDictionary:location];
  [v10[0] addEntriesFromDictionary:a1[4]];
  objc_storeStrong(&location, v10[0]);
  if (v13)
  {
    id v9 = (id)AXLogBackTap();
    os_log_type_t v8 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v16, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifierDidDetectTripleTap:data:context:]_block_invoke_2");
      _os_log_impl(&dword_2372C8000, (os_log_t)v9, v8, "[PHOENIX] %s Triple tap detected", v16, 0xCu);
    }
    objc_storeStrong(&v9, 0);
    [*(id *)(a1[5] + 32) phoenixGestureDetectorDidDetectTripleTap:a1[5]];
    [*(id *)(a1[5] + 56) logEventWithType:3 machAbsoluteTime:a1[6] context:location completion:&__block_literal_global_66];
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v15, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifierDidDetectTripleTap:data:context:]_block_invoke", (uint64_t)v11);
      _os_log_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Triple tap was mitigated. %@", v15, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [*(id *)(a1[5] + 56) logEventWithType:4 machAbsoluteTime:a1[6] context:location completion:&__block_literal_global_69];
  }
  [*(id *)(a1[5] + 24) setShouldResetBuffer];
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
}

void __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectTripleTap_data_context___block_invoke_64(NSObject *a1, char a2, id obj)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v7 = a1;
  char v6 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  if ((v6 & 1) == 0)
  {
    oslog[0] = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v8, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifierDidDetectTripleTap:data:context:]_block_invoke", (uint64_t)location);
      _os_log_error_impl(&dword_2372C8000, oslog[0], OS_LOG_TYPE_ERROR, "[PHOENIX] %s Error creating AXPhoenixAnalyticsEventTypeTripleTap: %@", v8, 0x16u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  objc_storeStrong(&location, 0);
}

void __77__AXPhoenixGestureDetector_phoenixClassifierDidDetectTripleTap_data_context___block_invoke_67(NSObject *a1, char a2, id obj)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v7 = a1;
  char v6 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  if ((v6 & 1) == 0)
  {
    oslog[0] = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v8, (uint64_t)"-[AXPhoenixGestureDetector phoenixClassifierDidDetectTripleTap:data:context:]_block_invoke", (uint64_t)location);
      _os_log_error_impl(&dword_2372C8000, oslog[0], OS_LOG_TYPE_ERROR, "[PHOENIX] %s Error creating AXPhoenixAnalyticsEventTypeTripleTapMitigated: %@", v8, 0x16u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)phoenixClassifierDidLogFile:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(AXPhoenixGestureDetectorDelegate *)v4->_delegate conformsToProtocol:&unk_26EA489A8]) {
    [(AXPhoenixGestureDetectorDelegate *)v4->_delegate phoenixClassifierDidLogFile:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)phoenixMitigator:(id)a3 didFailWithError:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  os_log_type_t v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = (id)AXLogBackTap();
  os_log_type_t v14 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v19, (uint64_t)"-[AXPhoenixGestureDetector phoenixMitigator:didFailWithError:]", (uint64_t)v16);
    _os_log_error_impl(&dword_2372C8000, (os_log_t)v15, v14, "[PHOENIX] %s Mitigation error: %@", v19, 0x16u);
  }
  objc_storeStrong(&v15, 0);
  objc_initWeak(&v13, v18);
  queue = v18->_queue;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __62__AXPhoenixGestureDetector_phoenixMitigator_didFailWithError___block_invoke;
  uint64_t v10 = &unk_264CCE318;
  objc_copyWeak(&v12, &v13);
  id v11 = v16;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v11, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v13);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

void __62__AXPhoenixGestureDetector_phoenixMitigator_didFailWithError___block_invoke(uint64_t a1)
{
  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = objc_loadWeakRetained((id *)(a1 + 40));
  [*((id *)v2[0] + 4) phoenixGestureDetector:v2[0] failedWithError:*(void *)(a1 + 32)];
  objc_storeStrong(v2, 0);
}

- (void)phoenixMitigator:(id)a3 displayOnDidChange:(BOOL)a4
{
  uint64_t v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v15 = a4;
  objc_initWeak(&v14, v17);
  queue = v17->_queue;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __64__AXPhoenixGestureDetector_phoenixMitigator_displayOnDidChange___block_invoke;
  uint64_t v10 = &unk_264CCE3B0;
  objc_copyWeak(&v12, &v14);
  BOOL v13 = v15;
  id v11 = v17;
  dispatch_async(queue, &v6);
  objc_storeStrong((id *)&v11, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_storeStrong(location, 0);
}

void __64__AXPhoenixGestureDetector_phoenixMitigator_displayOnDidChange___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v22[2] = (id)a1;
  v22[1] = (id)a1;
  v22[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v22[0] && (*((unsigned char *)v22[0] + 80) & 1) != 0)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      id location = (id)AXLogBackTap();
      os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v24, (uint64_t)"-[AXPhoenixGestureDetector phoenixMitigator:displayOnDidChange:]_block_invoke");
        _os_log_debug_impl(&dword_2372C8000, (os_log_t)location, v20, "[PHOENIX] %s Got display on, starting classifier", v24, 0xCu);
      }
      objc_storeStrong(&location, 0);
      id v2 = v22[0];
      uint64_t v13 = MEMORY[0x263EF8330];
      int v14 = -1073741824;
      int v15 = 0;
      id v16 = __64__AXPhoenixGestureDetector_phoenixMitigator_displayOnDidChange___block_invoke_122;
      uint64_t v17 = &unk_264CCE2F0;
      id v18 = v22[0];
      id v19 = *(id *)(a1 + 32);
      [v2 _startWithCompletion:&v13];
      objc_storeStrong(&v19, 0);
      objc_storeStrong(&v18, 0);
    }
    else
    {
      id v12 = (id)AXLogBackTap();
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v23, (uint64_t)"-[AXPhoenixGestureDetector phoenixMitigator:displayOnDidChange:]_block_invoke");
        _os_log_debug_impl(&dword_2372C8000, (os_log_t)v12, v11, "[PHOENIX] %s Got display off, stop classifier", v23, 0xCu);
      }
      objc_storeStrong(&v12, 0);
      id v1 = v22[0];
      uint64_t v4 = MEMORY[0x263EF8330];
      int v5 = -1073741824;
      int v6 = 0;
      int v7 = __64__AXPhoenixGestureDetector_phoenixMitigator_displayOnDidChange___block_invoke_123;
      int v8 = &unk_264CCE2F0;
      id v9 = v22[0];
      id v10 = *(id *)(a1 + 32);
      [v1 _stopWithCompletion:&v4];
      objc_storeStrong(&v10, 0);
      objc_storeStrong(&v9, 0);
    }
  }
  objc_storeStrong(v22, 0);
}

void __64__AXPhoenixGestureDetector_phoenixMitigator_displayOnDidChange___block_invoke_122(void *a1, char a2, id obj)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v9 = a1;
  char v8 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v6[1] = a1;
  if (v8)
  {
    v6[0] = (id)AXLogBackTap();
    os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v6[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v11, (uint64_t)"-[AXPhoenixGestureDetector phoenixMitigator:displayOnDidChange:]_block_invoke");
      _os_log_impl(&dword_2372C8000, (os_log_t)v6[0], v5, "[PHOENIX] %s Classifier started when display turned on", v11, 0xCu);
    }
    objc_storeStrong(v6, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v10, (uint64_t)"-[AXPhoenixGestureDetector phoenixMitigator:displayOnDidChange:]_block_invoke");
      _os_log_error_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Classifier failed to run when display turned on", v10, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [*(id *)(a1[4] + 32) phoenixGestureDetector:a1[5] failedWithError:location];
  }
  objc_storeStrong(&location, 0);
}

void __64__AXPhoenixGestureDetector_phoenixMitigator_displayOnDidChange___block_invoke_123(void *a1, char a2, id obj)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v9 = a1;
  char v8 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v6[1] = a1;
  if (v8)
  {
    v6[0] = (id)AXLogBackTap();
    os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v6[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v11, (uint64_t)"-[AXPhoenixGestureDetector phoenixMitigator:displayOnDidChange:]_block_invoke");
      _os_log_impl(&dword_2372C8000, (os_log_t)v6[0], v5, "[PHOENIX] %s Classifier stopped when display turned off", v11, 0xCu);
    }
    objc_storeStrong(v6, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v10, (uint64_t)"-[AXPhoenixGestureDetector phoenixMitigator:displayOnDidChange:]_block_invoke");
      _os_log_error_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Classifier failed to stop when display turned off", v10, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [*(id *)(a1[4] + 32) phoenixGestureDetector:a1[5] failedWithError:location];
  }
  objc_storeStrong(&location, 0);
}

- (void)phoenixMitigator:(id)a3 touchOnDidChange:(BOOL)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v14 = a4;
  objc_initWeak(&v13, v16);
  queue = v16->_queue;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __62__AXPhoenixGestureDetector_phoenixMitigator_touchOnDidChange___block_invoke;
  id v10 = &unk_264CCE3D8;
  objc_copyWeak(&v11, &v13);
  BOOL v12 = v14;
  dispatch_async(queue, &v6);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_storeStrong(location, 0);
}

void __62__AXPhoenixGestureDetector_phoenixMitigator_touchOnDidChange___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 32));
  if (location[0] && (*(unsigned char *)(a1 + 40) & 1) != 0)
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v4, (uint64_t)"-[AXPhoenixGestureDetector phoenixMitigator:touchOnDidChange:]_block_invoke");
      _os_log_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_INFO, "[PHOENIX] %s Reset buffer on touchOn", v4, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [*((id *)location[0] + 3) setShouldResetBuffer];
  }
  objc_storeStrong(location, 0);
}

- (void)modelDidUpdate:(id)a3 assetVersion:(unint64_t)a4
{
  uint64_t v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v15 = (void *)a4;
  objc_initWeak(&v14, v17);
  queue = v17->_queue;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __56__AXPhoenixGestureDetector_modelDidUpdate_assetVersion___block_invoke;
  id v10 = &unk_264CCE450;
  objc_copyWeak(v13, &v14);
  id v11 = location[0];
  BOOL v12 = v17;
  v13[1] = v15;
  dispatch_async(queue, &v6);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_destroyWeak(v13);
  objc_destroyWeak(&v14);
  objc_storeStrong(location, 0);
}

void __56__AXPhoenixGestureDetector_modelDidUpdate_assetVersion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v15[2] = (id)a1;
  v15[1] = (id)a1;
  v15[0] = objc_loadWeakRetained((id *)(a1 + 48));
  if (v15[0]
    && *(void *)(a1 + 32)
    && ([*(id *)(a1 + 40) needsToUpdateModelToVersion:*(void *)(a1 + 56)] & 1) != 0)
  {
    id location = (id)AXLogBackTap();
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v17, (uint64_t)"-[AXPhoenixGestureDetector modelDidUpdate:assetVersion:]_block_invoke", *(void *)(a1 + 32));
      _os_log_impl(&dword_2372C8000, (os_log_t)location, v13, "[PHOENIX] %s Phoenix gesture detector needs to update with new assets at URL: %@", v17, 0x16u);
    }
    objc_storeStrong(&location, 0);
    id v12 = (id)AXLogBackTap();
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v16, (uint64_t)"-[AXPhoenixGestureDetector modelDidUpdate:assetVersion:]_block_invoke");
      _os_log_impl(&dword_2372C8000, (os_log_t)v12, v11, "[PHOENIX] %s Attempting to restart the phoenix gesture detector...", v16, 0xCu);
    }
    objc_storeStrong(&v12, 0);
    id v1 = v15[0];
    uint64_t v3 = MEMORY[0x263EF8330];
    int v4 = -1073741824;
    int v5 = 0;
    uint64_t v6 = __56__AXPhoenixGestureDetector_modelDidUpdate_assetVersion___block_invoke_124;
    int v7 = &unk_264CCE428;
    id v8 = v15[0];
    id v9 = *(id *)(a1 + 32);
    v10[1] = *(id *)(a1 + 56);
    v10[0] = *(id *)(a1 + 40);
    [v1 _stopWithCompletion:&v3];
    objc_storeStrong(v10, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(v15, 0);
}

void __56__AXPhoenixGestureDetector_modelDidUpdate_assetVersion___block_invoke_124(uint64_t a1, char a2, id obj)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v26 = a1;
  char v25 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v23[1] = (id)a1;
  if ((v25 & 1) == 0)
  {
    v23[0] = (id)AXLogBackTap();
    os_log_type_t v22 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v23[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v30, (uint64_t)"-[AXPhoenixGestureDetector modelDidUpdate:assetVersion:]_block_invoke", (uint64_t)location);
      _os_log_error_impl(&dword_2372C8000, (os_log_t)v23[0], v22, "[PHOENIX] %s Unable to stop phoenix gesture detector before restarting: %@", v30, 0x16u);
    }
    objc_storeStrong(v23, 0);
  }
  char v21 = 0;
  char v21 = [*(id *)(a1 + 32) _initializeAssetDrivenComponentsWithLocalURL:*(void *)(a1 + 40) assetVersion:*(void *)(a1 + 56)] & 1;
  if (v21)
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 80))
    {
      uint64_t v3 = *(void **)(a1 + 32);
      uint64_t v10 = MEMORY[0x263EF8330];
      int v11 = -1073741824;
      int v12 = 0;
      os_log_type_t v13 = __56__AXPhoenixGestureDetector_modelDidUpdate_assetVersion___block_invoke_128;
      id v14 = &unk_264CCE400;
      id v15 = *(id *)(a1 + 40);
      id v16 = *(id *)(a1 + 32);
      id v17 = *(id *)(a1 + 48);
      [v3 _startWithCompletion:&v10];
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&v16, 0);
      objc_storeStrong(&v15, 0);
    }
  }
  else
  {
    id v20 = (id)AXLogBackTap();
    os_log_type_t v19 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v29, (uint64_t)"-[AXPhoenixGestureDetector modelDidUpdate:assetVersion:]_block_invoke", *(void *)(a1 + 40));
      _os_log_error_impl(&dword_2372C8000, (os_log_t)v20, v19, "[PHOENIX] %s Failed to re-initialize Phoenix from %@", v29, 0x16u);
    }
    objc_storeStrong(&v20, 0);
    id v18 = (id)[NSString stringWithFormat:@"Failed to reinitialize asset driven components of Phoenix from %@", *(void *)(a1 + 40)];
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 32);
    uint64_t v5 = *(void *)(a1 + 32);
    int v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = *MEMORY[0x263F08320];
    id v28 = v18;
    id v8 = (id)[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v7 = (id)objc_msgSend(v4, "errorWithDomain:code:userInfo:", @"AXPhoenixErrorDomain", 1004);
    objc_msgSend(v6, "phoenixGestureDetector:failedWithError:", v5);

    objc_storeStrong(&v18, 0);
  }
  objc_storeStrong(&location, 0);
}

void __56__AXPhoenixGestureDetector_modelDidUpdate_assetVersion___block_invoke_128(void *a1, char a2, id obj)
{
  v16[1] = *MEMORY[0x263EF8340];
  os_log_type_t v13 = a1;
  char v12 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v10[1] = a1;
  if (v12)
  {
    id v9 = (id)AXLogBackTap();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v14, (uint64_t)"-[AXPhoenixGestureDetector modelDidUpdate:assetVersion:]_block_invoke");
      _os_log_impl(&dword_2372C8000, (os_log_t)v9, OS_LOG_TYPE_INFO, "[PHOENIX] %s Successfully restarted the phoenix gesture detector with new assets.", v14, 0xCu);
    }
    objc_storeStrong(&v9, 0);
  }
  else
  {
    v10[0] = (id)[NSString stringWithFormat:@"Failed to reinitialize asset driven components of Phoenix from %@, error is %@", a1[4], location];
    uint64_t v5 = *(void **)(a1[5] + 32);
    uint64_t v4 = a1[6];
    uint64_t v3 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08320];
    v16[0] = v10[0];
    id v7 = (id)[NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v6 = (id)objc_msgSend(v3, "errorWithDomain:code:userInfo:", @"AXPhoenixErrorDomain", 1004);
    objc_msgSend(v5, "phoenixGestureDetector:failedWithError:", v4);

    objc_storeStrong(v10, 0);
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)rnnModelEnabled
{
  return self->_rnnModelEnabled;
}

- (BOOL)falsePositiveLoggingEnabled
{
  return self->_falsePositiveLoggingEnabled;
}

- (void).cxx_destruct
{
}

@end