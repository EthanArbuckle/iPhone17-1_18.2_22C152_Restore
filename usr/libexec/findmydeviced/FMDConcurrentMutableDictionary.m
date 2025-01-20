@interface FMDConcurrentMutableDictionary
- (FMDConcurrentMutableDictionary)init;
- (FMDConcurrentMutableDictionary)initWithDictionary:(id)a3;
- (NSMutableDictionary)underlyingDictionary;
- (OS_dispatch_queue)dictModQueue;
- (id)nativeDictionary;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)removeObjectForKey:(id)a3;
- (void)setDictModQueue:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setUnderlyingDictionary:(id)a3;
@end

@implementation FMDConcurrentMutableDictionary

- (FMDConcurrentMutableDictionary)init
{
  return [(FMDConcurrentMutableDictionary *)self initWithDictionary:&__NSDictionary0__struct];
}

- (FMDConcurrentMutableDictionary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMDConcurrentMutableDictionary;
  v5 = [(FMDConcurrentMutableDictionary *)&v11 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)[v4 mutableCopy];
    underlyingDictionary = v5->_underlyingDictionary;
    v5->_underlyingDictionary = v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.icloud.FMCore.FMMutableDict.modQueue", 0);
    dictModQueue = v5->_dictModQueue;
    v5->_dictModQueue = (OS_dispatch_queue *)v8;
  }
  return v5;
}

- (unint64_t)count
{
  uint64_t v7 = 0;
  dispatch_queue_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(FMDConcurrentMutableDictionary *)self dictModQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009E820;
  v6[3] = &unk_1002D9210;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_10009E9C0;
  v16 = sub_10009E9D0;
  id v17 = 0;
  v5 = [(FMDConcurrentMutableDictionary *)self dictModQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009E9D8;
  block[3] = &unk_1002D9990;
  id v10 = v4;
  objc_super v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = [(FMDConcurrentMutableDictionary *)self dictModQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009EB20;
  block[3] = &unk_1002D9C78;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(FMDConcurrentMutableDictionary *)self dictModQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009EC2C;
  v7[3] = &unk_1002D93F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)nativeDictionary
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10009E9C0;
  objc_super v11 = sub_10009E9D0;
  id v12 = 0;
  v3 = [(FMDConcurrentMutableDictionary *)self dictModQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009ED9C;
  v6[3] = &unk_1002D9210;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (NSMutableDictionary)underlyingDictionary
{
  return self->_underlyingDictionary;
}

- (void)setUnderlyingDictionary:(id)a3
{
}

- (OS_dispatch_queue)dictModQueue
{
  return self->_dictModQueue;
}

- (void)setDictModQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictModQueue, 0);

  objc_storeStrong((id *)&self->_underlyingDictionary, 0);
}

@end