@interface ExtractionServiceInfo
+ (id)extractionServiceInfoForPluginBundlePath:(id)a3;
- (ExtractionServiceInfo)initWithPluginBundlePath:(id)a3;
- (ExtractionServiceInfo)initWithUUID:(id)a3 pluginBundlePath:(id)a4;
- (NSString)pluginBundlePath;
- (NSUUID)uuid;
- (_opaque_pthread_cond_t)availableExtractionServiceMemoryCondition;
- (_opaque_pthread_mutex_t)availableExtractionServiceMemoryMutex;
- (id)reserveExtractionMemory:(id)a3;
- (unint64_t)availableExtractionServiceMemory;
- (void)dealloc;
- (void)extractionBecameInvalid;
- (void)releaseExtractionMemory:(id)a3;
- (void)setAvailableExtractionServiceMemory:(unint64_t)a3;
@end

@implementation ExtractionServiceInfo

+ (id)extractionServiceInfoForPluginBundlePath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = a1;
    objc_sync_enter(v5);
    v6 = (void *)_sExtractionServiceDict;
    if (_sExtractionServiceDict
      || ([MEMORY[0x263EFF9A0] dictionaryWithCapacity:1],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          v8 = (void *)_sExtractionServiceDict,
          _sExtractionServiceDict = v7,
          v8,
          (v6 = (void *)_sExtractionServiceDict) != 0))
    {
      v9 = [v6 objectForKey:v4];
      if (!v9)
      {
        v9 = [[ExtractionServiceInfo alloc] initWithPluginBundlePath:v4];
        if (v9) {
          [(id)_sExtractionServiceDict setValue:v9 forKey:v4];
        }
      }
    }
    else
    {
      v11 = STGetLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[ExtractionServiceInfo extractionServiceInfoForPluginBundlePath:]();
      }

      v9 = 0;
    }
    objc_sync_exit(v5);
  }
  else
  {
    v5 = STGetLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[ExtractionServiceInfo extractionServiceInfoForPluginBundlePath:]();
    }
    v9 = 0;
  }

  return v9;
}

- (ExtractionServiceInfo)initWithPluginBundlePath:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08C38];
  id v5 = a3;
  v6 = [v4 UUID];
  uint64_t v7 = [(ExtractionServiceInfo *)self initWithUUID:v6 pluginBundlePath:v5];

  return v7;
}

- (ExtractionServiceInfo)initWithUUID:(id)a3 pluginBundlePath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v13 = STGetLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ExtractionServiceInfo initWithUUID:pluginBundlePath:]();
    }
    goto LABEL_10;
  }
  if (!v8)
  {
    v13 = STGetLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ExtractionServiceInfo initWithUUID:pluginBundlePath:]();
    }
LABEL_10:

LABEL_13:
    v11 = 0;
    goto LABEL_5;
  }
  v14.receiver = self;
  v14.super_class = (Class)ExtractionServiceInfo;
  v10 = [(ExtractionServiceInfo *)&v14 init];
  if (!v10)
  {
    STGetLogHandle();
    self = (ExtractionServiceInfo *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_ERROR)) {
      -[ExtractionServiceInfo initWithUUID:pluginBundlePath:]();
    }
    goto LABEL_13;
  }
  v11 = v10;
  objc_storeStrong((id *)&v10->_uuid, a3);
  objc_storeStrong((id *)&v11->_pluginBundlePath, a4);
  v11->_availableExtractionServiceMemory = 52428800;
  pthread_mutex_init(&v11->_availableExtractionServiceMemoryMutex, 0);
  pthread_cond_init(&v11->_availableExtractionServiceMemoryCondition, 0);
LABEL_5:

  return v11;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_availableExtractionServiceMemoryMutex);
  pthread_cond_destroy(&self->_availableExtractionServiceMemoryCondition);
  v3.receiver = self;
  v3.super_class = (Class)ExtractionServiceInfo;
  [(ExtractionServiceInfo *)&v3 dealloc];
}

- (id)reserveExtractionMemory:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 requiredExtractionMemory];
  if (v5)
  {
    unint64_t v6 = v5;
    id v7 = STGetLogHandle();
    id v8 = v7;
    if (v6 >= 0x3200001)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ExtractionServiceInfo reserveExtractionMemory:]();
      }

      v23 = STExtractorErrorDomain;
      v24 = objc_msgSend(NSString, "stringWithFormat:", @"num required bytes (%zu) > max allowed extraction memory (%d)", v6, 52428800);
      id v25 = STCreateError(v23, 11, v24, 0, (uint64_t)"-[ExtractionServiceInfo reserveExtractionMemory:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 1351);

      v17 = 0;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v27 = "-[ExtractionServiceInfo reserveExtractionMemory:]";
        __int16 v28 = 2048;
        unint64_t v29 = v6;
        _os_log_impl(&dword_21FAFD000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: %zu bytes", buf, 0x16u);
      }

      pthread_mutex_lock(&self->_availableExtractionServiceMemoryMutex);
      if (v6 <= [v4 reservedExtractionMemory])
      {
        v17 = 0;
      }
      else
      {
        unint64_t v9 = v6 - [v4 reservedExtractionMemory];
        while (self->_availableExtractionServiceMemory < v9)
        {
          if ([v4 isInvalid]) {
            break;
          }
          v10 = STGetLogHandle();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t availableExtractionServiceMemory = self->_availableExtractionServiceMemory;
            *(_DWORD *)buf = 136446722;
            v27 = "-[ExtractionServiceInfo reserveExtractionMemory:]";
            __int16 v28 = 2048;
            unint64_t v29 = v9;
            __int16 v30 = 2048;
            unint64_t v31 = availableExtractionServiceMemory;
            _os_log_impl(&dword_21FAFD000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s: waiting for available extraction memory (need [%zu] - avail [%zu])", buf, 0x20u);
          }

          pthread_cond_wait(&self->_availableExtractionServiceMemoryCondition, &self->_availableExtractionServiceMemoryMutex);
          v12 = STGetLogHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v13 = self->_availableExtractionServiceMemory;
            int v14 = [v4 isInvalid];
            *(_DWORD *)buf = 136446978;
            v27 = "-[ExtractionServiceInfo reserveExtractionMemory:]";
            __int16 v28 = 2048;
            unint64_t v29 = v9;
            __int16 v30 = 2048;
            unint64_t v31 = v13;
            __int16 v32 = 1024;
            int v33 = v14 ^ 1;
            _os_log_impl(&dword_21FAFD000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: available memory notification (need [%zu] - avail [%zu] - isValid [%d]", buf, 0x26u);
          }
        }
        if ([v4 isInvalid])
        {
          v15 = STExtractorErrorDomain;
          v16 = [NSString stringWithFormat:@"STRemoteExtractor became invalid while waiting for extraction memory reservation"];
          v17 = STCreateError(v15, 11, v16, 0, (uint64_t)"-[ExtractionServiceInfo reserveExtractionMemory:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 1374);
        }
        else
        {
          self->_availableExtractionServiceMemory -= v9;
          objc_msgSend(v4, "setReservedExtractionMemory:", objc_msgSend(v4, "reservedExtractionMemory") + v9);
          v16 = STGetLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v18 = self->_availableExtractionServiceMemory;
            *(_DWORD *)buf = 136446722;
            v27 = "-[ExtractionServiceInfo reserveExtractionMemory:]";
            __int16 v28 = 2048;
            unint64_t v29 = v6;
            __int16 v30 = 2048;
            unint64_t v31 = v18;
            _os_log_impl(&dword_21FAFD000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s: Got extraction memory reservation [%zu] - %zu bytes still available", buf, 0x20u);
          }
          v17 = 0;
        }
      }
      pthread_mutex_unlock(&self->_availableExtractionServiceMemoryMutex);
    }
  }
  else
  {
    v20 = STGetLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[ExtractionServiceInfo reserveExtractionMemory:]();
    }

    v21 = STExtractorErrorDomain;
    v22 = [NSString stringWithFormat:@"required extraction memory == 0"];
    v17 = STCreateError(v21, 11, v22, 0, (uint64_t)"-[ExtractionServiceInfo reserveExtractionMemory:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 1350);
  }
  return v17;
}

- (void)releaseExtractionMemory:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  pthread_mutex_lock(&self->_availableExtractionServiceMemoryMutex);
  if ([v4 reservedExtractionMemory])
  {
    uint64_t v5 = [v4 reservedExtractionMemory];
    self->_availableExtractionServiceMemory += v5;
    [v4 setReservedExtractionMemory:0];
    unint64_t v6 = STGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t availableExtractionServiceMemory = self->_availableExtractionServiceMemory;
      int v8 = 136446722;
      unint64_t v9 = "-[ExtractionServiceInfo releaseExtractionMemory:]";
      __int16 v10 = 2048;
      uint64_t v11 = v5;
      __int16 v12 = 2048;
      unint64_t v13 = availableExtractionServiceMemory;
      _os_log_impl(&dword_21FAFD000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: Releasing extraction memory reservation [%zu] - %zu bytes available", (uint8_t *)&v8, 0x20u);
    }

    pthread_cond_signal(&self->_availableExtractionServiceMemoryCondition);
  }
  pthread_mutex_unlock(&self->_availableExtractionServiceMemoryMutex);
}

- (void)extractionBecameInvalid
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_super v3 = STGetLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    uint64_t v5 = "-[ExtractionServiceInfo extractionBecameInvalid]";
    _os_log_impl(&dword_21FAFD000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: Extraction invalid - signaling to allow possible thread waiting for extraction memory to return", (uint8_t *)&v4, 0xCu);
  }

  pthread_cond_broadcast(&self->_availableExtractionServiceMemoryCondition);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)pluginBundlePath
{
  return self->_pluginBundlePath;
}

- (unint64_t)availableExtractionServiceMemory
{
  return self->_availableExtractionServiceMemory;
}

- (void)setAvailableExtractionServiceMemory:(unint64_t)a3
{
  self->_unint64_t availableExtractionServiceMemory = a3;
}

- (_opaque_pthread_mutex_t)availableExtractionServiceMemoryMutex
{
  long long v3 = *(_OWORD *)&self[1].__opaque[24];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[1].__opaque[8];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  long long v4 = *(_OWORD *)&self[2].__sig;
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__opaque[40];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (_opaque_pthread_cond_t)availableExtractionServiceMemoryCondition
{
  long long v3 = *(_OWORD *)&self[1].__sig;
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self->__opaque[24];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__opaque[8];
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginBundlePath, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (void)extractionServiceInfoForPluginBundlePath:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

+ (void)extractionServiceInfoForPluginBundlePath:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)initWithUUID:pluginBundlePath:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)initWithUUID:pluginBundlePath:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)initWithUUID:pluginBundlePath:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)reserveExtractionMemory:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)reserveExtractionMemory:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

@end