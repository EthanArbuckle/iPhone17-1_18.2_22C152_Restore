@interface NPDPassLibrary
- (BOOL)serviceActive;
- (NPDPassLibrary)initWithConnection:(id)a3;
- (NPDPassLibraryDelegate)delegate;
- (NPKPassLibraryFilter)filter;
- (NSString)remoteProcessApplicationIdentifier;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (int)remoteProcessIdentifier;
- (void)broadcastCatalogChanged:(id)a3 withNewPasses:(id)a4 states:(id)a5;
- (void)broadcastPassAdded:(id)a3;
- (void)broadcastPassRemoved:(id)a3;
- (void)broadcastPassUpdated:(id)a3;
- (void)serviceResumed;
- (void)serviceSuspended;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFilter:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceActive:(BOOL)a3;
@end

@implementation NPDPassLibrary

- (NPDPassLibrary)initWithConnection:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NPDPassLibrary;
  v5 = [(NPDPassLibrary *)&v17 init];
  v6 = v5;
  if (v5)
  {
    [(NPDPassLibrary *)v5 setConnection:v4];
    v7 = [[NPKPassLibraryFilter alloc] initWithConnection:v4];
    [(NPDPassLibrary *)v6 setFilter:v7];

    v8 = [v4 valueForEntitlement:@"application-identifier"];
    v9 = (NSString *)[v8 copy];
    remoteProcessApplicationIdentifier = v6->_remoteProcessApplicationIdentifier;
    v6->_remoteProcessApplicationIdentifier = v9;

    v6->_remoteProcessIdentifier = [v4 processIdentifier];
    v11 = PKPassLibraryInterface();
    v12 = [(NPDPassLibrary *)v6 connection];
    [v12 setRemoteObjectInterface:v11];

    v13 = PDPassLibraryInterface();
    v14 = [(NPDPassLibrary *)v6 connection];
    [v14 setExportedInterface:v13];

    [(NPDPassLibrary *)v6 setServiceActive:1];
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.NanoPassKit.NPDPassLibrary", 0);
    [(NPDPassLibrary *)v6 setQueue:v15];
  }
  return v6;
}

- (void)serviceResumed
{
  v3 = [(NPDPassLibrary *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B7F8;
  block[3] = &unk_10006CFC0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)serviceSuspended
{
  v3 = [(NPDPassLibrary *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B88C;
  block[3] = &unk_10006CFC0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)broadcastPassAdded:(id)a3
{
  id v4 = a3;
  v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Pass added: %@", buf, 0xCu);
    }
  }
  v8 = [(NPDPassLibrary *)self filter];
  unsigned int v9 = [v8 allowAccessToPass:v4];

  if (v9)
  {
    v10 = [(NPDPassLibrary *)self queue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003BA0C;
    v11[3] = &unk_10006CE50;
    v11[4] = self;
    id v12 = v4;
    dispatch_async(v10, v11);
  }
}

- (void)broadcastPassUpdated:(id)a3
{
  id v4 = a3;
  v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Pass updated: %@", buf, 0xCu);
    }
  }
  v8 = [(NPDPassLibrary *)self filter];
  unsigned int v9 = [v8 allowAccessToPass:v4];

  if (v9)
  {
    v10 = [(NPDPassLibrary *)self queue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003BD60;
    v11[3] = &unk_10006CE50;
    v11[4] = self;
    id v12 = v4;
    dispatch_async(v10, v11);
  }
}

- (void)broadcastPassRemoved:(id)a3
{
  id v4 = a3;
  v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Pass removed: %@", buf, 0xCu);
    }
  }
  v8 = [(NPDPassLibrary *)self filter];
  unsigned int v9 = [v8 allowAccessToPass:v4];

  if (v9)
  {
    v10 = [(NPDPassLibrary *)self queue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003C0B4;
    v11[3] = &unk_10006CE50;
    v11[4] = self;
    id v12 = v4;
    dispatch_async(v10, v11);
  }
}

- (void)broadcastCatalogChanged:(id)a3 withNewPasses:(id)a4 states:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = pk_General_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    v13 = pk_General_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notice: Catalog changed: %@", buf, 0xCu);
    }
  }
  id v14 = [(NPDPassLibrary *)self filter];
  dispatch_queue_t v15 = [v14 whitelist];
  unsigned int v16 = [v15 passesAllAccess];

  if (v16)
  {
    objc_super v17 = [(NPDPassLibrary *)self queue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10003C464;
    v18[3] = &unk_10006D3C0;
    v18[4] = self;
    id v19 = v8;
    id v20 = v9;
    id v21 = v10;
    dispatch_async(v17, v18);
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  self->_connection = (NSXPCConnection *)a3;
}

- (NPKPassLibraryFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (NSString)remoteProcessApplicationIdentifier
{
  return self->_remoteProcessApplicationIdentifier;
}

- (int)remoteProcessIdentifier
{
  return self->_remoteProcessIdentifier;
}

- (NPDPassLibraryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPDPassLibraryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)serviceActive
{
  return self->_serviceActive;
}

- (void)setServiceActive:(BOOL)a3
{
  self->_serviceActive = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteProcessApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

@end