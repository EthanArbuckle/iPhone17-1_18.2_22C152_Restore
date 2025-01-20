@interface CAReporter
+ (void)sendSingleMessage:(id)a3 category:(unsigned int)a4 type:(unsigned __int16)a5;
- (AudioAnalyticsReporter)swiftReporter;
- (BOOL)connected;
- (BOOL)removedByClient;
- (BOOL)started;
- (CAReporter)initWithNewReporterID;
- (CAReporter)initWithReporterID:(int64_t)a3 serviceType:(unsigned __int16)a4;
- (CAReporter)initWithSessionID:(unsigned int)a3 serviceType:(unsigned __int16)a4;
- (CAReportingPerformanceObject)perfObject;
- (NSDate)startDate;
- (NSDictionary)configuration;
- (NSMutableDictionary)internalConfiguration;
- (int64_t)reporterID;
- (unint64_t)signpostID;
- (unsigned)serviceType;
- (void)cacheServiceType:(unsigned __int16)a3;
- (void)dealloc;
- (void)requestMessageForCategory:(unsigned int)a3 type:(unsigned __int16)a4 callback:(id)a5;
- (void)sendMessage:(id)a3 category:(unsigned int)a4 type:(unsigned __int16)a5;
- (void)setConfiguration:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setInternalConfiguration:(id)a3;
- (void)setPerfObject:(id)a3;
- (void)setRemovedByClient:(BOOL)a3;
- (void)setServiceType:(unsigned __int16)a3;
- (void)setStartDate:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setSwiftReporter:(id)a3;
- (void)start;
- (void)stop;
- (void)updateWithReporterID:(int64_t)a3;
@end

@implementation CAReporter

- (AudioAnalyticsReporter)swiftReporter
{
  return self->_swiftReporter;
}

- (void)stop
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    id v11 = [(CAReporter *)self swiftReporter];
    [v11 stop];
  }
  else
  {
    id v3 = (id)gReportingClient;
    objc_sync_enter(v3);
    v4 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int64_t reporterID = self->_reporterID;
      *(_DWORD *)buf = 136315650;
      v13 = "CAReportingClient.mm";
      __int16 v14 = 1024;
      int v15 = 421;
      __int16 v16 = 2048;
      int64_t v17 = reporterID;
      _os_log_impl(&dword_19025C000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d Stopping reporter { careporter_id=%lli }", buf, 0x1Cu);
    }
    v6 = *(id *)AA_ClientCategory();
    v7 = v6;
    os_signpost_id_t signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      CAReportingUtilityRetrieveAppName(&self->_internalConfiguration->super);
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_signpost_emit_with_name_impl(&dword_19025C000, v7, OS_SIGNPOST_INTERVAL_END, signpostID, "CoreAudioReportingSession", "Stopping Application=%{public}@", buf, 0xCu);
    }
    v10 = +[CAReportingClient sharedInstance];
    [v10 stopReporter:-[CAReporter reporterID](self, "reporterID")];

    objc_sync_exit(v3);
  }
}

- (void)start
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    id v11 = [(CAReporter *)self swiftReporter];
    [v11 start];
  }
  else
  {
    id v3 = (id)gReportingClient;
    objc_sync_enter(v3);
    v4 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int64_t reporterID = self->_reporterID;
      *(_DWORD *)buf = 136315650;
      v13 = "CAReportingClient.mm";
      __int16 v14 = 1024;
      int v15 = 385;
      __int16 v16 = 2048;
      int64_t v17 = reporterID;
      _os_log_impl(&dword_19025C000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d Starting reporter { careporter_id=%lli }", buf, 0x1Cu);
    }
    v6 = *(id *)AA_ClientCategory();
    v7 = v6;
    os_signpost_id_t signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      CAReportingUtilityRetrieveAppName(&self->_internalConfiguration->super);
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_signpost_emit_with_name_impl(&dword_19025C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "CoreAudioReportingSession", "Starting Application=%{public}@", buf, 0xCu);
    }
    v10 = +[CAReportingClient sharedInstance];
    [v10 startReporter:self->_reporterID];

    objc_sync_exit(v3);
  }
}

- (void)sendMessage:(id)a3 category:(unsigned int)a4 type:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (_os_feature_enabled_impl())
  {
    v9 = [(CAReporter *)self swiftReporter];
    [v9 sendMessage:v8 category:v6 type:v5];
  }
  else
  {
    id v10 = (id)gReportingClient;
    objc_sync_enter(v10);
    id v11 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int64_t reporterID = self->_reporterID;
      int v14 = 136315650;
      int v15 = "CAReportingClient.mm";
      __int16 v16 = 1024;
      int v17 = 402;
      __int16 v18 = 2048;
      int64_t v19 = reporterID;
      _os_log_impl(&dword_19025C000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d Sending message { careporter_id=%lli }", (uint8_t *)&v14, 0x1Cu);
    }
    v13 = +[CAReportingClient sharedInstance];
    [v13 sendMessage:v8 category:v6 type:v5 reporter:self->_reporterID];

    objc_sync_exit(v10);
  }
}

+ (void)sendSingleMessage:(id)a3 category:(unsigned int)a4 type:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  if (_os_feature_enabled_impl())
  {
    [MEMORY[0x1E4F4E7B0] sendSessionlessMessage:v9 category:v6 type:v5];
  }
  else
  {
    id v7 = (id)gReportingClient;
    objc_sync_enter(v7);
    id v8 = +[CAReportingClient sharedInstance];
    [v8 sendMessage:v9 category:v6 type:v5 reporter:0];

    objc_sync_exit(v7);
  }
}

- (CAReporter)initWithReporterID:(int64_t)a3 serviceType:(unsigned __int16)a4
{
  int v4 = a4;
  v42[1] = *MEMORY[0x1E4F143B8];
  if (!_os_feature_enabled_impl())
  {
    id v10 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = CAReportingUtilityGenerateServiceNameFromServiceType(v4);
      *(_DWORD *)buf = 136316162;
      v36 = "CAReportingClient.mm";
      __int16 v37 = 1024;
      int v38 = 145;
      __int16 v39 = 1024;
      *(_DWORD *)v40 = a3;
      *(_WORD *)&v40[4] = 2112;
      *(void *)&v40[6] = v11;
      *(_WORD *)&v40[14] = 1024;
      *(_DWORD *)&v40[16] = v4;
      _os_log_impl(&dword_19025C000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d initWithReporterID: serviceType: { reporterID=%i, servicename=\"%@\", servicetype=%i }", buf, 0x28u);
    }
    v12 = +[CAReportingClient sharedInstance];
    BOOL v13 = v12 == 0;

    if (!v13)
    {
      if (a3)
      {
        v33.receiver = self;
        v33.super_class = (Class)CAReporter;
        int v14 = [(CAReporter *)&v33 init];
        id v7 = (char *)v14;
        if (v14)
        {
          v14->_int64_t reporterID = a3;
          int v15 = *(id *)AA_ClientCategory();
          *((void *)v7 + 8) = os_signpost_id_make_with_pointer(v15, v7 + 16);

          *((_WORD *)v7 + 6) = v4;
          *(_WORD *)(v7 + 9) = 256;
          __int16 v16 = [CAReportingPerformanceObject alloc];
          int v17 = NSNumber;
          __int16 v18 = [MEMORY[0x1E4F28F80] processInfo];
          int64_t v19 = [v17 numberWithInt:[v18 processIdentifier]];
          v42[0] = v19;
          uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
          uint64_t v21 = [(CAReportingPerformanceObject *)v16 initWithProcessIdentifiers:v20];
          v22 = (void *)*((void *)v7 + 7);
          *((void *)v7 + 7) = v21;

          uint64_t v23 = objc_opt_new();
          v24 = (void *)*((void *)v7 + 5);
          *((void *)v7 + 5) = v23;

          v25 = *(id *)AA_ClientCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v26 = *((void *)v7 + 2);
            v27 = CAReportingUtilityGenerateServiceNameFromServiceType(*((_WORD *)v7 + 6));
            int v28 = *((unsigned __int16 *)v7 + 6);
            *(_DWORD *)buf = 136316162;
            v36 = "CAReportingClient.mm";
            __int16 v37 = 1024;
            int v38 = 165;
            __int16 v39 = 2048;
            *(void *)v40 = v26;
            *(_WORD *)&v40[8] = 2112;
            *(void *)&v40[10] = v27;
            *(_WORD *)&v40[18] = 1024;
            int v41 = v28;
            _os_log_impl(&dword_19025C000, v25, OS_LOG_TYPE_DEBUG, "%25s:%-5d Creating CAReporter { careporter_id=%lli, servicename=\"%@\", servicetype=%i }", buf, 0x2Cu);
          }
          v29 = +[CAReportingClient sharedInstance];
          [v29 addReporter:v7];
        }
        goto LABEL_13;
      }
      v31 = *(id *)AA_ClientCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "CAReportingClient.mm";
        __int16 v37 = 1024;
        int v38 = 151;
        _os_log_impl(&dword_19025C000, v31, OS_LOG_TYPE_DEBUG, "%25s:%-5d initWithReporterID: reporterID == CAReporterInvalidID, returning nil", buf, 0x12u);
      }
    }
    v30 = 0;
    id v7 = (char *)self;
    goto LABEL_18;
  }
  v34.receiver = self;
  v34.super_class = (Class)CAReporter;
  id v7 = [(CAReporter *)&v34 init];
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F4E7B0]) initWithReporterID:a3];
    id v9 = (void *)*((void *)v7 + 4);
    *((void *)v7 + 4) = v8;

    if (!*((void *)v7 + 4))
    {
      v30 = 0;
      goto LABEL_18;
    }
    *((void *)v7 + 2) = a3;
    *((_WORD *)v7 + 6) = v4;
  }
LABEL_13:
  id v7 = v7;
  v30 = (CAReporter *)v7;
LABEL_18:

  return v30;
}

- (CAReporter)initWithNewReporterID
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    v14.receiver = self;
    v14.super_class = (Class)CAReporter;
    id v3 = [(CAReporter *)&v14 init];
    if (v3)
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F4E7B0]) initWithNewReporterID];
      swiftReporter = v3->_swiftReporter;
      v3->_swiftReporter = (AudioAnalyticsReporter *)v4;

      uint64_t v6 = v3->_swiftReporter;
      if (!v6)
      {
        id v7 = 0;
        goto LABEL_11;
      }
      v3->_int64_t reporterID = [(AudioAnalyticsReporter *)v6 reporterID];
      v3->_serviceType = -1;
    }
    id v3 = v3;
    id v7 = v3;
  }
  else
  {
    id v8 = (id)gReportingClient;
    objc_sync_enter(v8);
    id v9 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v16 = "CAReportingClient.mm";
      __int16 v17 = 1024;
      int v18 = 194;
      _os_log_impl(&dword_19025C000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d CAReporter initWithNewReporterID called", buf, 0x12u);
    }
    id v10 = +[CAReportingClient sharedInstance];
    uint64_t v11 = [v10 createReporterID:0];

    v12 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v16 = "CAReportingClient.mm";
      __int16 v17 = 1024;
      int v18 = 196;
      __int16 v19 = 2048;
      uint64_t v20 = v11;
      _os_log_impl(&dword_19025C000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d CAReporter initWithNewReporterID { newid=%lli }", buf, 0x1Cu);
    }
    id v3 = [(CAReporter *)self initWithReporterID:v11 serviceType:0xFFFFLL];
    objc_sync_exit(v8);

    id v7 = v3;
  }
LABEL_11:

  return v7;
}

- (CAReporter)initWithSessionID:(unsigned int)a3 serviceType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = *(void *)&a3;
  if (_os_feature_enabled_impl())
  {
    v15.receiver = self;
    v15.super_class = (Class)CAReporter;
    id v7 = [(CAReporter *)&v15 init];
    if (v7)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F4E7B0]) initWithSessionID:v5 serviceType:v4];
      swiftReporter = v7->_swiftReporter;
      v7->_swiftReporter = (AudioAnalyticsReporter *)v8;

      id v10 = v7->_swiftReporter;
      if (!v10)
      {
        uint64_t v11 = 0;
        goto LABEL_7;
      }
      v7->_int64_t reporterID = [(AudioAnalyticsReporter *)v10 reporterID];
      v7->_serviceType = v4;
    }
    id v7 = v7;
    uint64_t v11 = v7;
  }
  else
  {
    id v12 = (id)gReportingClient;
    objc_sync_enter(v12);
    BOOL v13 = +[CAReportingClient sharedInstance];
    id v7 = -[CAReporter initWithReporterID:serviceType:](self, "initWithReporterID:serviceType:", [v13 createReporterID:v5], v4);

    objc_sync_exit(v12);
    uint64_t v11 = v7;
  }
LABEL_7:

  return v11;
}

- (int64_t)reporterID
{
  if (!_os_feature_enabled_impl()) {
    return self->_reporterID;
  }
  id v3 = [(CAReporter *)self swiftReporter];
  int64_t v4 = [v3 reporterID];

  return v4;
}

- (void)updateWithReporterID:(int64_t)a3
{
  if (_os_feature_enabled_impl())
  {
    id obj = [(CAReporter *)self swiftReporter];
    [obj setReporterID:a3];
  }
  else
  {
    if (!a3) {
      return;
    }
    id obj = (id)gReportingClient;
    objc_sync_enter(obj);
    self->_int64_t reporterID = a3;
    objc_sync_exit(obj);
  }
}

- (unsigned)serviceType
{
  if (!_os_feature_enabled_impl()) {
    return self->_serviceType;
  }
  id v3 = [(CAReporter *)self swiftReporter];
  unsigned __int16 v4 = [v3 serviceType];

  return v4;
}

- (void)setServiceType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    id v11 = [(CAReporter *)self swiftReporter];
    [v11 setServiceType:v3];
  }
  else
  {
    id v5 = (id)gReportingClient;
    objc_sync_enter(v5);
    self->_int serviceType = v3;
    uint64_t v6 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int64_t reporterID = self->_reporterID;
      uint64_t v8 = CAReportingUtilityGenerateServiceNameFromServiceType(self->_serviceType);
      int serviceType = self->_serviceType;
      *(_DWORD *)buf = 136316162;
      BOOL v13 = "CAReportingClient.mm";
      __int16 v14 = 1024;
      int v15 = 281;
      __int16 v16 = 2048;
      int64_t v17 = reporterID;
      __int16 v18 = 2112;
      __int16 v19 = v8;
      __int16 v20 = 1024;
      int v21 = serviceType;
      _os_log_impl(&dword_19025C000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d Setting service type { careporter_id=%lli, servicename=\"%@\", servicetype=%i }", buf, 0x2Cu);
    }
    id v10 = +[CAReportingClient sharedInstance];
    [v10 setServiceType:v3 reporterID:[CAReporter reporterID](self, "reporterID")];

    objc_sync_exit(v5);
  }
}

- (void)cacheServiceType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    id obj = [(CAReporter *)self swiftReporter];
    [obj setServiceType:v3];
  }
  else
  {
    id obja = (id)gReportingClient;
    objc_sync_enter(obja);
    self->_int serviceType = v3;
    id v5 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int64_t reporterID = self->_reporterID;
      id v7 = CAReportingUtilityGenerateServiceNameFromServiceType(self->_serviceType);
      int serviceType = self->_serviceType;
      *(_DWORD *)buf = 136316162;
      id v12 = "CAReportingClient.mm";
      __int16 v13 = 1024;
      int v14 = 298;
      __int16 v15 = 2048;
      int64_t v16 = reporterID;
      __int16 v17 = 2112;
      __int16 v18 = v7;
      __int16 v19 = 1024;
      int v20 = serviceType;
      _os_log_impl(&dword_19025C000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Caching service type { careporter_id=%lli, servicename=\"%@\", servicetype=%i }", buf, 0x2Cu);
    }
    objc_sync_exit(obja);
  }
}

- (void)setConfiguration:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!_os_feature_enabled_impl())
  {
    id v6 = (id)gReportingClient;
    objc_sync_enter(v6);
    if (self->_removedByClient || !self->_reporterID)
    {
      id v7 = *(id *)AA_ClientCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 136315394;
        uint64_t v26 = "CAReportingClient.mm";
        __int16 v27 = 1024;
        int v28 = 316;
        uint64_t v8 = "%25s:%-5d Unexpected state, configuration being set on reporter that has been removed or is invalid!";
LABEL_6:
        _os_log_impl(&dword_19025C000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v25, 0x12u);
      }
    }
    else
    {
      if (v4 && [v4 count])
      {
        id v9 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v4];
        id v10 = [v9 objectForKeyedSubscript:@"MXHostApplicationDisplayID"];

        if (v10)
        {
          id v11 = [v9 objectForKeyedSubscript:@"MXHostApplicationDisplayID"];
          [v9 setObject:v11 forKeyedSubscript:@"HostApplicationDisplayID"];
        }
        if (self->_internalConfiguration)
        {
          id v12 = [(CAReporter *)self internalConfiguration];
          [v12 addEntriesFromDictionary:v9];

          __int16 v13 = [(CAReporter *)self perfObject];
          [v13 setConfiguration:self->_internalConfiguration];

          int v14 = *(id *)AA_ClientCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            int64_t reporterID = self->_reporterID;
            int v25 = 136315906;
            uint64_t v26 = "CAReportingClient.mm";
            __int16 v27 = 1024;
            int v28 = 341;
            __int16 v29 = 2048;
            int64_t v30 = reporterID;
            __int16 v31 = 2112;
            id v32 = v4;
            _os_log_impl(&dword_19025C000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d Setting configuration { careporter_id=%lli, newConfiguration=\"%@\" }", (uint8_t *)&v25, 0x26u);
          }
          int64_t v16 = +[CAReportingClient sharedInstance];
          __int16 v17 = [v16 connection];
          BOOL v18 = v17 == 0;

          if (v18)
          {
            uint64_t v23 = *(id *)AA_ClientCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              int64_t v24 = [(CAReporter *)self reporterID];
              int v25 = 136315650;
              uint64_t v26 = "CAReportingClient.mm";
              __int16 v27 = 1024;
              int v28 = 344;
              __int16 v29 = 2048;
              int64_t v30 = v24;
              _os_log_impl(&dword_19025C000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CAReportingClient XPC connection is nil { careporter_id=%lli }", (uint8_t *)&v25, 0x1Cu);
            }
          }
          else
          {
            if (_os_feature_enabled_impl())
            {
              __int16 v19 = +[CAReportingClient sharedInstance];
              int v20 = [v19 connection];
              uint64_t v21 = [v20 _unboostingRemoteObjectProxy];
              [v21 setWithConfiguration:v9 for:[self reporterID]];
            }
            else
            {
              __int16 v19 = +[CAReportingClient sharedInstance];
              int v20 = [v19 connection];
              uint64_t v21 = [v20 _unboostingRemoteObjectProxy];
              [v21 setConfiguration:v9 forReporterID:-[CAReporter reporterID](self, "reporterID")];
            }
          }
        }
        else
        {
          uint64_t v22 = *(id *)AA_ClientCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            int v25 = 136315394;
            uint64_t v26 = "CAReportingClient.mm";
            __int16 v27 = 1024;
            int v28 = 335;
            _os_log_impl(&dword_19025C000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d internalConfiguration found to be nil", (uint8_t *)&v25, 0x12u);
          }
        }

        goto LABEL_7;
      }
      id v7 = *(id *)AA_ClientCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 136315394;
        uint64_t v26 = "CAReportingClient.mm";
        __int16 v27 = 1024;
        int v28 = 322;
        uint64_t v8 = "%25s:%-5d Incoming configuration nil or empty. Ignoring.";
        goto LABEL_6;
      }
    }
LABEL_7:
    objc_sync_exit(v6);

    goto LABEL_8;
  }
  id v5 = [(CAReporter *)self swiftReporter];
  [v5 setConfiguration:v4];

LABEL_8:
}

- (NSDictionary)configuration
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    uint64_t v3 = [(CAReporter *)self swiftReporter];
    id v4 = [v3 configuration];
  }
  else
  {
    id v5 = (id)gReportingClient;
    objc_sync_enter(v5);
    id v6 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int64_t reporterID = self->_reporterID;
      int v9 = 136315650;
      id v10 = "CAReportingClient.mm";
      __int16 v11 = 1024;
      int v12 = 368;
      __int16 v13 = 2048;
      int64_t v14 = reporterID;
      _os_log_impl(&dword_19025C000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d Getting configuration { careporter_id=%lli }", (uint8_t *)&v9, 0x1Cu);
    }
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:self->_internalConfiguration];
    objc_sync_exit(v5);
  }

  return (NSDictionary *)v4;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v3 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int64_t reporterID = self->_reporterID;
      *(_DWORD *)buf = 136315650;
      uint64_t v8 = "CAReportingClient.mm";
      __int16 v9 = 1024;
      int v10 = 436;
      __int16 v11 = 2048;
      int64_t v12 = reporterID;
      _os_log_impl(&dword_19025C000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d Deallocing reporter { careporter_id=%lli }", buf, 0x1Cu);
    }
    id v5 = +[CAReportingClient sharedInstance];
    [v5 destroyReporterWithID:self->_reporterID];
  }
  v6.receiver = self;
  v6.super_class = (Class)CAReporter;
  [(CAReporter *)&v6 dealloc];
}

- (void)requestMessageForCategory:(unsigned int)a3 type:(unsigned __int16)a4 callback:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (_os_feature_enabled_impl())
  {
    __int16 v9 = [(CAReporter *)self swiftReporter];
    [v9 requestMessageForCategory:v6 type:v5 callback:v8];
  }
  else
  {
    int v10 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int64_t reporterID = self->_reporterID;
      int64_t v12 = CAReportingUtilityCategoryString(v6);
      uint64_t v13 = CAReportingUtilityTypeString(v5);
      int v15 = 136316674;
      int64_t v16 = "CAReportingClient.mm";
      __int16 v17 = 1024;
      int v18 = 455;
      __int16 v19 = 2048;
      int64_t v20 = reporterID;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      __int16 v23 = 1024;
      int v24 = v6;
      __int16 v25 = 2112;
      uint64_t v26 = v13;
      __int16 v27 = 1024;
      int v28 = v5;
      _os_log_impl(&dword_19025C000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d Requesting messages from reporter. { careporter_id=%lli, eventcategoryname=\"%@\", eventcategory=%i, servicename=\"%@\", servicetype=%i }", (uint8_t *)&v15, 0x3Cu);
    }
    int64_t v14 = +[CAReportingClient sharedInstance];
    [v14 requestMessageWithID:self->_reporterID category:v6 type:v5 callback:v8];
  }
}

- (void)setSwiftReporter:(id)a3
{
}

- (NSMutableDictionary)internalConfiguration
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInternalConfiguration:(id)a3
{
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStartDate:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)removedByClient
{
  return self->_removedByClient;
}

- (void)setRemovedByClient:(BOOL)a3
{
  self->_removedByClient = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (CAReportingPerformanceObject)perfObject
{
  return (CAReportingPerformanceObject *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPerfObject:(id)a3
{
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perfObject, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_internalConfiguration, 0);
  objc_storeStrong((id *)&self->_swiftReporter, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end