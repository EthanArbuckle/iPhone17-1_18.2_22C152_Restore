@interface _bmFMDatabaseQueue
+ (Class)databaseClass;
+ (id)databaseQueueWithPath:(id)a3;
+ (id)databaseQueueWithPath:(id)a3 flags:(int)a4;
+ (id)databaseQueueWithURL:(id)a3;
+ (id)databaseQueueWithURL:(id)a3 flags:(int)a4;
- (BOOL)checkpoint:(int)a3 error:(id *)a4;
- (BOOL)checkpoint:(int)a3 name:(id)a4 error:(id *)a5;
- (BOOL)checkpoint:(int)a3 name:(id)a4 logFrameCount:(int *)a5 checkpointCount:(int *)a6 error:(id *)a7;
- (NSString)path;
- (NSString)vfsName;
- (_bmFMDatabaseQueue)init;
- (_bmFMDatabaseQueue)initWithPath:(id)a3;
- (_bmFMDatabaseQueue)initWithPath:(id)a3 flags:(int)a4;
- (_bmFMDatabaseQueue)initWithPath:(id)a3 flags:(int)a4 vfs:(id)a5;
- (_bmFMDatabaseQueue)initWithURL:(id)a3;
- (_bmFMDatabaseQueue)initWithURL:(id)a3 flags:(int)a4;
- (_bmFMDatabaseQueue)initWithURL:(id)a3 flags:(int)a4 vfs:(id)a5;
- (id)database;
- (id)inSavePoint:(id)a3;
- (int)openFlags;
- (void)beginTransaction:(int64_t)a3 withBlock:(id)a4;
- (void)close;
- (void)dealloc;
- (void)inDatabase:(id)a3;
- (void)inDeferredTransaction:(id)a3;
- (void)inExclusiveTransaction:(id)a3;
- (void)inImmediateTransaction:(id)a3;
- (void)inTransaction:(id)a3;
- (void)interrupt;
- (void)setPath:(id)a3;
- (void)setVfsName:(id)a3;
@end

@implementation _bmFMDatabaseQueue

+ (id)databaseQueueWithPath:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithPath:v4];

  return v5;
}

+ (id)databaseQueueWithURL:(id)a3
{
  id v4 = [a3 path];
  id v5 = [a1 databaseQueueWithPath:v4];

  return v5;
}

+ (id)databaseQueueWithPath:(id)a3 flags:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithPath:v6 flags:v4];

  return v7;
}

+ (id)databaseQueueWithURL:(id)a3 flags:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [a3 path];
  id v7 = [a1 databaseQueueWithPath:v6 flags:v4];

  return v7;
}

+ (Class)databaseClass
{
  return (Class)objc_opt_class();
}

- (_bmFMDatabaseQueue)initWithURL:(id)a3 flags:(int)a4 vfs:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v9 = [a3 path];
  v10 = [(_bmFMDatabaseQueue *)self initWithPath:v9 flags:v5 vfs:v8];

  return v10;
}

- (_bmFMDatabaseQueue)initWithPath:(id)a3 flags:(int)a4 vfs:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_bmFMDatabaseQueue;
  id v11 = [(_bmFMDatabaseQueue *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [[objc_msgSend((id)objc_opt_class(), "databaseClass") databaseWithPath:v9];
    v13 = (void *)*((void *)v11 + 2);
    *((void *)v11 + 2) = v12;

    if (![*((id *)v11 + 2) openWithFlags:v6 vfs:v10])
    {
      NSLog(@"Could not create database queue for path %@", v9);
      v19 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)v11 + 4, a3);
    id v14 = [objc_alloc((Class)NSString) initWithFormat:@"fmdb.%@", v11];
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], 0);
    v16 = (void *)*((void *)v11 + 1);
    *((void *)v11 + 1) = v15;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v11 + 1), &off_10006DA08, v11, 0);
    *((_DWORD *)v11 + 6) = v6;
    id v17 = [v10 copy];
    v18 = (void *)*((void *)v11 + 5);
    *((void *)v11 + 5) = v17;
  }
  v19 = (_bmFMDatabaseQueue *)v11;
LABEL_6:

  return v19;
}

- (_bmFMDatabaseQueue)initWithPath:(id)a3 flags:(int)a4
{
  return [(_bmFMDatabaseQueue *)self initWithPath:a3 flags:*(void *)&a4 vfs:0];
}

- (_bmFMDatabaseQueue)initWithURL:(id)a3 flags:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = [a3 path];
  id v7 = [(_bmFMDatabaseQueue *)self initWithPath:v6 flags:v4 vfs:0];

  return v7;
}

- (_bmFMDatabaseQueue)initWithURL:(id)a3
{
  uint64_t v4 = [a3 path];
  uint64_t v5 = [(_bmFMDatabaseQueue *)self initWithPath:v4];

  return v5;
}

- (_bmFMDatabaseQueue)initWithPath:(id)a3
{
  return [(_bmFMDatabaseQueue *)self initWithPath:a3 flags:6 vfs:0];
}

- (_bmFMDatabaseQueue)init
{
  return [(_bmFMDatabaseQueue *)self initWithPath:0];
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue)
  {
    self->_queue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_bmFMDatabaseQueue;
  [(_bmFMDatabaseQueue *)&v4 dealloc];
}

- (void)close
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000436EC;
  block[3] = &unk_10006CB58;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)interrupt
{
  id v2 = [(_bmFMDatabaseQueue *)self database];
  [v2 interrupt];
}

- (id)database
{
  if ([(_bmFMDatabase *)self->_db isOpen]) {
    goto LABEL_5;
  }
  db = self->_db;
  if (!db)
  {
    [objc_msgSend((id)objc_opt_class(), "databaseClass") databaseWithPath:self->_path];
    objc_super v4 = (_bmFMDatabase *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_db;
    self->_db = v4;

    db = self->_db;
  }
  if ([(_bmFMDatabase *)db openWithFlags:self->_openFlags vfs:self->_vfsName])
  {
LABEL_5:
    uint64_t v6 = self->_db;
  }
  else
  {
    NSLog(@"_bmFMDatabaseQueue could not reopen database for path %@", self->_path);
    id v7 = self->_db;
    self->_db = 0;

    uint64_t v6 = 0;
  }

  return v6;
}

- (void)inDatabase:(id)a3
{
  id v4 = a3;
  dispatch_get_specific(&off_10006DA08);
  uint64_t v5 = (_bmFMDatabaseQueue *)objc_claimAutoreleasedReturnValue();
  if (v5 == self) {
    sub_100043FC0();
  }
  uint64_t v6 = v5;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000438F0;
  v9[3] = &unk_10006CB80;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync((dispatch_queue_t)queue, v9);
}

- (void)beginTransaction:(int64_t)a3 withBlock:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043A10;
  block[3] = &unk_10006DA18;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)inTransaction:(id)a3
{
}

- (void)inDeferredTransaction:(id)a3
{
}

- (void)inExclusiveTransaction:(id)a3
{
}

- (void)inImmediateTransaction:(id)a3
{
}

- (id)inSavePoint:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  dispatch_queue_t v15 = sub_100043C38;
  v16 = sub_100043C48;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043C50;
  block[3] = &unk_10006DA40;
  id v10 = v4;
  int64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)checkpoint:(int)a3 error:(id *)a4
{
  return [(_bmFMDatabaseQueue *)self checkpoint:*(void *)&a3 name:0 logFrameCount:0 checkpointCount:0 error:a4];
}

- (BOOL)checkpoint:(int)a3 name:(id)a4 error:(id *)a5
{
  return [(_bmFMDatabaseQueue *)self checkpoint:*(void *)&a3 name:a4 logFrameCount:0 checkpointCount:0 error:a5];
}

- (BOOL)checkpoint:(int)a3 name:(id)a4 logFrameCount:(int *)a5 checkpointCount:(int *)a6 error:(id *)a7
{
  id v12 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043EC8;
  block[3] = &unk_10006DA68;
  int v22 = a3;
  block[4] = self;
  id v17 = v12;
  v18 = &v23;
  v19 = a5;
  v20 = a6;
  objc_super v21 = a7;
  id v14 = v12;
  dispatch_sync((dispatch_queue_t)queue, block);
  LOBYTE(a6) = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return (char)a6;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPath:(id)a3
{
}

- (int)openFlags
{
  return self->_openFlags;
}

- (NSString)vfsName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVfsName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vfsName, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_db, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end