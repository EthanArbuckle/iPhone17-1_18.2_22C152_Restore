@interface AnalyticsStoreDescriptor
+ (id)applicationSupportDirectoryPath;
+ (id)defaultModelURL;
+ (id)defaultPersistentStoreURL;
+ (id)directStoreDescriptor;
+ (id)serverStoreDescriptor:(unint64_t)a3;
- (AnalyticsStoreDescriptor)initWithType:(unint64_t)a3 storeURL:(id)a4 modelURL:(id)a5 options:(unint64_t)a6;
- (NSDictionary)remoteStoreOptions;
- (NSPersistentStoreDescription)storeDescription;
- (NSURL)modelURL;
- (NSURL)storeURL;
- (unint64_t)analyticsStoreOptions;
- (unint64_t)type;
- (void)setAnalyticsStoreOptions:(unint64_t)a3;
- (void)setModelURL:(id)a3;
- (void)setStoreURL:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation AnalyticsStoreDescriptor

+ (id)serverStoreDescriptor:(unint64_t)a3
{
  v4 = [AnalyticsStoreDescriptor alloc];
  v5 = +[AnalyticsStoreDescriptor defaultPersistentStoreURL];
  v6 = +[AnalyticsStoreDescriptor defaultModelURL];
  v7 = [(AnalyticsStoreDescriptor *)v4 initWithType:0 storeURL:v5 modelURL:v6 options:a3];

  return v7;
}

+ (id)directStoreDescriptor
{
  v2 = [AnalyticsStoreDescriptor alloc];
  v3 = +[AnalyticsStoreDescriptor defaultPersistentStoreURL];
  v4 = +[AnalyticsStoreDescriptor defaultModelURL];
  v5 = [(AnalyticsStoreDescriptor *)v2 initWithType:1 storeURL:v3 modelURL:v4 options:0];

  return v5;
}

- (AnalyticsStoreDescriptor)initWithType:(unint64_t)a3 storeURL:(id)a4 modelURL:(id)a5 options:(unint64_t)a6
{
  *(void *)&v37[5] = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)AnalyticsStoreDescriptor;
  v13 = [(AnalyticsStoreDescriptor *)&v31 init];
  v14 = v13;
  if (!v11)
  {
    p_super = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v33 = "-[AnalyticsStoreDescriptor initWithType:storeURL:modelURL:options:]";
      __int16 v34 = 1024;
      int v35 = 56;
      v28 = "%{public}s::%d:storeURL is nil";
LABEL_26:
      _os_log_impl(&dword_21D96D000, p_super, OS_LOG_TYPE_ERROR, v28, buf, 0x12u);
    }
LABEL_27:
    v18 = 0;
    v25 = v14;
    v14 = 0;
LABEL_20:

    goto LABEL_21;
  }
  if (!v12)
  {
    p_super = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v33 = "-[AnalyticsStoreDescriptor initWithType:storeURL:modelURL:options:]";
      __int16 v34 = 1024;
      int v35 = 57;
      v28 = "%{public}s::%d:modelURL is nil";
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  v13->_type = a3;
  objc_storeStrong((id *)&v13->_storeURL, a4);
  objc_storeStrong((id *)&v14->_modelURL, a5);
  unint64_t v15 = a6 & 1;
  unint64_t v16 = a6 & 2;
  v17 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v33 = "-[AnalyticsStoreDescriptor initWithType:storeURL:modelURL:options:]";
    __int16 v34 = 1024;
    int v35 = 66;
    __int16 v36 = 1024;
    v37[0] = a6 & 1;
    LOWORD(v37[1]) = 1024;
    *(_DWORD *)((char *)&v37[1] + 2) = v16 >> 1;
    _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:setupXPCStore: %d migrateIfNecessary: %d", buf, 0x1Eu);
  }

  v14->_analyticsStoreOptions = a6;
  v18 = [MEMORY[0x263EFF328] persistentStoreDescriptionWithURL:v14->_storeURL];
  [v18 setType:*MEMORY[0x263EFF168]];
  [v18 setConfiguration:@"Default"];
  if (!v16 || v14->_type)
  {
    [v18 setShouldAddStoreAsynchronously:0];
    if (!v16) {
      [v18 setOption:*MEMORY[0x263F08088] forKey:*MEMORY[0x263EFF0E0]];
    }
  }
  else
  {
    [v18 setShouldInferMappingModelAutomatically:1];
    [v18 setShouldMigrateStoreAutomatically:1];
    [v18 setShouldAddStoreAsynchronously:0];
  }
  if (v15 && !v14->_type)
  {
    [v18 setOption:@"com.apple.wifianalyticsd.devicestore" forKey:*MEMORY[0x263EFF1B8]];
    uint64_t v19 = MEMORY[0x263EFFA88];
    [v18 setOption:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFF1A0]];
    [v18 setOption:v19 forKey:*MEMORY[0x263EFF108]];
  }
  objc_storeStrong((id *)&v14->_storeDescription, v18);
  if (v15 && !v14->_type)
  {
    id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v20 setObject:@"com.apple.wifianalyticsd.devicestore" forKeyedSubscript:*MEMORY[0x263EFF1B8]];
    uint64_t v21 = MEMORY[0x263EFFA88];
    [v20 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263EFF1B0]];
    [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x263EFF1A0]];
    [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x263EFF100]];
    [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x263EFF108]];
    if (!v16)
    {
      v22 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v33 = "-[AnalyticsStoreDescriptor initWithType:storeURL:modelURL:options:]";
        __int16 v34 = 1024;
        int v35 = 105;
        __int16 v36 = 2080;
        *(void *)v37 = "-[AnalyticsStoreDescriptor initWithType:storeURL:modelURL:options:]";
        _os_log_impl(&dword_21D96D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: Reducing NSPersistentStoreConnectionPoolMaxSizeKey to 2 since proc is not wifianalyticsd", buf, 0x1Cu);
      }

      [v20 setObject:&unk_26CE65DD0 forKeyedSubscript:*MEMORY[0x263EFF0B8]];
    }
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __67__AnalyticsStoreDescriptor_initWithType_storeURL_modelURL_options___block_invoke;
    v29[3] = &unk_264465F58;
    v23 = (NSDictionary *)v20;
    v30 = v23;
    +[WAUtil getLazyNSNumberPreference:@"NSPersistentStoreConnectionPoolMaxSizeKey" domain:@"com.apple.wifi.analytics" exists:v29];
    remoteStoreOptions = v14->_remoteStoreOptions;
    v14->_remoteStoreOptions = v23;
    v25 = v23;

    p_super = &v30->super;
    goto LABEL_20;
  }
LABEL_21:

  return v14;
}

void __67__AnalyticsStoreDescriptor_initWithType_storeURL_modelURL_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446978;
    v7 = "-[AnalyticsStoreDescriptor initWithType:storeURL:modelURL:options:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 111;
    __int16 v10 = 2080;
    id v11 = "-[AnalyticsStoreDescriptor initWithType:storeURL:modelURL:options:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = [v3 unsignedIntValue];
    _os_log_impl(&dword_21D96D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: OVERRIDING NSPersistentStoreConnectionPoolMaxSizeKey to %u", (uint8_t *)&v6, 0x22u);
  }

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "unsignedIntValue"));
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:*MEMORY[0x263EFF0B8]];
}

+ (id)applicationSupportDirectoryPath
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  v2 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  id v3 = v2;
  if (!v2)
  {
    id v20 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v30 = "+[AnalyticsStoreDescriptor applicationSupportDirectoryPath]";
      __int16 v31 = 1024;
      LODWORD(v32) = 129;
LABEL_19:
      _os_log_impl(&dword_21D96D000, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:NSCachesDirectory paths nil", buf, 0x12u);
    }
LABEL_20:

LABEL_8:
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __59__AnalyticsStoreDescriptor_applicationSupportDirectoryPath__block_invoke;
    v21[3] = &unk_264465F80;
    v21[4] = &v23;
    +[WAUtil getLazyNSNumberPreference:@"applicationSupportDirectoryPathNil" domain:@"com.apple.wifi.analytics" exists:v21];
    id v16 = (id)v24[5];
    goto LABEL_12;
  }
  uint64_t v4 = [v2 firstObject];
  v5 = (void *)v24[5];
  v24[5] = v4;

  int v6 = (void *)v24[5];
  if (!v6)
  {
    id v20 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v30 = "+[AnalyticsStoreDescriptor applicationSupportDirectoryPath]";
      __int16 v31 = 1024;
      LODWORD(v32) = 132;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  uint64_t v7 = [v6 stringByAppendingPathComponent:@"com.apple.wifianalyticsd"];
  __int16 v8 = (void *)v24[5];
  v24[5] = v7;

  int v9 = [MEMORY[0x263F08850] defaultManager];
  char v10 = [v9 fileExistsAtPath:v24[5]];

  if (v10) {
    goto LABEL_8;
  }
  id v11 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v12 = v24[5];
  id v22 = 0;
  char v13 = [v11 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v22];
  id v14 = v22;

  char v15 = v14 ? 0 : v13;
  if (v15) {
    goto LABEL_8;
  }
  v17 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    uint64_t v19 = (const char *)v24[5];
    *(_DWORD *)buf = 138412546;
    v30 = v19;
    __int16 v31 = 2112;
    id v32 = v14;
    _os_log_fault_impl(&dword_21D96D000, v17, OS_LOG_TYPE_FAULT, "Unable to create directory at %@: %@", buf, 0x16u);
  }

  id v16 = 0;
LABEL_12:

  _Block_object_dispose(&v23, 8);
  return v16;
}

void __59__AnalyticsStoreDescriptor_applicationSupportDirectoryPath__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([a2 BOOLValue])
  {
    id v3 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446722;
      uint64_t v7 = "+[AnalyticsStoreDescriptor applicationSupportDirectoryPath]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 154;
      __int16 v10 = 2080;
      id v11 = "+[AnalyticsStoreDescriptor applicationSupportDirectoryPath]_block_invoke";
      _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: OVERRIDING applicationSupportDirectoryPath to nil", (uint8_t *)&v6, 0x1Cu);
    }

    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
}

+ (id)defaultPersistentStoreURL
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__AnalyticsStoreDescriptor_defaultPersistentStoreURL__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals != -1) {
    dispatch_once(&_MergedGlobals, block);
  }
  v2 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v7 = "+[AnalyticsStoreDescriptor defaultPersistentStoreURL]";
    __int16 v8 = 1024;
    int v9 = 179;
    __int16 v10 = 2112;
    uint64_t v11 = qword_26AA93C80;
    _os_log_impl(&dword_21D96D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:defaultPersistentStoreURL is %@", buf, 0x1Cu);
  }

  id v3 = (void *)qword_26AA93C80;
  return v3;
}

void __53__AnalyticsStoreDescriptor_defaultPersistentStoreURL__block_invoke()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v0 = [(id)objc_opt_class() applicationSupportDirectoryPath];
  if (!v0)
  {
    uint64_t v7 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      goto LABEL_4;
    }
    LOWORD(v11) = 0;
    __int16 v8 = "applicationSupportDirectoryPath is nil";
    int v9 = v7;
    uint32_t v10 = 2;
LABEL_10:
    _os_log_fault_impl(&dword_21D96D000, v9, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v11, v10);
    goto LABEL_8;
  }
  uint64_t v1 = [NSURL fileURLWithPath:v0];
  v2 = (void *)qword_26AA93C80;
  qword_26AA93C80 = v1;

  if (!qword_26AA93C80)
  {
    uint64_t v7 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    int v11 = 138412290;
    uint64_t v12 = v0;
    __int16 v8 = "defaultPersistentStoreURL is nil with path %@";
    int v9 = v7;
    uint32_t v10 = 12;
    goto LABEL_10;
  }
  uint64_t v3 = [(id)qword_26AA93C80 URLByAppendingPathComponent:@"DeviceAnalyticsModel"];
  uint64_t v4 = (void *)qword_26AA93C80;
  qword_26AA93C80 = v3;

  uint64_t v5 = [(id)qword_26AA93C80 URLByAppendingPathExtension:@"sqlite"];
  int v6 = (void *)qword_26AA93C80;
  qword_26AA93C80 = v5;

LABEL_4:
}

+ (id)defaultModelURL
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (qword_26AA93C88 != -1) {
    dispatch_once(&qword_26AA93C88, &__block_literal_global);
  }
  v2 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446722;
    int v6 = "+[AnalyticsStoreDescriptor defaultModelURL]";
    __int16 v7 = 1024;
    int v8 = 198;
    __int16 v9 = 2112;
    uint64_t v10 = qword_26AA93C90;
    _os_log_impl(&dword_21D96D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:defaultModelURL is %@", (uint8_t *)&v5, 0x1Cu);
  }

  uint64_t v3 = (void *)qword_26AA93C90;
  return v3;
}

void __43__AnalyticsStoreDescriptor_defaultModelURL__block_invoke()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v0 = +[WAUtil resourcePath];
  uint64_t v1 = [NSURL fileURLWithPath:v0];
  v2 = (void *)qword_26AA93C90;
  qword_26AA93C90 = v1;

  if (qword_26AA93C90)
  {
    uint64_t v3 = [(id)qword_26AA93C90 URLByAppendingPathComponent:@"DeviceAnalyticsModel"];
    uint64_t v4 = (void *)qword_26AA93C90;
    qword_26AA93C90 = v3;

    uint64_t v5 = [(id)qword_26AA93C90 URLByAppendingPathExtension:@"momd"];
    int v6 = (void *)qword_26AA93C90;
    qword_26AA93C90 = v5;
  }
  else
  {
    __int16 v7 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      __int16 v9 = "+[AnalyticsStoreDescriptor defaultModelURL]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 194;
      __int16 v12 = 2112;
      uint64_t v13 = v0;
      _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:ERROR defaultModelURL is nil with path %@", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (void)setStoreURL:(id)a3
{
}

- (NSDictionary)remoteStoreOptions
{
  return self->_remoteStoreOptions;
}

- (NSPersistentStoreDescription)storeDescription
{
  return self->_storeDescription;
}

- (unint64_t)analyticsStoreOptions
{
  return self->_analyticsStoreOptions;
}

- (void)setAnalyticsStoreOptions:(unint64_t)a3
{
  self->_analyticsStoreOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeDescription, 0);
  objc_storeStrong((id *)&self->_remoteStoreOptions, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
}

@end