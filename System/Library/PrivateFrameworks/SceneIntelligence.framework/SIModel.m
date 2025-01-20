@interface SIModel
- (CGSize)getInputResolution;
- (CGSize)getOutputResolution;
- (NSDictionary)inputs;
- (NSDictionary)outputs;
- (SICoreAnalyticManager)coreAnalyticManager;
- (SIModel)initWithNetworkConfiguration:(id)a3;
- (SINetworkConfiguration)config;
- (SINetworkProtocol)network;
- (double)frameTimestamp;
- (id)colletSubloggerTable;
- (id)getConfiguration;
- (id)getOpsForLibrary;
- (id)keysForCoreAnalyticAccumulatedData;
- (id)networkVersion;
- (id)subLoggers;
- (int64_t)addPrewiringBuffersToStreamWithInputPools:(id)a3 outputPools:(id)a4 clearWiredBuffer:(BOOL)a5;
- (int64_t)evaluateWithInput:(id)a3 outputs:(id)a4;
- (int64_t)switchNetworkConfiguration:(int64_t)a3;
- (int64_t)unwirePrewiringBuffers;
- (unint64_t)algorithmNameHash;
- (unint64_t)mappingId;
- (void)setAlgorithmNameHash:(unint64_t)a3;
- (void)setConfig:(id)a3;
- (void)setCoreAnalyticManager:(id)a3;
- (void)setFrameTimestamp:(double)a3;
- (void)setInputs:(id)a3;
- (void)setMappingId:(unint64_t)a3;
- (void)setNetwork:(id)a3;
- (void)setOutputs:(id)a3;
@end

@implementation SIModel

- (SIModel)initWithNetworkConfiguration:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SIModel;
  v6 = [(SIModel *)&v24 init];
  p_isa = (id *)&v6->super.isa;
  if (!v6) {
    goto LABEL_16;
  }
  if ((SISupportANE() & 1) == 0 && [v5 engineType] == 1)
  {
    v8 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136380931;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIModel.mm";
      __int16 v26 = 1025;
      int v27 = 35;
      _os_log_impl(&dword_21B697000, v8, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** ANE is not available on this device. Initializing by MPS instead ***", buf, 0x12u);
    }

    [v5 setEngineType:0];
    [v5 setRunByE5RT:0];
  }
  v9 = [v5 engineType] == 1 && objc_msgSend(v5, "runByE5RT")
     ? [[SIBaseNetworkE5RT alloc] initWithNetworkConfiguration:v5]: (SIBaseNetworkE5RT *)[[SIBaseNetworkEspresso alloc] initWithNetworkConfiguration:v5];
  network = v6->_network;
  v6->_network = (SINetworkProtocol *)v9;

  id v11 = [v5 networkName];
  *(void *)buf = 0;
  unint64_t v12 = objc_msgSend(v11, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(v11, "length"), 0)? *(void *)buf: 0;

  v6->_algorithmNameHash = v12;
  if ([(SINetworkProtocol *)v6->_network prepare])
  {
    objc_storeStrong((id *)&v6->_config, a3);
    uint64_t v13 = [(SIModel *)v6 colletSubloggerTable];
    subLoggerTable = v6->_subLoggerTable;
    v6->_subLoggerTable = (NSDictionary *)v13;

    v15 = +[SIVisualLogger sharedLogger];
    v16 = [p_isa subLoggers];
    [v15 registerSubloggers:v16];

    v17 = [SICoreAnalyticManager alloc];
    v18 = [v5 coreAnalyticEventName];
    v19 = [p_isa keysForCoreAnalyticAccumulatedData];
    uint64_t v20 = -[SICoreAnalyticManager initWithEventName:requiredKeys:minLogTimeInterval:](v17, "initWithEventName:requiredKeys:minLogTimeInterval:", v18, v19, [v5 coreAnalyticTimeInterval]);
    id v21 = p_isa[8];
    p_isa[8] = (id)v20;

    [p_isa[8] averageAccumulatedDataOverKey:@"inferenceCount"];
    v22 = p_isa;
  }
  else
  {
LABEL_16:
    v22 = 0;
  }

  return v22;
}

- (CGSize)getOutputResolution
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136380931;
    v6 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIModel.mm";
    __int16 v7 = 1025;
    int v8 = 71;
    _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** output resolution method must be overriden ***", (uint8_t *)&v5, 0x12u);
  }

  double v3 = 0.0;
  double v4 = 0.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)getInputResolution
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136380931;
    v6 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIModel.mm";
    __int16 v7 = 1025;
    int v8 = 77;
    _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** input resolution method must be overriden ***", (uint8_t *)&v5, 0x12u);
  }

  double v3 = 0.0;
  double v4 = 0.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)networkVersion
{
  return (id)[(SINetworkProtocol *)self->_network networkVersion];
}

- (id)getConfiguration
{
  return self->_config;
}

- (id)getOpsForLibrary
{
  return (id)[(SINetworkProtocol *)self->_network getOpsForLibrary];
}

- (int64_t)switchNetworkConfiguration:(int64_t)a3
{
  int64_t v11 = a3;
  SEL v4 = NSSelectorFromString(&cfstr_Setnetworkmode.isa);
  int v5 = [(SINetworkConfiguration *)self->_config methodSignatureForSelector:v4];
  v6 = [MEMORY[0x263EFF958] invocationWithMethodSignature:v5];
  [v6 setSelector:v4];
  [v6 invokeWithTarget:self->_config];
  [v6 setArgument:&v11 atIndex:2];
  [v6 invoke];
  network = self->_network;
  int v8 = [(SINetworkConfiguration *)self->_config networkMode];
  int64_t v9 = [(SINetworkProtocol *)network switchConfiguration:v8];

  return v9;
}

- (int64_t)evaluateWithInput:(id)a3 outputs:(id)a4
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v71 = a3;
  id v72 = a4;
  LODWORD(v6) = 1.0;
  [(SICoreAnalyticManager *)self->_coreAnalyticManager accumulateStatisticDataForKey:@"inferenceCount" value:v6];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  obuint64_t j = v71;
  uint64_t v7 = [obj countByEnumeratingWithState:&v85 objects:v103 count:16];
  if (v7)
  {
    size_t v8 = 0;
    uint64_t v73 = *(void *)v86;
    size_t v74 = 0;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v86 != v73) {
          objc_enumerationMutation(obj);
        }
        size_t v10 = *(void *)(*((void *)&v85 + 1) + 8 * i);
        int64_t v11 = [obj objectForKeyedSubscript:v10];
        unint64_t v12 = (__CVBuffer *)[v11 pixelBuffer];

        if (v12)
        {
          size_t Width = CVPixelBufferGetWidth(v12);
          size_t Height = CVPixelBufferGetHeight(v12);
          uint64_t v15 = [(SINetworkProtocol *)self->_network getInputWidth:v10];
          uint64_t v16 = [(SINetworkProtocol *)self->_network getInputHeight:v10];
          uint64_t v17 = v16;
          if (Width != v15 || Height != v16)
          {
            v64 = __SceneIntelligenceLogSharedInstance();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136381955;
              v92 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIModel.mm";
              __int16 v93 = 1025;
              int v94 = 129;
              __int16 v95 = 2048;
              size_t v96 = Width;
              __int16 v97 = 2048;
              size_t v98 = Height;
              __int16 v99 = 2049;
              uint64_t v100 = v15;
              __int16 v101 = 2049;
              uint64_t v102 = v17;
              _os_log_impl(&dword_21B697000, v64, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unexpected image input resolution (%zu, %zu). (Expected: %{private}zu %{private}zu) ***", buf, 0x3Au);
            }
            uint64_t v66 = 1;
            goto LABEL_57;
          }
          size_t v19 = v74;
          BOOL v20 = Height * Width > v8 * v74;
          if (Height * Width > v8 * v74) {
            size_t v19 = Height;
          }
          size_t v74 = v19;
          if (v20) {
            size_t v8 = Width;
          }
          if ([(SINetworkProtocol *)self->_network setInput:v10 fromCVPixelBuffer:v12])
          {
            v64 = __SceneIntelligenceLogSharedInstance();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              IOSurface = CVPixelBufferGetIOSurface(v12);
              IOSurfaceID ID = IOSurfaceGetID(IOSurface);
              *(_DWORD *)buf = 136381443;
              v92 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIModel.mm";
              __int16 v93 = 1025;
              int v94 = 140;
              __int16 v95 = 2113;
              size_t v96 = v10;
              __int16 v97 = 1024;
              LODWORD(v98) = ID;
              _os_log_impl(&dword_21B697000, v64, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to set the input for blob= %{private}@ buffer_id= %d. Inference interrupted. ***", buf, 0x22u);
            }
            uint64_t v66 = 4;
LABEL_57:
            int64_t v75 = v66;
            id v39 = obj;
LABEL_58:

            goto LABEL_59;
          }
          id v21 = +[SIVisualLogger sharedLogger];
          v22 = [(NSDictionary *)self->_subLoggerTable objectForKeyedSubscript:v10];
          int v23 = [v21 isLoggerEnabled:v22];

          if (v23)
          {
            kdebug_trace();
            if (CVPixelBufferGetPixelFormatType(v12) == 875836518)
            {
              objc_super v24 = SICreatePixelBufferWithNewFormatFromExistingBuffer(v12, 0x42475241u);
              v25 = SICreateRGBFromBGRAPixelBuffer(v24);
              __int16 v26 = +[SIVisualLogger sharedLogger];
              [(SIModel *)self frameTimestamp];
              double v28 = v27;
              v29 = [(NSDictionary *)self->_subLoggerTable objectForKeyedSubscript:v10];
              [v26 logPixelBuffer:v25 at:v29 sublogger:@"input" name:v28];

              CVPixelBufferRelease(v24);
              CVPixelBufferRelease(v25);
            }
            else if (CVPixelBufferGetPixelFormatType(v12) == 1111970369)
            {
              v30 = SICreateRGBFromBGRAPixelBuffer(v12);
              v31 = +[SIVisualLogger sharedLogger];
              [(SIModel *)self frameTimestamp];
              double v33 = v32;
              v34 = [(NSDictionary *)self->_subLoggerTable objectForKeyedSubscript:v10];
              [v31 logPixelBuffer:v30 at:v34 sublogger:@"input" name:v33];

              CVPixelBufferRelease(v30);
            }
            else
            {
              v35 = +[SIVisualLogger sharedLogger];
              [(SIModel *)self frameTimestamp];
              double v37 = v36;
              v38 = [(NSDictionary *)self->_subLoggerTable objectForKeyedSubscript:v10];
              [v35 logPixelBuffer:v12 at:v38 sublogger:@"input" name:v37];
            }
            kdebug_trace();
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v85 objects:v103 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if ([(SINetworkProtocol *)self->_network supportZeroCopyOutput])
  {
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v39 = v72;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v81 objects:v90 count:16];
    if (v40)
    {
      uint64_t v41 = *(void *)v82;
      while (2)
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v82 != v41) {
            objc_enumerationMutation(v39);
          }
          size_t v43 = *(void *)(*((void *)&v81 + 1) + 8 * j);
          v44 = [v39 objectForKeyedSubscript:v43];
          v45 = CVPixelBufferGetIOSurface((CVPixelBufferRef)[v44 pixelBuffer]);

          if (v45
            && [(SINetworkProtocol *)self->_network setOutputBlob:v43 forOutputSurface:v45])
          {
            v64 = __SceneIntelligenceLogSharedInstance();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              IOSurfaceID v70 = IOSurfaceGetID(v45);
              *(_DWORD *)buf = 136381443;
              v92 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIModel.mm";
              __int16 v93 = 1025;
              int v94 = 172;
              __int16 v95 = 2113;
              size_t v96 = v43;
              __int16 v97 = 1024;
              LODWORD(v98) = v70;
              _os_log_impl(&dword_21B697000, v64, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to set the output for blob= %{private}@ buffer_id= %d. Inference interrupted. ***", buf, 0x22u);
            }
            int64_t v75 = 4;
            goto LABEL_58;
          }
        }
        uint64_t v40 = [v39 countByEnumeratingWithState:&v81 objects:v90 count:16];
        if (v40) {
          continue;
        }
        break;
      }
    }
  }
  kdebug_trace();
  uint64_t v46 = [(SINetworkProtocol *)self->_network runNetwork];
  kdebug_trace();
  int64_t v75 = v46;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v47 = v72;
  uint64_t v48 = [v47 countByEnumeratingWithState:&v77 objects:v89 count:16];
  if (v48)
  {
    uint64_t v49 = *(void *)v78;
    do
    {
      for (uint64_t k = 0; k != v48; ++k)
      {
        if (*(void *)v78 != v49) {
          objc_enumerationMutation(v47);
        }
        uint64_t v51 = *(void *)(*((void *)&v77 + 1) + 8 * k);
        v52 = +[SIVisualLogger sharedLogger];
        v53 = [(NSDictionary *)self->_subLoggerTable objectForKeyedSubscript:v51];
        int v54 = [v52 isLoggerEnabled:v53];

        if (v54)
        {
          kdebug_trace();
          v55 = [v47 objectForKeyedSubscript:v51];
          v56 = (__CVBuffer *)[v55 pixelBuffer];

          if (v56)
          {
            IOSurfaceRef v57 = CVPixelBufferGetIOSurface(v56);
          }
          else
          {
            v58 = [(SIModel *)self network];
            IOSurfaceRef v57 = (IOSurfaceRef)[v58 getOutputSurface:v51];
          }
          v59 = +[SIVisualLogger sharedLogger];
          [(SIModel *)self frameTimestamp];
          double v61 = v60;
          v62 = [(NSDictionary *)self->_subLoggerTable objectForKeyedSubscript:v51];
          [v59 logIOSurface:v57 at:v62 sublogger:@"output" name:v61];

          kdebug_trace();
        }
      }
      uint64_t v48 = [v47 countByEnumeratingWithState:&v77 objects:v89 count:16];
    }
    while (v48);
  }

  if (!v75)
  {
    LODWORD(v63) = 1.0;
    [(SICoreAnalyticManager *)self->_coreAnalyticManager accumulateStatisticDataForKey:@"inferenceSuccessRate" value:v63];
    int64_t v75 = 0;
  }
LABEL_59:

  return v75;
}

- (id)keysForCoreAnalyticAccumulatedData
{
  return (id)[MEMORY[0x263EFFA08] set];
}

- (int64_t)addPrewiringBuffersToStreamWithInputPools:(id)a3 outputPools:(id)a4 clearWiredBuffer:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  size_t v10 = [(SIModel *)self network];
  int64_t v11 = [(SINetworkConfiguration *)self->_config networkMode];
  uint64_t v12 = [v10 addPrewiringBuffersToStreamForFunctionName:v11 inputPools:v8 outputPools:v9 clearWiredBuffer:v5];

  if (v12)
  {
    uint64_t v13 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136380931;
      uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIModel.mm";
      __int16 v18 = 1025;
      int v19 = 229;
      _os_log_impl(&dword_21B697000, v13, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to complete ANEP. release all ANEP buffers to prevent unexpected behavior. ***", (uint8_t *)&v16, 0x12u);
    }

    [(SIModel *)self unwirePrewiringBuffers];
    int64_t v14 = 4;
  }
  else
  {
    int64_t v14 = 0;
  }

  return v14;
}

- (int64_t)unwirePrewiringBuffers
{
  v2 = [(SIModel *)self network];
  int64_t v3 = [v2 unwirePrewiringBuffers];

  return v3;
}

- (id)colletSubloggerTable
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  SEL v4 = [(SIModel *)self network];
  BOOL v5 = [v4 networkInputNames];

  obuint64_t j = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v10 = [NSString alloc];
        int64_t v11 = +[SIVisualLogger frameworkPrefix];
        uint64_t v12 = [(SINetworkConfiguration *)self->_config defaultVisualLoggerName];
        uint64_t v13 = (void *)[v10 initWithFormat:@"%@.%@.ML.input_%@", v11, v12, v9];

        [v3 setObject:v13 forKey:v9];
      }
      BOOL v5 = obj;
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v6);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  int64_t v14 = [(SIModel *)self network];
  id obja = [v14 networkOutputNames];

  uint64_t v15 = [obja countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(obja);
        }
        uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * j);
        id v19 = [NSString alloc];
        uint64_t v20 = +[SIVisualLogger frameworkPrefix];
        id v21 = [(SINetworkConfiguration *)self->_config defaultVisualLoggerName];
        v22 = (void *)[v19 initWithFormat:@"%@.%@.ML.output_%@", v20, v21, v18];

        [v3 setObject:v22 forKey:v18];
      }
      uint64_t v15 = [obja countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v15);
  }

  return v3;
}

- (id)subLoggers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  SEL v4 = self->_subLoggerTable;
  uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = -[NSDictionary objectForKeyedSubscript:](self->_subLoggerTable, "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        [v3 addObject:v8];
      }
      uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v3;
}

- (SINetworkProtocol)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
}

- (SINetworkConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (unint64_t)algorithmNameHash
{
  return self->_algorithmNameHash;
}

- (void)setAlgorithmNameHash:(unint64_t)a3
{
  self->_algorithmNameHash = a3;
}

- (unint64_t)mappingId
{
  return self->_mappingId;
}

- (void)setMappingId:(unint64_t)a3
{
  self->_mappingId = a3;
}

- (NSDictionary)inputs
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInputs:(id)a3
{
}

- (NSDictionary)outputs
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOutputs:(id)a3
{
}

- (SICoreAnalyticManager)coreAnalyticManager
{
  return self->_coreAnalyticManager;
}

- (void)setCoreAnalyticManager:(id)a3
{
}

- (double)frameTimestamp
{
  return self->_frameTimestamp;
}

- (void)setFrameTimestamp:(double)a3
{
  self->_frameTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreAnalyticManager, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_subLoggerTable, 0);
}

@end