@interface TransparencyLogClient
+ (double)timeShift:(id)a3;
- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 useReversePush:(BOOL)a5 completionHandler:(id)a6;
- (BOOL)fetch:(id)a3 shouldRetry:(BOOL)a4 allowEmptyData:(BOOL)a5 completionHandler:(id)a6;
- (BOOL)fetch:(id)a3 shouldRetry:(BOOL)a4 allowEmptyData:(BOOL)a5 useReversePush:(BOOL)a6 completionHandler:(id)a7;
- (BOOL)needsReauthorization:(id)a3 metadata:(id)a4;
- (BOOL)needsRetry:(id)a3;
- (BOOL)needsTimeShift:(id)a3 metadata:(id)a4;
- (BOOL)ready;
- (TransparencyAnalytics)transparencyAnalytics;
- (TransparencyIDSConfigBag)idsConfigBag;
- (TransparencyLogClient)initWithBackgroundSession:(id)a3 transparencyAnalytics:(id)a4 dataStore:(id)a5 settings:(id)a6;
- (TransparencyLogSession)session;
- (TransparencyManagedDataStore)dataStore;
- (TransparencySettingsProtocol)settings;
- (void)deleteDownloadId:(id)a3;
- (void)fetchRequest:(id)a3 completionHandler:(id)a4;
- (void)renewAccountTokenForFetch:(id)a3 allowEmptyData:(BOOL)a4 useReversePush:(BOOL)a5 completionHandler:(id)a6;
- (void)setDataStore:(id)a3;
- (void)setIdsConfigBag:(id)a3;
- (void)setSession:(id)a3;
- (void)setSettings:(id)a3;
- (void)setTransparencyAnalytics:(id)a3;
@end

@implementation TransparencyLogClient

- (TransparencyLogClient)initWithBackgroundSession:(id)a3 transparencyAnalytics:(id)a4 dataStore:(id)a5 settings:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TransparencyLogClient;
  v14 = [(TransparencyLogClient *)&v18 init];
  v15 = v14;
  if (v14)
  {
    [(TransparencyLogClient *)v14 setSession:v10];
    [(TransparencyLogClient *)v15 setDataStore:v12];
    [(TransparencyLogClient *)v15 setTransparencyAnalytics:v11];
    [(TransparencyLogClient *)v15 setSettings:v13];
    v16 = +[TransparencyIDSConfigBag sharedInstance];
    [(TransparencyLogClient *)v15 setIdsConfigBag:v16];
  }
  return v15;
}

- (BOOL)ready
{
  v3 = [(TransparencyLogClient *)self session];
  v4 = [v3 auth];
  unsigned int v5 = [v4 isSupported];

  if (!v5) {
    return 1;
  }
  v6 = [(TransparencyLogClient *)self session];
  v7 = [v6 auth];
  unsigned __int8 v8 = [v7 ready];

  return v8;
}

- (BOOL)needsRetry:(id)a3
{
  return a3 && [a3 code] == (id)-174;
}

- (BOOL)needsReauthorization:(id)a3 metadata:(id)a4
{
  id v6 = a4;
  if ([(TransparencyLogClient *)self needsRetry:a3])
  {
    v7 = [v6 objectForKeyedSubscript:@"x-auth-status"];
    unsigned __int8 v8 = v7;
    if (v7)
    {
      if ([v7 isEqualToString:@"unauthorized"])
      {
        if (qword_10032F3B8 != -1) {
          dispatch_once(&qword_10032F3B8, &stru_1002C9F20);
        }
        uint64_t v9 = qword_10032F3C0;
        if (!os_log_type_enabled((os_log_t)qword_10032F3C0, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        LOWORD(v16) = 0;
        id v10 = "authorization failed";
        id v11 = v9;
        uint32_t v12 = 2;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v16, v12);
LABEL_16:

        BOOL v13 = 1;
        goto LABEL_17;
      }
      if (([v8 isEqualToString:@"time-drift"] & 1) == 0)
      {
        if (qword_10032F3B8 != -1) {
          dispatch_once(&qword_10032F3B8, &stru_1002C9F40);
        }
        uint64_t v14 = qword_10032F3C0;
        if (!os_log_type_enabled((os_log_t)qword_10032F3C0, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        int v16 = 138412290;
        v17 = v8;
        id v10 = "unknown auth status %@";
        id v11 = v14;
        uint32_t v12 = 12;
        goto LABEL_15;
      }
    }
  }
  BOOL v13 = 0;
LABEL_17:

  return v13;
}

- (BOOL)needsTimeShift:(id)a3 metadata:(id)a4
{
  id v6 = a4;
  if (![(TransparencyLogClient *)self needsRetry:a3]) {
    goto LABEL_10;
  }
  v7 = [v6 objectForKeyedSubscript:@"x-auth-status"];
  unsigned __int8 v8 = v7;
  if (!v7 || ![v7 isEqualToString:@"time-drift"])
  {

LABEL_10:
    BOOL v10 = 0;
    goto LABEL_11;
  }
  if (qword_10032F3B8 != -1) {
    dispatch_once(&qword_10032F3B8, &stru_1002C9F60);
  }
  uint64_t v9 = qword_10032F3C0;
  if (os_log_type_enabled((os_log_t)qword_10032F3C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "authorization failed due to time drift", v12, 2u);
  }

  BOOL v10 = 1;
LABEL_11:

  return v10;
}

+ (double)timeShift:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"Date"];
  id v4 = objc_alloc_init((Class)NSDateFormatter);
  unsigned int v5 = +[NSLocale localeWithLocaleIdentifier:@"en_US"];
  [v4 setLocale:v5];

  [v4 setDateFormat:@"EE, dd MMM yyyy HH:mm:ss 'GMT'"];
  id v6 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
  [v4 setTimeZone:v6];

  v7 = [v4 dateFromString:v3];
  unsigned __int8 v8 = v7;
  if (v7)
  {
    [v7 timeIntervalSinceNow];
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (void)renewAccountTokenForFetch:(id)a3 allowEmptyData:(BOOL)a4 useReversePush:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10020A4D0;
  v17[3] = &unk_1002C9F88;
  id v11 = a6;
  id v19 = v11;
  v17[4] = self;
  id v12 = v10;
  id v18 = v12;
  BOOL v20 = a4;
  BOOL v21 = a5;
  BOOL v13 = objc_retainBlock(v17);
  id v16 = 0;
  LOBYTE(v10) = +[TransparencyAccount initiateCredentialRenewal:&v16 completionHandler:v13];
  id v14 = v16;
  if ((v10 & 1) == 0)
  {
    if (qword_10032F3B8 != -1) {
      dispatch_once(&qword_10032F3B8, &stru_1002C9FA8);
    }
    v15 = qword_10032F3C0;
    if (os_log_type_enabled((os_log_t)qword_10032F3C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to initiate credential renewal: %@", buf, 0xCu);
    }
    (*((void (**)(id, void, void, id))v11 + 2))(v11, 0, 0, v14);
  }
}

- (BOOL)fetch:(id)a3 shouldRetry:(BOOL)a4 allowEmptyData:(BOOL)a5 useReversePush:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a7;
  id v14 = [(TransparencyLogClient *)self session];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10020A660;
  v18[3] = &unk_1002C9FF8;
  BOOL v21 = a4;
  id v19 = v12;
  id v20 = v13;
  v18[4] = self;
  BOOL v22 = v9;
  char v23 = v8;
  id v15 = v12;
  id v16 = v13;
  LOBYTE(v8) = [v14 fetch:v15 allowEmptyData:v9 useReversePush:v8 completionHandler:v18];

  return v8;
}

- (BOOL)fetch:(id)a3 shouldRetry:(BOOL)a4 allowEmptyData:(BOOL)a5 completionHandler:(id)a6
{
  return [(TransparencyLogClient *)self fetch:a3 shouldRetry:a4 allowEmptyData:a5 useReversePush:0 completionHandler:a6];
}

- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 useReversePush:(BOOL)a5 completionHandler:(id)a6
{
  return [(TransparencyLogClient *)self fetch:a3 shouldRetry:1 allowEmptyData:a4 useReversePush:a5 completionHandler:a6];
}

- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 completionHandler:(id)a5
{
  return [(TransparencyLogClient *)self fetch:a3 allowEmptyData:a4 useReversePush:0 completionHandler:a5];
}

- (void)fetchRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TransparencyLogClient *)self session];
  BOOL v9 = [v8 auth];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10020AB94;
  v12[3] = &unk_1002CA048;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  [v10 createRequestForAuthentication:v9 completionHandler:v12];
}

- (void)deleteDownloadId:(id)a3
{
  id v4 = a3;
  if (qword_10032F3B8 != -1) {
    dispatch_once(&qword_10032F3B8, &stru_1002CA068);
  }
  unsigned int v5 = qword_10032F3C0;
  if (os_log_type_enabled((os_log_t)qword_10032F3C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "deleting downloadId %{public}@", buf, 0xCu);
  }
  id v6 = [(TransparencyLogClient *)self dataStore];
  id v10 = 0;
  unsigned __int8 v7 = [v6 deleteDownloadRecordById:v4 error:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0)
  {
    if (qword_10032F3B8 != -1) {
      dispatch_once(&qword_10032F3B8, &stru_1002CA088);
    }
    BOOL v9 = qword_10032F3C0;
    if (os_log_type_enabled((os_log_t)qword_10032F3C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "failed to delete downloadId %{public}@: %@", buf, 0x16u);
    }
  }
}

- (TransparencyLogSession)session
{
  return (TransparencyLogSession *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSession:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataStore:(id)a3
{
}

- (TransparencyAnalytics)transparencyAnalytics
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTransparencyAnalytics:(id)a3
{
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSettings:(id)a3
{
}

- (TransparencyIDSConfigBag)idsConfigBag
{
  return (TransparencyIDSConfigBag *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIdsConfigBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsConfigBag, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_transparencyAnalytics, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end