@interface CBDRemoteXPCMessageSetupHandler
- (CBDProxyReceiver)proxyReceiver;
- (CBDRemoteXPCMessageSetupHandler)initWithProxyReceiver:(id)a3;
- (id)expectedRemoteMessageClasses;
- (void)handleRemoteMessage:(id)a3 completion:(id)a4;
- (void)setProxyReceiver:(id)a3;
@end

@implementation CBDRemoteXPCMessageSetupHandler

- (CBDRemoteXPCMessageSetupHandler)initWithProxyReceiver:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CBDRemoteXPCMessageSetupHandler;
  v5 = [(CBDRemoteXPCMessageSetupHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_proxyReceiver, v4);
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
    uint64_t v9 = [v8 server];
    if (v9
      && (v10 = (void *)v9,
          [v8 port],
          v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11))
    {
      v12 = [(CBDRemoteXPCMessageSetupHandler *)self proxyReceiver];

      if (v12)
      {
        id v13 = objc_alloc((Class)CBSProxyServer);
        v14 = [v8 server];
        v15 = [v8 port];
        v16 = [v8 token];
        id v17 = [v13 initWithServer:v14 port:v15 token:v16];

        v18 = CheckerBoardLogHandleForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v30 = v8;
          __int16 v31 = 2112;
          id v32 = v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Start setting proxy server info for message %@. proxyServer = %@", buf, 0x16u);
        }

        v19 = [(CBDRemoteXPCMessageSetupHandler *)self proxyReceiver];
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100008ADC;
        v26[3] = &unk_100010530;
        id v28 = v7;
        id v27 = v8;
        [v19 setProxyServer:v17 completion:v26];

        goto LABEL_15;
      }
      v25 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v8;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Missing proxy receiver for message %@", buf, 0xCu);
      }

      uint64_t v23 = 3;
    }
    else
    {
      v22 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v8;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Missing server info for message %@.", buf, 0xCu);
      }

      uint64_t v23 = 4;
    }
    v24 = +[NSError errorWithDomain:@"com.apple.checkerboardd.remoteXPCMessageDomain" code:v23 userInfo:0];
    id v17 = [v8 replyWithSuccess:0 error:v24];

    (*((void (**)(id, id))v7 + 2))(v7, v17);
LABEL_15:

    goto LABEL_16;
  }
  v20 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Expect to handle a setup message, but received %@ instead.", buf, 0xCu);
  }

  v21 = +[NSError errorWithDomain:@"com.apple.checkerboardd.remoteXPCMessageDomain" code:1 userInfo:0];
  id v8 = [v6 replyWithSuccess:0 error:v21];

  (*((void (**)(id, id))v7 + 2))(v7, v8);
LABEL_16:
}

- (CBDProxyReceiver)proxyReceiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyReceiver);

  return (CBDProxyReceiver *)WeakRetained;
}

- (void)setProxyReceiver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end