@interface AXPhoenixClassifier
- (AXPhoenixClassifier)initWithDelegate:(id)a3 modelURL:(id)a4 configuration:(id)a5;
- (BOOL)_clippedDataShowsPrediction:(unint64_t)a3;
- (BOOL)falsePositiveLoggingEnabled;
- (id)_clippedMultiArrayInputWithError:(id *)a3 beforeTime:(double)a4;
- (id)_createMultiArrayWithError:(id *)a3;
- (id)_initializeModelFromURL:(id)a3 outError:(id *)a4;
- (id)_multiArrayInputForClassifierWithError:(id *)a3;
- (id)_windowData:(BOOL)a3;
- (id)configuration;
- (id)version;
- (unint64_t)_computeFrameLength;
- (unint64_t)_countThresholdForGesturePrediction:(id)a3;
- (void)_handleAccelerometerData:(id)a3 withTimestamp:(double)a4;
- (void)_logWindowData:(id)a3 doubleTap:(BOOL)a4 tapData:(id)a5;
- (void)dealloc;
- (void)handleAccelerometerData:(id)a3 withTimestamp:(double)a4;
- (void)reset;
- (void)setFalsePositiveLoggingEnabled:(BOOL)a3;
- (void)setPolicyOption:(int)a3;
- (void)setShouldResetBuffer;
- (void)setTapSpeed:(float)a3;
@end

@implementation AXPhoenixClassifier

- (AXPhoenixClassifier)initWithDelegate:(id)a3 modelURL:(id)a4 configuration:(id)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v53 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v51 = 0;
  objc_storeStrong(&v51, a4);
  id v50 = 0;
  objc_storeStrong(&v50, a5);
  id v5 = v53;
  id v53 = 0;
  v49.receiver = v5;
  v49.super_class = (Class)AXPhoenixClassifier;
  id v53 = [(AXPhoenixClassifier *)&v49 init];
  objc_storeStrong(&v53, v53);
  if (!v53) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)v53 + 1, location[0]);
  objc_storeStrong((id *)v53 + 2, v50);
  id v48 = 0;
  id v47 = 0;
  id v37 = (id)[v53 _initializeModelFromURL:v51 outError:&v47];
  objc_storeStrong(&v48, v47);
  v6 = (void *)*((void *)v53 + 3);
  *((void *)v53 + 3) = v37;

  if (*((void *)v53 + 3))
  {
    *((_DWORD *)v53 + 14) = 3;
    uint64_t v7 = [v53 _computeFrameLength];
    *((void *)v53 + 9) = v7;
    size_t v43 = 0;
    id v32 = (id)[*((id *)v53 + 10) objectAtIndexedSubscript:0];
    uint64_t v28 = 8 * [v32 unsignedIntValue];
    id v31 = (id)[*((id *)v53 + 10) objectAtIndexedSubscript:1];
    uint64_t v29 = v28 * [v31 unsignedIntValue];
    id v30 = (id)[*((id *)v53 + 10) objectAtIndexedSubscript:2];
    size_t v33 = v29 * [v30 unsignedIntValue];

    size_t v43 = v33;
    v8 = malloc_type_malloc(v33, 0x5B544A9DuLL);
    *((void *)v53 + 17) = v8;
    v35 = [AccelerometerBuffer alloc];
    uint64_t v34 = [v50 maxAccelerationBufferSize];
    uint64_t v9 = -[AccelerometerBuffer initWithCapacity:accelerometerSampleRateInHz:](v35, "initWithCapacity:accelerometerSampleRateInHz:", v34, [v50 accelerometerSampleRateInHz]);
    v10 = (void *)*((void *)v53 + 4);
    *((void *)v53 + 4) = v9;

    v11 = [PredictionsBuffer alloc];
    uint64_t v12 = [(PredictionsBuffer *)v11 initWithConfiguration:v50];
    v13 = (void *)*((void *)v53 + 5);
    *((void *)v53 + 5) = v12;

    uint64_t v36 = [*((id *)v53 + 2) accelerometerSampleRateInHz];
    uint64_t v14 = [*((id *)v53 + 2) minDurationBetweenTriggersInSeconds];
    *((void *)v53 + 19) = v36 * v14;
    id v42 = (id)AXLogBackTap();
    os_log_type_t v41 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_INFO))
    {
      id v27 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*((id *)v53 + 2), "accelerometerSampleRateInHz"));
      id v26 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*((id *)v53 + 2), "minDurationBetweenTriggersInSeconds"));
      id v25 = (id)[NSNumber numberWithUnsignedInteger:*((void *)v53 + 19)];
      __os_log_helper_16_2_4_8_32_8_64_8_64_8_64((uint64_t)v56, (uint64_t)"-[AXPhoenixClassifier initWithDelegate:modelURL:configuration:]", (uint64_t)v27, (uint64_t)v26, (uint64_t)v25);
      _os_log_impl(&dword_2372C8000, (os_log_t)v42, v41, "[PHOENIX] %s Minimum samples between triggers = %@ * %@ = %@", v56, 0x2Au);
    }
    objc_storeStrong(&v42, 0);
    unint64_t v24 = [*((id *)v53 + 2) accelerometerSampleRateInHz];
    unint64_t v15 = [*((id *)v53 + 2) modelPredictionRateInHz];
    *((void *)v53 + 18) = v24 / v15;
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      id v23 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*((id *)v53 + 2), "accelerometerSampleRateInHz"));
      id v22 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*((id *)v53 + 2), "modelPredictionRateInHz"));
      id v21 = (id)[NSNumber numberWithUnsignedInteger:*((void *)v53 + 18)];
      __os_log_helper_16_2_4_8_32_8_64_8_64_8_64((uint64_t)v55, (uint64_t)"-[AXPhoenixClassifier initWithDelegate:modelURL:configuration:]", (uint64_t)v23, (uint64_t)v22, (uint64_t)v21);
      _os_log_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_INFO, "[PHOENIX] %s Loop frequency = %@ / %@ = %@", v55, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.accessibility.phoenixclassifier", 0);
    v17 = (void *)*((void *)v53 + 11);
    *((void *)v53 + 11) = v16;

    *((void *)v53 + 16) = 0;
    *((_DWORD *)v53 + 41) = 0;
    v18 = objc_alloc_init(AXPhoenixDataLogger);
    v19 = (void *)*((void *)v53 + 21);
    *((void *)v53 + 21) = v18;

    int v44 = 0;
  }
  else
  {
    id v46 = (id)AXLogBackTap();
    os_log_type_t v45 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v57, (uint64_t)"-[AXPhoenixClassifier initWithDelegate:modelURL:configuration:]", (uint64_t)v51);
      _os_log_error_impl(&dword_2372C8000, (os_log_t)v46, v45, "[PHOENIX] %s Error loading model from url %@", v57, 0x16u);
    }
    objc_storeStrong(&v46, 0);
    v54 = 0;
    int v44 = 1;
  }
  objc_storeStrong(&v48, 0);
  if (!v44)
  {
LABEL_12:
    v54 = (AXPhoenixClassifier *)v53;
    int v44 = 1;
  }
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v53, 0);
  return v54;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  if (self->_arrayDataPointer)
  {
    free(v4->_arrayDataPointer);
    v4->_arrayDataPointer = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)AXPhoenixClassifier;
  [(AXPhoenixClassifier *)&v2 dealloc];
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
  v11 = self;
  SEL v10 = a2;
  int v9 = a3;
  self->_policyOption = a3;
  os_log_t oslog = (os_log_t)(id)AXLogBackTap();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    os_log_type_t v4 = type;
    id v5 = PolicyOptionToString_1(v11->_policyOption);
    v6 = v5;
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v12, (uint64_t)"-[AXPhoenixClassifier setPolicyOption:]", (uint64_t)v6);
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
  v17 = self;
  SEL v16 = a2;
  double v15 = a4;
  objc_initWeak(&location, self);
  queue = v17->_queue;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __61__AXPhoenixClassifier_handleAccelerometerData_withTimestamp___block_invoke;
  int v9 = &unk_264CCE090;
  objc_copyWeak(&v10, &location);
  long long v11 = v18;
  double v12 = var2;
  double v13 = v15;
  dispatch_async(queue, &v5);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __61__AXPhoenixClassifier_handleAccelerometerData_withTimestamp___block_invoke(uint64_t a1)
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
  int v6 = __28__AXPhoenixClassifier_reset__block_invoke;
  int v7 = &unk_264CCDFF0;
  objc_copyWeak(&v8, location);
  dispatch_async(queue, &v3);
  objc_destroyWeak(&v8);
  objc_destroyWeak(location);
}

void __28__AXPhoenixClassifier_reset__block_invoke(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    *((void *)location[0] + 6) = 0;
    [*((id *)location[0] + 5) reset];
    [*((id *)location[0] + 4) reset];
    objc_storeStrong((id *)location[0] + 8, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)setShouldResetBuffer
{
  self->_shouldResetBuffer = 1;
}

- (void)setTapSpeed:(float)a3
{
  self->_tapSpeed = a3;
}

- (unint64_t)_computeFrameLength
{
  id v10 = self;
  SEL v9 = a2;
  uint64_t v4 = 0;
  int v5 = &v4;
  int v6 = 0x20000000;
  int v7 = 32;
  uint64_t v8 = 0;
  if (self->_shape) {
    -[NSArray enumerateObjectsUsingBlock:](v10->_shape, "enumerateObjectsUsingBlock:");
  }
  unint64_t v3 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v3;
}

void __42__AXPhoenixClassifier__computeFrameLength__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((unint64_t)[location[0] unsignedIntegerValue] > *(void *)(*(void *)(a1[4] + 8) + 24)) {
    *(void *)(*(void *)(a1[4] + 8) + 24) = [location[0] unsignedIntegerValue];
  }
  objc_storeStrong(location, 0);
}

- (id)_initializeModelFromURL:(id)a3 outError:(id *)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v52 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v50 = a4;
  id v49 = (id)[MEMORY[0x263F00D80] modelWithContentsOfURL:location[0] error:a4];
  if (v49)
  {
    os_log_t v45 = (os_log_t)(id)AXLogBackTap();
    os_log_type_t v44 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v58, (uint64_t)"-[AXPhoenixClassifier _initializeModelFromURL:outError:]", (uint64_t)location[0]);
      _os_log_impl(&dword_2372C8000, v45, v44, "[PHOENIX] %s Using model from %@", v58, 0x16u);
    }
    objc_storeStrong((id *)&v45, 0);
    id v31 = (id)[v49 modelDescription];
    id v30 = (id)[v31 inputDescriptionsByName];
    id v29 = (id)[v30 allKeys];
    uint64_t v4 = (NSString *)(id)[v29 firstObject];
    modelInputName = v52->_modelInputName;
    v52->_modelInputName = v4;

    if (v52->_modelInputName)
    {
      id v28 = (id)[v49 modelDescription];
      id v27 = (id)[v28 outputDescriptionsByName];
      id v26 = (id)[v27 allKeys];
      int v6 = (NSString *)(id)[v26 firstObject];
      modelOutputName = v52->_modelOutputName;
      v52->_modelOutputName = v6;

      if (v52->_modelOutputName)
      {
        id v25 = (id)[v49 modelDescription];
        id v24 = (id)[v25 inputDescriptionsByName];
        id v39 = (id)[v24 objectForKeyedSubscript:v52->_modelInputName];

        if ([v39 type] == 5)
        {
          id v23 = (id)[v39 multiArrayConstraint];
          uint64_t v8 = (NSArray *)(id)[v23 shape];
          shape = v52->_shape;
          v52->_shape = v8;

          id v21 = (id)[v49 modelDescription];
          id v36 = (id)[v21 metadata];

          if (v36)
          {
            id v35 = (id)[v36 objectForKeyedSubscript:*MEMORY[0x263F00CF0]];
            if (v35)
            {
              id v10 = (NSString *)(id)[v35 objectForKeyedSubscript:@"version"];
              modelVersion = v52->_modelVersion;
              v52->_modelVersion = v10;
            }
            if (![(NSString *)v52->_modelVersion length])
            {
              double v12 = (NSString *)(id)[v36 objectForKeyedSubscript:*MEMORY[0x263F00D08]];
              double v13 = v52->_modelVersion;
              v52->_modelVersion = v12;
            }
            uint64_t v14 = (NSString *)(id)[v36 objectForKeyedSubscript:*MEMORY[0x263F00CF8]];
            modelDescription = v52->_modelDescription;
            v52->_modelDescription = v14;

            objc_storeStrong(&v35, 0);
          }
          if (!v52->_modelVersion)
          {
            id v20 = (id)[location[0] URLByDeletingPathExtension];
            SEL v16 = (NSString *)(id)[v20 lastPathComponent];
            v17 = v52->_modelVersion;
            v52->_modelVersion = v16;
          }
          os_log_t v34 = (os_log_t)(id)AXLogBackTap();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_2_6_8_32_8_64_8_64_8_64_8_64_8_64((uint64_t)v54, (uint64_t)"-[AXPhoenixClassifier _initializeModelFromURL:outError:]", (uint64_t)v52->_modelVersion, (uint64_t)v52->_modelDescription, (uint64_t)v52->_modelInputName, (uint64_t)v52->_modelOutputName, (uint64_t)v36);
            _os_log_impl(&dword_2372C8000, v34, OS_LOG_TYPE_INFO, "[PHOENIX] %s Version %@, description %@, ModelInputName %@, ModelOutputName %@, modelInfo %@", v54, 0x3Eu);
          }
          objc_storeStrong((id *)&v34, 0);
          id v53 = v49;
          int v46 = 1;
          objc_storeStrong(&v36, 0);
        }
        else
        {
          os_log_t v38 = (os_log_t)(id)AXLogBackTap();
          os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = (id)objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v39, "type"));
            __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v55, (uint64_t)"-[AXPhoenixClassifier _initializeModelFromURL:outError:]", (uint64_t)v22, (uint64_t)&unk_26EA41998);
            _os_log_impl(&dword_2372C8000, v38, v37, "[PHOENIX] %s Unexpected input feature type %@, expected %@ (MLFeatureTypeMultiArray)", v55, 0x20u);
          }
          objc_storeStrong((id *)&v38, 0);
          id v53 = 0;
          int v46 = 1;
        }
        objc_storeStrong(&v39, 0);
      }
      else
      {
        os_log_t v41 = (os_log_t)(id)AXLogBackTap();
        os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v56, (uint64_t)"-[AXPhoenixClassifier _initializeModelFromURL:outError:]");
          _os_log_impl(&dword_2372C8000, v41, v40, "[PHOENIX] %s Missing model output name", v56, 0xCu);
        }
        objc_storeStrong((id *)&v41, 0);
        id v53 = 0;
        int v46 = 1;
      }
    }
    else
    {
      os_log_t v43 = (os_log_t)(id)AXLogBackTap();
      os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v57, (uint64_t)"-[AXPhoenixClassifier _initializeModelFromURL:outError:]");
        _os_log_impl(&dword_2372C8000, v43, v42, "[PHOENIX] %s Missing model input name", v57, 0xCu);
      }
      objc_storeStrong((id *)&v43, 0);
      id v53 = 0;
      int v46 = 1;
    }
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      if (v50) {
        uint64_t v32 = (uint64_t)*v50;
      }
      else {
        uint64_t v32 = 0;
      }
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v59, (uint64_t)"-[AXPhoenixClassifier _initializeModelFromURL:outError:]", (uint64_t)location[0], v32);
      _os_log_error_impl(&dword_2372C8000, oslog, type, "[PHOENIX] %s Failed to load model from %@: %@", v59, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v53 = 0;
    int v46 = 1;
  }
  objc_storeStrong(&v49, 0);
  objc_storeStrong(location, 0);
  long long v18 = v53;
  return v18;
}

- (id)_createMultiArrayWithError:(id *)a3
{
  uint64_t v14 = self;
  SEL v13 = a2;
  double v12 = a3;
  if (!self->_multiArray)
  {
    id v11 = 0;
    id v3 = objc_alloc(MEMORY[0x263F00DA8]);
    shape = v14->_shape;
    id obj = v11;
    uint64_t v9 = [v3 initWithShape:shape dataType:65600 error:&obj];
    objc_storeStrong(&v11, obj);
    multiArray = v14->_multiArray;
    v14->_multiArray = (MLMultiArray *)v9;

    if (!v14->_multiArray && v12)
    {
      id v6 = v11;
      *double v12 = v6;
    }
    objc_storeStrong(&v11, 0);
  }
  int v7 = v14->_multiArray;
  return v7;
}

- (id)_windowData:(BOOL)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v35 = self;
  SEL v34 = a2;
  BOOL v33 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  [(AccelerometerBuffer *)self->_accelBuffer data];
  *(double *)&long long v31 = v3;
  *((double *)&v31 + 1) = v4;
  *(void *)&long long v32 = v5;
  *((void *)&v32 + 1) = v6;
  double v30 = v3;
  double v29 = v4;
  os_log_t oslog = (os_log_t)(id)AXLogBackTap();
  os_log_type_t type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    id v22 = (id)[NSNumber numberWithDouble:v30];
    id v21 = (id)[NSNumber numberWithDouble:v29];
    __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v39, (uint64_t)"-[AXPhoenixClassifier _windowData:]", (uint64_t)v22, (uint64_t)v21);
    _os_log_impl(&dword_2372C8000, oslog, type, "[PHOENIX] %s tapTimestamp:[%@, %@]", v39, 0x20u);
  }
  objc_storeStrong((id *)&oslog, 0);
  os_log_t v26 = (os_log_t)(id)AXLogBackTap();
  os_log_type_t v25 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v17 = v26;
    os_log_type_t v18 = v25;
    id v20 = [(PredictionsBuffer *)v35->_predictionsBuffer logBuffer];
    id v19 = (id)[v20 componentsJoinedByString:@":"];
    id v24 = v19;
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v38, (uint64_t)"-[AXPhoenixClassifier _windowData:]", (uint64_t)v24);
    _os_log_impl(&dword_2372C8000, v17, v18, "[PHOENIX] %s predictions[none,double,triple,class]: %@", v38, 0x16u);

    objc_storeStrong(&v24, 0);
  }
  objc_storeStrong((id *)&v26, 0);
  id v7 = [(AccelerometerBuffer *)v35->_accelBuffer logBuffer];
  v36[0] = @"accelerometer";
  id v13 = [(AccelerometerBuffer *)v35->_accelBuffer logBuffer];
  v37[0] = v13;
  v36[1] = @"predictions";
  id v14 = [(PredictionsBuffer *)v35->_predictionsBuffer logBuffer];
  v37[1] = v14;
  v36[2] = @"result";
  uint64_t v8 = @"doubletap";
  if (!v33) {
    uint64_t v8 = @"tripletap";
  }
  v37[2] = v8;
  v36[3] = @"startTime";
  id v15 = (id)[NSNumber numberWithDouble:v30];
  v37[3] = v15;
  v36[4] = @"endTime";
  id v16 = (id)[NSNumber numberWithDouble:v29];
  v37[4] = v16;
  v36[5] = @"modelDescription";
  if (v35->_modelDescription) {
    modelDescription = (__CFString *)v35->_modelDescription;
  }
  else {
    modelDescription = &stru_26EA3C2C8;
  }
  v37[5] = modelDescription;
  v36[6] = @"modelVersion";
  if (v35->_modelVersion) {
    modelVersion = (__CFString *)v35->_modelVersion;
  }
  else {
    modelVersion = &stru_26EA3C2C8;
  }
  v37[6] = modelVersion;
  id v23 = (id)[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:7];

  id v10 = v23;
  objc_storeStrong(&v23, 0);
  return v10;
}

- (unint64_t)_countThresholdForGesturePrediction:(id)a3
{
  unint64_t var0 = a3.var0;
  int policyOption = self->_policyOption;
  switch(policyOption)
  {
    case 1:
      uint64_t v9 = [(AXPhoenixClassifierConfiguration *)self->_configuration doubleTapPolicyThresholds];
      id v8 = [(NSArray *)v9 objectAtIndex:1];
      unint64_t v14 = [v8 unsignedIntegerValue];

      break;
    case 2:
      id v7 = [(AXPhoenixClassifierConfiguration *)self->_configuration tripleTapPolicyThresholds];
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
  uint64_t v61 = *MEMORY[0x263EF8340];
  $1AB5FA073B851C12C2339EC22442E995 v53 = a3;
  v52 = self;
  SEL v51 = a2;
  double v50 = a4;
  ++self->_sampleCountSinceLastTrigger;
  -[AccelerometerBuffer addData:timestamp:](v52->_accelBuffer, "addData:timestamp:", v53.var0, v53.var1, v53.var2, v50);
  if (!(++v52->_loopCounter % v52->_runFrequency))
  {
    v52->_loopCounter = 0;
    id v49 = 0;
    id v47 = 0;
    id v18 = [(AXPhoenixClassifier *)v52 _multiArrayInputForClassifierWithError:&v47];
    objc_storeStrong(&v49, v47);
    id v48 = v18;
    if (v18)
    {
      id v14 = objc_alloc(MEMORY[0x263F00D38]);
      modelInputName = v52->_modelInputName;
      id v17 = (id)[MEMORY[0x263F00D50] featureValueWithMultiArray:v48];
      id v59 = v17;
      id v16 = (id)[NSDictionary dictionaryWithObjects:&v59 forKeys:&modelInputName count:1];
      id v42 = v49;
      id v15 = objc_msgSend(v14, "initWithDictionary:error:");
      objc_storeStrong(&v49, v42);
      id v43 = v15;

      if (v15)
      {
        classifier = v52->_classifier;
        id v38 = v49;
        id v13 = [(MLModel *)classifier predictionFromFeatures:v43 error:&v38];
        objc_storeStrong(&v49, v38);
        id v39 = v13;
        if (v13)
        {
          id v35 = (id)[v39 featureValueForName:v52->_modelOutputName];
          id v34 = (id)[v35 multiArrayValue];
          id v33 = [[Prediction alloc] initWithModelOutput:v34];
          if (!-[AXPhoenixClassifier _clippedDataShowsPrediction:](v52, "_clippedDataShowsPrediction:", [v33 predictedClass]))
          {
            id v32 = (id)AXLogBackTap();
            os_log_type_t v31 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_INFO))
            {
              __os_log_helper_16_2_2_8_32_8_0((uint64_t)v55, (uint64_t)"-[AXPhoenixClassifier _handleAccelerometerData:withTimestamp:]", [v33 predictedClass]);
              _os_log_impl(&dword_2372C8000, (os_log_t)v32, v31, "[PHOENIX] %s Mitigating back tap. Clipped data doesn't show a %lu", v55, 0x16u);
            }
            objc_storeStrong(&v32, 0);
            [v33 setPredictedClass:0];
            [v33 setNoneScore:1.0];
          }
          [(PredictionsBuffer *)v52->_predictionsBuffer addPrediction:v33];
          uint64_t v29 = 0;
          unint64_t v30 = 0;
          uint64_t v29 = [(PredictionsBuffer *)v52->_predictionsBuffer bestPredictionUsingPolicyOption:v52->_policyOption];
          unint64_t v30 = v5;
          if (v29)
          {
            unint64_t v28 = -[AXPhoenixClassifier _countThresholdForGesturePrediction:](v52, "_countThresholdForGesturePrediction:", v29, v30);
            if (v30 > v28)
            {
              v52->_sampleCountSinceLastTrigger = 0;
              long long v26 = 0u;
              long long v27 = 0u;
              [(AccelerometerBuffer *)v52->_accelBuffer data];
              *(void *)&long long v26 = v6;
              *((void *)&v26 + 1) = v7;
              *(void *)&long long v27 = v8;
              *((void *)&v27 + 1) = v9;
              if (v29 == 1 && (v52->_policyOption & 1) != 0)
              {
                id v25 = [(AXPhoenixClassifier *)v52 _windowData:1];
                -[AXPhoenixClassifier _logWindowData:doubleTap:tapData:](v52, "_logWindowData:doubleTap:tapData:", v25, 0, v26, v27);
                -[AXPhoenixClassifierDelegate phoenixClassifierDidDetectDoubleTap:data:context:](v52->_delegate, "phoenixClassifierDidDetectDoubleTap:data:context:", v52, v25, v26, v27);
                objc_storeStrong(&v25, 0);
              }
              else
              {
                char v23 = 0;
                char v21 = 0;
                BOOL v12 = 0;
                if (v29 == 2)
                {
                  BOOL v12 = 0;
                  if ((v52->_policyOption & 2) != 0)
                  {
                    id v24 = [(PredictionsBuffer *)v52->_predictionsBuffer predictionCounts];
                    char v23 = 1;
                    id v22 = (id)[v24 objectAtIndexedSubscript:1];
                    char v21 = 1;
                    BOOL v12 = (int)[v22 intValue] > 0;
                  }
                }
                if (v21) {

                }
                if (v23) {
                if (v12)
                }
                {
                  id v20 = [(AXPhoenixClassifier *)v52 _windowData:0];
                  -[AXPhoenixClassifier _logWindowData:doubleTap:tapData:](v52, "_logWindowData:doubleTap:tapData:", v20, 0, v26, v27);
                  -[AXPhoenixClassifierDelegate phoenixClassifierDidDetectTripleTap:data:context:](v52->_delegate, "phoenixClassifierDidDetectTripleTap:data:context:", v52, v20, v26, v27);
                  os_log_t oslog = (os_log_t)(id)AXLogBackTap();
                  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
                  {
                    id v11 = [(PredictionsBuffer *)v52->_predictionsBuffer predictionCounts];
                    id v10 = (id)[v11 objectAtIndexedSubscript:1];
                    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v54, (uint64_t)"-[AXPhoenixClassifier _handleAccelerometerData:withTimestamp:]", (uint64_t)v10);
                    _os_log_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Predicted double taps: %@", v54, 0x16u);
                  }
                  objc_storeStrong((id *)&oslog, 0);
                  objc_storeStrong(&v20, 0);
                }
              }
            }
          }
          objc_storeStrong(&v33, 0);
          objc_storeStrong(&v34, 0);
          objc_storeStrong(&v35, 0);
          int v44 = 0;
        }
        else
        {
          id v37 = (id)AXLogBackTap();
          os_log_type_t v36 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_2_8_32_8_64((uint64_t)v56, (uint64_t)"-[AXPhoenixClassifier _handleAccelerometerData:withTimestamp:]", (uint64_t)v49);
            _os_log_error_impl(&dword_2372C8000, (os_log_t)v37, v36, "[PHOENIX] %s Model prediction failed with error: %@", v56, 0x16u);
          }
          objc_storeStrong(&v37, 0);
          [(AXPhoenixClassifierDelegate *)v52->_delegate phoenixClassifier:v52 failedWithError:v49];
          int v44 = 1;
        }
        objc_storeStrong(&v39, 0);
      }
      else
      {
        id v41 = (id)AXLogBackTap();
        os_log_type_t v40 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v57, (uint64_t)"-[AXPhoenixClassifier _handleAccelerometerData:withTimestamp:]", (uint64_t)v52->_modelInputName, (uint64_t)v49);
          _os_log_error_impl(&dword_2372C8000, (os_log_t)v41, v40, "[PHOENIX] %s Failed to create modelInput %@: %@", v57, 0x20u);
        }
        objc_storeStrong(&v41, 0);
        [(AXPhoenixClassifierDelegate *)v52->_delegate phoenixClassifier:v52 failedWithError:v49];
        int v44 = 1;
      }
      objc_storeStrong(&v43, 0);
    }
    else
    {
      id v46 = (id)AXLogBackTap();
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v60, (uint64_t)"-[AXPhoenixClassifier _handleAccelerometerData:withTimestamp:]", (uint64_t)v49);
        _os_log_error_impl(&dword_2372C8000, (os_log_t)v46, type, "[PHOENIX] %s Error creating multiArray: %@", v60, 0x16u);
      }
      objc_storeStrong(&v46, 0);
      [(AXPhoenixClassifierDelegate *)v52->_delegate phoenixClassifier:v52 failedWithError:v49];
      int v44 = 1;
    }
    objc_storeStrong(&v48, 0);
    objc_storeStrong(&v49, 0);
  }
}

- (void)_logWindowData:(id)a3 doubleTap:(BOOL)a4 tapData:(id)a5
{
  $01BB1521EC52D44A8E7628F5261DCEC8 v22 = a5;
  char v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v19 = a4;
  if ([(AXPhoenixClassifier *)v21 falsePositiveLoggingEnabled])
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
    id v14 = __56__AXPhoenixClassifier__logWindowData_doubleTap_tapData___block_invoke;
    id v15 = &unk_264CCE0B8;
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

void __56__AXPhoenixClassifier__logWindowData_doubleTap_tapData___block_invoke(id *a1, char a2, id obj)
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

- (BOOL)_clippedDataShowsPrediction:(unint64_t)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  os_log_type_t v36 = self;
  SEL v35 = a2;
  unint64_t v34 = a3;
  if (a3)
  {
    double v33 = 0.0;
    double v33 = fmax(0.35, fmin(0.7, v36->_tapSpeed));
    double v32 = 0.0;
    double v32 = (double)(v36->_frameLength / 0xA);
    int policyOption = v36->_policyOption;
    switch(policyOption)
    {
      case 1:
        double v32 = v33 + 0.1;
        break;
      case 2:
        double v32 = v33 * 2.0 + 0.1;
        break;
      case 3:
        if (v34 == 1) {
          double v13 = v33 * 2.0 + -0.1;
        }
        else {
          double v13 = v33 * 2.0 + 1.0;
        }
        double v32 = v13;
        break;
    }
    double v32 = fmin(2.0, v32);
    id v31 = 0;
    id v29 = 0;
    id v12 = [(AXPhoenixClassifier *)v36 _clippedMultiArrayInputWithError:&v29 beforeTime:v32];
    objc_storeStrong(&v31, v29);
    id v30 = v12;
    if (v12)
    {
      id v8 = objc_alloc(MEMORY[0x263F00D38]);
      modelInputName = v36->_modelInputName;
      id v11 = (id)[MEMORY[0x263F00D50] featureValueWithMultiArray:v30];
      id v41 = v11;
      id v10 = (id)[NSDictionary dictionaryWithObjects:&v41 forKeys:&modelInputName count:1];
      id v24 = v31;
      uint64_t v9 = objc_msgSend(v8, "initWithDictionary:error:");
      objc_storeStrong(&v31, v24);
      id v25 = v9;

      if (v9)
      {
        classifier = v36->_classifier;
        id obj = v31;
        id v7 = [(MLModel *)classifier predictionFromFeatures:v25 error:&obj];
        objc_storeStrong(&v31, obj);
        id v21 = v7;
        if (v7)
        {
          id v17 = (id)[v21 featureValueForName:v36->_modelOutputName];
          id v16 = (id)[v17 multiArrayValue];
          id v4 = [Prediction alloc];
          id v15 = [(Prediction *)v4 initWithModelOutput:v16];
          uint64_t v5 = [(Prediction *)v15 predictedClass];
          BOOL v37 = v5 == v34;
          int v26 = 1;
          objc_storeStrong((id *)&v15, 0);
          objc_storeStrong(&v16, 0);
          objc_storeStrong(&v17, 0);
        }
        else
        {
          os_log_t oslog = (os_log_t)(id)AXLogBackTap();
          os_log_type_t v18 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_2_8_32_8_64((uint64_t)v38, (uint64_t)"-[AXPhoenixClassifier _clippedDataShowsPrediction:]", (uint64_t)v31);
            _os_log_error_impl(&dword_2372C8000, oslog, v18, "[PHOENIX] %s Model prediction failed with error: %@", v38, 0x16u);
          }
          objc_storeStrong((id *)&oslog, 0);
          [(AXPhoenixClassifierDelegate *)v36->_delegate phoenixClassifier:v36 failedWithError:v31];
          BOOL v37 = 0;
          int v26 = 1;
        }
        objc_storeStrong(&v21, 0);
      }
      else
      {
        id v23 = (id)AXLogBackTap();
        os_log_type_t v22 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v39, (uint64_t)"-[AXPhoenixClassifier _clippedDataShowsPrediction:]", (uint64_t)v36->_modelInputName, (uint64_t)v31);
          _os_log_error_impl(&dword_2372C8000, (os_log_t)v23, v22, "[PHOENIX] %s Failed to create modelInput %@: %@", v39, 0x20u);
        }
        objc_storeStrong(&v23, 0);
        [(AXPhoenixClassifierDelegate *)v36->_delegate phoenixClassifier:v36 failedWithError:v31];
        BOOL v37 = 0;
        int v26 = 1;
      }
      objc_storeStrong(&v25, 0);
    }
    else
    {
      id v28 = (id)AXLogBackTap();
      os_log_type_t v27 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v42, (uint64_t)"-[AXPhoenixClassifier _clippedDataShowsPrediction:]", (uint64_t)v31);
        _os_log_error_impl(&dword_2372C8000, (os_log_t)v28, v27, "[PHOENIX] %s Error creating multiArray: %@", v42, 0x16u);
      }
      objc_storeStrong(&v28, 0);
      [(AXPhoenixClassifierDelegate *)v36->_delegate phoenixClassifier:v36 failedWithError:v31];
      BOOL v37 = 0;
      int v26 = 1;
    }
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
  }
  else
  {
    return 1;
  }
  return v37;
}

- (id)_clippedMultiArrayInputWithError:(id *)a3 beforeTime:(double)a4
{
  v42[3] = *MEMORY[0x263EF8340];
  id v41 = self;
  SEL v40 = a2;
  id v39 = a3;
  double v38 = a4;
  double v35 = 0.0;
  double v36 = 0.0;
  double v37 = 0.0;
  id v34 = [(AccelerometerBuffer *)self->_accelBuffer bufferWithMovingSum:&v35];
  double v31 = 0.0;
  double v32 = 0.0;
  double v33 = 0.0;
  double v31 = v35 / (double)v41->_frameLength;
  double v32 = v36 / (double)v41->_frameLength;
  double v33 = v37 / (double)v41->_frameLength;
  id v30 = 0;
  unint64_t v29 = 0;
  uint64_t v4 = [v34 count];
  unint64_t v29 = v4 - v41->_frameLength;
  unint64_t v28 = (unint64_t)(v38 * 100.0);
  for (unint64_t i = v29; ; ++i)
  {
    unint64_t v19 = i;
    if (v19 >= [v34 count]) {
      break;
    }
    unint64_t v26 = i - v29;
    unint64_t v25 = i - v29;
    unint64_t v24 = 0;
    unint64_t v24 = i - v29 + v41->_frameLength;
    uint64_t v23 = 0;
    uint64_t v23 = i - v29 + 2 * v41->_frameLength;
    id v22 = (id)[v34 objectAtIndexedSubscript:i];
    unint64_t v18 = i;
    uint64_t v5 = [v34 count];
    if (v18 < v5 - v29 - v28)
    {
      id v15 = (id)[v34 objectAtIndexedSubscript:i];
      objc_msgSend(v15, "setX:");

      id v16 = (id)[v34 objectAtIndexedSubscript:i];
      [v16 setY:0.0];

      id v17 = (id)[v34 objectAtIndexedSubscript:i];
      [v17 setZ:0.0];
    }
    [v22 x];
    v41->_arrayDataPointer[v25] = v6 - v31;
    [v22 y];
    v41->_arrayDataPointer[v24] = v7 - v32;
    [v22 z];
    v41->_arrayDataPointer[v23] = v8 - v33;
    objc_storeStrong(&v22, 0);
  }
  uint64_t v21 = 65600;
  id v13 = (id)[NSNumber numberWithUnsignedInteger:v41->_frameLength];
  v42[0] = v13;
  v42[1] = &unk_26EA419B0;
  v42[2] = &unk_26EA419B0;
  id v20 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:3];

  id v9 = objc_alloc(MEMORY[0x263F00DA8]);
  id v10 = (void *)[v9 initWithDataPointer:v41->_arrayDataPointer shape:v41->_shape dataType:v21 strides:v20 deallocator:&__block_literal_global_3 error:v39];
  id v11 = v30;
  id v30 = v10;

  id v14 = v30;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v34, 0);
  return v14;
}

- (id)_multiArrayInputForClassifierWithError:(id *)a3
{
  v38[3] = *MEMORY[0x263EF8340];
  double v37 = self;
  SEL v36 = a2;
  double v35 = a3;
  BOOL shouldResetBuffer = 0;
  BOOL shouldResetBuffer = self->_shouldResetBuffer;
  if (shouldResetBuffer)
  {
    v37->_BOOL shouldResetBuffer = 0;
    [(AccelerometerBuffer *)v37->_accelBuffer resetMovingSum];
    [(PredictionsBuffer *)v37->_predictionsBuffer reset];
  }
  double v31 = 0.0;
  double v32 = 0.0;
  double v33 = 0.0;
  id v30 = [(AccelerometerBuffer *)v37->_accelBuffer bufferWithMovingSum:&v31];
  double v27 = 0.0;
  double v28 = 0.0;
  double v29 = 0.0;
  double v27 = v31 / (double)v37->_frameLength;
  double v28 = v32 / (double)v37->_frameLength;
  double v29 = v33 / (double)v37->_frameLength;
  id v26 = 0;
  unint64_t v25 = 0;
  uint64_t v3 = [v30 count];
  unint64_t v25 = v3 - v37->_frameLength;
  for (unint64_t i = v25; ; ++i)
  {
    unint64_t v16 = i;
    if (v16 >= [v30 count]) {
      break;
    }
    unint64_t v23 = i - v25;
    unint64_t v22 = i - v25;
    unint64_t v21 = 0;
    unint64_t v21 = i - v25 + v37->_frameLength;
    uint64_t v20 = 0;
    uint64_t v20 = i - v25 + 2 * v37->_frameLength;
    if (shouldResetBuffer)
    {
      id v13 = (id)[v30 objectAtIndexedSubscript:i];
      objc_msgSend(v13, "setX:");

      id v14 = (id)[v30 objectAtIndexedSubscript:i];
      [v14 setY:0.0];

      id v15 = (id)[v30 objectAtIndexedSubscript:i];
      [v15 setZ:0.0];
    }
    id v19 = (id)[v30 objectAtIndexedSubscript:i];
    [v19 x];
    v37->_arrayDataPointer[v22] = v4 - v27;
    [v19 y];
    v37->_arrayDataPointer[v21] = v5 - v28;
    [v19 z];
    v37->_arrayDataPointer[v20] = v6 - v29;
    objc_storeStrong(&v19, 0);
  }
  uint64_t v18 = 65600;
  id v11 = (id)[NSNumber numberWithUnsignedInteger:v37->_frameLength];
  v38[0] = v11;
  v38[1] = &unk_26EA419B0;
  v38[2] = &unk_26EA419B0;
  id v17 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:3];

  id v7 = objc_alloc(MEMORY[0x263F00DA8]);
  double v8 = (void *)[v7 initWithDataPointer:v37->_arrayDataPointer shape:v37->_shape dataType:v18 strides:v17 deallocator:&__block_literal_global_239 error:v35];
  id v9 = v26;
  id v26 = v8;

  id v12 = v26;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v30, 0);
  return v12;
}

- (BOOL)falsePositiveLoggingEnabled
{
  return self->_falsePositiveLoggingEnabled;
}

- (void)setFalsePositiveLoggingEnabled:(BOOL)a3
{
  self->_falsePositiveLoggingEnabled = a3;
}

- (void).cxx_destruct
{
}

@end