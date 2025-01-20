@interface WADeviceAnalyticsClient
+ (id)sharedDeviceAnalyticsClientWithPersist;
- (AnalyticsReader)analyticsReaderObj;
- (AnalyticsStoreFileWriter)analyticsFileWriterObj;
- (AnalyticsStoreMOHandler)managedObjectHandler;
- (BOOL)dumpDeploymentGraphJSONFileWithCompletion:(id)a3;
- (BOOL)dumpDeviceAnalyticsCSVsUsingBatchSizeToFileWithCompletion:(id)a3 batchSize:(unint64_t)a4 maxAge:(unint64_t)a5;
- (BOOL)dumpDeviceAnalyticsToFileWithCompletion:(id)a3;
- (BOOL)dumpDeviceAnalyticsToFileWithCompletion:(id)a3 fetchLimit:(unint64_t)a4 maxAge:(unint64_t)a5;
- (BOOL)dumpDeviceAnalyticsUsingBatchSizeToFileWithCompletion:(id)a3 batchSize:(unint64_t)a4 maxAge:(unint64_t)a5;
- (BOOL)initCommon;
- (BOOL)isHistoricallyBadLinkQualityNetwork:(id)a3;
- (BOOL)isMovingNetwork:(id)a3;
- (BOOL)isOmnipresentNetwork:(id)a3;
- (BOOL)parsedBeaconInfoIsStored:(id)a3 ssid:(id)a4;
- (OS_dispatch_queue)dispatchQueue;
- (WADeviceAnalyticsClient)init;
- (WADeviceAnalyticsClient)initWithSharedServerType;
- (id)analyticsFileWriter;
- (id)analyticsReader;
- (id)copyAllStoredNetworkSsids;
- (id)copyAllStoredNetworkSsidsWithColocatedScopeId:(id)a3;
- (id)copyAllStoredNetworkSsidsWithTrait:(unint64_t)a3;
- (id)copyColocatedScopeIdForSsid:(id)a3;
- (id)copyColocatedScopeTransitionInfo:(id)a3 bssid:(id)a4 minRssi:(int)a5 maxRssi:(int)a6 band:(unsigned int)a7;
- (id)copyGeoTagsForNetwork:(id)a3 location:(id)a4;
- (id)copyLocationsForNetwork:(id)a3;
- (id)copyNetworkUsageDictionary:(id)a3;
- (id)copyNetworksAvailableAtLocationWithinDistanceInBand:(id)a3 distance:(double)a4 band:(unsigned int)a5;
- (id)copyPreferenceScoreDictionaryForNetwork:(id)a3;
- (id)copyScoreSortedNetworksAvailableAtLocationWithinDistance:(id)a3 distance:(double)a4 authComparator:(id)a5;
- (id)neighborChannelsForBSS:(id)a3 ssid:(id)a4;
- (id)neighborsForBSS:(id)a3 ssid:(id)a4;
- (int64_t)autoLeaveRssiForBSS:(id)a3 ssid:(id)a4;
- (int64_t)rssiRoamTriggerForBSS:(id)a3 ssid:(id)a4;
- (unint64_t)isNetworkWithinRangeOfLocation:(id)a3 range:(double)a4 location:(id)a5;
- (unint64_t)manualLeaveCountForBss:(id)a3 ssid:(id)a4;
- (void)dealloc;
- (void)setAnalyticsFileWriterObj:(id)a3;
- (void)setAnalyticsReaderObj:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setManagedObjectHandler:(id)a3;
@end

@implementation WADeviceAnalyticsClient

+ (id)sharedDeviceAnalyticsClientWithPersist
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (+[WAUtil isAnalyticsProcessorAllowed])
  {
    if (_MergedGlobals_4
      || +[AnalyticsStoreMOHandler isStoreCompatible])
    {
      if (qword_26AA93D00 != -1) {
        dispatch_once(&qword_26AA93D00, &__block_literal_global_4);
      }
      id v2 = (id)_MergedGlobals_4;
      goto LABEL_7;
    }
    v4 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446466;
      v8 = "+[WADeviceAnalyticsClient sharedDeviceAnalyticsClientWithPersist]";
      __int16 v9 = 1024;
      int v10 = 41;
      v5 = "%{public}s::%d:Store needs migration - Wait for wifianalyticsd to complete migration and retry";
      goto LABEL_14;
    }
  }
  else
  {
    v4 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446466;
      v8 = "+[WADeviceAnalyticsClient sharedDeviceAnalyticsClientWithPersist]";
      __int16 v9 = 1024;
      int v10 = 36;
      v5 = "%{public}s::%d:Writing in the WiFi Analytics Store is disabled on this platform";
LABEL_14:
      _os_log_impl(&dword_21D96D000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v7, 0x12u);
    }
  }

  v6 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136446466;
    v8 = "+[WADeviceAnalyticsClient sharedDeviceAnalyticsClientWithPersist]";
    __int16 v9 = 1024;
    int v10 = 54;
    _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:ERROR: Exiting with nil WADeviceAnalyticsClient", (uint8_t *)&v7, 0x12u);
  }

  id v2 = 0;
LABEL_7:
  return v2;
}

void __65__WADeviceAnalyticsClient_sharedDeviceAnalyticsClientWithPersist__block_invoke()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = [[WADeviceAnalyticsClient alloc] initWithSharedServerType];
  v1 = (void *)_MergedGlobals_4;
  _MergedGlobals_4 = (uint64_t)v0;

  if (!_MergedGlobals_4)
  {
    id v2 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v3 = 136446466;
      v4 = "+[WADeviceAnalyticsClient sharedDeviceAnalyticsClientWithPersist]_block_invoke";
      __int16 v5 = 1024;
      int v6 = 47;
      _os_log_impl(&dword_21D96D000, v2, OS_LOG_TYPE_ERROR, "%{public}s::%d:WADeviceAnalyticsClient failed initWithSharedServerType", (uint8_t *)&v3, 0x12u);
    }
  }
}

- (WADeviceAnalyticsClient)init
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v11 = "-[WADeviceAnalyticsClient init]";
    __int16 v12 = 1024;
    int v13 = 60;
    __int16 v14 = 2080;
    v15 = "WiFiAnalytics-680.21 Nov 14 2024 23:02:12";
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WADeviceAnalyticsClient version: %s", buf, 0x1Cu);
  }

  v9.receiver = self;
  v9.super_class = (Class)WADeviceAnalyticsClient;
  v4 = [(WADeviceAnalyticsClient *)&v9 init];
  if (v4)
  {
    __int16 v5 = [[AnalyticsStoreMOHandler alloc] initWithType:0 options:0];
    if (v5)
    {
      objc_storeStrong((id *)&v4->_managedObjectHandler, v5);
      if ([(WADeviceAnalyticsClient *)v4 initCommon])
      {
LABEL_6:

        return v4;
      }
      uint64_t v7 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v11 = "-[WADeviceAnalyticsClient init]";
        __int16 v12 = 1024;
        int v13 = 74;
        v8 = "%{public}s::%d:Error [self initCommon] failed";
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v7 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v11 = "-[WADeviceAnalyticsClient init]";
        __int16 v12 = 1024;
        int v13 = 68;
        v8 = "%{public}s::%d:Error getting managedObjectHandler";
LABEL_12:
        _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, v8, buf, 0x12u);
      }
    }

    v4 = 0;
    goto LABEL_6;
  }
  return v4;
}

- (WADeviceAnalyticsClient)initWithSharedServerType
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)WADeviceAnalyticsClient;
  id v2 = [(WADeviceAnalyticsClient *)&v8 init];
  if (v2)
  {
    int v3 = +[AnalyticsStoreMOHandler sharedAnalyticsStoreMOHandlerWithPersist];
    if (v3)
    {
      objc_storeStrong((id *)&v2->_managedObjectHandler, v3);
      if ([(WADeviceAnalyticsClient *)v2 initCommon])
      {
LABEL_4:

        return v2;
      }
      __int16 v5 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        int v10 = "-[WADeviceAnalyticsClient initWithSharedServerType]";
        __int16 v11 = 1024;
        int v12 = 96;
        int v6 = "%{public}s::%d:Error [self initCommon] failed";
        goto LABEL_10;
      }
    }
    else
    {
      __int16 v5 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        int v10 = "-[WADeviceAnalyticsClient initWithSharedServerType]";
        __int16 v11 = 1024;
        int v12 = 92;
        int v6 = "%{public}s::%d:Error getting sharedAnalyticsStoreMOHandlerWithPersist";
LABEL_10:
        _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0x12u);
      }
    }

    uint64_t v7 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      int v10 = "-[WADeviceAnalyticsClient initWithSharedServerType]";
      __int16 v11 = 1024;
      int v12 = 101;
      _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:ERROR: Exiting with nil WADeviceAnalyticsClient", buf, 0x12u);
    }

    id v2 = 0;
    goto LABEL_4;
  }
  return v2;
}

- (BOOL)initCommon
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.wifianalytics.deviceanalyticsclient", v3);
  dispatchQueue = self->_dispatchQueue;
  self->_dispatchQueue = v4;

  int v6 = self->_dispatchQueue;
  if (!v6)
  {
    objc_super v8 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446466;
      int v10 = "-[WADeviceAnalyticsClient initCommon]";
      __int16 v11 = 1024;
      int v12 = 111;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:_dispatchQueue nil", (uint8_t *)&v9, 0x12u);
    }
  }
  return v6 != 0;
}

- (void)dealloc
{
  analyticsReaderObj = self->_analyticsReaderObj;
  self->_analyticsReaderObj = 0;

  analyticsFileWriterObj = self->_analyticsFileWriterObj;
  self->_analyticsFileWriterObj = 0;

  v5.receiver = self;
  v5.super_class = (Class)WADeviceAnalyticsClient;
  [(WADeviceAnalyticsClient *)&v5 dealloc];
}

- (id)analyticsReader
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  analyticsReaderObj = self->_analyticsReaderObj;
  if (analyticsReaderObj
    || (v4 = [[AnalyticsReader alloc] initWithAnalyticsStore:self->_managedObjectHandler], objc_super v5 = self->_analyticsReaderObj, self->_analyticsReaderObj = v4, v5, (analyticsReaderObj = self->_analyticsReaderObj) != 0))
  {
    int v6 = analyticsReaderObj;
  }
  else
  {
    objc_super v8 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446466;
      int v10 = "-[WADeviceAnalyticsClient analyticsReader]";
      __int16 v11 = 1024;
      int v12 = 130;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:_analyticsReaderObj nil", (uint8_t *)&v9, 0x12u);
    }

    int v6 = 0;
  }
  return v6;
}

- (id)analyticsFileWriter
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  analyticsFileWriterObj = self->_analyticsFileWriterObj;
  if (analyticsFileWriterObj
    || (v4 = [[AnalyticsStoreFileWriter alloc] initWithAnalyticsStore:self->_managedObjectHandler], objc_super v5 = self->_analyticsFileWriterObj, self->_analyticsFileWriterObj = v4, v5, (analyticsFileWriterObj = self->_analyticsFileWriterObj) != 0))
  {
    int v6 = analyticsFileWriterObj;
  }
  else
  {
    objc_super v8 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446466;
      int v10 = "-[WADeviceAnalyticsClient analyticsFileWriter]";
      __int16 v11 = 1024;
      int v12 = 145;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:_analyticsFileWriterObj nil", (uint8_t *)&v9, 0x12u);
    }

    int v6 = 0;
  }
  return v6;
}

- (id)neighborChannelsForBSS:(id)a3 ssid:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(WADeviceAnalyticsClient *)self analyticsReader];
  int v9 = [v8 neighborChannelsForBSS:v7 ssid:v6];

  return v9;
}

- (id)neighborsForBSS:(id)a3 ssid:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(WADeviceAnalyticsClient *)self analyticsReader];
  int v9 = [v8 neighborsForBSS:v7 ssid:v6];

  return v9;
}

- (int64_t)rssiRoamTriggerForBSS:(id)a3 ssid:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(WADeviceAnalyticsClient *)self analyticsReader];
  int64_t v9 = [v8 rssiRoamTriggerForBSS:v7 ssid:v6];

  return v9;
}

- (int64_t)autoLeaveRssiForBSS:(id)a3 ssid:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(WADeviceAnalyticsClient *)self analyticsReader];
  int64_t v9 = [v8 autoLeaveRssiForBss:v7 ssid:v6];

  return v9;
}

- (unint64_t)manualLeaveCountForBss:(id)a3 ssid:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(WADeviceAnalyticsClient *)self analyticsReader];
  unint64_t v9 = [v8 manualLeaveCountForBss:v7 ssid:v6];

  return v9;
}

- (BOOL)parsedBeaconInfoIsStored:(id)a3 ssid:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(WADeviceAnalyticsClient *)self analyticsReader];
  char v9 = [v8 parsedBeaconInfoIsStored:v7 ssid:v6];

  return v9;
}

- (BOOL)dumpDeviceAnalyticsToFileWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(WADeviceAnalyticsClient *)self analyticsFileWriter];

  if (v5)
  {
    id v6 = [(WADeviceAnalyticsClient *)self dispatchQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __67__WADeviceAnalyticsClient_dumpDeviceAnalyticsToFileWithCompletion___block_invoke;
    v8[3] = &unk_264467530;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v6, v8);
  }
  return v5 != 0;
}

void __67__WADeviceAnalyticsClient_dumpDeviceAnalyticsToFileWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  int v3 = [*(id *)(a1 + 32) analyticsFileWriter];
  id v4 = [v3 writeAnalyticsStoreToFile];

  uint64_t v5 = *(void *)(a1 + 40);
  if (v4) {
    [NSString stringWithString:v4];
  }
  else {
  id v6 = [NSString string];
  }
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

- (BOOL)dumpDeviceAnalyticsToFileWithCompletion:(id)a3 fetchLimit:(unint64_t)a4 maxAge:(unint64_t)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (!a4)
  {
    int v12 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v19 = "-[WADeviceAnalyticsClient dumpDeviceAnalyticsToFileWithCompletion:fetchLimit:maxAge:]";
      __int16 v20 = 1024;
      int v21 = 195;
      _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetchLimit is 0", buf, 0x12u);
    }

    goto LABEL_7;
  }
  id v9 = [(WADeviceAnalyticsClient *)self analyticsFileWriter];

  if (!v9)
  {
LABEL_7:
    BOOL v11 = 0;
    goto LABEL_8;
  }
  int v10 = [(WADeviceAnalyticsClient *)self dispatchQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __85__WADeviceAnalyticsClient_dumpDeviceAnalyticsToFileWithCompletion_fetchLimit_maxAge___block_invoke;
  v14[3] = &unk_264467558;
  unint64_t v16 = a5;
  unint64_t v17 = a4;
  v14[4] = self;
  id v15 = v8;
  dispatch_async(v10, v14);

  BOOL v11 = 1;
LABEL_8:

  return v11;
}

void __85__WADeviceAnalyticsClient_dumpDeviceAnalyticsToFileWithCompletion_fetchLimit_maxAge___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  int v3 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    int v10 = 136446978;
    BOOL v11 = "-[WADeviceAnalyticsClient dumpDeviceAnalyticsToFileWithCompletion:fetchLimit:maxAge:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = 199;
    __int16 v14 = 2048;
    uint64_t v15 = v4;
    __int16 v16 = 2048;
    uint64_t v17 = v5;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_DEBUG, "%{public}s::%d:maxAge:%lu fetchLimit:%lu", (uint8_t *)&v10, 0x26u);
  }

  id v6 = [*(id *)(a1 + 32) analyticsFileWriter];
  id v7 = [v6 batchedWriteAnalyticsStoreToFile:*(void *)(a1 + 56) maxAge:*(void *)(a1 + 48)];

  uint64_t v8 = *(void *)(a1 + 40);
  if (v7) {
    [NSString stringWithString:v7];
  }
  else {
  id v9 = [NSString string];
  }
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

- (BOOL)dumpDeviceAnalyticsUsingBatchSizeToFileWithCompletion:(id)a3 batchSize:(unint64_t)a4 maxAge:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(WADeviceAnalyticsClient *)self analyticsFileWriter];

  if (v9)
  {
    int v10 = [(WADeviceAnalyticsClient *)self dispatchQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __98__WADeviceAnalyticsClient_dumpDeviceAnalyticsUsingBatchSizeToFileWithCompletion_batchSize_maxAge___block_invoke;
    v12[3] = &unk_264467558;
    unint64_t v14 = a5;
    unint64_t v15 = a4;
    v12[4] = self;
    id v13 = v8;
    dispatch_async(v10, v12);
  }
  return v9 != 0;
}

void __98__WADeviceAnalyticsClient_dumpDeviceAnalyticsUsingBatchSizeToFileWithCompletion_batchSize_maxAge___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  int v3 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    int v10 = 136446978;
    BOOL v11 = "-[WADeviceAnalyticsClient dumpDeviceAnalyticsUsingBatchSizeToFileWithCompletion:batchSize:maxAge:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = 218;
    __int16 v14 = 2048;
    uint64_t v15 = v4;
    __int16 v16 = 2048;
    uint64_t v17 = v5;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_DEBUG, "%{public}s::%d:maxAge:%lu batchSize:%lu", (uint8_t *)&v10, 0x26u);
  }

  id v6 = [*(id *)(a1 + 32) analyticsFileWriter];
  id v7 = [v6 batchedWriteAnalyticsStoreToFileWithBatchSize:*(void *)(a1 + 56) maxAge:*(void *)(a1 + 48)];

  uint64_t v8 = *(void *)(a1 + 40);
  if (v7) {
    [NSString stringWithString:v7];
  }
  else {
  id v9 = [NSString string];
  }
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

- (BOOL)dumpDeviceAnalyticsCSVsUsingBatchSizeToFileWithCompletion:(id)a3 batchSize:(unint64_t)a4 maxAge:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(WADeviceAnalyticsClient *)self analyticsFileWriter];

  if (v9)
  {
    int v10 = [(WADeviceAnalyticsClient *)self dispatchQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __102__WADeviceAnalyticsClient_dumpDeviceAnalyticsCSVsUsingBatchSizeToFileWithCompletion_batchSize_maxAge___block_invoke;
    v12[3] = &unk_264467558;
    unint64_t v14 = a5;
    unint64_t v15 = a4;
    v12[4] = self;
    id v13 = v8;
    dispatch_async(v10, v12);
  }
  return v9 != 0;
}

void __102__WADeviceAnalyticsClient_dumpDeviceAnalyticsCSVsUsingBatchSizeToFileWithCompletion_batchSize_maxAge___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  int v3 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    int v10 = 136446978;
    BOOL v11 = "-[WADeviceAnalyticsClient dumpDeviceAnalyticsCSVsUsingBatchSizeToFileWithCompletion:batchSize:maxAge:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = 236;
    __int16 v14 = 2048;
    uint64_t v15 = v4;
    __int16 v16 = 2048;
    uint64_t v17 = v5;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_DEBUG, "%{public}s::%d:maxAge:%lu batchSize:%lu", (uint8_t *)&v10, 0x26u);
  }

  id v6 = [*(id *)(a1 + 32) analyticsFileWriter];
  id v7 = [v6 batchedWriteAnalyticsStoreToCSVFilesWithBatchSize:*(void *)(a1 + 56) maxAge:*(void *)(a1 + 48)];

  uint64_t v8 = *(void *)(a1 + 40);
  if (v7) {
    [MEMORY[0x263EFF8C0] arrayWithArray:v7];
  }
  else {
  id v9 = [MEMORY[0x263EFF8C0] array];
  }
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

- (BOOL)dumpDeploymentGraphJSONFileWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WADeviceAnalyticsClient *)self analyticsFileWriter];

  if (v5)
  {
    id v6 = [(WADeviceAnalyticsClient *)self dispatchQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __69__WADeviceAnalyticsClient_dumpDeploymentGraphJSONFileWithCompletion___block_invoke;
    v8[3] = &unk_264467530;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v6, v8);
  }
  return v5 != 0;
}

void __69__WADeviceAnalyticsClient_dumpDeploymentGraphJSONFileWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x223C0F2E0]();
  int v3 = [*(id *)(a1 + 32) analyticsFileWriter];
  id v4 = [v3 writeDeploymentGraphToFile];

  uint64_t v5 = *(void *)(a1 + 40);
  if (v4) {
    [NSString stringWithString:v4];
  }
  else {
  id v6 = [NSString string];
  }
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

- (unint64_t)isNetworkWithinRangeOfLocation:(id)a3 range:(double)a4 location:(id)a5
{
  uint64_t v14 = 0;
  id v8 = a5;
  id v9 = a3;
  int v10 = [(WADeviceAnalyticsClient *)self analyticsReader];
  int v11 = [v10 isNetworkWithinRangeOfLocation:v9 range:v8 location:&v14 count:a4];

  unint64_t v12 = 1;
  if (v11) {
    unint64_t v12 = 2;
  }
  if (v14) {
    return v12;
  }
  else {
    return 0;
  }
}

- (id)copyGeoTagsForNetwork:(id)a3 location:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WADeviceAnalyticsClient *)self analyticsReader];
  id v9 = (void *)[v8 copyGeoTagsForNetwork:v7 location:v6];

  return v9;
}

- (id)copyNetworksAvailableAtLocationWithinDistanceInBand:(id)a3 distance:(double)a4 band:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = [(WADeviceAnalyticsClient *)self analyticsReader];
  int v10 = (void *)[v9 copyNetworksAvailableAtLocationWithinDistanceInBand:v8 distance:v5 band:a4];

  return v10;
}

- (id)copyScoreSortedNetworksAvailableAtLocationWithinDistance:(id)a3 distance:(double)a4 authComparator:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  int v10 = [(WADeviceAnalyticsClient *)self analyticsReader];
  int v11 = (void *)[v10 copyScoreSortedNetworksAvailableAtLocationWithinDistance:v9 distance:v8 authComparator:a4];

  return v11;
}

- (id)copyPreferenceScoreDictionaryForNetwork:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WADeviceAnalyticsClient *)self analyticsReader];
  id v6 = (void *)[v5 copyPreferenceScoreDictionaryForNetwork:v4];

  return v6;
}

- (BOOL)isMovingNetwork:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WADeviceAnalyticsClient *)self analyticsReader];
  char v6 = [v5 isMovingNetwork:v4];

  return v6;
}

- (BOOL)isOmnipresentNetwork:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WADeviceAnalyticsClient *)self analyticsReader];
  char v6 = [v5 isOmnipresentNetwork:v4];

  return v6;
}

- (BOOL)isHistoricallyBadLinkQualityNetwork:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WADeviceAnalyticsClient *)self analyticsReader];
  char v6 = [v5 isHistoricallyBadLinkQualityNetwork:v4];

  return v6;
}

- (id)copyLocationsForNetwork:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WADeviceAnalyticsClient *)self analyticsReader];
  char v6 = (void *)[v5 copyLocationsForNetwork:v4];

  return v6;
}

- (id)copyAllStoredNetworkSsidsWithTrait:(unint64_t)a3
{
  id v4 = [(WADeviceAnalyticsClient *)self analyticsReader];
  uint64_t v5 = (void *)[v4 copyAllStoredNetworkSsidsWithTrait:a3];

  return v5;
}

- (id)copyAllStoredNetworkSsids
{
  id v2 = [(WADeviceAnalyticsClient *)self analyticsReader];
  int v3 = (void *)[v2 copyAllStoredNetworkSsids];

  return v3;
}

- (id)copyAllStoredNetworkSsidsWithColocatedScopeId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WADeviceAnalyticsClient *)self analyticsReader];
  char v6 = (void *)[v5 copyAllStoredNetworkSsidsWithColocatedScopeId:v4];

  return v6;
}

- (id)copyColocatedScopeIdForSsid:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WADeviceAnalyticsClient *)self analyticsReader];
  char v6 = (void *)[v5 copyColocatedScopeIdForSsid:v4];

  return v6;
}

- (id)copyColocatedScopeTransitionInfo:(id)a3 bssid:(id)a4 minRssi:(int)a5 maxRssi:(int)a6 band:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [(WADeviceAnalyticsClient *)self analyticsReader];
  uint64_t v15 = (void *)[v14 copyColocatedScopeTransitionInfo:v13 bssid:v12 minRssi:v9 maxRssi:v8 band:v7];

  return v15;
}

- (id)copyNetworkUsageDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WADeviceAnalyticsClient *)self analyticsReader];
  char v6 = (void *)[v5 copyNetworkUsageDictionary:v4];

  return v6;
}

- (AnalyticsStoreMOHandler)managedObjectHandler
{
  return self->_managedObjectHandler;
}

- (void)setManagedObjectHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (AnalyticsReader)analyticsReaderObj
{
  return self->_analyticsReaderObj;
}

- (void)setAnalyticsReaderObj:(id)a3
{
}

- (AnalyticsStoreFileWriter)analyticsFileWriterObj
{
  return self->_analyticsFileWriterObj;
}

- (void)setAnalyticsFileWriterObj:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsFileWriterObj, 0);
  objc_storeStrong((id *)&self->_analyticsReaderObj, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_managedObjectHandler, 0);
}

@end