@interface SIOutputData
+ (BOOL)ensureDirectoryExist:(id)a3;
+ (id)initWithConfig:(id)a3;
- (BOOL)copyDataTo:(id)a3;
- (BOOL)saveToDisk:(id)a3 identifier:(id)a4;
- (NSString)identifier;
- (SIOutputData)initWithConfig:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation SIOutputData

+ (id)initWithConfig:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 algorithmOutputClassName];
  v5 = v4;
  if (v4)
  {
    v6 = (void *)[objc_alloc(NSClassFromString(v4)) initWithConfig:v3];
  }
  else
  {
    v7 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136380931;
      v10 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIData.m";
      __int16 v11 = 1025;
      int v12 = 18;
      _os_log_impl(&dword_21B697000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** algorithm output class name is not specified in the subclass ***", (uint8_t *)&v9, 0x12u);
    }

    v6 = 0;
  }

  return v6;
}

- (SIOutputData)initWithConfig:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136380931;
    v7 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIData.m";
    __int16 v8 = 1025;
    int v9 = 24;
    _os_log_impl(&dword_21B697000, v4, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** init function for output data should be implemented by the subclass ***", (uint8_t *)&v6, 0x12u);
  }

  return 0;
}

- (BOOL)copyDataTo:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136380931;
    int v6 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIData.m";
    __int16 v7 = 1025;
    int v8 = 30;
    _os_log_impl(&dword_21B697000, v3, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Not Supported for output data ***", (uint8_t *)&v5, 0x12u);
  }

  return 0;
}

- (BOOL)saveToDisk:(id)a3 identifier:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136380931;
    __int16 v7 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIData.m";
    __int16 v8 = 1025;
    int v9 = 36;
    _os_log_impl(&dword_21B697000, v4, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** saveToDisk function for output data should be implemented by the subclass ***", (uint8_t *)&v6, 0x12u);
  }

  return 0;
}

+ (BOOL)ensureDirectoryExist:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  char v12 = 0;
  v4 = [MEMORY[0x263F08850] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3 isDirectory:&v12];

  if ((v5 & 1) == 0)
  {
    __int16 v7 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136381187;
      v14 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIData.m";
      __int16 v15 = 1025;
      int v16 = 47;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_21B697000, v7, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** Path %@ does not exist in the system, create one to save the output data. ***", buf, 0x1Cu);
    }

    __int16 v8 = [MEMORY[0x263F08850] defaultManager];
    id v11 = 0;
    char v6 = [v8 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v11];
    int v9 = v11;

    goto LABEL_10;
  }
  if (!v12)
  {
    int v9 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381187;
      v14 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIData.m";
      __int16 v15 = 1025;
      int v16 = 50;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_21B697000, v9, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Path %@ exists, but it is not a directory ***", buf, 0x1Cu);
    }
    char v6 = 0;
LABEL_10:

    goto LABEL_11;
  }
  char v6 = 1;
LABEL_11:

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end