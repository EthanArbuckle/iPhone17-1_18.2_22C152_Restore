@interface CRLLogCatThreadSafeMutableSet
- (BOOL)containsObject:(id)a3;
- (CRLLogCatThreadSafeMutableSet)init;
- (CRLLogCatThreadSafeMutableSet)initWithArray:(id)a3;
- (id)allObjects;
- (id)description;
- (id)immutableSet;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)removeObject:(id)a3;
@end

@implementation CRLLogCatThreadSafeMutableSet

- (CRLLogCatThreadSafeMutableSet)initWithArray:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLLogCatThreadSafeMutableSet;
  v5 = [(CRLLogCatThreadSafeMutableSet *)&v12 init];
  if (v5)
  {
    v6 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithArray:v4];
    objects = v5->_objects;
    v5->_objects = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("CRLLogCatQueue", v8);
    logCatQueue = v5->_logCatQueue;
    v5->_logCatQueue = (OS_dispatch_queue *)v9;
  }
  return v5;
}

- (CRLLogCatThreadSafeMutableSet)init
{
  v3 = +[NSArray array];
  id v4 = [(CRLLogCatThreadSafeMutableSet *)self initWithArray:v3];

  return v4;
}

- (BOOL)containsObject:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  logCatQueue = self->_logCatQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004020D0;
  block[3] = &unk_1014CEE50;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(logCatQueue, block);
  LOBYTE(logCatQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)logCatQueue;
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  logCatQueue = self->_logCatQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004021B4;
  v5[3] = &unk_1014CB090;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logCatQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)allObjects
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1004022DC;
  v10 = sub_1004022EC;
  id v11 = 0;
  logCatQueue = self->_logCatQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004022F4;
  v5[3] = &unk_1014CB090;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logCatQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)immutableSet
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1004022DC;
  v10 = sub_1004022EC;
  id v11 = 0;
  logCatQueue = self->_logCatQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100402434;
  v5[3] = &unk_1014CB090;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logCatQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  logCatQueue = self->_logCatQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100402524;
  v7[3] = &unk_1014CBE78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(logCatQueue, v7);
}

- (void)removeObject:(id)a3
{
  id v4 = a3;
  logCatQueue = self->_logCatQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004025C8;
  v7[3] = &unk_1014CBE78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(logCatQueue, v7);
}

- (id)description
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1004022DC;
  v10 = sub_1004022EC;
  id v11 = 0;
  logCatQueue = self->_logCatQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004026C4;
  v5[3] = &unk_1014CB090;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logCatQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logCatQueue, 0);

  objc_storeStrong((id *)&self->_objects, 0);
}

@end