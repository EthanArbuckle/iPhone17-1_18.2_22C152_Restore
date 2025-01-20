@interface W5PeerGenericRequestListener
- (BOOL)handleClientRequest:(id)a3;
- (Class)requestPayloadClass;
- (NSString)identifier;
- (id)requestHandler;
- (void)invalidate;
- (void)setIdentifier:(id)a3;
- (void)setRequestHandler:(id)a3;
@end

@implementation W5PeerGenericRequestListener

- (BOOL)handleClientRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 payload];
  if (v5)
  {
    v6 = sub_10009756C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v5 info];
      [v4 options];
      int v15 = 136316162;
      v16 = "-[W5PeerGenericRequestListener handleClientRequest:]";
      __int16 v17 = 2080;
      v18 = "W5PeerGenericRequestListener.m";
      __int16 v19 = 1024;
      int v20 = 21;
      __int16 v21 = 2114;
      v22 = v7;
      __int16 v23 = 2114;
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();
    }
    v8 = [(W5PeerGenericRequestListener *)self requestHandler];

    if (v8)
    {
      v9 = [(W5PeerGenericRequestListener *)self requestHandler];
      v10 = [v5 info];
      v11 = [v4 options];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100093900;
      v13[3] = &unk_1000DF560;
      id v14 = v4;
      ((void (**)(void, void *, void *, void *))v9)[2](v9, v10, v11, v13);
    }
  }

  return 1;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class();
}

- (void)invalidate
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (id)requestHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setRequestHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestHandler, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end