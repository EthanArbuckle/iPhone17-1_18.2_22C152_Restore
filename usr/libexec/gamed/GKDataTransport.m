@interface GKDataTransport
+ (GKDataTransport)transportWithBag:(id)a3 clientProxy:(id)a4 credential:(id)a5;
- (GKActivity)activity;
- (GKClientProxy)clientProxy;
- (GKDataTransport)initWithBag:(id)a3 clientProxy:(id)a4 credential:(id)a5;
- (GKPlayerCredential)credential;
- (GKStoreBag)storeBag;
- (id)errorForBagError:(id)a3 serverError:(id)a4;
- (id)language;
- (void)postRequest:(id)a3 forBagKey:(id)a4 response:(id)a5;
- (void)postRequest:(id)a3 forBagKey:(id)a4 result:(id)a5;
- (void)setActivity:(id)a3;
- (void)setClientProxy:(id)a3;
- (void)setCredential:(id)a3;
- (void)setStoreBag:(id)a3;
@end

@implementation GKDataTransport

+ (GKDataTransport)transportWithBag:(id)a3 clientProxy:(id)a4 credential:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[GKDataTransport alloc] initWithBag:v9 clientProxy:v8 credential:v7];

  return v10;
}

- (GKDataTransport)initWithBag:(id)a3 clientProxy:(id)a4 credential:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers();
  }
  v13 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GKDataTransport: initWithBag:", buf, 2u);
  }
  v21.receiver = self;
  v21.super_class = (Class)GKDataTransport;
  v14 = [(GKDataTransport *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_storeBag, a3);
    objc_storeStrong((id *)&v15->_clientProxy, a4);
    objc_storeStrong((id *)&v15->_credential, a5);
    v16 = [v10 bundleIdentifier];
    v17 = +[NSString stringWithFormat:@"GKDataTransport - %@", v16];
    uint64_t v18 = +[GKActivity named:v17];
    activity = v15->_activity;
    v15->_activity = (GKActivity *)v18;
  }
  return v15;
}

- (GKPlayerCredential)credential
{
  return self->_credential;
}

- (id)errorForBagError:(id)a3 serverError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    id v8 = [v6 userInfo];
    id v9 = [v8 mutableCopy];

    [v9 setObject:v5 forKeyedSubscript:NSUnderlyingErrorKey];
    id v10 = [v7 domain];
    id v11 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, [v7 code], v9);

    goto LABEL_9;
  }
  if (v6)
  {
    id v12 = v6;
LABEL_8:
    id v11 = v12;
    goto LABEL_9;
  }
  if (v5)
  {
    id v12 = v5;
    goto LABEL_8;
  }
  id v11 = 0;
LABEL_9:

  return v11;
}

- (void)postRequest:(id)a3 forBagKey:(id)a4 response:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(GKDataTransport *)self activity];
  id v12 = +[NSString stringWithFormat:@"postRequest method:%@ bagKey:%@", @"default", v9];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000DB6C4;
  v16[3] = &unk_1002D39F8;
  v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  [v11 childNamed:v12 execute:v16];
}

- (void)postRequest:(id)a3 forBagKey:(id)a4 result:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(GKDataTransport *)self activity];
  id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKDataTransport.m", 94, "-[GKDataTransport postRequest:forBagKey:result:]");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000DBAD8;
  v16[3] = &unk_1002D39F8;
  v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  [v11 childNamed:v12 execute:v16];
}

- (id)language
{
  return [(GKClientProxy *)self->_clientProxy language];
}

- (GKStoreBag)storeBag
{
  return self->_storeBag;
}

- (void)setStoreBag:(id)a3
{
}

- (GKClientProxy)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
}

- (void)setCredential:(id)a3
{
}

- (GKActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);

  objc_storeStrong((id *)&self->_storeBag, 0);
}

@end