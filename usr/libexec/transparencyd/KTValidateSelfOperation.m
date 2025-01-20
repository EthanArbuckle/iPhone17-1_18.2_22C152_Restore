@interface KTValidateSelfOperation
- (BOOL)hasDeviceErrorForUri:(id)a3;
- (BOOL)isOptInSelfValidation;
- (BOOL)validateOptInStatusWithAccountKey:(id)a3 error:(id *)a4;
- (KTAccountKeyProtocol)accountKeyServer;
- (KTOperationDependencies)deps;
- (KTSelfVerificationInfo)selfInfo;
- (KTValidateSelfOperation)initWithApplication:(id)a3 dependencies:(id)a4 isOptInSelfValidation:(BOOL)a5;
- (NSDate)expectedResolutionDate;
- (NSMutableDictionary)cachedTimes;
- (NSMutableDictionary)selfErrors;
- (NSMutableDictionary)selfResults;
- (NSMutableDictionary)transparentDatas;
- (NSOperation)finishedOp;
- (NSString)application;
- (OS_dispatch_queue)uriQueue;
- (id)ktLogData:(id)a3 accountKey:(id)a4;
- (void)fillStatus;
- (void)groupStart;
- (void)handleOperationResults:(id)a3;
- (void)setAccountKeyServer:(id)a3;
- (void)setApplication:(id)a3;
- (void)setCachedTimes:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setIsOptInSelfValidation:(BOOL)a3;
- (void)setSelfErrors:(id)a3;
- (void)setSelfInfo:(id)a3;
- (void)setSelfResults:(id)a3;
- (void)setTransparentDatas:(id)a3;
- (void)setUriQueue:(id)a3;
@end

@implementation KTValidateSelfOperation

- (KTValidateSelfOperation)initWithApplication:(id)a3 dependencies:(id)a4 isOptInSelfValidation:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)KTValidateSelfOperation;
  v11 = [(KTGroupOperation *)&v22 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)(v11 + 134), a4);
    objc_storeStrong((id *)(v12 + 142), a3);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("ValidateSelf_URIWaiter", v13);
    [v12 setUriQueue:v14];

    v15 = +[NSMutableDictionary dictionary];
    [v12 setTransparentDatas:v15];

    v16 = +[NSMutableDictionary dictionary];
    [v12 setSelfErrors:v16];

    v17 = +[NSMutableDictionary dictionary];
    [v12 setSelfResults:v17];

    v18 = [v10 accountKeyService];
    v19 = [v18 accountKeyService:v9];
    [v12 setAccountKeyServer:v19];

    v20 = +[NSMutableDictionary dictionary];
    [v12 setCachedTimes:v20];

    [v12 setIsOptInSelfValidation:v5];
  }

  return (KTValidateSelfOperation *)v12;
}

- (void)groupStart
{
  id v3 = objc_alloc_init((Class)NSOperation);
  [(KTValidateSelfOperation *)self setFinishedOp:v3];

  v4 = [(KTValidateSelfOperation *)self finishedOp];
  [(KTGroupOperation *)self dependOnBeforeGroupFinished:v4];

  if (qword_100326740 != -1) {
    dispatch_once(&qword_100326740, &stru_1002B8DA8);
  }
  BOOL v5 = qword_100326748;
  if (os_log_type_enabled((os_log_t)qword_100326748, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "ValidateSelf: start", buf, 2u);
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v6 = [(KTValidateSelfOperation *)self deps];
  v7 = [v6 smDataStore];
  v8 = [(KTValidateSelfOperation *)self application];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000283D4;
  v9[3] = &unk_1002B9070;
  objc_copyWeak(&v10, (id *)buf);
  [v7 fetchSelfVerificationInfoForApplication:v8 complete:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (BOOL)hasDeviceErrorForUri:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(KTValidateSelfOperation *)self selfInfo];
  v6 = [v5 uriToServerLoggableDatas];
  v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v8 = [v7 serverLoggableDatas];
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          if (![*(id *)(*((void *)&v13 + 1) + 8 * i) result])
          {
            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return (char)v9;
}

- (void)fillStatus
{
  v2 = self;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [(KTValidateSelfOperation *)self selfResults];
  id v39 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
  v40 = v2;
  if (v39)
  {
    uint64_t v37 = *(void *)v42;
    v38 = 0;
    uint64_t v4 = 2;
    *(void *)&long long v3 = 141558530;
    long long v35 = v3;
    do
    {
      BOOL v5 = 0;
      do
      {
        if (*(void *)v42 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v41 + 1) + 8 * (void)v5);
        v7 = [(KTValidateSelfOperation *)v2 selfResults];
        v8 = [v7 objectForKeyedSubscript:v6];

        id v9 = [v8 unsignedIntegerValue];
        uint64_t v10 = [(KTValidateSelfOperation *)v2 selfInfo];
        v11 = [v10 uriToServerLoggableDatas];
        v12 = [v11 objectForKeyedSubscript:v6];
        long long v13 = [v12 serverLoggableDatas];

        if (v9 == (id)1)
        {
          uint64_t v14 = 0;
        }
        else if (v9)
        {
          uint64_t v14 = 2;
        }
        else if ([(KTValidateSelfOperation *)v40 hasDeviceErrorForUri:v6])
        {
          uint64_t v14 = 1;
        }
        else
        {
          long long v15 = [(KTValidateSelfOperation *)v40 selfErrors];
          long long v16 = [v15 objectForKeyedSubscript:@"optIn"];

          if (v16) {
            uint64_t v14 = 4;
          }
          else {
            uint64_t v14 = 3;
          }
        }
        if (qword_100326740 != -1) {
          dispatch_once(&qword_100326740, &stru_1002B9090);
        }
        v17 = (void *)qword_100326748;
        if (os_log_type_enabled((os_log_t)qword_100326748, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          v19 = +[NSNumber numberWithUnsignedInteger:v14];
          *(_DWORD *)buf = v35;
          uint64_t v46 = 1752392040;
          __int16 v47 = 2112;
          uint64_t v48 = v6;
          __int16 v49 = 2112;
          v50 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "ValidateSelf fillStatus: %{mask.hash}@ has uriStatus %@", buf, 0x20u);
        }
        if (dword_100285630[v14] <= dword_100285630[v4])
        {
          id v20 = v13;

          v38 = v20;
          uint64_t v4 = v14;
        }
        v2 = v40;

        BOOL v5 = (char *)v5 + 1;
      }
      while (v39 != v5);
      id v39 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v39);
  }
  else
  {
    v38 = 0;
    uint64_t v4 = 2;
  }

  if (qword_100326740 != -1) {
    dispatch_once(&qword_100326740, &stru_1002B90B0);
  }
  v21 = (void *)qword_100326748;
  if (os_log_type_enabled((os_log_t)qword_100326748, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v22 = v21;
    v23 = +[NSNumber numberWithUnsignedInteger:v4];
    *(_DWORD *)buf = 138412290;
    uint64_t v46 = (uint64_t)v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "ValidateSelf fillStatus: setting selfStatus to %@", buf, 0xCu);

    v2 = v40;
  }
  [(KTValidateSelfOperation *)v2 deps];
  v25 = v24 = v2;
  v26 = [v25 stateMonitor];
  [v26 setSelfStatus:v4];

  v27 = [(KTValidateSelfOperation *)v24 deps];
  v28 = [v27 stateMonitor];
  [v28 setSelfDevices:v38];

  v29 = [(KTValidateSelfOperation *)v24 deps];
  v30 = [v29 stateMonitor];
  v31 = [v30 statusFilled];
  [v31 fulfill];

  v32 = [[KTPendingFlag alloc] initWithFlag:@"StatusUpdate" delayInSeconds:1.0];
  v33 = [(KTValidateSelfOperation *)v24 deps];
  v34 = [v33 flagHandler];
  [v34 handlePendingFlag:v32];
}

- (BOOL)validateOptInStatusWithAccountKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(KTValidateSelfOperation *)self transparentDatas];
  v8 = [(KTValidateSelfOperation *)self ktLogData:v7 accountKey:v6];

  id v9 = [(KTValidateSelfOperation *)self deps];
  uint64_t v10 = [v9 cloudRecords];
  v11 = [(KTValidateSelfOperation *)self application];
  id v17 = 0;
  v12 = [v10 evaluateKTLogData:v8 application:v11 error:&v17];
  id v13 = v17;

  if (v12)
  {
    if (qword_100326740 != -1) {
      dispatch_once(&qword_100326740, &stru_1002B90F0);
    }
    uint64_t v14 = qword_100326748;
    if (os_log_type_enabled((os_log_t)qword_100326748, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "evaluateKTLogData eval result: %@", buf, 0xCu);
    }
  }
  else
  {
    if (qword_100326740 != -1) {
      dispatch_once(&qword_100326740, &stru_1002B90D0);
    }
    long long v15 = qword_100326748;
    if (os_log_type_enabled((os_log_t)qword_100326748, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "evaluateKTLogData failure: %@", buf, 0xCu);
    }
    if (a4 && v13) {
      *a4 = v13;
    }
  }

  return v12 != 0;
}

- (id)ktLogData:(id)a3 accountKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[NSMutableDictionary dictionary];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002AEC0;
  v12[3] = &unk_1002B9118;
  id v13 = v5;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  id v8 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];

  id v9 = v14;
  id v10 = v7;

  return v10;
}

- (void)handleOperationResults:(id)a3
{
  uint64_t v46 = (void (**)(id, uint64_t, id, void *, void *))a3;
  uint64_t v4 = [(KTValidateSelfOperation *)self selfInfo];
  if (v4)
  {
    id v5 = [(KTValidateSelfOperation *)self transparentDatas];
    if ([v5 count])
    {
      id v6 = [(KTValidateSelfOperation *)self selfResults];
      id v7 = [v6 count];

      if (v7)
      {
        id v47 = objc_alloc_init((Class)KTSelfValidationDiagnostics);
        id v8 = [(KTValidateSelfOperation *)self selfInfo];
        id v9 = [v8 diagnosticsJsonDictionary];
        [v47 setKtSelfVerificationInfoDiagnosticsJson:v9];

        id v10 = [(KTValidateSelfOperation *)self selfInfo];
        v11 = [v10 selfDeviceID];
        v12 = [v11 kt_hexString];
        [v47 setPushToken:v12];

        id v13 = [(KTValidateSelfOperation *)self accountKeyServer];
        LODWORD(v11) = [v13 haveIdentity];

        if (v11)
        {
          *(void *)buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v66 = sub_10002B864;
          v67 = sub_10002B874;
          id v68 = 0;
          uint64_t v58 = 0;
          v59 = &v58;
          uint64_t v60 = 0x3032000000;
          v61 = sub_10002B864;
          v62 = sub_10002B874;
          id v63 = 0;
          id v14 = [(KTValidateSelfOperation *)self accountKeyServer];
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472;
          v57[2] = sub_10002B87C;
          v57[3] = &unk_1002B9160;
          v57[4] = buf;
          v57[5] = &v58;
          [v14 signData:0 completionBlock:v57];

          if (*(void *)(*(void *)&buf[8] + 40) && v59[5])
          {
            [v47 setRawAccountKey:];
            [v47 setAccountKey:v59[5]];
          }
          _Block_object_dispose(&v58, 8);

          _Block_object_dispose(buf, 8);
        }
        v51 = +[NSMutableDictionary dictionary];
        v52 = +[NSMutableDictionary dictionary];
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v15 = [(KTValidateSelfOperation *)self selfInfo];
        id obj = [v15 uriToServerLoggableDatas];

        id v16 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
        if (v16)
        {
          uint64_t v49 = 1;
          uint64_t v50 = *(void *)v54;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v54 != v50) {
                objc_enumerationMutation(obj);
              }
              uint64_t v18 = *(void *)(*((void *)&v53 + 1) + 8 * i);
              id v19 = [(KTValidateSelfOperation *)self selfInfo];
              id v20 = [v19 uriToServerLoggableDatas];
              v21 = [v20 objectForKeyedSubscript:v18];

              objc_super v22 = [(KTValidateSelfOperation *)self application];
              v23 = +[TransparencyApplication addApplicationPrefixForIdentifier:v22 uri:v18];

              id v24 = objc_alloc_init((Class)KTSelfValidationURIDiagnostics);
              v25 = [v21 diagnosticsJsonDictionary];
              [v24 setKtVerificationInfoDiagnosticsJson:v25];

              v26 = [v21 serverLoggableDatas];
              +[KTLoggableData combineLoggableDatasForUI:v52 byAdding:v26];

              v27 = [(KTValidateSelfOperation *)self selfResults];
              v28 = [v27 objectForKeyedSubscript:v23];

              signed int v29 = [v28 intValue];
              CFStringRef v30 = @"OK";
              switch(v29)
              {
                case 0:
                  uint64_t v49 = v29;
                  CFStringRef v30 = @"Failed";
                  break;
                case 1:
                  break;
                case 2:
                  uint64_t v49 = v29;
                  CFStringRef v30 = @"Pending";
                  break;
                case 3:
                  CFStringRef v30 = @"Ignored";
                  break;
                default:
                  uint64_t v49 = 0;
                  CFStringRef v30 = @"Unknown";
                  break;
              }
              [v24 setResult:v30];
              v31 = [(KTValidateSelfOperation *)self cachedTimes];
              v32 = [v31 objectForKeyedSubscript:v23];
              [v24 setRequestTime:v32];

              v33 = [(KTValidateSelfOperation *)self selfErrors];
              v34 = [v33 objectForKeyedSubscript:v23];

              if (v34) {
                [v24 setError:v34];
              }
              long long v35 = [(KTValidateSelfOperation *)self transparentDatas];
              v36 = [v35 objectForKeyedSubscript:v23];

              uint64_t v37 = [v36 diagnosticsJsonDictionary];
              [v24 setTransparentDataDiagnosticsJson:v37];

              [v51 setObject:v24 forKeyedSubscript:v23];
            }
            id v16 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
          }
          while (v16);
        }
        else
        {
          uint64_t v49 = 1;
        }

        [v47 setUriToDiagnostics:v51];
        long long v44 = [v52 allValues];
        v45 = [(KTResultOperation *)self error];
        v46[2](v46, v49, v47, v44, v45);

        goto LABEL_32;
      }
    }
    else
    {
    }
  }
  if (qword_100326740 != -1) {
    dispatch_once(&qword_100326740, &stru_1002B9138);
  }
  v38 = (void *)qword_100326748;
  if (os_log_type_enabled((os_log_t)qword_100326748, OS_LOG_TYPE_DEFAULT))
  {
    id v39 = v38;
    v40 = [(KTValidateSelfOperation *)self selfInfo];
    long long v41 = [(KTValidateSelfOperation *)self transparentDatas];
    unsigned int v42 = [v41 count];
    long long v43 = [(KTValidateSelfOperation *)self selfResults];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v40;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v42;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = [v43 count];
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "missing inputdata: selfinfo: %@ transparentDatas: %d selfResults: %d", buf, 0x18u);
  }
  id v47 = [(KTResultOperation *)self error];
  v46[2](v46, 0, 0, 0, v47);
LABEL_32:
}

- (NSDate)expectedResolutionDate
{
  return (NSDate *)objc_getProperty(self, a2, 126, 1);
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 134, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 142, 1);
}

- (void)setApplication:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 150, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (OS_dispatch_queue)uriQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 158, 1);
}

- (void)setUriQueue:(id)a3
{
}

- (KTSelfVerificationInfo)selfInfo
{
  return (KTSelfVerificationInfo *)objc_getProperty(self, a2, 166, 1);
}

- (void)setSelfInfo:(id)a3
{
}

- (NSMutableDictionary)transparentDatas
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 174, 1);
}

- (void)setTransparentDatas:(id)a3
{
}

- (NSMutableDictionary)selfErrors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 182, 1);
}

- (void)setSelfErrors:(id)a3
{
}

- (NSMutableDictionary)selfResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 190, 1);
}

- (void)setSelfResults:(id)a3
{
}

- (KTAccountKeyProtocol)accountKeyServer
{
  return (KTAccountKeyProtocol *)objc_getProperty(self, a2, 198, 1);
}

- (void)setAccountKeyServer:(id)a3
{
}

- (NSMutableDictionary)cachedTimes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 206, 1);
}

- (void)setCachedTimes:(id)a3
{
}

- (BOOL)isOptInSelfValidation
{
  return self->_isOptInSelfValidation;
}

- (void)setIsOptInSelfValidation:(BOOL)a3
{
  self->_isOptInSelfValidation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_accountKeyServer + 6), 0);
  objc_storeStrong((id *)((char *)&self->_selfResults + 6), 0);
  objc_storeStrong((id *)((char *)&self->_selfErrors + 6), 0);
  objc_storeStrong((id *)((char *)&self->_transparentDatas + 6), 0);
  objc_storeStrong((id *)((char *)&self->_selfInfo + 6), 0);
  objc_storeStrong((id *)((char *)&self->_uriQueue + 6), 0);
  objc_storeStrong((id *)((char *)&self->_finishedOp + 6), 0);
  objc_storeStrong((id *)((char *)&self->_application + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_expectedResolutionDate + 6), 0);

  objc_storeStrong((id *)(&self->_isOptInSelfValidation + 6), 0);
}

@end