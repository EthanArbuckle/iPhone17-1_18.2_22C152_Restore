@interface PSDSyncSessionObserver
- (PSDSyncSessionObserver)initWithXPCConnection:(id)a3;
- (id)observer;
- (void)checkin:(id)a3;
- (void)requestActiveSyncSessionWithCompletion:(id)a3;
- (void)scheduler:(id)a3 didClearSyncSession:(id)a4 withBlock:(id)a5;
- (void)scheduler:(id)a3 didUpdateSyncSessionWithUpdate:(id)a4;
- (void)scheduler:(id)a3 willStartSyncSession:(id)a4;
@end

@implementation PSDSyncSessionObserver

- (PSDSyncSessionObserver)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PSDSyncSessionObserver;
  v6 = [(PSDSyncSessionObserver *)&v26 init];
  if (v6)
  {
    v7 = psy_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      v9 = psy_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PSDSyncSessionObserver: init called", buf, 2u);
      }
    }
    v10 = [v5 valueForEntitlement:@"com.apple.pairedsync.progressObserver"];
    v6->_isClientEntitled = [v10 BOOLValue];

    if (v6->_isClientEntitled)
    {
      uint64_t v11 = +[PSDScheduler sharedScheduler];
      scheduler = v6->_scheduler;
      v6->_scheduler = (PSDScheduler *)v11;
    }
    else
    {
      v13 = psd_log();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

      if (v14)
      {
        v15 = psd_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_10001D050(v5, v15);
        }
      }
      scheduler = v6->_scheduler;
      v6->_scheduler = 0;
    }

    objc_storeStrong((id *)&v6->_connection, a3);
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.syncsessionobserver", v16);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v17;

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000197D0;
    v23[3] = &unk_10002C840;
    v19 = v6;
    v24 = v19;
    [v5 setInvalidationHandler:v23];
    v20 = PSYSyncSessionProviderXPCInterface();
    [v5 setExportedInterface:v20];

    [v5 setExportedObject:v19];
    v21 = PSYSyncSessionObserverXPCInterface();
    [v5 setRemoteObjectInterface:v21];

    [v5 resume];
    [v19[4] addSchedulerObserver:v19];
  }
  return v6;
}

- (void)checkin:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_isClientEntitled)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100019934;
    v7[3] = &unk_10002CE68;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)queue, v7);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)requestActiveSyncSessionWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019A80;
  v7[3] = &unk_10002C6D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)scheduler:(id)a3 willStartSyncSession:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100019DCC;
  v8[3] = &unk_10002C8B8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)queue, v8);
}

- (void)scheduler:(id)a3 didUpdateSyncSessionWithUpdate:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100019EB8;
  v8[3] = &unk_10002C8B8;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)queue, v8);
}

- (void)scheduler:(id)a3 didClearSyncSession:(id)a4 withBlock:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019FEC;
  block[3] = &unk_10002C908;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (id)observer
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxy];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastSentSession, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end