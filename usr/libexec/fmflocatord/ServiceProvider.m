@interface ServiceProvider
- (Account)account;
- (NSString)serviceName;
- (id)didDeactivateToken;
- (id)didUpdateToken;
- (void)_teardown;
- (void)accountDeactivated;
- (void)setAccount:(id)a3;
- (void)setDidDeactivateToken:(id)a3;
- (void)setDidUpdateToken:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation ServiceProvider

- (void)start
{
  v3 = +[NSNotificationCenter defaultCenter];
  v4 = sub_10001B6D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [(ServiceProvider *)self fm_logID];
    v6 = [(ServiceProvider *)self account];
    v7 = [v6 uniqueId];
    *(_DWORD *)buf = 138412546;
    v17 = v5;
    __int16 v18 = 2112;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ Starting service provider for account %@", buf, 0x16u);
  }
  v8 = [(ServiceProvider *)self account];

  if (v8)
  {
    v9 = +[NSOperationQueue mainQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100005A44;
    v15[3] = &unk_100059328;
    v15[4] = self;
    v10 = [v3 addObserverForName:@"AccountDidDeactivateNotificationKey" object:0 queue:v9 usingBlock:v15];
    [(ServiceProvider *)self setDidDeactivateToken:v10];

    v11 = +[NSOperationQueue mainQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100005AD4;
    v14[3] = &unk_100059328;
    v14[4] = self;
    v12 = [v3 addObserverForName:@"AccountDidUpdateNotification" object:0 queue:v11 usingBlock:v14];
    [(ServiceProvider *)self setDidUpdateToken:v12];
  }
  else
  {
    v13 = sub_10001B6D4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100036B04(self, v13);
    }
  }
}

- (void)stop
{
}

- (NSString)serviceName
{
  return (NSString *)@"generic";
}

- (void)accountDeactivated
{
}

- (void)_teardown
{
  id v7 = +[NSNotificationCenter defaultCenter];
  v3 = [(ServiceProvider *)self didDeactivateToken];

  if (v3)
  {
    v4 = [(ServiceProvider *)self didDeactivateToken];
    [v7 removeObserver:v4];

    [(ServiceProvider *)self setDidDeactivateToken:0];
  }
  v5 = [(ServiceProvider *)self didUpdateToken];

  if (v5)
  {
    v6 = [(ServiceProvider *)self didUpdateToken];
    [v7 removeObserver:v6];

    [(ServiceProvider *)self setDidUpdateToken:0];
  }
  [(ServiceProvider *)self deinitializeProvider];
}

- (Account)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (id)didDeactivateToken
{
  return self->_didDeactivateToken;
}

- (void)setDidDeactivateToken:(id)a3
{
}

- (id)didUpdateToken
{
  return self->_didUpdateToken;
}

- (void)setDidUpdateToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didUpdateToken, 0);
  objc_storeStrong(&self->_didDeactivateToken, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end