@interface SIBaseNetworkEspresso
+ (NSDictionary)tracingEntryFormat;
- ($C4732ECC957FA13B9B3DF4A51A95735B)network;
- ($F613A077D53D3D97A8E0FDF5BAE1891D)preprocessor;
- ($FD4688982923A924290ECB669CAF1EC2)getTensorByName:(const char *)a3;
- (BOOL)bindNetworkInputWithEspressoBuffer:(id *)a3 withInputName:(id)a4;
- (BOOL)buildPlan;
- (BOOL)enablePreprocess;
- (BOOL)initContext;
- (BOOL)initMLNetwork;
- (BOOL)initNetwork;
- (BOOL)initNetworkOutput;
- (BOOL)initPlan;
- (BOOL)isUsingANE;
- (BOOL)prepare;
- (BOOL)supportFloat16IO;
- (BOOL)supportZeroCopyOutput;
- (BOOL)useManagedBuffers;
- (BOOL)validateNetworkOutputDimension;
- (CGSize)getResolutionByBlobName:(const char *)a3;
- (NSDictionary)tracingEntry;
- (NSSet)disabledOutputSet;
- (NSString)description;
- (NSString)modelName;
- (NSString)networkMode;
- (SIBaseNetworkEspresso)initWithNetworkConfiguration:(id)a3;
- (SIBaseNetworkEspresso)initWithNetworkPath:(id)a3 andEngine:(int64_t)a4 networkMode:(id)a5;
- (SIBaseNetworkEspresso)initWithNetworkPath:(id)a3 engine:(int64_t)a4 networkMode:(id)a5 directAccessOutputBuffer:(BOOL)a6;
- (__CVBuffer)getOutPixelBufferByName:(const char *)a3;
- (__IOSurface)getOutputSurface:(id)a3;
- (id).cxx_construct;
- (id)getOpsForLibrary;
- (id)networkInputNames;
- (id)networkName;
- (id)networkOutputNames;
- (id)networkVersion;
- (int64_t)addPrewiringBuffersToStreamForFunctionName:(id)a3 inputPools:(id)a4 outputPools:(id)a5 clearWiredBuffer:(BOOL)a6;
- (int64_t)engineType;
- (int64_t)runNetwork;
- (int64_t)setInput:(id)a3 fromCVPixelBuffer:(__CVBuffer *)a4;
- (int64_t)setInput:(id)a3 fromRawPointer:(const void *)a4;
- (int64_t)setOutputBlob:(id)a3 forOutputSurface:(__IOSurface *)a4;
- (int64_t)switchConfiguration:(id)a3;
- (int64_t)unwirePrewiringBuffers;
- (int64_t)unwirePrewiringBuffersForFunctionName:(id)a3;
- (unint64_t)getInputChannels:(id)a3;
- (unint64_t)getInputHeight:(id)a3;
- (unint64_t)getInputLength:(id)a3;
- (unint64_t)getInputWidth:(id)a3;
- (unint64_t)getOutputBytePerRow:(id)a3;
- (unint64_t)getOutputChannels:(id)a3;
- (unint64_t)getOutputComponentSize:(id)a3;
- (unint64_t)getOutputHeight:(id)a3;
- (unint64_t)getOutputLength:(id)a3;
- (unint64_t)getOutputRowElements:(id)a3;
- (unint64_t)getOutputWidth:(id)a3;
- (void)bindNetworkInputWithImage:(__CVBuffer *)a3 withInputName:(id)a4;
- (void)bindNetworkOutput:(const char *)a3;
- (void)cleanUpOutputPixelBufferMap;
- (void)context;
- (void)dealloc;
- (void)getBlobDimensionByName:(const char *)a3 andDestination:(unint64_t *)a4;
- (void)getRawOutput:(id)a3;
- (void)plan;
- (void)setDisabledOutputSet:(id)a3;
- (void)setEnablePreprocess:(BOOL)a3;
- (void)setExpectedDimension:(const char *)a3 andDimension:(unint64_t *)a4;
- (void)setNetworkMode:(id)a3;
- (void)setPreprocessor:(id *)a3;
- (void)setUseManagedBuffers:(BOOL)a3;
- (void)updateOutputBlobMap;
@end

@implementation SIBaseNetworkEspresso

- (SIBaseNetworkEspresso)initWithNetworkConfiguration:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SIBaseNetworkEspresso;
  v5 = [(SIBaseNetworkEspresso *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 networkName];
    modelName = v5->_modelName;
    v5->_modelName = (NSString *)v6;

    v8 = [v4 networkPath];

    if (v8)
    {
      uint64_t v9 = [v4 networkPath];
      netPath = v5->_netPath;
      v5->_netPath = (NSString *)v9;
    }
    else
    {
      netPath = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v11 = [v4 networkName];
      uint64_t v12 = SIMLModelPath(netPath, v11);
      v13 = v5->_netPath;
      v5->_netPath = (NSString *)v12;
    }
    v5->_engineType = [v4 engineType];
    uint64_t v14 = [v4 networkMode];
    networkMode = v5->_networkMode;
    v5->_networkMode = (NSString *)v14;

    v5->_isPrepared = 0;
    v16 = v5;
  }

  return v5;
}

- (SIBaseNetworkEspresso)initWithNetworkPath:(id)a3 andEngine:(int64_t)a4 networkMode:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = objc_alloc_init(SINetworkConfiguration);
  [(SINetworkConfiguration *)v10 setNetworkPath:v8];
  [(SINetworkConfiguration *)v10 setEngineType:a4];
  [(SINetworkConfiguration *)v10 setNetworkMode:v9];
  v11 = [(SIBaseNetworkEspresso *)self initWithNetworkConfiguration:v10];

  return v11;
}

- (BOOL)prepare
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(SIBaseNetworkEspresso *)self preSetup];
  BOOL v3 = [(SIBaseNetworkEspresso *)self initMLNetwork];
  if (v3)
  {
    [(SIBaseNetworkEspresso *)self postSetup];
    id v4 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      modelName = self->_modelName;
      uint64_t v6 = [(SIBaseNetworkEspresso *)self networkVersion];
      int v8 = 136381443;
      id v9 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
      __int16 v10 = 1025;
      int v11 = 83;
      __int16 v12 = 2113;
      v13 = modelName;
      __int16 v14 = 2113;
      v15 = v6;
      _os_log_impl(&dword_21B697000, v4, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Initialization] Model: %{private}@. Version: %{private}@ ***", (uint8_t *)&v8, 0x26u);
    }
    self->_isPrepared = 1;
  }
  return v3;
}

- (id)networkVersion
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (espresso_network_get_version()) {
    v2 = @"Unknown";
  }
  else {
    v2 = (__CFString *)[[NSString alloc] initWithUTF8String:v4];
  }
  return v2;
}

- (id)networkName
{
  return self->_modelName;
}

- (BOOL)isUsingANE
{
  BOOL v3 = +[SIBaseNetworkEspresso supportsANE];
  if (v3) {
    LOBYTE(v3) = self->_engineType == 1;
  }
  return v3;
}

- (BOOL)initMLNetwork
{
  if (![(SIBaseNetworkEspresso *)self initContext]
    || ![(SIBaseNetworkEspresso *)self initPlan]
    || ![(SIBaseNetworkEspresso *)self initNetwork]
    || ![(SIBaseNetworkEspresso *)self buildPlan]
    || ![(SIBaseNetworkEspresso *)self validateNetworkOutputDimension])
  {
    return 0;
  }
  return [(SIBaseNetworkEspresso *)self initNetworkOutput];
}

- (BOOL)buildPlan
{
  if (self->_enablePreprocess) {
    [(SIBaseNetworkEspresso *)self initPreprocess];
  }
  espresso_plan_build();
  return 1;
}

- (BOOL)initContext
{
  context = (void *)espresso_create_context();
  uint64_t v5 = context;
  self->_context = context;
  if (context)
  {
    Espresso::get_internal_context(v8, (Espresso *)context, v4);
    uint64_t v6 = (std::__shared_weak_count *)v8[1];
    *(_DWORD *)(v8[0] + 68) = 1;
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v6);
    }
  }
  return v5 != 0;
}

- (BOOL)initPlan
{
  plan = (void *)espresso_create_plan();
  self->_plan = plan;
  return plan != 0;
}

- (BOOL)initNetwork
{
  netPath = self->_netPath;
  if (!netPath) {
    return 0;
  }
  id v4 = [(NSString *)netPath stringByAppendingPathComponent:@"model.espresso.net"];
  [v4 UTF8String];
  espresso_plan_add_network();
  networkMode = self->_networkMode;
  if (networkMode
    && ![(NSString *)networkMode isEqualToString:&stru_26CB7E380]
    && ([(NSString *)self->_networkMode UTF8String], espresso_network_select_configuration()))
  {
    BOOL v6 = 0;
  }
  else
  {
    [(SIBaseNetworkEspresso *)self updateOutputBlobMap];
    BOOL v6 = 1;
  }

  return v6;
}

- (void)updateOutputBlobMap
{
  p_outputBufferMap = &self->_outputBufferMap;
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::clear((uint64_t)&self->_outputBufferMap);
  uint64_t output_blob_name = espresso_get_output_blob_name();
  if (output_blob_name)
  {
    id v4 = (char *)output_blob_name;
    uint64_t v5 = 1;
    do
    {
      std::string::basic_string[abi:nn180100]<0>(v8, v4);
      uint64_t v7 = 0;
      memset(v6, 0, sizeof(v6));
      std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::string,espresso_buffer_t>((uint64_t)p_outputBufferMap, (uint64_t)v8, (uint64_t)v8, (uint64_t)v6);
      if (v9 < 0) {
        operator delete(v8[0]);
      }
      id v4 = (char *)espresso_get_output_blob_name();
      ++v5;
    }
    while (v4);
  }
}

- (BOOL)validateNetworkOutputDimension
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  next = self->_expectedDimensions.__table_.__p1_.__value_.__next_;
  if (next)
  {
    *(void *)&long long v2 = 136383235;
    long long v16 = v2;
    do
    {
      uint64_t v5 = next + 2;
      long long v39 = 0u;
      long long v40 = 0u;
      BOOL v6 = next + 2;
      if (*((char *)next + 39) < 0) {
        BOOL v6 = (void *)*v5;
      }
      -[SIBaseNetworkEspresso getBlobDimensionByName:andDestination:](self, "getBlobDimensionByName:andDestination:", v6, &v39, v16);
      uint64_t v7 = 0;
      char v8 = 1;
      do
      {
        v8 &= *(void *)((char *)&v39 + v7) == *(void *)(next[5] + v7);
        v7 += 8;
      }
      while (v7 != 32);
      if ((v8 & 1) == 0)
      {
        char v9 = __SceneIntelligenceLogSharedInstance();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          if (*((char *)next + 39) < 0) {
            uint64_t v5 = (void *)*v5;
          }
          __int16 v10 = (uint64_t *)next[5];
          uint64_t v11 = *v10;
          uint64_t v12 = v10[1];
          uint64_t v14 = v10[2];
          uint64_t v13 = v10[3];
          *(_DWORD *)buf = v16;
          objc_super v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
          __int16 v19 = 1025;
          int v20 = 248;
          __int16 v21 = 2081;
          v22 = v5;
          __int16 v23 = 2049;
          uint64_t v24 = v11;
          __int16 v25 = 2049;
          uint64_t v26 = v12;
          __int16 v27 = 2049;
          uint64_t v28 = v14;
          __int16 v29 = 2049;
          uint64_t v30 = v13;
          __int16 v31 = 2048;
          uint64_t v32 = v39;
          __int16 v33 = 2048;
          uint64_t v34 = *((void *)&v39 + 1);
          __int16 v35 = 2048;
          uint64_t v36 = v40;
          __int16 v37 = 2048;
          uint64_t v38 = *((void *)&v40 + 1);
          _os_log_impl(&dword_21B697000, v9, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** The shape of blob \"%{private}s\" doesn't match with the expectation in validation. We expect the shape to be (%{private}zu, %{private}zu, %{private}zu, %{private}zu) while the shape is (%zu, %zu, %zu, %zu)\n ***", buf, 0x6Cu);
        }
      }
      next = (void *)*next;
    }
    while (next);
  }
  return 1;
}

- (void)setExpectedDimension:(const char *)a3 andDimension:(unint64_t *)a4
{
  uint64_t v7 = operator new(0x20uLL);
  long long v8 = *((_OWORD *)a4 + 1);
  *uint64_t v7 = *(_OWORD *)a4;
  v7[1] = v8;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)a3);
  uint64_t v14 = __p;
  char v9 = std::__hash_table<std::__hash_value_type<std::string,std::vector<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<unsigned long>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_expectedDimensions, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v14);
  __int16 v10 = v7 + 2;
  uint64_t v11 = (void *)*((void *)v9 + 5);
  if (v11)
  {
    *((void *)v9 + 6) = v11;
    operator delete(v11);
    *((void *)v9 + 5) = 0;
    *((void *)v9 + 6) = 0;
    *((void *)v9 + 7) = 0;
  }
  *((void *)v9 + 5) = v7;
  *((void *)v9 + 6) = v10;
  *((void *)v9 + 7) = v10;
  if (v13 < 0) {
    operator delete(__p[0]);
  }
}

- (void)getBlobDimensionByName:(const char *)a3 andDestination:(unint64_t *)a4
{
}

- (BOOL)initNetworkOutput
{
  for (i = (char *)self->_outputBufferMap.__table_.__p1_.__value_.__next_; i; i = *(char **)i)
  {
    id v4 = i + 16;
    if (i[39] < 0) {
      id v4 = (void *)*v4;
    }
    [(SIBaseNetworkEspresso *)self bindNetworkOutput:v4];
  }
  return 1;
}

- (void)bindNetworkInputWithImage:(__CVBuffer *)a3 withInputName:(id)a4
{
  id v4 = a4;
  [v4 UTF8String];
  espresso_network_bind_cvpixelbuffer();
}

- (BOOL)bindNetworkInputWithEspressoBuffer:(id *)a3 withInputName:(id)a4
{
  id v4 = a4;
  [v4 UTF8String];
  BOOL v5 = espresso_network_bind_buffer() == 0;

  return v5;
}

- (void)bindNetworkOutput:(const char *)a3
{
  disabledOutputSet = self->_disabledOutputSet;
  BOOL v6 = objc_msgSend(NSString, "stringWithUTF8String:");
  LOBYTE(disabledOutputSet) = [(NSSet *)disabledOutputSet containsObject:v6];

  if ((disabledOutputSet & 1) == 0)
  {
    std::string::basic_string[abi:nn180100]<0>(__p, (char *)a3);
    if (!std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::find<std::string>(&self->_outputBufferMap.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)__p))abort(); {
    if (v8 < 0)
    }
      operator delete(__p[0]);
    espresso_network_bind_buffer();
  }
}

- ($FD4688982923A924290ECB669CAF1EC2)getTensorByName:(const char *)a3
{
  p_outputBufferMap = &self->_outputBufferMap;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)a3);
  char v8 = __p;
  id v4 = std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_outputBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v8);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return ($FD4688982923A924290ECB669CAF1EC2 *)(v4 + 40);
}

- (__CVBuffer)getOutPixelBufferByName:(const char *)a3
{
  p_outputPixelBufMap = &self->_outputPixelBufMap;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)a3);
  char v8 = __p;
  id v4 = (__CVBuffer *)*((void *)std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_outputPixelBufMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v8)+ 5);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return v4;
}

- (CGSize)getResolutionByBlobName:(const char *)a3
{
  v5[4] = *MEMORY[0x263EF8340];
  [(SIBaseNetworkEspresso *)self getBlobDimensionByName:a3 andDestination:v5];
  double v3 = (double)v5[0];
  double v4 = (double)v5[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (int64_t)switchConfiguration:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(SIBaseNetworkEspresso *)self networkMode];
  char v6 = [v5 isEqualToString:v4];

  if (v6) {
    goto LABEL_2;
  }
  [(SIBaseNetworkEspresso *)self cleanUpOutputPixelBufferMap];
  [(SIBaseNetworkEspresso *)self plan];
  espresso_plan_build_clean();
  id v8 = v4;
  [v8 UTF8String];
  if (espresso_network_select_configuration())
  {
    char v9 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      netPath = self->_netPath;
      int v15 = 136381187;
      long long v16 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
      __int16 v17 = 1025;
      int v18 = 382;
      __int16 v19 = 2113;
      int v20 = netPath;
      uint64_t v11 = " %{private}s:%{private}d *** Could not switch the configuration for the model: %{private}@ ***";
      uint64_t v12 = v9;
      uint32_t v13 = 28;
LABEL_17:
      _os_log_impl(&dword_21B697000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, v13);
    }
LABEL_18:

    int64_t v7 = 5;
    goto LABEL_19;
  }
  [(SIBaseNetworkEspresso *)self updateOutputBlobMap];
  if (![(SIBaseNetworkEspresso *)self buildPlan])
  {
    char v9 = __SceneIntelligenceLogSharedInstance();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    int v15 = 136380931;
    long long v16 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
    __int16 v17 = 1025;
    int v18 = 388;
    uint64_t v11 = " %{private}s:%{private}d *** build plan fail when switching the configuration! ***";
LABEL_16:
    uint64_t v12 = v9;
    uint32_t v13 = 18;
    goto LABEL_17;
  }
  if (![(SIBaseNetworkEspresso *)self validateNetworkOutputDimension])
  {
    char v9 = __SceneIntelligenceLogSharedInstance();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    int v15 = 136380931;
    long long v16 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
    __int16 v17 = 1025;
    int v18 = 393;
    uint64_t v11 = " %{private}s:%{private}d *** validation for network output fail when switching the configuration! ***";
    goto LABEL_16;
  }
  if (![(SIBaseNetworkEspresso *)self initNetworkOutput])
  {
    char v9 = __SceneIntelligenceLogSharedInstance();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    int v15 = 136380931;
    long long v16 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
    __int16 v17 = 1025;
    int v18 = 398;
    uint64_t v11 = " %{private}s:%{private}d *** initializing the network output buffer fail when switching the configuration! ***";
    goto LABEL_16;
  }
  [(SIBaseNetworkEspresso *)self setNetworkMode:v8];
LABEL_2:
  int64_t v7 = 0;
LABEL_19:

  return v7;
}

- (unint64_t)getInputChannels:(id)a3
{
  id v3 = a3;
  [v3 UTF8String];
  if (espresso_network_query_blob_dimensions()) {
    unint64_t v4 = -1;
  }
  else {
    unint64_t v4 = v6;
  }

  return v4;
}

- (unint64_t)getInputHeight:(id)a3
{
  id v3 = a3;
  [v3 UTF8String];
  if (espresso_network_query_blob_dimensions()) {
    unint64_t v4 = -1;
  }
  else {
    unint64_t v4 = v6;
  }

  return v4;
}

- (unint64_t)getInputWidth:(id)a3
{
  id v3 = a3;
  [v3 UTF8String];
  if (espresso_network_query_blob_dimensions()) {
    unint64_t v4 = -1;
  }
  else {
    unint64_t v4 = v6;
  }

  return v4;
}

- (unint64_t)getInputLength:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  *(void *)buf = __p;
  std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_input_espresso_buffer, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)buf);
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  int v5 = espresso_buffer_unpack_tensor_shape();
  if (v5)
  {
    unint64_t v6 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381443;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
      __int16 v10 = 1025;
      int v11 = 431;
      __int16 v12 = 1024;
      int v13 = v5;
      __int16 v14 = 2113;
      id v15 = v4;
      _os_log_impl(&dword_21B697000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** getInputLength failed with status: %d for name %{private}@ ***", buf, 0x22u);
    }

    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = 1;
  }

  return v7;
}

- (unint64_t)getOutputChannels:(id)a3
{
  id v3 = a3;
  [v3 UTF8String];
  if (espresso_network_query_blob_dimensions()) {
    unint64_t v4 = -1;
  }
  else {
    unint64_t v4 = v6;
  }

  return v4;
}

- (unint64_t)getOutputHeight:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  char v9 = __p;
  unint64_t v5 = *((void *)std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v9)+ 16);
  if (v8 < 0) {
    operator delete(__p[0]);
  }

  return v5;
}

- (unint64_t)getOutputRowElements:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  char v9 = __p;
  unint64_t v5 = *((void *)std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v9)+ 15);
  if (v8 < 0) {
    operator delete(__p[0]);
  }

  return v5;
}

- (unint64_t)getOutputWidth:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  char v9 = __p;
  unint64_t v5 = *((void *)std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v9)+ 15);
  if (v8 < 0) {
    operator delete(__p[0]);
  }

  return v5;
}

- (void)getRawOutput:(id)a3
{
  id v4 = a3;
  unint64_t v5 = *(void **)-[SIBaseNetworkEspresso getTensorByName:](self, "getTensorByName:", [v4 UTF8String]);

  return v5;
}

- (unint64_t)getOutputBytePerRow:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  char v9 = __p;
  unint64_t v5 = *((void *)std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v9)+ 11);
  if (v8 < 0) {
    operator delete(__p[0]);
  }

  return v5;
}

- (unint64_t)getOutputComponentSize:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  char v8 = (long long *)__p;
  int v5 = *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, &v8)+ 50);
  if (v12 < 0) {
    operator delete(*(void **)__p);
  }
  if (v5 != 65568)
  {
    unint64_t v6 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 136380931;
      *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
      __int16 v10 = 1025;
      int v11 = 475;
      _os_log_impl(&dword_21B697000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Got unexpected storage type when querying the componentSize in espressoV1. ***", __p, 0x12u);
    }
  }
  return 4;
}

- (unint64_t)getOutputLength:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  -[SIBaseNetworkEspresso getTensorByName:](self, "getTensorByName:", [v4 UTF8String]);
  int v5 = espresso_buffer_unpack_tensor_shape();
  if (v5)
  {
    unint64_t v6 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381443;
      __int16 v10 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
      __int16 v11 = 1025;
      int v12 = 485;
      __int16 v13 = 1024;
      int v14 = v5;
      __int16 v15 = 2113;
      id v16 = v4;
      _os_log_impl(&dword_21B697000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** getOutputLength failed with status: %d for name %{private}@ ***", buf, 0x22u);
    }

    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = 1;
  }

  return v7;
}

- (id)getOpsForLibrary
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  long long v2 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136380931;
    int v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
    __int16 v6 = 1025;
    int v7 = 498;
    _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Backend library does not support getOpsForLibrary. (You are probably not running with E5RT) ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (int64_t)runNetwork
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!espresso_plan_execute_sync()) {
    return 0;
  }
  long long v2 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136380931;
    int v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
    __int16 v6 = 1025;
    int v7 = 505;
    _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failure to run network for MS ***", (uint8_t *)&v4, 0x12u);
  }

  return 4;
}

- (int64_t)setInput:(id)a3 fromCVPixelBuffer:(__CVBuffer *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!self->_isPrepared)
  {
    uint64_t v8 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
      *(_WORD *)&unsigned char buf[12] = 1025;
      *(_DWORD *)&buf[14] = 520;
      _os_log_impl(&dword_21B697000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Model is not prepared before setting the input ***", buf, 0x12u);
    }

    goto LABEL_9;
  }
  if (CVPixelBufferGetPixelFormatType(a4) != 1111970369 && CVPixelBufferGetPixelFormatType(a4) != 1278226488)
  {
    id v10 = v6;
    std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v10 UTF8String]);
    if (std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::find<std::string>(&self->_input_espresso_buffer.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)__p)|| (*(void *)buf = __p, *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_input_espresso_buffer, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)buf)+ 50) = 65568, -[SIBaseNetworkEspresso getBlobDimensionByName:andDestination:](self, "getBlobDimensionByName:andDestination:", [v10 UTF8String], buf), v15 = vextq_s8(*(int8x16_t *)&buf[16], *(int8x16_t *)&buf[16], 8uLL), v16 = vextq_s8(*(int8x16_t *)buf, *(int8x16_t *)buf, 8uLL), int v14 = __p, std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_input_espresso_buffer,
            (uint64_t)__p,
            (uint64_t)&std::piecewise_construct,
            (long long **)&v14),
          !espresso_buffer_pack_tensor_shape()))
    {
      CVPixelBufferLockBaseAddress(a4, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(a4);
      *(void *)buf = __p;
      *((void *)std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_input_espresso_buffer, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)buf)+ 5) = BaseAddress;
      *(void *)buf = __p;
      -[SIBaseNetworkEspresso bindNetworkInputWithEspressoBuffer:withInputName:](self, "bindNetworkInputWithEspressoBuffer:withInputName:", std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_input_espresso_buffer, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)buf)+ 40, v10);
      if (v13 < 0) {
        operator delete(__p[0]);
      }
      goto LABEL_5;
    }
    if (v13 < 0) {
      operator delete(__p[0]);
    }
LABEL_9:
    int64_t v7 = 3;
    goto LABEL_10;
  }
  [(SIBaseNetworkEspresso *)self bindNetworkInputWithImage:a4 withInputName:v6];
LABEL_5:
  int64_t v7 = 0;
LABEL_10:

  return v7;
}

- (int64_t)setInput:(id)a3 fromRawPointer:(const void *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int64_t v7 = v6;
  if (self->_isPrepared)
  {
    id v8 = v6;
    std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v8 UTF8String]);
    char v9 = std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::find<std::string>(&self->_input_espresso_buffer.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)__p);
    if (v9)
    {
      int64_t v10 = 0;
      *((void *)v9 + 5) = a4;
    }
    else
    {
      int v12 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136381187;
        uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
        __int16 v18 = 1025;
        int v19 = 563;
        __int16 v20 = 2113;
        id v21 = v8;
        _os_log_impl(&dword_21B697000, v12, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Input %{private}@ does not exist ***", buf, 0x1Cu);
      }

      int64_t v10 = 3;
    }
    if (v15 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    __int16 v11 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
      __int16 v18 = 1025;
      int v19 = 556;
      _os_log_impl(&dword_21B697000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Model is not prepared before setting the input ***", buf, 0x12u);
    }

    int64_t v10 = 3;
  }

  return v10;
}

- (int64_t)setOutputBlob:(id)a3 forOutputSurface:(__IOSurface *)a4
{
  return 0;
}

- (SIBaseNetworkEspresso)initWithNetworkPath:(id)a3 engine:(int64_t)a4 networkMode:(id)a5 directAccessOutputBuffer:(BOOL)a6
{
  return 0;
}

- (void)cleanUpOutputPixelBufferMap
{
  for (CVPixelBufferRef i = (CVPixelBufferRef)self->_outputPixelBufMap.__table_.__p1_.__value_.__next_; i; CVPixelBufferRef i = *(CVPixelBufferRef *)i)
    CVPixelBufferRelease(*((CVPixelBufferRef *)i + 5));
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::clear((uint64_t)&self->_outputPixelBufMap);
}

- (BOOL)supportFloat16IO
{
  return 0;
}

- (BOOL)supportZeroCopyOutput
{
  return 0;
}

- (int64_t)addPrewiringBuffersToStreamForFunctionName:(id)a3 inputPools:(id)a4 outputPools:(id)a5 clearWiredBuffer:(BOOL)a6
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136380931;
    char v9 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
    __int16 v10 = 1025;
    int v11 = 606;
    _os_log_impl(&dword_21B697000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** ANEP is not supported in EspressoV1 ***", (uint8_t *)&v8, 0x12u);
  }

  return 4;
}

- (int64_t)unwirePrewiringBuffersForFunctionName:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136380931;
    id v6 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
    __int16 v7 = 1025;
    int v8 = 612;
    _os_log_impl(&dword_21B697000, v3, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** ANEP is not supported in EspressoV1 ***", (uint8_t *)&v5, 0x12u);
  }

  return 4;
}

- (int64_t)unwirePrewiringBuffers
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  long long v2 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136380931;
    int v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
    __int16 v6 = 1025;
    int v7 = 618;
    _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** ANEP is not supported in EspressoV1 ***", (uint8_t *)&v4, 0x12u);
  }

  return 4;
}

- (id)networkInputNames
{
  return 0;
}

- (id)networkOutputNames
{
  return 0;
}

- (__IOSurface)getOutputSurface:(id)a3
{
  return 0;
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  [(SIBaseNetworkEspresso *)self cleanUpOutputPixelBufferMap];
  v3.receiver = self;
  v3.super_class = (Class)SIBaseNetworkEspresso;
  [(SIBaseNetworkEspresso *)&v3 dealloc];
}

- (NSString)description
{
  long long v2 = [(SIBaseNetworkEspresso *)self tracingEntry];
  objc_super v3 = [v2 description];

  return (NSString *)v3;
}

- (NSDictionary)tracingEntry
{
  v10[6] = *MEMORY[0x263EF8340];
  v10[0] = self->_netPath;
  v9[0] = @"netPath";
  v9[1] = @"engineType";
  objc_super v3 = [NSNumber numberWithInteger:self->_engineType];
  v10[1] = v3;
  v10[2] = self->_modelName;
  v9[2] = @"modelName";
  v9[3] = @"enablePreprocess";
  int v4 = [NSNumber numberWithBool:self->_enablePreprocess];
  v10[3] = v4;
  v9[4] = @"networkVersion";
  int v5 = [(SIBaseNetworkEspresso *)self networkVersion];
  v10[4] = v5;
  v9[5] = @"networkMode";
  __int16 v6 = [(SIBaseNetworkEspresso *)self networkMode];
  v10[5] = v6;
  int v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:6];

  return (NSDictionary *)v7;
}

+ (NSDictionary)tracingEntryFormat
{
  if (+[SIBaseNetworkEspresso tracingEntryFormat]::onceToken != -1) {
    dispatch_once(&+[SIBaseNetworkEspresso tracingEntryFormat]::onceToken, &__block_literal_global_2);
  }
  long long v2 = (void *)+[SIBaseNetworkEspresso tracingEntryFormat]::entryFormat;
  return (NSDictionary *)v2;
}

void __43__SIBaseNetworkEspresso_tracingEntryFormat__block_invoke()
{
  v0 = (void *)+[SIBaseNetworkEspresso tracingEntryFormat]::entryFormat;
  +[SIBaseNetworkEspresso tracingEntryFormat]::entryFormat = (uint64_t)&unk_26CB850C0;
}

- (void)context
{
  return self->_context;
}

- (void)plan
{
  return self->_plan;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)network
{
  uint64_t v2 = *(void *)&self->_network.network_index;
  plan = self->_network.plan;
  result.var1 = v2;
  result.var0 = plan;
  return result;
}

- (int64_t)engineType
{
  return self->_engineType;
}

- ($F613A077D53D3D97A8E0FDF5BAE1891D)preprocessor
{
  *($9DF72902E0F602464F2F248C9389BF3B *)retstr = *($9DF72902E0F602464F2F248C9389BF3B *)((char *)self + 248);
  return self;
}

- (void)setPreprocessor:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(_DWORD *)&self->_preprocessor.network_wants_bgr = *(_DWORD *)&a3->var4;
  *(_OWORD *)&self->_preprocessor.bias_r = v3;
}

- (BOOL)enablePreprocess
{
  return self->_enablePreprocess;
}

- (void)setEnablePreprocess:(BOOL)a3
{
  self->_enablePreprocess = a3;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSString)networkMode
{
  return self->_networkMode;
}

- (void)setNetworkMode:(id)a3
{
}

- (BOOL)useManagedBuffers
{
  return self->_useManagedBuffers;
}

- (void)setUseManagedBuffers:(BOOL)a3
{
  self->_useManagedBuffers = a3;
}

- (NSSet)disabledOutputSet
{
  return self->_disabledOutputSet;
}

- (void)setDisabledOutputSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledOutputSet, 0);
  objc_storeStrong((id *)&self->_networkMode, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::~__hash_table((uint64_t)&self->_input_espresso_buffer);
  std::__hash_table<std::__hash_value_type<std::string,std::vector<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<unsigned long>>>>::~__hash_table((uint64_t)&self->_expectedDimensions);
  std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::~__hash_table((uint64_t)&self->_outputPixelBufMap);
  std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::~__hash_table((uint64_t)&self->_outputBufferMap);
  objc_storeStrong((id *)&self->_netPath, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_DWORD *)self + 42) = 1065353216;
  return self;
}

@end