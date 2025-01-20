@interface AnswerCallIntentHandler
- (AnswerCallIntentHandler)init;
- (AnswerCallIntentHandler)initWithDataSource:(id)a3;
- (AnswerCallIntentHandlerDataSource)dataSource;
- (OS_dispatch_queue)queue;
- (TUCallCenter)callCenter;
- (void)handleAnswerCall:(id)a3 completion:(id)a4;
- (void)setCallCenter:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation AnswerCallIntentHandler

- (AnswerCallIntentHandler)init
{
  v3 = objc_alloc_init(AnswerCallIntentHandlerDefaultDataSource);
  v4 = [(AnswerCallIntentHandler *)self initWithDataSource:v3];

  return v4;
}

- (AnswerCallIntentHandler)initWithDataSource:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AnswerCallIntentHandler;
  v6 = [(AnswerCallIntentHandler *)&v14 init];
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

- (void)handleAnswerCall:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received Siri request to answer incoming call: %@", buf, 0xCu);
  }

  dispatch_queue_t v9 = [(AnswerCallIntentHandler *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025D8C;
  block[3] = &unk_10004CE70;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v9, block);
}

- (AnswerCallIntentHandlerDataSource)dataSource
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