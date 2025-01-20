@interface IdentifyIncomingCallerIntentHandler
- (IdentifyIncomingCallerIntentHandler)init;
- (IdentifyIncomingCallerIntentHandler)initWithDataSource:(id)a3;
- (IdentifyIncomingCallerIntentHandlerDataSource)dataSource;
- (OS_dispatch_queue)queue;
- (TUCallCenter)callCenter;
- (int64_t)preferredCallProviderFor:(id)a3;
- (void)handleIdentifyIncomingCaller:(id)a3 completion:(id)a4;
- (void)setCallCenter:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation IdentifyIncomingCallerIntentHandler

- (IdentifyIncomingCallerIntentHandler)init
{
  v3 = objc_alloc_init(IdentifyIncomingCallerIntentHandlerDefaultDataSource);
  v4 = [(IdentifyIncomingCallerIntentHandler *)self initWithDataSource:v3];

  return v4;
}

- (IdentifyIncomingCallerIntentHandler)initWithDataSource:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IdentifyIncomingCallerIntentHandler;
  v6 = [(IdentifyIncomingCallerIntentHandler *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    id v8 = +[NSString stringWithFormat:@"com.apple.TelephonyUtilities.PhoneIntentHandler.%@", objc_opt_class()];
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = +[TUCallCenter callCenterWithQueue:v7->_queue];
    callCenter = v7->_callCenter;
    v7->_callCenter = (TUCallCenter *)v11;
  }
  return v7;
}

- (void)handleIdentifyIncomingCaller:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received Siri request to identify incoming caller: %@", buf, 0xCu);
  }

  dispatch_queue_t v9 = [(IdentifyIncomingCallerIntentHandler *)self queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000F710;
  v11[3] = &unk_10004CF60;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_sync(v9, v11);
}

- (int64_t)preferredCallProviderFor:(id)a3
{
  id v3 = a3;
  if ([v3 isTelephonyProvider])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isFaceTimeProvider])
  {
    int64_t v4 = 2;
  }
  else
  {
    id v5 = [v3 identifier];
    id v6 = [v5 length];

    if (v6) {
      int64_t v4 = 3;
    }
    else {
      int64_t v4 = 0;
    }
  }

  return v4;
}

- (IdentifyIncomingCallerIntentHandlerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void)setCallCenter:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end