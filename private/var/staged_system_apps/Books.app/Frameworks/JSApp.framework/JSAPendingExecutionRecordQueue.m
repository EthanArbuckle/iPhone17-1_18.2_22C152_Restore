@interface JSAPendingExecutionRecordQueue
- (JSAPendingExecutionRecordQueue)init;
- (NSMutableArray)records;
- (OS_dispatch_queue)accessQueue;
- (id)dequeueAllRecords;
- (void)enqueueRecord:(id)a3;
- (void)setAccessQueue:(id)a3;
- (void)setRecords:(id)a3;
@end

@implementation JSAPendingExecutionRecordQueue

- (JSAPendingExecutionRecordQueue)init
{
  v8.receiver = self;
  v8.super_class = (Class)JSAPendingExecutionRecordQueue;
  v2 = [(JSAPendingExecutionRecordQueue *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v5 = dispatch_queue_create("JSAPendingExecutionRecordQueue.accessQueue", v4);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)enqueueRecord:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_9BBC;
  v7[3] = &unk_B2050;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

- (id)dequeueAllRecords
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_9D00;
  v10 = sub_9D10;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_9D18;
  v5[3] = &unk_B2430;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSMutableArray)records
{
  records = self->_records;
  if (!records)
  {
    id v4 = (NSMutableArray *)objc_opt_new();
    dispatch_queue_t v5 = self->_records;
    self->_records = v4;

    records = self->_records;
  }

  return records;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (void)setRecords:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end