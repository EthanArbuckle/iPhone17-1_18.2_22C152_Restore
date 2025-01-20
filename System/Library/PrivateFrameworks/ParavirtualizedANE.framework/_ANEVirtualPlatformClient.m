@interface _ANEVirtualPlatformClient
+ (BOOL)createLastModificationTimeStampFile:(id)a3 fileName:(id)a4 timeSince1970:(double)a5;
+ (BOOL)isFileModificationTimeStampSame:(id)a3 timeSince1970:(double)a4;
+ (BOOL)isValidBufferSize:(unint64_t)a3;
+ (BOOL)needToSaveFile:(id)a3 fileName:(id)a4 timeSince1970:(double)a5;
+ (__CFDictionary)prepareValidationResultForSerialization:(__CFDictionary *)a3;
+ (char)dictionaryGetInt8ForKey:(__CFDictionary *)a3 key:(__CFString *)a4;
+ (const)dictionaryGetDataBytesForKey:(__CFDictionary *)a3 key:(__CFString *)a4;
+ (id)getCodeSigningIdentity:(__CFDictionary *)a3;
+ (id)new;
+ (id)sharedConnection;
+ (id)sharedConnection:(id)a3;
+ (unint64_t)dictionaryGetUInt64ForKey:(__CFDictionary *)a3 key:(__CFString *)a4;
+ (unint64_t)getCommandInputSize:(unint64_t)a3;
+ (unint64_t)getCommandOutputSize:(unint64_t)a3;
+ (void)initialize;
+ (void)printStruct:(VirtANEModel *)a3;
- (BOOL)avpSaveRestoreSupported;
- (BOOL)createModelFile:(id)a3 path:(id)a4 ioSID:(unsigned int)a5 length:(unint64_t)AllocSize;
- (NSMutableDictionary)aneModelDict;
- (NSString)anebaseDirectory;
- (NSString)guestBuildVersion;
- (OS_dispatch_queue)queue;
- (_ANEClient)aneClient;
- (__IOSurface)getIOSurface:(unint64_t)a3;
- (id)constructANEModel:(__CFDictionary *)a3 modelDirectory:(id)a4;
- (id)createANEModelInstanceParameters:(__CFDictionary *)a3 modelUUID:(id)a4;
- (id)createAllModelFilesOnHost:(__CFDictionary *)a3;
- (id)doCreateModelFile:(VirtANEModel *)a3 aneModelKey:(id)a4;
- (id)getANEModelKey:(__CFDictionary *)a3 caller:(id)a4;
- (id)getObjectFromIOSurfaceID:(unsigned int)a3 classType:(Class)a4 length:(unint64_t)AllocSize;
- (id)getOptionsFromDictionary:(__CFDictionary *)a3;
- (id)init:(id)a3;
- (id)objectWithIOSurfaceID:(unsigned int)a3;
- (id)removeAllModelFiles:(id)a3;
- (id)requestWithVirtualANEModel:(VirtANEModel *)a3;
- (id)requestWithVirtualANEModelDictionary:(__CFDictionary *)a3;
- (id)updateOptions:(id)a3 virtualANEModel:(VirtANEModel *)a4;
- (id)updateOptionsDictionary:(id)a3 directoryPath:(id)a4;
- (unint64_t)negotiatedCapabilityMask;
- (unsigned)getQueueCount;
- (unsigned)negotiatedDataInterfaceVersion;
- (void)asyncAvpHoldMessageReceived:(AppleVirtIONeuralEngineCFData *)a3;
- (void)beginRealTimeTask:(VirtANEModel *)a3;
- (void)callCFDictionaryMethod:(AppleVirtIONeuralEngineCFData *)a3;
- (void)compileModel:(VirtANEModel *)a3;
- (void)compileModelDictionary:(__CFDictionary *)a3;
- (void)compiledModelExistsFor:(VirtANEModel *)a3;
- (void)compiledModelExistsForDictionary:(__CFDictionary *)a3;
- (void)compiledModelExistsMatchingHash:(VirtANEModel *)a3;
- (void)compiledModelExistsMatchingHashDictionary:(__CFDictionary *)a3;
- (void)copyBytesToIOSurface:(char *)a3 dataLength:(unsigned int)a4 ioSID:(unsigned int)a5;
- (void)copyToIOSurface:(id)a3 ioSID:(unsigned int)a4;
- (void)createOptionFilesForCompilation:(VirtANEModel *)a3 aneModelKey:(id)a4 options:(id)a5;
- (void)createOptionFilesForCompilationDictionary:(__CFDictionary *)a3 aneModelKey:(id)a4 options:(id)a5 modelDirectory:(id)a6;
- (void)dealloc;
- (void)doModelAttributeUpdate:(id)a3 virtualANEModel:(VirtANEModel *)a4;
- (void)doModelAttributeUpdateDictionary:(id)a3 dictionary:(__CFDictionary *)a4;
- (void)doRemoveModelFile:(VirtANEModel *)a3;
- (void)echo:(VirtANEModel *)a3;
- (void)echoDictionary:(__CFDictionary *)a3;
- (void)endRealTimeTask:(VirtANEModel *)a3;
- (void)evaluateWithModel:(VirtANEModel *)a3;
- (void)evaluateWithModelDictionary:(__CFDictionary *)a3;
- (void)exchangeBuildVersionInfo:(BuildVersionInfo *)a3;
- (void)getArrayFromIOSurfaceID:(unsigned int)a3 localData:(unsigned int *)a4 localDataLength:(unint64_t)a5;
- (void)getBytesFromIOSurfaceID:(unsigned int)a3 dest:(char *)a4 dataLength:(unint64_t)a5;
- (void)getDeviceInfo:(DeviceInfo *)a3;
- (void)getDeviceInfoDictionary:(__CFDictionary *)a3;
- (void)loadModel:(VirtANEModel *)a3;
- (void)loadModelDictionary:(__CFDictionary *)a3;
- (void)loadModelNewInstanceDictionary:(__CFDictionary *)a3;
- (void)mapIOSurfacesWithModel:(VirtANEModel *)a3;
- (void)modelAction:(unsigned __int16)a3 buffer:(void *)a4 bufferSize:(unint64_t)a5;
- (void)printIOSurfaceDataInBytes:(unsigned int)a3;
- (void)purgeCompiledModel:(VirtANEModel *)a3;
- (void)purgeCompiledModelDictionary:(__CFDictionary *)a3;
- (void)purgeCompiledModelMatchingHash:(VirtANEModel *)a3;
- (void)purgeCompiledModelMatchingHashDictionary:(__CFDictionary *)a3;
- (void)setAvpSaveRestoreSupported:(BOOL)a3;
- (void)setGuestBuildVersion:(id)a3;
- (void)setNegotiatedCapabilityMask:(unint64_t)a3;
- (void)setNegotiatedDataInterfaceVersion:(unsigned int)a3;
- (void)storeGuestBuildVersion:(BuildVersionInfoLegacy *)a3;
- (void)unLoadModel:(VirtANEModel *)a3;
- (void)unLoadModelDictionary:(__CFDictionary *)a3;
- (void)updateErrorValue:(VirtANEModel *)a3 error:(id)a4;
- (void)updateErrorValueDictionary:(__CFDictionary *)a3 error:(id)a4;
- (void)updatePerformanceStats:(VirtANEModel *)a3 aneRequest:(id)a4;
- (void)updatePerformanceStatsDictionary:(__CFDictionary *)a3 aneRequest:(id)a4;
- (void)updateVirtualANEModel:(VirtANEModel *)a3 model:(id)a4;
- (void)updateVirtualANEModelDictionary:(__CFDictionary *)a3 model:(id)a4 cacheURLIdentifierToGuest:(BOOL)a5;
- (void)validateNetworkCreate:(__CFDictionary *)a3;
@end

@implementation _ANEVirtualPlatformClient

+ (void)initialize
{
  gLogger = (uint64_t)os_log_create("com.apple.ane", "ANEVirtualPlatformClient");
  MEMORY[0x270F9A758]();
}

+ (id)new
{
  return 0;
}

+ (id)sharedConnection
{
  return +[_ANEVirtualPlatformClient sharedConnection:0];
}

+ (id)sharedConnection:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46___ANEVirtualPlatformClient_sharedConnection___block_invoke;
  v9[3] = &unk_265437410;
  id v10 = v4;
  SEL v11 = a2;
  uint64_t v5 = +[_ANEVirtualPlatformClient sharedConnection:]::onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&+[_ANEVirtualPlatformClient sharedConnection:]::onceToken, v9);
  }
  id v7 = (id)+[_ANEVirtualPlatformClient sharedConnection:]::client;

  return v7;
}

- (id)init:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)_ANEVirtualPlatformClient;
  uint64_t v5 = [(_ANEVirtualPlatformClient *)&v40 init];
  if (!v5)
  {
LABEL_28:
    v31 = v5;
    goto LABEL_29;
  }
  uint64_t v6 = objc_opt_new();
  aneModelDict = v5->_aneModelDict;
  v5->_aneModelDict = (NSMutableDictionary *)v6;

  uint64_t v8 = [MEMORY[0x263F28038] sharedConnection];
  aneClient = v5->_aneClient;
  v5->_aneClient = (_ANEClient *)v8;

  dispatch_queue_t v10 = dispatch_queue_create("com.apple.avp.ane", 0);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v10;

  v12 = [MEMORY[0x263F08850] defaultManager];
  confstr(65538, v41, 0x400uLL);
  if (v4)
  {
    v13 = [v4 dataUsingEncoding:4];
    uint64_t v14 = [[NSString alloc] initWithFormat:@"%@/com.apple.appleneuralengine", v4, a2];
  }
  else
  {
    v13 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v41 length:1024];
    uint64_t v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s/com.apple.appleneuralengine", v41, a2);
  }
  anebaseDirectory = v5->_anebaseDirectory;
  v5->_anebaseDirectory = (NSString *)v14;

  p_anebaseDirectory = (uint64_t *)&v5->_anebaseDirectory;
  if (([v12 fileExistsAtPath:v5->_anebaseDirectory] & 1) != 0
    || (uint64_t v17 = *p_anebaseDirectory,
        id v39 = 0,
        [v12 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v39],
        (id v18 = v39) == 0))
  {
    v20 = [[NSString alloc] initWithFormat:@"%@/test1", *p_anebaseDirectory];
    id v38 = 0;
    [v13 writeToFile:v20 options:1 error:&v38];
    id v19 = v38;
    BOOL v21 = v19 == 0;
    if (!v19) {
      goto LABEL_14;
    }
    v22 = (id)gLogger;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelectora);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient init:].cold.4();
    }
  }
  else
  {
    id v19 = v18;
    v20 = (id)gLogger;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelectora);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient init:].cold.5();
    }
  }
  BOOL v21 = 0;
LABEL_14:

  if (v4 != 0 || v21)
  {
LABEL_25:
    v32 = (id)gLogger;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelectora);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient init:]();
    }

    goto LABEL_28;
  }
  uint64_t v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s/com.apple.virtualization.juniper/com.apple.appleneuralengine", v41);
  v24 = (void *)*p_anebaseDirectory;
  uint64_t *p_anebaseDirectory = v23;

  if (([v12 fileExistsAtPath:*p_anebaseDirectory] & 1) != 0
    || (uint64_t v25 = *p_anebaseDirectory,
        id v37 = 0,
        [v12 createDirectoryAtPath:v25 withIntermediateDirectories:1 attributes:0 error:&v37],
        (id v26 = v37) == 0))
  {
    v28 = [[NSString alloc] initWithFormat:@"%@/test1", *p_anebaseDirectory];
    id v36 = 0;
    [v13 writeToFile:v28 options:1 error:&v36];
    id v29 = v36;
    if (v29)
    {
      v27 = v29;
      v30 = (id)gLogger;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelectora);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient init:]();
      }

      goto LABEL_23;
    }

    goto LABEL_25;
  }
  v27 = v26;
  v28 = (id)gLogger;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(aSelectora);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient init:]();
  }
LABEL_23:

  v31 = 0;
LABEL_29:

  return v31;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_ANEVirtualPlatformClient;
  [(_ANEVirtualPlatformClient *)&v2 dealloc];
}

+ (BOOL)isValidBufferSize:(unint64_t)a3
{
  int64x2_t v3 = vdupq_n_s64(a3);
  return vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_258736E90), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_258736EA0)))) & 1 | (a3 == 2624) | (a3 == 288);
}

- (void)modelAction:(unsigned __int16)a3 buffer:(void *)a4 bufferSize:(unint64_t)a5
{
  dispatch_queue_t v10 = [(_ANEVirtualPlatformClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59___ANEVirtualPlatformClient_modelAction_buffer_bufferSize___block_invoke;
  block[3] = &unk_265437438;
  block[6] = a2;
  block[7] = a5;
  unsigned __int16 v12 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_sync(v10, block);
}

+ (unint64_t)getCommandInputSize:(unint64_t)a3
{
  if (a3 >= 0xF)
  {
    uint64_t v5 = (id)gLogger;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      +[_ANEVirtualPlatformClient getCommandInputSize:]();
    }

    unint64_t v4 = 2640;
  }
  else
  {
    unint64_t v4 = *(void *)&aP[8 * a3];
  }
  uint64_t v6 = (id)gLogger;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    +[_ANEVirtualPlatformClient getCommandInputSize:]();
  }

  return v4;
}

+ (unint64_t)getCommandOutputSize:(unint64_t)a3
{
  return +[_ANEVirtualPlatformClient getCommandInputSize:a3];
}

- (id)getANEModelKey:(__CFDictionary *)a3 caller:(id)a4
{
  id v7 = a4;
  if (CFDictionaryContainsKey(a3, @"keyLength"))
  {
    if (CFDictionaryContainsKey(a3, @"ioSIDKey"))
    {
      unint64_t v8 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"keyLength"];
      unint64_t v9 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"ioSIDKey"];
      if (v8)
      {
        if (v9)
        {
          dispatch_queue_t v10 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:v9 classType:objc_opt_class() length:v8];
          goto LABEL_10;
        }
        SEL v11 = (id)gLogger;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualPlatformClient getANEModelKey:caller:]();
        }
      }
    }
  }
  dispatch_queue_t v10 = &stru_2706C0ED8;
LABEL_10:

  return v10;
}

- (void)compileModel:(VirtANEModel *)a3
{
  uint64_t v5 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a3->var5 classType:objc_opt_class() length:a3->var9];
  uint64_t v6 = [(_ANEVirtualPlatformClient *)self doCreateModelFile:a3 aneModelKey:v5];
  id v7 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a3->var23 classType:objc_opt_class() length:a3->var24];
  [(_ANEVirtualPlatformClient *)self createOptionFilesForCompilation:a3 aneModelKey:v5 options:v7];
  [(_ANEVirtualPlatformClient *)self doModelAttributeUpdate:v6 virtualANEModel:a3];
  aneClient = self->_aneClient;
  uint64_t var22 = a3->var22;
  id v12 = 0;
  unsigned int v10 = [(_ANEClient *)aneClient compileModel:v6 options:v7 qos:var22 error:&v12];
  id v11 = v12;
  a3->var1 = v10;
  [(_ANEVirtualPlatformClient *)self updateErrorValue:a3 error:v11];
  [(_ANEVirtualPlatformClient *)self updateVirtualANEModel:a3 model:v6];
}

+ (const)dictionaryGetDataBytesForKey:(__CFDictionary *)a3 key:(__CFString *)a4
{
  result = (const char *)CFDictionaryGetValue(a3, a4);
  if (result)
  {
    return (const char *)CFDataGetBytePtr((CFDataRef)result);
  }
  return result;
}

+ (unint64_t)dictionaryGetUInt64ForKey:(__CFDictionary *)a3 key:(__CFString *)a4
{
  unint64_t result = (unint64_t)CFDictionaryGetValue(a3, a4);
  unint64_t valuePtr = 0;
  if (result)
  {
    CFNumberGetValue((CFNumberRef)result, kCFNumberSInt64Type, &valuePtr);
    return valuePtr;
  }
  return result;
}

+ (char)dictionaryGetInt8ForKey:(__CFDictionary *)a3 key:(__CFString *)a4
{
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a3, a4);
  char valuePtr = 0;
  if (!Value) {
    return 0;
  }
  CFNumberGetValue(Value, kCFNumberSInt8Type, &valuePtr);
  return valuePtr;
}

- (id)getOptionsFromDictionary:(__CFDictionary *)a3
{
  uint64_t v6 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"optionsLength"];
  if (v6)
  {
    unint64_t v7 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"ioSIDOptions"];
    if (v7)
    {
      unint64_t v8 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:v7 classType:objc_opt_class() length:v6];
      goto LABEL_10;
    }
    unint64_t v9 = (id)gLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient getOptionsFromDictionary:]();
    }
  }
  else
  {
    unint64_t v9 = (id)gLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient getOptionsFromDictionary:]();
    }
  }

  unint64_t v8 = 0;
LABEL_10:
  return v8;
}

- (id)constructANEModel:(__CFDictionary *)a3 modelDirectory:(id)a4
{
  id v7 = a4;
  unint64_t v8 = NSStringFromSelector(a2);
  unint64_t v9 = [(_ANEVirtualPlatformClient *)self getANEModelKey:a3 caller:v8];

  if (CFDictionaryContainsKey(a3, @"modelCacheURLIdentifier")
    && (CFNumberRef Value = (void *)CFDictionaryGetValue(a3, @"modelCacheURLIdentifier")) != 0)
  {
    id v11 = Value;
    id v12 = (id)gLogger;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient constructANEModel:modelDirectory:].cold.5();
    }
  }
  else
  {
    id v11 = 0;
  }
  if (CFDictionaryContainsKey(a3, @"modelCacheURLIdentifierSource"))
  {
    unint64_t v13 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"modelCacheURLIdentifierSource"];
    uint64_t v14 = (id)gLogger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient constructANEModel:modelDirectory:].cold.4();
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  if (!CFDictionaryContainsKey(a3, @"sourceURLPathLength")) {
    goto LABEL_21;
  }
  unint64_t v15 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"sourceURLPathLength"];
  v16 = (id)gLogger;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient constructANEModel:modelDirectory:]();
  }

  if (v15
    && CFDictionaryContainsKey(a3, @"ioSIDModelSourceURLPath")
    && (unint64_t v17 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"ioSIDModelSourceURLPath"]) != 0)
  {
    id v18 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:v17 classType:objc_opt_class() length:v15];
    id v19 = (id)gLogger;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient constructANEModel:modelDirectory:]();
    }
  }
  else
  {
LABEL_21:
    id v18 = 0;
  }
  v20 = (void *)MEMORY[0x263F28068];
  if (v7)
  {
    BOOL v21 = (void *)[objc_alloc(NSURL) initWithString:v7];
    if (v18)
    {
LABEL_24:
      v22 = (void *)[objc_alloc(NSURL) initWithString:v18];
      goto LABEL_27;
    }
  }
  else
  {
    BOOL v21 = 0;
    if (v18) {
      goto LABEL_24;
    }
  }
  v22 = 0;
LABEL_27:
  uint64_t v23 = [v20 modelAtURLWithSourceURL:v21 sourceURL:v22 key:v9 identifierSource:v13 cacheURLIdentifier:v11];
  if (v18) {

  }
  if (v7) {
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
  }
    -[_ANEVirtualPlatformClient constructANEModel:modelDirectory:]();

  return v23;
}

- (void)compileModelDictionary:(__CFDictionary *)a3
{
  valuePtr[5] = *MEMORY[0x263EF8340];
  uint64_t v6 = -[_ANEVirtualPlatformClient createAllModelFilesOnHost:](self, "createAllModelFilesOnHost:");
  id v7 = (id)gLogger;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient compileModelDictionary:]();
  }

  unint64_t v8 = [(_ANEVirtualPlatformClient *)self constructANEModel:a3 modelDirectory:v6];
  unint64_t v9 = [v8 getCacheURLIdentifier];

  uint64_t v10 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"optionsLength"];
  if (!v10)
  {
    id v12 = (id)gLogger;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient getOptionsFromDictionary:]();
    }
    goto LABEL_10;
  }
  unint64_t v11 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"ioSIDOptions"];
  if (!v11)
  {
    id v12 = (id)gLogger;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient getOptionsFromDictionary:]();
    }
LABEL_10:
    id v16 = 0;
    goto LABEL_11;
  }
  id v12 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:v11 classType:objc_opt_class() length:v10];
  [(_ANEVirtualPlatformClient *)self doModelAttributeUpdateDictionary:v8 dictionary:a3];
  unint64_t v13 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"qos"];
  aneClient = self->_aneClient;
  id v18 = 0;
  unsigned int v15 = [(_ANEClient *)aneClient compileModel:v8 options:v12 qos:v13 error:&v18];
  id v16 = v18;
  valuePtr[0] = v15;
  CFDictionaryRemoveValue(a3, @"success");
  CFNumberRef v17 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, valuePtr);
  CFDictionarySetValue(a3, @"success", v17);
  CFRelease(v17);
  [(_ANEVirtualPlatformClient *)self updateErrorValueDictionary:a3 error:v16];
  [(_ANEVirtualPlatformClient *)self updateVirtualANEModelDictionary:a3 model:v8 cacheURLIdentifierToGuest:v9 == 0];
LABEL_11:
}

- (void)loadModel:(VirtANEModel *)a3
{
  uint64_t v5 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a3->var5 classType:objc_opt_class() length:a3->var9];
  uint64_t v6 = [(_ANEVirtualPlatformClient *)self doCreateModelFile:a3 aneModelKey:v5];
  id v7 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a3->var23 classType:objc_opt_class() length:a3->var24];
  if (([(_ANEVirtualPlatformClient *)self negotiatedCapabilityMask] & 2) == 0)
  {
    uint64_t v8 = [(_ANEVirtualPlatformClient *)self updateOptions:v7 virtualANEModel:a3];

    id v7 = (void *)v8;
  }
  [(_ANEVirtualPlatformClient *)self createOptionFilesForCompilation:a3 aneModelKey:v5 options:v7];
  [(_ANEVirtualPlatformClient *)self doModelAttributeUpdate:v6 virtualANEModel:a3];
  aneClient = self->_aneClient;
  uint64_t var22 = a3->var22;
  id v19 = 0;
  unsigned int v11 = [(_ANEClient *)aneClient loadModel:v6 options:v7 qos:var22 error:&v19];
  id v12 = v19;
  a3->var1 = v11;
  if (v11)
  {
    aneModelDict = self->_aneModelDict;
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "programHandle"));
    unsigned int v15 = [(NSMutableDictionary *)aneModelDict objectForKeyedSubscript:v14];

    if (v15)
    {
      [v15 addCachedReference];
    }
    else
    {
      uint64_t v16 = +[_ANEVirtualModel objectWithModel:v6];
      CFNumberRef v17 = self->_aneModelDict;
      id v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "programHandle"));
      [(NSMutableDictionary *)v17 setObject:v16 forKeyedSubscript:v18];

      unsigned int v15 = (void *)v16;
    }
  }
  else
  {
    unsigned int v15 = 0;
  }
  [(_ANEVirtualPlatformClient *)self updateErrorValue:a3 error:v12];
  [(_ANEVirtualPlatformClient *)self updateVirtualANEModel:a3 model:v6];
}

- (void)loadModelDictionary:(__CFDictionary *)a3
{
  valuePtr[8] = *MEMORY[0x263EF8340];
  valuePtr[0] = 1;
  unint64_t v5 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"qos"];
  uint64_t v6 = [(_ANEVirtualPlatformClient *)self getOptionsFromDictionary:a3];
  id v7 = [(_ANEVirtualPlatformClient *)self updateOptionsDictionary:v6 directoryPath:0];

  uint64_t v8 = [(_ANEVirtualPlatformClient *)self createAllModelFilesOnHost:a3];
  unint64_t v9 = [(_ANEVirtualPlatformClient *)self constructANEModel:a3 modelDirectory:v8];
  uint64_t v10 = [v9 getCacheURLIdentifier];

  if (v9)
  {
    [(_ANEVirtualPlatformClient *)self createOptionFilesForCompilationDictionary:a3 aneModelKey:0 options:v7 modelDirectory:v8];
    [(_ANEVirtualPlatformClient *)self doModelAttributeUpdateDictionary:v9 dictionary:a3];
    aneClient = self->_aneClient;
    id v24 = 0;
    unsigned int v12 = [(_ANEClient *)aneClient loadModel:v9 options:v7 qos:v5 error:&v24];
    id v13 = v24;
    valuePtr[0] = v12;
    if (v12)
    {
      aneModelDict = self->_aneModelDict;
      unsigned int v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "programHandle"));
      uint64_t v16 = [(NSMutableDictionary *)aneModelDict objectForKeyedSubscript:v15];

      if (v16)
      {
        [v16 addCachedReference];
      }
      else
      {
        uint64_t v18 = +[_ANEVirtualModel objectWithModel:v9];
        v22 = self->_aneModelDict;
        id v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "programHandle"));
        [(NSMutableDictionary *)v22 setObject:v18 forKeyedSubscript:v19];

        uint64_t v16 = (void *)v18;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    CFNumberRef v17 = (id)gLogger;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient loadModelDictionary:]();
    }

    uint64_t v16 = 0;
    id v13 = 0;
    valuePtr[0] = 0;
  }
  CFDictionaryRemoveValue(a3, @"success");
  CFNumberRef v20 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, valuePtr);
  CFDictionarySetValue(a3, @"success", v20);
  CFRelease(v20);
  BOOL v21 = (id)gLogger;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient loadModelDictionary:]();
  }

  [(_ANEVirtualPlatformClient *)self updateErrorValueDictionary:a3 error:v13];
  [(_ANEVirtualPlatformClient *)self updateVirtualANEModelDictionary:a3 model:v9 cacheURLIdentifierToGuest:v10 == 0];
}

- (void)loadModelNewInstanceDictionary:(__CFDictionary *)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t valuePtr = 1;
  unint64_t v5 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"qos"];
  uint64_t v6 = [(_ANEVirtualPlatformClient *)self getOptionsFromDictionary:a3];
  id v7 = [(_ANEVirtualPlatformClient *)self updateOptionsDictionary:v6 directoryPath:0];

  uint64_t v8 = [v7 objectForKey:*MEMORY[0x263F28098]];

  CFNumberRef Value = (void *)CFDictionaryGetValue(a3, @"modelCacheURLIdentifier");
  uint64_t v10 = Value;
  if (Value && v8)
  {
    id v11 = Value;
    unsigned int v12 = (id)gLogger;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient loadModelNewInstanceDictionary:]();
    }

    id v13 = [MEMORY[0x263F28068] modelWithCacheURLIdentifier:v11];
    if (v13)
    {
      [(_ANEVirtualPlatformClient *)self createOptionFilesForCompilationDictionary:a3 aneModelKey:0 options:v7 modelDirectory:0];
      [(_ANEVirtualPlatformClient *)self doModelAttributeUpdateDictionary:v13 dictionary:a3];
      uint64_t v14 = [v13 getUUID];
      unsigned int v15 = [(_ANEVirtualPlatformClient *)self createANEModelInstanceParameters:a3 modelUUID:v14];

      aneClient = self->_aneClient;
      id v31 = 0;
      LODWORD(v14) = [(_ANEClient *)aneClient loadModelNewInstance:v13 options:v7 modelInstParams:v15 qos:v5 error:&v31];
      id v17 = v31;
      uint64_t valuePtr = v14;
      if (v14)
      {
        aneModelDict = self->_aneModelDict;
        id v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v13, "programHandle"));
        CFNumberRef v20 = [(NSMutableDictionary *)aneModelDict objectForKeyedSubscript:v19];

        if (v20)
        {
          [v20 addCachedReference];
        }
        else
        {
          uint64_t v24 = +[_ANEVirtualModel objectWithModel:v13];
          id v29 = self->_aneModelDict;
          uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v13, "programHandle"));
          [(NSMutableDictionary *)v29 setObject:v24 forKeyedSubscript:v25];

          CFNumberRef v20 = (void *)v24;
        }
      }
      else
      {
        CFNumberRef v20 = 0;
      }

      uint64_t v23 = v13;
      goto LABEL_18;
    }
  }
  else
  {
    BOOL v21 = (id)gLogger;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v28 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v34 = v28;
      __int16 v35 = 1024;
      BOOL v36 = v8 != 0;
      __int16 v37 = 2048;
      id v38 = v10;
      _os_log_debug_impl(&dword_258723000, v21, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient NOT FOUND BaseModelCacheURLIdentifierOptionSet=%u %p", buf, 0x1Cu);
    }
    id v11 = 0;
  }
  v22 = (id)gLogger;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient loadModelNewInstanceDictionary:]();
  }

  uint64_t v23 = 0;
  id v17 = 0;
  uint64_t valuePtr = 0;
LABEL_18:
  CFDictionaryRemoveValue(a3, @"success");
  CFNumberRef v26 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  CFDictionarySetValue(a3, @"success", v26);
  CFRelease(v26);
  v27 = (id)gLogger;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient loadModelDictionary:]();
  }

  [(_ANEVirtualPlatformClient *)self updateErrorValueDictionary:a3 error:v17];
  [(_ANEVirtualPlatformClient *)self updateVirtualANEModelDictionary:a3 model:v23 cacheURLIdentifierToGuest:1];
}

- (id)updateOptions:(id)a3 virtualANEModel:(VirtANEModel *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v5];
  if (a4->var6)
  {
    if (a4->var7)
    {
      if (a4->var8)
      {
        id v7 = (void *)MEMORY[0x263F280B0];
        uint64_t v8 = [v5 objectForKeyedSubscript:*MEMORY[0x263F280B0]];
        int v9 = [v8 isEqualToString:*MEMORY[0x263F280A8]];

        if (v9) {
          [v6 removeObjectForKey:*v7];
        }
      }
    }
  }

  return v6;
}

- (id)updateOptionsDictionary:(id)a3 directoryPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v24 = v5;
  id v23 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v5];
  if (v6)
  {
    id v22 = v6;
    BOOL v21 = [MEMORY[0x263F08850] defaultManager];
    id v7 = [v21 enumeratorAtPath:v6];
    char v8 = 0;
    char v9 = 0;
    char v10 = 0;
    for (i = 0; ; i = v12)
    {
      unsigned int v12 = [v7 nextObject];

      if (!v12) {
        break;
      }
      id v13 = [v12 componentsSeparatedByString:@"."];
      uint64_t v14 = [v13 lastObject];
      if ([v14 isEqual:@"net"]) {
        char v10 = 1;
      }
      int v15 = [v14 isEqual:@"weights"];
      int v16 = [v14 isEqual:@"shape"];
      if (v15) {
        char v9 = 1;
      }
      if (v16) {
        char v8 = 1;
      }
    }
    id v6 = v22;
    if (v10 & 1) != 0 && (v8 & 1) != 0 && (v9)
    {
      id v17 = (void *)MEMORY[0x263F280B0];
      uint64_t v18 = [v24 objectForKeyedSubscript:*MEMORY[0x263F280B0]];
      int v19 = [v18 isEqualToString:*MEMORY[0x263F280A8]];

      if (v19) {
        [v23 removeObjectForKey:*v17];
      }
    }
  }

  return v23;
}

- (void)unLoadModel:(VirtANEModel *)a3
{
  v19[4] = *(id *)MEMORY[0x263EF8340];
  id v6 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a3->var5 classType:objc_opt_class() length:a3->var9];
  if (v6)
  {
    aneModelDict = self->_aneModelDict;
    char v8 = [NSNumber numberWithUnsignedLongLong:a3->var15];
    char v9 = [(NSMutableDictionary *)aneModelDict objectForKeyedSubscript:v8];

    if (!v9)
    {
      char v10 = (id)gLogger;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient unLoadModel:]();
      }

      a3->var1 = 0;
      id v11 = [(_ANEVirtualPlatformClient *)self doCreateModelFile:a3 aneModelKey:v6];
      char v9 = +[_ANEVirtualModel objectWithModel:v11];
    }
    unsigned int v12 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a3->var23 classType:objc_opt_class() length:a3->var24];
    aneClient = self->_aneClient;
    uint64_t v14 = [v9 model];
    uint64_t var22 = a3->var22;
    v19[0] = 0;
    LODWORD(aneClient) = [(_ANEClient *)aneClient unloadModel:v14 options:v12 qos:var22 error:v19];
    id v16 = v19[0];
    a3->var1 = aneClient;

    [(_ANEVirtualPlatformClient *)self updateErrorValue:a3 error:v16];
    if ([v9 removeCachedReference])
    {
      id v17 = self->_aneModelDict;
      uint64_t v18 = [NSNumber numberWithUnsignedLongLong:a3->var15];
      [(NSMutableDictionary *)v17 setObject:0 forKeyedSubscript:v18];
    }
  }
  else
  {
    a3->var1 = 0;
    char v9 = (id)gLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient unLoadModel:]();
    }
    id v16 = 0;
  }
}

- (void)unLoadModelDictionary:(__CFDictionary *)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t valuePtr = 1;
  unint64_t v6 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"programHandle"];
  if (!v6)
  {
    id v23 = (id)gLogger;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient unLoadModelDictionary:]();
    }
    goto LABEL_19;
  }
  aneModelDict = self->_aneModelDict;
  char v8 = [NSNumber numberWithUnsignedLongLong:v6];
  char v9 = [(NSMutableDictionary *)aneModelDict objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v23 = (id)gLogger;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient unLoadModelDictionary:]();
    }
LABEL_19:

    char v9 = 0;
    id v18 = 0;
    uint64_t valuePtr = 0;
    goto LABEL_20;
  }
  uint64_t v10 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"optionsLength"];
  if (!v10
    || (unint64_t v11 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"ioSIDOptions"], !v11)|| ([(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:v11 classType:objc_opt_class() length:v10], (v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v13 = (id)gLogger;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient unLoadModelDictionary:]();
    }

    unsigned int v12 = 0;
  }
  unint64_t v14 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"qos"];
  aneClient = self->_aneClient;
  id v16 = [v9 model];
  id v28 = 0;
  unsigned int v17 = [(_ANEClient *)aneClient unloadModel:v16 options:v12 qos:v14 error:&v28];
  id v18 = v28;
  uint64_t valuePtr = v17;

  int v19 = [v9 removeCachedReference];
  CFNumberRef v20 = (id)gLogger;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    CFNumberRef v26 = [v9 model];
    uint64_t v25 = [v26 programHandle];
    *(_DWORD *)buf = 138412802;
    id v31 = v27;
    __int16 v32 = 1024;
    int v33 = v19;
    __int16 v34 = 2048;
    uint64_t v35 = v25;
    _os_log_debug_impl(&dword_258723000, v20, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient removeCachedReference canBeRemoved %d for programHandle =%llx ", buf, 0x1Cu);
  }
  if ((v19 & v17) == 1)
  {
    BOOL v21 = self->_aneModelDict;
    id v22 = [NSNumber numberWithUnsignedLongLong:v6];
    [(NSMutableDictionary *)v21 setObject:0 forKeyedSubscript:v22];
  }
LABEL_20:
  CFDictionaryRemoveValue(a3, @"success");
  CFNumberRef v24 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  CFDictionarySetValue(a3, @"success", v24);
  CFRelease(v24);
  [(_ANEVirtualPlatformClient *)self updateErrorValueDictionary:a3 error:v18];
}

- (void)evaluateWithModel:(VirtANEModel *)a3
{
  v17[6] = *(id *)MEMORY[0x263EF8340];
  unint64_t v6 = (id)gLogger;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient evaluateWithModel:]();
  }

  id v7 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a3->var5 classType:objc_opt_class() length:a3->var9];
  if (v7)
  {
    aneModelDict = self->_aneModelDict;
    char v9 = [NSNumber numberWithUnsignedLongLong:a3->var15];
    uint64_t v10 = [(NSMutableDictionary *)aneModelDict objectForKeyedSubscript:v9];

    unint64_t v11 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a3->var23 classType:objc_opt_class() length:a3->var24];
    unsigned int v12 = [(_ANEVirtualPlatformClient *)self requestWithVirtualANEModel:a3];
    aneClient = self->_aneClient;
    unint64_t v14 = [v10 model];
    uint64_t var22 = a3->var22;
    v17[0] = 0;
    LODWORD(aneClient) = [(_ANEClient *)aneClient evaluateWithModel:v14 options:v11 request:v12 qos:var22 error:v17];
    id v16 = v17[0];
    a3->var1 = aneClient;

    [(_ANEVirtualPlatformClient *)self updatePerformanceStats:a3 aneRequest:v12];
    [(_ANEVirtualPlatformClient *)self updateErrorValue:a3 error:v16];
  }
  else
  {
    a3->var1 = 0;
    id v16 = (id)gLogger;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient evaluateWithModel:]();
    }
  }
}

- (void)evaluateWithModelDictionary:(__CFDictionary *)a3
{
  valuePtr[4] = *MEMORY[0x263EF8340];
  valuePtr[0] = 1;
  id v6 = -[_ANEVirtualPlatformClient createAllModelFilesOnHost:](self, "createAllModelFilesOnHost:");
  unint64_t v7 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"programHandle"];
  if (!v7)
  {
    BOOL v21 = (id)gLogger;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient evaluateWithModelDictionary:]();
    }
    goto LABEL_15;
  }
  aneModelDict = self->_aneModelDict;
  char v9 = [NSNumber numberWithUnsignedLongLong:v7];
  uint64_t v10 = [(NSMutableDictionary *)aneModelDict objectForKeyedSubscript:v9];

  if (!v10)
  {
    BOOL v21 = (id)gLogger;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient evaluateWithModelDictionary:]();
    }
LABEL_15:

    uint64_t v10 = 0;
LABEL_16:
    id v19 = 0;
    valuePtr[0] = 0;
    goto LABEL_17;
  }
  uint64_t v11 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"optionsLength"];
  if (!v11)
  {
    id v23 = (id)gLogger;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient evaluateWithModelDictionary:]();
    }
    goto LABEL_20;
  }
  unint64_t v12 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"ioSIDOptions"];
  if (!v12)
  {
    id v23 = (id)gLogger;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient evaluateWithModelDictionary:].cold.4();
    }
LABEL_20:

    goto LABEL_16;
  }
  id v13 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:v12 classType:objc_opt_class() length:v11];
  unint64_t v14 = [(_ANEVirtualPlatformClient *)self requestWithVirtualANEModelDictionary:a3];
  unint64_t v15 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"qos"];
  aneClient = self->_aneClient;
  unsigned int v17 = [v10 model];
  id v25 = 0;
  unsigned int v18 = [(_ANEClient *)aneClient evaluateWithModel:v17 options:v13 request:v14 qos:v15 error:&v25];
  id v19 = v25;
  valuePtr[0] = v18;

  if (v14) {
    unsigned int v20 = v18;
  }
  else {
    unsigned int v20 = 0;
  }
  if (v20 == 1)
  {
    [(_ANEVirtualPlatformClient *)self updatePerformanceStatsDictionary:a3 aneRequest:v14];
  }
  else
  {
    CFNumberRef v24 = (id)gLogger;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient evaluateWithModelDictionary:].cold.5();
    }
  }
LABEL_17:
  CFDictionaryRemoveValue(a3, @"success");
  CFNumberRef v22 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, valuePtr);
  CFDictionarySetValue(a3, @"success", v22);
  CFRelease(v22);
  [(_ANEVirtualPlatformClient *)self updateErrorValueDictionary:a3 error:v19];
}

- (void)mapIOSurfacesWithModel:(VirtANEModel *)a3
{
  v14[4] = *(id *)MEMORY[0x263EF8340];
  aneModelDict = self->_aneModelDict;
  unint64_t v7 = [NSNumber numberWithUnsignedLongLong:a3->var15];
  char v8 = [(NSMutableDictionary *)aneModelDict objectForKeyedSubscript:v7];

  if (v8)
  {
    char v9 = [(_ANEVirtualPlatformClient *)self requestWithVirtualANEModel:a3];
    int var18 = a3->var18;
    aneClient = self->_aneClient;
    unint64_t v12 = [v8 model];
    v14[0] = 0;
    LODWORD(aneClient) = [(_ANEClient *)aneClient mapIOSurfacesWithModel:v12 request:v9 cacheInference:var18 != 0 error:v14];
    id v13 = v14[0];
    a3->var1 = aneClient;

    [(_ANEVirtualPlatformClient *)self updatePerformanceStats:a3 aneRequest:v9];
    [(_ANEVirtualPlatformClient *)self updateErrorValue:a3 error:v13];
  }
  else
  {
    a3->var1 = 0;
    char v9 = (id)gLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient mapIOSurfacesWithModel:]();
    }
    id v13 = 0;
  }
}

- (void)compiledModelExistsFor:(VirtANEModel *)a3
{
  id v5 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a3->var5 classType:objc_opt_class() length:a3->var9];
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
  {
    -[_ANEVirtualPlatformClient compiledModelExistsFor:]();
    if (!v5) {
      goto LABEL_5;
    }
  }
  else if (!v5)
  {
    goto LABEL_5;
  }
  id v6 = [(_ANEVirtualPlatformClient *)self aneModelDict];
  unint64_t v7 = [NSNumber numberWithUnsignedLongLong:a3->var15];
  char v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
LABEL_4:
    char v9 = [v8 model];
    [(_ANEVirtualPlatformClient *)self doModelAttributeUpdate:v9 virtualANEModel:a3];

    aneClient = self->_aneClient;
    uint64_t v11 = [v8 model];
    a3->var1 = [(_ANEClient *)aneClient compiledModelExistsFor:v11];

    unint64_t v12 = [v8 model];
    [(_ANEVirtualPlatformClient *)self updateVirtualANEModel:a3 model:v12];

    goto LABEL_5;
  }
  id v13 = [(_ANEVirtualPlatformClient *)self doCreateModelFile:a3 aneModelKey:v5];
  if (v13)
  {
    char v8 = +[_ANEVirtualModel objectWithModel:v13];
    unint64_t v14 = [(_ANEVirtualPlatformClient *)self aneModelDict];
    unint64_t v15 = [NSNumber numberWithUnsignedLongLong:a3->var15];
    [v14 setObject:v8 forKeyedSubscript:v15];

    if (v8) {
      goto LABEL_4;
    }
    id v16 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      -[_ANEVirtualPlatformClient compiledModelExistsFor:](v16);
    }
  }
  else
  {
    unsigned int v17 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      -[_ANEVirtualPlatformClient compiledModelExistsFor:](v17);
    }
  }
LABEL_5:
}

- (void)compiledModelExistsForDictionary:(__CFDictionary *)a3
{
  uint64_t valuePtr = 1;
  id v5 = -[_ANEVirtualPlatformClient createAllModelFilesOnHost:](self, "createAllModelFilesOnHost:");
  id v6 = [(_ANEVirtualPlatformClient *)self constructANEModel:a3 modelDirectory:v5];
  unint64_t v7 = [v6 getCacheURLIdentifier];

  if (v6)
  {
    [(_ANEVirtualPlatformClient *)self doModelAttributeUpdateDictionary:v6 dictionary:a3];
    uint64_t valuePtr = [(_ANEClient *)self->_aneClient compiledModelExistsFor:v6];
    CFDictionaryRemoveValue(a3, @"success");
    CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
    CFDictionarySetValue(a3, @"success", v8);
    CFRelease(v8);
    [(_ANEVirtualPlatformClient *)self updateVirtualANEModelDictionary:a3 model:v6 cacheURLIdentifierToGuest:v7 == 0];
  }
  else
  {
    uint64_t valuePtr = 0;
    CFDictionaryRemoveValue(a3, @"success");
    CFNumberRef v9 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
    CFDictionarySetValue(a3, @"success", v9);
    CFRelease(v9);
  }
}

- (id)removeAllModelFiles:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [MEMORY[0x263F08850] defaultManager];
  if ([v4 fileExistsAtPath:v3])
  {
    id v7 = 0;
    [v4 removeItemAtPath:v3 error:&v7];
    id v5 = v7;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)purgeCompiledModel:(VirtANEModel *)a3
{
  id v5 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a3->var5 classType:objc_opt_class() length:a3->var9];
  id v6 = [(_ANEVirtualPlatformClient *)self doCreateModelFile:a3 aneModelKey:v5];
  if (v6)
  {
    [(_ANEVirtualPlatformClient *)self doModelAttributeUpdate:v6 virtualANEModel:a3];
    [(_ANEClient *)self->_aneClient purgeCompiledModel:v6];
    [(_ANEVirtualPlatformClient *)self doRemoveModelFile:a3];
    aneModelDict = self->_aneModelDict;
    CFNumberRef v8 = [NSNumber numberWithUnsignedLongLong:a3->var15];
    [(NSMutableDictionary *)aneModelDict setObject:0 forKeyedSubscript:v8];

    a3->var1 = 1;
  }
  else
  {
    CFNumberRef v9 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
      [(_ANEVirtualPlatformClient *)v9 purgeCompiledModel:v11];
    }
  }
}

- (void)purgeCompiledModelDictionary:(__CFDictionary *)a3
{
  valuePtr[8] = *MEMORY[0x263EF8340];
  valuePtr[0] = 1;
  unint64_t v6 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"programHandle"];
  if (v6)
  {
    aneModelDict = self->_aneModelDict;
    CFNumberRef v8 = [NSNumber numberWithUnsignedLongLong:v6];
    CFNumberRef v9 = [(NSMutableDictionary *)aneModelDict objectForKeyedSubscript:v8];

    if (v9)
    {
      uint64_t v10 = 0;
LABEL_18:
      [(_ANEClient *)self->_aneClient purgeCompiledModel:v10];
      goto LABEL_19;
    }
  }
  uint64_t v11 = (id)gLogger;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient purgeCompiledModelDictionary:]();
  }

  unint64_t v12 = [(_ANEVirtualPlatformClient *)self createAllModelFilesOnHost:a3];
  uint64_t v10 = [(_ANEVirtualPlatformClient *)self constructANEModel:a3 modelDirectory:v12];
  if (v10)
  {
    [(_ANEVirtualPlatformClient *)self doModelAttributeUpdateDictionary:v10 dictionary:a3];
    if (!v12) {
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  id v13 = (id)gLogger;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient purgeCompiledModelDictionary:]();
  }

  valuePtr[0] = 0;
  if (v12)
  {
LABEL_12:
    unint64_t v14 = [(_ANEVirtualPlatformClient *)self removeAllModelFiles:v12];
    if (v14)
    {
      unint64_t v15 = (id)gLogger;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient purgeCompiledModelDictionary:]();
      }
    }
  }
LABEL_17:

  CFNumberRef v9 = 0;
  if (v10) {
    goto LABEL_18;
  }
LABEL_19:
  CFDictionaryRemoveValue(a3, @"success");
  CFNumberRef v16 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, valuePtr);
  CFDictionarySetValue(a3, @"success", v16);
  CFRelease(v16);
}

- (void)compiledModelExistsMatchingHash:(VirtANEModel *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a3->var44 classType:objc_opt_class() length:a3->var45];
  a3->int64_t var1 = [(_ANEClient *)self->_aneClient compiledModelExistsMatchingHash:v5];
  unint64_t v6 = gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
  {
    unint64_t var45 = a3->var45;
    int64_t var1 = a3->var1;
    int v9 = 136315906;
    uint64_t v10 = "-[_ANEVirtualPlatformClient compiledModelExistsMatchingHash:]";
    __int16 v11 = 2048;
    unint64_t v12 = var45;
    __int16 v13 = 2112;
    unint64_t v14 = v5;
    __int16 v15 = 2048;
    int64_t v16 = var1;
    _os_log_debug_impl(&dword_258723000, v6, OS_LOG_TYPE_DEBUG, "%s: length=%llu : HASH=%@ : success=%lld", (uint8_t *)&v9, 0x2Au);
  }
}

- (void)compiledModelExistsMatchingHashDictionary:(__CFDictionary *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v5 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"ioSIDHashString"];
  unsigned int v6 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"hashStringLength"];
  id v7 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:v5 classType:objc_opt_class() length:v6];
  uint64_t valuePtr = [(_ANEClient *)self->_aneClient compiledModelExistsMatchingHash:v7];
  CFDictionaryRemoveValue(a3, @"success");
  CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  CFDictionarySetValue(a3, @"success", v8);
  CFRelease(v8);
  int v9 = gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    unint64_t v12 = "-[_ANEVirtualPlatformClient compiledModelExistsMatchingHashDictionary:]";
    __int16 v13 = 1024;
    unsigned int v14 = v6;
    __int16 v15 = 2112;
    int64_t v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = valuePtr;
    _os_log_debug_impl(&dword_258723000, v9, OS_LOG_TYPE_DEBUG, "%s: length=%u : HASH=%@ : success=%lld", buf, 0x26u);
  }
}

- (void)purgeCompiledModelMatchingHash:(VirtANEModel *)a3
{
  id v4 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a3->var44 classType:objc_opt_class() length:a3->var45];
  -[_ANEClient purgeCompiledModelMatchingHash:](self->_aneClient, "purgeCompiledModelMatchingHash:");
}

- (void)purgeCompiledModelMatchingHashDictionary:(__CFDictionary *)a3
{
  unint64_t v5 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:+[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:key:](_ANEVirtualPlatformClient, "dictionaryGetUInt64ForKey:key:", a3, @"ioSIDHashString") classType:objc_opt_class() length:+[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"hashStringLength"]];
  [(_ANEClient *)self->_aneClient purgeCompiledModelMatchingHash:v5];
  uint64_t valuePtr = 1;
  CFDictionaryRemoveValue(a3, @"success");
  CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  CFDictionarySetValue(a3, @"success", v6);
  CFRelease(v6);
}

- (void)validateNetworkCreate:(__CFDictionary *)a3
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  id v4 = (id)gLogger;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient validateNetworkCreate:]8();
  }

  uint64_t valuePtr = 1;
  +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"apiVersion"];
  int v5 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"numModelFiles"];
  if (!v5)
  {
    CFNumberRef v6 = (id)gLogger;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient validateNetworkCreate:]7();
    }

    uint64_t valuePtr = 0;
  }
  CFNumberRef Value = (void *)CFDictionaryGetValue(a3, @"uuid");
  if (!Value)
  {
    CFNumberRef v8 = (id)gLogger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient validateNetworkCreate:]6();
    }

    uint64_t valuePtr = 0;
  }
  if (!CFDictionaryGetValue(a3, @"function"))
  {
    int v9 = (id)gLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient validateNetworkCreate:]5();
    }

    uint64_t valuePtr = 0;
  }
  uint64_t v10 = (void *)CFDictionaryGetValue(a3, @"scratchPadPath");
  if (!v10)
  {
    __int16 v11 = (id)gLogger;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient validateNetworkCreate:]4();
    }

    uint64_t valuePtr = 0;
  }
  unint64_t v12 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"ioSIDValidationResultOutput"];
  if (!v12)
  {
    BOOL v21 = (id)gLogger;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient validateNetworkCreate:]();
    }

    uint64_t valuePtr = 0;
    goto LABEL_33;
  }
  if (!valuePtr)
  {
LABEL_33:
    CFDictionaryRemoveAllValues(a3);
    CFNumberRef v22 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
    CFDictionarySetValue(a3, @"success", v22);
    CFRelease(v22);
    return;
  }
  unint64_t v78 = v12;
  id v84 = Value;
  id v79 = v10;
  v85 = [v79 componentsSeparatedByString:@"/"];
  v80 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF ENDSWITH %@", @".bundle"];
  v87 = objc_msgSend(v85, "filteredArrayUsingPredicate:");
  [v85 removeObjectsInArray:v87];
  v88 = [v85 componentsJoinedByString:@"/"];
  if ([v88 hasPrefix:@"/"])
  {
    uint64_t v13 = [v88 substringFromIndex:1];

    v88 = (void *)v13;
  }
  v93 = (__CFString *)[[NSString alloc] initWithFormat:@"%@/%@/%@/", self->_anebaseDirectory, v84, v88];
  id v14 = [NSString alloc];
  __int16 v15 = [v87 firstObject];
  v90 = (__CFString *)[v14 initWithFormat:@"%@%@", v93, v15];

  v86 = [v87 componentsJoinedByString:@"/"];
  v81 = (__CFString *)[[NSString alloc] initWithFormat:@"%@%@", v93, v86];
  int64_t v16 = (id)gLogger;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v64 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413314;
    v107 = v64;
    __int16 v108 = 2112;
    CFStringRef v109 = v93;
    __int16 v110 = 2112;
    CFStringRef v111 = v81;
    __int16 v112 = 2112;
    *(void *)v113 = v88;
    *(_WORD *)&v113[8] = 2112;
    *(void *)&v113[10] = v90;
    _os_log_debug_impl(&dword_258723000, v16, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient validateNetworkCreate directoryPath=%@ constructedScratchPadPath=%@ scratchPadBaseDirectory=%@ bundleDirectoryPath=%@", buf, 0x34u);
  }
  unsigned __int8 v101 = 0;
  __int16 v17 = [MEMORY[0x263F08850] defaultManager];
  int v18 = [v17 fileExistsAtPath:v93 isDirectory:&v101];

  uint64_t v19 = (id)gLogger;
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v18)
  {
    if (v20)
    {
      v74 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v107 = v74;
      __int16 v108 = 2112;
      CFStringRef v109 = v93;
      __int16 v110 = 1024;
      LODWORD(v111) = v101;
      _os_log_debug_impl(&dword_258723000, v19, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient Directory already exists %@ isDirectory %d", buf, 0x1Cu);
    }
    id v89 = 0;
LABEL_29:

    goto LABEL_37;
  }
  if (v20)
  {
    v75 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v107 = v75;
    __int16 v108 = 2112;
    CFStringRef v109 = v93;
    __int16 v110 = 1024;
    LODWORD(v111) = v101;
    _os_log_debug_impl(&dword_258723000, v19, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient Directory Does not exists %@ isDirectory %d", buf, 0x1Cu);
  }
  id v23 = [MEMORY[0x263F08850] defaultManager];
  id v100 = 0;
  unsigned int v24 = [v23 createDirectoryAtPath:v93 withIntermediateDirectories:1 attributes:0 error:&v100];
  id v89 = v100;
  uint64_t valuePtr = v24;

  if (!valuePtr)
  {
    uint64_t v19 = (id)gLogger;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient validateNetworkCreate:]2();
    }
    goto LABEL_29;
  }
LABEL_37:
  unsigned __int8 v101 = 0;
  id v25 = [MEMORY[0x263F08850] defaultManager];
  int v26 = [v25 fileExistsAtPath:v90 isDirectory:&v101];

  id v27 = (id)gLogger;
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
  if (v26)
  {
    if (v28)
    {
      id v29 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v107 = v29;
      __int16 v108 = 2112;
      CFStringRef v109 = v90;
      __int16 v110 = 1024;
      LODWORD(v111) = v101;
      _os_log_debug_impl(&dword_258723000, v27, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient Directory already exists %@ isDirectory %d", buf, 0x1Cu);
    }
LABEL_49:

    goto LABEL_50;
  }
  if (v28)
  {
    v76 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v107 = v76;
    __int16 v108 = 2112;
    CFStringRef v109 = v90;
    __int16 v110 = 1024;
    LODWORD(v111) = v101;
    _os_log_debug_impl(&dword_258723000, v27, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient Directory Does not exists %@ isDirectory %d", buf, 0x1Cu);
  }
  v30 = [MEMORY[0x263F08850] defaultManager];
  id v99 = v89;
  unsigned int v31 = [v30 createDirectoryAtPath:v90 withIntermediateDirectories:1 attributes:0 error:&v99];
  id v32 = v99;

  uint64_t valuePtr = v31;
  if (!valuePtr)
  {
    id v27 = (id)gLogger;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient validateNetworkCreate:]2();
    }
    id v89 = v32;
    goto LABEL_49;
  }
  id v89 = v32;
LABEL_50:
  if (!v5) {
    goto LABEL_70;
  }
  uint64_t v33 = 0;
  while (1)
  {
    CFStringRef v34 = CFStringCreateWithFormat(0, 0, @"fileName%u", v33);
    CFStringRef v35 = (const __CFString *)CFDictionaryGetValue(a3, v34);
    CFRelease(v34);
    if (!CFStringGetLength(v35))
    {
      v41 = (id)gLogger;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient validateNetworkCreate:]0();
      }
      goto LABEL_61;
    }
    CFStringRef v36 = CFStringCreateWithFormat(0, 0, @"fileLength%u", v33);
    unint64_t v37 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:v36];
    CFRelease(v36);
    if (!v37)
    {
      v41 = (id)gLogger;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v107 = v42;
        __int16 v108 = 2112;
        CFStringRef v109 = v35;
        _os_log_error_impl(&dword_258723000, v41, OS_LOG_TYPE_ERROR, "%@: ANEVirtualPlatformClient skipping zero-length file %@", buf, 0x16u);
      }
LABEL_61:

      goto LABEL_62;
    }
    CFStringRef v38 = CFStringCreateWithFormat(0, 0, @"fileIOSID%u", v33);
    unint64_t v39 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:v38];
    CFRelease(v38);
    if (!v39) {
      break;
    }
    BOOL v40 = [(_ANEVirtualPlatformClient *)self createModelFile:v35 path:v93 ioSID:v39 length:v37];
    uint64_t valuePtr = v40;
    if (!v40)
    {
      v44 = (id)gLogger;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v77 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413314;
        v107 = v77;
        __int16 v108 = 2112;
        CFStringRef v109 = v93;
        __int16 v110 = 2112;
        CFStringRef v111 = v35;
        __int16 v112 = 1024;
        *(_DWORD *)v113 = v39;
        *(_WORD *)&v113[4] = 2048;
        *(void *)&v113[6] = v37;
        _os_log_error_impl(&dword_258723000, v44, OS_LOG_TYPE_ERROR, "%@: ANEVirtualPlatformClient failed to create file on host directoryPath:%@ fileName:%@ fileIOSID:%u fileLength=%llu", buf, 0x30u);
      }
      goto LABEL_70;
    }
LABEL_62:
    uint64_t v33 = (v33 + 1);
    if (v5 == v33) {
      goto LABEL_70;
    }
  }
  v43 = (id)gLogger;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient validateNetworkCreate:]1();
  }

  uint64_t valuePtr = 0;
LABEL_70:
  v46 = [MEMORY[0x263F08850] defaultManager];
  id v98 = 0;
  v82 = [v46 contentsOfDirectoryAtPath:v93 error:&v98];
  id v83 = v98;

  if (v83 || !v82)
  {
    v47 = (id)gLogger;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient validateNetworkCreate:].cold.9();
    }

    uint64_t valuePtr = 0;
  }
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v48 = v82;
  uint64_t v49 = [v48 countByEnumeratingWithState:&v94 objects:v105 count:16];
  if (!v49)
  {

LABEL_93:
    v62 = (id)gLogger;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient validateNetworkCreate:]();
    }

    v50 = 0;
    uint64_t valuePtr = 0;
    goto LABEL_113;
  }
  v50 = 0;
  uint64_t v51 = *(void *)v95;
  do
  {
    for (uint64_t i = 0; i != v49; ++i)
    {
      if (*(void *)v95 != v51) {
        objc_enumerationMutation(v48);
      }
      v53 = *(void **)(*((void *)&v94 + 1) + 8 * i);
      v54 = [v53 pathExtension];
      int v55 = [v54 isEqualToString:@"mil"];

      if (v55)
      {
        id v56 = v53;

        v50 = v56;
      }
    }
    uint64_t v49 = [v48 countByEnumeratingWithState:&v94 objects:v105 count:16];
  }
  while (v49);

  if (!v50) {
    goto LABEL_93;
  }
  if (!valuePtr) {
    goto LABEL_113;
  }
  v57 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", v93, v50];
  v58 = +[_ANEVirtualPlatformClient prepareValidationResultForSerialization:ANEValidateNetworkCreateVMHost()];
  if (!v58)
  {
    v63 = (id)gLogger;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient validateNetworkCreate:].cold.4();
    }
    goto LABEL_107;
  }
  CFErrorRef error = 0;
  CFAllocatorRef v59 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v60 = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x263EFFB08], v58, kCFPropertyListBinaryFormat_v1_0, 0, &error);
  CFRelease(v58);
  if (!v60)
  {
    if (error)
    {
      CFStringRef v65 = CFErrorCopyDescription(error);
      if (v65)
      {
        CFDictionaryRef v66 = CFErrorCopyUserInfo(error);
        if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
          -[_ANEVirtualPlatformClient validateNetworkCreate:].cold.6();
        }
        CFRelease(v65);
      }
      CFRelease(error);
    }
    v63 = (id)gLogger;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient validateNetworkCreate:].cold.5();
    }
LABEL_107:

    uint64_t valuePtr = 0;
    goto LABEL_112;
  }
  if (CFDataGetLength(v60) <= 0xA00000)
  {
    BytePtr = CFDataGetBytePtr(v60);
    [(_ANEVirtualPlatformClient *)self copyBytesToIOSurface:BytePtr dataLength:CFDataGetLength(v60) ioSID:v78];
    v104[0] = 0;
    v104[0] = CFDataGetLength(v60);
    CFNumberRef v68 = CFNumberCreate(v59, kCFNumberSInt64Type, v104);
    CFDictionarySetValue(a3, @"validationResultSize", v68);
    CFRelease(v68);
  }
  else
  {
    v61 = (id)gLogger;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient validateNetworkCreate:].cold.8();
    }

    uint64_t valuePtr = 0;
  }
  v69 = (id)gLogger;
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    CFDataGetLength(v60);
    -[_ANEVirtualPlatformClient validateNetworkCreate:].cold.7();
  }

  CFRelease(v60);
LABEL_112:

LABEL_113:
  v70 = (id)gLogger;
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient validateNetworkCreate:]();
  }

  CFDictionaryRemoveValue(a3, @"success");
  CFNumberRef v71 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  CFDictionarySetValue(a3, @"success", v71);
  CFRelease(v71);
  id v72 = [(_ANEVirtualPlatformClient *)self removeAllModelFiles:v90];
  id v73 = [(_ANEVirtualPlatformClient *)self removeAllModelFiles:v93];
}

- (void)beginRealTimeTask:(VirtANEModel *)a3
{
  a3->int64_t var1 = [(_ANEClient *)self->_aneClient beginRealTimeTask];
}

- (void)endRealTimeTask:(VirtANEModel *)a3
{
  a3->int64_t var1 = [(_ANEClient *)self->_aneClient endRealTimeTask];
}

- (void)echo:(VirtANEModel *)a3
{
  int v5 = [(_ANEVirtualPlatformClient *)self getIOSurface:a3->var44];
  if (v5)
  {
    CFNumberRef v6 = v5;
    IOSurfaceLock(v5, 0, 0);
    id v8 = (id)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:IOSurfaceGetBaseAddress(v6) length:a3->var45];
    IOSurfaceUnlock(v6, 0, 0);
    CFRelease(v6);
    id v7 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
    a3->int64_t var1 = [(_ANEClient *)self->_aneClient echo:v7];
  }
}

- (void)echoDictionary:(__CFDictionary *)a3
{
  int v5 = [(_ANEVirtualPlatformClient *)self getIOSurface:+[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"ioSIDHashString"]];
  if (v5)
  {
    CFNumberRef v6 = v5;
    unsigned int v7 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"hashStringLength"];
    IOSurfaceLock(v6, 0, 0);
    id v8 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:IOSurfaceGetBaseAddress(v6) length:v7];
    IOSurfaceUnlock(v6, 0, 0);
    CFRelease(v6);
    int v9 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
    uint64_t valuePtr = [(_ANEClient *)self->_aneClient echo:v9];
    CFDictionaryRemoveValue(a3, @"success");
    CFNumberRef v10 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
    CFDictionarySetValue(a3, @"success", v10);
    CFRelease(v10);
  }
  else
  {
    uint64_t valuePtr = 0;
    CFDictionaryRemoveValue(a3, @"success");
    CFNumberRef v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
    CFDictionarySetValue(a3, @"success", v11);
    CFRelease(v11);
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      -[_ANEVirtualPlatformClient echoDictionary:]();
    }
  }
}

- (void)getDeviceInfoDictionary:(__CFDictionary *)a3
{
  int valuePtr = [MEMORY[0x263F28048] isInternalBuild];
  int v15 = [MEMORY[0x263F28048] numANEs];
  int v14 = [MEMORY[0x263F28048] numANECores];
  id v4 = [MEMORY[0x263F28048] aneArchitectureType];
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v7 = CFNumberCreate(v5, kCFNumberSInt32Type, &v15);
  CFNumberRef v8 = CFNumberCreate(v5, kCFNumberSInt32Type, &v14);
  id v9 = v4;
  CFStringRef v10 = CFStringCreateWithCString(0, (const char *)[v9 UTF8String], 0x8000100u);
  CFDictionarySetValue(a3, @"ANEDevicePropertyIsInternalBuild", v6);
  CFDictionarySetValue(a3, @"ANEDevicePropertyNumANEs", v7);
  CFDictionarySetValue(a3, @"ANEDevicePropertyNumANECores", v8);
  CFDictionarySetValue(a3, @"ANEDevicePropertyTypeANEArchitectureTypeStr", v10);
  CFRelease(v6);
  CFRelease(v7);
  CFRelease(v8);
  CFRelease(v10);
  uint64_t v13 = 1;
  CFDictionaryRemoveValue(a3, @"success");
  CFNumberRef v11 = CFNumberCreate(v5, kCFNumberSInt64Type, &v13);
  CFDictionarySetValue(a3, @"success", v11);
  CFRelease(v11);
  unint64_t v12 = gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
    [(_ANEVirtualPlatformClient *)(uint64_t)v9 getDeviceInfoDictionary:v12];
  }
}

- (BOOL)createModelFile:(id)a3 path:(id)a4 ioSID:(unsigned int)a5 length:(unint64_t)AllocSize
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = [(_ANEVirtualPlatformClient *)self getIOSurface:a5];
  uint64_t v13 = v12;
  if (v12)
  {
    IOSurfaceLock(v12, 0, 0);
    int v14 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      int v26 = "-[_ANEVirtualPlatformClient createModelFile:path:ioSID:length:]";
      __int16 v27 = 2112;
      id v28 = v10;
      __int16 v29 = 2112;
      id v30 = v11;
      __int16 v31 = 1024;
      unsigned int v32 = a5;
      __int16 v33 = 2048;
      unint64_t v34 = AllocSize;
      _os_log_debug_impl(&dword_258723000, v14, OS_LOG_TYPE_DEBUG, "%s:ANEVirtualPlatformClient modeFileName=%@ path=%@ ioSID=%u length=%lld", buf, 0x30u);
      if (!AllocSize)
      {
LABEL_4:
        AllocSize = IOSurfaceGetAllocSize(v13);
        int v15 = gLogger;
        if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316162;
          int v26 = "-[_ANEVirtualPlatformClient createModelFile:path:ioSID:length:]";
          __int16 v27 = 2112;
          id v28 = v10;
          __int16 v29 = 2112;
          id v30 = v11;
          __int16 v31 = 1024;
          unsigned int v32 = a5;
          __int16 v33 = 2048;
          unint64_t v34 = AllocSize;
          _os_log_debug_impl(&dword_258723000, v15, OS_LOG_TYPE_DEBUG, "%s:ANEVirtualPlatformClient modeFileName=%@ path=%@ ioSID=%u length=%lld", buf, 0x30u);
        }
      }
    }
    else if (!AllocSize)
    {
      goto LABEL_4;
    }
    int64_t v16 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:IOSurfaceGetBaseAddress(v13) length:AllocSize];
    IOSurfaceUnlock(v13, 0, 0);
    CFRelease(v13);
    __int16 v17 = (void *)[[NSString alloc] initWithFormat:@"%@%@", v11, v10];
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      -[_ANEVirtualPlatformClient createModelFile:path:ioSID:length:]();
    }
    id v24 = 0;
    char v18 = [v16 writeToFile:v17 options:1 error:&v24];
    id v19 = v24;
    if (v18)
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
        -[_ANEVirtualPlatformClient createModelFile:path:ioSID:length:]();
      }
    }
    else
    {
      BOOL v21 = (id)gLogger;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        CFNumberRef v22 = [v19 localizedDescription];
        -[_ANEVirtualPlatformClient createModelFile:path:ioSID:length:]((uint64_t)v17, v22, buf, v21);
      }
    }
    goto LABEL_18;
  }
  BOOL v20 = gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    int v26 = "-[_ANEVirtualPlatformClient createModelFile:path:ioSID:length:]";
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v11;
    __int16 v31 = 1024;
    unsigned int v32 = a5;
    __int16 v33 = 2048;
    unint64_t v34 = AllocSize;
    _os_log_debug_impl(&dword_258723000, v20, OS_LOG_TYPE_DEBUG, "%s:ANEVirtualPlatformClient iosurface empty modeFileName=%@ path=%@ ioSID=%u length=%lld", buf, 0x30u);
  }
  char v18 = 0;
LABEL_18:

  return v18;
}

- (unsigned)getQueueCount
{
  return 6;
}

- (void)setAvpSaveRestoreSupported:(BOOL)a3
{
  self->_avpSaveRestoreSupported = a3;
}

- (id)getObjectFromIOSurfaceID:(unsigned int)a3 classType:(Class)a4 length:(unint64_t)AllocSize
{
  v22[5] = *MEMORY[0x263EF8340];
  CFNumberRef v7 = -[_ANEVirtualPlatformClient getIOSurface:](self, "getIOSurface:", a3, a4);
  if (v7)
  {
    CFNumberRef v8 = v7;
    IOSurfaceLock(v7, 0, 0);
    if (!AllocSize) {
      AllocSize = IOSurfaceGetAllocSize(v8);
    }
    id v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:IOSurfaceGetBaseAddress(v8) length:AllocSize];
    IOSurfaceUnlock(v8, 0, 0);
    if (v9)
    {
      id v10 = (void *)MEMORY[0x263EFFA08];
      v22[0] = objc_opt_class();
      v22[1] = objc_opt_class();
      v22[2] = objc_opt_class();
      v22[3] = objc_opt_class();
      v22[4] = objc_opt_class();
      id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:5];
      unint64_t v12 = [v10 setWithArray:v11];

      id v21 = 0;
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v9 error:&v21];
      id v14 = v21;
      if (v14)
      {
        int v15 = (id)gLogger;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualPlatformClient getObjectFromIOSurfaceID:classType:length:]();
        }
      }
      int64_t v16 = [v13 decodeObjectOfClasses:v12 forKey:*MEMORY[0x263F081D0]];
      CFRelease(v8);
    }
    else
    {
      __int16 v17 = gLogger;
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
        -[_ANEVirtualPlatformClient getObjectFromIOSurfaceID:classType:length:](v17, v18, v19);
      }
      CFRelease(v8);
      int64_t v16 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
      -[_ANEVirtualPlatformClient getObjectFromIOSurfaceID:classType:length:]();
    }
    int64_t v16 = 0;
  }
  return v16;
}

- (void)printIOSurfaceDataInBytes:(unsigned int)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = [(_ANEVirtualPlatformClient *)self getIOSurface:a3];
    if (v4)
    {
      CFAllocatorRef v5 = v4;
      IOSurfaceLock(v4, 0, 0);
      size_t AllocSize = IOSurfaceGetAllocSize(v5);
      CFNumberRef v7 = (id)gLogger;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient printIOSurfaceDataInBytes:]();
      }

      BaseAddress = (unsigned __int8 *)IOSurfaceGetBaseAddress(v5);
      if (AllocSize)
      {
        id v9 = BaseAddress;
        for (uint64_t i = 0; i != AllocSize; ++i)
        {
          id v11 = (id)gLogger;
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v12 = NSStringFromSelector(a2);
            int v13 = v9[i];
            *(_DWORD *)buf = 138412802;
            uint64_t v18 = v12;
            __int16 v19 = 2048;
            uint64_t v20 = i;
            __int16 v21 = 1024;
            int v22 = v13;
            _os_log_debug_impl(&dword_258723000, v11, OS_LOG_TYPE_DEBUG, "%@ ANEVirtualPlatformClient byte[%llu]=0x%x\n", buf, 0x1Cu);
          }
        }
      }
      IOSurfaceUnlock(v5, 0, 0);
    }
    else if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
    {
      -[_ANEVirtualPlatformClient printIOSurfaceDataInBytes:]();
    }
  }
  else
  {
    id v14 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
      [(_ANEVirtualPlatformClient *)v14 printIOSurfaceDataInBytes:v16];
    }
  }
}

- (void)getArrayFromIOSurfaceID:(unsigned int)a3 localData:(unsigned int *)a4 localDataLength:(unint64_t)a5
{
  CFNumberRef v7 = [(_ANEVirtualPlatformClient *)self getIOSurface:a3];
  if (v7)
  {
    CFNumberRef v8 = v7;
    IOSurfaceLock(v7, 0, 0);
    BaseAddress = IOSurfaceGetBaseAddress(v8);
    memcpy(a4, BaseAddress, 4 * a5);
    IOSurfaceUnlock(v8, 0, 0);
    CFRelease(v8);
  }
  else if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
  {
    -[_ANEVirtualPlatformClient getArrayFromIOSurfaceID:localData:localDataLength:]();
  }
}

- (id)doCreateModelFile:(VirtANEModel *)a3 aneModelKey:(id)a4
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v72 = a4;
  v75 = [MEMORY[0x263F08850] defaultManager];
  if (!v72)
  {
    __int16 v17 = (id)gLogger;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient doCreateModelFile:aneModelKey:]();
    }
    uint64_t v18 = 0;
    goto LABEL_116;
  }
  v76 = [(_ANEVirtualPlatformClient *)self guestBuildVersion];
  CFNumberRef v7 = (id)gLogger;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient doCreateModelFile:aneModelKey:]8();
  }

  CFNumberRef v71 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a3->var52 classType:objc_opt_class() length:a3->var53];
  v74 = objc_msgSend(MEMORY[0x263F28058], "hexStringForString:");
  CFNumberRef v8 = [[NSString alloc] initWithFormat:@"%@/%@/%@/%@/", self->_anebaseDirectory, @"tmp", v76, v74];
  id v73 = [[NSString alloc] initWithFormat:@"%@/%@/%@/%@/", self->_anebaseDirectory, @"tmp", v76, v74];
  id v9 = (id)gLogger;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v42 = NSStringFromSelector(a2);
    v43 = NSTemporaryDirectory();
    *(_DWORD *)buf = 138412802;
    id v83 = v42;
    __int16 v84 = 2112;
    unint64_t v85 = (unint64_t)v43;
    __int16 v86 = 2112;
    v87 = v8;
    _os_log_debug_impl(&dword_258723000, v9, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient: NSTemporaryDirectory %@ old filePath=%@", buf, 0x20u);
  }
  v70 = [v71 lastPathComponent];
  CFNumberRef v68 = [v70 componentsSeparatedByString:@"."];
  v77 = [v68 lastObject];
  id v10 = (id)gLogger;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient doCreateModelFile:aneModelKey:]7();
  }

  id v11 = v8;
  if ([v77 isEqual:@"hwx"])
  {
    unint64_t v12 = [MEMORY[0x263F28040] controllerWithPrivilegedVM:1];
    if (v12 && os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
    {
      -[_ANEVirtualPlatformClient doCreateModelFile:aneModelKey:]5();
      id v11 = v8;
    }
    if (a3->var6 && a3->var7 && a3->var8)
    {
      int v13 = [v11 lastPathComponent];
      id v14 = [v11 stringByReplacingOccurrencesOfString:v13 withString:&stru_2706C0ED8];

      uint64_t v15 = v14;
      uint64_t v16 = (id)gLogger;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v61 = NSStringFromSelector(a2);
        unint64_t var6 = a3->var6;
        unint64_t var7 = a3->var7;
        unint64_t var8 = a3->var8;
        *(_DWORD *)buf = 138413058;
        id v83 = v61;
        __int16 v84 = 2048;
        unint64_t v85 = var6;
        __int16 v86 = 2048;
        v87 = var7;
        __int16 v88 = 2048;
        unint64_t v89 = var8;
        _os_log_debug_impl(&dword_258723000, v16, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient: modelNetLength=%llu : modelShapeLength=%llu : modelWeightLength=%llu", buf, 0x2Au);
      }
      CFNumberRef v8 = v15;
    }
    else
    {
      if (([(_ANEVirtualPlatformClient *)self negotiatedCapabilityMask] & 2) == 0
        || !a3->var61)
      {
        id v24 = (id)gLogger;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          v58 = NSStringFromSelector(a2);
          char v59 = [(_ANEVirtualPlatformClient *)self negotiatedCapabilityMask];
          unint64_t var61 = a3->var61;
          *(_DWORD *)buf = 138412802;
          id v83 = v58;
          __int16 v84 = 2048;
          unint64_t v85 = v59 & 2;
          __int16 v86 = 2048;
          v87 = var61;
          _os_log_debug_impl(&dword_258723000, v24, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient: use local hwx : guestPrecompiledBinarySupport=%llu : modelHWXLength=%llu", buf, 0x20u);
        }
        id v25 = (void *)MEMORY[0x263F28068];
        int v26 = (void *)[objc_alloc(NSURL) initWithString:v71];
        uint64_t v18 = [v25 modelAtURL:v26 key:v72];

        __int16 v17 = 0;
        goto LABEL_115;
      }
      uint64_t v16 = (id)gLogger;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient doCreateModelFile:aneModelKey:]4();
      }
      uint64_t v15 = v73;
    }

    id v73 = v15;
  }
  else
  {
    unint64_t v12 = (id)gLogger;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient doCreateModelFile:aneModelKey:]6();
    }
  }

  if ([v77 isEqual:@"net"])
  {
    uint64_t v19 = [[NSString alloc] initWithFormat:@"%@%@", v73, v70];

    id v73 = v19;
  }
  if ([v77 isEqual:@"hwx"]
    && ([(_ANEVirtualPlatformClient *)self negotiatedCapabilityMask] & 2) != 0
    && a3->var61)
  {
    uint64_t v20 = (id)gLogger;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient doCreateModelFile:aneModelKey:]3();
    }

    unsigned __int8 v80 = 0;
    int v21 = [v75 fileExistsAtPath:v8 isDirectory:&v80];
    int v22 = (id)gLogger;
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
    if (v21)
    {
      if (v23)
      {
        CFStringRef v65 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v83 = v65;
        __int16 v84 = 2112;
        unint64_t v85 = (unint64_t)v8;
        __int16 v86 = 1024;
        LODWORD(v87) = v80;
        _os_log_debug_impl(&dword_258723000, v22, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient Directory already exists %@ isDirectory %d", buf, 0x1Cu);
      }
      __int16 v17 = 0;
    }
    else
    {
      if (v23)
      {
        CFDictionaryRef v66 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v83 = v66;
        __int16 v84 = 2112;
        unint64_t v85 = (unint64_t)v8;
        __int16 v86 = 1024;
        LODWORD(v87) = v80;
        _os_log_debug_impl(&dword_258723000, v22, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient Directory Does not exists %@ isDirectory %d", buf, 0x1Cu);
      }
      id v79 = 0;
      char v44 = [v75 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v79];
      __int16 v17 = v79;
      if ((v44 & 1) == 0)
      {
        v52 = (id)gLogger;
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualPlatformClient doCreateModelFile:aneModelKey:].cold.7();
        }

        v53 = (id)gLogger;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualPlatformClient doCreateModelFile:aneModelKey:]1();
        }

        v54 = (void *)MEMORY[0x263F28068];
        v50 = [objc_alloc(NSURL) initWithString:v71];
        uint64_t v51 = [v54 modelAtURL:v50 key:v72];
        goto LABEL_105;
      }
    }
    unint64_t v45 = a3->var61;
    v46 = (id)gLogger;
    BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG);
    if (v45)
    {
      if (v47)
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient doCreateModelFile:aneModelKey:]0();
      }

      v46 = v8;
      if (![(_ANEVirtualPlatformClient *)self createModelFile:@"model.hwx" path:v8 ioSID:a3->var60 length:a3->var61])
      {
        v50 = (id)gLogger;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualPlatformClient doCreateModelFile:aneModelKey:].cold.9();
        }
        uint64_t v18 = 0;
        goto LABEL_109;
      }
      CFNumberRef v8 = [[NSString alloc] initWithFormat:@"%@%@", v8, @"model.hwx"];
    }
    else if (v47)
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient doCreateModelFile:aneModelKey:].cold.8();
    }

    uint64_t v49 = (void *)MEMORY[0x263F28068];
    v50 = [objc_alloc(NSURL) initWithString:v8];
    uint64_t v51 = [v49 modelAtURL:v50 key:v72];
LABEL_105:
    uint64_t v18 = (void *)v51;
LABEL_109:

    goto LABEL_115;
  }
  if (a3->var55)
  {
    v69 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a3->var54 classType:objc_opt_class() length:a3->var55];
  }
  else
  {
    v69 = @"model.espresso.net";
  }
  if (a3->var57)
  {
    __int16 v27 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a3->var56 classType:objc_opt_class() length:a3->var57];
  }
  else
  {
    __int16 v27 = @"model.espresso.shape";
  }
  if (a3->var59)
  {
    v67 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a3->var58 classType:objc_opt_class() length:a3->var59];
  }
  else
  {
    v67 = @"model.espresso.weights";
  }
  id v28 = (id)gLogger;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    id v48 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    id v83 = v48;
    __int16 v84 = 2112;
    unint64_t v85 = (unint64_t)v69;
    __int16 v86 = 2112;
    v87 = v27;
    __int16 v88 = 2112;
    unint64_t v89 = (unint64_t)v67;
    _os_log_debug_impl(&dword_258723000, v28, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient model names: netname=%@ : shapename=%@ : weightname=%@", buf, 0x2Au);
  }
  v81[0] = 0;
  int v29 = [v75 fileExistsAtPath:v8 isDirectory:v81];
  id v30 = (id)gLogger;
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
  if (v29)
  {
    if (v31)
    {
      id v56 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v83 = v56;
      __int16 v84 = 2112;
      unint64_t v85 = (unint64_t)v8;
      __int16 v86 = 1024;
      LODWORD(v87) = v81[0];
      _os_log_debug_impl(&dword_258723000, v30, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient Directory already exists %@ isDirectory %d", buf, 0x1Cu);
    }
    __int16 v17 = 0;
  }
  else
  {
    if (v31)
    {
      v57 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v83 = v57;
      __int16 v84 = 2112;
      unint64_t v85 = (unint64_t)v8;
      __int16 v86 = 1024;
      LODWORD(v87) = v81[0];
      _os_log_debug_impl(&dword_258723000, v30, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient Directory Does not exists %@ isDirectory %d", buf, 0x1Cu);
    }
    id v78 = 0;
    char v32 = [v75 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v78];
    __int16 v17 = v78;
    if ((v32 & 1) == 0)
    {
      uint64_t v35 = (id)gLogger;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient doCreateModelFile:aneModelKey:].cold.7();
      }
      goto LABEL_113;
    }
  }
  if (a3->var6
    && !-[_ANEVirtualPlatformClient createModelFile:path:ioSID:length:](self, "createModelFile:path:ioSID:length:", v69, v8, a3->var2))
  {
    uint64_t v35 = (id)gLogger;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient doCreateModelFile:aneModelKey:].cold.6();
    }
    goto LABEL_113;
  }
  if (a3->var7
    && !-[_ANEVirtualPlatformClient createModelFile:path:ioSID:length:](self, "createModelFile:path:ioSID:length:", v27, v8, a3->var3))
  {
    uint64_t v35 = (id)gLogger;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient doCreateModelFile:aneModelKey:].cold.5();
    }
    goto LABEL_113;
  }
  if (a3->var8
    && !-[_ANEVirtualPlatformClient createModelFile:path:ioSID:length:](self, "createModelFile:path:ioSID:length:", v67, v8, a3->var4))
  {
    uint64_t v35 = (id)gLogger;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient doCreateModelFile:aneModelKey:].cold.4();
    }
    goto LABEL_113;
  }
  if (a3->var29
    && !-[_ANEVirtualPlatformClient createModelFile:path:ioSID:length:](self, "createModelFile:path:ioSID:length:", @"net.plist", v8, a3->var28))
  {
    uint64_t v35 = (id)gLogger;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient doCreateModelFile:aneModelKey:]();
    }
    goto LABEL_113;
  }
  uint64_t v33 = 0;
  while (1)
  {
    unint64_t v34 = (char *)a3 + 8 * v33;
    if (!*((void *)v34 + 72))
    {
LABEL_84:
      v41 = (void *)MEMORY[0x263F28068];
      uint64_t v35 = [objc_alloc(NSURL) initWithString:v73];
      uint64_t v18 = [v41 modelAtURL:v35 key:v72];
      goto LABEL_114;
    }
    uint64_t v35 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a3->var12[v33] classType:objc_opt_class() length:*((void *)v34 + 72)];
    if (a3->var11[v33]) {
      break;
    }
LABEL_76:

    if (++v33 == 32) {
      goto LABEL_84;
    }
  }
  CFStringRef v36 = a2;
  BOOL v37 = -[_ANEVirtualPlatformClient createModelFile:path:ioSID:length:](self, "createModelFile:path:ioSID:length:", v35, v8, a3->var10[v33]);
  CFStringRef v38 = (id)gLogger;
  BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);
  if (v37)
  {
    a2 = v36;
    if (v39)
    {
      BOOL v40 = NSStringFromSelector(v36);
      *(_DWORD *)buf = 138412546;
      id v83 = v40;
      __int16 v84 = 2112;
      unint64_t v85 = (unint64_t)v35;
      _os_log_debug_impl(&dword_258723000, v38, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient Write %@", buf, 0x16u);

      a2 = v36;
    }

    goto LABEL_76;
  }
  if (v39)
  {
    NSStringFromSelector(v36);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient doCreateModelFile:aneModelKey:]();
  }

LABEL_113:
  uint64_t v18 = 0;
LABEL_114:

LABEL_115:
LABEL_116:

  return v18;
}

+ (BOOL)isFileModificationTimeStampSame:(id)a3 timeSince1970:(double)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    CFNumberRef v6 = [MEMORY[0x263F08850] defaultManager];
    if ([v6 fileExistsAtPath:v5])
    {
      id v16 = 0;
      CFNumberRef v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v5 options:0 error:&v16];
      id v8 = v16;
      if (v8)
      {
        if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
          +[_ANEVirtualPlatformClient isFileModificationTimeStampSame:timeSince1970:]();
        }
        BOOL v9 = 0;
      }
      else
      {
        double v13 = *(double *)[v7 bytes];
        BOOL v9 = v13 == a4;
        id v14 = gLogger;
        if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v18 = "+[_ANEVirtualPlatformClient isFileModificationTimeStampSame:timeSince1970:]";
          __int16 v19 = 2048;
          double v20 = a4;
          __int16 v21 = 2048;
          double v22 = v13;
          __int16 v23 = 1024;
          BOOL v24 = v13 == a4;
          _os_log_debug_impl(&dword_258723000, v14, OS_LOG_TYPE_DEBUG, "%s timeIntervalSince1970Guest:%f timeIntervalSince1970Host:%f isSame:%u", buf, 0x26u);
        }
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
        +[_ANEVirtualPlatformClient isFileModificationTimeStampSame:timeSince1970:]();
      }
      BOOL v9 = 0;
    }
  }
  else
  {
    id v10 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      +[_ANEVirtualPlatformClient isFileModificationTimeStampSame:timeSince1970:](v10, v11, v12);
    }
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)needToSaveFile:(id)a3 fileName:(id)a4 timeSince1970:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = v8;
  if (v7 && v8)
  {
    id v10 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", v7, v9];
    if ([v10 fileExistsAtPath:v11])
    {
      uint64_t v12 = [v9 stringByAppendingString:@".timestamp"];
      double v13 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", v7, v12];
      BOOL v14 = !+[_ANEVirtualPlatformClient isFileModificationTimeStampSame:v13 timeSince1970:a5];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
        +[_ANEVirtualPlatformClient needToSaveFile:fileName:timeSince1970:]();
      }
      LOBYTE(v14) = 1;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      +[_ANEVirtualPlatformClient needToSaveFile:fileName:timeSince1970:]();
    }
    LOBYTE(v14) = 1;
  }

  return v14;
}

+ (BOOL)createLastModificationTimeStampFile:(id)a3 fileName:(id)a4 timeSince1970:(double)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  double v17 = a5;
  BOOL v9 = gLogger;
  BOOL v10 = os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG);
  if (v7 && v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315906;
      __int16 v19 = "+[_ANEVirtualPlatformClient createLastModificationTimeStampFile:fileName:timeSince1970:]";
      __int16 v20 = 2112;
      id v21 = v7;
      __int16 v22 = 2112;
      id v23 = v8;
      __int16 v24 = 2048;
      double v25 = a5;
      _os_log_debug_impl(&dword_258723000, v9, OS_LOG_TYPE_DEBUG, "%s path:%@, name:%@, timeSince1970:%f", buf, 0x2Au);
    }
    uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"%@%@", v7, v8];
    uint64_t v12 = [MEMORY[0x263EFF8F8] dataWithBytes:&v17 length:8];
    id v16 = 0;
    char v13 = [v12 writeToFile:v11 options:1 error:&v16];
    id v14 = v16;
    if ((v13 & 1) == 0 && os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
      +[_ANEVirtualPlatformClient createLastModificationTimeStampFile:fileName:timeSince1970:]();
    }
  }
  else
  {
    if (v10) {
      +[_ANEVirtualPlatformClient createLastModificationTimeStampFile:fileName:timeSince1970:]();
    }
    char v13 = 0;
  }

  return v13;
}

+ (id)getCodeSigningIdentity:(__CFDictionary *)a3
{
  if (CFDictionaryContainsKey(a3, @"csIdentity")
    && (CFNumberRef Value = (void *)CFDictionaryGetValue(a3, @"csIdentity")) != 0)
  {
    id v5 = Value;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      +[_ANEVirtualPlatformClient getCodeSigningIdentity:]();
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)createAllModelFilesOnHost:(__CFDictionary *)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  if (!CFDictionaryContainsKey(a3, @"numModelFiles"))
  {
    id v5 = (id)gLogger;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient createAllModelFilesOnHost:]();
    }
    goto LABEL_23;
  }
  int v4 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"numModelFiles"];
  id v5 = (id)gLogger;
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (!v4)
  {
    if (v6)
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient createAllModelFilesOnHost:]();
    }
LABEL_23:
    id v16 = 0;
    goto LABEL_81;
  }
  if (v6)
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient createAllModelFilesOnHost:]1();
  }

  v54 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v51 = +[_ANEVirtualPlatformClient getCodeSigningIdentity:a3];
  v52 = [(_ANEVirtualPlatformClient *)self guestBuildVersion];
  if (!CFDictionaryContainsKey(a3, @"ioSIDModelInputPath")
    || !CFDictionaryContainsKey(a3, @"modelInputPathLength"))
  {
    v50 = (id)gLogger;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient createAllModelFilesOnHost:]();
    }
    id v5 = 0;
    id v16 = 0;
    goto LABEL_80;
  }
  unint64_t v7 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"ioSIDModelInputPath"];
  unint64_t v8 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"modelInputPathLength"];
  uint64_t v9 = 0;
  if (v7)
  {
    unint64_t v10 = v8;
    if (v8)
    {
      uint64_t v11 = (id)gLogger;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        char v44 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v61 = v44;
        __int16 v62 = 1024;
        *(_DWORD *)v63 = v7;
        *(_WORD *)&v63[4] = 2048;
        *(void *)&v63[6] = v10;
        _os_log_debug_impl(&dword_258723000, v11, OS_LOG_TYPE_DEBUG, "%@ modelInputPathIOSID:%u modelInputPathLength:%llu", buf, 0x1Cu);
      }
      uint64_t v9 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:v7 classType:objc_opt_class() length:v10];
    }
  }
  v50 = v9;
  uint64_t v49 = objc_msgSend(MEMORY[0x263F28058], "hexStringForString:");
  uint64_t v12 = [[NSString alloc] initWithFormat:@"%@/%@/%@/%@/", self->_anebaseDirectory, v51, v52, v49];
  unsigned __int8 v59 = 0;
  int v55 = (void *)v12;
  int v13 = objc_msgSend(v54, "fileExistsAtPath:isDirectory:");
  id v14 = (id)gLogger;
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
  if (v13)
  {
    if (v15)
    {
      NSStringFromSelector(a2);
      unint64_t v45 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v61 = v45;
      __int16 v62 = 2112;
      *(void *)v63 = v55;
      *(_WORD *)&v63[8] = 1024;
      *(_DWORD *)&v63[10] = v59;
      _os_log_debug_impl(&dword_258723000, v14, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient Directory already exists %@ isDirectory %d", buf, 0x1Cu);
    }
    id v5 = 0;
  }
  else
  {
    if (v15)
    {
      NSStringFromSelector(a2);
      v46 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v61 = v46;
      __int16 v62 = 2112;
      *(void *)v63 = v55;
      *(_WORD *)&v63[8] = 1024;
      *(_DWORD *)&v63[10] = v59;
      _os_log_debug_impl(&dword_258723000, v14, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient Directory Does not exists %@ isDirectory %d", buf, 0x1Cu);
    }
    id v58 = 0;
    char v17 = [v54 createDirectoryAtPath:v55 withIntermediateDirectories:1 attributes:0 error:&v58];
    id v5 = v58;
    if ((v17 & 1) == 0)
    {
      __int16 v22 = (id)gLogger;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient validateNetworkCreate:]2();
      }

      goto LABEL_78;
    }
  }
  unint64_t v18 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"modelHWXLength"];
  if (v18)
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a3, @"hwxFileName");
    __int16 v20 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", v55, Value];
    if ([v54 fileExistsAtPath:v20])
    {
      id v21 = (id)gLogger;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient createAllModelFilesOnHost:].cold.7();
      }
    }
    else if (CFStringGetLength(Value))
    {
      unint64_t v23 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"ioSIDModelHWX"];
      if (v23)
      {
        if ([(_ANEVirtualPlatformClient *)self createModelFile:Value path:v55 ioSID:v23 length:v18])
        {
          char v53 = 1;
LABEL_45:

          goto LABEL_46;
        }
        id v21 = (id)gLogger;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          id v48 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v61 = v48;
          __int16 v62 = 2112;
          *(void *)v63 = v55;
          *(_WORD *)&v63[8] = 2112;
          *(void *)&v63[10] = Value;
          __int16 v64 = 1024;
          int v65 = v23;
          __int16 v66 = 2048;
          unint64_t v67 = v18;
          _os_log_error_impl(&dword_258723000, v21, OS_LOG_TYPE_ERROR, "%@: ANEVirtualPlatformClient createAllModelFilesOnHost failed to create file on host directoryPath:%@ fileName:%@ fileIOSID:%u fileLength=%llu", buf, 0x30u);
        }
        char v53 = 0;
LABEL_44:

        goto LABEL_45;
      }
      id v21 = (id)gLogger;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient createAllModelFilesOnHost:].cold.9();
      }
    }
    else
    {
      id v21 = (id)gLogger;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient createAllModelFilesOnHost:].cold.8();
      }
    }
    char v53 = 1;
    goto LABEL_44;
  }
  char v53 = 1;
LABEL_46:
  uint64_t v24 = 0;
  while (1)
  {
    CFStringRef v25 = CFStringCreateWithFormat(0, 0, @"fileName%u", v24);
    uint64_t v26 = (__CFString *)CFDictionaryGetValue(a3, v25);
    CFRelease(v25);
    if (!CFStringGetLength(v26))
    {
      BOOL v31 = (id)gLogger;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient createAllModelFilesOnHost:].cold.5();
      }
      goto LABEL_65;
    }
    CFStringRef v27 = CFStringCreateWithFormat(0, 0, @"fileLength%u", v24);
    unint64_t v28 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:v27];
    CFRelease(v27);
    if (!v28)
    {
      BOOL v31 = (id)gLogger;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        uint64_t v35 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v61 = v35;
        __int16 v62 = 2112;
        *(void *)v63 = v26;
        _os_log_error_impl(&dword_258723000, v31, OS_LOG_TYPE_ERROR, "%@: ANEVirtualPlatformClient createAllModelFilesOnHost skipping zero-length file %@", buf, 0x16u);
      }
      goto LABEL_65;
    }
    CFStringRef v29 = CFStringCreateWithFormat(0, 0, @"FileLastModificationTimeStamp%u", v24);
    id v30 = (void *)CFDictionaryGetValue(a3, v29);
    CFRelease(v29);
    if (v30)
    {
      BOOL v31 = v30;
      [v31 doubleValue];
      double v33 = v32;
      unint64_t v34 = gLogger;
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v61 = "-[_ANEVirtualPlatformClient createAllModelFilesOnHost:]";
        __int16 v62 = 1024;
        *(_DWORD *)v63 = v24;
        *(_WORD *)&v63[4] = 2048;
        *(double *)&v63[6] = v33;
        _os_log_debug_impl(&dword_258723000, v34, OS_LOG_TYPE_DEBUG, "%s fileCounter:%d timeLastModificationSince1970:%f", buf, 0x1Cu);
      }
      if (!+[_ANEVirtualPlatformClient needToSaveFile:v55 fileName:v26 timeSince1970:v33])
      {
        BOOL v39 = gLogger;
        if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v61 = "-[_ANEVirtualPlatformClient createAllModelFilesOnHost:]";
          __int16 v62 = 2112;
          *(void *)v63 = v55;
          *(_WORD *)&v63[8] = 2112;
          *(void *)&v63[10] = v26;
          _os_log_debug_impl(&dword_258723000, v39, OS_LOG_TYPE_DEBUG, "%s directoryPath: %@ fileName:%@ need not be saved again", buf, 0x20u);
        }
        goto LABEL_65;
      }
    }
    else
    {
      double v33 = 0.0;
    }
    CFStringRef v36 = CFStringCreateWithFormat(0, 0, @"fileIOSID%u", v24);
    unint64_t v37 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:v36];
    CFRelease(v36);
    if (!v37) {
      break;
    }
    if (![(_ANEVirtualPlatformClient *)self createModelFile:v26 path:v55 ioSID:v37 length:v28])
    {
      BOOL v40 = (id)gLogger;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        BOOL v47 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v61 = v47;
        __int16 v62 = 2112;
        *(void *)v63 = v55;
        *(_WORD *)&v63[8] = 2112;
        *(void *)&v63[10] = v26;
        __int16 v64 = 1024;
        int v65 = v37;
        __int16 v66 = 2048;
        unint64_t v67 = v28;
        _os_log_error_impl(&dword_258723000, v40, OS_LOG_TYPE_ERROR, "%@: ANEVirtualPlatformClient createAllModelFilesOnHost failed to create file on host directoryPath:%@ fileName:%@ fileIOSID:%u fileLength=%llu", buf, 0x30u);
      }
      goto LABEL_73;
    }
    if (!v30)
    {
      char v53 = 1;
      goto LABEL_66;
    }
    BOOL v31 = v26;
    CFStringRef v38 = [v31 stringByAppendingString:@".timestamp"];
    +[_ANEVirtualPlatformClient createLastModificationTimeStampFile:v55 fileName:v38 timeSince1970:v33];

    char v53 = 1;
LABEL_65:

LABEL_66:
    uint64_t v24 = (v24 + 1);
    if (v4 == v24) {
      goto LABEL_74;
    }
  }
  BOOL v40 = (id)gLogger;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient createAllModelFilesOnHost:].cold.6();
  }
LABEL_73:

  char v53 = 0;
LABEL_74:
  v41 = (id)gLogger;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient createAllModelFilesOnHost:].cold.4();
  }

  if (v53)
  {
    uint64_t v42 = v55;
    id v16 = v55;
    goto LABEL_79;
  }
LABEL_78:
  id v16 = 0;
  uint64_t v42 = v55;
LABEL_79:

LABEL_80:
LABEL_81:

  return v16;
}

- (id)createANEModelInstanceParameters:(__CFDictionary *)a3 modelUUID:(id)a4
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v67 = a4;
  id v5 = (id)gLogger;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient createANEModelInstanceParameters:modelUUID:]();
  }

  if (CFDictionaryContainsKey(a3, @"modelInstanceParametersData"))
  {
    BOOL v6 = +[_ANEVirtualPlatformClient dictionaryGetDataBytesForKey:a3 key:@"modelInstanceParametersData"];
    aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer::_ANEModelInstanceParametersSerializerDeserializer((uint64_t)v73, (uint64_t)v6, (void *)gLogger);
    unint64_t v7 = NSString;
    BaseAddress = *(__IOSurface **)(v76 + 8);
    if (BaseAddress) {
      BaseAddress = (__IOSurface *)IOSurfaceGetBaseAddress(BaseAddress);
    }
    if (v74) {
      uint64_t v9 = BaseAddress;
    }
    else {
      uint64_t v9 = 0;
    }
    v61 = [v7 stringWithUTF8String:v9];
    __int16 v62 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
    unint64_t v10 = (id)gLogger;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      CFDataRef v60 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      unsigned __int8 v80 = v60;
      __int16 v81 = 1024;
      *(_DWORD *)v82 = v75;
      *(_WORD *)&v82[4] = 1024;
      *(_DWORD *)&v82[6] = v77;
      *(_WORD *)id v83 = 2112;
      *(void *)&v83[2] = v61;
      _os_log_debug_impl(&dword_258723000, v10, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient createANEModelInstanceParameters num proc  : %u %u %@\n", buf, 0x22u);
    }
    if (v77)
    {
      unint64_t v64 = 0;
      uint64_t v11 = (void *)MEMORY[0x263EFFA68];
      while (1)
      {
        __int16 v66 = (void *)[v11 mutableCopy];
        uint64_t v12 = NSString;
        uint64_t v68 = v78[v64];
        int v13 = *(__IOSurface **)(*(void *)(v68 + 16) + 8);
        if (v13) {
          int v13 = (__IOSurface *)IOSurfaceGetBaseAddress(v13);
        }
        if (*(_DWORD *)(v68 + 4)) {
          id v14 = v13;
        }
        else {
          id v14 = 0;
        }
        int v65 = [v12 stringWithUTF8String:v14];
        BOOL v15 = (id)gLogger;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v51 = NSStringFromSelector(a2);
          int v52 = *(_DWORD *)(v68 + 32);
          int v53 = *(_DWORD *)(v68 + 8);
          *(_DWORD *)buf = 138413058;
          unsigned __int8 v80 = v51;
          __int16 v81 = 1024;
          *(_DWORD *)v82 = v52;
          *(_WORD *)&v82[4] = 1024;
          *(_DWORD *)&v82[6] = v53;
          *(_WORD *)id v83 = 2112;
          *(void *)&v83[2] = v65;
          _os_log_debug_impl(&dword_258723000, v15, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient createANEModelInstanceParameters num weights  : %u %u %@\n", buf, 0x22u);
        }
        if (!v65) {
          break;
        }
        if (*(_DWORD *)(v68 + 32))
        {
          uint64_t v16 = 0;
          while (1)
          {
            char v17 = *(unsigned int **)(v68 + 40 + 8 * v16);
            unint64_t v18 = NSString;
            __int16 v19 = *(__IOSurface **)(*((void *)v17 + 4) + 8);
            if (v19) {
              __int16 v19 = (__IOSurface *)IOSurfaceGetBaseAddress(v19);
            }
            if (*v17) {
              __int16 v20 = v19;
            }
            else {
              __int16 v20 = 0;
            }
            id v21 = [v18 stringWithUTF8String:v20];
            __int16 v22 = NSString;
            unint64_t v23 = *(__IOSurface **)(*((void *)v17 + 4) + 8);
            if (v23) {
              unint64_t v23 = (__IOSurface *)IOSurfaceGetBaseAddress(v23);
            }
            uint64_t v24 = v17[1] ? (char *)v23 + *v17 : 0;
            CFStringRef v25 = [v22 stringWithUTF8String:v24];
            uint64_t v26 = [MEMORY[0x263F08850] defaultManager];
            CFStringRef v27 = [(_ANEVirtualPlatformClient *)self guestBuildVersion];
            if (v21 && v25 != 0) {
              break;
            }
            int v29 = 1;
LABEL_60:

            if (v29) {
              goto LABEL_67;
            }
            if (++v16 >= (unint64_t)*(unsigned int *)(v68 + 32)) {
              goto LABEL_62;
            }
          }
          v70 = (void *)[[NSString alloc] initWithFormat:@"%@/%@/%@/%@/", self->_anebaseDirectory, @"tmp", v27, v67];
          id v30 = (id)gLogger;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            char v44 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138413058;
            unsigned __int8 v80 = v44;
            __int16 v81 = 2112;
            *(void *)v82 = v21;
            *(_WORD *)&v82[8] = 2112;
            *(void *)id v83 = v25;
            *(_WORD *)&v83[8] = 2112;
            __int16 v84 = v70;
            _os_log_debug_impl(&dword_258723000, v30, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient createANEModelInstanceParameters weight sym :%@ %@ %@", buf, 0x2Au);
          }
          unsigned __int8 v72 = 0;
          int v32 = [v26 fileExistsAtPath:v70 isDirectory:&v72];
          double v33 = (id)gLogger;
          BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG);
          if (v32)
          {
            if (v34)
            {
              unint64_t v45 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              unsigned __int8 v80 = v45;
              __int16 v81 = 2112;
              *(void *)v82 = v70;
              *(_WORD *)&v82[8] = 1024;
              *(_DWORD *)id v83 = v72;
              _os_log_debug_impl(&dword_258723000, v33, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient Directory already exists %@ isDirectory %d", buf, 0x1Cu);
            }
            id v35 = 0;
            goto LABEL_48;
          }
          if (v34)
          {
            v46 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            unsigned __int8 v80 = v46;
            __int16 v81 = 2112;
            *(void *)v82 = v70;
            *(_WORD *)&v82[8] = 1024;
            *(_DWORD *)id v83 = v72;
            _os_log_debug_impl(&dword_258723000, v33, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient Directory Does not exists %@ isDirectory %d", buf, 0x1Cu);
          }
          id v71 = 0;
          char v36 = [v26 createDirectoryAtPath:v70 withIntermediateDirectories:1 attributes:0 error:&v71];
          id v35 = v71;
          if (v36)
          {
LABEL_48:
            if (![(_ANEVirtualPlatformClient *)self createModelFile:v25 path:v70 ioSID:v17[6] length:v17[5]])
            {
              unint64_t v37 = (id)gLogger;
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                BOOL v47 = NSStringFromSelector(a2);
                *(_DWORD *)buf = 138412546;
                unsigned __int8 v80 = v47;
                __int16 v81 = 2112;
                *(void *)v82 = v25;
                _os_log_error_impl(&dword_258723000, v37, OS_LOG_TYPE_ERROR, "%@ createANEModelInstanceParameters FAILED to create %@", buf, 0x16u);
              }
            }
            CFStringRef v38 = (void *)[[NSString alloc] initWithFormat:@"%@%@", v70, v25];
            if (aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer::getSHACode((aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer *)v17))
            {
              BOOL v39 = [MEMORY[0x263EFF8F8] dataWithBytes:aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer::getSHACode((aneserializers::anemodelnewinstanceparams_v1::_ANEWeightSerializerDeserializer *)v17) length:v17[2]];
              BOOL v40 = (void *)MEMORY[0x263F28090];
              v41 = [NSURL URLWithString:v38];
              uint64_t v42 = [v40 weightWithSymbolAndURLSHA:v21 weightURL:v41 SHACode:v39];
            }
            else
            {
              v43 = (void *)MEMORY[0x263F28090];
              BOOL v39 = [NSURL URLWithString:v38];
              uint64_t v42 = [v43 weightWithSymbolAndURL:v21 weightURL:v39];
            }

            [v66 addObject:v42];
            int v29 = 0;
          }
          else
          {
            uint64_t v42 = (id)gLogger;
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              id v48 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412546;
              unsigned __int8 v80 = v48;
              __int16 v81 = 2112;
              *(void *)v82 = v35;
              _os_log_error_impl(&dword_258723000, v42, OS_LOG_TYPE_ERROR, "%@: ANEVirtualPlatformClient Directory can't be created error %@", buf, 0x16u);
            }
            int v29 = 1;
          }

          goto LABEL_60;
        }
LABEL_62:
        uint64_t v49 = (id)gLogger;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          v54 = NSStringFromSelector(a2);
          int v55 = *(_DWORD *)(v68 + 32);
          *(_DWORD *)buf = 138412802;
          unsigned __int8 v80 = v54;
          __int16 v81 = 2112;
          *(void *)v82 = v65;
          *(_WORD *)&v82[8] = 1024;
          *(_DWORD *)id v83 = v55;
          _os_log_debug_impl(&dword_258723000, v49, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient createANEModelInstanceParameters proc sym :%@ %u\n", buf, 0x1Cu);
        }
        v50 = [MEMORY[0x263F28080] procedureDataWithSymbol:v65 weightArray:v66];
        [v62 addObject:v50];

        ++v64;
        uint64_t v11 = (void *)MEMORY[0x263EFFA68];
        if (v64 >= v77) {
          goto LABEL_68;
        }
      }
LABEL_67:

      id v56 = 0;
      char v57 = 1;
    }
    else
    {
LABEL_68:
      id v56 = [MEMORY[0x263F28070] withProcedureData:v61 procedureArray:v62];
      char v57 = 0;
    }

    aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer::~_ANEModelInstanceParametersSerializerDeserializer((aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer *)v73);
    if (v57)
    {
      id v58 = 0;
      goto LABEL_72;
    }
  }
  else
  {
    id v56 = 0;
  }
  id v56 = v56;
  id v58 = v56;
LABEL_72:

  return v58;
}

- (void)createOptionFilesForCompilation:(VirtANEModel *)a3 aneModelKey:(id)a4 options:(id)a5
{
  id v23 = a4;
  id v8 = a5;
  if (!v8)
  {
    uint64_t v9 = (id)gLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient createOptionFilesForCompilation:aneModelKey:options:].cold.4();
    }
  }
  uint64_t v24 = [(_ANEVirtualPlatformClient *)self guestBuildVersion];
  unint64_t v10 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a3->var52 classType:objc_opt_class() length:a3->var53];
  uint64_t v11 = [MEMORY[0x263F28058] hexStringForString:v10];
  uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"%@/%@/%@/%@/", self->_anebaseDirectory, @"tmp", v24, v11];
  int v13 = [v10 lastPathComponent];
  id v14 = [v13 componentsSeparatedByString:@"."];
  BOOL v15 = [v14 lastObject];
  if ([v15 isEqual:@"hwx"] && a3->var6 && a3->var7 && a3->var8)
  {
    uint64_t v16 = [v12 lastPathComponent];
    uint64_t v21 = [v12 stringByReplacingOccurrencesOfString:v16 withString:&stru_2706C0ED8];

    uint64_t v12 = (void *)v21;
  }
  char v17 = [v8 objectForKeyedSubscript:*MEMORY[0x263F280A0]];
  if (v17)
  {
    BOOL v18 = [(_ANEVirtualPlatformClient *)self createModelFile:v17 path:v12 ioSID:a3->var26 length:a3->var27];
    __int16 v19 = (id)gLogger;
    __int16 v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient createOptionFilesForCompilation:aneModelKey:options:]();
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient createOptionFilesForCompilation:aneModelKey:options:]();
    }
  }
  else
  {
    __int16 v20 = (id)gLogger;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient createOptionFilesForCompilation:aneModelKey:options:]();
    }
  }
}

- (void)createOptionFilesForCompilationDictionary:(__CFDictionary *)a3 aneModelKey:(id)a4 options:(id)a5 modelDirectory:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12)
  {
    id v14 = (id)gLogger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient createOptionFilesForCompilation:aneModelKey:options:].cold.4();
    }
  }
  BOOL v15 = [v12 objectForKeyedSubscript:*MEMORY[0x263F280A0]];
  if (v15)
  {
    if (+[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"compilerOptionFileLength"])
    {
      if (+[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"ioSIDCompilerOptionFile"])
      {
        BOOL v16 = -[_ANEVirtualPlatformClient createModelFile:path:ioSID:length:](self, "createModelFile:path:ioSID:length:", v15, v13);
        char v17 = (id)gLogger;
        BOOL v18 = v17;
        if (v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(a2);
            objc_claimAutoreleasedReturnValue();
            -[_ANEVirtualPlatformClient createOptionFilesForCompilation:aneModelKey:options:]();
          }
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualPlatformClient createOptionFilesForCompilation:aneModelKey:options:]();
        }
      }
      else
      {
        BOOL v18 = (id)gLogger;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualPlatformClient createOptionFilesForCompilationDictionary:aneModelKey:options:modelDirectory:]();
        }
      }
    }
    else
    {
      BOOL v18 = (id)gLogger;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient createOptionFilesForCompilationDictionary:aneModelKey:options:modelDirectory:]();
      }
    }
  }
  else
  {
    BOOL v18 = (id)gLogger;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient createOptionFilesForCompilation:aneModelKey:options:]();
    }
  }
}

- (void)doRemoveModelFile:(VirtANEModel *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263F08850] defaultManager];
  __int16 v22 = [(_ANEVirtualPlatformClient *)self guestBuildVersion];
  BOOL v6 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a3->var52 classType:objc_opt_class() length:a3->var53];
  unint64_t v7 = [MEMORY[0x263F28058] hexStringForString:v6];
  id v8 = (void *)[[NSString alloc] initWithFormat:@"%@/%@/%@/%@/", self->_anebaseDirectory, @"tmp", v22, v7];
  uint64_t v9 = [v6 lastPathComponent];
  unint64_t v10 = [v9 componentsSeparatedByString:@"."];
  id v11 = [v10 lastObject];
  if ([v11 isEqual:@"hwx"] && a3->var6 && a3->var7 && a3->var8)
  {
    id v12 = [v8 lastPathComponent];
    uint64_t v13 = [v8 stringByReplacingOccurrencesOfString:v12 withString:&stru_2706C0ED8];

    id v8 = (void *)v13;
  }
  id v14 = (id)gLogger;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    __int16 v20 = NSStringFromSelector(a2);
    NSTemporaryDirectory();
    *(_DWORD *)buf = 138412802;
    uint64_t v26 = v20;
    v28 = __int16 v27 = 2112;
    __int16 v29 = 2112;
    id v30 = v8;
    __int16 v19 = (void *)v28;
    _os_log_debug_impl(&dword_258723000, v14, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient: NSTemporaryDirectory %@ filePath=%@", buf, 0x20u);
  }
  char v24 = 0;
  if ([v5 fileExistsAtPath:v8 isDirectory:&v24])
  {
    BOOL v15 = (id)gLogger;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient doRemoveModelFile:]();
    }

    id v23 = 0;
    char v16 = [v5 removeItemAtPath:v8 error:&v23];
    id v17 = v23;
    if ((v16 & 1) == 0)
    {
      BOOL v18 = (id)gLogger;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient doRemoveModelFile:]();
      }
    }
  }
  else
  {
    id v17 = 0;
  }
}

- (void)updateVirtualANEModel:(VirtANEModel *)a3 model:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = v7;
  if (a3->var1)
  {
    if (v7)
    {
      uint64_t v9 = [v7 modelAttributes];

      if (v9)
      {
        unint64_t v10 = (void *)MEMORY[0x263F08900];
        id v11 = [v8 modelAttributes];
        id v24 = 0;
        id v12 = [v10 dataWithJSONObject:v11 options:1 error:&v24];
        uint64_t v13 = v24;

        if (v13)
        {
          id v14 = (id)gLogger;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(a2);
            objc_claimAutoreleasedReturnValue();
            -[_ANEVirtualPlatformClient updateVirtualANEModel:model:].cold.5();
          }
        }
        a3->var15 = [v8 programHandle];
        a3->var16 = [v8 intermediateBufferHandle];
        a3->var17 = [v8 queueDepth];
        a3->var21 = [v8 perfStatsMask];
        a3->var25 = [v8 state];
        a3->var20 = [v12 length];
        BOOL v15 = [(_ANEVirtualPlatformClient *)self getIOSurface:a3->var19];
        char v16 = v15;
        if (v15)
        {
          IOSurfaceLock(v15, 0, 0);
          BaseAddress = IOSurfaceGetBaseAddress(v16);
          id v18 = v12;
          memcpy(BaseAddress, (const void *)[v18 bytes], objc_msgSend(v18, "length"));
          IOSurfaceUnlock(v16, 0, 0);
          CFRelease(v16);
        }
        else
        {
          __int16 v19 = (id)gLogger;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            objc_claimAutoreleasedReturnValue();
            -[_ANEVirtualPlatformClient updateVirtualANEModel:model:].cold.4();
          }
        }
        __int16 v20 = (id)gLogger;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          id v21 = (id)objc_claimAutoreleasedReturnValue();
          __int16 v22 = [v8 modelAttributes];
          uint64_t v23 = [v12 length];
          *(_DWORD *)buf = 138412802;
          id v26 = v21;
          __int16 v27 = 2112;
          uint64_t v28 = v22;
          __int16 v29 = 2048;
          uint64_t v30 = v23;
          _os_log_debug_impl(&dword_258723000, v20, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient attribute %@ length %lu", buf, 0x20u);
        }
      }
      else
      {
        uint64_t v13 = (id)gLogger;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualPlatformClient updateVirtualANEModel:model:]();
        }
      }
    }
    else
    {
      uint64_t v13 = (id)gLogger;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient updateVirtualANEModel:model:]();
      }
    }
  }
  else
  {
    uint64_t v13 = (id)gLogger;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient updateVirtualANEModel:model:]();
    }
  }
}

- (void)updateVirtualANEModelDictionary:(__CFDictionary *)a3 model:(id)a4 cacheURLIdentifierToGuest:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = [v8 modelAttributes];

  if (v9)
  {
    unint64_t v10 = (void *)MEMORY[0x263F08900];
    id v11 = [v8 modelAttributes];
    id v48 = 0;
    id v41 = [v10 dataWithJSONObject:v11 options:1 error:&v48];
    id v12 = v48;

    if (v12)
    {
      uint64_t v13 = (id)gLogger;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient updateVirtualANEModel:model:].cold.5();
      }
    }
    if (v5)
    {
      id v14 = [v8 cacheURLIdentifier];
      BOOL v15 = v14 == 0;

      if (!v15)
      {
        char v16 = [v8 cacheURLIdentifier];

        if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
          -[_ANEVirtualPlatformClient updateVirtualANEModelDictionary:model:cacheURLIdentifierToGuest:].cold.7();
        }
        CFDictionarySetValue(a3, @"modelCacheURLIdentifier", v16);
      }
    }
    CFDictionaryRemoveValue(a3, @"programHandle");
    uint64_t valuePtr = [v8 programHandle];
    CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFNumberRef v18 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
    CFDictionarySetValue(a3, @"programHandle", v18);
    CFRelease(v18);
    CFDictionaryRemoveValue(a3, @"intermediateBufferHandle");
    uint64_t v46 = [v8 intermediateBufferHandle];
    CFNumberRef v19 = CFNumberCreate(v17, kCFNumberSInt64Type, &v46);
    CFDictionarySetValue(a3, @"intermediateBufferHandle", v19);
    CFRelease(v19);
    CFDictionaryRemoveValue(a3, @"queueDepth");
    char v45 = [v8 queueDepth];
    CFNumberRef v20 = CFNumberCreate(v17, kCFNumberSInt8Type, &v45);
    CFDictionarySetValue(a3, @"queueDepth", v20);
    CFRelease(v20);
    CFDictionaryRemoveValue(a3, @"perfStatsMask");
    int v44 = [v8 perfStatsMask];
    CFNumberRef v21 = CFNumberCreate(v17, kCFNumberSInt32Type, &v44);
    CFDictionarySetValue(a3, @"perfStatsMask", v21);
    CFRelease(v21);
    CFDictionaryRemoveValue(a3, @"state");
    int v43 = [v8 state];
    CFNumberRef v22 = CFNumberCreate(v17, kCFNumberSInt32Type, &v43);
    CFDictionarySetValue(a3, @"state", v22);
    CFRelease(v22);
    uint64_t v23 = [v8 getCacheURLIdentifier];
    id v24 = (id)gLogger;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient updateVirtualANEModelDictionary:model:cacheURLIdentifierToGuest:].cold.6();
    }

    if (CFDictionaryContainsKey(a3, @"ioSIDModelParameters") && v23)
    {
      unint64_t v25 = *(void *)+[_ANEVirtualPlatformClient dictionaryGetDataBytesForKey:a3 key:@"ioSIDModelParameters"];
      *(void *)buf = v25;
      id v26 = operator new(0x28uLL);
      v26[1] = 0;
      v26[2] = 0;
      *id v26 = &unk_2706C0DD8;
      *((unsigned char *)v26 + 24) = 0;
      getIOSurface(HIDWORD(v25), &_os_log_internal);
      v26[4] = 0;
      *(void *)&buf[8] = v26 + 3;
      *(void *)&buf[16] = v26;
      __int16 v27 = (id)gLogger;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient updateVirtualANEModelDictionary:model:cacheURLIdentifierToGuest:].cold.5();
      }

      id v28 = v23;
      aneserializers::anemodelparams_v1::_ANEModelParamsSerializerDeserializer::populateCacheURLIdentifier((aneserializers::anemodelparams_v1::_ANEModelParamsSerializerDeserializer *)buf, (const char *)[v28 UTF8String], objc_msgSend(v28, "length"));
      __int16 v29 = (id)gLogger;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient updateVirtualANEModelDictionary:model:cacheURLIdentifierToGuest:].cold.4();
      }

      if (*(void *)&buf[16]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[16]);
      }
    }
    CFDictionaryRemoveValue(a3, @"modelAttributeLength");
    uint64_t v42 = [v41 length];
    CFNumberRef v30 = CFNumberCreate(v17, kCFNumberSInt64Type, &v42);
    CFDictionarySetValue(a3, @"modelAttributeLength", v30);
    CFRelease(v30);
    if (v42)
    {
      uint64_t v31 = [(_ANEVirtualPlatformClient *)self getIOSurface:+[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"ioSIDModelAttributes"]];
      int v32 = v31;
      if (v31)
      {
        IOSurfaceLock(v31, 0, 0);
        BaseAddress = IOSurfaceGetBaseAddress(v32);
        id v34 = v41;
        memcpy(BaseAddress, (const void *)[v34 bytes], objc_msgSend(v34, "length"));
        IOSurfaceUnlock(v32, 0, 0);
        CFRelease(v32);
      }
      else
      {
        char v36 = (id)gLogger;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualPlatformClient updateVirtualANEModelDictionary:model:cacheURLIdentifierToGuest:]();
        }
      }
      id v35 = (id)gLogger;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        CFStringRef v38 = [v8 modelAttributes];
        uint64_t v39 = [v41 length];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v37;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v38;
        *(_WORD *)&buf[22] = 2048;
        uint64_t v50 = v39;
        _os_log_debug_impl(&dword_258723000, v35, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient attribute %@ dataLength %lu", buf, 0x20u);
      }
    }
    else
    {
      id v35 = (id)gLogger;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient updateVirtualANEModelDictionary:model:cacheURLIdentifierToGuest:]();
      }
    }
  }
  else
  {
    id v12 = (id)gLogger;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient updateVirtualANEModel:model:]();
    }
  }
}

- (void)updatePerformanceStats:(VirtANEModel *)a3 aneRequest:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = [v7 perfStats];
  a3->unint64_t var49 = [v8 hwExecutionTime];

  uint64_t v9 = [v7 perfStats];
  unint64_t v10 = [v9 perfCounterData];
  a3->unint64_t var51 = [v10 length];

  id v11 = [(_ANEVirtualPlatformClient *)self getIOSurface:a3->var50];
  id v12 = (id)gLogger;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    CFNumberRef v19 = NSStringFromSelector(a2);
    unint64_t var49 = a3->var49;
    unint64_t var51 = a3->var51;
    int v22 = 138412802;
    uint64_t v23 = v19;
    __int16 v24 = 2048;
    unint64_t v25 = var49;
    __int16 v26 = 2048;
    unint64_t v27 = var51;
    _os_log_debug_impl(&dword_258723000, v12, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient hwExecutionTime=%lld length=%lld", (uint8_t *)&v22, 0x20u);
  }
  IOSurfaceLock(v11, 0, 0);
  BaseAddress = IOSurfaceGetBaseAddress(v11);
  id v14 = [v7 perfStats];
  id v15 = [v14 perfCounterData];
  char v16 = (const void *)[v15 bytes];
  CFAllocatorRef v17 = [v7 perfStats];
  CFNumberRef v18 = [v17 perfCounterData];
  memcpy(BaseAddress, v16, [v18 length]);

  IOSurfaceUnlock(v11, 0, 0);
  CFRelease(v11);
}

- (void)updatePerformanceStatsDictionary:(__CFDictionary *)a3 aneRequest:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a4;
  CFDictionaryRemoveValue(a3, @"hwExecutionTime");
  id v8 = [v7 perfStats];
  uint64_t v9 = [v8 hwExecutionTime];

  uint64_t valuePtr = v9;
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  CFDictionarySetValue(a3, @"hwExecutionTime", v11);
  CFRelease(v11);
  CFDictionaryRemoveValue(a3, @"performanceStatsLength");
  id v12 = objc_msgSend(v7, "perfStats", 0);
  uint64_t v13 = [v12 perfCounterData];
  uint64_t v14 = [v13 length];

  uint64_t v25 = v14;
  CFNumberRef v15 = CFNumberCreate(v10, kCFNumberSInt64Type, &v25);
  CFDictionarySetValue(a3, @"performanceStatsLength", v15);
  CFRelease(v15);
  char v16 = [(_ANEVirtualPlatformClient *)self getIOSurface:+[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"ioSIDPerformanceStatsIndex"]];
  CFAllocatorRef v17 = (id)gLogger;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    __int16 v24 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v28 = v24;
    __int16 v29 = 2048;
    uint64_t v30 = valuePtr;
    __int16 v31 = 2048;
    uint64_t v32 = v25;
    _os_log_debug_impl(&dword_258723000, v17, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient hwExecutionTime=%lld length=%lld", buf, 0x20u);
  }
  IOSurfaceLock(v16, 0, 0);
  BaseAddress = IOSurfaceGetBaseAddress(v16);
  CFNumberRef v19 = [v7 perfStats];
  id v20 = [v19 perfCounterData];
  CFNumberRef v21 = (const void *)[v20 bytes];
  int v22 = [v7 perfStats];
  uint64_t v23 = [v22 perfCounterData];
  memcpy(BaseAddress, v21, [v23 length]);

  IOSurfaceUnlock(v16, 0, 0);
  CFRelease(v16);
}

- (void)updateErrorValue:(VirtANEModel *)a3 error:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    id v8 = (id)gLogger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient updateErrorValue:error:]();
    }

    a3->var46 = [v7 code];
    uint64_t v9 = [v7 userInfo];
    CFAllocatorRef v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F08320]];

    CFNumberRef v11 = [MEMORY[0x263F08910] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:0];
    id v12 = v11;
    if (v10 && v11)
    {
      a3->var47 = [v11 length];
      uint64_t v13 = [(_ANEVirtualPlatformClient *)self getIOSurface:a3->var48];
      IOSurfaceLock(v13, 0, 0);
      BaseAddress = IOSurfaceGetBaseAddress(v13);
      id v15 = v12;
      memcpy(BaseAddress, (const void *)[v15 bytes], objc_msgSend(v15, "length"));
      IOSurfaceUnlock(v13, 0, 0);
      CFRelease(v13);
    }
    else
    {
      a3->var47 = 0;
    }
  }
}

- (void)updateErrorValueDictionary:(__CFDictionary *)a3 error:(id)a4
{
  v21[5] = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (v7)
  {
    id v8 = (id)gLogger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient updateErrorValue:error:]();
    }

    CFDictionaryRemoveValue(a3, @"errorCode");
    uint64_t valuePtr = [v7 code];
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFNumberRef v10 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
    CFDictionarySetValue(a3, @"errorCode", v10);
    CFRelease(v10);
    CFNumberRef v11 = [v7 userInfo];
    id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F08320]];

    uint64_t v13 = [MEMORY[0x263F08910] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
    uint64_t v14 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"ioSIDErrorValue"];
    if (v14)
    {
      id v15 = [(_ANEVirtualPlatformClient *)self getIOSurface:v14];
      CFDictionaryRemoveValue(a3, @"errorLength");
      if (v15)
      {
        IOSurfaceLock(v15, 0, 0);
        BaseAddress = IOSurfaceGetBaseAddress(v15);
        id v17 = v13;
        memcpy(BaseAddress, (const void *)[v17 bytes], objc_msgSend(v17, "length"));
        IOSurfaceUnlock(v15, 0, 0);
        CFRelease(v15);
        v21[0] = [v17 length];
      }
      else
      {
        v21[0] = 0;
      }
      CFNumberRef v18 = CFNumberCreate(v9, kCFNumberSInt64Type, v21);
      CFDictionarySetValue(a3, @"errorLength", v18);
      CFRelease(v18);
    }
    else
    {
      CFNumberRef v19 = (id)gLogger;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient updateErrorValueDictionary:error:]();
      }
    }
  }
}

- (void)doModelAttributeUpdate:(id)a3 virtualANEModel:(VirtANEModel *)a4
{
  id v7 = a3;
  BOOL v6 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:a4->var19 classType:objc_opt_class() length:a4->var20];
  [v7 setPerfStatsMask:a4->var21];
  objc_msgSend(v7, "setString_id:", a4->var14);
  [v7 updateModelAttributes:v6 state:a4->var25 programHandle:a4->var15 intermediateBufferHandle:a4->var16 queueDepth:a4->var17];
}

- (void)doModelAttributeUpdateDictionary:(id)a3 dictionary:(__CFDictionary *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  unint64_t v8 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a4 key:@"modelAttributeLength"];
  if (!v8)
  {
    CFNumberRef v18 = (id)gLogger;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient updateVirtualANEModelDictionary:model:cacheURLIdentifierToGuest:]();
    }
    goto LABEL_10;
  }
  unint64_t v9 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a4 key:@"ioSIDModelAttributes"];
  if (!v9)
  {
    CFNumberRef v18 = (id)gLogger;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient doModelAttributeUpdateDictionary:dictionary:]();
    }
LABEL_10:

    CFNumberRef v10 = 0;
    goto LABEL_11;
  }
  CFNumberRef v10 = [(_ANEVirtualPlatformClient *)self getObjectFromIOSurfaceID:v9 classType:objc_opt_class() length:v8];
  unint64_t v11 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a4 key:@"perfStatsMask"];
  [v7 setPerfStatsMask:v11];
  unsigned int v12 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a4 key:@"string_id"];
  objc_msgSend(v7, "setString_id:", v12);
  unsigned int v13 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a4 key:@"state"];
  unint64_t v14 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a4 key:@"programHandle"];
  unint64_t v15 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a4 key:@"intermediateBufferHandle"];
  uint64_t v16 = +[_ANEVirtualPlatformClient dictionaryGetInt8ForKey:a4 key:@"queueDepth"];
  id v17 = (id)gLogger;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    CFNumberRef v19 = NSStringFromSelector(a2);
    int v20 = 138413570;
    CFNumberRef v21 = v19;
    __int16 v22 = 1024;
    int v23 = v11;
    __int16 v24 = 1024;
    unsigned int v25 = v12;
    __int16 v26 = 1024;
    unsigned int v27 = v13;
    __int16 v28 = 2048;
    unint64_t v29 = v14;
    __int16 v30 = 2048;
    unint64_t v31 = v15;
    _os_log_debug_impl(&dword_258723000, v17, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient doModelAttributeUpdateDictionary %u %u %u %llu %llu!", (uint8_t *)&v20, 0x32u);
  }
  [v7 updateModelAttributes:v10 state:v13 programHandle:v14 intermediateBufferHandle:v15 queueDepth:v16];
LABEL_11:
}

- (void)getDeviceInfo:(DeviceInfo *)a3
{
  a3->var3 = [MEMORY[0x263F28048] hasANE];
  a3->var2 = [MEMORY[0x263F28048] aneBoardType];
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
    -[_ANEVirtualPlatformClient getDeviceInfo:]();
  }
}

- (void)storeGuestBuildVersion:(BuildVersionInfoLegacy *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v4 = [NSString stringWithUTF8String:a3->var1];
  BOOL v5 = [v4 stringByReplacingOccurrencesOfString:@" " withString:&stru_2706C0ED8];
  guestBuildVersion = self->_guestBuildVersion;
  self->_guestBuildVersion = v5;

  self->_negotiatedDataInterfaceVersion = 0x10000;
  self->_negotiatedCapabilityMask = 0;
  id v7 = (id)gLogger;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v8 = [(_ANEVirtualPlatformClient *)self guestBuildVersion];
    int v9 = 138412802;
    CFNumberRef v10 = v8;
    __int16 v11 = 1024;
    unsigned int v12 = [(_ANEVirtualPlatformClient *)self negotiatedDataInterfaceVersion];
    __int16 v13 = 2048;
    unint64_t v14 = [(_ANEVirtualPlatformClient *)self negotiatedCapabilityMask];
    _os_log_debug_impl(&dword_258723000, v7, OS_LOG_TYPE_DEBUG, "ANEVirtualPlatformClient Guest used legacy interface guestBuildVersion=%@ : guestDataInterfaceVersion=0x%x : guestCapability=0x%llx", (uint8_t *)&v9, 0x1Cu);
  }
}

- (void)exchangeBuildVersionInfo:(BuildVersionInfo *)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (self->_avpSaveRestoreSupported)
  {
    if (a3->var0 <= 0x20300) {
      unint64_t v6 = 6;
    }
    else {
      unint64_t v6 = 14;
    }
  }
  else
  {
    unint64_t v6 = 6;
  }
  id v7 = [NSString stringWithUTF8String:a3->var3];
  unint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@" " withString:&stru_2706C0ED8];
  guestBuildVersion = self->_guestBuildVersion;
  self->_guestBuildVersion = v8;

  unsigned int var0 = a3->var0;
  if (a3->var0 >= 0x20400) {
    unsigned int var0 = 132096;
  }
  self->_unsigned int negotiatedDataInterfaceVersion = var0;
  self->_unint64_t negotiatedCapabilityMask = a3->var2 & v6;
  __int16 v11 = gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
  {
    unsigned int negotiatedDataInterfaceVersion = self->_negotiatedDataInterfaceVersion;
    int v23 = self->_guestBuildVersion;
    unint64_t negotiatedCapabilityMask = self->_negotiatedCapabilityMask;
    unsigned int v25 = a3->var0;
    unint64_t var2 = a3->var2;
    *(_DWORD *)buf = 138413826;
    __int16 v28 = v23;
    __int16 v29 = 1024;
    unsigned int v30 = negotiatedDataInterfaceVersion;
    __int16 v31 = 2048;
    unint64_t v32 = negotiatedCapabilityMask;
    __int16 v33 = 1024;
    unsigned int v34 = v25;
    __int16 v35 = 2048;
    unint64_t v36 = var2;
    __int16 v37 = 1024;
    int v38 = 132096;
    __int16 v39 = 2048;
    unint64_t v40 = v6;
    _os_log_debug_impl(&dword_258723000, v11, OS_LOG_TYPE_DEBUG, "ANEVirtualPlatformClient exchangeBuildVersionInfo Hand-shaking complete: guestBuildVersion=%@ negotiatedDataInterfaceVersion=0x%x negotiatedCapabilityMask=0x%llx guestDataInterfaceVersion=0x%x guestCapabilityMask=0x%llx hostDataInterfaceVersion=0x%x hostCapabilityMask=0x%llx", buf, 0x3Cu);
  }
  unsigned int v12 = [MEMORY[0x263F28048] productName];
  __int16 v13 = v12;
  if (!v12 || [v12 isEqualToString:&stru_2706C0ED8])
  {
    unint64_t v14 = (id)gLogger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient exchangeBuildVersionInfo:]();
    }

    __int16 v13 = 0;
  }
  uint64_t v15 = [MEMORY[0x263F28048] buildVersion];
  uint64_t v16 = v15;
  if (!v15 || [v15 isEqualToString:&stru_2706C0ED8])
  {
    id v17 = (id)gLogger;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient exchangeBuildVersionInfo:]();
    }

    uint64_t v16 = 0;
    goto LABEL_20;
  }
  if (!v13)
  {
LABEL_20:
    CFNumberRef v18 = @"UnknownBuild";
    goto LABEL_21;
  }
  CFNumberRef v18 = [NSString stringWithFormat:@"%@%@", v13, v16];
LABEL_21:
  CFNumberRef v19 = v18;
  int v20 = (const void *)[(__CFString *)v19 UTF8String];
  CFNumberRef v21 = (id)gLogger;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient exchangeBuildVersionInfo:]();
  }

  memcpy(a3->var3, v20, [(__CFString *)v19 length]);
  a3->var4 = [(__CFString *)v19 length];
  a3->unsigned int var0 = 132096;
  a3->unint64_t var2 = v6;
  a3->unint64_t var6 = ANEGetValidateNetworkSupportedVersion();
}

- (void)copyToIOSurface:(id)a3 ioSID:(unsigned int)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!a4)
  {
    __int16 v13 = (id)gLogger;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient copyToIOSurface:ioSID:]();
    }
    goto LABEL_10;
  }
  unint64_t v8 = [(_ANEVirtualPlatformClient *)self getIOSurface:a4];
  int v9 = v8;
  if (!v8)
  {
    __int16 v13 = (id)gLogger;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient copyToIOSurface:ioSID:]();
    }
LABEL_10:

    goto LABEL_11;
  }
  IOSurfaceLock(v8, 0, 0);
  BaseAddress = IOSurfaceGetBaseAddress(v9);
  id v11 = v7;
  memcpy(BaseAddress, (const void *)[v11 bytes], objc_msgSend(v11, "length"));
  unsigned int v12 = (id)gLogger;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v14 = NSStringFromSelector(a2);
    int v15 = 138412802;
    uint64_t v16 = v14;
    __int16 v17 = 2048;
    uint64_t v18 = [v11 length];
    __int16 v19 = 1024;
    unsigned int v20 = a4;
    _os_log_debug_impl(&dword_258723000, v12, OS_LOG_TYPE_DEBUG, "%@ ANEVirtualClient data in bytes %lu IOSID: %u\n", (uint8_t *)&v15, 0x1Cu);
  }
  IOSurfaceUnlock(v9, 0, 0);
  CFRelease(v9);
LABEL_11:
}

- (void)copyBytesToIOSurface:(char *)a3 dataLength:(unsigned int)a4 ioSID:(unsigned int)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!a5)
  {
    __int16 v13 = (id)gLogger;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient copyToIOSurface:ioSID:]();
    }
    goto LABEL_11;
  }
  int v9 = [(_ANEVirtualPlatformClient *)self getIOSurface:a5];
  if (!v9)
  {
    __int16 v13 = (id)gLogger;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient copyToIOSurface:ioSID:]();
    }
LABEL_11:

    return;
  }
  CFNumberRef v10 = v9;
  IOSurfaceLock(v9, 0, 0);
  BaseAddress = IOSurfaceGetBaseAddress(v10);
  memcpy(BaseAddress, a3, a4);
  unsigned int v12 = (id)gLogger;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v14 = NSStringFromSelector(a2);
    int v15 = 138412802;
    uint64_t v16 = v14;
    __int16 v17 = 2048;
    uint64_t v18 = a4;
    __int16 v19 = 1024;
    unsigned int v20 = a5;
    _os_log_debug_impl(&dword_258723000, v12, OS_LOG_TYPE_DEBUG, "%@ ANEVirtualClient data in bytes %lu IOSID: %u\n", (uint8_t *)&v15, 0x1Cu);
  }
  IOSurfaceUnlock(v10, 0, 0);
  CFRelease(v10);
}

+ (void)printStruct:(VirtANEModel *)a3
{
  if (a3)
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      +[_ANEVirtualPlatformClient printStruct:]();
    }
  }
}

- (void)getBytesFromIOSurfaceID:(unsigned int)a3 dest:(char *)a4 dataLength:(unint64_t)a5
{
  id v7 = [(_ANEVirtualPlatformClient *)self getIOSurface:a3];
  if (v7)
  {
    unint64_t v8 = v7;
    IOSurfaceLock(v7, 0, 0);
    BaseAddress = IOSurfaceGetBaseAddress(v8);
    memcpy(a4, BaseAddress, a5);
    IOSurfaceUnlock(v8, 0, 0);
    CFRelease(v8);
  }
  else if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
  {
    -[_ANEVirtualPlatformClient getBytesFromIOSurfaceID:dest:dataLength:]();
  }
}

- (void)callCFDictionaryMethod:(AppleVirtIONeuralEngineCFData *)a3
{
  errorString[14] = *(CFStringRef *)MEMORY[0x263EF8340];
  unint64_t v6 = (id)gLogger;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient callCFDictionaryMethod:].cold.7();
  }

  size_t var4 = a3->var4;
  unint64_t v8 = (const char *)operator new[](var4, MEMORY[0x263F8C180]);
  int v9 = v8;
  if (!var4 || v8)
  {
    [(_ANEVirtualPlatformClient *)self getBytesFromIOSurfaceID:a3->var2 dest:v8 dataLength:var4];
    errorString[0] = 0;
    CFTypeRef v12 = IOCFUnserializeBinary(v9, a3->var4, 0, 0, errorString);
    [(_ANEVirtualPlatformClient *)self printDictionary:v12];
    if (v12)
    {
      int v13 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:v12 key:@"command"];
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
        -[_ANEVirtualPlatformClient callCFDictionaryMethod:].cold.5();
      }
      switch(v13)
      {
        case 1:
          [(_ANEVirtualPlatformClient *)self compileModelDictionary:v12];
          break;
        case 2:
          [(_ANEVirtualPlatformClient *)self loadModelDictionary:v12];
          break;
        case 3:
          [(_ANEVirtualPlatformClient *)self unLoadModelDictionary:v12];
          break;
        case 4:
          [(_ANEVirtualPlatformClient *)self evaluateWithModelDictionary:v12];
          break;
        case 5:
          [(_ANEVirtualPlatformClient *)self compiledModelExistsForDictionary:v12];
          break;
        case 6:
          [(_ANEVirtualPlatformClient *)self purgeCompiledModelDictionary:v12];
          break;
        case 7:
          [(_ANEVirtualPlatformClient *)self compiledModelExistsMatchingHashDictionary:v12];
          break;
        case 8:
          [(_ANEVirtualPlatformClient *)self purgeCompiledModelMatchingHashDictionary:v12];
          break;
        case 11:
          [(_ANEVirtualPlatformClient *)self echoDictionary:v12];
          break;
        case 19:
          [(_ANEVirtualPlatformClient *)self validateNetworkCreate:v12];
          break;
        case 20:
          [(_ANEVirtualPlatformClient *)self getDeviceInfoDictionary:v12];
          break;
        case 21:
          [(_ANEVirtualPlatformClient *)self loadModelNewInstanceDictionary:v12];
          break;
        default:
          int v15 = (id)gLogger;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            objc_claimAutoreleasedReturnValue();
            -[_ANEVirtualPlatformClient callCFDictionaryMethod:].cold.4();
          }

          a3->int64_t var1 = -536870911;
          break;
      }
      CFDataRef v16 = IOCFSerialize(v12, 0);
      CFRelease(v12);
      if (v16)
      {
        BytePtr = CFDataGetBytePtr(v16);
        [(_ANEVirtualPlatformClient *)self copyBytesToIOSurface:BytePtr dataLength:CFDataGetLength(v16) ioSID:a3->var3];
        a3->var5 = CFDataGetLength(v16);
        CFRelease(v16);
      }
      else
      {
        uint64_t v18 = (id)gLogger;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualPlatformClient callCFDictionaryMethod:]();
        }

        a3->var5 = 0;
      }
      unint64_t v14 = (id)gLogger;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient callCFDictionaryMethod:]();
      }
    }
    else
    {
      unint64_t v14 = (id)gLogger;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient callCFDictionaryMethod:]();
      }
    }

    if (v9) {
      MEMORY[0x25A2CB6D0](v9, 0x1000C4077774924);
    }
  }
  else
  {
    CFNumberRef v10 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
      [(_ANEVirtualPlatformClient *)(uint64_t *)&a3->var4 callCFDictionaryMethod:v11];
    }
  }
}

- (void)asyncAvpHoldMessageReceived:(AppleVirtIONeuralEngineCFData *)a3
{
  unint64_t v6 = (id)gLogger;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient asyncAvpHoldMessageReceived:]();
  }

  self->_negotiatedCapabilityMask &= ~8uLL;
  a3->int64_t var1 = -536870911;
}

- (id)requestWithVirtualANEModel:(VirtANEModel *)a3
{
  BOOL v5 = objc_opt_new();
  if (!a3->var40)
  {
LABEL_5:
    unint64_t v8 = objc_opt_new();
    if (a3->var41)
    {
      unint64_t v9 = 0;
      do
      {
        CFNumberRef v10 = [NSNumber numberWithUnsignedInt:a3->var31[v9]];
        [v8 addObject:v10];

        ++v9;
      }
      while (v9 < a3->var41);
    }
    uint64_t v11 = objc_opt_new();
    __int16 v29 = v11;
    if (a3->var42)
    {
      uint64_t v12 = 0;
      while (1)
      {
        int v13 = [(_ANEVirtualPlatformClient *)self objectWithIOSurfaceID:a3->var32[v12]];
        if (!v13) {
          break;
        }
        [v11 addObject:v13];

        if (++v12 >= (unint64_t)a3->var42) {
          goto LABEL_12;
        }
      }
      unint64_t v14 = (id)gLogger;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient requestWithVirtualANEModel:].cold.4();
      }
      uint64_t v21 = 0;
      goto LABEL_35;
    }
LABEL_12:
    unint64_t v14 = objc_opt_new();
    if (a3->var43)
    {
      unint64_t v15 = 0;
      do
      {
        CFDataRef v16 = [NSNumber numberWithUnsignedInt:a3->var33[v15]];
        [v14 addObject:v16];

        ++v15;
      }
      while (v15 < a3->var43);
    }
    unsigned int v27 = [(_ANEVirtualPlatformClient *)self objectWithIOSurfaceID:a3->var34];
    if (!v27)
    {
      __int16 v17 = (id)gLogger;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient requestWithVirtualANEModel:]();
      }
    }
    if (a3->var39)
    {
      unsigned int v30 = objc_opt_new();
      if (a3->var39)
      {
        uint64_t v18 = 0;
        while (1)
        {
          __int16 v19 = [(_ANEVirtualPlatformClient *)self objectWithIOSurfaceID:a3->var37[v18]];
          if (!v19) {
            break;
          }
          unsigned int v20 = [MEMORY[0x263F28078] objectWithIOSurface:v19 statType:a3->var38[v18]];
          if (!v20)
          {
            __int16 v26 = (id)gLogger;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              objc_claimAutoreleasedReturnValue();
              -[_ANEVirtualPlatformClient requestWithVirtualANEModel:]();
            }

            uint64_t v21 = 0;
            int v23 = v19;
            goto LABEL_34;
          }
          [v30 addObject:v20];

          if (++v18 >= (unint64_t)a3->var39) {
            goto LABEL_33;
          }
        }
        int v23 = (id)gLogger;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualPlatformClient requestWithVirtualANEModel:]();
        }
        uint64_t v21 = 0;
        goto LABEL_34;
      }
    }
    else
    {
      unsigned int v30 = 0;
    }
LABEL_33:
    __int16 v22 = (void *)MEMORY[0x263F28088];
    int v23 = [NSNumber numberWithUnsignedLongLong:a3->var35];
    __int16 v24 = [NSNumber numberWithUnsignedLongLong:a3->var36];
    uint64_t v21 = [v22 requestWithInputs:v5 inputIndices:v8 outputs:v29 outputIndices:v14 weightsBuffer:v27 perfStats:v30 procedureIndex:v23 sharedEvents:0 transactionHandle:v24];

LABEL_34:
LABEL_35:

    goto LABEL_36;
  }
  uint64_t v6 = 0;
  while (1)
  {
    id v7 = [(_ANEVirtualPlatformClient *)self objectWithIOSurfaceID:a3->var30[v6]];
    if (!v7) {
      break;
    }
    [v5 addObject:v7];

    if (++v6 >= (unint64_t)a3->var40) {
      goto LABEL_5;
    }
  }
  unint64_t v8 = (id)gLogger;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualPlatformClient requestWithVirtualANEModel:].cold.5();
  }
  uint64_t v21 = 0;
LABEL_36:

  return v21;
}

- (id)requestWithVirtualANEModelDictionary:(__CFDictionary *)a3
{
  uint64_t v46 = objc_opt_new();
  int v4 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"inputArrayCount"];
  if (v4)
  {
    uint64_t v5 = 0;
    while (1)
    {
      CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"inputArray%u", v5);
      unint64_t v7 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:v6];
      CFRelease(v6);
      unint64_t v8 = [(_ANEVirtualPlatformClient *)self objectWithIOSurfaceID:v7];
      if (!v8) {
        break;
      }
      [v46 addObject:v8];

      uint64_t v5 = (v5 + 1);
      if (v4 == v5) {
        goto LABEL_5;
      }
    }
    BOOL v47 = (id)gLogger;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualPlatformClient requestWithVirtualANEModel:].cold.5();
    }
    unsigned int v34 = 0;
  }
  else
  {
LABEL_5:
    BOOL v47 = objc_opt_new();
    int v9 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"inputArrayCount"];
    if (v9)
    {
      uint64_t v10 = 0;
      do
      {
        CFStringRef v11 = CFStringCreateWithFormat(0, 0, @"inputIndexArray%u", v10);
        unint64_t v12 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:v11];
        CFRelease(v11);
        int v13 = [NSNumber numberWithUnsignedInt:v12];
        [v47 addObject:v13];

        uint64_t v10 = (v10 + 1);
      }
      while (v9 != v10);
    }
    char v45 = objc_opt_new();
    int v14 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"outputArrayCount"];
    if (v14)
    {
      uint64_t v15 = 0;
      while (1)
      {
        CFStringRef v16 = CFStringCreateWithFormat(0, 0, @"outputArray%u", v15);
        unint64_t v17 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:v16];
        CFRelease(v16);
        uint64_t v18 = [(_ANEVirtualPlatformClient *)self objectWithIOSurfaceID:v17];
        if (!v18) {
          break;
        }
        [v45 addObject:v18];

        uint64_t v15 = (v15 + 1);
        if (v14 == v15) {
          goto LABEL_12;
        }
      }
      __int16 v19 = (id)gLogger;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualPlatformClient requestWithVirtualANEModel:].cold.5();
      }
      unsigned int v34 = 0;
    }
    else
    {
LABEL_12:
      __int16 v19 = objc_opt_new();
      int v20 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"outputArrayCount"];
      if (v20)
      {
        uint64_t v21 = 0;
        do
        {
          CFStringRef v22 = CFStringCreateWithFormat(0, 0, @"outputIndexArray%u", v21);
          unint64_t v23 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:v22];
          CFRelease(v22);
          __int16 v24 = [NSNumber numberWithUnsignedInt:v23];
          [v19 addObject:v24];

          uint64_t v21 = (v21 + 1);
        }
        while (v20 != v21);
      }
      uint64_t v42 = [(_ANEVirtualPlatformClient *)self objectWithIOSurfaceID:+[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"ioSIDWeightsBufferIndex"]];
      if (!v42)
      {
        unsigned int v25 = (id)gLogger;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualPlatformClient requestWithVirtualANEModel:]();
        }
      }
      int v26 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"perfStatsCount"];
      if (v26)
      {
        int v44 = objc_opt_new();
        uint64_t v27 = 0;
        while (1)
        {
          CFStringRef v28 = CFStringCreateWithFormat(0, 0, @"ioSIDPerfStats%d", v27);
          unint64_t v29 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:v28];
          CFRelease(v28);
          unsigned int v30 = [(_ANEVirtualPlatformClient *)self objectWithIOSurfaceID:v29];
          if (!v30) {
            break;
          }
          CFStringRef v31 = CFStringCreateWithFormat(0, 0, @"perfStatsType%d", v27);
          unsigned int v32 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:v31];
          CFRelease(v31);
          __int16 v33 = [MEMORY[0x263F28078] objectWithIOSurface:v30 statType:v32];
          if (!v33)
          {
            unint64_t v40 = (id)gLogger;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              objc_claimAutoreleasedReturnValue();
              -[_ANEVirtualPlatformClient requestWithVirtualANEModel:]();
            }

            unsigned int v34 = 0;
            int v38 = v30;
            goto LABEL_39;
          }
          [v44 addObject:v33];

          uint64_t v27 = (v27 + 1);
          if (v26 == v27) {
            goto LABEL_32;
          }
        }
        int v38 = (id)gLogger;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualPlatformClient requestWithVirtualANEModel:]();
        }
        unsigned int v34 = 0;
      }
      else
      {
        int v44 = 0;
LABEL_32:
        unint64_t v35 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"procedureIndex"];
        unint64_t v36 = +[_ANEVirtualPlatformClient dictionaryGetUInt64ForKey:a3 key:@"transactionHandle"];
        __int16 v37 = (void *)MEMORY[0x263F28088];
        int v38 = [NSNumber numberWithUnsignedLongLong:v35];
        __int16 v39 = [NSNumber numberWithUnsignedLongLong:v36];
        unsigned int v34 = [v37 requestWithInputs:v46 inputIndices:v47 outputs:v45 outputIndices:v19 weightsBuffer:v42 perfStats:v44 procedureIndex:v38 sharedEvents:0 transactionHandle:v39];
      }
LABEL_39:
    }
  }

  return v34;
}

+ (__CFDictionary)prepareValidationResultForSerialization:(__CFDictionary *)a3
{
  if (!a3) {
    return 0;
  }
  unint64_t Count = CFDictionaryGetCount(a3);
  if (!Count) {
    return 0;
  }
  uint64_t v5 = Count;
  if (Count >> 61) {
    size_t v6 = -1;
  }
  else {
    size_t v6 = 8 * Count;
  }
  unint64_t v7 = (const void **)operator new[](v6, MEMORY[0x263F8C180]);
  unint64_t v8 = v7;
  if (v5 >= 1 && !v7)
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
      +[_ANEVirtualPlatformClient prepareValidationResultForSerialization:]();
    }
    return 0;
  }
  CFStringRef v11 = (const void **)operator new[](v6, MEMORY[0x263F8C180]);
  unint64_t v12 = v11;
  if (v5 < 1 || v11)
  {
    CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, a3);
    CFRelease(a3);
    CFDictionaryGetKeysAndValues(MutableCopy, v8, v12);
    if (v5 >= 1)
    {
      int v14 = v8;
      uint64_t v15 = v12;
      do
      {
        CFTypeRef v16 = *v14;
        CFTypeID v17 = CFGetTypeID(*v14);
        if (v17 == CFNumberGetTypeID())
        {
          CFStringRef v18 = CFStringCreateWithFormat(v13, 0, @"%@", v16);
          CFDictionaryRemoveValue(MutableCopy, v16);
          CFDictionarySetValue(MutableCopy, v18, *v15);
          CFRelease(v18);
        }
        ++v15;
        ++v14;
        --v5;
      }
      while (v5);
    }
    if (v12) {
      MEMORY[0x25A2CB6D0](v12, 0x80C40B8603338);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
      +[_ANEVirtualPlatformClient prepareValidationResultForSerialization:]();
    }
    CFDictionaryRef MutableCopy = 0;
  }
  if (v8) {
    MEMORY[0x25A2CB6D0](v8, 0x80C40B8603338);
  }
  return MutableCopy;
}

- (id)objectWithIOSurfaceID:(unsigned int)a3
{
  id v3 = [(_ANEVirtualPlatformClient *)self getIOSurface:a3];
  int v4 = (void *)MEMORY[0x263F28060];
  return (id)[v4 objectWithIOSurfaceNoRetain:v3 startOffset:&unk_2706C1CF8];
}

- (__IOSurface)getIOSurface:(unint64_t)a3
{
  return 0;
}

- (NSMutableDictionary)aneModelDict
{
  return self->_aneModelDict;
}

- (_ANEClient)aneClient
{
  return self->_aneClient;
}

- (NSString)anebaseDirectory
{
  return self->_anebaseDirectory;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)guestBuildVersion
{
  return self->_guestBuildVersion;
}

- (void)setGuestBuildVersion:(id)a3
{
}

- (unsigned)negotiatedDataInterfaceVersion
{
  return self->_negotiatedDataInterfaceVersion;
}

- (void)setNegotiatedDataInterfaceVersion:(unsigned int)a3
{
  self->_unsigned int negotiatedDataInterfaceVersion = a3;
}

- (unint64_t)negotiatedCapabilityMask
{
  return self->_negotiatedCapabilityMask;
}

- (void)setNegotiatedCapabilityMask:(unint64_t)a3
{
  self->_unint64_t negotiatedCapabilityMask = a3;
}

- (BOOL)avpSaveRestoreSupported
{
  return self->_avpSaveRestoreSupported;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guestBuildVersion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_anebaseDirectory, 0);
  objc_storeStrong((id *)&self->_aneClient, 0);
  objc_storeStrong((id *)&self->_aneModelDict, 0);
}

- (void)init:.cold.1()
{
  OUTLINED_FUNCTION_16();
  *(_DWORD *)uint64_t v1 = 138412546;
  *(void *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2112;
  *(void *)(v1 + 14) = v3;
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: ANEVirtualPlatformClient filepath:%@ ", v4, v5);
}

- (void)init:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_9(&dword_258723000, "%@: Cannot create App file VM will crash %@", v4, v5);
}

- (void)init:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_9(&dword_258723000, "%@: Cannot create App directory VM will crash %@", v4, v5);
}

- (void)init:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: Cannot create command line file %@", v4, v5);
}

- (void)init:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: Cannot create command line Directory %@", v4, v5);
}

+ (void)getCommandInputSize:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: ANEVirtualPlatformClient  _ANEVirtualPlatformClient getCommandInputSize: %lu", v4, v5);
}

+ (void)getCommandInputSize:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_9(&dword_258723000, "%@: ANEVirtualPlatformClient Unknown command, size unknown %lld!", v4, v5);
}

- (void)getANEModelKey:caller:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_9(&dword_258723000, "ANEVirtualPlatformClient:%@ FAILED to generate aneModelKey from input dictionary for caller:%@", v4, v5);
}

- (void)getOptionsFromDictionary:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient kVirtANEOptionsLength not found!", v5);
}

- (void)getOptionsFromDictionary:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient kVirtANEIOSIDOptions not found!", v5);
}

- (void)constructANEModel:modelDirectory:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8(&dword_258723000, v0, v1, "%s:%@", (uint8_t *)v2);
}

- (void)constructANEModel:modelDirectory:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: sourceURLPath=%@", v4, v5);
}

- (void)constructANEModel:modelDirectory:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: sourceURLPathLen:%llu", v4, v5);
}

- (void)constructANEModel:modelDirectory:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: cacheURLIdentifierSource:%lld", v4, v5);
}

- (void)constructANEModel:modelDirectory:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@ cacheURLIdentifier=%@", v4, v5);
}

- (void)compileModelDictionary:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: ANEVirtualPlatformClient createAllModelFilesOnHost modelDirectory=%@", v4, v5);
}

- (void)loadModelDictionary:.cold.1()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_10(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: ANEVirtualPlatformClient loadModelDictionary success=%llu", v4, v5);
}

- (void)loadModelDictionary:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient ERROR : cannot create model! cacheURLIdenfiers missing AND source models missing", v5);
}

- (void)loadModelNewInstanceDictionary:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient loadModelNewInstanceDictionary ERROR : cannot create model! cacheURLIdenfiers missing AND source models missing", v5);
}

- (void)loadModelNewInstanceDictionary:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: ANEVirtualPlatformClient cacheURLIdentifier=%@", v4, v5);
}

- (void)unLoadModel:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient model key is nil!", v5);
}

- (void)unLoadModel:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: ANEVirtualPlatformClient model does not exist key=%@!", v4, v5);
}

- (void)unLoadModelDictionary:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient unLoadModelDictionary FAILED : programHandle cannot be 0", v5);
}

- (void)unLoadModelDictionary:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient unLoadModelDictionary FAILED : model in local cache is nil", v5);
}

- (void)unLoadModelDictionary:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient unLoadModelDictionary could not extract options dictionary from input dictionary", v5);
}

- (void)evaluateWithModel:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient evaluate model key is nil!", v5);
}

- (void)evaluateWithModel:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: ANEVirtualPlatformClient evaluateWithModel programHandle=%llu", v4, v5);
}

- (void)evaluateWithModelDictionary:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient evaluateWithModelDictionary FAILED : programHandle cannot be 0", v5);
}

- (void)evaluateWithModelDictionary:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient evaluateWithModelDictionary FAILED : Could not pull ANEModel from local cache : programHandle=0", v5);
}

- (void)evaluateWithModelDictionary:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient evaluateWithModelDictionary FAILED : kVirtANEOptionsLength not found!", v5);
}

- (void)evaluateWithModelDictionary:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient evaluateWithModelDictionary FAILED : kVirtANEIOSIDOptions not found!", v5);
}

- (void)evaluateWithModelDictionary:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient evaluateWithModelDictionary NON-FATAL : could not update performance stats", v5);
}

- (void)mapIOSurfacesWithModel:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient mapIOSurfaces model key is nil!", v5);
}

- (void)compiledModelExistsFor:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[_ANEVirtualPlatformClient compiledModelExistsFor:]";
  _os_log_debug_impl(&dword_258723000, log, OS_LOG_TYPE_DEBUG, "%s: model empty", (uint8_t *)&v1, 0xCu);
}

- (void)compiledModelExistsFor:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[_ANEVirtualPlatformClient compiledModelExistsFor:]";
  _os_log_debug_impl(&dword_258723000, log, OS_LOG_TYPE_DEBUG, "%s: aneVirtModel empty", (uint8_t *)&v1, 0xCu);
}

- (void)compiledModelExistsFor:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8(&dword_258723000, v0, v1, "%s: aneModelKey %@ ", (uint8_t *)v2);
}

- (void)purgeCompiledModel:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  os_log_t v4 = "-[_ANEVirtualPlatformClient purgeCompiledModel:]";
  OUTLINED_FUNCTION_7(&dword_258723000, a1, a3, "%s: model empty", (uint8_t *)&v3);
}

- (void)purgeCompiledModelDictionary:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient purgeCompiledModelDictionary could not clear out tmp directory!", v5);
}

- (void)purgeCompiledModelDictionary:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient purgeCompiledModelDictionary FAILED : could not get model", v5);
}

- (void)purgeCompiledModelDictionary:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient purgeCompiledModelDictionary NON-FATAL : Could not find model in local cache", v5);
}

- (void)validateNetworkCreate:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@ ERROR validationResultOutputIOSID is 0!", v5);
}

- (void)validateNetworkCreate:.cold.2()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_10(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@ validateNetworkCreate success=%lld", v4, v5);
}

- (void)validateNetworkCreate:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_9(&dword_258723000, "%@: ANEVirtualPlatformClient .mil file not found in created directory: %@", v4, v5);
}

- (void)validateNetworkCreate:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@ validateNetworkCreate ERROR validation_result nil", v5);
}

- (void)validateNetworkCreate:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@ validateNetworkCreate FAILED to serialize validation_result", v5);
}

- (void)validateNetworkCreate:.cold.6()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_258723000, v0, v1, "%s:  Data Creation Error: %@", (uint8_t *)v2);
}

- (void)validateNetworkCreate:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  *(_DWORD *)uint64_t v1 = 138412546;
  *(void *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 1024;
  *(_DWORD *)(v1 + 14) = v3;
  OUTLINED_FUNCTION_23(&dword_258723000, "%@ validateNetworkCreate validationResultOutputSize=%u", v4, v5);
}

- (void)validateNetworkCreate:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@ validateNetworkCreate FAILED IOSurface write : serialized result is greater than IOSurface size", v5);
}

- (void)validateNetworkCreate:.cold.9()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_9(&dword_258723000, "%@: ANEVirtualPlatformClient could not traverse created directory: %@", v4, v5);
}

- (void)validateNetworkCreate:.cold.10()
{
  OUTLINED_FUNCTION_3();
  *uint64_t v1 = 138412290;
  *uint64_t v3 = v2;
  OUTLINED_FUNCTION_7(&dword_258723000, v5, (uint64_t)v3, "%@: skipping no-name file", v4);
}

- (void)validateNetworkCreate:.cold.11()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_9(&dword_258723000, "%@: ANEVirtualPlatformClient ioSID=0 for file %@", v4, v5);
}

- (void)validateNetworkCreate:.cold.12()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_9(&dword_258723000, "%@: ANEVirtualPlatformClient Directory can't be created error %@", v4, v5);
}

- (void)validateNetworkCreate:.cold.14()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@ ERROR scratchPadPathCFString is nil!", v5);
}

- (void)validateNetworkCreate:.cold.15()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@ ERROR functionCFString is nil!", v5);
}

- (void)validateNetworkCreate:.cold.16()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@ ERROR uuidCFString is nil!", v5);
}

- (void)validateNetworkCreate:.cold.17()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@ ERROR numFiles is 0!", v5);
}

- (void)validateNetworkCreate:.cold.18()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@ validateNetworkCreate landed in host dictionary : %@", v4, v5);
}

- (void)echoDictionary:.cold.1()
{
  OUTLINED_FUNCTION_27();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x1Cu);
}

- (void)getDeviceInfoDictionary:(NSObject *)a3 .cold.1(uint64_t a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_22(&dword_258723000, (uint64_t)a2, a3, "ANEVirtualPlatformClient getDeviceInfo success! aneArchitectureTypeStr %@ isInternalBuild %d", *(void *)v3, *(void *)&v3[8], *(_WORD *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)createModelFile:path:ioSID:length:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_17(&dword_258723000, v0, v1, "%s:ANEVirtualPlatformClient filepath:%@ Length %llu", v2);
}

- (void)createModelFile:(uint64_t)a1 path:(void *)a2 ioSID:(uint8_t *)buf length:(os_log_t)log .cold.2(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = "-[_ANEVirtualPlatformClient createModelFile:path:ioSID:length:]";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = a2;
  _os_log_debug_impl(&dword_258723000, log, OS_LOG_TYPE_DEBUG, "%s:ANEVirtualPlatformClient Write model file %@ returned error: %@", buf, 0x20u);
}

- (void)getObjectFromIOSurfaceID:classType:length:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_20(&dword_258723000, v0, v1, "%s:ANEVirtualPlatformClient cannot getIOSurfaceObject %u", (uint8_t *)v2);
}

- (void)getObjectFromIOSurfaceID:(NSObject *)a1 classType:(uint64_t)a2 length:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  os_log_t v4 = "-[_ANEVirtualPlatformClient getObjectFromIOSurfaceID:classType:length:]";
  OUTLINED_FUNCTION_7(&dword_258723000, a1, a3, "%s:ANEVirtualPlatformClient cannot have nil data.", (uint8_t *)&v3);
}

- (void)getObjectFromIOSurfaceID:classType:length:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: ANEVirtualClient unarchive error %@ \n", v4, v5);
}

- (void)printIOSurfaceDataInBytes:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  os_log_t v4 = "-[_ANEVirtualPlatformClient printIOSurfaceDataInBytes:]";
  OUTLINED_FUNCTION_7(&dword_258723000, a1, a3, "%s:ANEVirtualPlatformClient cannot getIOSurfaceObject", (uint8_t *)&v3);
}

- (void)printIOSurfaceDataInBytes:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_20(&dword_258723000, v0, v1, "%s:ANEVirtualPlatformClient cannot getIOSurfaceObject %u", (uint8_t *)v2);
}

- (void)printIOSurfaceDataInBytes:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@ ANEVirtualPlatformClient IOSurfaceLength=%llu\n", v4, v5);
}

- (void)getArrayFromIOSurfaceID:localData:localDataLength:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_20(&dword_258723000, v0, v1, "%s:ANEVirtualPlatformClient cannot getIOSurfaceArray %u", (uint8_t *)v2);
}

- (void)doCreateModelFile:aneModelKey:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient: anemodelKey is nil!", v5);
}

- (void)doCreateModelFile:aneModelKey:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: ANEVirtualPlatformClient Write %@ failed", v4, v5);
}

- (void)doCreateModelFile:aneModelKey:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient write net.plist failed", v5);
}

- (void)doCreateModelFile:aneModelKey:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient write model.weight failed", v5);
}

- (void)doCreateModelFile:aneModelKey:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient write model.shape failed", v5);
}

- (void)doCreateModelFile:aneModelKey:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient Write model.net failed", v5);
}

- (void)doCreateModelFile:aneModelKey:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_9(&dword_258723000, "%@: ANEVirtualPlatformClient  Directory can't be created error %@", v4, v5);
}

- (void)doCreateModelFile:aneModelKey:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient: modelHWXLength is 0", v5);
}

- (void)doCreateModelFile:aneModelKey:.cold.9()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient write model.hwx failed", v5);
}

- (void)doCreateModelFile:aneModelKey:.cold.10()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient: Creating new model by decoding hwx file", v5);
}

- (void)doCreateModelFile:aneModelKey:.cold.11()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient: use local hwx", v5);
}

- (void)doCreateModelFile:aneModelKey:.cold.13()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient: Checking if hwx target directory already exists", v5);
}

- (void)doCreateModelFile:aneModelKey:.cold.14()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient: use guest hwx", v5);
}

- (void)doCreateModelFile:aneModelKey:.cold.15()
{
  OUTLINED_FUNCTION_27();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 2u);
}

- (void)doCreateModelFile:aneModelKey:.cold.16()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient: hwxString not detected", v5);
}

- (void)doCreateModelFile:aneModelKey:.cold.17()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: ANEVirtualPlatformClient: hwxString=%@", v4, v5);
}

- (void)doCreateModelFile:aneModelKey:.cold.18()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: ANEVirtualPlatformClient VMID: %@", v4, v5);
}

+ (void)isFileModificationTimeStampSame:(uint64_t)a3 timeSince1970:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 136315394;
  os_log_t v4 = "+[_ANEVirtualPlatformClient isFileModificationTimeStampSame:timeSince1970:]";
  __int16 v5 = 2112;
  uint64_t v6 = 0;
  OUTLINED_FUNCTION_8(&dword_258723000, a1, a3, "%s timeStampFilePath:%@", (uint8_t *)&v3);
}

+ (void)isFileModificationTimeStampSame:timeSince1970:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_26(&dword_258723000, v0, v1, "%s timeStamp read from %@, error: %@", v2);
}

+ (void)isFileModificationTimeStampSame:timeSince1970:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8(&dword_258723000, v0, v1, "%s file at %@ doesn't exist", (uint8_t *)v2);
}

+ (void)needToSaveFile:fileName:timeSince1970:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17(&dword_258723000, v0, v1, "%s directoryPath:%@ fileName:%@", v2);
}

+ (void)needToSaveFile:fileName:timeSince1970:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8(&dword_258723000, v0, v1, "%s file at %@ doesn't exists", (uint8_t *)v2);
}

+ (void)createLastModificationTimeStampFile:fileName:timeSince1970:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17(&dword_258723000, v0, v1, "%s path:%@ fileName:%@", v2);
}

+ (void)createLastModificationTimeStampFile:fileName:timeSince1970:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_26(&dword_258723000, v0, v1, "%s writing to file %@ error:%@", v2);
}

+ (void)getCodeSigningIdentity:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8(&dword_258723000, v0, v1, "%s: csIdentity=%@", (uint8_t *)v2);
}

- (void)createAllModelFilesOnHost:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: kVirtANENumModelFiles is not set!", v5);
}

- (void)createAllModelFilesOnHost:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient fileCount=0, no files to create!", v5);
}

- (void)createAllModelFilesOnHost:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: kVirtANEIOSIDModelInputPath or  kVirtANEModelInputPathLength is not set!", v5);
}

- (void)createAllModelFilesOnHost:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_18(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_23(&dword_258723000, "%@: ANEVirtualPlatformClient createAllModelFilesOnHost success=%d", v4, v5);
}

- (void)createAllModelFilesOnHost:.cold.5()
{
  OUTLINED_FUNCTION_3();
  *uint64_t v1 = 138412290;
  *uint64_t v3 = v2;
  OUTLINED_FUNCTION_7(&dword_258723000, v5, (uint64_t)v3, "%@: createAllModelFilesOnHost skipping no-name file", v4);
}

- (void)createAllModelFilesOnHost:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_9(&dword_258723000, "%@: ANEVirtualPlatformClient createAllModelFilesOnHost ioSID=0 for file %@", v4, v5);
}

- (void)createAllModelFilesOnHost:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: createAllModelFilesOnHost file %@ already exists in directory, skipping", v4, v5);
}

- (void)createAllModelFilesOnHost:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: createAllModelFilesOnHost skipping no-name file", v5);
}

- (void)createAllModelFilesOnHost:.cold.9()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.7781e-34);
  *(_WORD *)(v4 + 22) = 1024;
  *(_DWORD *)(v4 + 24) = 0;
  _os_log_error_impl(&dword_258723000, v6, OS_LOG_TYPE_ERROR, "%@: ANEVirtualPlatformClient createAllModelFilesOnHost failed to create file fileName:%@ fileIOSID:%u", v5, 0x1Cu);
}

- (void)createAllModelFilesOnHost:.cold.11()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_19(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_23(&dword_258723000, "%@: ANEVirtualPlatformClient fileCount=%u", v4, v5);
}

- (void)createANEModelInstanceParameters:modelUUID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: ANEVirtualPlatformClient createANEModelInstanceParameters model uuid :%@", v4, v5);
}

- (void)createOptionFilesForCompilation:aneModelKey:options:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient No kANEFCompilerOptionsFilenameKey.", v5);
}

- (void)createOptionFilesForCompilation:aneModelKey:options:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: ANEVirtualPlatformClient Write kANEFCompilerOptionsFilenameKey:%@", v4, v5);
}

- (void)createOptionFilesForCompilation:aneModelKey:options:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient Write kANEFCompilerOptionsFilenameKey failed", v5);
}

- (void)createOptionFilesForCompilation:aneModelKey:options:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient No optional compiler files.", v5);
}

- (void)createOptionFilesForCompilationDictionary:aneModelKey:options:modelDirectory:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient kVirtANECompilerOptionsFileLength not found!", v5);
}

- (void)createOptionFilesForCompilationDictionary:aneModelKey:options:modelDirectory:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient kVirtANEIOSIDCompilerOptionsFile not found!", v5);
}

- (void)doRemoveModelFile:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_9(&dword_258723000, "%@: ANEVirtualPlatformClient failed to remove %@ ", v4, v5);
}

- (void)doRemoveModelFile:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: ANEVirtualPlatformClient removing %@ ", v4, v5);
}

- (void)updateVirtualANEModel:model:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient Failed to load ANEModel", v5);
}

- (void)updateVirtualANEModel:model:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: model is nil", v5);
}

- (void)updateVirtualANEModel:model:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_9(&dword_258723000, "%@: modelattribute is nil %@", v4, v5);
}

- (void)updateVirtualANEModel:model:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_18(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_20(&dword_258723000, v6, v4, "%@: ANEVirtualPlatformClient ioSModelAttribute empty id=%u", v5);
}

- (void)updateVirtualANEModel:model:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: ANEVirtualPlatformClient keyarchive error %@", v4, v5);
}

- (void)updateVirtualANEModelDictionary:model:cacheURLIdentifierToGuest:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient kVirtANEModelAttributeLength not found!", v5);
}

- (void)updateVirtualANEModelDictionary:model:cacheURLIdentifierToGuest:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_19(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_20(&dword_258723000, v6, v4, "%@: ANEVirtualPlatformClient ioSModelAttribute empty id=%u", v5);
}

- (void)updateVirtualANEModelDictionary:model:cacheURLIdentifierToGuest:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: ANEVirtualPlatformClient end ANEIOSIDModelParameters %@", v4, v5);
}

- (void)updateVirtualANEModelDictionary:model:cacheURLIdentifierToGuest:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: ANEVirtualPlatformClient Found ANEIOSIDModelParameters %@", v4, v5);
}

- (void)updateVirtualANEModelDictionary:model:cacheURLIdentifierToGuest:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient Checking ANEIOSIDModelParameters", v5);
}

- (void)updateVirtualANEModelDictionary:model:cacheURLIdentifierToGuest:.cold.7()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8(&dword_258723000, v0, v1, "%s host generated modelCacheURLIdentifier:%@", (uint8_t *)v2);
}

- (void)updateErrorValue:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: ANEVirtualPlatformClient error=%@", v4, v5);
}

- (void)updateErrorValueDictionary:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient kVirtANEIOSIDErrorValue not found!", v5);
}

- (void)doModelAttributeUpdateDictionary:dictionary:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient kVirtANEIOSIDModelAttributes not found!", v5);
}

- (void)getDeviceInfo:.cold.1()
{
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_22(&dword_258723000, v0, v1, "ANEVirtualPlatformClient getDeviceInfo hasANE %d aneBoardtype %lld ", v2, v3);
}

- (void)exchangeBuildVersionInfo:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@: ANEVirtualClient exchangeBuildVersionInfo: hostBuildVersion=%@\n", v4, v5);
}

- (void)exchangeBuildVersionInfo:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ERROR buildVersion is emptyString or nil", v5);
}

- (void)exchangeBuildVersionInfo:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ERROR productName is emptyString or nil", v5);
}

- (void)copyToIOSurface:ioSID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualClient ioSID invalid\n", v5);
}

- (void)copyToIOSurface:ioSID:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@: ANEVirtualClient ioSurfaceRef pointer null\n", v5);
}

+ (void)printStruct:.cold.1()
{
  OUTLINED_FUNCTION_27();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x18Cu);
}

- (void)getBytesFromIOSurfaceID:dest:dataLength:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_20(&dword_258723000, v0, v1, "%s:ANEVirtualPlatformClient cannot getIOSurfaceArray %u", (uint8_t *)v2);
}

- (void)callCFDictionaryMethod:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@:ANEVirtualPlatformClient callCFDictionaryMethod FAILED to get CFDictionary ", v5);
}

- (void)callCFDictionaryMethod:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@:ANEVirtualPlatformClient callCFDictionaryMethod output dictionaryDataSize=%llu ", v4, v5);
}

- (void)callCFDictionaryMethod:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_258723000, v3, v4, "%@:ANEVirtualPlatformClient callCFDictionaryMethod cfDict FAILED to serialize dictionary\n", v5);
}

- (void)callCFDictionaryMethod:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_19(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_20(&dword_258723000, v6, v4, "%@: Invalid command received=%d", v5);
}

- (void)callCFDictionaryMethod:.cold.5()
{
  OUTLINED_FUNCTION_27();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 8u);
}

- (void)callCFDictionaryMethod:(uint64_t)a3 .cold.6(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 136315394;
  __int16 v5 = "-[_ANEVirtualPlatformClient callCFDictionaryMethod:]";
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  OUTLINED_FUNCTION_11(&dword_258723000, a2, a3, "%s : memory allocation failed, size requested:%llu", (uint8_t *)&v4);
}

- (void)callCFDictionaryMethod:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_5(&dword_258723000, "%@:ANEVirtualPlatformClient callCFDictionaryMethod dictionaryDataSize=%llu", v4, v5);
}

- (void)asyncAvpHoldMessageReceived:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.778e-34);
  *(_WORD *)(v3 + 12) = 1024;
  *(_DWORD *)(v3 + 14) = 17;
  OUTLINED_FUNCTION_20(&dword_258723000, v4, (uint64_t)v4, "%@: interface synchronization error, message with command=%d should never reach host. Unsetting save/restore capability", v5);
}

- (void)requestWithVirtualANEModel:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@:ANEVirtualPlatformClient PerfStats is nil ", v5);
}

- (void)requestWithVirtualANEModel:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@:ANEVirtualPlatformClient _ANEPerformanceStatsIOSurface obj is nil ", v5);
}

- (void)requestWithVirtualANEModel:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@:ANEVirtualPlatformClient weightsbuffer is nil ", v5);
}

- (void)requestWithVirtualANEModel:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@:ANEVirtualPlatformClient ioSIDOutputArray is nil ", v5);
}

- (void)requestWithVirtualANEModel:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@:ANEVirtualPlatformClient ioSIDInputArray is nil ", v5);
}

+ (void)prepareValidationResultForSerialization:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_11(&dword_258723000, v0, v1, "%s : memory allocation for keys failed, size requested:%lu", (uint8_t *)v2);
}

+ (void)prepareValidationResultForSerialization:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_11(&dword_258723000, v0, v1, "%s : memory allocation for values failed, size requested:%lu", (uint8_t *)v2);
}

@end