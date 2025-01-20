@interface APSTokenWatcher
+ (id)sharedInstance;
- (APSConnection)devConnection;
- (APSConnection)prodConnection;
- (APSTokenWatcher)init;
- (NSArray)tokenList;
- (NSString)devToken;
- (NSString)prodToken;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)setDevConnection:(id)a3;
- (void)setDevToken:(id)a3;
- (void)setProdConnection:(id)a3;
- (void)setProdToken:(id)a3;
@end

@implementation APSTokenWatcher

+ (id)sharedInstance
{
  if (qword_10006D648 != -1) {
    dispatch_once(&qword_10006D648, &stru_10005A6E0);
  }
  v2 = (void *)qword_10006D640;
  if (!qword_10006D640)
  {
    v3 = sub_10001B6D4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "*** The APSTokenWatcher singleton seems to have been deallocated. This is unexpected & damaging.", v5, 2u);
    }

    v2 = (void *)qword_10006D640;
  }

  return v2;
}

- (APSTokenWatcher)init
{
  v10.receiver = self;
  v10.super_class = (Class)APSTokenWatcher;
  v2 = [(APSTokenWatcher *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)APSConnection);
    id v4 = [v3 initWithEnvironmentName:APSEnvironmentProduction namedDelegatePort:@"com.apple.icloud.fmflocatord.APSTokenWatcher.prod" queue:&_dispatch_main_q];
    [(APSTokenWatcher *)v2 setProdConnection:v4];

    v5 = [(APSTokenWatcher *)v2 prodConnection];
    [v5 setDelegate:v2];

    id v6 = objc_alloc((Class)APSConnection);
    id v7 = [v6 initWithEnvironmentName:APSEnvironmentDevelopment namedDelegatePort:@"com.apple.icloud.fmflocatord.APSTokenWatcher.dev" queue:&_dispatch_main_q];
    [(APSTokenWatcher *)v2 setDevConnection:v7];

    v8 = [(APSTokenWatcher *)v2 devConnection];
    [v8 setDelegate:v2];
  }
  return v2;
}

- (NSArray)tokenList
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(APSTokenWatcher *)self prodToken];

  if (v4)
  {
    v5 = [(APSTokenWatcher *)self prodToken];
    [v3 addObject:v5];
  }
  id v6 = [(APSTokenWatcher *)self devToken];

  if (v6)
  {
    id v7 = [(APSTokenWatcher *)self devToken];
    [v3 addObject:v7];
  }
  id v8 = [v3 copy];

  return (NSArray *)v8;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(APSTokenWatcher *)self prodConnection];

  if (v8 == v6)
  {
    v11 = [v7 fm_hexString];
    uint64_t v12 = [(APSTokenWatcher *)self prodToken];
    if (v12)
    {
      v13 = (void *)v12;
      v14 = [(APSTokenWatcher *)self prodToken];
      unsigned __int8 v15 = [v14 isEqualToString:v11];

      if (v15) {
        goto LABEL_10;
      }
    }
    [(APSTokenWatcher *)self setProdToken:v11];
LABEL_12:

    objc_super v10 = +[NSNotification notificationWithName:@"kAPSTokenWatcherUpdatedNotification" object:self userInfo:0];
    v20 = +[NSNotificationQueue defaultQueue];
    [v20 enqueueNotification:v10 postingStyle:2 coalesceMask:3 forModes:0];

LABEL_13:
    goto LABEL_14;
  }
  id v9 = [(APSTokenWatcher *)self devConnection];

  if (v9 != v6)
  {
    objc_super v10 = sub_10001B6D4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100038ECC((uint64_t)v6, v10);
    }
    goto LABEL_13;
  }
  v11 = [v7 fm_hexString];
  uint64_t v16 = [(APSTokenWatcher *)self devToken];
  if (!v16
    || (v17 = (void *)v16,
        [(APSTokenWatcher *)self devToken],
        v18 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v19 = [v18 isEqualToString:v11],
        v18,
        v17,
        (v19 & 1) == 0))
  {
    [(APSTokenWatcher *)self setDevToken:v11];
    goto LABEL_12;
  }
LABEL_10:

LABEL_14:
}

- (APSConnection)prodConnection
{
  return self->_prodConnection;
}

- (void)setProdConnection:(id)a3
{
}

- (APSConnection)devConnection
{
  return self->_devConnection;
}

- (void)setDevConnection:(id)a3
{
}

- (NSString)prodToken
{
  return self->_prodToken;
}

- (void)setProdToken:(id)a3
{
}

- (NSString)devToken
{
  return self->_devToken;
}

- (void)setDevToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devToken, 0);
  objc_storeStrong((id *)&self->_prodToken, 0);
  objc_storeStrong((id *)&self->_devConnection, 0);

  objc_storeStrong((id *)&self->_prodConnection, 0);
}

@end