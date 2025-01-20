@interface SCMLImageAnalyzer
+ (id)_decodeName:(id)a3;
+ (id)_encodeName:(id)a3;
+ (id)_readOperatingThresholdsDataUsingModelURL:(id)a3 error:(id *)a4;
+ (id)getOperatingPointDataForClassName:(id)a3 modelURL:(id)a4 error:(id *)a5;
- (BOOL)isSensitive:(id)a3 sensitivityScore:(id *)a4;
- (BOOL)isSensitive:(id)a3 sensitivityScore:(id *)a4 classificationMode:(unint64_t)a5;
- (BOOL)loadNetworkForURL:(id)a3 espressoEngine:(int)a4 storageType:(int)a5 deviceId:(int)a6;
- (BOOL)otgxRetrieveAllClasses;
- (BOOL)shouldProcessDetections;
- (NSDictionary)acceptedDetectionOutputIndices;
- (NSDictionary)acceptedOutputIndices;
- (NSDictionary)detectionThresholdByOutputIndex;
- (NSNumber)otgxMainThreshold;
- (NSURL)modelUrl;
- (NetworkOutputs)_computeOutputForPixelBuffer:(SEL)a3 error:(__CVBuffer *)a4;
- (SCMLImageAnalyzer)initWithModelURL:(id)a3 options:(id)a4 error:(id *)a5;
- (id)_processNetworkOutput:(NetworkOutputs *)a3;
- (id)analyzeImage:(CGImage *)a3 error:(id *)a4;
- (id)analyzePixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (id)classifyImage:(CGImage *)a3 error:(id *)a4;
- (id)classifyPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (id)generateClassificationScoresForImage:(CGImage *)a3 error:(id *)a4;
- (id)generateClassificationScoresForPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (id)scaleMethod;
- (int)_espressoDeviceId;
- (int)_espressoEngine;
- (int)_espressoStorageType;
- (unint64_t)otgxMainIndex;
- (vector<SCML::BoxInfo,)_processDetectionOutput:(SCMLImageAnalyzer *)self;
- (void)_extractThresholdForOTGXMain:(id)a3;
- (void)dealloc;
@end

@implementation SCMLImageAnalyzer

- (SCMLImageAnalyzer)initWithModelURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v66.receiver = self;
  v66.super_class = (Class)SCMLImageAnalyzer;
  v11 = [(SCMLModelBase *)&v66 initWithOptions:v10];
  v12 = v11;
  if (!v11) {
    goto LABEL_80;
  }
  objc_storeStrong((id *)&v11->_modelUrl, a3);
  v13 = [v10 objectForKeyedSubscript:SCMLEnableAllClasses[0]];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    v15 = [v10 objectForKeyedSubscript:SCMLEnableAllClasses[0]];
  }
  else
  {
    v15 = 0;
  }
  v12->_otgxRetrieveAllClasses = [v15 BOOLValue];
  if (isKindOfClass) {

  }
  uint64_t v16 = [v10 objectForKeyedSubscript:SCMLUseMTLDevice[0]];
  BOOL v17 = +[SCMLHandler supportsANE];
  v60 = (void *)v16;
  if (v16) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = v17;
  }
  v58 = [NSString stringWithFormat:@"self ENDSWITH '%@_quantized.espresso.net'", @"1.7.9"];
  v59 = [NSString stringWithFormat:@"self ENDSWITH '%@_quantized_sqdev.espresso.net'", @"1.7.9"];
  v19 = v60;
  v57 = [MEMORY[0x263F08850] defaultManager];
  v20 = [v9 path];
  v61 = [v57 contentsOfDirectoryAtPath:v20 error:0];

  id v21 = [MEMORY[0x263F08A98] predicateWithFormat:v58];
  v62 = v21;
  if (v18)
  {
    v62 = [MEMORY[0x263F08A98] predicateWithFormat:v59];
  }
  v63 = [v61 filteredArrayUsingPredicate:v21];
  v64 = [v61 filteredArrayUsingPredicate:v62];
  if ([v63 count])
  {
    v22 = [v63 firstObject];
    v23 = [v9 URLByAppendingPathComponent:v22];
  }
  else
  {
    v24 = +[SCMLLog imageAnalyzer];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[SCMLImageAnalyzer initWithModelURL:options:error:](v24);
    }

    if (![v64 count])
    {
      if (a5)
      {
        *a5 = [MEMORY[0x263F087E8] errorWithDomain:SCMLErrorDomain[0] code:1 userInfo:0];
      }

      goto LABEL_81;
    }
    v23 = 0;
  }
  if ([v64 count])
  {
    v25 = [v64 firstObject];
    id v56 = [v9 URLByAppendingPathComponent:v25];
  }
  else
  {
    id v56 = v23;
    v25 = +[SCMLLog imageAnalyzer];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25BF41000, v25, OS_LOG_TYPE_DEFAULT, "ANE-specific ivs model files not found. Falling back to the default model.", buf, 2u);
    }
  }

  uint64_t v26 = +[SCMLImageAnalyzer _readOperatingThresholdsDataUsingModelURL:v9 error:a5];
  v55 = (void *)v26;
  if (a5 && *a5) {
    goto LABEL_24;
  }
  [(SCMLImageAnalyzer *)v12 _extractThresholdForOTGXMain:v26];
  v28 = [v10 objectForKeyedSubscript:SCMLUseAnyAvailableDevice[0]];
  objc_opt_class();
  char v29 = objc_opt_isKindOfClass();
  if (v29)
  {
    v30 = [v10 objectForKeyedSubscript:SCMLUseAnyAvailableDevice[0]];
  }
  else
  {
    v30 = 0;
  }
  int v31 = [v30 BOOLValue];
  if (v29) {

  }
  if (v31 && +[SCMLHandler supportsANE])
  {
    v19 = v60;
    if (!v60)
    {
      int v32 = 1;
      int v33 = 1;
      goto LABEL_61;
    }
LABEL_41:
    char v37 = [(SCMLImageAnalyzer *)v12 loadNetworkForURL:v23 espressoEngine:5 storageType:65552 deviceId:espresso_device_id_for_metal_device()];
    char v27 = v37;
    if (a5) {
      char v38 = v37;
    }
    else {
      char v38 = 1;
    }
    if ((v38 & 1) == 0)
    {
      v39 = [MEMORY[0x263F087E8] errorWithDomain:SCMLErrorDomain[0] code:5 userInfo:0];
LABEL_78:
      char v27 = 0;
      *a5 = v39;
      goto LABEL_79;
    }
    goto LABEL_79;
  }
  v34 = [v10 objectForKeyedSubscript:SCMLUseANE[0]];
  objc_opt_class();
  char v35 = objc_opt_isKindOfClass();
  if (v35)
  {
    v36 = [v10 objectForKeyedSubscript:SCMLUseANE[0]];
  }
  else
  {
    v36 = 0;
  }
  int v54 = [v36 BOOLValue];
  if (v35) {

  }
  if (v31)
  {
    int v32 = 1;
    int v33 = 1;
    v19 = v60;
    if (v60) {
      goto LABEL_41;
    }
  }
  else
  {
    v40 = [v10 objectForKeyedSubscript:SCMLUseGPU[0]];
    objc_opt_class();
    char v41 = objc_opt_isKindOfClass();
    if (v41)
    {
      v42 = [v10 objectForKeyedSubscript:SCMLUseGPU[0]];
    }
    else
    {
      v42 = 0;
    }
    int v43 = [v42 BOOLValue];
    if (v41) {

    }
    int v53 = v43;
    v44 = [v10 objectForKeyedSubscript:SCMLUseCPU[0]];
    objc_opt_class();
    char v45 = objc_opt_isKindOfClass();
    if (v45)
    {
      v46 = [v10 objectForKeyedSubscript:SCMLUseCPU[0]];
    }
    else
    {
      v46 = 0;
    }
    int v33 = [v46 BOOLValue];
    if (v45) {

    }
    v19 = v60;
    int v32 = v53;
    if (v60) {
      goto LABEL_41;
    }
  }
  if (v54)
  {
LABEL_61:
    BOOL v47 = [(SCMLImageAnalyzer *)v12 loadNetworkForURL:v56 espressoEngine:10007 storageType:65552 deviceId:0xFFFFFFFFLL];
    if (((v47 | v32 | v33) & 1) == 0)
    {
      if (a5)
      {
        uint64_t v48 = 2;
LABEL_77:
        v39 = [MEMORY[0x263F087E8] errorWithDomain:SCMLErrorDomain[0] code:v48 userInfo:0];
        goto LABEL_78;
      }
LABEL_24:
      char v27 = 0;
      goto LABEL_79;
    }
    goto LABEL_65;
  }
  LOBYTE(v47) = 0;
LABEL_65:
  if (!v47)
  {
    if (v32)
    {
      BOOL v47 = [(SCMLImageAnalyzer *)v12 loadNetworkForURL:v23 espressoEngine:5 storageType:65552 deviceId:0xFFFFFFFFLL];
      if (((v47 | v33) & 1) == 0)
      {
        if (a5)
        {
          uint64_t v48 = 3;
          goto LABEL_77;
        }
        goto LABEL_24;
      }
    }
  }
  char v27 = 1;
  if (!v47 && ((v33 ^ 1) & 1) == 0)
  {
    char v49 = [(SCMLImageAnalyzer *)v12 loadNetworkForURL:v23 espressoEngine:0 storageType:65568 deviceId:0xFFFFFFFFLL];
    char v27 = v49;
    char v50 = a5 ? v49 : 1;
    if ((v50 & 1) == 0)
    {
      uint64_t v48 = 4;
      goto LABEL_77;
    }
  }
LABEL_79:

  if ((v27 & 1) == 0)
  {
LABEL_81:
    v51 = 0;
    goto LABEL_82;
  }
LABEL_80:
  v51 = v12;
LABEL_82:

  return v51;
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)SCMLImageAnalyzer;
  [(SCMLImageAnalyzer *)&v3 dealloc];
}

- (BOOL)loadNetworkForURL:(id)a3 espressoEngine:(int)a4 storageType:(int)a5 deviceId:(int)a6
{
  id v10 = a3;
  context = (void *)espresso_create_context();
  self->encoderCtx = context;
  if (!context)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::to_string(&v35, a4);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>("Could not create espresso context for engine: ", &v35, &v36);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(" and device id: ", &v36, &v37);
    std::to_string(&v34, a6);
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v16 = &v34;
    }
    else {
      uint64_t v16 = (std::string *)v34.__r_.__value_.__r.__words[0];
    }
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v34.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v34.__r_.__value_.__l.__size_;
    }
    BOOL v18 = std::string::append(&v37, (const std::string::value_type *)v16, size);
    long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    std::string::size_type v39 = v18->__r_.__value_.__r.__words[2];
    long long v38 = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x26117A7E0](exception, &v38);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  self->encoderPlan = (void *)espresso_create_plan();
  id v12 = [v10 path];
  [v12 UTF8String];
  int v13 = espresso_plan_add_network();

  if (v13)
  {
    v20 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v20, v21);
    __cxa_throw(v20, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (espresso_plan_build())
  {
    v22 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v22, v23);
    __cxa_throw(v22, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  long long v38 = 0uLL;
  std::string::size_type v39 = 0;
  memset(&v37, 0, sizeof(v37));
  if (c_network_get_input_names())
  {
    v24 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v24, v25);
    __cxa_throw(v24, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (espresso_network_query_blob_dimensions())
  {
    uint64_t v26 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v26, v27);
    __cxa_throw(v26, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (espresso_network_bind_buffer())
  {
    v28 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v28, v29);
    __cxa_throw(v28, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if ([(SCMLImageAnalyzer *)self shouldProcessDetections])
  {
    if (espresso_network_bind_buffer())
    {
      v30 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v30, v31);
      __cxa_throw(v30, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    if (espresso_network_bind_buffer())
    {
      int v32 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v32, v33);
      __cxa_throw(v32, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  self->__espressoEngine = a4;
  self->__espressoDeviceId = a6;
  self->__espressoStorageType = a5;
  v36.__r_.__value_.__r.__words[0] = (std::string::size_type)&v37;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v36);
  v37.__r_.__value_.__r.__words[0] = (std::string::size_type)&v38;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);

  return 1;
}

+ (id)_readOperatingThresholdsDataUsingModelURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x263F08850] defaultManager];
  v7 = [v5 path];
  v8 = [v6 contentsOfDirectoryAtPath:v7 error:a4];

  if (a4 && *a4)
  {
    a4 = 0;
  }
  else
  {
    id v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"self ENDSWITH 'operating_thresholds.json'"];
    id v10 = [v8 filteredArrayUsingPredicate:v9];
    v11 = [v10 firstObject];
    id v12 = [v5 URLByAppendingPathComponent:v11];

    int v13 = (void *)MEMORY[0x263EFF8F8];
    v14 = [v12 path];
    v15 = [v13 dataWithContentsOfFile:v14];

    if (v15)
    {
      uint64_t v16 = [MEMORY[0x263F08900] JSONObjectWithData:v15 options:0 error:a4];
      BOOL v17 = v16;
      if (a4 && *a4) {
        a4 = 0;
      }
      else {
        a4 = v16;
      }
    }
    else if (a4)
    {
      BOOL v18 = [v12 path];
      scml::strFromNSString(v18, __p);
      scml::strCat<char const(&)[38],std::string>("unable to read operating thresholds: ", (uint64_t)__p, v24);
      if (v23 < 0) {
        operator delete(__p[0]);
      }

      if ((v25 & 0x80u) == 0) {
        long long v19 = v24;
      }
      else {
        long long v19 = (void **)v24[0];
      }
      if ((v25 & 0x80u) == 0) {
        uint64_t v20 = v25;
      }
      else {
        uint64_t v20 = (uint64_t)v24[1];
      }
      scml::error(9u, (uint64_t)v19, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      if ((char)v25 < 0) {
        operator delete(v24[0]);
      }
      a4 = 0;
    }
  }

  return a4;
}

+ (id)_encodeName:(id)a3
{
  id v3 = a3;
  v4 = +[SCMLImageLabelCoder instance];
  id v5 = [v4 encodeToHex:v3];
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v9, (char *)[v3 UTF8String]);
    __n128 v8 = std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>("Name could not be encoded: ", &v9, &v10);
    MEMORY[0x26117A7E0](exception, &v10, v8);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }

  return v5;
}

+ (id)_decodeName:(id)a3
{
  id v3 = a3;
  v4 = +[SCMLImageLabelCoder instance];
  id v5 = [v4 decodeFromHex:v3];
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v9, (char *)[v3 UTF8String]);
    __n128 v8 = std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>("Name could not be encoded: ", &v9, &v10);
    MEMORY[0x26117A7E0](exception, &v10, v8);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }

  return v5;
}

- (void)_extractThresholdForOTGXMain:(id)a3
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v50 = a3;
  int v53 = [MEMORY[0x263EFF9A0] dictionary];
  id v5 = [v50 objectForKeyedSubscript:@"class_thresholds"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v50 objectForKeyedSubscript:@"class_thresholds"];
  }
  else
  {
    v6 = 0;
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
  if (v7)
  {
    uint64_t v57 = *(void *)v67;
    do
    {
      uint64_t v59 = v7;
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v67 != v57) {
          objc_enumerationMutation(obj);
        }
        std::string v9 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        std::string v10 = [v9 objectForKeyedSubscript:@"class"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = [v9 objectForKeyedSubscript:@"class"];
        }
        else
        {
          v11 = 0;
        }

        id v12 = [v9 objectForKeyedSubscript:@"index"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v13 = [v9 objectForKeyedSubscript:@"index"];
        }
        else
        {
          int v13 = 0;
        }

        v14 = [v9 objectForKeyedSubscript:@"default"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass)
        {
          uint64_t v16 = [v9 objectForKeyedSubscript:@"default"];
          id v3 = v16;
        }
        else
        {
          uint64_t v16 = 0;
        }
        uint64_t v4 = [v16 BOOLValue];
        if (isKindOfClass) {

        }
        if ([v11 isEqualToString:@"60dc96fd80c33771139d6cf90639a776"])
        {
          BOOL v17 = [v9 objectForKeyedSubscript:@"thresholds"];
          BOOL v18 = [v17 objectForKeyedSubscript:@"balanced"];
          objc_opt_class();
          char v19 = objc_opt_isKindOfClass();
          if (v19)
          {
            id v55 = [v9 objectForKeyedSubscript:@"thresholds"];
            v6 = [v55 objectForKeyedSubscript:@"balanced"];
            uint64_t v20 = v6;
          }
          else
          {
            uint64_t v20 = 0;
          }
          objc_storeStrong((id *)&self->_otgxMainThreshold, v20);
          if (v19)
          {
          }
        }
        if (v13)
        {
          int v21 = self->_otgxRetrieveAllClasses ? 1 : v4;
          if (v21 == 1)
          {
            v22 = +[SCMLImageAnalyzer _decodeName:v11];
            [v53 setObject:v22 forKeyedSubscript:v13];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
    }
    while (v7);
  }

  char v23 = (NSDictionary *)[v53 copy];
  acceptedOutputIndices = self->_acceptedOutputIndices;
  self->_acceptedOutputIndices = v23;

  if ([(SCMLImageAnalyzer *)self shouldProcessDetections])
  {
    unsigned __int8 v25 = [v50 objectForKeyedSubscript:@"detection_thresholds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v49 = [v50 objectForKeyedSubscript:@"detection_thresholds"];
    }
    else
    {
      char v49 = 0;
    }

    v51 = [MEMORY[0x263EFF9A0] dictionary];
    id v52 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v56 = v49;
    uint64_t v28 = [(NSDictionary *)v56 countByEnumeratingWithState:&v62 objects:v70 count:16];
    if (v28)
    {
      uint64_t v58 = *(void *)v63;
      do
      {
        uint64_t v60 = v28;
        for (uint64_t j = 0; j != v60; ++j)
        {
          if (*(void *)v63 != v58) {
            objc_enumerationMutation(v56);
          }
          v30 = *(void **)(*((void *)&v62 + 1) + 8 * j);
          int v31 = objc_msgSend(v30, "objectForKeyedSubscript:", @"class", v49);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v32 = [v30 objectForKeyedSubscript:@"class"];
          }
          else
          {
            int v32 = 0;
          }

          int v33 = [v30 objectForKeyedSubscript:@"index"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            std::string v34 = [v30 objectForKeyedSubscript:@"index"];
          }
          else
          {
            std::string v34 = 0;
          }

          std::string v35 = [v30 objectForKeyedSubscript:@"default"];
          objc_opt_class();
          char v36 = objc_opt_isKindOfClass();
          if (v36)
          {
            std::string v37 = [v30 objectForKeyedSubscript:@"default"];
            uint64_t v4 = (uint64_t)v37;
          }
          else
          {
            std::string v37 = 0;
          }
          int v38 = [v37 BOOLValue];
          if (v36) {

          }
          std::string::size_type v39 = [v30 objectForKeyedSubscript:@"thresholds"];
          v40 = [v39 objectForKeyedSubscript:@"balanced"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v42 = 0;
            if (!v34) {
              goto LABEL_67;
            }
LABEL_62:
            if (self->_otgxRetrieveAllClasses) {
              int v43 = 1;
            }
            else {
              int v43 = v38;
            }
            if (v43 == 1)
            {
              v44 = +[SCMLImageAnalyzer _decodeName:v32];
              [v51 setObject:v44 forKeyedSubscript:v34];
            }
            goto LABEL_67;
          }
          char v41 = [v30 objectForKeyedSubscript:@"thresholds"];
          v42 = [v41 objectForKeyedSubscript:@"balanced"];

          if (v42) {
            [v52 setObject:v42 forKeyedSubscript:v34];
          }
          if (v34) {
            goto LABEL_62;
          }
LABEL_67:
        }
        uint64_t v28 = [(NSDictionary *)v56 countByEnumeratingWithState:&v62 objects:v70 count:16];
      }
      while (v28);
    }

    char v45 = (NSDictionary *)[v51 copy];
    acceptedDetectionOutputIndices = self->_acceptedDetectionOutputIndices;
    self->_acceptedDetectionOutputIndices = v45;

    BOOL v47 = (NSDictionary *)[v52 copy];
    detectionThresholdByOutputIndex = self->_detectionThresholdByOutputIndex;
    self->_detectionThresholdByOutputIndex = v47;

    char v27 = v56;
  }
  else
  {
    uint64_t v26 = self->_acceptedDetectionOutputIndices;
    self->_acceptedDetectionOutputIndices = 0;

    char v27 = self->_detectionThresholdByOutputIndex;
    self->_detectionThresholdByOutputIndex = 0;
  }
}

- (BOOL)isSensitive:(id)a3 sensitivityScore:(id *)a4
{
  return [(SCMLImageAnalyzer *)self isSensitive:a3 sensitivityScore:a4 classificationMode:2];
}

- (BOOL)isSensitive:(id)a3 sensitivityScore:(id *)a4 classificationMode:(unint64_t)a5
{
  id v7 = a3;
  __n128 v8 = [v7 objectForKeyedSubscript:SCMLHandlerImageClassificationScores[0]];
  std::string v9 = +[SCMLImageAnalyzer _decodeName:@"60dc96fd80c33771139d6cf90639a776"];
  std::string v10 = [v8 objectForKeyedSubscript:v9];

  v11 = +[SCMLImageModelThresholds instance];
  id v12 = +[SCMLHandler currentModelVersion];
  id v19 = 0;
  [v11 thresholdForLabel:@"otgx_fyqmjdju" classificationMode:a5 modelVersion:v12 error:&v19];
  double v14 = v13;
  id v15 = v19;

  [v10 floatValue];
  LOBYTE(a5) = v14 <= v16;
  id v17 = v10;
  *a4 = v17;

  return a5;
}

- (id)analyzeImage:(CGImage *)a3 error:(id *)a4
{
  id v5 = [(SCMLImageAnalyzer *)self generateClassificationScoresForImage:a3 error:a4];
  if (v5)
  {
    id v15 = &unk_270979FA8;
    BOOL v6 = [(SCMLImageAnalyzer *)self isSensitive:v5 sensitivityScore:&v15];
    id v7 = v15;
    __n128 v8 = [SCMLImageAnalysisResult alloc];
    std::string v9 = [v5 objectForKeyedSubscript:SCMLHandlerImageClassificationScores[0]];
    std::string v10 = [(SCMLAnalysisResult *)v8 initWithSensitive:v6 sensitivityScore:v7 scoresForLabels:v9];

    if ([(SCMLImageAnalyzer *)self shouldProcessDetections])
    {
      v11 = [SCMLImageDetectionResult alloc];
      id v12 = [v5 objectForKeyedSubscript:SCMLHandlerImageDetections[0]];
      double v13 = [(SCMLImageDetectionResult *)v11 initWithDetections:v12];
      [(SCMLImageAnalysisResult *)v10 setDetectionResult:v13];
    }
  }
  else
  {
    std::string v10 = 0;
  }

  return v10;
}

- (id)classifyImage:(CGImage *)a3 error:(id *)a4
{
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  __n128 v8 = [(SCMLImageAnalyzer *)self generateClassificationScoresForImage:a3 error:a4];
  if (v8)
  {
    id v14 = &unk_270979FA8;
    BOOL v9 = [(SCMLImageAnalyzer *)self isSensitive:v8 sensitivityScore:&v14];
    id v10 = v14;
    if (v9) {
      v11 = &unk_270979FC0;
    }
    else {
      v11 = &unk_270979FD8;
    }
    [v7 setObject:v11 forKeyedSubscript:SCMLImageSensitivity[0]];
    [v7 setObject:v10 forKeyedSubscript:SCMLImageSensitivityScore[0]];
    id v12 = (void *)[v7 copy];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)scaleMethod
{
  v2 = [(SCMLModelBase *)self options];
  id v3 = [v2 objectForKeyedSubscript:SCMLImageScaleMethod[0]];

  BOOL v4 = v3 == SCMLImageScaleMethodvImage[0] || v3 == 0;
  id v5 = SCMLImageScaleMethodCGInterpolationMedium[0];
  if (!v4) {
    id v5 = v3;
  }
  BOOL v6 = v5;

  return v6;
}

- (id)generateClassificationScoresForImage:(CGImage *)a3 error:(id *)a4
{
  uint64_t v32 = 0;
  int v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  id v7 = [(SCMLImageAnalyzer *)self scaleMethod];
  __n128 v8 = [(SCMLModelBase *)self perfResults];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __64__SCMLImageAnalyzer_generateClassificationScoresForImage_error___block_invoke;
  v27[3] = &unk_2654A8FE8;
  id v9 = v7;
  v30 = &v32;
  int v31 = a3;
  id v28 = v9;
  char v29 = self;
  [v8 run:@"Scale" block:v27];

  if (v33[3])
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__0;
    unsigned __int8 v25 = __Block_byref_object_dispose__0;
    id v26 = (id)MEMORY[0x263EFFA78];
    uint64_t v15 = 0;
    float v16 = &v15;
    uint64_t v17 = 0x3032000000;
    BOOL v18 = __Block_byref_object_copy__0;
    id v19 = __Block_byref_object_dispose__0;
    id v20 = 0;
    id v10 = [(SCMLModelBase *)self perfResults];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __64__SCMLImageAnalyzer_generateClassificationScoresForImage_error___block_invoke_78;
    v14[3] = &unk_2654A9010;
    v14[4] = self;
    v14[5] = &v32;
    v14[6] = &v15;
    v14[7] = &v21;
    [v10 run:@"Inference" block:v14];

    CFRelease((CFTypeRef)v33[3]);
    v11 = (void *)v16[5];
    if (v11)
    {
      id v12 = 0;
      if (a4) {
        *a4 = v11;
      }
    }
    else
    {
      id v12 = (id)v22[5];
    }
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
  }
  else if (a4)
  {
    scml::error(7u, (uint64_t)"Failed to convert to pixel buffer", 33);
    id v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }

  _Block_object_dispose(&v32, 8);

  return v12;
}

CVPixelBufferRef __64__SCMLImageAnalyzer_generateClassificationScoresForImage_error___block_invoke(uint64_t a1)
{
  CGInterpolationQuality v3 = kCGInterpolationNone;
  interpolationForScaleMethod(*(void **)(a1 + 32), (int *)&v3);
  CVPixelBufferRef result = scaledPixelBuffer32BGRAFromCGImage(*(CGImage **)(a1 + 56), *(void *)(*(void *)(a1 + 40) + 24), *(void *)(*(void *)(a1 + 40) + 32), v3);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

double __64__SCMLImageAnalyzer_generateClassificationScoresForImage_error___block_invoke_78(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[5] + 8) + 24);
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v4 + 40);
  BOOL v6 = (id *)(v4 + 40);
  id v5 = v7;
  obuint64_t j = v7;
  if (v2)
  {
    [v2 _computeOutputForPixelBuffer:v3 error:&obj];
    objc_storeStrong(v6, obj);
    if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
      return result;
    }
    goto LABEL_3;
  }
  double result = 0.0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  if (!v5)
  {
LABEL_3:
    id v9 = (void *)a1[4];
    v13[0] = v15;
    v13[1] = v16;
    v13[2] = v17;
    v13[3] = v18;
    uint64_t v10 = [v9 _processNetworkOutput:v13];
    uint64_t v11 = *(void *)(a1[7] + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  return result;
}

- (id)analyzePixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  id v5 = [(SCMLImageAnalyzer *)self generateClassificationScoresForPixelBuffer:a3 error:a4];
  if (v5)
  {
    id v15 = &unk_270979FA8;
    BOOL v6 = [(SCMLImageAnalyzer *)self isSensitive:v5 sensitivityScore:&v15];
    id v7 = v15;
    __n128 v8 = [SCMLImageAnalysisResult alloc];
    id v9 = [v5 objectForKeyedSubscript:SCMLHandlerImageClassificationScores[0]];
    uint64_t v10 = [(SCMLAnalysisResult *)v8 initWithSensitive:v6 sensitivityScore:v7 scoresForLabels:v9];

    if ([(SCMLImageAnalyzer *)self shouldProcessDetections])
    {
      uint64_t v11 = [SCMLImageDetectionResult alloc];
      id v12 = [v5 objectForKeyedSubscript:SCMLHandlerImageDetections[0]];
      double v13 = [(SCMLImageDetectionResult *)v11 initWithDetections:v12];
      [(SCMLImageAnalysisResult *)v10 setDetectionResult:v13];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)classifyPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  __n128 v8 = [(SCMLImageAnalyzer *)self generateClassificationScoresForPixelBuffer:a3 error:a4];
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:SCMLHandlerImageClassificationScores[0]];
    uint64_t v11 = +[SCMLImageAnalyzer _decodeName:@"60dc96fd80c33771139d6cf90639a776"];
    id v12 = [v10 objectForKeyedSubscript:v11];

    [v12 floatValue];
    float v14 = v13;
    id v15 = [(SCMLImageAnalyzer *)self otgxMainThreshold];
    [v15 floatValue];
    float v17 = v16;

    if (v14 >= v17) {
      long long v18 = &unk_270979FC0;
    }
    else {
      long long v18 = &unk_270979FD8;
    }
    [v7 setObject:v18 forKeyedSubscript:SCMLImageSensitivity[0]];
    [v7 setObject:v12 forKeyedSubscript:SCMLImageSensitivityScore[0]];
    id v19 = (void *)[v7 copy];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)generateClassificationScoresForPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  uint64_t v38 = 0;
  std::string::size_type v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  id v7 = [(SCMLModelBase *)self perfResults];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __70__SCMLImageAnalyzer_generateClassificationScoresForPixelBuffer_error___block_invoke;
  v37[3] = &unk_2654A9038;
  v37[5] = &v38;
  v37[6] = a3;
  v37[4] = self;
  [v7 run:@"Scale" block:v37];

  if (v39[3])
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x7012000000;
    id v26 = __Block_byref_object_copy__79;
    char v27 = __Block_byref_object_dispose__80;
    id v28 = &unk_25C010B3D;
    uint64_t v29 = 0;
    int v30 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    int v33 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    int v36 = 0;
    uint64_t v17 = 0;
    long long v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy__0;
    uint64_t v21 = __Block_byref_object_dispose__0;
    id v22 = 0;
    __n128 v8 = [(SCMLModelBase *)self perfResults];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __70__SCMLImageAnalyzer_generateClassificationScoresForPixelBuffer_error___block_invoke_81;
    v16[3] = &unk_2654A9060;
    v16[4] = self;
    v16[5] = &v23;
    v16[6] = &v38;
    v16[7] = &v17;
    [v8 run:@"Inference" block:v16];

    id v9 = (__CVBuffer *)v39[3];
    if (v9 != a3)
    {
      CVPixelBufferUnlockBaseAddress(v9, 0);
      CFRelease((CFTypeRef)v39[3]);
    }
    uint64_t v10 = (void *)v18[5];
    if (v10)
    {
      uint64_t v11 = 0;
      if (a4) {
        *a4 = v10;
      }
    }
    else
    {
      long long v12 = *((_OWORD *)v24 + 4);
      v15[0] = *((_OWORD *)v24 + 3);
      v15[1] = v12;
      long long v13 = *((_OWORD *)v24 + 6);
      v15[2] = *((_OWORD *)v24 + 5);
      v15[3] = v13;
      uint64_t v11 = [(SCMLImageAnalyzer *)self _processNetworkOutput:v15];
    }
    _Block_object_dispose(&v17, 8);

    _Block_object_dispose(&v23, 8);
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:SCMLErrorDomain[0] code:7 userInfo:0];
    uint64_t v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v11 = 0;
  }
  _Block_object_dispose(&v38, 8);

  return v11;
}

__CVBuffer *__70__SCMLImageAnalyzer_generateClassificationScoresForPixelBuffer_error___block_invoke(uint64_t a1)
{
  double result = scaleCVPixelBuffer(*(CVPixelBufferRef *)(a1 + 48), (size_t *)(*(void *)(a1 + 32) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

double __70__SCMLImageAnalyzer_generateClassificationScoresForPixelBuffer_error___block_invoke_81(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 24);
  uint64_t v4 = *(void *)(a1[7] + 8);
  BOOL v6 = *(void **)(v4 + 40);
  id v5 = (id *)(v4 + 40);
  obuint64_t j = v6;
  if (v2)
  {
    [v2 _computeOutputForPixelBuffer:v3 error:&obj];
    objc_storeStrong(v5, obj);
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
  }
  id v7 = *(_OWORD **)(a1[5] + 8);
  double result = *(double *)&v13;
  long long v9 = v14;
  long long v11 = v15;
  long long v10 = v16;
  v7[3] = v13;
  v7[4] = v9;
  v7[5] = v11;
  v7[6] = v10;
  return result;
}

- (NetworkOutputs)_computeOutputForPixelBuffer:(SEL)a3 error:(__CVBuffer *)a4
{
  if (espresso_network_bind_cvpixelbuffer())
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(exception, v12);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (espresso_plan_execute_sync())
  {
    long long v13 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v13, v14);
    __cxa_throw(v13, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if ([(SCMLImageAnalyzer *)self shouldProcessDetections])
  {
  }
  else
  {
    long long v17 = 0uLL;
    int v18 = 0;
  }
  double result = (NetworkOutputs *)[(SCMLImageAnalyzer *)self shouldProcessDetections];
  if (result)
  {
  }
  else
  {
    long long v15 = 0uLL;
    int v16 = 0;
  }
  if (self->leafProbabilities.sequence_length != 1)
  {
    long long v9 = "buf->sequence_length == 1";
    int v10 = 488;
    goto LABEL_18;
  }
  if (self->leafProbabilities.batch_number != 1)
  {
    long long v9 = "buf->batch_number == 1";
    int v10 = 489;
    goto LABEL_18;
  }
  if (self->leafProbabilities.height != 1)
  {
    long long v9 = "buf->height == 1";
    int v10 = 490;
    goto LABEL_18;
  }
  if (self->leafProbabilities.width != 1)
  {
    long long v9 = "buf->width == 1";
    int v10 = 491;
LABEL_18:
    __assert_rtn("tensorViewC", "SCMLImageAnalyzer.mm", v10, v9);
  }
  uint64_t channels_low = LODWORD(self->leafProbabilities.channels);
  retstr->var0.var0 = (float *)self->leafProbabilities.data;
  *(void *)retstr->var0.var1.var0 = channels_low;
  *(_OWORD *)&retstr->var1.var0 = v17;
  retstr->var1.var1.var0[2] = v18;
  *(_OWORD *)&retstr->var2.var0 = v15;
  retstr->var2.var1.var0[2] = v16;
  return result;
}

- (vector<SCML::BoxInfo,)_processDetectionOutput:(SCMLImageAnalyzer *)self
{
  uint64_t v6 = *(void *)a4->var1.var1.var0;
  int v7 = a4->var1.var1.var0[2];
  v15[0] = (uint64_t)a4->var1.var0;
  v15[1] = v6;
  int v16 = v7;
  SCML::extractLocalPeaks(v15, 3, v17);
  v13[0] = v17[0];
  v13[1] = v6;
  int v14 = v7;
  uint64_t v8 = *(void *)a4->var2.var1.var0;
  int v9 = a4->var2.var1.var0[2];
  v11[0] = a4->var2.var0;
  v11[1] = v8;
  int v12 = v9;
  SCML::topDetections((uint64_t)v13, (uint64_t)v11, 100, (unint64_t *)retstr);
  double result = (vector<SCML::BoxInfo, std::allocator<SCML::BoxInfo>> *)v17[0];
  if (v17[0])
  {
    v17[1] = v17[0];
    operator delete(v17[0]);
  }
  return result;
}

- (BOOL)shouldProcessDetections
{
  v2 = self;
  uint64_t v3 = [(SCMLModelBase *)self options];
  uint64_t v4 = [v3 objectForKeyedSubscript:SCMLEnableImageDetection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    v2 = [v2 options];
    uint64_t v6 = [v2 objectForKeyedSubscript:SCMLEnableImageDetection];
  }
  else
  {
    uint64_t v6 = 0;
  }
  char v7 = [v6 BOOLValue];
  if (isKindOfClass)
  {
  }
  return v7;
}

- (id)_processNetworkOutput:(NetworkOutputs *)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v38 = [MEMORY[0x263EFF9A0] dictionary];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v5 = [(SCMLImageAnalyzer *)self acceptedOutputIndices];
  uint64_t v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        long long v11 = NSNumber;
        *(float *)&double v12 = a3->var0.var0[(int)[v10 intValue]];
        long long v13 = [v11 numberWithFloat:v12];
        int v14 = [(SCMLImageAnalyzer *)self acceptedOutputIndices];
        long long v15 = [v14 objectForKeyedSubscript:v10];
        [v38 setObject:v13 forKeyedSubscript:v15];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v7);
  }

  id v37 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int v16 = (void *)[v38 copy];
  [v37 setObject:v16 forKeyedSubscript:SCMLHandlerImageClassificationScores[0]];

  if ([(SCMLImageAnalyzer *)self shouldProcessDetections])
  {
    long long v17 = *(_OWORD *)&a3->var1.var0;
    v39[0] = a3->var0;
    v39[1] = v17;
    long long v18 = *(_OWORD *)a3->var2.var1.var0;
    v39[2] = *(_OWORD *)&a3->var1.var1.var0[2];
    v39[3] = v18;
    [(SCMLImageAnalyzer *)self _processDetectionOutput:v39];
    id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v20 = (float *)__p;
    uint64_t v21 = v41;
    if (__p != v41)
    {
      do
      {
        id v22 = [(SCMLImageAnalyzer *)self acceptedDetectionOutputIndices];
        uint64_t v23 = [NSNumber numberWithInt:*((unsigned int *)v20 + 1)];
        v24 = [v22 objectForKeyedSubscript:v23];

        if (v24)
        {
          float v25 = *v20;
          id v26 = [(SCMLImageAnalyzer *)self detectionThresholdByOutputIndex];
          char v27 = [NSNumber numberWithInt:*((unsigned int *)v20 + 1)];
          id v28 = [v26 objectForKeyedSubscript:v27];
          [v28 floatValue];
          BOOL v30 = v25 < v29;

          if (!v30)
          {
            uint64_t v31 = +[SCMLImageLabelCoder instance];
            uint64_t v32 = [v31 encodeToP1:v24];

            int v33 = [SCMLDetectionBox alloc];
            *(float *)&double v34 = *v20;
            uint64_t v35 = -[SCMLDetectionBox initWithScore:label:rect:](v33, "initWithScore:label:rect:", v32, v34, *((double *)v20 + 1), *((double *)v20 + 2), *((double *)v20 + 3), *((double *)v20 + 4));
            [v19 addObject:v35];
          }
        }

        v20 += 10;
      }
      while (v20 != v21);
    }
    [v37 setObject:v19 forKeyedSubscript:SCMLHandlerImageDetections[0]];

    if (__p)
    {
      uint64_t v41 = (float *)__p;
      operator delete(__p);
    }
  }

  return v37;
}

+ (id)getOperatingPointDataForClassName:(id)a3 modelURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [a1 _readOperatingThresholdsDataUsingModelURL:v9 error:a5];
  long long v11 = v10;
  if (a5 && *a5)
  {
    double v12 = 0;
  }
  else
  {
    long long v13 = [v10 objectForKeyedSubscript:@"precision_recall_data"];
    int v14 = [a1 _encodeName:v8];
    double v12 = [v13 objectForKey:v14];
  }

  return v12;
}

- (NSDictionary)acceptedOutputIndices
{
  return (NSDictionary *)objc_getProperty(self, a2, 608, 1);
}

- (NSDictionary)acceptedDetectionOutputIndices
{
  return (NSDictionary *)objc_getProperty(self, a2, 616, 1);
}

- (NSDictionary)detectionThresholdByOutputIndex
{
  return (NSDictionary *)objc_getProperty(self, a2, 624, 1);
}

- (NSNumber)otgxMainThreshold
{
  return (NSNumber *)objc_getProperty(self, a2, 632, 1);
}

- (unint64_t)otgxMainIndex
{
  return self->_otgxMainIndex;
}

- (BOOL)otgxRetrieveAllClasses
{
  return self->_otgxRetrieveAllClasses;
}

- (NSURL)modelUrl
{
  return (NSURL *)objc_getProperty(self, a2, 648, 1);
}

- (int)_espressoEngine
{
  return self->__espressoEngine;
}

- (int)_espressoDeviceId
{
  return self->__espressoDeviceId;
}

- (int)_espressoStorageType
{
  return self->__espressoStorageType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelUrl, 0);
  objc_storeStrong((id *)&self->_otgxMainThreshold, 0);
  objc_storeStrong((id *)&self->_detectionThresholdByOutputIndex, 0);
  objc_storeStrong((id *)&self->_acceptedDetectionOutputIndices, 0);

  objc_storeStrong((id *)&self->_acceptedOutputIndices, 0);
}

- (void)initWithModelURL:(os_log_t)log options:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25BF41000, log, OS_LOG_TYPE_ERROR, "Default ivs model files not found.", v1, 2u);
}

- (void)loadNetworkForURL:(NSObject *)a3 espressoEngine:storageType:deviceId:.cold.1(const std::runtime_error *a1, int a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 67109378;
  v4[1] = a2;
  __int16 v5 = 2080;
  uint64_t v6 = std::runtime_error::what(a1);
  _os_log_error_impl(&dword_25BF41000, a3, OS_LOG_TYPE_ERROR, "Failed to load encoder network for engine: %d, espresso error: %s", (uint8_t *)v4, 0x12u);
}

- (void)_computeOutputForPixelBuffer:(const std::runtime_error *)a1 error:.cold.1(const std::runtime_error *a1)
{
  std::runtime_error::what(a1);
  OUTLINED_FUNCTION_0(&dword_25BF41000, v1, v2, "Error during espresso execution: %s", v3, v4, v5, v6, 2u);
}

+ (void)getOperatingPointDataForClassName:(const std::runtime_error *)a1 modelURL:error:.cold.1(const std::runtime_error *a1)
{
  std::runtime_error::what(a1);
  OUTLINED_FUNCTION_0(&dword_25BF41000, v1, v2, "Error during operating point retrieval: %s", v3, v4, v5, v6, 2u);
}

@end