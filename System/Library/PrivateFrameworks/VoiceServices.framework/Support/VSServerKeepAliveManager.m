@interface VSServerKeepAliveManager
- (BOOL)hasActiveKeepAlives;
- (VSServerKeepAliveManager)init;
- (void)cancelKeepAlive:(id)a3;
- (void)maintainKeepAlive:(id)a3;
@end

@implementation VSServerKeepAliveManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeKeepAlives, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)cancelKeepAlive:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EFE1C;
  v7[3] = &unk_1000FEB98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)maintainKeepAlive:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EFF18;
  v7[3] = &unk_1000FEB98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (BOOL)hasActiveKeepAlives
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F0028;
  v5[3] = &unk_1000FEAB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (VSServerKeepAliveManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSServerKeepAliveManager;
  v2 = [(VSServerKeepAliveManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("KeepAliveManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end