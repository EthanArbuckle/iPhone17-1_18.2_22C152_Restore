@interface APMescalSigningService
+ (APMescalSigningService)service;
+ (id)initializeMescalProvider:(BOOL)a3 interval:(unint64_t)a4;
+ (void)createServiceWithAMSProvider:(BOOL)a3;
+ (void)removeService;
- (APBackoffTimer)backoffTimer;
- (APMescalSigningProviderProtocol)provider;
- (APMescalSigningService)initWithAMSProvider:(BOOL)a3;
- (APUnfairLock)stateLock;
- (APUnfairLock)syncRequestsLock;
- (BOOL)signatureIsValid:(id)a3 data:(id)a4 error:(id *)a5;
- (NSHashTable)mescalStateDelegates;
- (NSMutableData)certificateData;
- (NSMutableDictionary)requestsWhileInitializing;
- (OS_dispatch_queue)setupQueue;
- (double)setupStartTime;
- (id)_checkErrorState;
- (id)rawSignatureForData:(id)a3 error:(id *)a4;
- (id)signatureForData:(id)a3 error:(id *)a4;
- (int64_t)state;
- (unint64_t)intervalId;
- (void)_handleStateChange:(int64_t)a3;
- (void)backoffTimerFired;
- (void)mescalStateChanged:(int64_t)a3;
- (void)queueRawSignatureRequest:(id)a3 waitTime:(double)a4 completion:(id)a5;
- (void)queueSignatureRequest:(id)a3 waitTime:(double)a4 completion:(id)a5;
- (void)rawSignatureForData:(id)a3 waitTime:(double)a4 completion:(id)a5;
- (void)registerStateChangeDelegate:(id)a3;
- (void)retrySetup;
- (void)setBackoffTimer:(id)a3;
- (void)setCertificateData:(id)a3;
- (void)setMescalStateDelegates:(id)a3;
- (void)setProvider:(id)a3;
- (void)setRequestsWhileInitializing:(id)a3;
- (void)setSetupQueue:(id)a3;
- (void)setSetupStartTime:(double)a3;
- (void)setState:(int64_t)a3;
- (void)signatureForData:(id)a3 waitTime:(double)a4 completion:(id)a5;
- (void)start;
@end

@implementation APMescalSigningService

+ (APMescalSigningService)service
{
  return (APMescalSigningService *)(id)qword_100289B38;
}

+ (void)createServiceWithAMSProvider:(BOOL)a3
{
  qword_100289B38 = [[APMescalSigningService alloc] initWithAMSProvider:a3];

  _objc_release_x1();
}

+ (void)removeService
{
  v2 = (void *)qword_100289B38;
  qword_100289B38 = 0;
}

+ (id)initializeMescalProvider:(BOOL)a3 interval:(unint64_t)a4
{
  BOOL v5 = a3;
  if (+[APSystemInternal isAppleInternalInstall])
  {
    id v6 = objc_alloc((Class)NSUserDefaults);
    id v7 = [v6 initWithSuiteName:APDefaultsBundleID];
    v8 = [v7 stringForKey:@"MescalProvider"];
    v9 = v8;
    if (v8)
    {
      if ([v8 isEqualToString:@"AMS"])
      {
        v10 = APLogForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 138477827;
          id v23 = (id)objc_opt_class();
          id v11 = v23;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{private}@ Using AMSMescal due to User Defaults.", (uint8_t *)&v22, 0xCu);
        }
        v12 = objc_alloc_init(APAMSMescalSigningService);
LABEL_11:
        v15 = v12;

        goto LABEL_21;
      }
      if ([v9 isEqualToString:@"AP"])
      {
        v13 = APLogForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 138477827;
          id v23 = (id)objc_opt_class();
          id v14 = v23;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{private}@ Using FairPlay due to User Defaults.", (uint8_t *)&v22, 0xCu);
        }
        v12 = [[APAPMescalSigningService alloc] initWithInterval:a4];
        goto LABEL_11;
      }
    }
  }
  v16 = APLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_opt_class();
    CFStringRef v18 = @"FairPlay";
    if (v5) {
      CFStringRef v18 = @"AMSMescal";
    }
    int v22 = 138478083;
    id v23 = v17;
    __int16 v24 = 2114;
    CFStringRef v25 = v18;
    id v19 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{private}@: Using bag determined %{public}@ provider.", (uint8_t *)&v22, 0x16u);
  }
  if (v5) {
    v20 = objc_alloc_init(APAMSMescalSigningService);
  }
  else {
    v20 = [[APAPMescalSigningService alloc] initWithInterval:a4];
  }
  v15 = v20;
LABEL_21:

  return v15;
}

- (APMescalSigningService)initWithAMSProvider:(BOOL)a3
{
  BOOL v3 = a3;
  v22.receiver = self;
  v22.super_class = (Class)APMescalSigningService;
  v4 = [(APMescalSigningService *)&v22 init];
  if (v4)
  {
    BOOL v5 = APPerfLogForCategory();
    v4->_os_signpost_id_t intervalId = os_signpost_id_generate(v5);

    id v6 = APPerfLogForCategory();
    id v7 = v6;
    os_signpost_id_t intervalId = v4->_intervalId;
    if (intervalId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 67240192;
      BOOL v24 = v3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, intervalId, "Setup Signing Service", "service=%{public, name=service}d", buf, 8u);
    }

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    requestsWhileInitializing = v4->_requestsWhileInitializing;
    v4->_requestsWhileInitializing = v9;

    id v11 = (APUnfairLock *)[objc_alloc((Class)APUnfairLock) initWithOptions:1];
    syncRequestsLock = v4->_syncRequestsLock;
    v4->_syncRequestsLock = v11;

    v13 = (APUnfairLock *)[objc_alloc((Class)APUnfairLock) initWithOptions:1];
    stateLock = v4->_stateLock;
    v4->_stateLock = v13;

    v4->_state = 0;
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.ap.mescalsigning", 0);
    setupQueue = v4->_setupQueue;
    v4->_setupQueue = (OS_dispatch_queue *)v15;

    v17 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:5 capacity:2];
    mescalStateDelegates = v4->_mescalStateDelegates;
    v4->_mescalStateDelegates = v17;

    [(APMescalSigningService *)v4 setSetupStartTime:CFAbsoluteTimeGetCurrent()];
    uint64_t v19 = [(id)objc_opt_class() initializeMescalProvider:v3 interval:v4->_intervalId];
    provider = v4->_provider;
    v4->_provider = (APMescalSigningProviderProtocol *)v19;

    [(APMescalSigningProviderProtocol *)v4->_provider setDelegate:v4];
    [(APMescalSigningService *)v4 start];
  }
  return v4;
}

- (void)mescalStateChanged:(int64_t)a3
{
  [(APMescalSigningService *)self setState:a3];
  if ((id)[(APMescalSigningService *)self state] == (id)3)
  {
    [(APMescalSigningService *)self retrySetup];
  }
  else if ((id)[(APMescalSigningService *)self state] == (id)2)
  {
    v4 = APLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double Current = CFAbsoluteTimeGetCurrent();
      [(APMescalSigningService *)self setupStartTime];
      *(_DWORD *)buf = 136643075;
      id v23 = "-[APMescalSigningService mescalStateChanged:]";
      __int16 v24 = 2048;
      double v25 = Current - v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{sensitive}s]: Request signing negotiation complete; signing and verification now available. Setup took %0.2lfs",
        buf,
        0x16u);
    }

    id v7 = [(APMescalSigningService *)self syncRequestsLock];
    [v7 lock];
    v8 = [(APMescalSigningService *)self requestsWhileInitializing];
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    [(APMescalSigningService *)self setRequestsWhileInitializing:v9];

    [v7 unlock];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v10 = [v8 allValues];
    id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          dispatch_queue_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v16 = [(APMescalSigningService *)self setupQueue];
          dispatch_async(v16, v15);
        }
        id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }
}

- (void)start
{
  BOOL v3 = [(APMescalSigningService *)self setupQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010F974;
  block[3] = &unk_100233D50;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)registerStateChangeDelegate:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v4 = self;
    objc_sync_enter(v4);
    BOOL v5 = [(APMescalSigningService *)v4 mescalStateDelegates];
    [v5 addObject:v6];

    [v6 mescalStateChanged:-[APMescalSigningService state](v4, "state")];
    objc_sync_exit(v4);
  }
}

- (int64_t)state
{
  BOOL v3 = [(APMescalSigningService *)self stateLock];
  [v3 lock];
  int64_t state = self->_state;
  [v3 unlock];

  return state;
}

- (void)setState:(int64_t)a3
{
  BOOL v5 = [(APMescalSigningService *)self stateLock];
  [v5 lock];
  int64_t state = self->_state;
  self->_int64_t state = a3;
  id v7 = APPerfLogForCategory();
  unint64_t v8 = [(APMescalSigningService *)self intervalId];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 134349056;
      int64_t v13 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, v9, "Service State", "Service State state=%{public, name=state}ld", buf, 0xCu);
    }
  }

  [v5 unlock];
  if (state != a3)
  {
    v10 = [(APMescalSigningService *)self setupQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10010FC44;
    v11[3] = &unk_100236330;
    v11[4] = self;
    v11[5] = a3;
    dispatch_async(v10, v11);
  }
}

- (void)_handleStateChange:(int64_t)a3
{
  BOOL v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [&off_10024B628 objectAtIndexedSubscript:a3];
    *(_DWORD *)buf = 138543362;
    v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Mescal signing state set to %{public}@.", buf, 0xCu);
  }
  id v7 = self;
  objc_sync_enter(v7);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unint64_t v8 = [(APMescalSigningService *)v7 mescalStateDelegates];
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (v12) {
          [v12 mescalStateChanged:a3];
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v9);
  }

  switch(a3)
  {
    case 4:
      goto LABEL_15;
    case 3:
      [(APMescalSigningService *)v7 retrySetup];
      if (qword_100289B40 != -1) {
        dispatch_once(&qword_100289B40, &stru_100236350);
      }
      long long v20 = APPerfLogForCategory();
      v21 = [(APMescalSigningService *)v7 intervalId];
      if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v21, "Setup Signing Service", "", buf, 2u);
      }
      goto LABEL_29;
    case 2:
LABEL_15:
      int64_t v13 = [(APMescalSigningService *)v7 backoffTimer];
      BOOL v14 = v13 == 0;

      if (!v14)
      {
        dispatch_queue_t v15 = [(APMescalSigningService *)v7 backoffTimer];
        [v15 reset];

        [(APMescalSigningService *)v7 setBackoffTimer:0];
      }
      v16 = APPerfLogForCategory();
      long long v17 = [(APMescalSigningService *)v7 intervalId];
      if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v17, "Setup Signing Service", "", buf, 2u);
      }

      if (a3 == 2)
      {
        CFStringRef v28 = @"finalStatus";
        v29 = &off_100249DA0;
        long long v18 = &v28;
        long long v19 = &v29;
      }
      else
      {
        CFStringRef v26 = @"finalStatus";
        v27 = &off_100249DB8;
        long long v18 = &v26;
        long long v19 = &v27;
      }
      long long v20 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:1];
      AnalyticsSendEvent();
LABEL_29:

      break;
  }
  objc_sync_exit(v7);
}

- (id)_checkErrorState
{
  if (+[APSystemInternal isAppleInternalInstall])
  {
    id v3 = objc_alloc((Class)NSUserDefaults);
    id v4 = [v3 initWithSuiteName:APDefaultsBundleID];
    BOOL v5 = [v4 objectForKey:@"MescalForceState"];

    if (v5)
    {
      id v6 = [v4 integerForKey:@"MescalForceState"];
      if ((unint64_t)v6 <= 4) {
        [(APMescalSigningService *)self setState:v6];
      }
    }
  }
  unint64_t v7 = [(APMescalSigningService *)self state];
  if (v7 <= 4 && ((0x1Bu >> v7) & 1) != 0)
  {
    uint64_t v9 = (uint64_t)*(&off_100236398 + v7);
    uint64_t v10 = qword_1001D7338[v7];
    CFStringRef v13 = @"reason";
    uint64_t v14 = v9;
    id v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    unint64_t v8 = +[NSError errorWithDomain:@"com.apple.ap.MescalSigning" code:v10 userInfo:v11];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)signatureIsValid:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v8 && v9)
  {
    id v11 = [(APMescalSigningService *)self _checkErrorState];
    id v12 = v11;
    if (a5) {
      *a5 = v11;
    }
    if (v12)
    {
      unsigned __int8 v13 = 0;
    }
    else
    {
      v16 = [(APMescalSigningService *)self provider];
      unsigned __int8 v13 = [v16 signatureIsValid:v8 data:v10 error:a5];
    }
  }
  else
  {
    if (a5)
    {
      CFStringRef v20 = @"reason";
      CFStringRef v21 = @"Signature and data must not be nil.";
      uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      *a5 = +[NSError errorWithDomain:@"com.apple.ap.MescalSigning" code:1100 userInfo:v14];
    }
    dispatch_queue_t v15 = APLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136642819;
      long long v19 = "-[APMescalSigningService signatureIsValid:data:error:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: signature and data must not be nil.", (uint8_t *)&v18, 0xCu);
    }

    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (id)signatureForData:(id)a3 error:(id *)a4
{
  id v4 = [(APMescalSigningService *)self rawSignatureForData:a3 error:a4];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = [v4 base64EncodedStringWithOptions:32];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)rawSignatureForData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    unint64_t v7 = [(APMescalSigningService *)self _checkErrorState];
    id v8 = v7;
    if (a4) {
      *a4 = v7;
    }
    if (v8)
    {
      id v9 = 0;
    }
    else
    {
      uint64_t v10 = [(APMescalSigningService *)self provider];
      id v9 = [v10 rawSignatureForData:v6 error:a4];

      id v11 = APLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        if (a4) {
          CFStringRef v12 = (const __CFString *)*a4;
        }
        else {
          CFStringRef v12 = @"(null)";
        }
        int v14 = 138740227;
        dispatch_queue_t v15 = v9;
        __int16 v16 = 2114;
        CFStringRef v17 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Returning signature %{sensitive}@ with error %{public}@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
  else
  {
    if (!a4)
    {
      id v9 = 0;
      goto LABEL_16;
    }
    CFStringRef v18 = @"reason";
    CFStringRef v19 = @"Passed in data was nil.";
    id v8 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    +[NSError errorWithDomain:@"com.apple.ap.MescalSigning" code:1100 userInfo:v8];
    id v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_16:

  return v9;
}

- (void)signatureForData:(id)a3 waitTime:(double)a4 completion:(id)a5
{
  id v8 = (void (**)(id, void *, id))a5;
  id v9 = a3;
  if ((id)[(APMescalSigningService *)self state] == (id)2)
  {
    id v11 = 0;
    uint64_t v10 = [(APMescalSigningService *)self signatureForData:v9 error:&v11];

    id v9 = v11;
    v8[2](v8, v10, v9);
  }
  else
  {
    [(APMescalSigningService *)self queueSignatureRequest:v9 waitTime:v8 completion:a4];
  }
}

- (void)rawSignatureForData:(id)a3 waitTime:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *, id))a5;
  if ((id)[(APMescalSigningService *)self state] == (id)2)
  {
    uint64_t v10 = [(APMescalSigningService *)self provider];
    id v13 = 0;
    id v11 = [v10 rawSignatureForData:v8 error:&v13];
    id v12 = v13;

    v9[2](v9, v11, v12);
  }
  else
  {
    [(APMescalSigningService *)self queueRawSignatureRequest:v8 waitTime:v9 completion:a4];
  }
}

- (void)queueRawSignatureRequest:(id)a3 waitTime:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = +[NSUUID UUID];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1001109CC;
  v27[3] = &unk_100233D18;
  v27[4] = self;
  id v11 = v8;
  id v28 = v11;
  id v12 = v9;
  id v29 = v12;
  id v13 = objc_retainBlock(v27);
  int v14 = [(APMescalSigningService *)self syncRequestsLock];
  [v14 lock];
  dispatch_queue_t v15 = [(APMescalSigningService *)self requestsWhileInitializing];
  __int16 v16 = objc_retainBlock(v13);
  [v15 setObject:v16 forKey:v10];

  [v14 unlock];
  objc_initWeak(&location, self);
  dispatch_time_t v17 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  CFStringRef v18 = [(APMescalSigningService *)self setupQueue];
  CFStringRef v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  long long v22 = sub_100110A54;
  long long v23 = &unk_100234B28;
  objc_copyWeak(&v25, &location);
  id v19 = v10;
  id v24 = v19;
  dispatch_after(v17, v18, &v20);

  [(APMescalSigningService *)self retrySetup];
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)queueSignatureRequest:(id)a3 waitTime:(double)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100110C00;
  v9[3] = &unk_100236378;
  id v10 = a5;
  id v8 = v10;
  [(APMescalSigningService *)self queueRawSignatureRequest:a3 waitTime:v9 completion:a4];
}

- (void)retrySetup
{
  if ((id)[(APMescalSigningService *)self state] == (id)1
    || (id)[(APMescalSigningService *)self state] == (id)2)
  {
    APLogForCategory();
    id v3 = (APMescalSigningService *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_ERROR))
    {
      int64_t state = self->_state;
      int v13 = 136643075;
      int v14 = "-[APMescalSigningService retrySetup]";
      __int16 v15 = 2048;
      int64_t v16 = state;
      _os_log_impl((void *)&_mh_execute_header, &v3->super, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Unexpected state %ld attempting to set up request signing.", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    if ((id)[(APMescalSigningService *)self state] != (id)3) {
      return;
    }
    id v3 = self;
    objc_sync_enter(v3);
    BOOL v5 = [(APMescalSigningService *)v3 backoffTimer];

    if (!v5)
    {
      id v6 = (APBackoffTimer *)[objc_alloc((Class)APBackoffTimer) initWithSchedule:&off_10024B640 name:@"APMescalSigningService"];
      backoffTimer = v3->_backoffTimer;
      v3->_backoffTimer = v6;

      id v8 = [(APMescalSigningService *)v3 backoffTimer];
      [v8 setDelegate:v3];
    }
    id v9 = [(APMescalSigningService *)v3 backoffTimer];
    id v10 = [(APMescalSigningService *)v3 setupQueue];
    unsigned __int8 v11 = [v9 scheduleNextLevelWithQueue:v10];

    if ((v11 & 1) == 0)
    {
      id v12 = APLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error: Couldn't schedule Backoff Timer for Mescal Signing Service.", (uint8_t *)&v13, 2u);
      }
    }
    objc_sync_exit(v3);
  }
}

- (void)backoffTimerFired
{
  id v3 = APPerfLogForCategory();
  unint64_t v4 = [(APMescalSigningService *)self intervalId];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Setup Signing Service", "", buf, 2u);
    }
  }

  id v6 = APLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempting request signing session recovery after previous failure.", buf, 2u);
  }

  [(APMescalSigningService *)self setState:1];
  [(APMescalSigningService *)self setSetupStartTime:CFAbsoluteTimeGetCurrent()];
  unint64_t v7 = [(APMescalSigningService *)self setupQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011101C;
  block[3] = &unk_100233D50;
  block[4] = self;
  dispatch_async(v7, block);
}

- (APMescalSigningProviderProtocol)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (double)setupStartTime
{
  return self->_setupStartTime;
}

- (void)setSetupStartTime:(double)a3
{
  self->_setupStartTime = a3;
}

- (NSMutableData)certificateData
{
  return self->_certificateData;
}

- (void)setCertificateData:(id)a3
{
}

- (NSMutableDictionary)requestsWhileInitializing
{
  return self->_requestsWhileInitializing;
}

- (void)setRequestsWhileInitializing:(id)a3
{
}

- (APUnfairLock)syncRequestsLock
{
  return self->_syncRequestsLock;
}

- (APUnfairLock)stateLock
{
  return self->_stateLock;
}

- (OS_dispatch_queue)setupQueue
{
  return self->_setupQueue;
}

- (void)setSetupQueue:(id)a3
{
}

- (NSHashTable)mescalStateDelegates
{
  return self->_mescalStateDelegates;
}

- (void)setMescalStateDelegates:(id)a3
{
}

- (APBackoffTimer)backoffTimer
{
  return self->_backoffTimer;
}

- (void)setBackoffTimer:(id)a3
{
}

- (unint64_t)intervalId
{
  return self->_intervalId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_mescalStateDelegates, 0);
  objc_storeStrong((id *)&self->_setupQueue, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_syncRequestsLock, 0);
  objc_storeStrong((id *)&self->_requestsWhileInitializing, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);

  objc_storeStrong((id *)&self->_provider, 0);
}

@end