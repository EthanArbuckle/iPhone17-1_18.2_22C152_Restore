@interface IMUbiquityQuotaFetcher
- (IMUbiquityQuotaFetcher)init;
- (NSMapTable)operationToWatchdogTimerMap;
- (NSOperationQueue)quotaFetchingOperationsQueue;
- (double)cloudServerResponseTimeout;
- (unint64_t)lastCachedFreeBytes;
- (void)fetchUserQuotaWithCompletion:(id)a3;
- (void)fetchUserQuotaWithTimeOut:(double)a3 completion:(id)a4;
- (void)setLastCachedFreeBytes:(unint64_t)a3;
- (void)setOperationToWatchdogTimerMap:(id)a3;
- (void)setQuotaFetchingOperationsQueue:(id)a3;
@end

@implementation IMUbiquityQuotaFetcher

- (IMUbiquityQuotaFetcher)init
{
  v8.receiver = self;
  v8.super_class = (Class)IMUbiquityQuotaFetcher;
  v2 = [(IMUbiquityQuotaFetcher *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    quotaFetchingOperationsQueue = v2->_quotaFetchingOperationsQueue;
    v2->_quotaFetchingOperationsQueue = (NSOperationQueue *)v3;

    [(NSOperationQueue *)v2->_quotaFetchingOperationsQueue setQualityOfService:17];
    uint64_t v5 = +[NSMapTable mapTableWithKeyOptions:5 valueOptions:512];
    operationToWatchdogTimerMap = v2->_operationToWatchdogTimerMap;
    v2->_operationToWatchdogTimerMap = (NSMapTable *)v5;
  }
  return v2;
}

- (double)cloudServerResponseTimeout
{
  return 60.0;
}

- (void)fetchUserQuotaWithCompletion:(id)a3
{
  id v4 = a3;
  [(IMUbiquityQuotaFetcher *)self cloudServerResponseTimeout];
  -[IMUbiquityQuotaFetcher fetchUserQuotaWithTimeOut:completion:](self, "fetchUserQuotaWithTimeOut:completion:", v4);
}

- (void)fetchUserQuotaWithTimeOut:(double)a3 completion:(id)a4
{
  id v6 = a4;
  if (+[BCSyncUserDefaults isSignedIntoICloud]
    && +[BCSyncUserDefaults isICloudDriveEnabledForBooks])
  {
    v7 = [(IMUbiquityQuotaFetcher *)self quotaFetchingOperationsQueue];

    if (!v7) {
      BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/BCUbiquityQuotaFetcher.m", 71, (uint64_t)"-[IMUbiquityQuotaFetcher fetchUserQuotaWithTimeOut:completion:]", (uint64_t)"self.quotaFetchingOperationsQueue", 0, v8, v9, v10, (uint64_t)v21);
    }
    v11 = (void (**)(void, void, void))objc_opt_new();
    objc_initWeak(location, v11);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_898AC;
    v26[3] = &unk_2C73F8;
    objc_copyWeak(&v28, location);
    v26[4] = self;
    id v27 = v6;
    [v11 setFetchQuotaCompletionBlock:v26];
    v12 = dispatch_get_global_queue(0, 0);
    v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v12);

    if (v13)
    {
      v14 = [(IMUbiquityQuotaFetcher *)self operationToWatchdogTimerMap];
      [v14 setObject:v13 forKey:v11];

      dispatch_time_t v15 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      dispatch_source_set_timer(v13, v15, 0xFFFFFFFFFFFFFFFFLL, 0);
      v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      v23 = sub_89C28;
      v24 = &unk_2C3C50;
      id v16 = v11;
      id v25 = v16;
      dispatch_source_set_event_handler(v13, &v21);
      dispatch_resume(v13);
      v17 = [(IMUbiquityQuotaFetcher *)self quotaFetchingOperationsQueue];
      [v17 addOperation:v16];
    }
    objc_destroyWeak(&v28);
    objc_destroyWeak(location);
  }
  else
  {
    v18 = BCQuotaFetcherLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&def_7D91C, v18, OS_LOG_TYPE_INFO, "Not fetching quota. Background or offline.", (uint8_t *)location, 2u);
    }

    v11 = (void (**)(void, void, void))objc_retainBlock(v6);
    if (v11)
    {
      unint64_t v19 = [(IMUbiquityQuotaFetcher *)self lastCachedFreeBytes];
      v20 = +[NSError errorWithDomain:@"IMUbiquityQuotaFetcherErrorDomain" code:-1000 userInfo:0];
      ((void (**)(void, unint64_t, void *))v11)[2](v11, v19, v20);
    }
  }
}

- (unint64_t)lastCachedFreeBytes
{
  return self->_lastCachedFreeBytes;
}

- (void)setLastCachedFreeBytes:(unint64_t)a3
{
  self->_lastCachedFreeBytes = a3;
}

- (NSOperationQueue)quotaFetchingOperationsQueue
{
  return self->_quotaFetchingOperationsQueue;
}

- (void)setQuotaFetchingOperationsQueue:(id)a3
{
}

- (NSMapTable)operationToWatchdogTimerMap
{
  return self->_operationToWatchdogTimerMap;
}

- (void)setOperationToWatchdogTimerMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationToWatchdogTimerMap, 0);

  objc_storeStrong((id *)&self->_quotaFetchingOperationsQueue, 0);
}

@end