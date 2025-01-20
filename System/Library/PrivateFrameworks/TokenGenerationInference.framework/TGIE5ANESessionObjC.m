@interface TGIE5ANESessionObjC
+ (void)sendStartSignalForResource:(id)a3 useEnergyEfficientMode:(BOOL)a4 assetIdentifier:(id)a5;
+ (void)sendStopSignalForResource:(id)a3;
- (BOOL)useEnergyEfficientMode;
- (NSString)assetIdentifier;
- (NSURL)resourceURL;
- (TGIE5ANESessionObjC)initWithResourceURL:(id)a3 useEnergyEfficientMode:(BOOL)a4 assetIdentifier:(id)a5;
- (void)dealloc;
- (void)resume;
- (void)stop;
@end

@implementation TGIE5ANESessionObjC

+ (void)sendStartSignalForResource:(id)a3 useEnergyEfficientMode:(BOOL)a4 assetIdentifier:(id)a5
{
  BOOL v6 = a4;
  v28[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (cgm::token_generation_inference::common::logging::CGMTGILogger *)a5;
  v9 = cgm::token_generation_inference::common::logging::CGMTGILogger::GENERAL(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v7 path];
    int v21 = 136315650;
    uint64_t v22 = [v10 UTF8String];
    __int16 v23 = 1024;
    *(_DWORD *)v24 = v6;
    *(_WORD *)&v24[4] = 2080;
    *(void *)&v24[6] = [(cgm::token_generation_inference::common::logging::CGMTGILogger *)v8 UTF8String];
    _os_log_impl(&dword_25FA51000, v9, OS_LOG_TYPE_INFO, "Sending ANE start session signal for resource at path %s with useEnergyEfficientMode: %i and asset identifier %s", (uint8_t *)&v21, 0x1Cu);
  }
  v27[0] = @"ANEClientModelAssetPath";
  v11 = [v7 path];
  v27[1] = @"ANEClientEnergyEfficientWorkload";
  v28[0] = v11;
  v12 = [NSNumber numberWithBool:v6];
  v28[1] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

  v14 = sendAneSessionSignal();
  v15 = [v14 objectForKeyedSubscript:@"ANEClientTotalPages"];
  uint64_t isKindOfClass = [v14 objectForKeyedSubscript:@"ANEClientResidentPages"];
  v17 = (void *)isKindOfClass;
  if (v15
    && isKindOfClass
    && (objc_opt_class(), uint64_t isKindOfClass = objc_opt_isKindOfClass(), (isKindOfClass & 1) != 0)
    && (objc_opt_class(), uint64_t isKindOfClass = objc_opt_isKindOfClass(), (isKindOfClass & 1) != 0))
  {
    v18 = v15;
    v19 = v17;
    v20 = cgm::token_generation_inference::common::logging::CGMTGILogger::GENERAL(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v21 = 138544130;
      uint64_t v22 = (uint64_t)v8;
      __int16 v23 = 2114;
      *(void *)v24 = v7;
      *(_WORD *)&v24[8] = 2112;
      *(void *)&v24[10] = v18;
      __int16 v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_25FA51000, v20, OS_LOG_TYPE_INFO, "ANE start signal for asset identifier %{public}@ and resource at path %{public}@ yielded %@ total pages and %@ pages already resident.", (uint8_t *)&v21, 0x2Au);
    }

    +[TelemetryHelpers emitFileResidentInfoWithAssetIdentifier:v8 residentPages:[(cgm::token_generation_inference::common::logging::CGMTGILogger *)v19 longValue] totalPages:[v18 longValue]];
  }
  else
  {
    v18 = cgm::token_generation_inference::common::logging::CGMTGILogger::GENERAL((cgm::token_generation_inference::common::logging::CGMTGILogger *)isKindOfClass);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138543874;
      uint64_t v22 = (uint64_t)v8;
      __int16 v23 = 2112;
      *(void *)v24 = v15;
      *(_WORD *)&v24[8] = 2112;
      *(void *)&v24[10] = v17;
      _os_log_error_impl(&dword_25FA51000, v18, OS_LOG_TYPE_ERROR, "ANE start signal for asset identifier %{public}@ did not return expected metrics back. Received (totalPages: %@, totalPagesAlreadyResident %@)", (uint8_t *)&v21, 0x20u);
    }
  }
}

+ (void)sendStopSignalForResource:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = (cgm::token_generation_inference::common::logging::CGMTGILogger *)a3;
  v4 = cgm::token_generation_inference::common::logging::CGMTGILogger::GENERAL(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(cgm::token_generation_inference::common::logging::CGMTGILogger *)v3 path];
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = [v5 UTF8String];
    _os_log_impl(&dword_25FA51000, v4, OS_LOG_TYPE_INFO, "Sending ANE stop session signal for resource at path %{public}s", buf, 0xCu);
  }
  BOOL v6 = [(cgm::token_generation_inference::common::logging::CGMTGILogger *)v3 path];
  v9 = v6;
  id v7 = [NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  sendAneSignal();
}

- (TGIE5ANESessionObjC)initWithResourceURL:(id)a3 useEnergyEfficientMode:(BOOL)a4 assetIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TGIE5ANESessionObjC;
  uint64_t v11 = [(TGIE5ANESessionObjC *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_resourceURL, a3);
    v12->_useEnergyEfficientMode = a4;
    objc_storeStrong((id *)&v12->_assetIdentifier, a5);
  }

  return v12;
}

- (void)dealloc
{
  v3 = [(TGIE5ANESessionObjC *)self resourceURL];
  +[TGIE5ANESessionObjC sendStopSignalForResource:v3];

  v4.receiver = self;
  v4.super_class = (Class)TGIE5ANESessionObjC;
  [(TGIE5ANESessionObjC *)&v4 dealloc];
}

- (void)resume
{
  id v5 = [(TGIE5ANESessionObjC *)self resourceURL];
  BOOL v3 = [(TGIE5ANESessionObjC *)self useEnergyEfficientMode];
  objc_super v4 = [(TGIE5ANESessionObjC *)self assetIdentifier];
  +[TGIE5ANESessionObjC sendStartSignalForResource:v5 useEnergyEfficientMode:v3 assetIdentifier:v4];
}

- (void)stop
{
  id v2 = [(TGIE5ANESessionObjC *)self resourceURL];
  +[TGIE5ANESessionObjC sendStopSignalForResource:](TGIE5ANESessionObjC, "sendStopSignalForResource:");
}

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (BOOL)useEnergyEfficientMode
{
  return self->_useEnergyEfficientMode;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIdentifier, 0);

  objc_storeStrong((id *)&self->_resourceURL, 0);
}

@end