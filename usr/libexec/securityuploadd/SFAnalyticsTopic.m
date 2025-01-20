@interface SFAnalyticsTopic
+ (id)AppSupportPath;
+ (id)databasePathForCKKS;
+ (id)databasePathForCloudServices;
+ (id)databasePathForLocal;
+ (id)databasePathForNetworking;
+ (id)databasePathForPCS;
+ (id)databasePathForSOS;
+ (id)databasePathForSWTransparency;
+ (id)databasePathForTransparency;
+ (id)databasePathForTrust;
- (BOOL)allowInsecureSplunkCert;
- (BOOL)ckDeviceAccountApprovedTopic:(id)a3;
- (BOOL)copyEvents:(id)a3 failures:(id)a4 forUpload:(BOOL)a5 participatingClients:(id)a6 force:(BOOL)a7 linkedUUID:(id)a8 error:(id *)a9;
- (BOOL)disableClientId;
- (BOOL)disableUploads;
- (BOOL)eventIsBlacklisted:(id)a3;
- (BOOL)haveEligibleClients;
- (BOOL)ignoreServersMessagesTellingUsToGoAway;
- (BOOL)isSampledUpload;
- (BOOL)postJSON:(id)a3 toEndpoint:(id)a4 postSession:(id)a5 error:(id *)a6;
- (BOOL)prepareEventForUpload:(id)a3 linkedUUID:(id)a4;
- (BOOL)terseMetrics;
- (NSArray)blacklistedEvents;
- (NSArray)blacklistedFields;
- (NSArray)topicClients;
- (NSDictionary)metricsBase;
- (NSString)internalTopicName;
- (NSString)splunkTopicName;
- (NSURL)_splunkUploadURL;
- (NSURL)splunkBagURL;
- (SFAnalyticsTopic)initWithDictionary:(id)a3 name:(id)a4 samplingRates:(id)a5;
- (float)devicePercentage;
- (id)appleUser;
- (id)askSecurityForCKDeviceID;
- (id)carryStatus;
- (id)chunkFailureSet:(unint64_t)a3 events:(id)a4 error:(id *)a5;
- (id)createChunkedLoggingJSON:(BOOL)a3 forUpload:(BOOL)a4 participatingClients:(id)a5 force:(BOOL)a6 error:(id *)a7;
- (id)createChunkedLoggingJSON:(id)a3 failures:(id)a4 error:(id *)a5;
- (id)createEventDictionary:(id)a3 timestamp:(id)a4 error:(id *)a5;
- (id)createLoggingJSON:(BOOL)a3 forUpload:(BOOL)a4 participatingClients:(id)a5 force:(BOOL)a6 error:(id *)a7;
- (id)dataAnalyticsSetting:(id)a3;
- (id)eventDictWithBlacklistedFieldsStrippedFrom:(id)a3;
- (id)getSession;
- (id)healthSummaryWithName:(id)a3 store:(id)a4 uuid:(id)a5 timestamp:(id)a6 lastUploadTime:(id)a7;
- (id)sampleStatisticsForSamples:(id)a3 withName:(id)a4;
- (id)splunkUploadURL:(BOOL)a3 urlSession:(id)a4;
- (unint64_t)maxEventsToReport;
- (unint64_t)secondsBetweenUploads;
- (unint64_t)serializedEventSize:(id)a3 error:(id *)a4;
- (unint64_t)uploadSizeLimit;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)addFailures:(id)a3 toUploadRecords:(id)a4 threshold:(unint64_t)a5 linkedUUID:(id)a6;
- (void)addRequiredFieldsToEvent:(id)a3;
- (void)removeBlacklistedFieldsFromEvent:(id)a3;
- (void)setAllowInsecureSplunkCert:(BOOL)a3;
- (void)setBlacklistedEvents:(id)a3;
- (void)setBlacklistedFields:(id)a3;
- (void)setDevicePercentage:(float)a3;
- (void)setDisableClientId:(BOOL)a3;
- (void)setDisableUploads:(BOOL)a3;
- (void)setIgnoreServersMessagesTellingUsToGoAway:(BOOL)a3;
- (void)setInternalTopicName:(id)a3;
- (void)setMaxEventsToReport:(unint64_t)a3;
- (void)setMetricsBase:(id)a3;
- (void)setSecondsBetweenUploads:(unint64_t)a3;
- (void)setSplunkBagURL:(id)a3;
- (void)setSplunkTopicName:(id)a3;
- (void)setTerseMetrics:(BOOL)a3;
- (void)setTopicClients:(id)a3;
- (void)setUploadSizeLimit:(unint64_t)a3;
- (void)set_splunkUploadURL:(id)a3;
- (void)setupClientsForTopic:(id)a3;
- (void)updateUploadDateForClients:(id)a3 date:(id)a4 clearData:(BOOL)a5;
@end

@implementation SFAnalyticsTopic

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklistedEvents, 0);
  objc_storeStrong((id *)&self->_blacklistedFields, 0);
  objc_storeStrong((id *)&self->_metricsBase, 0);
  objc_storeStrong((id *)&self->__splunkUploadURL, 0);
  objc_storeStrong((id *)&self->_topicClients, 0);
  objc_storeStrong((id *)&self->_internalTopicName, 0);
  objc_storeStrong((id *)&self->_splunkBagURL, 0);

  objc_storeStrong((id *)&self->_splunkTopicName, 0);
}

- (void)setBlacklistedEvents:(id)a3
{
}

- (NSArray)blacklistedEvents
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBlacklistedFields:(id)a3
{
}

- (NSArray)blacklistedFields
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMetricsBase:(id)a3
{
}

- (NSDictionary)metricsBase
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDevicePercentage:(float)a3
{
  self->_devicePercentage = a3;
}

- (float)devicePercentage
{
  return self->_devicePercentage;
}

- (void)setMaxEventsToReport:(unint64_t)a3
{
  self->_maxEventsToReport = a3;
}

- (unint64_t)maxEventsToReport
{
  return self->_maxEventsToReport;
}

- (void)setSecondsBetweenUploads:(unint64_t)a3
{
  self->_secondsBetweenUploads = a3;
}

- (unint64_t)secondsBetweenUploads
{
  return self->_secondsBetweenUploads;
}

- (void)setTerseMetrics:(BOOL)a3
{
  self->_terseMetrics = a3;
}

- (BOOL)terseMetrics
{
  return self->_terseMetrics;
}

- (void)setDisableClientId:(BOOL)a3
{
  self->_disableClientId = a3;
}

- (BOOL)disableClientId
{
  return self->_disableClientId;
}

- (void)setDisableUploads:(BOOL)a3
{
  self->_disableUploads = a3;
}

- (BOOL)disableUploads
{
  return self->_disableUploads;
}

- (void)setIgnoreServersMessagesTellingUsToGoAway:(BOOL)a3
{
  self->_ignoreServersMessagesTellingUsToGoAway = a3;
}

- (BOOL)ignoreServersMessagesTellingUsToGoAway
{
  return self->_ignoreServersMessagesTellingUsToGoAway;
}

- (void)setAllowInsecureSplunkCert:(BOOL)a3
{
  self->_allowInsecureSplunkCert = a3;
}

- (BOOL)allowInsecureSplunkCert
{
  return self->_allowInsecureSplunkCert;
}

- (void)set_splunkUploadURL:(id)a3
{
}

- (NSURL)_splunkUploadURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTopicClients:(id)a3
{
}

- (NSArray)topicClients
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUploadSizeLimit:(unint64_t)a3
{
  self->_uploadSizeLimit = a3;
}

- (unint64_t)uploadSizeLimit
{
  return self->_uploadSizeLimit;
}

- (void)setInternalTopicName:(id)a3
{
}

- (NSString)internalTopicName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSplunkBagURL:(id)a3
{
}

- (NSURL)splunkBagURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSplunkTopicName:(id)a3
{
}

- (NSString)splunkTopicName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (id)eventDictWithBlacklistedFieldsStrippedFrom:(id)a3
{
  id v4 = [a3 mutableCopy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_blacklistedFields;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 removeObjectForKey:*(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11];
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t, void))a5;
  if (!v10)
  {
    long long v11 = sub_1000106A0("SecError");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = @"Execution has encountered an unexpected state";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1405091854;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Simulating crash, reason: %@, code=%08x", buf, 0x12u);
    }

    int v12 = dword_10001DB58;
    if (dword_10001DB58 == -1)
    {
      if (sub_1000109B4())
      {
        uint64_t v13 = getpid();
        long long v14 = @"Execution has encountered an unexpected state";
        uint64_t v32 = 0;
        v33 = &v32;
        uint64_t v34 = 0x2020000000;
        v15 = (void (*)(uint64_t, uint64_t, const __CFString *))off_10001DBE0;
        v35 = off_10001DBE0;
        if (!off_10001DBE0)
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_100010A84;
          v37 = &unk_100018D38;
          v38 = &v32;
          v16 = sub_100010AD4();
          v17 = dlsym(v16, "SimulateCrash");
          *(void *)(v38[1] + 24) = v17;
          off_10001DBE0 = *(_UNKNOWN **)(v38[1] + 24);
          v15 = (void (*)(uint64_t, uint64_t, const __CFString *))v33[3];
        }
        _Block_object_dispose(&v32, 8);
        if (!v15)
        {
          v30 = +[NSAssertionHandler currentHandler];
          v31 = +[NSString stringWithUTF8String:"BOOL soft_SimulateCrash(pid_t, mach_exception_data_type_t, NSString *__strong)"];
          [v30 handleFailureInFunction:v31 file:@"simulate_crash.m" lineNumber:22 description:@"%s", dlerror()];

          __break(1u);
        }
        v15(v13, 1405091854, @"Execution has encountered an unexpected state");

        goto LABEL_11;
      }
      int v12 = dword_10001DB58;
    }
    dword_10001DB58 = v12 + 1;
  }
LABEL_11:
  v18 = sub_1000106A0("upload");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    internalTopicName = self->_internalTopicName;
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = internalTopicName;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Splunk upload challenge for %@", buf, 0xCu);
  }

  if ((uint64_t)[v9 previousFailureCount] >= 1) {
    goto LABEL_25;
  }
  v20 = [v9 protectionSpace];
  v21 = [v20 authenticationMethod];
  unsigned int v22 = [v21 isEqualToString:NSURLAuthenticationMethodServerTrust];

  if (!v22)
  {
    v10[2](v10, 1, 0);
    goto LABEL_26;
  }
  v23 = [v9 protectionSpace];
  v24 = (__SecTrust *)[v23 serverTrust];

  BOOL v25 = SecTrustEvaluateWithError(v24, 0);
  int v26 = self->_allowInsecureSplunkCert || v25;
  if (v26 != 1)
  {
LABEL_25:
    v10[2](v10, 2, 0);
    goto LABEL_26;
  }
  if (self->_allowInsecureSplunkCert)
  {
    v27 = sub_1000106A0("upload");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = self->_internalTopicName;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Force Accepting Splunk Credential for %@", buf, 0xCu);
    }
  }
  v29 = +[NSURLCredential credentialForTrust:v24];
  ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v29);

LABEL_26:
}

- (id)splunkUploadURL:(BOOL)a3 urlSession:(id)a4
{
  id v6 = a4;
  if (a3 || [(SFAnalyticsTopic *)self haveEligibleClients])
  {
    splunkUploadURL = self->__splunkUploadURL;
    if (splunkUploadURL)
    {
      id v8 = splunkUploadURL;
    }
    else
    {
      id v9 = sub_1000106A0("getURL");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [(SFAnalyticsTopic *)self internalTopicName];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Asking server for endpoint and config data for topic %@", (uint8_t *)&buf, 0xCu);
      }
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v34 = 0x3032000000;
      v35 = sub_1000051E4;
      v36 = sub_1000051F4;
      id v37 = 0;
      int v12 = self->_splunkBagURL;
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x3032000000;
      v29 = sub_1000051E4;
      v30 = sub_1000051F4;
      id v31 = 0;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100005D80;
      v20[3] = &unk_100018820;
      objc_copyWeak(&v25, &location);
      p_long long buf = &buf;
      v20[4] = self;
      uint64_t v13 = v11;
      v21 = v13;
      v24 = &v26;
      long long v14 = v12;
      unsigned int v22 = v14;
      v15 = [v6 dataTaskWithURL:v14 completionHandler:v20];
      [v15 resume];
      dispatch_time_t v16 = dispatch_time(0, 60000000000);
      dispatch_semaphore_wait(v13, v16);
      id v8 = (NSURL *)(id)v27[5];

      objc_destroyWeak(&v25);
      _Block_object_dispose(&v26, 8);

      _Block_object_dispose(&buf, 8);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v17 = sub_1000106A0("getURL");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [(SFAnalyticsTopic *)self internalTopicName];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not going to talk to server for topic %@ because no eligible clients", (uint8_t *)&buf, 0xCu);
    }
    id v8 = 0;
  }

  return v8;
}

- (id)appleUser
{
  id v2 = objc_alloc_init((Class)ACAccountStore);
  v3 = [v2 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierIMAP];
  [v2 accountsWithAccountType:v3];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v5 = *(void *)v27;
    uint64_t v6 = ACEmailAliasKeyEmailAddresses;
    uint64_t v19 = *(void *)v27;
    v20 = v3;
    uint64_t v18 = ACEmailAliasKeyEmailAddresses;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(v4);
        }
        id v8 = [[*(id *)(*((void *)&v26 + 1) + 8 * i) objectForKeyedSubscript:v6, v18, v19];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = [v8 allKeys];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = v8;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v9 = [v8 componentsSeparatedByString:@","];
            }
            else
            {
              id v9 = 0;
            }
          }
        }
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v10 = v9;
        id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v23;
          while (2)
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v22 + 1) + 8 * (void)j);
              if ([v15 hasSuffix:@"@apple.com"])
              {
                id v16 = v15;

                v3 = v20;
                goto LABEL_26;
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v18;
        uint64_t v5 = v19;
      }
      id v16 = 0;
      v3 = v20;
      id v21 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }
  else
  {
    id v16 = 0;
  }
LABEL_26:

  return v16;
}

- (id)askSecurityForCKDeviceID
{
  id v15 = 0;
  id v2 = +[CKKSControl controlObject:&v15];
  id v3 = v15;
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v2 == 0;
  }
  if (v4)
  {
    uint64_t v5 = sub_1000106A0("SecError");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "unable to obtain CKKS endpoint: %@", (uint8_t *)&buf, 0xCu);
    }

    id v6 = 0;
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = sub_1000051E4;
    uint64_t v19 = sub_1000051F4;
    id v20 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100006858;
    v12[3] = &unk_1000187F8;
    p_long long buf = &buf;
    id v7 = dispatch_semaphore_create(0);
    uint64_t v13 = v7;
    [v2 rpcGetCKDeviceIDWithReply:v12];
    dispatch_time_t v8 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v7, v8))
    {
      id v9 = sub_1000106A0("SecError");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "timed out waiting for a response from security", v11, 2u);
      }

      id v6 = 0;
    }
    else
    {
      id v6 = *(id *)(*((void *)&buf + 1) + 40);
    }

    _Block_object_dispose(&buf, 8);
  }

  return v6;
}

- (BOOL)haveEligibleClients
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(SFAnalyticsTopic *)self topicClients];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      id v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v6);
        if (![v7 requireDeviceAnalytics]) {
          goto LABEL_13;
        }
        if (qword_10001DB98 != -1) {
          dispatch_once(&qword_10001DB98, &stru_100018930);
        }
        if (byte_10001DB90)
        {
LABEL_13:
          if (![v7 requireiCloudAnalytics]) {
            goto LABEL_17;
          }
          if (qword_10001DBA8 != -1) {
            dispatch_once(&qword_10001DBA8, &stru_100018950);
          }
          if (byte_10001DBA0)
          {
LABEL_17:
            BOOL v8 = 1;
            goto LABEL_19;
          }
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      BOOL v8 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
LABEL_19:

  return v8;
}

- (id)createLoggingJSON:(BOOL)a3 forUpload:(BOOL)a4 participatingClients:(id)a5 force:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a4;
  id v11 = a5;
  long long v12 = +[NSMutableArray array];
  long long v13 = +[NSMutableArray array];
  id v25 = 0;
  LODWORD(v9) = [(SFAnalyticsTopic *)self copyEvents:v13 failures:v12 forUpload:v9 participatingClients:v11 force:v8 linkedUUID:0 error:&v25];

  id v14 = v25;
  id v15 = v14;
  if (v9 && v14 == 0)
  {
    if ((unint64_t)[v12 count] > self->_maxEventsToReport)
    {
      uint64_t v18 = [v12 subarrayWithRange:0];
      id v19 = [v18 mutableCopy];

      long long v12 = v19;
    }
    id v20 = +[NSMutableArray array];
    [v20 addObjectsFromArray:v13];
    [v20 addObjectsFromArray:v12];
    id v21 = +[NSDate date];
    [v21 timeIntervalSince1970];
    long long v23 = +[NSNumber numberWithDouble:v22 * 1000.0];
    uint64_t v17 = [(SFAnalyticsTopic *)self createEventDictionary:v20 timestamp:v23 error:a7];
  }
  else
  {
    uint64_t v17 = 0;
    if (a7) {
      *a7 = v14;
    }
  }

  return v17;
}

- (id)createChunkedLoggingJSON:(BOOL)a3 forUpload:(BOOL)a4 participatingClients:(id)a5 force:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a4;
  id v11 = a5;
  long long v12 = +[NSUUID UUID];
  long long v13 = +[NSMutableArray array];
  id v14 = +[NSMutableArray array];
  id v22 = 0;
  LODWORD(v9) = [(SFAnalyticsTopic *)self copyEvents:v14 failures:v13 forUpload:v9 participatingClients:v11 force:v8 linkedUUID:v12 error:&v22];

  id v15 = v22;
  id v16 = v15;
  if (v9 && v15 == 0)
  {
    if ((unint64_t)[v13 count] > self->_maxEventsToReport)
    {
      id v19 = [v13 subarrayWithRange:0];
      id v20 = [v19 mutableCopy];

      long long v13 = v20;
    }
    uint64_t v18 = [(SFAnalyticsTopic *)self createChunkedLoggingJSON:v14 failures:v13 error:a7];
  }
  else
  {
    uint64_t v18 = 0;
    if (a7) {
      *a7 = v15;
    }
  }

  return v18;
}

- (BOOL)copyEvents:(id)a3 failures:(id)a4 forUpload:(BOOL)a5 participatingClients:(id)a6 force:(BOOL)a7 linkedUUID:(id)a8 error:(id *)a9
{
  BOOL v32 = a5;
  id v37 = a3;
  id v30 = a4;
  id v13 = a6;
  id v41 = a8;
  v42 = +[NSMutableArray array];
  v40 = +[NSMutableArray array];
  v39 = +[NSMutableArray array];
  v38 = +[NSMutableArray array];
  if ([(SFAnalyticsTopic *)self ckDeviceAccountApprovedTopic:self->_internalTopicName])
  {
    v36 = [(SFAnalyticsTopic *)self askSecurityForCKDeviceID];
    v35 = sub_100006E60();
    uint64_t v34 = [(SFAnalyticsTopic *)self appleUser];
    v33 = [(SFAnalyticsTopic *)self carryStatus];
    id v14 = sub_1000106A0("getLoggingJSON");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "including deviceID for internal user", buf, 2u);
    }
  }
  else
  {
    id v14 = sub_1000106A0("getLoggingJSON");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "no deviceID for internal user", buf, 2u);
    }
    v35 = 0;
    v36 = 0;
    v33 = 0;
    uint64_t v34 = 0;
  }

  id v15 = +[NSDate date];
  [v15 timeIntervalSince1970];
  uint64_t v17 = +[NSNumber numberWithDouble:v16 * 1000.0];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v18 = self;
  id v19 = self->_topicClients;
  id v20 = [(NSArray *)v19 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v58;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v58 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_1000079E8;
        v43[3] = &unk_1000187D0;
        BOOL v55 = a7;
        BOOL v56 = v32;
        v43[4] = v24;
        v43[5] = v18;
        id v44 = v42;
        id v45 = v41;
        id v46 = v17;
        id v47 = v36;
        id v48 = v35;
        id v49 = v33;
        id v50 = v34;
        id v51 = v37;
        id v52 = v40;
        id v53 = v39;
        id v54 = v38;
        [v24 withStore:v43];
      }
      id v21 = [(NSArray *)v19 countByEnumeratingWithState:&v57 objects:v64 count:16];
    }
    while (v21);
  }

  if (v32 && ![v42 count])
  {
    if (!a9)
    {
      BOOL v27 = 0;
      long long v26 = v30;
      goto LABEL_18;
    }
    id v25 = +[NSString stringWithFormat:@"Upload too recent for all clients for %@", v18->_internalTopicName];
    NSErrorUserInfoKey v62 = NSLocalizedDescriptionKey;
    v63 = v25;
    long long v29 = +[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    *a9 = +[NSError errorWithDomain:@"SupdUploadErrorDomain" code:-10 userInfo:v29];

    BOOL v27 = 0;
    long long v26 = v30;
  }
  else
  {
    [v13 addObjectsFromArray:v42];
    id v25 = +[NSMutableArray array];
    [(SFAnalyticsTopic *)v18 addFailures:v40 toUploadRecords:v25 threshold:v18->_maxEventsToReport / 0xA linkedUUID:v41];
    [(SFAnalyticsTopic *)v18 addFailures:v39 toUploadRecords:v25 threshold:v18->_maxEventsToReport / 0xA linkedUUID:v41];
    [(SFAnalyticsTopic *)v18 addFailures:v38 toUploadRecords:v25 threshold:0 linkedUUID:v41];
    long long v26 = v30;
    [v30 addObjectsFromArray:v25];
    BOOL v27 = 1;
  }

LABEL_18:
  return v27;
}

- (BOOL)ckDeviceAccountApprovedTopic:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    if (qword_10001DB78 != -1) {
      dispatch_once(&qword_10001DB78, &stru_1000187A8);
    }
    unsigned __int8 v4 = [(id)qword_10001DB80 containsObject:v3];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)carryStatus
{
  if (os_variant_has_internal_diagnostics())
  {
    id v3 = +[NSMutableDictionary dictionary];
    unsigned __int8 v4 = +[OSASystemConfiguration automatedDeviceGroup];
    if (v4
      || ([(SFAnalyticsTopic *)self dataAnalyticsSetting:@"AutomatedDeviceGroup"],
          (unsigned __int8 v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [v3 setObject:v4 forKeyedSubscript:@"automatedDeviceGroup"];
      uint64_t v5 = [(SFAnalyticsTopic *)self dataAnalyticsSetting:@"ExperimentGroup"];
    }
    else
    {
      uint64_t v5 = [(SFAnalyticsTopic *)self dataAnalyticsSetting:@"ExperimentGroup"];
      if (([v5 isEqual:@"walkabout"] & 1) != 0
        || [v5 isEqual:@"carry"])
      {
        [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"carry"];
      }
    }
    if ([v3 count]) {
      id v6 = v3;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = sub_1000106A0("getLoggingJSON");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "carrystatus is %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (id)dataAnalyticsSetting:(id)a3
{
  id v3 = (void *)CFPreferencesCopyValue((CFStringRef)a3, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)createChunkedLoggingJSON:(id)a3 failures:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[NSMutableArray array];
  id v11 = +[NSDate date];
  [v11 timeIntervalSince1970];
  id v13 = +[NSNumber numberWithDouble:v12 * 1000.0];

  long long v28 = v8;
  id v14 = [(SFAnalyticsTopic *)self chunkFailureSet:[(SFAnalyticsTopic *)self uploadSizeLimit] events:v8 error:a5];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [(SFAnalyticsTopic *)self createEventDictionary:*(void *)(*((void *)&v33 + 1) + 8 * i) timestamp:v13 error:a5];
        if (v19) {
          [v10 addObject:v19];
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v16);
  }
  id v20 = [(SFAnalyticsTopic *)self chunkFailureSet:[(SFAnalyticsTopic *)self uploadSizeLimit] events:v9 error:a5];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v21 = v20;
  id v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = [(SFAnalyticsTopic *)self createEventDictionary:*(void *)(*((void *)&v29 + 1) + 8 * (void)j) timestamp:v13 error:a5];
        if (v26) {
          [v10 addObject:v26];
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v23);
  }

  return v10;
}

- (id)createEventDictionary:(id)a3 timestamp:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v19[0] = SFAnalyticsPostTime;
  v19[1] = @"events";
  v20[0] = v8;
  v20[1] = v7;
  id v10 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  if (+[NSJSONSerialization isValidJSONObject:v10])
  {
    id v11 = 0;
  }
  else
  {
    double v12 = sub_1000106A0("SecEmergency");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "json: final dictionary invalid JSON.", buf, 2u);
    }

    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    id v13 = +[NSString localizedStringWithFormat:@"Final dictionary for upload is invalid JSON: %@", v10];
    uint64_t v18 = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v11 = +[NSError errorWithDomain:@"com.apple.security.supd" code:2 userInfo:v14];

    if (a5)
    {
      id v11 = v11;
      id v10 = 0;
      *a5 = v11;
    }
    else
    {
      id v10 = 0;
    }
  }

  return v10;
}

- (id)chunkFailureSet:(unint64_t)a3 events:(id)a4 error:(id *)a5
{
  id v7 = a4;
  BOOL v27 = +[NSMutableArray array];
  id v8 = +[NSMutableArray array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v10)
  {
    id v11 = v10;
    long long v26 = a5;
    unint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v32;
    id obj = v9;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v30 = 0;
        unint64_t v17 = [(SFAnalyticsTopic *)self serializedEventSize:v16 error:&v30];
        id v18 = v30;
        if (v18)
        {
          id v22 = v18;
          if (v26) {
            *long long v26 = v18;
          }
          id v23 = sub_1000106A0("SecEmergency");
          id v20 = v27;
          id v9 = obj;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            id v25 = [v22 localizedDescription];
            *(_DWORD *)long long buf = 138412290;
            long long v36 = v25;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Unable to serialize event JSON: %@", buf, 0xCu);

            id v9 = obj;
          }

          id v21 = 0;
          goto LABEL_22;
        }
        if (v12 > 0x3E7 || v17 + v13 > a3)
        {
          if ([v8 count])
          {
            [v27 addObject:v8];
            uint64_t v19 = +[NSMutableArray array];

            unint64_t v12 = 0;
            uint64_t v13 = 0;
            id v8 = (void *)v19;
          }
          else
          {
            unint64_t v12 = 0;
            uint64_t v13 = 0;
          }
        }
        [v8 addObject:v16];
        ++v12;
        v13 += v17;
      }
      id v9 = obj;
      id v11 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v20 = v27;
  if ([v8 count]) {
    [v27 addObject:v8];
  }
  id v21 = v27;
LABEL_22:

  return v21;
}

- (unint64_t)serializedEventSize:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (+[NSJSONSerialization isValidJSONObject:v5])
  {
    id v14 = 0;
    id v7 = +[NSJSONSerialization dataWithJSONObject:v5 options:0 error:&v14];
    id v8 = v14;
    if (v7)
    {
      id v9 = [v7 length];

      goto LABEL_10;
    }
    id v11 = sub_1000106A0("serializedEventSize");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "failed to serialize event: %@", buf, 0xCu);
    }
  }
  else
  {
    id v10 = sub_1000106A0("serializedEventSize");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "invalid JSON object", buf, 2u);
    }

    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    id v11 = +[NSString localizedStringWithFormat:@"Event is not valid JSON: %@", v5];
    id v18 = v11;
    unint64_t v12 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v8 = +[NSError errorWithDomain:@"com.apple.security.supd" code:2 userInfo:v12];
  }
  if (a4)
  {
    id v8 = v8;
    id v9 = 0;
    *a4 = v8;
  }
  else
  {
    id v9 = 0;
  }
LABEL_10:

  return (unint64_t)v9;
}

- (void)updateUploadDateForClients:(id)a3 date:(id)a4 clearData:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      unint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v12);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100008D88;
        v14[3] = &unk_100018788;
        id v15 = v8;
        id v16 = v13;
        BOOL v17 = a5;
        [v13 withStore:v14];

        unint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (id)healthSummaryWithName:(id)a3 store:(id)a4 uuid:(id)a5 timestamp:(id)a6 lastUploadTime:(id)a7
{
  id v11 = a3;
  id v49 = a4;
  id v44 = a5;
  id v45 = a6;
  id v46 = a7;
  id v47 = v11;
  unint64_t v12 = [v11 queue];
  dispatch_assert_queue_V2(v12);

  id v48 = [v11 name];
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = sub_1000051E4;
  v73 = sub_1000051F4;
  id v74 = (id)0xAAAAAAAAAAAAAAAALL;
  id v74 = +[NSMutableDictionary dictionary];
  uint64_t v13 = +[NSString stringWithFormat:@"%@HealthSummary", v48];
  uint64_t v42 = SFAnalyticsEventType;
  [v70[5] setObject:v13 forKeyedSubscript:x0];

  if ([(SFAnalyticsTopic *)self eventIsBlacklisted:v70[5]])
  {
    id v14 = 0;
  }
  else
  {
    [(id)v70[5] setObject:v45 forKeyedSubscript:SFAnalyticsEventTime];
    +[SFAnalytics addOSVersionToEvent:v70[5]];
    if (v46) {
      [(id)v70[5] setObject:v46 forKeyedSubscript:SFAnalyticsAttributeLastUploadTime];
    }
    v43 = [v49 summaryCounts];
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x2020000000;
    uint64_t v68 = 0;
    uint64_t v61 = 0;
    NSErrorUserInfoKey v62 = &v61;
    uint64_t v63 = 0x2020000000;
    uint64_t v64 = 0;
    uint64_t v57 = 0;
    long long v58 = &v57;
    uint64_t v59 = 0x2020000000;
    uint64_t v60 = 0;
    if ([(SFAnalyticsTopic *)self terseMetrics]) {
      [(id)v70[5] setObject:&off_10001A2A8 forKeyedSubscript:@"T"];
    }
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10000972C;
    v56[3] = &unk_100018738;
    v56[4] = self;
    v56[5] = &v69;
    v56[6] = &v65;
    v56[7] = &v61;
    v56[8] = &v57;
    [v43 enumerateKeysAndObjectsUsingBlock:v56];
    id v15 = +[NSNumber numberWithInteger:v66[3]];
    [(id)v70[5] setObject:v15 forKeyedSubscript:SFAnalyticsColumnSuccessCount];

    id v16 = +[NSNumber numberWithInteger:v62[3]];
    [(id)v70[5] setObject:v16 forKeyedSubscript:SFAnalyticsColumnHardFailureCount];

    BOOL v17 = +[NSNumber numberWithInteger:v58[3]];
    [(id)v70[5] setObject:v17 forKeyedSubscript:SFAnalyticsColumnSoftFailureCount];

    if (os_variant_has_internal_diagnostics()) {
      [(id)v70[5] setObject:&__kCFBooleanTrue forKeyedSubscript:@"internal"];
    }
    uint64_t v18 = [v49 metricsAccountID];
    if (v18) {
      [(id)v70[5] setObject:v18 forKeyedSubscript:@"sfaAccountID"];
    }
    id v41 = (void *)v18;
    long long v19 = +[NSMutableDictionary dictionary];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v20 = [v49 samples];
    id v21 = [v20 countByEnumeratingWithState:&v52 objects:v81 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v53;
      uint64_t v23 = SFAnalyticsColumnSampleName;
      uint64_t v24 = SFAnalyticsColumnSampleValue;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v53 != v22) {
            objc_enumerationMutation(v20);
          }
          long long v26 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          BOOL v27 = [v26 objectForKeyedSubscript:v23];
          long long v28 = [v19 objectForKeyedSubscript:v27];
          BOOL v29 = v28 == 0;

          if (v29)
          {
            id v30 = +[NSMutableArray array];
            long long v31 = [v26 objectForKeyedSubscript:v23];
            [v19 setObject:v30 forKeyedSubscript:v31];
          }
          long long v32 = [v26 objectForKeyedSubscript:v23];
          long long v33 = [v19 objectForKeyedSubscript:v32];
          long long v34 = [v26 objectForKeyedSubscript:v24];
          [v33 addObject:v34];
        }
        id v21 = [v20 countByEnumeratingWithState:&v52 objects:v81 count:16];
      }
      while (v21);
    }

    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100009A8C;
    v51[3] = &unk_100018760;
    v51[4] = self;
    v51[5] = &v69;
    [v19 enumerateKeysAndObjectsUsingBlock:v51];
    if ([(SFAnalyticsTopic *)self prepareEventForUpload:v70[5] linkedUUID:v44])
    {
      if (+[NSJSONSerialization isValidJSONObject:v70[5]])
      {
        id v14 = (id)v70[5];
      }
      else
      {
        long long v36 = sub_1000106A0("SecError");
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v37 = v70[5];
          *(_DWORD *)long long buf = 138412546;
          v78 = v48;
          __int16 v79 = 2112;
          uint64_t v80 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "json: health summary for client %@ is invalid JSON: %@", buf, 0x16u);
        }

        v76[0] = SFAnalyticsEventTypeErrorEvent;
        v75[0] = v42;
        v75[1] = SFAnalyticsEventErrorDestription;
        v38 = +[NSString stringWithFormat:@"JSON:%@HealthSummary", v48];
        v76[1] = v38;
        v39 = +[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:2];
        id v14 = [v39 mutableCopy];
      }
    }
    else
    {
      long long v35 = sub_1000106A0("SecWarning");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        v78 = v48;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "supd: health summary for %@ blacklisted", buf, 0xCu);
      }

      id v14 = 0;
    }

    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&v61, 8);
    _Block_object_dispose(&v65, 8);
  }
  _Block_object_dispose(&v69, 8);

  return v14;
}

- (id)sampleStatisticsForSamples:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableDictionary dictionary];
  unint64_t v9 = (unint64_t)[v6 count];
  id v10 = [v6 sortedArrayUsingSelector:"compare:"];
  id v11 = +[NSExpression expressionForConstantValue:v10];
  uint64_t v68 = v11;
  unint64_t v12 = +[NSArray arrayWithObjects:&v68 count:1];

  if (v9 == 1)
  {
    uint64_t v13 = [v6 objectAtIndexedSubscript:0];
    [v8 setObject:v13 forKeyedSubscript:v7];
LABEL_16:

    goto LABEL_17;
  }
  id v14 = +[NSExpression expressionForFunction:@"average:" arguments:v12];
  id v15 = [v14 expressionValueWithObject:0 context:0];
  id v16 = +[NSString stringWithFormat:@"%@-avg", v7];
  [v8 setObject:v15 forKeyedSubscript:v16];

  if (![(SFAnalyticsTopic *)self terseMetrics])
  {
    BOOL v17 = +[NSExpression expressionForFunction:@"stddev:" arguments:v12];
    uint64_t v18 = [v17 expressionValueWithObject:0 context:0];
    long long v19 = +[NSString stringWithFormat:@"%@-dev", v7];
    [v8 setObject:v18 forKeyedSubscript:v19];

    long long v20 = +[NSExpression expressionForFunction:@"min:" arguments:v12];
    id v21 = [v20 expressionValueWithObject:0 context:0];
    uint64_t v22 = +[NSString stringWithFormat:@"%@-min", v7];
    [v8 setObject:v21 forKeyedSubscript:v22];

    uint64_t v23 = +[NSExpression expressionForFunction:@"max:" arguments:v12];
    uint64_t v24 = [v23 expressionValueWithObject:0 context:0];
    id v25 = +[NSString stringWithFormat:@"%@-max", v7];
    [v8 setObject:v24 forKeyedSubscript:v25];

    long long v26 = +[NSExpression expressionForFunction:@"median:" arguments:v12];
    BOOL v27 = [v26 expressionValueWithObject:0 context:0];
    long long v28 = +[NSString stringWithFormat:@"%@-med", v7];
    [v8 setObject:v27 forKeyedSubscript:v28];
  }
  if (v9 >= 4 && ![(SFAnalyticsTopic *)self terseMetrics])
  {
    uint64_t v13 = +[NSString stringWithFormat:@"%@-1q", v7];
    BOOL v29 = +[NSString stringWithFormat:@"%@-3q", v7];
    if (v9)
    {
      if ((v9 & 3) == 3)
      {
        uint64_t v63 = [v10 objectAtIndexedSubscript:v9 >> 2];
        [v63 doubleValue];
        double v50 = v49;
        id v51 = [v10 objectAtIndexedSubscript:(v9 >> 2) + 1];
        [v51 doubleValue];
        double v42 = 0.25;
        +[NSNumber numberWithDouble:(v52 + v50 * 3.0) * 0.25];
        long long v53 = v65 = v29;
        [v8 setObject:v53 forKeyedSubscript:v13];

        uint64_t v54 = 3 * (v9 >> 2);
        uint64_t v61 = [v10 objectAtIndexedSubscript:v54 + 1];
        [v61 doubleValue];
        double v56 = v55;
        long long v34 = [v10 objectAtIndexedSubscript:v54 + 2];
        [v34 doubleValue];
        double v48 = v56 + v57 * 3.0;
      }
      else
      {
        if ((v9 & 3) != 1)
        {
LABEL_15:

          goto LABEL_16;
        }
        NSErrorUserInfoKey v62 = [v10 objectAtIndexedSubscript:(v9 >> 2) - 1];
        [v62 doubleValue];
        double v39 = v38;
        v40 = [v10 objectAtIndexedSubscript:v9 >> 2];
        [v40 doubleValue];
        double v42 = 0.25;
        +[NSNumber numberWithDouble:(v39 + v41 * 3.0) * 0.25];
        v43 = uint64_t v65 = v29;
        [v8 setObject:v43 forKeyedSubscript:v13];

        uint64_t v44 = 3 * (v9 >> 2);
        uint64_t v61 = [v10 objectAtIndexedSubscript:v44];
        [v61 doubleValue];
        double v46 = v45;
        long long v34 = [v10 objectAtIndexedSubscript:v44 + 1];
        [v34 doubleValue];
        double v48 = v47 + v46 * 3.0;
      }
      BOOL v29 = v65;
      long long v35 = +[NSNumber numberWithDouble:v48 * v42];
      [v8 setObject:v35 forKeyedSubscript:v65];
    }
    else
    {
      unint64_t v30 = v9 >> 1;
      uint64_t v60 = [v10 subarrayWithRange:0, v30];
      uint64_t v59 = +[NSExpression expressionForConstantValue:v60];
      uint64_t v67 = v59;
      long long v31 = +[NSArray arrayWithObjects:&v67 count:1];
      long long v32 = +[NSExpression expressionForFunction:@"median:" arguments:v31];
      [v32 expressionValueWithObject:0 context:0];
      long long v33 = v64 = v29;
      [v8 setObject:v33 forKeyedSubscript:v13];

      uint64_t v61 = [v10 subarrayWithRange:v30, v30];
      long long v34 = +[NSExpression expressionForConstantValue:](NSExpression, "expressionForConstantValue:");
      v66 = v34;
      long long v35 = +[NSArray arrayWithObjects:&v66 count:1];
      long long v36 = +[NSExpression expressionForFunction:@"median:" arguments:v35];
      uint64_t v37 = [v36 expressionValueWithObject:0 context:0];
      [v8 setObject:v37 forKeyedSubscript:v64];

      BOOL v29 = v64;
    }

    goto LABEL_15;
  }
LABEL_17:

  return v8;
}

- (void)addFailures:(id)a3 toUploadRecords:(id)a4 threshold:(unint64_t)a5 linkedUUID:(id)a6
{
  id v9 = a3;
  id v35 = a4;
  id v10 = a6;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v11 = [v9 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v52;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v52 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_10000A60C;
        v47[3] = &unk_1000186E8;
        unint64_t v50 = a5;
        v47[4] = self;
        id v48 = v10;
        id v49 = v35;
        [v15 enumerateObjectsUsingBlock:v47];
      }
      id v12 = [v9 countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v12);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v44 = 0u;
  long long v43 = 0u;
  id v16 = v9;
  id v17 = [v16 countByEnumeratingWithState:&v43 objects:v56 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v44;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v44 != v20) {
          objc_enumerationMutation(v16);
        }
        id v22 = [*(id *)(*((void *)&v43 + 1) + 8 * (void)j) count];
        v19 += ((uint64_t)v22 - a5) & ~((uint64_t)((uint64_t)v22 - a5) >> 63);
      }
      id v18 = [v16 countByEnumeratingWithState:&v43 objects:v56 count:16];
    }
    while (v18);
  }
  else
  {
    uint64_t v19 = 0;
  }

  id v23 = [v35 count];
  unint64_t maxEventsToReport = self->_maxEventsToReport;
  if ((unint64_t)v23 < maxEventsToReport && v19 >= 1)
  {
    id v25 = [v35 count];
    long long v39 = 0u;
    long long v40 = 0u;
    if ((double)(maxEventsToReport - (unint64_t)v25) / (double)v19 <= 1.0) {
      double v26 = (double)(maxEventsToReport - (unint64_t)v25) / (double)v19;
    }
    else {
      double v26 = 1.0;
    }
    long long v41 = 0uLL;
    long long v42 = 0uLL;
    id v27 = v16;
    id v28 = [v27 countByEnumeratingWithState:&v39 objects:v55 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v40;
      do
      {
        for (k = 0; k != v29; k = (char *)k + 1)
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(v27);
          }
          long long v32 = *(void **)(*((void *)&v39 + 1) + 8 * (void)k);
          if ((unint64_t)[v32 count] > a5)
          {
            long long v33 = [v32 subarrayWithRange:a5, (unint64_t)(v26 * (double)((unint64_t)objc_msgSend(v32, "count") - a5))];
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472;
            v36[2] = sub_10000A7DC;
            v36[3] = &unk_100018710;
            v36[4] = self;
            id v37 = v10;
            id v38 = v35;
            [v33 enumerateObjectsUsingBlock:v36];
          }
        }
        id v29 = [v27 countByEnumeratingWithState:&v39 objects:v55 count:16];
      }
      while (v29);
    }
  }
}

- (BOOL)prepareEventForUpload:(id)a3 linkedUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(SFAnalyticsTopic *)self eventIsBlacklisted:v6];
  if ((v8 & 1) == 0)
  {
    [(SFAnalyticsTopic *)self removeBlacklistedFieldsFromEvent:v6];
    [(SFAnalyticsTopic *)self addRequiredFieldsToEvent:v6];
    if (self->_disableClientId) {
      [v6 setObject:&off_10001A290 forKeyedSubscript:@"clientId"];
    }
    splunkTopicName = self->_splunkTopicName;
    if (!splunkTopicName)
    {
      id v12 = +[NSNull null];
      [v6 setObject:v12 forKeyedSubscript:@"topic"];

      if (!v7) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    [v6 setObject:splunkTopicName forKeyedSubscript:@"topic"];
    if (v7)
    {
LABEL_6:
      id v10 = [v7 UUIDString];
      [v6 setObject:v10 forKeyedSubscript:@"eventLinkID"];
    }
  }
LABEL_7:

  return v8 ^ 1;
}

- (void)addRequiredFieldsToEvent:(id)a3
{
  id v4 = a3;
  metricsBase = self->_metricsBase;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A9E4;
  v7[3] = &unk_1000186C0;
  id v8 = v4;
  id v6 = v4;
  [(NSDictionary *)metricsBase enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)removeBlacklistedFieldsFromEvent:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_blacklistedFields;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 removeObjectForKey:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9), (void)v10];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)eventIsBlacklisted:(id)a3
{
  blacklistedEvents = self->_blacklistedEvents;
  if (!blacklistedEvents) {
    return 0;
  }
  id v4 = [a3 objectForKeyedSubscript:SFAnalyticsEventType];
  unsigned __int8 v5 = [(NSArray *)blacklistedEvents containsObject:v4];

  return v5;
}

- (BOOL)postJSON:(id)a3 toEndpoint:(id)a4 postSession:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    id v13 = objc_alloc_init((Class)NSMutableURLRequest);
    [v13 setURL:v11];
    [v13 setHTTPMethod:@"POST"];
    id v14 = [v10 supd_gzipDeflate];
    [v13 setHTTPBody:v14];

    [v13 setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000AEE0;
    v23[3] = &unk_100018698;
    v23[4] = self;
    double v26 = &v27;
    id v24 = v11;
    id v16 = v15;
    id v25 = v16;
    id v17 = [v12 dataTaskWithRequest:v13 completionHandler:v23];
    id v18 = sub_1000106A0("upload");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      internalTopicName = self->_internalTopicName;
      *(_DWORD *)long long buf = 138412290;
      long long v32 = internalTopicName;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Splunk upload start for %@", buf, 0xCu);
    }

    [v17 resume];
    dispatch_time_t v20 = dispatch_time(0, 300000000000);
    dispatch_semaphore_wait(v16, v20);
    BOOL v21 = *((unsigned char *)v28 + 24) != 0;

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    if (!a6)
    {
      BOOL v21 = 0;
      goto LABEL_8;
    }
    id v13 = +[NSString stringWithFormat:@"No endpoint for %@", self->_internalTopicName];
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    id v34 = v13;
    id v16 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    +[NSError errorWithDomain:@"SupdUploadErrorDomain" code:-10 userInfo:v16];
    BOOL v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_8:
  return v21;
}

- (id)getSession
{
  id v3 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  id v4 = +[NSString stringWithFormat:@"securityd/%s", "61439.62.1", @"User-Agent"];
  id v9 = v4;
  unsigned __int8 v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [v3 setHTTPAdditionalHeaders:v5];

  id v6 = +[NSURLSession sessionWithConfiguration:v3 delegate:self delegateQueue:0];

  return v6;
}

- (BOOL)isSampledUpload
{
  uint32_t v3 = arc4random();
  double devicePercentage = self->_devicePercentage;
  if (devicePercentage >= 0.0000000232830644)
  {
    if (devicePercentage / 100.0 * 4294967300.0 < (double)v3) {
      return 0;
    }
  }
  else if (v3)
  {
    return 0;
  }
  return 1;
}

- (SFAnalyticsTopic)initWithDictionary:(id)a3 name:(id)a4 samplingRates:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v53.receiver = self;
  v53.super_class = (Class)SFAnalyticsTopic;
  id v11 = [(SFAnalyticsTopic *)&v53 init];
  id v12 = v11;
  if (v11)
  {
    v11->_terseMetrics = 0;
    objc_storeStrong((id *)&v11->_internalTopicName, a4);
    id v51 = v9;
    [(SFAnalyticsTopic *)v12 setupClientsForTopic:v9];
    uint64_t v13 = [v8 objectForKeyedSubscript:@"splunk_topic"];
    splunkTopicName = v12->_splunkTopicName;
    v12->_splunkTopicName = (NSString *)v13;

    dispatch_semaphore_t v15 = [v8 objectForKeyedSubscript:@"splunk_uploadURL"];
    uint64_t v16 = +[NSURL URLWithString:v15];
    splunkUploadURL = v12->__splunkUploadURL;
    v12->__splunkUploadURL = (NSURL *)v16;

    id v18 = [v8 objectForKeyedSubscript:@"splunk_bagURL"];
    uint64_t v19 = +[NSURL URLWithString:v18];
    splunkBagURL = v12->_splunkBagURL;
    v12->_splunkBagURL = (NSURL *)v19;

    BOOL v21 = [v8 valueForKey:@"splunk_allowInsecureCertificate"];
    v12->_allowInsecureSplunkCert = [v21 BOOLValue];

    id v22 = [v8 valueForKey:@"uploadSizeLimit"];
    v12->_uploadSizeLimit = (unint64_t)[v22 unsignedIntegerValue];

    long long v52 = [v8 objectForKeyedSubscript:@"splunk_endpointDomain"];
    id v23 = [v8 objectForKeyedSubscript:@"disableClientId"];

    if (v23) {
      v12->_disableClientId = 1;
    }
    id v24 = objc_alloc((Class)NSUserDefaults);
    id v25 = [v24 initWithSuiteName:SFAnalyticsUserDefaultsSuite];
    double v26 = [v25 stringForKey:@"splunk_topic"];
    if (v26) {
      objc_storeStrong((id *)&v12->_splunkTopicName, v26);
    }
    unint64_t v50 = v26;
    uint64_t v27 = [v25 stringForKey:@"splunk_uploadURL"];
    id v28 = +[NSURL URLWithString:v27];

    if (v28) {
      objc_storeStrong((id *)&v12->__splunkUploadURL, v28);
    }
    uint64_t v29 = [v25 stringForKey:@"splunk_bagURL"];
    char v30 = +[NSURL URLWithString:v29];

    if (v30) {
      objc_storeStrong((id *)&v12->_splunkBagURL, v30);
    }
    uint64_t v31 = (uint64_t)[v25 integerForKey:@"uploadSizeLimit"];
    if (v31 >= 1) {
      v12->_uploadSizeLimit = v31;
    }
    v12->_allowInsecureSplunkCert |= [v25 BOOLForKey:@"splunk_allowInsecureCertificate"];
    long long v32 = [v25 stringForKey:@"splunk_endpointDomain"];
    NSErrorUserInfoKey v33 = v32;
    if (v32)
    {
      id v34 = v32;

      long long v52 = v34;
    }
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (v10)
    {
      if (has_internal_diagnostics) {
        CFStringRef v36 = @"SecondsBetweenUploadsInternal";
      }
      else {
        CFStringRef v36 = @"SecondsBetweenUploadsCustomer";
      }
      if (has_internal_diagnostics) {
        CFStringRef v37 = @"DevicePercentageInternal";
      }
      else {
        CFStringRef v37 = @"DevicePercentageCustomer";
      }
      id v38 = [v10 objectForKeyedSubscript:v36];
      long long v39 = [v10 objectForKeyedSubscript:v37];
      v12->_unint64_t secondsBetweenUploads = (unint64_t)[v38 integerValue];
      long long v40 = [v10 objectForKeyedSubscript:@"NumberOfEvents"];
      v12->_unint64_t maxEventsToReport = (unint64_t)[v40 unsignedIntegerValue];

      [v39 floatValue];
      v12->_double devicePercentage = v41;
    }
    else
    {
      uint64_t v42 = 259200;
      if (has_internal_diagnostics) {
        uint64_t v42 = 86400;
      }
      unint64_t v43 = SFAnalyticsMaxEventsToReport;
      v12->_unint64_t secondsBetweenUploads = v42;
      v12->_unint64_t maxEventsToReport = v43;
      v12->_double devicePercentage = 100.0;
    }
    long long v44 = sub_1000106A0("supd");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      internalTopicName = v12->_internalTopicName;
      unint64_t secondsBetweenUploads = v12->_secondsBetweenUploads;
      unint64_t maxEventsToReport = v12->_maxEventsToReport;
      double devicePercentage = v12->_devicePercentage;
      *(_DWORD *)long long buf = 138413058;
      double v55 = internalTopicName;
      __int16 v56 = 2048;
      unint64_t v57 = secondsBetweenUploads;
      __int16 v58 = 2048;
      unint64_t v59 = maxEventsToReport;
      __int16 v60 = 2048;
      double v61 = devicePercentage;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "created %@ with %lu seconds between uploads, %lu max events, %f percent of uploads", buf, 0x2Au);
    }

    id v9 = v51;
  }

  return v12;
}

- (void)setupClientsForTopic:(id)a3
{
  id v18 = a3;
  id v4 = (NSArray *)objc_opt_new();
  if ([v18 isEqualToString:SFAnalyticsTopicKeySync])
  {
    unsigned __int8 v5 = [(id)objc_opt_class() databasePathForCKKS];
    id v6 = +[SFAnalyticsClient getSharedClientNamed:@"ckks" orCreateWithStorePath:v5 requireDeviceAnalytics:0 requireiCloudAnalytics:1];
    [(NSArray *)v4 addObject:v6];

    id v7 = [(id)objc_opt_class() databasePathForSOS];
    id v8 = +[SFAnalyticsClient getSharedClientNamed:@"sos" orCreateWithStorePath:v7 requireDeviceAnalytics:0 requireiCloudAnalytics:1];
    [(NSArray *)v4 addObject:v8];

    id v9 = [(id)objc_opt_class() databasePathForPCS];
    id v10 = +[SFAnalyticsClient getSharedClientNamed:@"pcs" orCreateWithStorePath:v9 requireDeviceAnalytics:0 requireiCloudAnalytics:1];
    [(NSArray *)v4 addObject:v10];

    id v11 = [(id)objc_opt_class() databasePathForLocal];
    CFStringRef v12 = @"local";
LABEL_9:
    uint64_t v13 = v11;
    uint64_t v14 = 1;
    uint64_t v15 = 0;
LABEL_10:
    uint64_t v16 = +[SFAnalyticsClient getSharedClientNamed:v12 orCreateWithStorePath:v13 requireDeviceAnalytics:v14 requireiCloudAnalytics:v15];
    [(NSArray *)v4 addObject:v16];

    goto LABEL_11;
  }
  if ([v18 isEqualToString:SFAnalyticsTopicCloudServices])
  {
    id v11 = [(id)objc_opt_class() databasePathForCloudServices];
    CFStringRef v12 = @"CloudServices";
    goto LABEL_9;
  }
  if ([v18 isEqualToString:SFAnalyticsTopicTrust])
  {
    id v11 = [(id)objc_opt_class() databasePathForTrust];
    CFStringRef v12 = @"trust";
    goto LABEL_9;
  }
  if ([v18 isEqualToString:SFAnalyticsTopicNetworking])
  {
    id v11 = [(id)objc_opt_class() databasePathForNetworking];
    CFStringRef v12 = @"networking";
    goto LABEL_9;
  }
  if ([v18 isEqualToString:SFAnalyticsTopicTransparency])
  {
    [(SFAnalyticsTopic *)self setTerseMetrics:1];
    id v11 = [(id)objc_opt_class() databasePathForTransparency];
    CFStringRef v12 = @"transparency";
LABEL_18:
    uint64_t v13 = v11;
    uint64_t v14 = 0;
    uint64_t v15 = 1;
    goto LABEL_10;
  }
  if ([v18 isEqualToString:SFAnalyticsTopicSWTransparency])
  {
    [(SFAnalyticsTopic *)self setTerseMetrics:1];
    id v11 = [(id)objc_opt_class() databasePathForSWTransparency];
    CFStringRef v12 = @"swtransparency";
    goto LABEL_18;
  }
LABEL_11:
  topicClients = self->_topicClients;
  self->_topicClients = v4;
}

+ (id)databasePathForSWTransparency
{
  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  CFURLRef v2 = sub_1000107C0(@"Library/Keychains", @"Analytics/SWTransparencyAnalytics.db");
  uint32_t v3 = [(__CFURL *)v2 path];

  return v3;
}

+ (id)databasePathForTransparency
{
  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  CFURLRef v2 = sub_1000107C0(@"Library/Keychains", @"Analytics/TransparencyAnalytics.db");
  uint32_t v3 = [(__CFURL *)v2 path];

  return v3;
}

+ (id)databasePathForCloudServices
{
  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  CFURLRef v2 = sub_1000107C0(@"Library/Keychains", @"Analytics/CloudServicesAnalytics.db");
  uint32_t v3 = [(__CFURL *)v2 path];

  return v3;
}

+ (id)databasePathForNetworking
{
  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  CFURLRef v2 = sub_1000107C0(@"Library/Keychains", @"Analytics/networking_analytics.db");
  uint32_t v3 = [(__CFURL *)v2 path];

  return v3;
}

+ (id)databasePathForTrust
{
  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  CFURLRef v2 = sub_1000107C0(@"Library/Keychains", @"Analytics/trust_analytics.db");
  uint32_t v3 = [(__CFURL *)v2 path];

  return v3;
}

+ (id)databasePathForLocal
{
  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  CFURLRef v2 = sub_1000107C0(@"Library/Keychains", @"Analytics/localkeychain.db");
  uint32_t v3 = [(__CFURL *)v2 path];

  return v3;
}

+ (id)databasePathForPCS
{
  CFURLRef v2 = [a1 AppSupportPath];
  if (v2)
  {
    uint32_t v3 = +[NSString stringWithFormat:@"%@/com.apple.ProtectedCloudStorage/PCSAnalytics.db", v2];
    id v4 = sub_1000106A0("supd");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PCS Database path (%@)", buf, 0xCu);
    }
  }
  else
  {
    uint32_t v3 = 0;
  }

  return v3;
}

+ (id)AppSupportPath
{
  return @"/var/mobile/Library/Application Support";
}

+ (id)databasePathForSOS
{
  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  CFURLRef v2 = sub_1000107C0(@"Library/Keychains", @"Analytics/sos_analytics.db");
  uint32_t v3 = [(__CFURL *)v2 path];

  return v3;
}

+ (id)databasePathForCKKS
{
  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  CFURLRef v2 = sub_1000107C0(@"Library/Keychains", @"Analytics/ckks_analytics.db");
  uint32_t v3 = [(__CFURL *)v2 path];

  return v3;
}

@end