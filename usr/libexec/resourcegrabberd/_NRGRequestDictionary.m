@interface _NRGRequestDictionary
- (NSMutableDictionary)dictionary;
- (OS_dispatch_queue)queue;
- (_NRGRequestDictionary)init;
- (id)objectForKey:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setDictionary:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setQueue:(id)a3;
@end

@implementation _NRGRequestDictionary

- (_NRGRequestDictionary)init
{
  v8.receiver = self;
  v8.super_class = (Class)_NRGRequestDictionary;
  v2 = [(_NRGRequestDictionary *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.nanoresourcegrabber.requests", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_opt_new();
    dictionary = v2->_dictionary;
    v2->_dictionary = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100012854;
  v16 = sub_100012864;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001286C;
  block[3] = &unk_1000206A8;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012980;
  block[3] = &unk_100020608;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_sync(queue, block);
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012A2C;
  v7[3] = &unk_100020658;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(queue, v7);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)dictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end