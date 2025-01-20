@interface SAAppSizerResults
+ (BOOL)supportsSecureCoding;
- (NSDictionary)appData;
- (NSDictionary)appsInfo;
- (NSDictionary)reportedTelemetry;
- (NSDictionary)systemDataDetails;
- (NSDictionary)systemDetails;
- (NSMutableArray)zeroSizeApps;
- (NSMutableDictionary)FSPurgeableData;
- (NSMutableDictionary)appsDataInternal;
- (NSMutableDictionary)appsList;
- (NSMutableDictionary)attributionTags;
- (NSMutableDictionary)clonesInfo;
- (NSMutableDictionary)hiddenAppsData;
- (NSMutableDictionary)pathsList;
- (SAAppSizeBreakdownList)appSizeBreakdownList;
- (SAAppSizerResults)init;
- (SAAppSizerResults)initWithCoder:(id)a3;
- (id)convertBundlesKeyToBundlesSet:(id)a3;
- (id)convertBundlesSetToBundlesKey:(id)a3;
- (id)mergeAppSet:(id)a3 withAppSet:(id)a4;
- (int64_t)status;
- (int64_t)time;
- (unint64_t)diskCapacity;
- (unint64_t)diskUsed;
- (unint64_t)postProcessFilteringWithAppPathList:(id)a3;
- (unint64_t)totalCDAvailable;
- (unint64_t)totalPurgeableClones;
- (unsigned)initDiskUsedAndCapacity;
- (void)accountSUPurgeableFor:(id)a3 purgeableSize:(unint64_t)a4;
- (void)addSystemVolumeWithCapacity:(unint64_t)a3 used:(unint64_t)a4 withReplyBlock:(id)a5;
- (void)enableAppSizeBreakdown;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAppsDataUsingBlock:(id)a3;
- (void)initDiskUsedAndCapacity;
- (void)populateAppsData;
- (void)postProcessMerging;
- (void)print;
- (void)removeBundleSet:(id)a3;
- (void)setAppData:(id)a3;
- (void)setAppSet:(id)a3 vendorName:(id)a4;
- (void)setAppSet:(id)a3 withAppSize:(id)a4;
- (void)setAppSizeBreakdownList:(id)a3;
- (void)setAppsDataInternal:(id)a3;
- (void)setAppsInfo:(id)a3;
- (void)setAppsList:(id)a3;
- (void)setAttributionTags:(id)a3;
- (void)setClonesInfo:(id)a3;
- (void)setDiskCapacity:(unint64_t)a3;
- (void)setDiskUsed:(unint64_t)a3;
- (void)setDiskUsed:(unint64_t)a3 andCapacity:(unint64_t)a4;
- (void)setFSPurgeableData:(id)a3;
- (void)setHiddenAppsData:(id)a3;
- (void)setPathsList:(id)a3;
- (void)setReportedTelemetry:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setSystemDataDetails:(id)a3;
- (void)setSystemDetails:(id)a3;
- (void)setTime:(int64_t)a3;
- (void)setTotalCDAvailable:(unint64_t)a3;
- (void)setTotalPurgeableClones:(unint64_t)a3;
- (void)setZeroSizeApps:(id)a3;
- (void)updateAppSet:(id)a3 fixedSize:(unint64_t)a4 dataSize:(unint64_t)a5 cloneSize:(unint64_t)a6 purgeableSize:(unint64_t)a7 FSPurgeableSize:(unint64_t)a8 physicalSize:(unint64_t)a9 appCacheSize:(unint64_t)a10 CDPluginSize:(unint64_t)a11;
- (void)updateAppSet:(id)a3 withAppSize:(id)a4;
- (void)updateBundleID:(id)a3 WithCloneSize:(unint64_t)a4;
- (void)updateBundleID:(id)a3 withDataSize:(unint64_t)a4;
- (void)updateHiddenApp:(id)a3 withSUPurgeableSize:(unint64_t)a4;
- (void)updateSystemDataDetailsWith:(id)a3 andSize:(unint64_t)a4;
- (void)updateTimestamp;
- (void)zeroSizeAppsFiltering;
@end

@implementation SAAppSizerResults

- (SAAppSizerResults)init
{
  v25.receiver = self;
  v25.super_class = (Class)SAAppSizerResults;
  v2 = [(SAAppSizerResults *)&v25 init];
  v3 = (SAAppSizerResults *)v2;
  if (v2)
  {
    *((void *)v2 + 3) = 0;
    *((void *)v2 + 4) = 0;
    *((void *)v2 + 16) = 0;
    *((void *)v2 + 17) = 0;
    *(_OWORD *)(v2 + 8) = xmmword_25E2CF840;
    uint64_t v4 = objc_opt_new();
    appsDataInternal = v3->_appsDataInternal;
    v3->_appsDataInternal = (NSMutableDictionary *)v4;

    reportedTelemetry = v3->_reportedTelemetry;
    v3->_reportedTelemetry = 0;

    uint64_t v7 = objc_opt_new();
    pathsList = v3->_pathsList;
    v3->_pathsList = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    attributionTags = v3->_attributionTags;
    v3->_attributionTags = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    clonesInfo = v3->_clonesInfo;
    v3->_clonesInfo = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    systemDataDetails = v3->_systemDataDetails;
    v3->_systemDataDetails = (NSDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    hiddenAppsData = v3->_hiddenAppsData;
    v3->_hiddenAppsData = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_opt_new();
    appsList = v3->_appsList;
    v3->_appsList = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    zeroSizeApps = v3->_zeroSizeApps;
    v3->_zeroSizeApps = (NSMutableArray *)v19;

    uint64_t v21 = objc_opt_new();
    systemDetails = v3->_systemDetails;
    v3->_systemDetails = (NSDictionary *)v21;

    appSizeBreakdownList = v3->_appSizeBreakdownList;
    v3->_appSizeBreakdownList = 0;
  }
  return v3;
}

- (void)enableAppSizeBreakdown
{
  self->_appSizeBreakdownList = (SAAppSizeBreakdownList *)objc_opt_new();
  MEMORY[0x270F9A758]();
}

- (id)convertBundlesSetToBundlesKey:(id)a3
{
  return +[SAUtilities createCommaSeparatedString:a3];
}

- (id)convertBundlesKeyToBundlesSet:(id)a3
{
  return +[SAUtilities breakCommaSeparatedStringToComponents:a3];
}

- (void)populateAppsData
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__1;
  v8 = __Block_byref_object_dispose__1;
  id v9 = (id)objc_opt_new();
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37__SAAppSizerResults_populateAppsData__block_invoke;
  v3[3] = &unk_26551E7F8;
  v3[4] = &v4;
  [(SAAppSizerResults *)self enumerateAppsDataUsingBlock:v3];
  objc_storeStrong((id *)&self->_appData, (id)v5[5]);
  _Block_object_dispose(&v4, 8);
}

uint64_t __37__SAAppSizerResults_populateAppsData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:a3 forKeyedSubscript:a2];
}

- (void)updateAppSet:(id)a3 fixedSize:(unint64_t)a4 dataSize:(unint64_t)a5 cloneSize:(unint64_t)a6 purgeableSize:(unint64_t)a7 FSPurgeableSize:(unint64_t)a8 physicalSize:(unint64_t)a9 appCacheSize:(unint64_t)a10 CDPluginSize:(unint64_t)a11
{
  id v22 = a3;
  uint64_t v17 = self->_appsDataInternal;
  objc_sync_enter(v17);
  v18 = [(SAAppSizerResults *)self convertBundlesSetToBundlesKey:v22];
  uint64_t v19 = [(NSMutableDictionary *)self->_appsDataInternal objectForKey:v18];
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "setFixedSize:", objc_msgSend(v19, "fixedSize") + a4);
    objc_msgSend(v20, "setDataSize:", objc_msgSend(v20, "dataSize") + a5);
    objc_msgSend(v20, "setCloneSize:", objc_msgSend(v20, "cloneSize") + a6);
    objc_msgSend(v20, "setPurgeableSize:", objc_msgSend(v20, "purgeableSize") + a7);
    objc_msgSend(v20, "setPhysicalSize:", objc_msgSend(v20, "physicalSize") + a9);
    objc_msgSend(v20, "setFSPurgeableSize:", objc_msgSend(v20, "FSPurgeableSize") + a8);
    objc_msgSend(v20, "setAppCacheSize:", objc_msgSend(v20, "appCacheSize") + a10);
    objc_msgSend(v20, "setCacheDeletePluginSize:", objc_msgSend(v20, "cacheDeletePluginSize") + a11);
  }
  else
  {
    id v21 = +[SAAppSize newWithFixedSize:a4 dataSize:a5 cloneSize:a6 purgeableSize:a7 FSPurgeableSize:a8 physicalSize:a9 appCacheSize:a10 CDPluginSize:a11];
    [(NSMutableDictionary *)self->_appsDataInternal setObject:v21 forKey:v18];
  }
  objc_sync_exit(v17);
}

- (void)setAppSet:(id)a3 vendorName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self->_appsDataInternal;
  objc_sync_enter(v8);
  id v9 = [(SAAppSizerResults *)self convertBundlesSetToBundlesKey:v6];
  v10 = [(NSMutableDictionary *)self->_appsDataInternal objectForKey:v9];
  uint64_t v11 = v10;
  if (v10)
  {
    [v10 setVendorName:v7];
  }
  else
  {
    v12 = SALog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SAAppSizerResults setAppSet:vendorName:]();
    }
  }
  objc_sync_exit(v8);
}

- (void)setAppSet:(id)a3 withAppSize:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = self->_appsDataInternal;
  objc_sync_enter(v7);
  v8 = [(SAAppSizerResults *)self convertBundlesSetToBundlesKey:v10];
  id v9 = [(NSMutableDictionary *)self->_appsDataInternal objectForKey:v8];
  if (v9)
  {
    objc_msgSend(v9, "setFixedSize:", objc_msgSend(v6, "fixedSize"));
    objc_msgSend(v9, "setDataSize:", objc_msgSend(v6, "dataSize"));
    objc_msgSend(v9, "setCloneSize:", objc_msgSend(v6, "cloneSize"));
    objc_msgSend(v9, "setPurgeableSize:", objc_msgSend(v6, "purgeableSize"));
    objc_msgSend(v9, "setPhysicalSize:", objc_msgSend(v6, "physicalSize"));
    objc_msgSend(v9, "setFSPurgeableSize:", objc_msgSend(v6, "FSPurgeableSize"));
    objc_msgSend(v9, "setAppCacheSize:", objc_msgSend(v6, "appCacheSize"));
    objc_msgSend(v9, "setCacheDeletePluginSize:", objc_msgSend(v6, "cacheDeletePluginSize"));
  }
  else
  {
    [(NSMutableDictionary *)self->_appsDataInternal setObject:v6 forKey:v8];
  }

  objc_sync_exit(v7);
}

- (void)updateAppSet:(id)a3 withAppSize:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = self->_appsDataInternal;
  objc_sync_enter(v7);
  v8 = [(SAAppSizerResults *)self convertBundlesSetToBundlesKey:v10];
  id v9 = [(NSMutableDictionary *)self->_appsDataInternal objectForKey:v8];
  if (v9)
  {
    objc_msgSend(v9, "setFixedSize:", objc_msgSend(v9, "fixedSize") + objc_msgSend(v6, "fixedSize"));
    objc_msgSend(v9, "setDataSize:", objc_msgSend(v9, "dataSize") + objc_msgSend(v6, "dataSize"));
    objc_msgSend(v9, "setCloneSize:", objc_msgSend(v9, "cloneSize") + objc_msgSend(v6, "cloneSize"));
    objc_msgSend(v9, "setPurgeableSize:", objc_msgSend(v9, "purgeableSize") + objc_msgSend(v6, "purgeableSize"));
    objc_msgSend(v9, "setPhysicalSize:", objc_msgSend(v9, "physicalSize") + objc_msgSend(v6, "physicalSize"));
    objc_msgSend(v9, "setFSPurgeableSize:", objc_msgSend(v9, "FSPurgeableSize") + objc_msgSend(v6, "FSPurgeableSize"));
    objc_msgSend(v9, "setAppCacheSize:", objc_msgSend(v9, "appCacheSize") + objc_msgSend(v6, "appCacheSize"));
    objc_msgSend(v9, "setCacheDeletePluginSize:", objc_msgSend(v9, "cacheDeletePluginSize") + objc_msgSend(v6, "cacheDeletePluginSize"));
  }
  else
  {
    [(NSMutableDictionary *)self->_appsDataInternal setObject:v6 forKey:v8];
  }

  objc_sync_exit(v7);
}

- (void)accountSUPurgeableFor:(id)a3 purgeableSize:(unint64_t)a4
{
  id v8 = [(SAAppSizerResults *)self convertBundlesSetToBundlesKey:a3];
  id v6 = -[NSMutableDictionary objectForKey:](self->_appsDataInternal, "objectForKey:");
  id v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setDataSize:", objc_msgSend(v6, "dataSize") + a4);
    objc_msgSend(v7, "setPurgeableSize:", objc_msgSend(v7, "purgeableSize") - a4);
  }
  else
  {
    [(SAAppSizerResults *)self updateHiddenApp:v8 withSUPurgeableSize:a4];
  }
}

- (void)updateHiddenApp:(id)a3 withSUPurgeableSize:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_hiddenAppsData objectForKey:v6];
  id v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setDataSize:", objc_msgSend(v7, "dataSize") + a4);
    objc_msgSend(v8, "setPurgeableSize:", objc_msgSend(v8, "purgeableSize") - a4);
  }
  else
  {
    id v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SAAppSizerResults updateHiddenApp:withSUPurgeableSize:]();
    }
  }
  id v10 = [(NSDictionary *)self->_systemDataDetails objectForKey:v6];
  systemDataDetails = self->_systemDataDetails;
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v10, "unsignedLongLongValue") + a4);
  [(NSDictionary *)systemDataDetails setValue:v12 forKey:v6];
}

- (id)mergeAppSet:(id)a3 withAppSet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 allObjects];
  uint64_t v19 = (void *)[v8 mutableCopy];

  id v9 = [v6 allObjects];
  [v19 addObjectsFromArray:v9];

  id v18 = [MEMORY[0x263EFFA08] setWithArray:v19];
  v16 = [(SAAppSizerResults *)self convertBundlesSetToBundlesKey:v7];

  uint64_t v15 = [(SAAppSizerResults *)self convertBundlesSetToBundlesKey:v6];

  uint64_t v17 = [(SAAppSizerResults *)self convertBundlesSetToBundlesKey:v18];
  id v10 = [(NSMutableDictionary *)self->_appsDataInternal objectForKey:v16];
  uint64_t v11 = [(NSMutableDictionary *)self->_appsDataInternal objectForKey:v15];
  id v12 = +[SAAppSize newWithFixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:](SAAppSize, "newWithFixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:", [v11 fixedSize] + objc_msgSend(v10, "fixedSize"), objc_msgSend(v11, "dataSize") + objc_msgSend(v10, "dataSize"), objc_msgSend(v11, "cloneSize") + objc_msgSend(v10, "cloneSize"), objc_msgSend(v11, "purgeableSize") + objc_msgSend(v10, "purgeableSize"), objc_msgSend(v11, "FSPurgeableSize") + objc_msgSend(v10, "FSPurgeableSize"), objc_msgSend(v11, "physicalSize") + objc_msgSend(v10, "physicalSize"), objc_msgSend(v11, "appCacheSize") + objc_msgSend(v10, "appCacheSize"), objc_msgSend(v11, "cacheDeletePluginSize") + objc_msgSend(v10, "cacheDeletePluginSize"));
  uint64_t v13 = [v10 vendorName];
  [v12 setVendorName:v13];

  [(NSMutableDictionary *)self->_appsDataInternal removeObjectForKey:v16];
  [(NSMutableDictionary *)self->_appsDataInternal removeObjectForKey:v15];
  [(NSMutableDictionary *)self->_appsDataInternal setObject:v12 forKey:v17];

  return v18;
}

- (void)updateSystemDataDetailsWith:(id)a3 andSize:(unint64_t)a4
{
  id v9 = a3;
  id v6 = -[SAAppSizerResults convertBundlesSetToBundlesKey:](self, "convertBundlesSetToBundlesKey:");
  id v7 = self->_systemDataDetails;
  objc_sync_enter(v7);
  id v8 = [(NSDictionary *)self->_systemDataDetails objectForKey:v6];
  if (!v8)
  {
    id v8 = [NSNumber numberWithUnsignedLongLong:a4];
  }
  [(NSDictionary *)self->_systemDataDetails setValue:v8 forKey:v6];

  objc_sync_exit(v7);
}

- (void)enumerateAppsDataUsingBlock:(id)a3
{
  id v4 = a3;
  appsDataInternal = self->_appsDataInternal;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SAAppSizerResults_enumerateAppsDataUsingBlock___block_invoke;
  v7[3] = &unk_26551E820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)appsDataInternal enumerateKeysAndObjectsUsingBlock:v7];
}

void __49__SAAppSizerResults_enumerateAppsDataUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 convertBundlesKeyToBundlesSet:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)print
{
  v2 = self;
  v50[2] = *MEMORY[0x263EF8340];
  *(void *)__s = 0;
  uint64_t v49 = 0;
  *(void *)((char *)v50 + 6) = 0;
  v50[0] = 0;
  ctime_r(&self->_time, __s);
  __s[strlen(__s) - 1] = 0;
  v3 = SALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [@"time" UTF8String];
    uint64_t v5 = [@"diskUsed" UTF8String];
    unint64_t diskCapacity = v2->_diskCapacity;
    uint64_t v7 = [@"diskUsed" UTF8String];
    unint64_t diskUsed = v2->_diskUsed;
    *(_DWORD *)buf = 136316418;
    uint64_t v37 = v4;
    __int16 v38 = 2080;
    v39 = __s;
    __int16 v40 = 2080;
    uint64_t v41 = v5;
    __int16 v42 = 2048;
    uint64_t v43 = diskCapacity;
    __int16 v44 = 2080;
    uint64_t v45 = v7;
    __int16 v46 = 2048;
    uint64_t v47 = diskUsed;
    _os_log_impl(&dword_25E2BB000, v3, OS_LOG_TYPE_DEFAULT, "%s: %s\n%s: %llu\n%s: %llu\napps data:\n", buf, 0x3Eu);
  }

  appsDataInternal = v2->_appsDataInternal;
  if (appsDataInternal)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obj = appsDataInternal;
    uint64_t v10 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v10)
    {
      uint64_t v12 = v10;
      uint64_t v13 = *(void *)v32;
      *(void *)&long long v11 = 136316418;
      long long v28 = v11;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          -[SAAppSizerResults convertBundlesSetToBundlesKey:](v2, "convertBundlesSetToBundlesKey:", v15, v28);
          v16 = (char *)objc_claimAutoreleasedReturnValue();
          uint64_t v17 = [(NSMutableDictionary *)v2->_appsDataInternal objectForKeyedSubscript:v16];
          id v18 = SALog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v19 = [v15 count];
            v20 = "app";
            if (v19 > 1) {
              v20 = "apps";
            }
            v30 = v20;
            uint64_t v21 = [v17 fixedSize];
            uint64_t v22 = [v17 dataSize];
            v23 = v2;
            uint64_t v24 = v12;
            uint64_t v25 = v13;
            uint64_t v26 = [v17 cloneSize];
            uint64_t v27 = [v17 purgeableSize];
            *(_DWORD *)buf = v28;
            uint64_t v37 = (uint64_t)v30;
            __int16 v38 = 2112;
            v39 = v16;
            __int16 v40 = 2048;
            uint64_t v41 = v21;
            __int16 v42 = 2048;
            uint64_t v43 = v22;
            __int16 v44 = 2048;
            uint64_t v45 = v26;
            uint64_t v13 = v25;
            uint64_t v12 = v24;
            v2 = v23;
            __int16 v46 = 2048;
            uint64_t v47 = v27;
            _os_log_impl(&dword_25E2BB000, v18, OS_LOG_TYPE_DEFAULT, "%s: %@\nfixed size: %llu\ndata size: %llu\nclone size: %llu\npurgeable size: %llu\n\n", buf, 0x3Eu);
          }
        }
        uint64_t v12 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v12);
    }
  }
}

- (void)updateTimestamp
{
  self->_time = time(0);
}

- (void)updateBundleID:(id)a3 WithCloneSize:(unint64_t)a4
{
  id v6 = (__CFString *)a3;
  uint64_t v7 = [(NSMutableDictionary *)self->_appsDataInternal objectForKey:v6];
  id v8 = v6;
  if (!v7)
  {
    id v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SAAppSizerResults updateBundleID:WithCloneSize:]((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
    }

    id v8 = @"com.apple.fakeapp.SystemData";
    uint64_t v16 = [(NSMutableDictionary *)self->_appsDataInternal objectForKey:@"com.apple.fakeapp.SystemData"];
    if (v16)
    {
      uint64_t v7 = (void *)v16;
    }
    else
    {
      uint64_t v17 = SALog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[SAAppSizerResults updateBundleID:WithCloneSize:](v17);
      }

      uint64_t v7 = objc_opt_new();
      id v8 = @"com.apple.fakeapp.SystemData";
    }
  }
  objc_msgSend(v7, "setCloneSize:", objc_msgSend(v7, "cloneSize") + a4);
  objc_msgSend(v7, "setDataSize:", objc_msgSend(v7, "dataSize") + a4);
  [(NSMutableDictionary *)self->_appsDataInternal setObject:v7 forKey:v8];
}

- (void)updateBundleID:(id)a3 withDataSize:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSMutableDictionary *)self->_appsDataInternal objectForKey:v6];
  id v8 = SALog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9) {
      -[SAAppSizerResults updateBundleID:withDataSize:]();
    }
  }
  else
  {
    if (v9) {
      -[SAAppSizerResults updateBundleID:withDataSize:]();
    }

    uint64_t v7 = objc_opt_new();
  }
  objc_msgSend(v7, "setDataSize:", objc_msgSend(v7, "dataSize") + a4);
  [(NSMutableDictionary *)self->_appsDataInternal setObject:v7 forKey:v6];
}

- (void)addSystemVolumeWithCapacity:(unint64_t)a3 used:(unint64_t)a4 withReplyBlock:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  appsDataInternal = self->_appsDataInternal;
  id v8 = (void (**)(id, void *, uint64_t, uint64_t))a5;
  BOOL v9 = [(NSMutableDictionary *)appsDataInternal objectForKey:@"com.apple.fakeapp.System"];
  if (!v9)
  {
    uint64_t v10 = SALog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[SAAppSizerResults addSystemVolumeWithCapacity:used:withReplyBlock:](v10);
    }

    BOOL v9 = objc_opt_new();
  }
  [v9 setDataSize:a4];
  [v9 setFixedSize:0];
  [(NSMutableDictionary *)self->_appsDataInternal setObject:v9 forKey:@"com.apple.fakeapp.System"];
  uint64_t v11 = SALog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    uint64_t v14 = @"com.apple.fakeapp.System";
    __int16 v15 = 2048;
    uint64_t v16 = [v9 dataSize];
    __int16 v17 = 2048;
    uint64_t v18 = [v9 fixedSize];
    _os_log_impl(&dword_25E2BB000, v11, OS_LOG_TYPE_DEFAULT, "Adding for %@ - data size: %llu, fixed size: %llu", (uint8_t *)&v13, 0x20u);
  }

  uint64_t v12 = [MEMORY[0x263EFFA08] setWithObject:@"com.apple.fakeapp.System"];
  v8[2](v8, v12, [v9 dataSize], objc_msgSend(v9, "fixedSize"));
}

- (void)removeBundleSet:(id)a3
{
  if (a3)
  {
    -[SAAppSizerResults convertBundlesSetToBundlesKey:](self, "convertBundlesSetToBundlesKey:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableDictionary *)self->_appsDataInternal removeObjectForKey:v4];
  }
}

- (void)zeroSizeAppsFiltering
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(NSMutableDictionary *)self->_appsDataInternal allKeys];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        BOOL v9 = (void *)MEMORY[0x2611D1170]();
        uint64_t v10 = [(NSMutableDictionary *)self->_appsDataInternal objectForKeyedSubscript:v8];
        if (![v10 dataSize] && !objc_msgSend(v10, "fixedSize"))
        {
          uint64_t v11 = SALog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v17 = v8;
            _os_log_debug_impl(&dword_25E2BB000, v11, OS_LOG_TYPE_DEBUG, "Bundle set %@ totalSize is 0", buf, 0xCu);
          }

          [(NSMutableArray *)self->_zeroSizeApps addObject:v8];
          [(NSMutableDictionary *)self->_appsDataInternal removeObjectForKey:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }
}

- (unint64_t)postProcessFilteringWithAppPathList:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v41 = a3;
  [(NSMutableDictionary *)self->_appsDataInternal allKeys];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    unint64_t v39 = 0;
    uint64_t v8 = *(void *)v48;
    *(void *)&long long v6 = 138412290;
    long long v35 = v6;
    id v40 = v4;
    uint64_t v42 = *(void *)v48;
    while (1)
    {
      uint64_t v9 = 0;
      uint64_t v43 = v7;
      do
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v47 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x2611D1170]();
        id v12 = [(SAAppSizerResults *)self convertBundlesKeyToBundlesSet:v10];
        if ([v12 count] != 1) {
          goto LABEL_11;
        }
        long long v13 = [v12 anyObject];
        if (([v13 isEqual:@"com.apple.fakeapp.SystemData"] & 1) == 0
          && ([v13 isEqual:@"com.apple.fakeapp.System"] & 1) == 0
          && ([v13 isEqual:@"com.apple.fakeapp.SoftwareUpdate"] & 1) == 0)
        {

LABEL_11:
          long long v13 = -[NSMutableDictionary objectForKeyedSubscript:](self->_appsDataInternal, "objectForKeyedSubscript:", v10, v35);
          if (!v13) {
            goto LABEL_43;
          }
          if ((unint64_t)[v12 count] < 2) {
            goto LABEL_25;
          }
          if ([v12 containsObject:@"com.apple.FileProvider.LocalStorage"])
          {
            long long v14 = [MEMORY[0x263EFFA08] setWithObject:@"com.apple.FileProvider.LocalStorage"];
            long long v15 = SALog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v52 = (uint64_t)v12;
              __int16 v53 = 2112;
              uint64_t v54 = (uint64_t)v14;
              _os_log_debug_impl(&dword_25E2BB000, v15, OS_LOG_TYPE_DEBUG, "Assign to LocalStorage: bundleID set %@ belongs to %@", buf, 0x16u);
            }

            [(SAAppSizerResults *)self updateAppSet:v14 withAppSize:v13];
            [(NSMutableDictionary *)self->_appsDataInternal removeObjectForKey:v10];
            appSizeBreakdownList = self->_appSizeBreakdownList;
            if (appSizeBreakdownList) {
              [(SAAppSizeBreakdownList *)appSizeBreakdownList updateBundleId:v12 newId:v14];
            }
            id v17 = v14;
            uint64_t v18 = v17;
            id v4 = v40;
LABEL_42:

            id v12 = v18;
            uint64_t v8 = v42;
            uint64_t v7 = v43;
            goto LABEL_43;
          }
          if ([v12 containsObject:@"com.apple.Bridge"])
          {
            uint64_t v19 = [MEMORY[0x263EFF9C0] setWithSet:v12];
            [v19 removeObject:@"com.apple.Bridge"];
            v20 = [MEMORY[0x263EFFA08] setWithSet:v19];
            uint64_t v21 = SALog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v52 = (uint64_t)v12;
              __int16 v53 = 2112;
              uint64_t v54 = (uint64_t)v20;
              _os_log_debug_impl(&dword_25E2BB000, v21, OS_LOG_TYPE_DEBUG, "Remove watch from bundleID set %@ changed to %@", buf, 0x16u);
            }

            [(SAAppSizerResults *)self updateAppSet:v20 withAppSize:v13];
            [(NSMutableDictionary *)self->_appsDataInternal removeObjectForKey:v10];
            uint64_t v22 = self->_appSizeBreakdownList;
            if (v22) {
              [(SAAppSizeBreakdownList *)v22 updateBundleId:v12 newId:v20];
            }
            id v17 = v20;

            uint64_t v18 = v17;
            id v4 = v40;
          }
          else
          {
LABEL_25:
            id v17 = 0;
            uint64_t v18 = v12;
          }
          v23 = [MEMORY[0x263EFF9C0] setWithSet:v18];
          v44[0] = MEMORY[0x263EF8330];
          v44[1] = 3221225472;
          v44[2] = __57__SAAppSizerResults_postProcessFilteringWithAppPathList___block_invoke;
          v44[3] = &unk_26551E848;
          id v45 = v41;
          id v12 = v23;
          id v46 = v12;
          [v18 enumerateObjectsUsingBlock:v44];
          uint64_t v24 = [(SAAppSizerResults *)self convertBundlesSetToBundlesKey:v18];
          if ([v12 count])
          {
            uint64_t v25 = [v12 count];
            if (v25 != [v18 count])
            {
              uint64_t v26 = SALog();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v52 = (uint64_t)v18;
                __int16 v53 = 2112;
                uint64_t v54 = (uint64_t)v12;
                _os_log_debug_impl(&dword_25E2BB000, v26, OS_LOG_TYPE_DEBUG, "Remove hidden: Replacing bundleID set %@ with %@", buf, 0x16u);
              }

              [(SAAppSizerResults *)self updateAppSet:v12 withAppSize:v13];
              [(NSMutableDictionary *)self->_appsDataInternal removeObjectForKey:v24];
              uint64_t v27 = self->_appSizeBreakdownList;
              if (v27) {
                [(SAAppSizeBreakdownList *)v27 updateBundleId:v18 newId:v12];
              }
            }
          }
          else
          {
            long long v28 = [(NSMutableDictionary *)self->_appsDataInternal objectForKeyedSubscript:v24];
            v29 = v28;
            if (v28)
            {
              uint64_t v38 = [v28 dataSize];
              uint64_t v37 = [v29 fixedSize];
              -[SAAppSizerResults updateSystemDataDetailsWith:andSize:](self, "updateSystemDataDetailsWith:andSize:", v18, [v29 fixedSize] + objc_msgSend(v29, "dataSize"));
              v30 = SALog();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v36 = [v29 dataSize];
                uint64_t v33 = [v29 fixedSize];
                *(_DWORD *)buf = 134218498;
                uint64_t v52 = v36;
                __int16 v53 = 2048;
                uint64_t v54 = v33;
                __int16 v55 = 2112;
                v56 = v18;
                _os_log_debug_impl(&dword_25E2BB000, v30, OS_LOG_TYPE_DEBUG, "Remove hidden: dataSize %llu and fixedSize %llu for bundleID set %@", buf, 0x20u);
              }
              v39 += v38 + v37;

              [(NSMutableDictionary *)self->_appsDataInternal removeObjectForKey:v24];
              [(NSMutableDictionary *)self->_hiddenAppsData setObject:v29 forKey:v24];
              long long v31 = self->_appSizeBreakdownList;
              if (v31) {
                [(SAAppSizeBreakdownList *)v31 removeBundleId:v18];
              }
            }
            else
            {
              long long v32 = SALog();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v35;
                uint64_t v52 = (uint64_t)v18;
                _os_log_error_impl(&dword_25E2BB000, v32, OS_LOG_TYPE_ERROR, "filteredData is nil for %@", buf, 0xCu);
              }
            }
            id v4 = v40;
          }

          goto LABEL_42;
        }
LABEL_43:

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v47 objects:v57 count:16];
      if (!v7) {
        goto LABEL_47;
      }
    }
  }
  unint64_t v39 = 0;
LABEL_47:

  return v39;
}

void __57__SAAppSizerResults_postProcessFilteringWithAppPathList___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [*(id *)(a1 + 32) appPathList];
  id v4 = [v3 objectForKeyedSubscript:v8];

  if (!v4
    || ([*(id *)(a1 + 32) appPathList],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKeyedSubscript:v8],
        long long v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isUserVisible],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    [*(id *)(a1 + 40) removeObject:v8];
  }
}

- (void)postProcessMerging
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = [(NSMutableDictionary *)self->_appsDataInternal allKeys];
  id v4 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:100];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    id v23 = v5;
    uint64_t v24 = v4;
    do
    {
      uint64_t v9 = 0;
      uint64_t v25 = v7;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x2611D1170]();
        id v12 = [(NSMutableDictionary *)self->_appsDataInternal objectForKeyedSubscript:v10];
        long long v13 = [(SAAppSizerResults *)self convertBundlesKeyToBundlesSet:v10];
        if ((unint64_t)[v13 count] >= 2)
        {
          long long v14 = [v12 vendorName];
          if (v14)
          {
            long long v15 = [v4 objectForKeyedSubscript:v14];

            if (v15)
            {
              uint64_t v16 = [v4 objectForKeyedSubscript:v14];
              id v17 = [(SAAppSizerResults *)self mergeAppSet:v16 withAppSet:v13];
              uint64_t v18 = SALog();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                long long v31 = v13;
                _os_log_debug_impl(&dword_25E2BB000, v18, OS_LOG_TYPE_DEBUG, "Merging %@", buf, 0xCu);
              }

              uint64_t v19 = SALog();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                long long v31 = v16;
                _os_log_debug_impl(&dword_25E2BB000, v19, OS_LOG_TYPE_DEBUG, "and %@", buf, 0xCu);
              }

              v20 = SALog();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                long long v31 = v17;
                _os_log_debug_impl(&dword_25E2BB000, v20, OS_LOG_TYPE_DEBUG, "to %@", buf, 0xCu);
              }

              uint64_t v21 = SALog();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                long long v31 = v14;
                _os_log_debug_impl(&dword_25E2BB000, v21, OS_LOG_TYPE_DEBUG, "for vendor %@", buf, 0xCu);
              }

              [v24 setObject:v17 forKeyedSubscript:v14];
              appSizeBreakdownList = self->_appSizeBreakdownList;
              if (appSizeBreakdownList) {
                [(SAAppSizeBreakdownList *)appSizeBreakdownList mergeBundleId:v13 withBundleId:v16 newBundleId:v17];
              }

              id v5 = v23;
              id v4 = v24;
            }
            else
            {
              [v4 setObject:v13 forKeyedSubscript:v14];
            }
          }

          uint64_t v7 = v25;
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v7);
  }
}

- (unsigned)initDiskUsedAndCapacity
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  int v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  v26[2] = 0;
  v26[0] = 5;
  v26[1] = 2155872284;
  int v3 = getattrlist("/", v26, &v23, 0x24uLL, 1u);
  id v4 = SALog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SAAppSizerResults initDiskUsedAndCapacity].cold.5();
    }
    unsigned __int8 v6 = 3;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      [(SAAppSizerResults *)(uint64_t)&v23 initDiskUsedAndCapacity];
    }

    id v5 = [MEMORY[0x263F7B0A0] syncSharedManager];
    v20 = [v5 diskForPath:@"/"];
    uint64_t v21 = [v20 container];
    uint64_t v7 = [v21 designatedPhysicalStore];
    uint64_t v8 = [v5 wholeDiskForDisk:v7];
    uint64_t v9 = [v8 diskIdentifier];
    uint64_t v10 = SALog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v28 = v9;
      _os_log_impl(&dword_25E2BB000, v10, OS_LOG_TYPE_DEFAULT, "Root volume disk: %@", buf, 0xCu);
    }

    id v22 = 0;
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F3A400]) initWithDevName:v9 error:&v22];
    id v12 = v22;
    if (v11)
    {
      long long v13 = [v11 copyPropertyWithClass:objc_opt_class() key:@"Size"];
      long long v14 = v13;
      if (v13)
      {
        uint64_t v15 = [v13 unsignedLongLongValue];
        self->_unint64_t diskUsed = *(void *)((char *)&v23 + 4) - *(void *)((char *)&v24 + 4);
        p_unint64_t diskUsed = (uint64_t *)&self->_diskUsed;
        *(p_diskUsed - 1) = v15;
        id v17 = SALog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          [(SAAppSizerResults *)p_diskUsed initDiskUsedAndCapacity];
        }
        unsigned __int8 v6 = 5;
        uint64_t v18 = v20;
      }
      else
      {
        id v17 = SALog();
        uint64_t v18 = v20;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[SAAppSizerResults initDiskUsedAndCapacity]();
        }
        unsigned __int8 v6 = 3;
      }
    }
    else
    {
      long long v14 = SALog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SAAppSizerResults initDiskUsedAndCapacity]();
      }
      unsigned __int8 v6 = 3;
      uint64_t v18 = v20;
    }
  }
  return v6;
}

- (void)setDiskUsed:(unint64_t)a3 andCapacity:(unint64_t)a4
{
  self->_unint64_t diskCapacity = a4;
  self->_unint64_t diskUsed = a3;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t time = self->_time;
  id v5 = a3;
  [v5 encodeInteger:time forKey:@"time"];
  [v5 encodeInteger:self->_status forKey:@"status"];
  [v5 encodeInt64:self->_diskCapacity forKey:@"diskCapacity"];
  [v5 encodeInt64:self->_diskUsed forKey:@"diskUsed"];
  [v5 encodeInt64:self->_totalCDAvailable forKey:@"totalCDAvailable"];
  [v5 encodeInt64:self->_totalPurgeableClones forKey:@"totalPurgeableClones"];
  [v5 encodeObject:self->_appData forKey:@"appData"];
  [v5 encodeObject:self->_reportedTelemetry forKey:@"reportedTelemetry"];
  [v5 encodeObject:self->_pathsList forKey:@"pathsList"];
  [v5 encodeObject:self->_attributionTags forKey:@"attributionTags"];
  [v5 encodeObject:self->_clonesInfo forKey:@"clonesInfo"];
  [v5 encodeObject:self->_FSPurgeableData forKey:@"FSPurgeableData"];
  [v5 encodeObject:self->_systemDataDetails forKey:@"systemDataDetails"];
  [v5 encodeObject:self->_systemDetails forKey:@"systemDetails"];
  [v5 encodeObject:self->_hiddenAppsData forKey:@"hiddenAppsData"];
  [v5 encodeObject:self->_appsList forKey:@"appsList"];
  [v5 encodeObject:self->_zeroSizeApps forKey:@"zeroSizeApps"];
  [v5 encodeObject:self->_appsInfo forKey:@"appsInfo"];
}

- (SAAppSizerResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)SAAppSizerResults;
  id v5 = [(SAAppSizerResults *)&v87 init];
  if (v5)
  {
    v5->_int64_t time = [v4 decodeIntegerForKey:@"time"];
    v5->_status = [v4 decodeIntegerForKey:@"status"];
    v5->_unint64_t diskCapacity = [v4 decodeInt64ForKey:@"diskCapacity"];
    v5->_unint64_t diskUsed = [v4 decodeInt64ForKey:@"diskUsed"];
    v5->_totalCDAvailable = [v4 decodeInt64ForKey:@"totalCDAvailable"];
    v5->_totalPurgeableClones = [v4 decodeInt64ForKey:@"totalPurgeableClones"];
    unsigned __int8 v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"appData"];
    appData = v5->_appData;
    v5->_appData = (NSDictionary *)v11;

    long long v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    id v17 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"reportedTelemetry"];
    reportedTelemetry = v5->_reportedTelemetry;
    v5->_reportedTelemetry = (NSDictionary *)v18;

    v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    long long v24 = objc_msgSend(v20, "setWithObjects:", v21, v22, v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"pathsList"];
    pathsList = v5->_pathsList;
    v5->_pathsList = (NSMutableDictionary *)v25;

    long long v27 = (void *)MEMORY[0x263EFFA08];
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    long long v31 = objc_msgSend(v27, "setWithObjects:", v28, v29, v30, objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"attributionTags"];
    attributionTags = v5->_attributionTags;
    v5->_attributionTags = (NSMutableDictionary *)v32;

    long long v34 = (void *)MEMORY[0x263EFFA08];
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    uint64_t v38 = objc_opt_class();
    unint64_t v39 = objc_msgSend(v34, "setWithObjects:", v35, v36, v37, v38, objc_opt_class(), 0);
    uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"clonesInfo"];
    clonesInfo = v5->_clonesInfo;
    v5->_clonesInfo = (NSMutableDictionary *)v40;

    uint64_t v42 = (void *)MEMORY[0x263EFFA08];
    uint64_t v43 = objc_opt_class();
    uint64_t v44 = objc_opt_class();
    id v45 = objc_msgSend(v42, "setWithObjects:", v43, v44, objc_opt_class(), 0);
    uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"FSPurgeableData"];
    FSPurgeableData = v5->_FSPurgeableData;
    v5->_FSPurgeableData = (NSMutableDictionary *)v46;

    long long v48 = (void *)MEMORY[0x263EFFA08];
    uint64_t v49 = objc_opt_class();
    uint64_t v50 = objc_opt_class();
    v51 = objc_msgSend(v48, "setWithObjects:", v49, v50, objc_opt_class(), 0);
    uint64_t v52 = [v4 decodeObjectOfClasses:v51 forKey:@"systemDataDetails"];
    systemDataDetails = v5->_systemDataDetails;
    v5->_systemDataDetails = (NSDictionary *)v52;

    uint64_t v54 = (void *)MEMORY[0x263EFFA08];
    uint64_t v55 = objc_opt_class();
    uint64_t v56 = objc_opt_class();
    v57 = objc_msgSend(v54, "setWithObjects:", v55, v56, objc_opt_class(), 0);
    uint64_t v58 = [v4 decodeObjectOfClasses:v57 forKey:@"systemDetails"];
    systemDetails = v5->_systemDetails;
    v5->_systemDetails = (NSDictionary *)v58;

    v60 = (void *)MEMORY[0x263EFFA08];
    uint64_t v61 = objc_opt_class();
    uint64_t v62 = objc_opt_class();
    uint64_t v63 = objc_opt_class();
    v64 = objc_msgSend(v60, "setWithObjects:", v61, v62, v63, objc_opt_class(), 0);
    uint64_t v65 = [v4 decodeObjectOfClasses:v64 forKey:@"hiddenAppsData"];
    hiddenAppsData = v5->_hiddenAppsData;
    v5->_hiddenAppsData = (NSMutableDictionary *)v65;

    v67 = (void *)MEMORY[0x263EFFA08];
    uint64_t v68 = objc_opt_class();
    uint64_t v69 = objc_opt_class();
    v70 = objc_msgSend(v67, "setWithObjects:", v68, v69, objc_opt_class(), 0);
    uint64_t v71 = [v4 decodeObjectOfClasses:v70 forKey:@"appsList"];
    appsList = v5->_appsList;
    v5->_appsList = (NSMutableDictionary *)v71;

    v73 = (void *)MEMORY[0x263EFFA08];
    uint64_t v74 = objc_opt_class();
    uint64_t v75 = objc_opt_class();
    v76 = objc_msgSend(v73, "setWithObjects:", v74, v75, objc_opt_class(), 0);
    uint64_t v77 = [v4 decodeObjectOfClasses:v76 forKey:@"zeroSizeApps"];
    zeroSizeApps = v5->_zeroSizeApps;
    v5->_zeroSizeApps = (NSMutableArray *)v77;

    v79 = (void *)MEMORY[0x263EFFA08];
    uint64_t v80 = objc_opt_class();
    uint64_t v81 = objc_opt_class();
    uint64_t v82 = objc_opt_class();
    v83 = objc_msgSend(v79, "setWithObjects:", v80, v81, v82, objc_opt_class(), 0);
    uint64_t v84 = [v4 decodeObjectOfClasses:v83 forKey:@"appsInfo"];
    appsInfo = v5->_appsInfo;
    v5->_appsInfo = (NSDictionary *)v84;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)time
{
  return self->_time;
}

- (void)setTime:(int64_t)a3
{
  self->_int64_t time = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (unint64_t)diskCapacity
{
  return self->_diskCapacity;
}

- (void)setDiskCapacity:(unint64_t)a3
{
  self->_unint64_t diskCapacity = a3;
}

- (unint64_t)diskUsed
{
  return self->_diskUsed;
}

- (void)setDiskUsed:(unint64_t)a3
{
  self->_unint64_t diskUsed = a3;
}

- (NSDictionary)appData
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAppData:(id)a3
{
}

- (NSDictionary)systemDataDetails
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSystemDataDetails:(id)a3
{
}

- (NSDictionary)systemDetails
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSystemDetails:(id)a3
{
}

- (NSDictionary)reportedTelemetry
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setReportedTelemetry:(id)a3
{
}

- (NSMutableDictionary)pathsList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPathsList:(id)a3
{
}

- (NSMutableDictionary)attributionTags
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAttributionTags:(id)a3
{
}

- (NSMutableDictionary)clonesInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setClonesInfo:(id)a3
{
}

- (NSMutableDictionary)FSPurgeableData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFSPurgeableData:(id)a3
{
}

- (NSMutableDictionary)hiddenAppsData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setHiddenAppsData:(id)a3
{
}

- (NSMutableDictionary)appsList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAppsList:(id)a3
{
}

- (NSMutableArray)zeroSizeApps
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setZeroSizeApps:(id)a3
{
}

- (unint64_t)totalCDAvailable
{
  return self->_totalCDAvailable;
}

- (void)setTotalCDAvailable:(unint64_t)a3
{
  self->_totalCDAvailable = a3;
}

- (unint64_t)totalPurgeableClones
{
  return self->_totalPurgeableClones;
}

- (void)setTotalPurgeableClones:(unint64_t)a3
{
  self->_totalPurgeableClones = a3;
}

- (NSDictionary)appsInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAppsInfo:(id)a3
{
}

- (NSMutableDictionary)appsDataInternal
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAppsDataInternal:(id)a3
{
}

- (SAAppSizeBreakdownList)appSizeBreakdownList
{
  return (SAAppSizeBreakdownList *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAppSizeBreakdownList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSizeBreakdownList, 0);
  objc_storeStrong((id *)&self->_appsDataInternal, 0);
  objc_storeStrong((id *)&self->_appsInfo, 0);
  objc_storeStrong((id *)&self->_zeroSizeApps, 0);
  objc_storeStrong((id *)&self->_appsList, 0);
  objc_storeStrong((id *)&self->_hiddenAppsData, 0);
  objc_storeStrong((id *)&self->_FSPurgeableData, 0);
  objc_storeStrong((id *)&self->_clonesInfo, 0);
  objc_storeStrong((id *)&self->_attributionTags, 0);
  objc_storeStrong((id *)&self->_pathsList, 0);
  objc_storeStrong((id *)&self->_reportedTelemetry, 0);
  objc_storeStrong((id *)&self->_systemDetails, 0);
  objc_storeStrong((id *)&self->_systemDataDetails, 0);
  objc_storeStrong((id *)&self->_appData, 0);
}

- (void)setAppSet:vendorName:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_25E2BB000, v0, v1, "%s: bundlesSet (%@) not found", v2, v3, v4, v5, 2u);
}

- (void)updateHiddenApp:withSUPurgeableSize:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_25E2BB000, v0, v1, "%s: bundlesSet (%@) not found", v2, v3, v4, v5, 2u);
}

- (void)updateBundleID:(os_log_t)log WithCloneSize:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_25E2BB000, log, OS_LOG_TYPE_DEBUG, "'System Data' not found, creating", v1, 2u);
}

- (void)updateBundleID:(uint64_t)a3 WithCloneSize:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateBundleID:withDataSize:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_25E2BB000, v0, v1, "bundleID %@ not found, creating with dataSize %llu");
}

- (void)updateBundleID:withDataSize:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_25E2BB000, v0, v1, "bundleID %@ adding to dataSize %llu");
}

- (void)addSystemVolumeWithCapacity:(os_log_t)log used:withReplyBlock:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_25E2BB000, log, OS_LOG_TYPE_DEBUG, "'System' not found, creating", v1, 2u);
}

- (void)initDiskUsedAndCapacity
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_3_0();
  uint64_t v3 = "/";
  __int16 v4 = 1024;
  int v5 = v0;
  _os_log_error_impl(&dword_25E2BB000, v1, OS_LOG_TYPE_ERROR, "%s: Can't get volume size for %s (err %d)", (uint8_t *)v2, 0x1Cu);
}

@end