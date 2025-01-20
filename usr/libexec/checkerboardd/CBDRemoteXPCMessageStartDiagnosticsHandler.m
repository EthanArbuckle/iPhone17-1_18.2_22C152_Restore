@interface CBDRemoteXPCMessageStartDiagnosticsHandler
- (CBDRemoteXPCMessageStartDiagnosticsHandler)initWithProxyReceiver:(id)a3;
- (CBDStartDiagnosticsReceiver)startDiagnosticsReceiver;
- (id)expectedRemoteMessageClasses;
- (void)handleRemoteMessage:(id)a3 completion:(id)a4;
- (void)setStartDiagnosticsReceiver:(id)a3;
@end

@implementation CBDRemoteXPCMessageStartDiagnosticsHandler

- (CBDRemoteXPCMessageStartDiagnosticsHandler)initWithProxyReceiver:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CBDRemoteXPCMessageStartDiagnosticsHandler;
  v5 = [(CBDRemoteXPCMessageStartDiagnosticsHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_startDiagnosticsReceiver, v4);
  }

  return v6;
}

- (id)expectedRemoteMessageClasses
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

- (void)handleRemoteMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    v9 = [(CBDRemoteXPCMessageStartDiagnosticsHandler *)self startDiagnosticsReceiver];

    v10 = CheckerBoardLogHandleForCategory();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Start session for message %@", buf, 0xCu);
      }

      v12 = [(CBDRemoteXPCMessageStartDiagnosticsHandler *)self startDiagnosticsReceiver];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000A9A0;
      v17[3] = &unk_100010530;
      id v19 = v7;
      id v18 = v8;
      [v12 startDiagnosticsWithCompletion:v17];

      v13 = v19;
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Missing proxy receiver for message %@", buf, 0xCu);
      }

      v16 = +[NSError errorWithDomain:@"com.apple.checkerboardd.remoteXPCMessageDomain" code:3 userInfo:0];
      v13 = [v8 replyWithSuccess:0 error:v16];

      (*((void (**)(id, void *))v7 + 2))(v7, v13);
    }
  }
  else
  {
    v14 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Expect to handle a start session message, but received %@ instead.", buf, 0xCu);
    }

    v15 = +[NSError errorWithDomain:@"com.apple.checkerboardd.remoteXPCMessageDomain" code:1 userInfo:0];
    id v8 = [v6 replyWithSuccess:0 error:v15];

    (*((void (**)(id, id))v7 + 2))(v7, v8);
  }
}

- (CBDStartDiagnosticsReceiver)startDiagnosticsReceiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_startDiagnosticsReceiver);

  return (CBDStartDiagnosticsReceiver *)WeakRetained;
}

- (void)setStartDiagnosticsReceiver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end