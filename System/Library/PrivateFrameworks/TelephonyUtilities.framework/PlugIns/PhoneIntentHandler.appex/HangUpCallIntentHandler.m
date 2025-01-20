@interface HangUpCallIntentHandler
- (HangUpCallIntentHandler)init;
- (TUCallCenter)callCenter;
- (void)confirmHangUpCall:(id)a3 completion:(id)a4;
- (void)handleHangUpCall:(id)a3 completion:(id)a4;
- (void)setCallCenter:(id)a3;
@end

@implementation HangUpCallIntentHandler

- (HangUpCallIntentHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)HangUpCallIntentHandler;
  v2 = [(HangUpCallIntentHandler *)&v8 init];
  if (v2)
  {
    id v3 = +[NSString stringWithFormat:@"com.apple.TelephonyUtilities.PhoneIntentHandler.%@", objc_opt_class()];
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);

    uint64_t v5 = +[TUCallCenter callCenterWithQueue:v4];
    callCenter = v2->_callCenter;
    v2->_callCenter = (TUCallCenter *)v5;
  }
  return v2;
}

- (void)confirmHangUpCall:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Confirming Siri request to hang up: %@", buf, 0xCu);
  }

  v9 = [(HangUpCallIntentHandler *)self callCenter];
  v10 = [v9 queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000246AC;
  v12[3] = &unk_10004CF60;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  dispatch_sync(v10, v12);
}

- (void)handleHangUpCall:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling Siri request to hang up: %@", buf, 0xCu);
  }

  v9 = [(HangUpCallIntentHandler *)self callCenter];
  v10 = [v9 queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000248F0;
  v12[3] = &unk_10004CF60;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  dispatch_sync(v10, v12);
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void)setCallCenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end