@interface FMDOperationManager
+ (id)sharedManager;
- (BOOL)addAction:(id)a3 forIdentifier:(id)a4;
- (BOOL)cancelAction:(id)a3 forIdentifier:(id)a4;
- (FMDOperationManager)init;
- (NSMutableDictionary)actionQueueMap;
- (OS_dispatch_queue)serialQueue;
- (id)description;
- (void)setActionQueueMap:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation FMDOperationManager

+ (id)sharedManager
{
  if (qword_10031E968 != -1) {
    dispatch_once(&qword_10031E968, &stru_1002DB670);
  }
  v2 = (void *)qword_10031E960;

  return v2;
}

- (FMDOperationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)FMDOperationManager;
  v2 = [(FMDOperationManager *)&v6 init];
  if (v2)
  {
    v3 = +[NSMutableDictionary dictionary];
    [(FMDOperationManager *)v2 setActionQueueMap:v3];

    dispatch_queue_t v4 = dispatch_queue_create("FMDOperationManagerSerialQueue", 0);
    [(FMDOperationManager *)v2 setSerialQueue:v4];
  }
  return v2;
}

- (BOOL)addAction:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v8 = [(FMDOperationManager *)self serialQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005BDC8;
  v12[3] = &unk_1002DB698;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v7) = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return (char)v7;
}

- (BOOL)cancelAction:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v8 = [(FMDOperationManager *)self serialQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005C17C;
  v12[3] = &unk_1002DB698;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v7) = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return (char)v7;
}

- (id)description
{
  return +[NSString stringWithFormat:@"%@-%p", objc_opt_class(), self];
}

- (NSMutableDictionary)actionQueueMap
{
  return self->_actionQueueMap;
}

- (void)setActionQueueMap:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_actionQueueMap, 0);
}

@end