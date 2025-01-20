@interface IMFileWatcher
+ (id)defaultWatcher;
- (IMFileWatcher)init;
- (id)watchFileAtPath:(id)a3 queue:(id)a4 usingBlock:(id)a5;
- (void)dealloc;
- (void)removeWatcher:(id)a3;
@end

@implementation IMFileWatcher

+ (id)defaultWatcher
{
  if (qword_345CF0 != -1) {
    dispatch_once(&qword_345CF0, &stru_2C8EB8);
  }
  v2 = (void *)qword_345CE8;

  return v2;
}

- (IMFileWatcher)init
{
  v9.receiver = self;
  v9.super_class = (Class)IMFileWatcher;
  v2 = [(IMFileWatcher *)&v9 init];
  if (v2)
  {
    id v3 = +[NSString stringWithFormat:@"com.apple.iBooks.IMFileWatcher.%p", v2];
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    groups = v2->_groups;
    v2->_groups = v6;
  }
  return v2;
}

- (void)dealloc
{
  id v3 = self->_groups;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E5934;
  block[3] = &unk_2C3C50;
  v8 = v3;
  v5 = v3;
  dispatch_async(queue, block);

  v6.receiver = self;
  v6.super_class = (Class)IMFileWatcher;
  [(IMFileWatcher *)&v6 dealloc];
}

- (id)watchFileAtPath:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_E5AE4;
  v26 = sub_E5AF4;
  id v27 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E5AFC;
  block[3] = &unk_2C8F20;
  void block[4] = self;
  id v18 = v8;
  id v20 = v10;
  v21 = &v22;
  id v19 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(queue, block);
  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v15;
}

- (void)removeWatcher:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_E5C88;
    v7[3] = &unk_2C3AF8;
    id v8 = v4;
    id v9 = self;
    dispatch_sync(queue, v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end