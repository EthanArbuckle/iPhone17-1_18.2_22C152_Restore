@interface NRQueueTable
+ (id)sharedTable;
- (NRQueueTable)init;
- (id)objectForKeyedSubscript:(id)a3;
- (id)queueWithDispatchQueue:(id)a3;
- (void)enumerateQueuesWithBlock:(id)a3;
- (void)removeQueue:(id)a3;
@end

@implementation NRQueueTable

- (NRQueueTable)init
{
  v9.receiver = self;
  v9.super_class = (Class)NRQueueTable;
  v2 = [(NRQueueTable *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NanoRegistry.NRQueue.queueTable", v3);
    queueTableQueue = v2->_queueTableQueue;
    v2->_queueTableQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[NSMutableDictionary dictionary];
    queueTable = v2->_queueTable;
    v2->_queueTable = (NSMutableDictionary *)v6;
  }
  return v2;
}

+ (id)sharedTable
{
  if (qword_1001A1410 != -1) {
    dispatch_once(&qword_1001A1410, &stru_100169860);
  }
  v2 = (void *)qword_1001A1418;

  return v2;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1000D3784;
  v16 = sub_1000D3794;
  id v17 = 0;
  queueTableQueue = self->_queueTableQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D379C;
  block[3] = &unk_100165B78;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queueTableQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)enumerateQueuesWithBlock:(id)a3
{
  id v4 = (uint64_t (**)(id, void *))a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_1000D3784;
  v21 = sub_1000D3794;
  id v22 = 0;
  queueTableQueue = self->_queueTableQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D3A1C;
  block[3] = &unk_100165840;
  block[4] = self;
  void block[5] = &v17;
  dispatch_sync((dispatch_queue_t)queueTableQueue, block);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = (id)v18[5];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v6);
      }
      id v10 = [[*(id *)(*((void *)&v12 + 1) + 8 * v9) nonretainedObjectValue:v12];
      char v11 = v4[2](v4, v10);

      if ((v11 & 1) == 0) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v6 countByEnumeratingWithState:&v12 objects:v23 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v17, 8);
}

- (id)queueWithDispatchQueue:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = sub_1000D3784;
  v16 = sub_1000D3794;
  id v17 = 0;
  queueTableQueue = self->_queueTableQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D3B94;
  block[3] = &unk_100165B78;
  id v10 = v4;
  char v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queueTableQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)removeQueue:(id)a3
{
  id v4 = a3;
  queueTableQueue = self->_queueTableQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D3DD8;
  v7[3] = &unk_100165530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queueTableQueue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueTable, 0);

  objc_storeStrong((id *)&self->_queueTableQueue, 0);
}

@end