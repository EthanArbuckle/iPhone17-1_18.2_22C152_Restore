@interface MBHelperServiceDelegate
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MBHelperServiceDelegate)init;
- (NSMutableArray)connections;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)idleTimer;
- (OS_os_transaction)transaction;
- (int64_t)idleTimerSuspendCount;
- (void)_addConnection:(id)a3;
- (void)_removeConnection:(id)a3;
- (void)activate;
- (void)idle;
- (void)setConnections:(id)a3;
- (void)setIdleTimer:(id)a3;
- (void)setIdleTimerSuspendCount:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation MBHelperServiceDelegate

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000063D0;
  block[3] = &unk_100020780;
  block[4] = a1;
  if (qword_100026230 != -1) {
    dispatch_once(&qword_100026230, block);
  }
  v2 = (void *)qword_100026228;
  return v2;
}

- (MBHelperServiceDelegate)init
{
  v14.receiver = self;
  v14.super_class = (Class)MBHelperServiceDelegate;
  id v2 = [(MBHelperServiceDelegate *)&v14 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(Name, v5);
    v7 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v6;

    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v2 + 1));
    v9 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v8;

    v10 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 3) = 0;
    *((void *)v2 + 4) = 0;

    uint64_t v11 = objc_opt_new();
    v12 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v11;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 2), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*((dispatch_object_t *)v2 + 2));
  }
  return (MBHelperServiceDelegate *)v2;
}

- (void)_addConnection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006598;
  v7[3] = &unk_1000207A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)_removeConnection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000066A8;
  v7[3] = &unk_1000207A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = [v7 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "New connection from pid:%d", (uint8_t *)&buf, 8u);
    id v9 = [v7 processIdentifier];
    _MBLog(@"DEFAULT", (uint64_t)"New connection from pid:%d", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
  }

  if (qword_100026240 != -1) {
    dispatch_once(&qword_100026240, &stru_1000207C8);
  }
  objc_initWeak(&buf, v7);
  [v7 setExportedInterface:qword_100026238];
  v16 = objc_opt_new();
  [v7 setExportedObject:v16];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100006A20;
  v18[3] = &unk_1000207F0;
  objc_copyWeak(&v19, &buf);
  v18[4] = self;
  [v7 setInvalidationHandler:v18];
  [(MBHelperServiceDelegate *)self _addConnection:v7];
  [v7 resume];
  objc_destroyWeak(&v19);

  objc_destroyWeak(&buf);
  return 1;
}

- (void)activate
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006B00;
  block[3] = &unk_100020818;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)idle
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006BA8;
  block[3] = &unk_100020818;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
}

- (int64_t)idleTimerSuspendCount
{
  return self->_idleTimerSuspendCount;
}

- (void)setIdleTimerSuspendCount:(int64_t)a3
{
  self->_idleTimerSuspendCount = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end