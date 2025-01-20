@interface MTXPCConnection
- (MTIDSecretStore)secretStore;
- (MTXPCConnection)initWithXPCConnection:(id)a3 secretStore:(id)a4;
- (NSXPCConnection)connection;
- (void)doClearLocalData;
- (void)doMaintainSchemes:(id)a3 options:(id)a4;
- (void)doResetSchemes:(id)a3 options:(id)a4 completion:(id)a5;
- (void)secretForScheme:(id)a3 options:(id)a4 completion:(id)a5;
- (void)syncForSchemes:(id)a3 options:(id)a4 completion:(id)a5;
@end

@implementation MTXPCConnection

- (MTXPCConnection)initWithXPCConnection:(id)a3 secretStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTXPCConnection;
  v8 = [(MTXPCConnection *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    objc_storeStrong((id *)&v9->_secretStore, a4);
  }

  return v9;
}

- (void)secretForScheme:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_super v11 = [(MTXPCConnection *)self secretStore];
  v12 = [v11 secretForScheme:v10 options:v9];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100003FC0;
  v14[3] = &unk_100020508;
  id v15 = v8;
  id v13 = v8;
  [v12 addFinishBlock:v14];
}

- (void)doResetSchemes:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_super v11 = [(MTXPCConnection *)self secretStore];
  v12 = [v11 resetSchemes:v10 options:v9];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000040C4;
  v14[3] = &unk_100020530;
  id v15 = v8;
  id v13 = v8;
  [v12 addFinishBlock:v14];
}

- (void)doMaintainSchemes:(id)a3 options:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(MTXPCConnection *)self secretStore];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(MTXPCConnection *)self secretStore];
    id v10 = [v9 maintainSchemes:v11 options:v6];
  }
}

- (void)doClearLocalData
{
  id v2 = [(MTXPCConnection *)self secretStore];
  [v2 clearLocalData];
}

- (void)syncForSchemes:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MTXPCConnection *)self secretStore];
  v12 = [v11 syncForSchemes:v10 options:v9];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000042B8;
  v14[3] = &unk_100020530;
  id v15 = v8;
  id v13 = v8;
  [v12 addFinishBlock:v14];
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (MTIDSecretStore)secretStore
{
  return self->_secretStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secretStore, 0);
  objc_destroyWeak((id *)&self->_connection);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end