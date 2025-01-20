@interface RCXPCStoreServer
+ (id)startStoreServers:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)shouldAcceptDatabaseConnection;
- (void)setShouldAcceptDatabaseConnection:(id)a3;
@end

@implementation RCXPCStoreServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)RCXPCStoreServer;
  if ([(RCXPCStoreServer *)&v9 listener:a3 shouldAcceptNewConnection:v6]) {
    char v7 = (*((uint64_t (**)(void))self->_shouldAcceptDatabaseConnection + 2))();
  }
  else {
    char v7 = 0;
  }

  return v7;
}

+ (id)startStoreServers:(id)a3
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000087E8;
  v10[3] = &unk_100038930;
  id v11 = a3;
  id v3 = v11;
  v4 = objc_retainBlock(v10);
  uint64_t v5 = kCloudStoreXPCServiceName;
  id v6 = RCCloudRecordingsStoreURL();
  char v7 = ((void (*)(void *, uint64_t, void *))v4[2])(v4, v5, v6);

  [v7 startListening];
  v12 = v7;
  v8 = +[NSArray arrayWithObjects:&v12 count:1];

  return v8;
}

- (id)shouldAcceptDatabaseConnection
{
  return self->_shouldAcceptDatabaseConnection;
}

- (void)setShouldAcceptDatabaseConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end