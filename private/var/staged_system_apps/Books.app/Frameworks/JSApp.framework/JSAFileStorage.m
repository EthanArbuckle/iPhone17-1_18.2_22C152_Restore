@interface JSAFileStorage
+ (id)sharedInstance;
- (BOOL)ensureDirectoryExists;
- (JSAFileStorage)initWithURL:(id)a3;
- (NSURL)URL;
- (OS_dispatch_queue)queue;
- (id)filePathWithName:(id)a3;
- (id)getItem:(id)a3;
- (void)removeItem:(id)a3;
- (void)setItem:(id)a3 :(id)a4;
- (void)setURL:(id)a3;
@end

@implementation JSAFileStorage

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_F800;
  block[3] = &unk_B2510;
  block[4] = a1;
  if (qword_CE320 != -1) {
    dispatch_once(&qword_CE320, block);
  }
  v2 = (void *)qword_CE328;

  return v2;
}

- (JSAFileStorage)initWithURL:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)JSAFileStorage;
  v5 = [(JSAFileStorage *)&v12 init];
  if (v5)
  {
    v6 = (NSURL *)[v4 copy];
    URL = v5->_URL;
    v5->_URL = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("JSAFileStorage.queue", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;
  }
  return v5;
}

- (id)getItem:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_FA5C;
  v16 = sub_FA6C;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_FA74;
  block[3] = &unk_B26D0;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setItem:(id)a3 :(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = [(JSAFileStorage *)self filePathWithName:a3];
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_FC48;
    block[3] = &unk_B2560;
    id v11 = v6;
    uint64_t v12 = self;
    id v13 = v7;
    id v9 = v7;
    dispatch_sync(queue, block);
  }
  else
  {
    [(JSAFileStorage *)self removeItem:a3];
  }
}

- (void)removeItem:(id)a3
{
  id v4 = [(JSAFileStorage *)self filePathWithName:a3];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_FDDC;
  block[3] = &unk_B2000;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (BOOL)ensureDirectoryExists
{
  v3 = [(NSURL *)self->_URL path];
  id v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    id v7 = +[NSFileManager defaultManager];
    id v8 = [(NSURL *)self->_URL path];
    id v12 = 0;
    unsigned __int8 v6 = [v7 createDirectoryAtPath:v8 withIntermediateDirectories:0 attributes:&__NSDictionary0__struct error:&v12];
    id v9 = v12;

    if (v9)
    {
      id v10 = JSALog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_84CBC();
      }
    }
  }

  return v6;
}

- (id)filePathWithName:(id)a3
{
  v3 = [(NSURL *)self->_URL URLByAppendingPathComponent:a3];
  id v4 = [v3 path];

  return v4;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end