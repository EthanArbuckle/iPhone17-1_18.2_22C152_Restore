@interface SIVisualLogger
+ (id)_discoverSubloggers;
+ (id)defaultLogPath;
+ (id)frameworkPrefix;
+ (id)sharedLogger;
- (BOOL)_stopLoggingToFile;
- (BOOL)_stopLoggingToHost;
- (BOOL)isLoggerEnabled:(id)a3;
- (BOOL)logBinaryData:(id)a3 at:(double)a4 sublogger:(id)a5 name:(id)a6;
- (BOOL)logDictionary:(id)a3 at:(double)a4 sublogger:(id)a5 name:(id)a6;
- (BOOL)logIOSurface:(__IOSurface *)a3 at:(double)a4 sublogger:(id)a5 name:(id)a6;
- (BOOL)logNumber:(id)a3 at:(double)a4 sublogger:(id)a5 name:(id)a6;
- (BOOL)logNumbers:(id)a3 at:(double)a4 sublogger:(id)a5 name:(id)a6;
- (BOOL)logPixelBuffer:(__CVBuffer *)a3 at:(double)a4 sublogger:(id)a5 name:(id)a6;
- (BOOL)startLoggingToFile:(id)a3;
- (BOOL)startLoggingToFile:(id)a3 synchronously:(BOOL)a4;
- (BOOL)startLoggingToHost:(id)a3;
- (BOOL)stopAndDisableLogging;
- (NSSet)registeredSubloggers;
- (Ref<const)createDataInfoAt:(double)a3 name:(id)a4;
- (SIVisualLogger)init;
- (VZLogger)internalVisualLoggerRef;
- (id).cxx_construct;
- (id)_arrayOfNumbersToData:(id)a3 valueType:(unint64_t *)a4;
- (void)_disableAllLogs;
- (void)dealloc;
- (void)enableLogger:(id)a3;
- (void)logAndReleaseError:(__CFError *)a3;
- (void)registerSubloggers:(id)a3;
@end

@implementation SIVisualLogger

+ (id)frameworkPrefix
{
  return @"si";
}

+ (id)sharedLogger
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__SIVisualLogger_sharedLogger__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[SIVisualLogger sharedLogger]::onceToken != -1) {
    dispatch_once(&+[SIVisualLogger sharedLogger]::onceToken, block);
  }
  v2 = (void *)+[SIVisualLogger sharedLogger]::sharedLogger;
  return v2;
}

uint64_t __30__SIVisualLogger_sharedLogger__block_invoke(uint64_t a1)
{
  +[SIVisualLogger sharedLogger]::sharedLogger = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (SIVisualLogger)init
{
  v8.receiver = self;
  v8.super_class = (Class)SIVisualLogger;
  v2 = [(SIVisualLogger *)&v8 init];
  if (v2)
  {
    uint64_t v3 = MEMORY[0x21D492E50]();
    v2->_visualLogger = (VZLogger *)v3;
    if (!v3)
    {
      v6 = 0;
      goto LABEL_6;
    }
    v4 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    registeredSubloggers = v2->_registeredSubloggers;
    v2->_registeredSubloggers = v4;

    v2->_register_lock._os_unfair_lock_opaque = 0;
  }
  v6 = v2;
LABEL_6:

  return v6;
}

- (void)registerSubloggers:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v11 = a3;
  objc_storeStrong((id *)&self->_registeredSubloggers, a3);
  os_unfair_lock_lock(&self->_register_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_registeredSubloggers;
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v13 + 1) + 8 * i);
        [v9 UTF8String];
        uint64_t SubLoggerMutable = VZLoggerGetSubLoggerMutable();
        uint64_t v12 = [v9 UTF8String];
        v17 = &v12;
        std::__hash_table<std::__hash_value_type<char const*,VZSubLogger *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,VZSubLogger *>,std::hash<char const*>,std::equal_to<char const*>,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,VZSubLogger *>,std::equal_to<char const*>,std::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,VZSubLogger *>>>::__emplace_unique_key_args<char const*,std::piecewise_construct_t const&,std::tuple<char const*&&>,std::tuple<>>((uint64_t)&self->_vlSubloggerMap, &v12, (uint64_t)&std::piecewise_construct, &v17)[3] = SubLoggerMutable;
      }
      uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_register_lock);
}

- (void)dealloc
{
  [(SIVisualLogger *)self _stopLoggingToFile];
  [(SIVisualLogger *)self _stopLoggingToHost];
  VZRelease();
  VZRelease();
  VZRelease();
  v3.receiver = self;
  v3.super_class = (Class)SIVisualLogger;
  [(SIVisualLogger *)&v3 dealloc];
}

+ (id)_discoverSubloggers
{
  v2 = [MEMORY[0x263EFF9C0] set];
  unsigned int ClassList = objc_getClassList(0, 0);
  unsigned int v4 = ClassList;
  if (ClassList)
  {
    v5 = (Class *)malloc_type_malloc(8 * ClassList, 0x80040B8603338uLL);
    objc_getClassList(v5, v4);
    unint64_t v6 = 0;
    uint64_t v7 = 8 * v4;
    do
    {
      Class v8 = v5[v6 / 8];
      if (class_conformsToProtocol(v8, (Protocol *)&unk_26CB86A80))
      {
        id v9 = [(objc_class *)v8 subLoggers];
        [v2 unionSet:v9];
      }
      v6 += 8;
    }
    while (v7 != v6);
    free(v5);
  }
  return v2;
}

+ (id)defaultLogPath
{
  v2 = NSTemporaryDirectory();
  objc_super v3 = [v2 stringByAppendingPathComponent:@"VisualLogger_SceneIntelligence"];

  return v3;
}

- (void)logAndReleaseError:(__CFError *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a3)
  {
    unsigned int v4 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [(__CFError *)a3 code];
      unint64_t v6 = [(__CFError *)a3 description];
      int v7 = 136381443;
      Class v8 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
      __int16 v9 = 1025;
      int v10 = 180;
      __int16 v11 = 2048;
      uint64_t v12 = v5;
      __int16 v13 = 2113;
      long long v14 = v6;
      _os_log_impl(&dword_21B697000, v4, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Error.\nCode: %zu\nDescription: %{private}@ ***", (uint8_t *)&v7, 0x26u);
    }
  }
}

- (void)enableLogger:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 UTF8String];
  unint64_t v6 = &v5;
  if (std::__hash_table<std::__hash_value_type<char const*,VZSubLogger *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,VZSubLogger *>,std::hash<char const*>,std::equal_to<char const*>,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,VZSubLogger *>,std::equal_to<char const*>,std::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,VZSubLogger *>>>::__emplace_unique_key_args<char const*,std::piecewise_construct_t const&,std::tuple<char const*&&>,std::tuple<>>((uint64_t)&self->_vlSubloggerMap, &v5, (uint64_t)&std::piecewise_construct, &v6)[3])
  {
    VZSubLoggerEnable();
  }
  else
  {
    [v4 UTF8String];
    VZLoggerEnable();
  }
}

- (void)_disableAllLogs
{
}

- (BOOL)isLoggerEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_visualLogger)
  {
    id v6 = v4;
    uint64_t v10 = [v6 UTF8String];
    __int16 v11 = &v10;
    if (std::__hash_table<std::__hash_value_type<char const*,VZSubLogger *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,VZSubLogger *>,std::hash<char const*>,std::equal_to<char const*>,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,VZSubLogger *>,std::equal_to<char const*>,std::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,VZSubLogger *>>>::__emplace_unique_key_args<char const*,std::piecewise_construct_t const&,std::tuple<char const*&&>,std::tuple<>>((uint64_t)&self->_vlSubloggerMap, &v10, (uint64_t)&std::piecewise_construct, &v11)[3])
    {
      char v7 = VZSubLoggerEnabled();
    }
    else
    {
      [v6 UTF8String];
      char v7 = VZLoggerEnabled();
    }
    BOOL v8 = v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)startLoggingToFile:(id)a3
{
  return [(SIVisualLogger *)self startLoggingToFile:a3 synchronously:0];
}

- (BOOL)startLoggingToFile:(id)a3 synchronously:(BOOL)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    if (self->_fileDestination)
    {
      id v6 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        buf[0] = 136380931;
        *(void *)&buf[1] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
        __int16 v18 = 1025;
        int v19 = 220;
        char v7 = " %{private}s:%{private}d *** Request to start file logging, but we already have a file destination. ***";
LABEL_7:
        _os_log_impl(&dword_21B697000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)buf, 0x12u);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
    id v6 = [MEMORY[0x263F08850] defaultManager];
    if ([v6 fileExistsAtPath:v5])
    {
      id v16 = 0;
      char v8 = [v6 removeItemAtPath:v5 error:&v16];
      id v9 = v16;
      id v10 = v9;
      if ((v8 & 1) == 0)
      {
        __int16 v13 = __SceneIntelligenceLogSharedInstance();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          buf[0] = 136381187;
          *(void *)&buf[1] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
          __int16 v18 = 1025;
          int v19 = 231;
          __int16 v20 = 2113;
          id v21 = v10;
          _os_log_impl(&dword_21B697000, v13, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to remove item: %{private}@ ***", (uint8_t *)buf, 0x1Cu);
        }

        goto LABEL_20;
      }
    }
    id v15 = 0;
    char v11 = [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v15];
    id v10 = v15;
    if (v11)
    {
      VZFileExportOptionsCreate();
      operator new();
    }
    uint64_t v12 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      buf[0] = 136381443;
      *(void *)&buf[1] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
      __int16 v18 = 1025;
      int v19 = 240;
      __int16 v20 = 2113;
      id v21 = v5;
      __int16 v22 = 2113;
      id v23 = v10;
      _os_log_impl(&dword_21B697000, v12, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create visual logger directory \"%{private}@\". Error: %{private}@ ***", (uint8_t *)buf, 0x26u);
    }

LABEL_20:
    goto LABEL_21;
  }
  id v6 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    buf[0] = 136380931;
    *(void *)&buf[1] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
    __int16 v18 = 1025;
    int v19 = 215;
    char v7 = " %{private}s:%{private}d *** Must have a non-nil logPath ***";
    goto LABEL_7;
  }
LABEL_21:

  return 0;
}

- (BOOL)_stopLoggingToFile
{
  if (!self->_visualLogger || !self->_fileDestination) {
    return 0;
  }
  VZLoggerRemoveDestination();
  BOOL v3 = 1;
  VZRelease();
  self->_fileDestination = 0;
  return v3;
}

- (BOOL)startLoggingToHost:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    if (!self->_networkDestination)
    {
      VZClientOptionsCreate();
      operator new();
    }
    id v5 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 136380931;
      *(void *)&v7[1] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
      __int16 v8 = 1025;
      int v9 = 310;
      _os_log_impl(&dword_21B697000, v5, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Request to start network logging, but we already have a network destination. ***", (uint8_t *)v7, 0x12u);
    }
  }
  else
  {
    id v5 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 136380931;
      *(void *)&v7[1] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIVisualLogger.mm";
      __int16 v8 = 1025;
      int v9 = 305;
      _os_log_impl(&dword_21B697000, v5, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Invalid host address ***", (uint8_t *)v7, 0x12u);
    }
  }

  return 0;
}

- (BOOL)_stopLoggingToHost
{
  if (!self->_visualLogger || !self->_networkDestination) {
    return 0;
  }
  VZLoggerRemoveDestination();
  BOOL v3 = 1;
  VZRelease();
  self->_networkDestination = 0;
  return v3;
}

- (BOOL)stopAndDisableLogging
{
  BOOL v3 = [(SIVisualLogger *)self _stopLoggingToHost];
  BOOL v4 = [(SIVisualLogger *)self _stopLoggingToFile];
  [(SIVisualLogger *)self _disableAllLogs];
  return v4 || v3;
}

- (Ref<const)createDataInfoAt:(double)a3 name:(id)a4
{
}

- (BOOL)logPixelBuffer:(__CVBuffer *)a3 at:(double)a4 sublogger:(id)a5 name:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if ([(SIVisualLogger *)self isLoggerEnabled:v9])
  {
    [(SIVisualLogger *)self createDataInfoAt:v10 name:a4];
    VZDataCreateImageWithCVPixelBuffer();
    operator new();
  }

  return 0;
}

- (BOOL)logIOSurface:(__IOSurface *)a3 at:(double)a4 sublogger:(id)a5 name:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if ([(SIVisualLogger *)self isLoggerEnabled:v9])
  {
    [(SIVisualLogger *)self createDataInfoAt:v10 name:a4];
    VZDataCreateImageWithIOSurface();
    operator new();
  }

  return 0;
}

- (BOOL)logDictionary:(id)a3 at:(double)a4 sublogger:(id)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([(SIVisualLogger *)self isLoggerEnabled:v11])
  {
    [(SIVisualLogger *)self createDataInfoAt:v12 name:a4];
    VZDataCreateDictionaryWithCFDictionary();
    operator new();
  }

  return 0;
}

- (BOOL)logBinaryData:(id)a3 at:(double)a4 sublogger:(id)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([(SIVisualLogger *)self isLoggerEnabled:v11])
  {
    [(SIVisualLogger *)self createDataInfoAt:v12 name:a4];
    VZDataCreateBlobWithCFData();
    operator new();
  }

  return 0;
}

- (id)_arrayOfNumbersToData:(id)a3 valueType:(unint64_t *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (v5 && [v5 count])
  {
    char v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithCapacity:", 8 * objc_msgSend(v6, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v15 = 0;
          [v12 doubleValue];
          uint64_t v15 = v13;
          [v7 appendBytes:&v15 length:8];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    *a4 = *MEMORY[0x263F84C88];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)logNumbers:(id)a3 at:(double)a4 sublogger:(id)a5 name:(id)a6
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (-[SIVisualLogger isLoggerEnabled:](self, "isLoggerEnabled:", v11) && [v10 count])
  {
    [(SIVisualLogger *)self createDataInfoAt:v12 name:a4];
    uint64_t v14 = *MEMORY[0x263F84C90];
    [(SIVisualLogger *)self _arrayOfNumbersToData:v10 valueType:&v14];
    objc_claimAutoreleasedReturnValue();
    VZDataCreateNumbersWithCFData();
    operator new();
  }

  return 0;
}

- (BOOL)logNumber:(id)a3 at:(double)a4 sublogger:(id)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([(SIVisualLogger *)self isLoggerEnabled:v11])
  {
    [(SIVisualLogger *)self createDataInfoAt:v12 name:a4];
    VZDataCreateNumberWithCFNumber();
    operator new();
  }

  return 0;
}

- (VZLogger)internalVisualLoggerRef
{
  return self->_visualLogger;
}

- (NSSet)registeredSubloggers
{
  return self->_registeredSubloggers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredSubloggers, 0);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&self->_vlSubloggerMap);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_DWORD *)self + 16) = 1065353216;
  return self;
}

@end