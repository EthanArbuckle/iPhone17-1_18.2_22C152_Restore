@interface AXPhoenixClassifierRNN
- (AXPhoenixClassifierRNN)initWithDelegate:(id)a3 modelURL:(id)a4 configuration:(id)a5;
- (AXPhoenixClassifierRNNModelInputData)inputData;
- (AXPhoenixClassifierRNNModelWindow)modelWindow;
- (BOOL)falsePositiveLoggingEnabled;
- (id)_initializeModelFromURL:(id)a3 outError:(id *)a4;
- (id)_multiArrayInputForClassifierWithError:(id *)a3;
- (id)_windowData:(BOOL)a3;
- (id)configuration;
- (id)version;
- (unint64_t)_countThresholdForGesturePrediction:(id)a3;
- (void)_evaluateTapData;
- (void)_handleAccelerometerData:(id)a3 withTimestamp:(double)a4;
- (void)_logWindowData:(id)a3 doubleTap:(BOOL)a4 tapData:(id)a5;
- (void)_updateAccelerationData;
- (void)handleAccelerometerData:(id)a3 withTimestamp:(double)a4;
- (void)reset;
- (void)setFalsePositiveLoggingEnabled:(BOOL)a3;
- (void)setInputData:(id)a3;
- (void)setModelWindow:(id)a3;
- (void)setPolicyOption:(int)a3;
- (void)setTapSpeed:(float)a3;
@end

@implementation AXPhoenixClassifierRNN

- (AXPhoenixClassifierRNN)initWithDelegate:(id)a3 modelURL:(id)a4 configuration:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v40 = 0;
  objc_storeStrong(&v40, a4);
  id v39 = 0;
  objc_storeStrong(&v39, a5);
  id v5 = v42;
  id v42 = 0;
  v38.receiver = v5;
  v38.super_class = (Class)AXPhoenixClassifierRNN;
  id v42 = [(AXPhoenixClassifierRNN *)&v38 init];
  objc_storeStrong(&v42, v42);
  if (!v42) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)v42 + 1, location[0]);
  objc_storeStrong((id *)v42 + 2, v39);
  uint64_t v37 = 3;
  unint64_t v6 = [*((id *)v42 + 2) accelerometerSampleRateInHz];
  *((void *)v42 + 17) = v6 / 3;
  *((void *)v42 + 4) = *((void *)v42 + 17);
  id v36 = (id)AXLogBackTap();
  os_log_type_t v35 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_INFO))
  {
    id v26 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*((id *)v42 + 2), "accelerometerSampleRateInHz"));
    id v25 = (id)[NSNumber numberWithUnsignedInteger:v37];
    id v24 = (id)[NSNumber numberWithUnsignedInteger:*((void *)v42 + 17)];
    __os_log_helper_16_2_4_8_32_8_64_8_64_8_64((uint64_t)v46, (uint64_t)"-[AXPhoenixClassifierRNN initWithDelegate:modelURL:configuration:]", (uint64_t)v26, (uint64_t)v25, (uint64_t)v24);
    _os_log_impl(&dword_2372C8000, (os_log_t)v36, v35, "[PHOENIX] %s Loop frequency = %@ / %@ = %@", v46, 0x2Au);
  }
  objc_storeStrong(&v36, 0);
  id v34 = 0;
  id v33 = 0;
  id v23 = (id)[v42 _initializeModelFromURL:v40 outError:&v33];
  objc_storeStrong(&v34, v33);
  v7 = (void *)*((void *)v42 + 3);
  *((void *)v42 + 3) = v23;

  if (*((void *)v42 + 3))
  {
    *((_DWORD *)v42 + 14) = 3;
    v20 = [AccelerometerBuffer alloc];
    v21 = -[AccelerometerBuffer initWithCapacity:accelerometerSampleRateInHz:](v20, "initWithCapacity:accelerometerSampleRateInHz:", 400, [v39 accelerometerSampleRateInHz]);
    objc_msgSend(*((id *)v42 + 24), "setAccelerometerBuffer:");

    v8 = [PredictionsBuffer alloc];
    uint64_t v9 = [(PredictionsBuffer *)v8 initWithConfiguration:v39];
    v10 = (void *)*((void *)v42 + 5);
    *((void *)v42 + 5) = v9;

    uint64_t v22 = [*((id *)v42 + 2) accelerometerSampleRateInHz];
    uint64_t v11 = [*((id *)v42 + 2) minDurationBetweenTriggersInSeconds];
    *((void *)v42 + 18) = v22 * v11;
    os_log_t v29 = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      id v19 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*((id *)v42 + 2), "accelerometerSampleRateInHz"));
      id v18 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*((id *)v42 + 2), "minDurationBetweenTriggersInSeconds"));
      id v17 = (id)[NSNumber numberWithUnsignedInteger:*((void *)v42 + 18)];
      __os_log_helper_16_2_4_8_32_8_64_8_64_8_64((uint64_t)v44, (uint64_t)"-[AXPhoenixClassifierRNN initWithDelegate:modelURL:configuration:]", (uint64_t)v19, (uint64_t)v18, (uint64_t)v17);
      _os_log_impl(&dword_2372C8000, v29, OS_LOG_TYPE_INFO, "[PHOENIX] %s Minimum samples between triggers = %@ * %@ = %@", v44, 0x2Au);
    }
    objc_storeStrong((id *)&v29, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.accessibility.phoenixclassifier", 0);
    v13 = (void *)*((void *)v42 + 9);
    *((void *)v42 + 9) = v12;

    *((void *)v42 + 16) = 0;
    *((_DWORD *)v42 + 43) = 0;
    *((void *)v42 + 20) = 0;
    v14 = objc_alloc_init(AXPhoenixDataLogger);
    v15 = (void *)*((void *)v42 + 22);
    *((void *)v42 + 22) = v14;

    int v30 = 0;
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    os_log_type_t v31 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v45, (uint64_t)"-[AXPhoenixClassifierRNN initWithDelegate:modelURL:configuration:]", (uint64_t)v40);
      _os_log_error_impl(&dword_2372C8000, oslog, v31, "[PHOENIX] %s Error loading model from url %@", v45, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v43 = 0;
    int v30 = 1;
  }
  objc_storeStrong(&v34, 0);
  if (!v30)
  {
LABEL_12:
    v43 = (AXPhoenixClassifierRNN *)v42;
    int v30 = 1;
  }
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v42, 0);
  return v43;
}

- (id)configuration
{
  return self->_configuration;
}

- (id)version
{
  return self->_modelVersion;
}

- (void)setPolicyOption:(int)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v11 = self;
  SEL v10 = a2;
  int v9 = a3;
  self->_policyOption = a3;
  os_log_t oslog = (os_log_t)(id)AXLogBackTap();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    os_log_type_t v4 = type;
    id v5 = PolicyOptionToString(v11->_policyOption);
    unint64_t v6 = v5;
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v12, (uint64_t)"-[AXPhoenixClassifierRNN setPolicyOption:]", (uint64_t)v6);
    _os_log_impl(&dword_2372C8000, log, v4, "[PHOENIX] %s Setting policy to %@", v12, 0x16u);

    objc_storeStrong((id *)&v6, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (void)handleAccelerometerData:(id)a3 withTimestamp:(double)a4
{
  *(double *)&long long v18 = a3.var0;
  *((void *)&v18 + 1) = *(void *)&a3.var1;
  double var2 = a3.var2;
  id v17 = self;
  SEL v16 = a2;
  double v15 = a4;
  objc_initWeak(&location, self);
  queue = v17->_queue;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __64__AXPhoenixClassifierRNN_handleAccelerometerData_withTimestamp___block_invoke;
  int v9 = &unk_264CCE090;
  objc_copyWeak(&v10, &location);
  long long v11 = v18;
  double v12 = var2;
  double v13 = v15;
  dispatch_async(queue, &v5);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __64__AXPhoenixClassifierRNN_handleAccelerometerData_withTimestamp___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAccelerometerData:withTimestamp:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)reset
{
  id v10 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  queue = v10->_queue;
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = __31__AXPhoenixClassifierRNN_reset__block_invoke;
  int v7 = &unk_264CCDFF0;
  objc_copyWeak(&v8, location);
  dispatch_async(queue, &v3);
  objc_destroyWeak(&v8);
  objc_destroyWeak(location);
}

void __31__AXPhoenixClassifierRNN_reset__block_invoke(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    *((void *)location[0] + 6) = 0;
    [*((id *)location[0] + 5) reset];
    id v2 = (id)[location[0] inputData];
    id v1 = (id)[v2 accelerometerBuffer];
    [v1 reset];

    objc_storeStrong((id *)location[0] + 8, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)setTapSpeed:(float)a3
{
  self->_tapSpeed = a3;
  self->_runFrequency = (unint64_t)(float)(self->_tapSpeed * 100.0);
  self->_frameLength = self->_runFrequency;
}

- (id)_initializeModelFromURL:(id)a3 outError:(id *)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v53 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v51 = a4;
  id v50 = (id)[MEMORY[0x263F00D80] modelWithContentsOfURL:location[0] error:a4];
  if (v50)
  {
    os_log_t v46 = (os_log_t)(id)AXLogBackTap();
    os_log_type_t v45 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v58, (uint64_t)"-[AXPhoenixClassifierRNN _initializeModelFromURL:outError:]", (uint64_t)location[0]);
      _os_log_impl(&dword_2372C8000, v46, v45, "[PHOENIX] %s Using model from %@", v58, 0x16u);
    }
    objc_storeStrong((id *)&v46, 0);
    objc_storeStrong((id *)&v53->_modelInputName, @"model_input");
    objc_storeStrong((id *)&v53->_modelInputHistory, @"history");
    objc_storeStrong((id *)&v53->_modelOutputName, @"output");
    objc_storeStrong((id *)&v53->_modelOutputNewHistory, @"updated_history");
    int v4 = objc_alloc_init(AXPhoenixClassifierRNNModelInputData);
    inputData = v53->_inputData;
    v53->_inputData = v4;

    int v6 = objc_alloc_init(AXPhoenixClassifierRNNModelWindow);
    modelWindow = v53->_modelWindow;
    v53->_modelWindow = v6;

    id v34 = (id)[v50 modelDescription];
    id v33 = (id)[v34 inputDescriptionsByName];
    id v44 = (id)[v33 objectForKeyedSubscript:v53->_modelInputName];

    if ([v44 type] == 5)
    {
      int v30 = v53->_inputData;
      id v32 = (id)[v44 multiArrayConstraint];
      id v31 = (id)[v32 shape];
      -[AXPhoenixClassifierRNNModelInputData updateInputShape:](v30, "updateInputShape:");

      id v28 = (id)[v50 modelDescription];
      id v27 = (id)[v28 inputDescriptionsByName];
      id v8 = (id)[v27 objectForKeyedSubscript:v53->_modelInputHistory];
      id v9 = v44;
      id v44 = v8;

      if ([v44 type] != 5)
      {
        os_log_t v41 = (os_log_t)(id)AXLogBackTap();
        os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = (id)objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v44, "type"));
          __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v56, (uint64_t)"-[AXPhoenixClassifierRNN _initializeModelFromURL:outError:]", (uint64_t)v23, (uint64_t)&unk_26EA418F0);
          _os_log_impl(&dword_2372C8000, v41, v40, "[PHOENIX] %s Unexpected input feature type %@, expected %@ (MLFeatureTypeMultiArray)", v56, 0x20u);
        }
        objc_storeStrong((id *)&v41, 0);
        id v54 = 0;
        int v47 = 1;
      }
      else
      {
        id v24 = v53->_modelWindow;
        id v26 = (id)[v44 multiArrayConstraint];
        id v25 = (id)[v26 shape];
        -[AXPhoenixClassifierRNNModelWindow updateHistoryShape:](v24, "updateHistoryShape:");

        id v22 = (id)[v50 modelDescription];
        id v39 = (id)[v22 metadata];

        if (v39)
        {
          id v38 = (id)[v39 objectForKeyedSubscript:*MEMORY[0x263F00CF0]];
          if (v38)
          {
            long long v11 = (NSString *)(id)[v38 objectForKeyedSubscript:@"version"];
            modelVersion = v53->_modelVersion;
            v53->_modelVersion = v11;
          }
          if (![(NSString *)v53->_modelVersion length])
          {
            double v13 = (NSString *)(id)[v39 objectForKeyedSubscript:*MEMORY[0x263F00D08]];
            v14 = v53->_modelVersion;
            v53->_modelVersion = v13;
          }
          double v15 = (NSString *)(id)[v39 objectForKeyedSubscript:*MEMORY[0x263F00CF8]];
          modelDescription = v53->_modelDescription;
          v53->_modelDescription = v15;

          objc_storeStrong(&v38, 0);
        }
        if (!v53->_modelVersion)
        {
          id v21 = (id)[location[0] URLByDeletingPathExtension];
          id v17 = (NSString *)(id)[v21 lastPathComponent];
          long long v18 = v53->_modelVersion;
          v53->_modelVersion = v17;
        }
        os_log_t v37 = (os_log_t)(id)AXLogBackTap();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_6_8_32_8_64_8_64_8_64_8_64_8_64((uint64_t)v55, (uint64_t)"-[AXPhoenixClassifierRNN _initializeModelFromURL:outError:]", (uint64_t)v53->_modelVersion, (uint64_t)v53->_modelDescription, (uint64_t)v53->_modelInputName, (uint64_t)v53->_modelOutputName, (uint64_t)v39);
          _os_log_impl(&dword_2372C8000, v37, OS_LOG_TYPE_INFO, "[PHOENIX] %s Version %@, description %@, ModelInputName %@, ModelOutputName %@, modelInfo %@", v55, 0x3Eu);
        }
        objc_storeStrong((id *)&v37, 0);
        id v54 = v50;
        int v47 = 1;
        objc_storeStrong(&v39, 0);
      }
    }
    else
    {
      os_log_t v43 = (os_log_t)(id)AXLogBackTap();
      os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = (id)objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v44, "type"));
        __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v57, (uint64_t)"-[AXPhoenixClassifierRNN _initializeModelFromURL:outError:]", (uint64_t)v29, (uint64_t)&unk_26EA418F0);
        _os_log_impl(&dword_2372C8000, v43, v42, "[PHOENIX] %s Unexpected input feature type %@, expected %@ (MLFeatureTypeMultiArray)", v57, 0x20u);
      }
      objc_storeStrong((id *)&v43, 0);
      id v54 = 0;
      int v47 = 1;
    }
    objc_storeStrong(&v44, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      if (v51) {
        uint64_t v35 = (uint64_t)*v51;
      }
      else {
        uint64_t v35 = 0;
      }
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v59, (uint64_t)"-[AXPhoenixClassifierRNN _initializeModelFromURL:outError:]", (uint64_t)location[0], v35);
      _os_log_error_impl(&dword_2372C8000, oslog, type, "[PHOENIX] %s Failed to load model from %@: %@", v59, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v54 = 0;
    int v47 = 1;
  }
  objc_storeStrong(&v50, 0);
  objc_storeStrong(location, 0);
  id v19 = v54;
  return v19;
}

- (id)_windowData:(BOOL)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  os_log_t v41 = self;
  SEL v40 = a2;
  BOOL v39 = a3;
  unsigned long long v37 = 0u;
  long long v38 = 0u;
  id v28 = [(AXPhoenixClassifierRNNModelInputData *)self->_inputData accelerometerBuffer];
  [(AccelerometerBuffer *)v28 data];
  *(void *)&unsigned long long v37 = v3;
  *((void *)&v37 + 1) = v4;
  *(void *)&long long v38 = v5;
  *((void *)&v38 + 1) = v6;

  unsigned long long v7 = v37;
  *(void *)&double v35 = v7 >> 64;
  *(void *)&double v36 = v7;
  os_log_t oslog = (os_log_t)(id)AXLogBackTap();
  os_log_type_t type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    id v27 = (id)[NSNumber numberWithDouble:v36];
    id v26 = (id)[NSNumber numberWithDouble:v35];
    __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v45, (uint64_t)"-[AXPhoenixClassifierRNN _windowData:]", (uint64_t)v27, (uint64_t)v26);
    _os_log_impl(&dword_2372C8000, oslog, type, "[PHOENIX] %s tapTimestamp:[%@, %@]", v45, 0x20u);
  }
  objc_storeStrong((id *)&oslog, 0);
  os_log_t v32 = (os_log_t)(id)AXLogBackTap();
  os_log_type_t v31 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    id v22 = v32;
    os_log_type_t v23 = v31;
    id v25 = [(PredictionsBuffer *)v41->_predictionsBuffer logBuffer];
    id v24 = (id)[v25 componentsJoinedByString:@":"];
    id v30 = v24;
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v44, (uint64_t)"-[AXPhoenixClassifierRNN _windowData:]", (uint64_t)v30);
    _os_log_impl(&dword_2372C8000, v22, v23, "[PHOENIX] %s predictions[none,double,triple,class]: %@", v44, 0x16u);

    objc_storeStrong(&v30, 0);
  }
  objc_storeStrong((id *)&v32, 0);
  v14 = [(AXPhoenixClassifierRNNModelInputData *)v41->_inputData accelerometerBuffer];
  id v8 = [(AccelerometerBuffer *)v14 logBuffer];

  v42[0] = @"accelerometer";
  double v15 = [(AXPhoenixClassifierRNNModelInputData *)v41->_inputData accelerometerBuffer];
  id v16 = [(AccelerometerBuffer *)v15 logBuffer];
  v43[0] = v16;
  v42[1] = @"accel_csv";
  id v17 = [(AXPhoenixClassifierRNNModelInputData *)v41->_inputData accelerometerBuffer];
  id v18 = [(AccelerometerBuffer *)v17 csv];
  v43[1] = v18;
  v42[2] = @"predictions";
  id v19 = [(PredictionsBuffer *)v41->_predictionsBuffer logBuffer];
  v43[2] = v19;
  v42[3] = @"result";
  id v9 = @"doubletap";
  if (!v39) {
    id v9 = @"tripletap";
  }
  v43[3] = v9;
  v42[4] = @"startTime";
  id v20 = (id)[NSNumber numberWithDouble:v36];
  v43[4] = v20;
  v42[5] = @"endTime";
  id v21 = (id)[NSNumber numberWithDouble:v35];
  v43[5] = v21;
  v42[6] = @"modelDescription";
  if (v41->_modelDescription) {
    modelDescription = (__CFString *)v41->_modelDescription;
  }
  else {
    modelDescription = &stru_26EA3C2C8;
  }
  v43[6] = modelDescription;
  v42[7] = @"modelVersion";
  if (v41->_modelVersion) {
    modelVersion = (__CFString *)v41->_modelVersion;
  }
  else {
    modelVersion = &stru_26EA3C2C8;
  }
  v43[7] = modelVersion;
  id v29 = (id)[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:8];

  id v11 = v29;
  objc_storeStrong(&v29, 0);
  return v11;
}

- (unint64_t)_countThresholdForGesturePrediction:(id)a3
{
  unint64_t var0 = a3.var0;
  int policyOption = self->_policyOption;
  switch(policyOption)
  {
    case 1:
      id v9 = [(AXPhoenixClassifierConfiguration *)self->_configuration doubleTapPolicyThresholds];
      id v8 = [(NSArray *)v9 objectAtIndex:1];
      unint64_t v14 = [v8 unsignedIntegerValue];

      break;
    case 2:
      unsigned long long v7 = [(AXPhoenixClassifierConfiguration *)self->_configuration tripleTapPolicyThresholds];
      id v6 = [(NSArray *)v7 objectAtIndex:1];
      unint64_t v14 = [v6 unsignedIntegerValue];

      break;
    case 3:
      if (self->_tapSpeed > 0.0 && a3.var0 == 1)
      {
        return vcvtps_u32_f32(self->_tapSpeed * 10.0);
      }
      else
      {
        id v11 = [(AXPhoenixClassifierConfiguration *)self->_configuration generalPolicyThresholds];
        id v10 = [(NSArray *)v11 objectAtIndex:var0];
        unint64_t v14 = [v10 unsignedIntegerValue];
      }
      break;
    default:
      uint64_t v5 = [(AXPhoenixClassifierConfiguration *)self->_configuration generalPolicyThresholds];
      id v4 = [(NSArray *)v5 objectAtIndex:var0];
      unint64_t v14 = [v4 unsignedIntegerValue];

      break;
  }
  return v14;
}

- (void)_handleAccelerometerData:(id)a3 withTimestamp:(double)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  $1AB5FA073B851C12C2339EC22442E995 v24 = a3;
  os_log_type_t v23 = self;
  SEL v22 = a2;
  double v21 = a4;
  unint64_t v14 = [(AXPhoenixClassifierRNN *)self modelWindow];
  [(AXPhoenixClassifierRNNModelWindow *)v14 setSamplesSinceLastTap:[(AXPhoenixClassifierRNNModelWindow *)v14 samplesSinceLastTap] + 1];

  double v15 = [(AXPhoenixClassifierRNNModelInputData *)v23->_inputData accelerometerBuffer];
  -[AccelerometerBuffer addData:timestamp:](v15, "addData:timestamp:", v24.var0, v24.var1, v24.var2, v21);

  ++v23->_resetCounter;
  ++v23->_loopCounter;
  if (v23->_resetCounter >= 0x190)
  {
    v23->_resetCounter = 0;
    double v12 = [(AXPhoenixClassifierRNN *)v23 modelWindow];
    BOOL v13 = [(AXPhoenixClassifierRNNModelWindow *)v12 tapCount] != 0;

    if (v13)
    {
      id v18 = (id)AXLogBackTap();
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = NSNumber;
        id v10 = [(AXPhoenixClassifierRNN *)v23 modelWindow];
        id v9 = (id)objc_msgSend(v8, "numberWithUnsignedInteger:", -[AXPhoenixClassifierRNNModelWindow tapCount](v10, "tapCount"));
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v25, (uint64_t)"-[AXPhoenixClassifierRNN _handleAccelerometerData:withTimestamp:]", (uint64_t)v9);
        _os_log_impl(&dword_2372C8000, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Wanted to reset but in middle of a tap: %@", v25, 0x16u);
      }
      objc_storeStrong(&v18, 0);
    }
    else
    {
      id location = (id)AXLogBackTap();
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v26, (uint64_t)"-[AXPhoenixClassifierRNN _handleAccelerometerData:withTimestamp:]");
        _os_log_impl(&dword_2372C8000, (os_log_t)location, v19, "[PHOENIX] %s Resetting", v26, 0xCu);
      }
      objc_storeStrong(&location, 0);
      id v11 = [(AXPhoenixClassifierRNN *)v23 modelWindow];
      [(AXPhoenixClassifierRNNModelWindow *)v11 resetHistory];
    }
  }
  id v6 = [(AXPhoenixClassifierRNN *)v23 modelWindow];
  BOOL v7 = [(AXPhoenixClassifierRNNModelWindow *)v6 tapCount] == 0;

  if (!v7) {
    [(AXPhoenixClassifierRNN *)v23 _evaluateTapData];
  }
  if (!(v23->_loopCounter % v23->_runFrequency))
  {
    v23->_loopCounter = 0;
    ++v23->_resetHistoryCounter;
    char v16 = 0;
    BOOL v5 = 0;
    if (v23->_resetHistoryCounter == 2)
    {
      id v17 = [(AXPhoenixClassifierRNN *)v23 modelWindow];
      char v16 = 1;
      BOOL v5 = [(AXPhoenixClassifierRNNModelWindow *)v17 tapCount] == 0;
    }
    if (v16) {

    }
    if (v5)
    {
      id v4 = [(AXPhoenixClassifierRNN *)v23 modelWindow];
      [(AXPhoenixClassifierRNNModelWindow *)v4 resetHistory];

      v23->_resetHistoryCounter = 0;
    }
    [(AXPhoenixClassifierRNN *)v23 _updateAccelerationData];
  }
}

- (void)_updateAccelerationData
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  v73 = self;
  v72[1] = (id)a2;
  v72[0] = 0;
  id v70 = 0;
  id v43 = [(AXPhoenixClassifierRNN *)self _multiArrayInputForClassifierWithError:&v70];
  objc_storeStrong(v72, v70);
  id v71 = v43;
  if (v43)
  {
    os_log_type_t v42 = [(AXPhoenixClassifierRNN *)v73 modelWindow];
    id v66 = [(AXPhoenixClassifierRNNModelWindow *)v42 historyArray];

    if (v66)
    {
      v79[0] = v73->_modelInputName;
      id v40 = (id)[MEMORY[0x263F00D50] featureValueWithMultiArray:v71];
      v80[0] = v40;
      v79[1] = v73->_modelInputHistory;
      id v39 = (id)[MEMORY[0x263F00D50] featureValueWithMultiArray:v66];
      v80[1] = v39;
      id v63 = (id)[NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:2];

      id v2 = objc_alloc(MEMORY[0x263F00D38]);
      id v61 = v72[0];
      os_log_t v41 = (void *)[v2 initWithDictionary:v63 error:&v61];
      objc_storeStrong(v72, v61);
      id v62 = v41;
      if (v41)
      {
        classifier = v73->_classifier;
        id obj = v72[0];
        id v38 = [(MLModel *)classifier predictionFromFeatures:v62 error:&obj];
        objc_storeStrong(v72, obj);
        id v58 = v38;
        if (v38)
        {
          id v54 = (id)[v58 featureValueForName:v73->_modelOutputName];
          id v53 = (id)[v54 multiArrayValue];
          id v35 = (id)[v58 featureValueForName:v73->_modelOutputNewHistory];
          id v52 = (id)[v35 multiArrayValue];

          double v36 = [(AXPhoenixClassifierRNN *)v73 modelWindow];
          [(AXPhoenixClassifierRNNModelWindow *)v36 setHistoryArray:v52];

          unsigned long long v37 = [(AXPhoenixClassifierRNN *)v73 modelWindow];
          -[AXPhoenixClassifierRNNModelWindow setSamplesSinceLastTap:](v37, "setSamplesSinceLastTap:", -[AXPhoenixClassifierRNNModelWindow samplesSinceLastTap](v37, "samplesSinceLastTap")- [v53 count]);

          for (unint64_t i = 0; ; ++i)
          {
            unint64_t v34 = i;
            if (v34 >= [v53 count]) {
              break;
            }
            id v32 = (id)[v53 objectAtIndexedSubscript:i];
            [v32 doubleValue];
            BOOL v33 = v4 <= -0.5;

            if (v33)
            {
              id v6 = [(AXPhoenixClassifierRNN *)v73 modelWindow];
              [(AXPhoenixClassifierRNNModelWindow *)v6 setSamplesSinceLastTap:[(AXPhoenixClassifierRNNModelWindow *)v6 samplesSinceLastTap] + 1];

              BOOL v7 = [(AXPhoenixClassifierRNN *)v73 modelWindow];
              [(AXPhoenixClassifierRNNModelWindow *)v7 setFoundTap:0];
            }
            else
            {
              id v29 = [(AXPhoenixClassifierRNN *)v73 modelWindow];
              [(AXPhoenixClassifierRNNModelWindow *)v29 setSamplesSinceLastTap:[(AXPhoenixClassifierRNNModelWindow *)v29 samplesSinceLastTap] + 1];

              id v30 = [(AXPhoenixClassifierRNN *)v73 modelWindow];
              BOOL v31 = [(AXPhoenixClassifierRNNModelWindow *)v30 foundTap];

              if (!v31)
              {
                os_log_t v50 = (os_log_t)(id)AXLogBackTap();
                os_log_type_t v49 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v27 = v50;
                  os_log_type_t v28 = v49;
                  __os_log_helper_16_2_1_8_32((uint64_t)v76, (uint64_t)"-[AXPhoenixClassifierRNN _updateAccelerationData]");
                  _os_log_error_impl(&dword_2372C8000, v27, v28, "[PHOENIX] %s Got a tap", v76, 0xCu);
                }
                objc_storeStrong((id *)&v50, 0);
                id v25 = [(AXPhoenixClassifierRNN *)v73 modelWindow];
                BOOL v5 = [(AXPhoenixClassifierRNNModelWindow *)v25 tapCount] == 0;
                char v47 = 0;
                BOOL v26 = 0;
                if (!v5)
                {
                  id v48 = [(AXPhoenixClassifierRNN *)v73 modelWindow];
                  char v47 = 1;
                  BOOL v26 = [v48 samplesSinceLastTap] < v73->_runFrequency;
                }
                if (v47) {

                }
                if (v26)
                {
                  os_log_t v46 = (os_log_t)(id)AXLogBackTap();
                  os_log_type_t v45 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                  {
                    double v21 = v46;
                    os_log_type_t v22 = v45;
                    id v20 = NSNumber;
                    $1AB5FA073B851C12C2339EC22442E995 v24 = [(AXPhoenixClassifierRNN *)v73 modelWindow];
                    id v23 = (id)objc_msgSend(v20, "numberWithUnsignedInteger:", -[AXPhoenixClassifierRNNModelWindow samplesSinceLastTap](v24, "samplesSinceLastTap"));
                    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v75, (uint64_t)"-[AXPhoenixClassifierRNN _updateAccelerationData]", (uint64_t)v23);
                    _os_log_error_impl(&dword_2372C8000, v21, v22, "[PHOENIX] %s Got two taps in a really short amount of time, ignoring tap. Number of samples %@", v75, 0x16u);
                  }
                  objc_storeStrong((id *)&v46, 0);
                  id v17 = [(AXPhoenixClassifierRNN *)v73 modelWindow];
                  -[AXPhoenixClassifierRNNModelWindow setSamplesSinceLastTap:](v17, "setSamplesSinceLastTap:");

                  id v18 = [(AXPhoenixClassifierRNN *)v73 modelWindow];
                  [(AXPhoenixClassifierRNNModelWindow *)v18 setTapCount:0];

                  os_log_type_t v19 = [(AXPhoenixClassifierRNN *)v73 modelWindow];
                  [(AXPhoenixClassifierRNNModelWindow *)v19 setFoundTap:0];

                  v73->_resetCounter = 400;
                  v73->_runFrequency = (unint64_t)(float)(v73->_tapSpeed * 100.0);
                  v73->_frameLength = v73->_runFrequency;
                  break;
                }
                double v15 = [(AXPhoenixClassifierRNN *)v73 modelWindow];
                BOOL v16 = [(AXPhoenixClassifierRNNModelWindow *)v15 tapCount] == 0;

                if (!v16)
                {
                  os_log_t v44 = (os_log_t)(id)AXLogBackTap();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                  {
                    double v12 = v44;
                    id v11 = NSNumber;
                    unint64_t v14 = [(AXPhoenixClassifierRNN *)v73 modelWindow];
                    id v13 = (id)objc_msgSend(v11, "numberWithUnsignedInteger:", -[AXPhoenixClassifierRNNModelWindow samplesSinceLastTap](v14, "samplesSinceLastTap"));
                    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v74, (uint64_t)"-[AXPhoenixClassifierRNN _updateAccelerationData]", (uint64_t)v13);
                    _os_log_error_impl(&dword_2372C8000, v12, OS_LOG_TYPE_ERROR, "[PHOENIX] %s samplesSinceLastTap %@", v74, 0x16u);
                  }
                  objc_storeStrong((id *)&v44, 0);
                }
                id v8 = [(AXPhoenixClassifierRNN *)v73 modelWindow];
                [(AXPhoenixClassifierRNNModelWindow *)v8 setSamplesSinceLastTap:0];

                id v9 = [(AXPhoenixClassifierRNN *)v73 modelWindow];
                [(AXPhoenixClassifierRNNModelWindow *)v9 setTapCount:[(AXPhoenixClassifierRNNModelWindow *)v9 tapCount] + 1];

                id v10 = [(AXPhoenixClassifierRNN *)v73 modelWindow];
                [(AXPhoenixClassifierRNNModelWindow *)v10 setFoundTap:1];

                v73->_runFrequency = 5;
                v73->_frameLength = v73->_runFrequency;
              }
            }
          }
          [(AXPhoenixClassifierRNN *)v73 _evaluateTapData];
          objc_storeStrong(&v52, 0);
          objc_storeStrong(&v53, 0);
          objc_storeStrong(&v54, 0);
          int v67 = 0;
        }
        else
        {
          os_log_t oslog = (os_log_t)(id)AXLogBackTap();
          os_log_type_t v55 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_2_8_32_8_64((uint64_t)v77, (uint64_t)"-[AXPhoenixClassifierRNN _updateAccelerationData]", (uint64_t)v72[0]);
            _os_log_error_impl(&dword_2372C8000, oslog, v55, "[PHOENIX] %s Model prediction failed with error: %@", v77, 0x16u);
          }
          objc_storeStrong((id *)&oslog, 0);
          [(AXPhoenixClassifierDelegate *)v73->_delegate phoenixClassifier:v73 failedWithError:v72[0]];
          int v67 = 1;
        }
        objc_storeStrong(&v58, 0);
      }
      else
      {
        id v60 = (id)AXLogBackTap();
        os_log_type_t v59 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v60, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v78, (uint64_t)"-[AXPhoenixClassifierRNN _updateAccelerationData]", (uint64_t)v73->_modelInputName, (uint64_t)v72[0]);
          _os_log_error_impl(&dword_2372C8000, (os_log_t)v60, v59, "[PHOENIX] %s Failed to create modelInput %@: %@", v78, 0x20u);
        }
        objc_storeStrong(&v60, 0);
        [(AXPhoenixClassifierDelegate *)v73->_delegate phoenixClassifier:v73 failedWithError:v72[0]];
        int v67 = 1;
      }
      objc_storeStrong(&v62, 0);
      objc_storeStrong(&v63, 0);
    }
    else
    {
      id v65 = (id)AXLogBackTap();
      os_log_type_t v64 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v81, (uint64_t)"-[AXPhoenixClassifierRNN _updateAccelerationData]", (uint64_t)v72[0]);
        _os_log_error_impl(&dword_2372C8000, (os_log_t)v65, v64, "[PHOENIX] %s Error creating multiArray: %@", v81, 0x16u);
      }
      objc_storeStrong(&v65, 0);
      [(AXPhoenixClassifierDelegate *)v73->_delegate phoenixClassifier:v73 failedWithError:v72[0]];
      int v67 = 1;
    }
    objc_storeStrong(&v66, 0);
  }
  else
  {
    id v69 = (id)AXLogBackTap();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v69, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v82, (uint64_t)"-[AXPhoenixClassifierRNN _updateAccelerationData]", (uint64_t)v72[0]);
      _os_log_error_impl(&dword_2372C8000, (os_log_t)v69, type, "[PHOENIX] %s Error creating multiArray: %@", v82, 0x16u);
    }
    objc_storeStrong(&v69, 0);
    [(AXPhoenixClassifierDelegate *)v73->_delegate phoenixClassifier:v73 failedWithError:v72[0]];
    int v67 = 1;
  }
  objc_storeStrong(&v71, 0);
  objc_storeStrong(v72, 0);
}

- (void)_evaluateTapData
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v39 = self;
  SEL v38 = a2;
  char v37 = 0;
  BOOL v36 = 0;
  BOOL v36 = (self->_policyOption & 1) != 0;
  BOOL v35 = 0;
  BOOL v35 = (self->_policyOption & 2) != 0;
  id v20 = [(AXPhoenixClassifierRNN *)self modelWindow];
  BOOL v21 = 0;
  if ([(AXPhoenixClassifierRNNModelWindow *)v20 tapCount] == 2) {
    BOOL v21 = v36;
  }

  if (v21)
  {
    id v18 = [(AXPhoenixClassifierRNN *)v39 modelWindow];
    char v19 = 1;
    if ((double)[(AXPhoenixClassifierRNNModelWindow *)v18 samplesSinceLastTap] / 100.0 <= v39->_tapSpeed) {
      char v19 = !v35;
    }

    if (v19)
    {
      id location = (id)AXLogBackTap();
      os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v42, (uint64_t)"-[AXPhoenixClassifierRNN _evaluateTapData]");
        _os_log_impl(&dword_2372C8000, (os_log_t)location, v33, "[PHOENIX] %s Got a double tap", v42, 0xCu);
      }
      objc_storeStrong(&location, 0);
      long long v31 = 0u;
      long long v32 = 0u;
      id v17 = [(AXPhoenixClassifierRNNModelInputData *)v39->_inputData accelerometerBuffer];
      [(AccelerometerBuffer *)v17 data];
      *(void *)&long long v31 = v2;
      *((void *)&v31 + 1) = v3;
      *(void *)&long long v32 = v4;
      *((void *)&v32 + 1) = v5;

      id v30 = [(AXPhoenixClassifierRNN *)v39 _windowData:1];
      -[AXPhoenixClassifierRNN _logWindowData:doubleTap:tapData:](v39, "_logWindowData:doubleTap:tapData:", v30, 0, v31, v32);
      -[AXPhoenixClassifierDelegate phoenixClassifierDidDetectDoubleTap:data:context:](v39->_delegate, "phoenixClassifierDidDetectDoubleTap:data:context:", v39, v30, v31, v32);
      char v37 = 1;
      objc_storeStrong(&v30, 0);
    }
  }
  else
  {
    double v15 = [(AXPhoenixClassifierRNN *)v39 modelWindow];
    BOOL v16 = 0;
    if ([(AXPhoenixClassifierRNNModelWindow *)v15 tapCount] == 3) {
      BOOL v16 = v35;
    }

    if (v16)
    {
      id v29 = (id)AXLogBackTap();
      os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v41, (uint64_t)"-[AXPhoenixClassifierRNN _evaluateTapData]");
        _os_log_impl(&dword_2372C8000, (os_log_t)v29, v28, "[PHOENIX] %s Got a triple tap", v41, 0xCu);
      }
      objc_storeStrong(&v29, 0);
      long long v26 = 0u;
      long long v27 = 0u;
      unint64_t v14 = [(AXPhoenixClassifierRNNModelInputData *)v39->_inputData accelerometerBuffer];
      [(AccelerometerBuffer *)v14 data];
      *(void *)&long long v26 = v6;
      *((void *)&v26 + 1) = v7;
      *(void *)&long long v27 = v8;
      *((void *)&v27 + 1) = v9;

      id v25 = [(AXPhoenixClassifierRNN *)v39 _windowData:0];
      -[AXPhoenixClassifierRNN _logWindowData:doubleTap:tapData:](v39, "_logWindowData:doubleTap:tapData:", v25, 0, v26, v27);
      -[AXPhoenixClassifierDelegate phoenixClassifierDidDetectTripleTap:data:context:](v39->_delegate, "phoenixClassifierDidDetectTripleTap:data:context:", v39, v25, v26, v27);
      char v37 = 1;
      objc_storeStrong(&v25, 0);
    }
    else
    {
      double v12 = [(AXPhoenixClassifierRNN *)v39 modelWindow];
      char v23 = 0;
      BOOL v13 = 0;
      if ([(AXPhoenixClassifierRNNModelWindow *)v12 tapCount])
      {
        $1AB5FA073B851C12C2339EC22442E995 v24 = [(AXPhoenixClassifierRNN *)v39 modelWindow];
        char v23 = 1;
        BOOL v13 = (double)[(AXPhoenixClassifierRNNModelWindow *)v24 samplesSinceLastTap] / 100.0 > v39->_tapSpeed;
      }
      if (v23) {

      }
      if (v13)
      {
        os_log_t oslog = (os_log_t)(id)AXLogBackTap();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v40, (uint64_t)"-[AXPhoenixClassifierRNN _evaluateTapData]");
          _os_log_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Resetting because we didn't get a second or third tap in time", v40, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        char v37 = 1;
      }
    }
  }
  if (v37)
  {
    id v10 = [(AXPhoenixClassifierRNN *)v39 modelWindow];
    [(AXPhoenixClassifierRNNModelWindow *)v10 setTapCount:0];

    id v11 = [(AXPhoenixClassifierRNN *)v39 modelWindow];
    [(AXPhoenixClassifierRNNModelWindow *)v11 setFoundTap:0];

    v39->_resetCounter = 400;
    v39->_runFrequency = (unint64_t)(float)(v39->_tapSpeed * 100.0);
    v39->_frameLength = v39->_runFrequency;
  }
}

- (void)_logWindowData:(id)a3 doubleTap:(BOOL)a4 tapData:(id)a5
{
  $01BB1521EC52D44A8E7628F5261DCEC8 v22 = a5;
  BOOL v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v19 = a4;
  if ([(AXPhoenixClassifierRNN *)v21 falsePositiveLoggingEnabled])
  {
    objc_initWeak(&v17, v21);
    logger = v21->_logger;
    id v6 = location[0];
    BOOL v7 = v19;
    double var0 = v22.var0;
    double var1 = v22.var1;
    uint64_t v11 = MEMORY[0x263EF8330];
    int v12 = -1073741824;
    int v13 = 0;
    unint64_t v14 = __59__AXPhoenixClassifierRNN__logWindowData_doubleTap_tapData___block_invoke;
    double v15 = &unk_264CCE0B8;
    objc_copyWeak(&v16, &v17);
    [(AXPhoenixDataLogger *)logger logClassifierData:v6 isDoubleTap:v7 startTime:&v11 endTime:var0 completion:var1];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v17);
    int v18 = 0;
  }
  else
  {
    int v18 = 1;
  }
  objc_storeStrong(location, 0);
}

void __59__AXPhoenixClassifierRNN__logWindowData_doubleTap_tapData___block_invoke(id *a1, char a2, id obj)
{
  BOOL v7 = a1;
  char v6 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v4[1] = a1;
  v4[0] = objc_loadWeakRetained(a1 + 4);
  if (location && v4[0]) {
    [*((id *)v4[0] + 1) phoenixClassifierDidLogFile:location];
  }
  objc_storeStrong(v4, 0);
  objc_storeStrong(&location, 0);
}

- (id)_multiArrayInputForClassifierWithError:(id *)a3
{
  v42[2] = *MEMORY[0x263EF8340];
  SEL v38 = self;
  v37[2] = (id)a2;
  v37[1] = a3;
  id v29 = [(AXPhoenixClassifierRNNModelInputData *)self->_inputData inputShape];
  id v28 = [(NSArray *)v29 objectAtIndexedSubscript:0];
  v42[0] = v28;
  $1AB5FA073B851C12C2339EC22442E995 v24 = NSNumber;
  long long v27 = [(AXPhoenixClassifierRNNModelInputData *)v38->_inputData inputShape];
  id v26 = [(NSArray *)v27 objectAtIndexedSubscript:1];
  id v25 = (id)objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v26, "unsignedIntegerValue") * v38->_frameLength);
  v42[1] = v25;
  v37[0] = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:2];

  id v36 = (id)[objc_alloc(MEMORY[0x263F00DA8]) initWithShape:v37[0] dataType:65568 error:0];
  id v30 = [(AXPhoenixClassifierRNNModelInputData *)v38->_inputData accelerometerBuffer];
  id v35 = [(AccelerometerBuffer *)v30 buffer];

  uint64_t v34 = 0;
  uint64_t v34 = [v35 count] - v38->_frameLength;
  for (unint64_t i = v34; ; ++i)
  {
    unint64_t v23 = i;
    if (v23 >= [v35 count]) {
      break;
    }
    unint64_t v32 = i - v34;
    id v31 = (id)[v35 objectAtIndexedSubscript:i];
    id v9 = v36;
    uint64_t v8 = NSNumber;
    [v31 x];
    *(float *)&double v3 = v3;
    id v12 = (id)[v8 numberWithFloat:v3];
    v41[0] = &unk_26EA418D8;
    id v11 = (id)[NSNumber numberWithUnsignedInteger:v32];
    v41[1] = v11;
    id v10 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v41);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12);

    id v14 = v36;
    int v13 = NSNumber;
    [v31 y];
    *(float *)&double v4 = v4;
    id v17 = (id)[v13 numberWithFloat:v4];
    v40[0] = &unk_26EA41908;
    id v16 = (id)[NSNumber numberWithUnsignedInteger:v32];
    v40[1] = v16;
    id v15 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:2];
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v17);

    id v19 = v36;
    int v18 = NSNumber;
    [v31 z];
    *(float *)&double v5 = v5;
    id v22 = (id)[v18 numberWithFloat:v5];
    v39[0] = &unk_26EA41920;
    id v21 = (id)[NSNumber numberWithUnsignedInteger:v32];
    v39[1] = v21;
    id v20 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v22);

    objc_storeStrong(&v31, 0);
  }
  id v7 = v36;
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(v37, 0);
  return v7;
}

- (BOOL)falsePositiveLoggingEnabled
{
  return self->_falsePositiveLoggingEnabled;
}

- (void)setFalsePositiveLoggingEnabled:(BOOL)a3
{
  self->_falsePositiveLoggingEnabled = a3;
}

- (AXPhoenixClassifierRNNModelInputData)inputData
{
  return self->_inputData;
}

- (void)setInputData:(id)a3
{
}

- (AXPhoenixClassifierRNNModelWindow)modelWindow
{
  return self->_modelWindow;
}

- (void)setModelWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end