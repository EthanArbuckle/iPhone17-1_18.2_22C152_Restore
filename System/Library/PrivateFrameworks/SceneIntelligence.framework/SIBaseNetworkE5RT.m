@interface SIBaseNetworkE5RT
- (BOOL)IsPrewiringEnabled;
- (BOOL)IsSurfacePrewiredForCurrentFunctionForBlob:(id)a3 surfaceID:(int)a4;
- (BOOL)outputExists:(id)a3;
- (BOOL)prepare;
- (BOOL)supportFloat16IO;
- (BOOL)supportZeroCopyOutput;
- (SIBaseNetworkE5RT)initWithNetName:(id)a3;
- (SIBaseNetworkE5RT)initWithNetPath:(id)a3;
- (SIBaseNetworkE5RT)initWithNetworkConfiguration:(id)a3;
- (__IOSurface)getOutputSurface:(id)a3;
- (__n128)getOutputShape:(void *)a3;
- (id).cxx_construct;
- (id)getOpsForLibrary;
- (id)networkInputNames;
- (id)networkName;
- (id)networkOutputNames;
- (id)networkVersion;
- (int64_t)_loadModel:(id)a3 operation:(e5rt_execution_stream_operation *)a4;
- (int64_t)_setupMetaDataFromLibrary;
- (int64_t)addPrewiringBuffersToStreamForFunctionName:(id)a3 inputPools:(id)a4 outputPools:(id)a5 clearWiredBuffer:(BOOL)a6;
- (int64_t)reset;
- (int64_t)runNetwork;
- (int64_t)selectComputeOperationByFunctionName:(id)a3;
- (int64_t)setInput:(id)a3 fromCVPixelBuffer:(__CVBuffer *)a4;
- (int64_t)setInput:(id)a3 fromRawPointer:(const void *)a4;
- (int64_t)setOutputBlob:(id)a3 forOutputSurface:(__IOSurface *)a4;
- (int64_t)unwirePrewiringBuffers;
- (int64_t)unwirePrewiringBuffersForFunctionName:(id)a3;
- (unint64_t)getInputChannels:(id)a3;
- (unint64_t)getInputHeight:(id)a3;
- (unint64_t)getInputLength:(id)a3;
- (unint64_t)getInputWidth:(id)a3;
- (unint64_t)getOutputBatchNum:(id)a3;
- (unint64_t)getOutputBytePerRow:(id)a3;
- (unint64_t)getOutputChannels:(id)a3;
- (unint64_t)getOutputComponentSize:(id)a3;
- (unint64_t)getOutputHeight:(id)a3;
- (unint64_t)getOutputLength:(id)a3;
- (unint64_t)getOutputRowElements:(id)a3;
- (unint64_t)getOutputWidth:(id)a3;
- (void)dealloc;
- (void)getInputPtr:(id)a3;
- (void)getRawOutput:(id)a3;
@end

@implementation SIBaseNetworkE5RT

- (int64_t)_setupMetaDataFromLibrary
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  [(NSString *)self->_e5Path UTF8String];
  if (e5rt_program_library_create())
  {
    v3 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 80);
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136381187;
      v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v24 = 1025;
      int v25 = 80;
      __int16 v26 = 2113;
      v27 = v4;
      _os_log_impl(&dword_21B697000, v3, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
    }
    v5 = __SceneIntelligenceLogSharedInstance();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    e5Path = self->_e5Path;
    *(_DWORD *)buf = 136381187;
    v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    __int16 v24 = 1025;
    int v25 = 80;
    __int16 v26 = 2113;
    v27 = e5Path;
    v7 = " %{private}s:%{private}d *** Failed to create e5rt program library with e5Path=%{private}@ ***";
LABEL_16:
    _os_log_impl(&dword_21B697000, v5, OS_LOG_TYPE_ERROR, v7, buf, 0x1Cu);
LABEL_17:

    return 7;
  }
  id v8 = [(SINetworkConfiguration *)self->_configuration networkFunction];
  [v8 UTF8String];
  BOOL v9 = e5rt_program_library_get_function_metadata() == 0;

  if (!v9)
  {
    v10 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 83);
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136381187;
      v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v24 = 1025;
      int v25 = 83;
      __int16 v26 = 2113;
      v27 = v11;
      _os_log_impl(&dword_21B697000, v10, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
    }
    v5 = __SceneIntelligenceLogSharedInstance();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    v12 = self->_e5Path;
    *(_DWORD *)buf = 136381187;
    v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    __int16 v24 = 1025;
    int v25 = 83;
    __int16 v26 = 2113;
    v27 = v12;
    v7 = " %{private}s:%{private}d *** Failed to get e5rt main function metadata with e5Path=%{private}@ ***";
    goto LABEL_16;
  }
  CFDictionaryGetValue(0, @"UserVersion");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  networkVersion = self->_networkVersion;
  self->_networkVersion = v13;

  CFRelease(@"UserVersion");
  Value = CFDictionaryGetValue(0, @"Ops");
  CFRetain(Value);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  opsForLibrary = self->_opsForLibrary;
  self->_opsForLibrary = v16;

  if (e5rt_program_library_release())
  {
    v18 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 98);
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136381187;
      v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v24 = 1025;
      int v25 = 98;
      __int16 v26 = 2113;
      v27 = v19;
      _os_log_impl(&dword_21B697000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);
    }
    v5 = __SceneIntelligenceLogSharedInstance();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    v20 = self->_e5Path;
    *(_DWORD *)buf = 136381187;
    v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    __int16 v24 = 1025;
    int v25 = 98;
    __int16 v26 = 2113;
    v27 = v20;
    v7 = " %{private}s:%{private}d *** Failed to get e5rt main function metadata with e5Path=%{private}@ ***";
    goto LABEL_16;
  }
  return 0;
}

- (SIBaseNetworkE5RT)initWithNetName:(id)a3
{
  v4 = objc_alloc_init(SINetworkConfiguration);
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [(SINetworkConfiguration *)v4 networkName];
  v7 = SIMLModelPath_v2(v5, v6);
  [(SINetworkConfiguration *)v4 setNetworkPath:v7];

  id v8 = [(SIBaseNetworkE5RT *)self initWithNetworkConfiguration:v4];
  return v8;
}

- (SIBaseNetworkE5RT)initWithNetPath:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SINetworkConfiguration);
  [(SINetworkConfiguration *)v5 setNetworkPath:v4];
  v6 = [(SIBaseNetworkE5RT *)self initWithNetworkConfiguration:v5];

  return v6;
}

- (SIBaseNetworkE5RT)initWithNetworkConfiguration:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 networkPath];

  if (v6)
  {
    v7 = [v5 networkPath];
  }
  else
  {
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v9 = [v5 networkName];
    v7 = SIMLModelPath_v2(v8, v9);
  }
  p_configuration = &self->_configuration;
  objc_storeStrong((id *)&self->_configuration, a3);
  v11 = [(SINetworkConfiguration *)self->_configuration networkName];
  networkName = self->_networkName;
  self->_networkName = v11;

  objc_storeStrong((id *)&self->_e5Path, v7);
  self->_isModelCompiledInRuntime = 0;
  if (e5rt_execution_stream_create())
  {
    v13 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 136);
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      int v26 = 136381187;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v28 = 1025;
      int v29 = 136;
      __int16 v30 = 2113;
      p_isa = v14;
      _os_log_impl(&dword_21B697000, v13, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v26, 0x1Cu);
    }
    v15 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *p_configuration;
      int v26 = 136381187;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v28 = 1025;
      int v29 = 136;
      __int16 v30 = 2113;
      p_isa = (NSString *)&v16->super.isa;
      _os_log_impl(&dword_21B697000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to init the model with networkConfiguration: %{private}@ ***", (uint8_t *)&v26, 0x1Cu);
    }
LABEL_9:

LABEL_17:
    v22 = 0;
    goto LABEL_18;
  }
  if (e5rt_execution_stream_create())
  {
    v17 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 138);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      int v26 = 136381187;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v28 = 1025;
      int v29 = 138;
      __int16 v30 = 2113;
      p_isa = v18;
      _os_log_impl(&dword_21B697000, v17, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v26, 0x1Cu);
    }
    v15 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = *p_configuration;
      int v26 = 136381187;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v28 = 1025;
      int v29 = 138;
      __int16 v30 = 2113;
      p_isa = (NSString *)&v19->super.isa;
      _os_log_impl(&dword_21B697000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to init the model with networkConfiguration: %{private}@ ***", (uint8_t *)&v26, 0x1Cu);
    }
    goto LABEL_9;
  }
  v20 = [v5 networkMode];
  int64_t v21 = [(SIBaseNetworkE5RT *)self selectComputeOperationByFunctionName:v20];

  if (v21) {
    goto LABEL_17;
  }
  if ([(SIBaseNetworkE5RT *)self _setupMetaDataFromLibrary])
  {
    __int16 v24 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v25 = self->_networkName;
      int v26 = 136381187;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v28 = 1025;
      int v29 = 144;
      __int16 v30 = 2112;
      p_isa = v25;
      _os_log_impl(&dword_21B697000, v24, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Warning] Failed to get metadata for E5 Bundle (%@) ***", (uint8_t *)&v26, 0x1Cu);
    }
  }
  v22 = self;
LABEL_18:

  return v22;
}

- (int64_t)_loadModel:(id)a3 operation:(e5rt_execution_stream_operation *)a4
{
  id v5 = a3;
  [v5 UTF8String];
  [(NSString *)self->_e5Path UTF8String];
  id v6 = v5;
  [v6 UTF8String];
  if (e5rt_execution_stream_operation_create_precompiled_compute_operation()) {
    int64_t v7 = 7;
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (int64_t)selectComputeOperationByFunctionName:(id)a3
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v4 = (__CFString *)a3;
  int v5 = [(__CFString *)v4 isEqualToString:&stru_26CB7E380];
  id v6 = @"main";
  if (!v5) {
    id v6 = v4;
  }
  int64_t v7 = v6;

  id v8 = v7;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[(__CFString *)v8 UTF8String]);
  BOOL v9 = std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::find<std::string>(&self->_e5rt_loaded_operations.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)__p);
  v10 = v9;
  if (SBYTE3(v69) < 0)
  {
    operator delete(*(void **)__p);
    if (v10) {
      goto LABEL_7;
    }
  }
  else if (v9)
  {
    goto LABEL_7;
  }
  uint64_t v63 = 0;
  if ([(SIBaseNetworkE5RT *)self _loadModel:v8 operation:&v63])
  {
    v16 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      e5Path = self->_e5Path;
      *(_DWORD *)__p = 136381443;
      *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v66 = 1025;
      int v67 = 194;
      __int16 v68 = 2113;
      v69 = v8;
      __int16 v70 = 2113;
      v71 = e5Path;
      _os_log_impl(&dword_21B697000, v16, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create compute operation for function name: %{private}@, e5Path: %{private}@ ***", __p, 0x26u);
    }
    goto LABEL_33;
  }
  unint64_t v61 = 0;
  unint64_t v62 = 0;
  if (e5rt_execution_stream_operation_get_num_inputs())
  {
    v18 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 200);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__p = 136381187;
      *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v66 = 1025;
      int v67 = 200;
      __int16 v68 = 2113;
      v69 = v19;
      _os_log_impl(&dword_21B697000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", __p, 0x1Cu);
    }
    v16 = __SceneIntelligenceLogSharedInstance();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    v20 = self->_e5Path;
    *(_DWORD *)__p = 136381443;
    *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    __int16 v66 = 1025;
    int v67 = 200;
    __int16 v68 = 2113;
    v69 = v8;
    __int16 v70 = 2113;
    v71 = v20;
    int64_t v21 = " %{private}s:%{private}d *** Failed to get #inputs for function name: %{private}@, e5Path: %{private}@ ***";
    goto LABEL_32;
  }
  if (e5rt_execution_stream_operation_get_num_outputs())
  {
    v22 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 203);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__p = 136381187;
      *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v66 = 1025;
      int v67 = 203;
      __int16 v68 = 2113;
      v69 = v23;
      _os_log_impl(&dword_21B697000, v22, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", __p, 0x1Cu);
    }
    v16 = __SceneIntelligenceLogSharedInstance();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    __int16 v24 = self->_e5Path;
    *(_DWORD *)__p = 136381443;
    *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    __int16 v66 = 1025;
    int v67 = 203;
    __int16 v68 = 2113;
    v69 = v8;
    __int16 v70 = 2113;
    v71 = v24;
    int64_t v21 = " %{private}s:%{private}d *** Failed to get #outputs for function name: %{private}@, e5Path: %{private}@ ***";
LABEL_32:
    _os_log_impl(&dword_21B697000, v16, OS_LOG_TYPE_ERROR, v21, __p, 0x26u);
LABEL_33:

LABEL_34:
    int64_t v15 = 7;
    goto LABEL_35;
  }
  v59 = 0;
  uint64_t v60 = 0;
  v58 = 0;
  v56 = 0;
  uint64_t v57 = 0;
  v55 = 0;
  obunint64_t j = objc_alloc_init(MEMORY[0x263EFF980]);
  id v51 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (e5rt_execution_stream_operation_get_input_names())
  {
    int v26 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 214);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__p = 136381187;
      *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v66 = 1025;
      int v67 = 214;
      __int16 v68 = 2113;
      v69 = v27;
      _os_log_impl(&dword_21B697000, v26, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", __p, 0x1Cu);
    }
    __int16 v28 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v29 = self->_e5Path;
      *(_DWORD *)__p = 136381443;
      *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v66 = 1025;
      int v67 = 214;
      __int16 v68 = 2113;
      v69 = v8;
      __int16 v70 = 2113;
      v71 = v29;
      _os_log_impl(&dword_21B697000, v28, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to get input blob names for function name: %{private}@, e5Path: %{private}@ ***", __p, 0x26u);
    }
LABEL_47:

    char v33 = 0;
    goto LABEL_48;
  }
  if (e5rt_execution_stream_operation_get_output_names())
  {
    __int16 v30 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 217);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__p = 136381187;
      *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v66 = 1025;
      int v67 = 217;
      __int16 v68 = 2113;
      v69 = v31;
      _os_log_impl(&dword_21B697000, v30, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", __p, 0x1Cu);
    }
    __int16 v28 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = self->_e5Path;
      *(_DWORD *)__p = 136381443;
      *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v66 = 1025;
      int v67 = 217;
      __int16 v68 = 2113;
      v69 = v8;
      __int16 v70 = 2113;
      v71 = v32;
      _os_log_impl(&dword_21B697000, v28, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to get output blob names for function name: %{private}@, e5Path: %{private}@ ***", __p, 0x26u);
    }
    goto LABEL_47;
  }
  if (v62)
  {
    for (unint64_t i = 0; i < v62; ++i)
    {
      v35 = objc_msgSend(NSString, "stringWithUTF8String:", *((void *)v58 + i), v51);
      [obj addObject:v35];
      v36 = [SIE5RTPort alloc];
      uint64_t v37 = [(SIE5RTPort *)v36 initPortWithE5RTStreamOperation:v63 blobName:v35 portType:0];
      std::string::basic_string[abi:nn180100]<0>(__p, (char *)[(__CFString *)v8 UTF8String]);
      v53[0] = __p;
      v38 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_inputsForOperations, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)v53);
      id v39 = v35;
      std::string::basic_string[abi:nn180100]<0>(v53, (char *)[v39 UTF8String]);
      v64 = v53;
      v40 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)(v38 + 40), (uint64_t)v53, (uint64_t)&std::piecewise_construct, (long long **)&v64);
      v41 = (void *)*((void *)v40 + 5);
      *((void *)v40 + 5) = v37;

      if (v54 < 0) {
        operator delete(v53[0]);
      }
      if (SBYTE3(v69) < 0) {
        operator delete(*(void **)__p);
      }
    }
  }
  if (v61)
  {
    for (unint64_t j = 0; j < v61; ++j)
    {
      v43 = objc_msgSend(NSString, "stringWithUTF8String:", *((void *)v55 + j), v51);
      [v51 addObject:v43];
      v44 = [SIE5RTPort alloc];
      uint64_t v45 = [(SIE5RTPort *)v44 initPortWithE5RTStreamOperation:v63 blobName:v43 portType:1];
      std::string::basic_string[abi:nn180100]<0>(__p, (char *)[(__CFString *)v8 UTF8String]);
      v53[0] = __p;
      v46 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputsForOperations, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)v53);
      id v47 = v43;
      std::string::basic_string[abi:nn180100]<0>(v53, (char *)[v47 UTF8String]);
      v64 = v53;
      v48 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)(v46 + 40), (uint64_t)v53, (uint64_t)&std::piecewise_construct, (long long **)&v64);
      v49 = (void *)*((void *)v48 + 5);
      *((void *)v48 + 5) = v45;

      if (v54 < 0) {
        operator delete(v53[0]);
      }
      if (SBYTE3(v69) < 0) {
        operator delete(*(void **)__p);
      }
    }
  }
  objc_storeStrong((id *)&self->_networkInputNames, obj);
  objc_storeStrong((id *)&self->_networkOutputNames, v51);
  uint64_t v50 = v63;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[(__CFString *)v8 UTF8String]);
  v53[0] = __p;
  *((void *)std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_e5rt_loaded_operations, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)v53)+ 5) = v50;
  if (SBYTE3(v69) < 0) {
    operator delete(*(void **)__p);
  }
  char v33 = 1;
LABEL_48:

  if (v55)
  {
    v56 = v55;
    operator delete(v55);
  }
  if (v58)
  {
    v59 = v58;
    operator delete(v58);
  }
  if ((v33 & 1) == 0) {
    goto LABEL_34;
  }
LABEL_7:
  v11 = v8;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[(__CFString *)v11 UTF8String]);
  v58 = __p;
  self->_enabled_e5rt_operation = (e5rt_execution_stream_operation *)*((void *)std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_e5rt_loaded_operations, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v58)+ 5);
  if (SBYTE3(v69) < 0) {
    operator delete(*(void **)__p);
  }
  objc_storeStrong((id *)&self->_enabled_e5rt_function_name, v11);
  v12 = v11;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[(__CFString *)v12 UTF8String]);
  v58 = __p;
  v13 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_inputsForOperations, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v58);
  if (&self->_inputs != (unordered_map<std::string, SIE5RTPort *, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, SIE5RTPort *>>> *)(v13 + 40))
  {
    self->_inputs.__table_.__p3_.__value_ = *((float *)v13 + 18);
    std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *> *>>(&self->_inputs.__table_.__bucket_list_.__ptr_.__value_, *((uint64_t **)v13 + 7), 0);
  }
  if (SBYTE3(v69) < 0) {
    operator delete(*(void **)__p);
  }
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[(__CFString *)v12 UTF8String]);
  v58 = __p;
  v14 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputsForOperations, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v58);
  if (&self->_outputs != (unordered_map<std::string, SIE5RTPort *, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, SIE5RTPort *>>> *)(v14 + 40))
  {
    self->_outputs.__table_.__p3_.__value_ = *((float *)v14 + 18);
    std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *> *>>(&self->_outputs.__table_.__bucket_list_.__ptr_.__value_, *((uint64_t **)v14 + 7), 0);
  }
  if (SBYTE3(v69) < 0) {
    operator delete(*(void **)__p);
  }
  int64_t v15 = 0;
LABEL_35:

  return v15;
}

- (void)dealloc
{
  [(SIBaseNetworkE5RT *)self reset];
  opsForLibrary = self->_opsForLibrary;
  if (opsForLibrary) {
    CFRelease(opsForLibrary);
  }
  if (self->_isModelCompiledInRuntime)
  {
    id v4 = [MEMORY[0x263F08850] defaultManager];
    [v4 removeItemAtPath:self->_e5Path error:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)SIBaseNetworkE5RT;
  [(SIBaseNetworkE5RT *)&v5 dealloc];
}

- (int64_t)reset
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  [(SIBaseNetworkE5RT *)self unwirePrewiringBuffers];
  p_p1 = &self->_e5rt_loaded_operations.__table_.__p1_;
  while (1)
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1) {
      break;
    }
    if (e5rt_execution_stream_operation_release())
    {
      id v4 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 265);
        objc_super v5 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *>>> *)objc_claimAutoreleasedReturnValue();
        int v16 = 136381187;
        v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
        __int16 v18 = 1025;
        int v19 = 265;
        __int16 v20 = 2113;
        int64_t v21 = v5;
        _os_log_impl(&dword_21B697000, v4, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v16, 0x1Cu);
      }
      id v6 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        next = p_p1 + 2;
        if (SHIBYTE(p_p1[4].__value_.__next_) < 0) {
          next = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *>>> *)next->__value_.__next_;
        }
        int v16 = 136381187;
        v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
        __int16 v18 = 1025;
        int v19 = 265;
        __int16 v20 = 2081;
        int64_t v21 = next;
        id v8 = " %{private}s:%{private}d *** Failed to release loaded operation: %{private}s ***";
        BOOL v9 = v6;
        uint32_t v10 = 28;
LABEL_23:
        _os_log_impl(&dword_21B697000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v16, v10);
      }
LABEL_24:

      return 7;
    }
  }
  if (self->_stream && e5rt_execution_stream_release())
  {
    v11 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 270);
      v12 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *>>> *)objc_claimAutoreleasedReturnValue();
      int v16 = 136381187;
      v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v18 = 1025;
      int v19 = 270;
      __int16 v20 = 2113;
      int64_t v21 = v12;
      _os_log_impl(&dword_21B697000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v16, 0x1Cu);
    }
    id v6 = __SceneIntelligenceLogSharedInstance();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    int v16 = 136380931;
    v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    __int16 v18 = 1025;
    int v19 = 270;
    id v8 = " %{private}s:%{private}d *** Failed to release E5RT inference stream ***";
LABEL_22:
    BOOL v9 = v6;
    uint32_t v10 = 18;
    goto LABEL_23;
  }
  if (self->_initPrewiringStream && e5rt_execution_stream_release())
  {
    v13 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 276);
      v14 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, e5rt_execution_stream_operation *>, void *>>> *)objc_claimAutoreleasedReturnValue();
      int v16 = 136381187;
      v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v18 = 1025;
      int v19 = 276;
      __int16 v20 = 2113;
      int64_t v21 = v14;
      _os_log_impl(&dword_21B697000, v13, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v16, 0x1Cu);
    }
    id v6 = __SceneIntelligenceLogSharedInstance();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    int v16 = 136380931;
    v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    __int16 v18 = 1025;
    int v19 = 276;
    id v8 = " %{private}s:%{private}d *** Failed to release E5RT ANEP stream ***";
    goto LABEL_22;
  }
  return 0;
}

- (int64_t)setInput:(id)a3 fromCVPixelBuffer:(__CVBuffer *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  IOSurface = CVPixelBufferGetIOSurface(a4);
  uint64_t ID = IOSurfaceGetID(IOSurface);
  if ([(SIBaseNetworkE5RT *)self IsPrewiringEnabled]
    && ![(SIBaseNetworkE5RT *)self IsSurfacePrewiredForCurrentFunctionForBlob:v6 surfaceID:ID])
  {
    v11 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 136381443;
      *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v14 = 1025;
      int v15 = 286;
      __int16 v16 = 1024;
      int v17 = ID;
      __int16 v18 = 2113;
      id v19 = v6;
      _os_log_impl(&dword_21B697000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Trying to bind the buffer (id= %d) for blob (%{private}@) that was not ANEP ready ***", __p, 0x22u);
    }

    int64_t v10 = 3;
  }
  else
  {
    std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v6 UTF8String]);
    BOOL v9 = std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::find<std::string>(&self->_inputs.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)__p);
    if (!v9) {
      abort();
    }
    if (SHIBYTE(v17) < 0) {
      operator delete(*(void **)__p);
    }
    int64_t v10 = [*((id *)v9 + 5) bindPixelBuffer:a4];
  }

  return v10;
}

- (int64_t)setInput:(id)a3 fromRawPointer:(const void *)a4
{
  id v6 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v6 UTF8String]);
  v12 = __p;
  int64_t v7 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_inputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v12);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  int64_t v8 = [*((id *)v7 + 5) bindRawPointer:a4];

  return v8;
}

- (void)getInputPtr:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  int64_t v10 = __p;
  objc_super v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_inputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  id v6 = (void *)[*((id *)v5 + 5) getDataPtr];

  return v6;
}

- (unint64_t)getInputWidth:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  int64_t v10 = __p;
  objc_super v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_inputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  unint64_t v6 = [*((id *)v5 + 5) getWidth];

  return v6;
}

- (unint64_t)getInputHeight:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  int64_t v10 = __p;
  objc_super v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_inputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  unint64_t v6 = [*((id *)v5 + 5) getHeight];

  return v6;
}

- (unint64_t)getInputChannels:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  int64_t v10 = __p;
  objc_super v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_inputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  unint64_t v6 = [*((id *)v5 + 5) getChannels];

  return v6;
}

- (unint64_t)getInputLength:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  int64_t v10 = __p;
  objc_super v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_inputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  unint64_t v6 = [*((id *)v5 + 5) getNumberOfElements];

  return v6;
}

- (int64_t)setOutputBlob:(id)a3 forOutputSurface:(__IOSurface *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t ID = IOSurfaceGetID(a4);
  if ([(SIBaseNetworkE5RT *)self IsPrewiringEnabled]
    && ![(SIBaseNetworkE5RT *)self IsSurfacePrewiredForCurrentFunctionForBlob:v6 surfaceID:ID])
  {
    int64_t v10 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 136381443;
      *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v13 = 1025;
      int v14 = 333;
      __int16 v15 = 1024;
      int v16 = ID;
      __int16 v17 = 2113;
      id v18 = v6;
      _os_log_impl(&dword_21B697000, v10, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Trying to bind the buffer (id= %d) for blob (%{private}@) that was not ANEP ready ***", __p, 0x22u);
    }

    int64_t v9 = 3;
  }
  else
  {
    std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v6 UTF8String]);
    int64_t v8 = std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::find<std::string>(&self->_outputs.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)__p);
    if (!v8) {
      abort();
    }
    if (SHIBYTE(v16) < 0) {
      operator delete(*(void **)__p);
    }
    int64_t v9 = [*((id *)v8 + 5) bindIOSurface:a4];
  }

  return v9;
}

- (void)getRawOutput:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  int64_t v10 = __p;
  objc_super v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  id v6 = (void *)[*((id *)v5 + 5) getDataPtr];

  return v6;
}

- (__IOSurface)getOutputSurface:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  int64_t v10 = __p;
  objc_super v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  id v6 = (__IOSurface *)[*((id *)v5 + 5) getIOSurface];

  return v6;
}

- (__n128)getOutputShape:(void *)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  __int16 v13 = __p;
  objc_super v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(a1 + 248, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v13);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  id v6 = (int32x4_t *)[*((id *)v5 + 5) getShape];
  int32x4_t v7 = vuzp1q_s32(*v6, v6[1]);
  int32x4_t v8 = vrev64q_s32(v7);
  v8.i64[0] = v7.i64[0];
  int32x4_t v10 = v8;

  return (__n128)v10;
}

- (unint64_t)getOutputWidth:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  int32x4_t v10 = __p;
  objc_super v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  unint64_t v6 = [*((id *)v5 + 5) getWidth];

  return v6;
}

- (unint64_t)getOutputHeight:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  int32x4_t v10 = __p;
  objc_super v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  unint64_t v6 = [*((id *)v5 + 5) getHeight];

  return v6;
}

- (unint64_t)getOutputChannels:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  int32x4_t v10 = __p;
  objc_super v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  unint64_t v6 = [*((id *)v5 + 5) getChannels];

  return v6;
}

- (unint64_t)getOutputBatchNum:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  int32x4_t v10 = __p;
  objc_super v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  unint64_t v6 = [*((id *)v5 + 5) getBatchnum];

  return v6;
}

- (unint64_t)getOutputLength:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  int32x4_t v10 = __p;
  objc_super v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  unint64_t v6 = [*((id *)v5 + 5) getNumberOfElements];

  return v6;
}

- (unint64_t)getOutputRowElements:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  int32x4_t v10 = __p;
  objc_super v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  unint64_t v6 = [*((id *)v5 + 5) getRowElements];

  return v6;
}

- (unint64_t)getOutputBytePerRow:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  int32x4_t v10 = __p;
  objc_super v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  unint64_t v6 = [*((id *)v5 + 5) getBytePerRow];

  return v6;
}

- (unint64_t)getOutputComponentSize:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  int32x4_t v10 = __p;
  objc_super v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  unint64_t v6 = [*((id *)v5 + 5) getComponentSize];

  return v6;
}

- (id)getOpsForLibrary
{
  return self->_opsForLibrary;
}

- (BOOL)outputExists:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  objc_super v5 = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::find<std::string>(&self->_outputs.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)__p);
  if (v8 < 0) {
    operator delete(__p[0]);
  }

  return v5 != 0;
}

- (int64_t)runNetwork
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (e5rt_execution_stream_encode_operation())
  {
    v2 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 430);
      int v11 = 136381187;
      char v12 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v13 = 1025;
      int v14 = 430;
      __int16 v15 = 2113;
      int v16 = v3;
      _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v11, 0x1Cu);
    }
    id v4 = __SceneIntelligenceLogSharedInstance();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    int v11 = 136380931;
    char v12 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    __int16 v13 = 1025;
    int v14 = 430;
    objc_super v5 = " %{private}s:%{private}d *** Failed to encode E5RT opeation into execution stream. ***";
    goto LABEL_16;
  }
  if (e5rt_execution_stream_execute_sync())
  {
    unint64_t v6 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int32x4_t v7 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 433);
      int v11 = 136381187;
      char v12 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v13 = 1025;
      int v14 = 433;
      __int16 v15 = 2113;
      int v16 = v7;
      _os_log_impl(&dword_21B697000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v11, 0x1Cu);
    }
    id v4 = __SceneIntelligenceLogSharedInstance();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    int v11 = 136380931;
    char v12 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    __int16 v13 = 1025;
    int v14 = 433;
    objc_super v5 = " %{private}s:%{private}d *** Failed to run execution stream. ***";
    goto LABEL_16;
  }
  if (!e5rt_execution_stream_reset()) {
    return 0;
  }
  char v8 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    char v9 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 436);
    int v11 = 136381187;
    char v12 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    __int16 v13 = 1025;
    int v14 = 436;
    __int16 v15 = 2113;
    int v16 = v9;
    _os_log_impl(&dword_21B697000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v11, 0x1Cu);
  }
  id v4 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136380931;
    char v12 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    __int16 v13 = 1025;
    int v14 = 436;
    objc_super v5 = " %{private}s:%{private}d *** Failed to reset execution stream. ***";
LABEL_16:
    _os_log_impl(&dword_21B697000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v11, 0x12u);
  }
LABEL_17:

  return 7;
}

- (BOOL)supportFloat16IO
{
  return 1;
}

- (BOOL)supportZeroCopyOutput
{
  return 1;
}

- (id)networkVersion
{
  return self->_networkVersion;
}

- (id)networkName
{
  return self->_networkName;
}

- (int64_t)addPrewiringBuffersToStreamForFunctionName:(id)a3 inputPools:(id)a4 outputPools:(id)a5 clearWiredBuffer:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v164 = *MEMORY[0x263EF8340];
  id v124 = a3;
  id v9 = a4;
  id v122 = a5;
  if (v6) {
    [(SIBaseNetworkE5RT *)self unwirePrewiringBuffersForFunctionName:v124];
  }
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  obuint64_t j = v9;
  unint64_t v10 = 0;
  uint64_t v11 = [obj countByEnumeratingWithState:&v147 objects:v163 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v148;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v148 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(id *)(*((void *)&v147 + 1) + 8 * i);
        __int16 v15 = [obj objectForKeyedSubscript:v14];
        unint64_t v16 = [v15 count];
        if (v10 <= v16) {
          unint64_t v10 = v16;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v147 objects:v163 count:16];
    }
    while (v11);
  }

  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  id v133 = v122;
  uint64_t v17 = [v133 countByEnumeratingWithState:&v143 objects:v162 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v144;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v144 != v18) {
          objc_enumerationMutation(v133);
        }
        id v20 = *(id *)(*((void *)&v143 + 1) + 8 * j);
        int64_t v21 = [v133 objectForKeyedSubscript:v20];
        unint64_t v22 = [v21 count];
        if (v10 <= v22) {
          unint64_t v10 = v22;
        }
      }
      uint64_t v17 = [v133 countByEnumeratingWithState:&v143 objects:v162 count:16];
    }
    while (v17);
  }

  id v125 = v124;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v125 UTF8String]);
  *(void *)buf = __p;
  v23 = std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_prewiredFunctionTable, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)buf);
  if ((__p[23] & 0x80000000) != 0)
  {
    operator delete(*(void **)__p);
    if (!v10) {
      goto LABEL_114;
    }
    goto LABEL_25;
  }
  if (v10)
  {
LABEL_25:
    unint64_t v24 = 0;
    uint64_t v130 = (uint64_t)(v23 + 120);
    uint64_t v131 = (uint64_t)(v23 + 64);
    int64_t v123 = 7;
    while (1)
    {
      context = (void *)MEMORY[0x21D493650]();
      uint64_t v142 = 0;
      [(NSString *)self->_e5Path UTF8String];
      [(NSString *)self->_e5Path UTF8String];
      [v125 UTF8String];
      if (e5rt_execution_stream_operation_create_precompiled_compute_operation()) {
        break;
      }
      long long v140 = 0u;
      long long v141 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      v128 = self->_networkInputNames;
      uint64_t v32 = [(NSArray *)v128 countByEnumeratingWithState:&v138 objects:v161 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v139;
        do
        {
          for (uint64_t k = 0; k != v32; ++k)
          {
            if (*(void *)v139 != v33) {
              objc_enumerationMutation(v128);
            }
            id v35 = *(id *)(*((void *)&v138 + 1) + 8 * k);
            v36 = [obj objectForKeyedSubscript:v35];
            unint64_t v37 = [v36 count];

            v38 = [obj objectForKeyedSubscript:v35];
            id v39 = [v38 objectAtIndexedSubscript:v24 % v37];

            v40 = [SIE5RTPort alloc];
            id v41 = [(SIE5RTPort *)v40 initPortWithE5RTStreamOperation:v142 blobName:v35 portType:0];
            [v41 bindIOSurface:v39];
            v43 = (void *)*((void *)v23 + 14);
            unint64_t v42 = *((void *)v23 + 15);
            if ((unint64_t)v43 >= v42)
            {
              uint64_t v45 = *((void *)v23 + 13);
              uint64_t v46 = ((uint64_t)v43 - v45) >> 3;
              if ((unint64_t)(v46 + 1) >> 61) {
                abort();
              }
              uint64_t v47 = v42 - v45;
              uint64_t v48 = v47 >> 2;
              if (v47 >> 2 <= (unint64_t)(v46 + 1)) {
                uint64_t v48 = v46 + 1;
              }
              if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v49 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v49 = v48;
              }
              *(void *)&__p[32] = v23 + 120;
              if (v49) {
                uint64_t v50 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<char const*>>(v130, v49);
              }
              else {
                uint64_t v50 = 0;
              }
              id v51 = &v50[8 * v46];
              v52 = &v50[8 * v49];
              *(void *)&__p[24] = v52;
              *(void *)id v51 = v41;
              v44 = v51 + 8;
              *(void *)&__p[16] = v51 + 8;
              char v54 = (void *)*((void *)v23 + 13);
              v53 = (void *)*((void *)v23 + 14);
              if (v53 == v54)
              {
                int64x2_t v56 = vdupq_n_s64((unint64_t)v53);
              }
              else
              {
                do
                {
                  uint64_t v55 = *--v53;
                  void *v53 = 0;
                  *((void *)v51 - 1) = v55;
                  v51 -= 8;
                }
                while (v53 != v54);
                int64x2_t v56 = *(int64x2_t *)(v23 + 104);
                v44 = *(void **)&__p[16];
                v52 = *(char **)&__p[24];
              }
              *((void *)v23 + 13) = v51;
              *((void *)v23 + 14) = v44;
              *(int64x2_t *)&__p[8] = v56;
              uint64_t v57 = *((void *)v23 + 15);
              *((void *)v23 + 15) = v52;
              *(void *)&__p[24] = v57;
              *(void *)__p = v56.i64[0];
              std::__split_buffer<SIE5RTPort * {__strong}>::~__split_buffer((uint64_t)__p);
            }
            else
            {
              void *v43 = v41;
              v44 = v43 + 1;
            }
            *((void *)v23 + 14) = v44;
            id v58 = v35;
            std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v58 UTF8String]);
            *(void *)buf = __p;
            v59 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v131, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)buf);
            *(_DWORD *)buf = IOSurfaceGetID((IOSurfaceRef)v39);
            std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)(v59 + 40), (int *)buf, buf);
            if ((__p[23] & 0x80000000) != 0) {
              operator delete(*(void **)__p);
            }
          }
          uint64_t v32 = [(NSArray *)v128 countByEnumeratingWithState:&v138 objects:v161 count:16];
        }
        while (v32);
      }

      long long v136 = 0u;
      long long v137 = 0u;
      long long v134 = 0u;
      long long v135 = 0u;
      v129 = self->_networkOutputNames;
      uint64_t v60 = [(NSArray *)v129 countByEnumeratingWithState:&v134 objects:v160 count:16];
      if (v60)
      {
        uint64_t v61 = *(void *)v135;
        do
        {
          for (uint64_t m = 0; m != v60; ++m)
          {
            if (*(void *)v135 != v61) {
              objc_enumerationMutation(v129);
            }
            id v63 = *(id *)(*((void *)&v134 + 1) + 8 * m);
            v64 = [v133 objectForKey:v63];
            BOOL v65 = v64 == 0;

            if (v65)
            {
              std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v63 UTF8String]);
              *(void *)buf = __p;
              v69 = objc_msgSend(*((id *)std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputs, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)buf)+ 5), "getIOSurface");
              if ((__p[23] & 0x80000000) != 0) {
                operator delete(*(void **)__p);
              }
            }
            else
            {
              __int16 v66 = [v133 objectForKeyedSubscript:v63];
              unint64_t v67 = [v66 count];

              __int16 v68 = [v133 objectForKeyedSubscript:v63];
              v69 = [v68 objectAtIndexedSubscript:v24 % v67];
            }
            __int16 v70 = [SIE5RTPort alloc];
            id v71 = [(SIE5RTPort *)v70 initPortWithE5RTStreamOperation:v142 blobName:v63 portType:1];
            [v71 bindIOSurface:v69];
            v73 = (void *)*((void *)v23 + 14);
            unint64_t v72 = *((void *)v23 + 15);
            if ((unint64_t)v73 >= v72)
            {
              uint64_t v75 = *((void *)v23 + 13);
              uint64_t v76 = ((uint64_t)v73 - v75) >> 3;
              if ((unint64_t)(v76 + 1) >> 61) {
                abort();
              }
              uint64_t v77 = v72 - v75;
              uint64_t v78 = v77 >> 2;
              if (v77 >> 2 <= (unint64_t)(v76 + 1)) {
                uint64_t v78 = v76 + 1;
              }
              if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v79 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v79 = v78;
              }
              *(void *)&__p[32] = v23 + 120;
              if (v79) {
                v80 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<char const*>>(v130, v79);
              }
              else {
                v80 = 0;
              }
              v81 = &v80[8 * v76];
              v82 = &v80[8 * v79];
              *(void *)&__p[24] = v82;
              *(void *)v81 = v71;
              v74 = v81 + 8;
              *(void *)&__p[16] = v81 + 8;
              v84 = (void *)*((void *)v23 + 13);
              v83 = (void *)*((void *)v23 + 14);
              if (v83 == v84)
              {
                int64x2_t v86 = vdupq_n_s64((unint64_t)v83);
              }
              else
              {
                do
                {
                  uint64_t v85 = *--v83;
                  void *v83 = 0;
                  *((void *)v81 - 1) = v85;
                  v81 -= 8;
                }
                while (v83 != v84);
                int64x2_t v86 = *(int64x2_t *)(v23 + 104);
                v74 = *(void **)&__p[16];
                v82 = *(char **)&__p[24];
              }
              *((void *)v23 + 13) = v81;
              *((void *)v23 + 14) = v74;
              *(int64x2_t *)&__p[8] = v86;
              uint64_t v87 = *((void *)v23 + 15);
              *((void *)v23 + 15) = v82;
              *(void *)&__p[24] = v87;
              *(void *)__p = v86.i64[0];
              std::__split_buffer<SIE5RTPort * {__strong}>::~__split_buffer((uint64_t)__p);
            }
            else
            {
              void *v73 = v71;
              v74 = v73 + 1;
            }
            *((void *)v23 + 14) = v74;
            id v88 = v63;
            std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v88 UTF8String]);
            *(void *)buf = __p;
            v89 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v131, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)buf);
            *(_DWORD *)buf = IOSurfaceGetID((IOSurfaceRef)v69);
            std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)(v89 + 40), (int *)buf, buf);
            if ((__p[23] & 0x80000000) != 0) {
              operator delete(*(void **)__p);
            }
          }
          uint64_t v60 = [(NSArray *)v129 countByEnumeratingWithState:&v134 objects:v160 count:16];
        }
        while (v60);
      }

      v91 = (uint64_t *)*((void *)v23 + 6);
      unint64_t v90 = *((void *)v23 + 7);
      if ((unint64_t)v91 >= v90)
      {
        uint64_t v93 = *((void *)v23 + 5);
        uint64_t v94 = ((uint64_t)v91 - v93) >> 3;
        if ((unint64_t)(v94 + 1) >> 61) {
          abort();
        }
        uint64_t v95 = v90 - v93;
        uint64_t v96 = v95 >> 2;
        if (v95 >> 2 <= (unint64_t)(v94 + 1)) {
          uint64_t v96 = v94 + 1;
        }
        if ((unint64_t)v95 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v97 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v97 = v96;
        }
        if (v97) {
          v98 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<char const*>>((uint64_t)(v23 + 56), v97);
        }
        else {
          v98 = 0;
        }
        v99 = &v98[8 * v94];
        *(void *)v99 = v142;
        v92 = v99 + 8;
        v101 = (char *)*((void *)v23 + 5);
        v100 = (char *)*((void *)v23 + 6);
        if (v100 != v101)
        {
          do
          {
            uint64_t v102 = *((void *)v100 - 1);
            v100 -= 8;
            *((void *)v99 - 1) = v102;
            v99 -= 8;
          }
          while (v100 != v101);
          v100 = (char *)*((void *)v23 + 5);
        }
        *((void *)v23 + 5) = v99;
        *((void *)v23 + 6) = v92;
        *((void *)v23 + 7) = &v98[8 * v97];
        if (v100) {
          operator delete(v100);
        }
      }
      else
      {
        uint64_t *v91 = v142;
        v92 = v91 + 1;
      }
      *((void *)v23 + 6) = v92;
      if (!e5rt_execution_stream_encode_operation())
      {
        char v106 = 1;
        goto LABEL_110;
      }
      v103 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
      {
        v104 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 566);
        *(_DWORD *)__p = 136381187;
        *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
        *(_WORD *)&unsigned char __p[12] = 1025;
        *(_DWORD *)&__p[14] = 566;
        *(_WORD *)&__p[18] = 2113;
        *(void *)&__p[20] = v104;
        _os_log_impl(&dword_21B697000, v103, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", __p, 0x1Cu);
      }
      v27 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v105 = "YES";
        if (!self->_initPrewiringStream) {
          v105 = "NO";
        }
        *(_DWORD *)__p = 136381187;
        *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
        *(_WORD *)&unsigned char __p[12] = 1025;
        *(_DWORD *)&__p[14] = 566;
        *(_WORD *)&__p[18] = 2081;
        *(void *)&__p[20] = v105;
        int v29 = v27;
        __int16 v30 = " %{private}s:%{private}d *** Failed to encode operation into execution stream for ANEP. Has ANEP Stream in"
              "it: %{private}s ***";
        uint32_t v31 = 28;
LABEL_108:
        _os_log_impl(&dword_21B697000, v29, OS_LOG_TYPE_ERROR, v30, __p, v31);
      }
LABEL_109:

      char v106 = 0;
LABEL_110:
      if ((v106 & 1) == 0) {
        goto LABEL_136;
      }
      if (++v24 == v10) {
        goto LABEL_114;
      }
    }
    int v25 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 533);
      *(_DWORD *)__p = 136381187;
      *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      *(_WORD *)&unsigned char __p[12] = 1025;
      *(_DWORD *)&__p[14] = 533;
      *(_WORD *)&__p[18] = 2113;
      *(void *)&__p[20] = v26;
      _os_log_impl(&dword_21B697000, v25, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", __p, 0x1Cu);
    }
    v27 = __SceneIntelligenceLogSharedInstance();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_109;
    }
    e5Path = self->_e5Path;
    *(_DWORD *)__p = 136381443;
    *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    *(_WORD *)&unsigned char __p[12] = 1025;
    *(_DWORD *)&__p[14] = 533;
    *(_WORD *)&__p[18] = 2113;
    *(void *)&__p[20] = v125;
    *(_WORD *)&__p[28] = 2113;
    *(void *)&__p[30] = e5Path;
    int v29 = v27;
    __int16 v30 = " %{private}s:%{private}d *** Failed to create compute operation for function name: %{private}@, e5Path: %{private}@ ***";
    uint32_t v31 = 38;
    goto LABEL_108;
  }
LABEL_114:
  if (e5rt_execution_stream_prewire_in_use_allocations())
  {
    v107 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
    {
      v108 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 571);
      *(_DWORD *)__p = 136381187;
      *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      *(_WORD *)&unsigned char __p[12] = 1025;
      *(_DWORD *)&__p[14] = 571;
      *(_WORD *)&__p[18] = 2113;
      *(void *)&__p[20] = v108;
      _os_log_impl(&dword_21B697000, v107, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", __p, 0x1Cu);
    }
    v109 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      v110 = "YES";
      initPrewiringStreauint64_t m = self->_initPrewiringStream;
      *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      *(_DWORD *)__p = 136381187;
      if (!initPrewiringStream) {
        v110 = "NO";
      }
      *(_WORD *)&unsigned char __p[12] = 1025;
      *(_DWORD *)&__p[14] = 571;
      *(_WORD *)&__p[18] = 2081;
      *(void *)&__p[20] = v110;
      _os_log_impl(&dword_21B697000, v109, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to prewire collected buffers. Has ANEP Stream init: %{private}s ***", __p, 0x1Cu);
    }

    int64_t v123 = 7;
  }
  else
  {
    v112 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
    {
      networkName = self->_networkName;
      *(_DWORD *)__p = 136381443;
      *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      *(_WORD *)&unsigned char __p[12] = 1025;
      *(_DWORD *)&__p[14] = 574;
      *(_WORD *)&__p[18] = 2113;
      *(void *)&__p[20] = networkName;
      *(_WORD *)&__p[28] = 2113;
      *(void *)&__p[30] = v125;
      _os_log_impl(&dword_21B697000, v112, OS_LOG_TYPE_DEBUG, " %{private}s:%{private}d *** ANEP info for %{private}@, function:%{private}@ ***", __p, 0x26u);
    }

    for (n = (long long *)*((void *)v23 + 10); n; n = *(long long **)n)
    {
      std::pair<std::string const,std::unordered_set<int>>::pair[abi:nn180100]((std::string *)__p, n + 1);
      id v115 = [NSString alloc];
      if (__p[23] >= 0) {
        v116 = __p;
      }
      else {
        v116 = *(unsigned char **)__p;
      }
      v117 = (void *)[v115 initWithUTF8String:v116];
      for (iuint64_t i = v159; ii; iuint64_t i = (uint64_t *)*ii)
      {
        int v119 = *((_DWORD *)ii + 4);
        v120 = __SceneIntelligenceLogSharedInstance();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136381443;
          *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
          __int16 v152 = 1025;
          int v153 = 578;
          __int16 v154 = 2113;
          v155 = v117;
          __int16 v156 = 1024;
          int v157 = v119;
          _os_log_impl(&dword_21B697000, v120, OS_LOG_TYPE_DEBUG, " %{private}s:%{private}d *** %{private}@ - %d ***", buf, 0x22u);
        }
      }
      std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&__p[24]);
      if ((__p[23] & 0x80000000) != 0) {
        operator delete(*(void **)__p);
      }
    }
    int64_t v123 = 0;
  }
LABEL_136:

  return v123;
}

- (int64_t)unwirePrewiringBuffersForFunctionName:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
  unint64_t v16 = (long long *)__p;
  objc_super v5 = std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_prewiredFunctionTable, (uint64_t)__p, (uint64_t)&std::piecewise_construct, &v16);
  if (SBYTE3(v21) < 0) {
    operator delete(*(void **)__p);
  }
  BOOL v6 = (long long **)*((void *)v5 + 5);
  int32x4_t v7 = (long long **)*((void *)v5 + 6);
  if (v6 == v7)
  {
LABEL_7:
    *((void *)v5 + 6) = v6;
    uint64_t v8 = *((void *)v5 + 13);
    for (uint64_t i = *((void *)v5 + 14); i != v8; i -= 8)
    {
      unint64_t v10 = *(void **)(i - 8);
    }
    *((void *)v5 + 14) = v8;
    std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::clear((uint64_t)(v5 + 64));
    int64_t v11 = 0;
  }
  else
  {
    while (1)
    {
      unint64_t v16 = *v6;
      if (e5rt_execution_stream_operation_release()) {
        break;
      }
      if (++v6 == v7)
      {
        BOOL v6 = (long long **)*((void *)v5 + 5);
        goto LABEL_7;
      }
    }
    uint64_t v12 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 590);
      *(_DWORD *)__p = 136381187;
      *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v18 = 1025;
      int v19 = 590;
      __int16 v20 = 2113;
      id v21 = v13;
      _os_log_impl(&dword_21B697000, v12, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", __p, 0x1Cu);
    }
    id v14 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 136381187;
      *(void *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v18 = 1025;
      int v19 = 590;
      __int16 v20 = 2113;
      id v21 = v4;
      _os_log_impl(&dword_21B697000, v14, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to release ANEP for function: %{private}@ ***", __p, 0x1Cu);
    }

    int64_t v11 = 7;
  }

  return v11;
}

- (BOOL)IsPrewiringEnabled
{
  p_prewiredFunctionTable = &self->_prewiredFunctionTable;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[(NSString *)self->_enabled_e5rt_function_name UTF8String]);
  int32x4_t v7 = __p;
  v3 = std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_prewiredFunctionTable, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v7);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  return *((void *)v3 + 11) != 0;
}

- (BOOL)IsSurfacePrewiredForCurrentFunctionForBlob:(id)a3 surfaceID:(int)a4
{
  id v6 = a3;
  int v21 = a4;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[(NSString *)self->_enabled_e5rt_function_name UTF8String]);
  v17[0] = __p;
  int32x4_t v7 = std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_prewiredFunctionTable, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)v17);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  id v8 = v6;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v8 UTF8String]);
  id v9 = v7 + 64;
  if (std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::find<std::string>(v9, (uint64_t)__p))
  {
    id v10 = v8;
    std::string::basic_string[abi:nn180100]<0>(v17, (char *)[v10 UTF8String]);
    v15[0] = v17;
    int64_t v11 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v9, (uint64_t)v17, (uint64_t)&std::piecewise_construct, (long long **)v15);
    uint64_t v12 = std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>((void *)v11 + 5, &v21);
    std::string::basic_string[abi:nn180100]<0>(v15, (char *)[v10 UTF8String]);
    uint64_t v22 = v15;
    std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v9, (uint64_t)v15, (uint64_t)&std::piecewise_construct, (long long **)&v22);
    BOOL v13 = v12 != 0;
    if (v16 < 0) {
      operator delete(v15[0]);
    }
    if (v18 < 0) {
      operator delete(v17[0]);
    }
  }
  else
  {
    BOOL v13 = 0;
  }
  if (v20 < 0) {
    operator delete(__p[0]);
  }

  return v13;
}

- (int64_t)unwirePrewiringBuffers
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  for (uint64_t i = (char *)self->_prewiredFunctionTable.__table_.__p1_.__value_.__next_; i; uint64_t i = *(char **)i)
  {
    id v4 = i + 16;
    id v5 = [NSString alloc];
    if (i[39] < 0) {
      id v4 = (void *)*v4;
    }
    id v6 = (void *)[v5 initWithUTF8String:v4];
    [(SIBaseNetworkE5RT *)self unwirePrewiringBuffersForFunctionName:v6];
  }
  std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::clear((uint64_t)&self->_prewiredFunctionTable);
  if (e5rt_execution_stream_release())
  {
    int32x4_t v7 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 622);
      int v14 = 136381187;
      __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
      __int16 v16 = 1025;
      int v17 = 622;
      __int16 v18 = 2113;
      int v19 = v8;
      _os_log_impl(&dword_21B697000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v14, 0x1Cu);
    }
    id v9 = __SceneIntelligenceLogSharedInstance();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    int v14 = 136380931;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    __int16 v16 = 1025;
    int v17 = 622;
    id v10 = " %{private}s:%{private}d *** Failed to release E5RT ANEP stream ***";
    goto LABEL_15;
  }
  if (!e5rt_execution_stream_create()) {
    return 0;
  }
  int64_t v11 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm", 625);
    int v14 = 136381187;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    __int16 v16 = 1025;
    int v17 = 625;
    __int16 v18 = 2113;
    int v19 = v12;
    _os_log_impl(&dword_21B697000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", (uint8_t *)&v14, 0x1Cu);
  }
  id v9 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v14 = 136380931;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIBaseNetworkE5RT.mm";
    __int16 v16 = 1025;
    int v17 = 625;
    id v10 = " %{private}s:%{private}d *** Failed to create E5RT ANEP stream ***";
LABEL_15:
    _os_log_impl(&dword_21B697000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v14, 0x12u);
  }
LABEL_16:

  return 7;
}

- (BOOL)prepare
{
  return 1;
}

- (id)networkInputNames
{
  return self->_networkInputNames;
}

- (id)networkOutputNames
{
  return self->_networkOutputNames;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::~__hash_table((uint64_t)&self->_prewiredFunctionTable);
  std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::~__hash_table((uint64_t)&self->_outputs);
  std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::~__hash_table((uint64_t)&self->_inputs);
  objc_storeStrong((id *)&self->_enabled_e5rt_function_name, 0);
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::~__hash_table((uint64_t)&self->_outputsForOperations);
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::~__hash_table((uint64_t)&self->_inputsForOperations);
  std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::~__hash_table((uint64_t)&self->_e5rt_loaded_operations);
  objc_storeStrong((id *)&self->_networkOutputNames, 0);
  objc_storeStrong((id *)&self->_networkInputNames, 0);
  objc_storeStrong((id *)&self->_opsForLibrary, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_networkVersion, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_e5Path, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 26) = 1065353216;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_DWORD *)self + 36) = 1065353216;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *((_DWORD *)self + 46) = 1065353216;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_DWORD *)self + 60) = 1065353216;
  *((_DWORD *)self + 70) = 1065353216;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 19) = 0u;
  *((_DWORD *)self + 80) = 1065353216;
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  return self;
}

@end