@interface CHRemoteBasicRequestHandler
+ (BOOL)_hasIdleLifetimeElapsed:(double)a3 targetIdleLifetime:(double)a4;
+ (id)invalidInputErrorWithDescription:(id)a3 failureReason:(id)a4 recoverySuggestion:(id)a5 errorCode:(int64_t)a6;
- (CHPowerLogger)modelPowerLogger;
- (CHRemoteBasicRequestHandler)initWithServerQueue:(id)a3;
- (OS_dispatch_queue)serverQueue;
- (void)_stageEvictionOfResourceWithTargetLifetime:(double)a3 block:(id)a4;
- (void)setDirty;
- (void)setIdle;
@end

@implementation CHRemoteBasicRequestHandler

- (CHRemoteBasicRequestHandler)initWithServerQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHRemoteBasicRequestHandler;
  v6 = [(CHRemoteBasicRequestHandler *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serverQueue, a3);
    uint64_t v8 = objc_opt_new();
    modelPowerLogger = v7->_modelPowerLogger;
    v7->_modelPowerLogger = (CHPowerLogger *)v8;
  }
  return v7;
}

- (void)setDirty
{
  if (!self->_transaction)
  {
    self->_transaction = (OS_os_transaction *)os_transaction_create();
    _objc_release_x1();
  }
}

- (void)setIdle
{
  self->_transaction = 0;
  _objc_release_x1();
}

+ (BOOL)_hasIdleLifetimeElapsed:(double)a3 targetIdleLifetime:(double)a4
{
  +[NSDate timeIntervalSinceReferenceDate];
  return v6 - a3 > a4 + -1.0;
}

- (void)_stageEvictionOfResourceWithTargetLifetime:(double)a3 block:(id)a4
{
  id v6 = a4;
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  uint64_t v8 = [(CHRemoteBasicRequestHandler *)self serverQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A848;
  block[3] = &unk_100024B58;
  id v11 = v6;
  id v9 = v6;
  dispatch_after(v7, v8, block);
}

+ (id)invalidInputErrorWithDescription:(id)a3 failureReason:(id)a4 recoverySuggestion:(id)a5 errorCode:(int64_t)a6
{
  id v9 = (__CFString *)a3;
  v10 = (__CFString *)a4;
  id v11 = (__CFString *)a5;
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  v12 = (id)qword_10002B118;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413058;
    v26 = v9;
    __int16 v27 = 2112;
    v28 = v10;
    __int16 v29 = 2112;
    v30 = v11;
    __int16 v31 = 2048;
    int64_t v32 = a6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "invalidInputErrorWithDescription with description: %@, failureReason: %@, recoverySuggestion:%@, errorCode:%ld", buf, 0x2Au);
  }

  if (v9) {
    CFStringRef v13 = v9;
  }
  else {
    CFStringRef v13 = &stru_1000257A0;
  }
  NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
  NSErrorUserInfoKey v20 = NSLocalizedFailureReasonErrorKey;
  if (v10) {
    CFStringRef v14 = v10;
  }
  else {
    CFStringRef v14 = &stru_1000257A0;
  }
  CFStringRef v22 = v13;
  CFStringRef v23 = v14;
  NSErrorUserInfoKey v21 = NSLocalizedRecoverySuggestionErrorKey;
  if (v11) {
    CFStringRef v15 = v11;
  }
  else {
    CFStringRef v15 = &stru_1000257A0;
  }
  CFStringRef v24 = v15;
  v16 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v19 count:3];
  v17 = +[NSError errorWithDomain:@"com.apple.corehandwriting", a6, v16, v19, v20, v21, v22, v23 code userInfo];

  return v17;
}

- (OS_dispatch_queue)serverQueue
{
  return self->_serverQueue;
}

- (CHPowerLogger)modelPowerLogger
{
  return self->_modelPowerLogger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelPowerLogger, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end