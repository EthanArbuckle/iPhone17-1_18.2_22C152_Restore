@interface NRQueue
+ (id)assetDownloadQueue;
+ (id)delayPairingRequestQueue;
+ (id)firstUnlockQueue;
+ (id)globalQueueWithIdentifier:(int64_t)a3;
+ (id)mainQueue;
+ (id)nearbyWatchBulletinQueue;
+ (id)newQueueWithLabel:(id)a3 withAttributes:(id)a4;
+ (id)newQueueWithLabel:(id)a3 withTargetQueue:(id)a4 withAttributes:(id)a5;
+ (id)registryDaemonQueue;
+ (id)serialQueueWithLabel:(id)a3;
+ (id)serialQueueWithLabel:(id)a3 withTargetQueue:(id)a4;
+ (id)switchCompletionBlockQueue;
+ (id)xpcPairingQueue;
- (NRQueue)initWithDispatchQueue:(id)a3;
- (NSString)label;
- (OS_dispatch_queue)queue;
- (void)dealloc;
- (void)dispatchAfter:(double)a3 withBlock:(id)a4;
- (void)dispatchAsync:(id)a3;
- (void)dispatchSync:(id)a3;
- (void)resume;
- (void)suspend;
@end

@implementation NRQueue

- (NRQueue)initWithDispatchQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NRQueue;
  v6 = [(NRQueue *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)dealloc
{
  v3 = +[NRQueueTable sharedTable];
  [v3 removeQueue:self->_queue];

  v4.receiver = self;
  v4.super_class = (Class)NRQueue;
  [(NRQueue *)&v4 dealloc];
}

+ (id)mainQueue
{
  v2 = +[NRQueueTable sharedTable];
  v3 = [v2 queueWithDispatchQueue:&_dispatch_main_q];

  return v3;
}

+ (id)globalQueueWithIdentifier:(int64_t)a3
{
  v3 = dispatch_get_global_queue(a3, 0);
  objc_super v4 = +[NRQueueTable sharedTable];
  id v5 = [v4 queueWithDispatchQueue:v3];

  return v5;
}

+ (id)serialQueueWithLabel:(id)a3
{
  id v3 = [a1 newQueueWithLabel:a3 withTargetQueue:0 withAttributes:0];

  return v3;
}

+ (id)newQueueWithLabel:(id)a3 withAttributes:(id)a4
{
  return [a1 newQueueWithLabel:a3 withTargetQueue:0 withAttributes:a4];
}

+ (id)serialQueueWithLabel:(id)a3 withTargetQueue:(id)a4
{
  id v4 = [a1 newQueueWithLabel:a3 withTargetQueue:a4 withAttributes:0];

  return v4;
}

+ (id)newQueueWithLabel:(id)a3 withTargetQueue:(id)a4 withAttributes:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = a5;
  v10 = dispatch_queue_attr_make_with_autorelease_frequency(v9, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v11 = v7;
  v12 = (const char *)[v11 UTF8String];
  v13 = [v8 queue];
  dispatch_queue_t v14 = dispatch_queue_create_with_target_V2(v12, v10, v13);

  v15 = +[NRQueueTable sharedTable];
  v16 = [v15 queueWithDispatchQueue:v14];

  v17 = nr_daemon_log();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

  if (v18)
  {
    v19 = nr_daemon_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138413058;
      id v22 = v11;
      __int16 v23 = 2048;
      id v24 = v8;
      __int16 v25 = 2048;
      v26 = v9;
      __int16 v27 = 2048;
      v28 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "newQueueWithLabel:@\"%@\" withTargetQueue:%p withAttributes:0x%ld == %p", (uint8_t *)&v21, 0x2Au);
    }
  }
  return v16;
}

+ (id)registryDaemonQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D42D0;
  block[3] = &unk_100165618;
  block[4] = a1;
  if (qword_1001A1428 != -1) {
    dispatch_once(&qword_1001A1428, block);
  }
  v2 = (void *)qword_1001A1420;

  return v2;
}

+ (id)xpcPairingQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D43E8;
  block[3] = &unk_100165618;
  block[4] = a1;
  if (qword_1001A1438 != -1) {
    dispatch_once(&qword_1001A1438, block);
  }
  v2 = (void *)qword_1001A1430;

  return v2;
}

+ (id)nearbyWatchBulletinQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D4524;
  block[3] = &unk_100165618;
  block[4] = a1;
  if (qword_1001A1448 != -1) {
    dispatch_once(&qword_1001A1448, block);
  }
  v2 = (void *)qword_1001A1440;

  return v2;
}

+ (id)switchCompletionBlockQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D4670;
  block[3] = &unk_100165618;
  block[4] = a1;
  if (qword_1001A1458 != -1) {
    dispatch_once(&qword_1001A1458, block);
  }
  v2 = (void *)qword_1001A1450;

  return v2;
}

+ (id)firstUnlockQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D4788;
  block[3] = &unk_100165618;
  block[4] = a1;
  if (qword_1001A1468 != -1) {
    dispatch_once(&qword_1001A1468, block);
  }
  v2 = (void *)qword_1001A1460;

  return v2;
}

+ (id)delayPairingRequestQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D48BC;
  block[3] = &unk_100165618;
  block[4] = a1;
  if (qword_1001A1478 != -1) {
    dispatch_once(&qword_1001A1478, block);
  }
  v2 = (void *)qword_1001A1470;

  return v2;
}

+ (id)assetDownloadQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D49F0;
  block[3] = &unk_100165618;
  block[4] = a1;
  if (qword_1001A1488 != -1) {
    dispatch_once(&qword_1001A1488, block);
  }
  v2 = (void *)qword_1001A1480;

  return v2;
}

- (NSString)label
{
  label = dispatch_queue_get_label((dispatch_queue_t)self->_queue);

  return +[NSString stringWithUTF8String:label];
}

- (void)dispatchAsync:(id)a3
{
  if (a3) {
    dispatch_async((dispatch_queue_t)self->_queue, a3);
  }
}

- (void)dispatchSync:(id)a3
{
  dispatch_block_t block = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  id v4 = block;
  if (block)
  {
    dispatch_sync((dispatch_queue_t)self->_queue, block);
    id v4 = block;
  }
}

- (void)dispatchAfter:(double)a3 withBlock:(id)a4
{
  if (a4)
  {
    int64_t v5 = (uint64_t)(a3 * 1000000000.0);
    dispatch_block_t block = a4;
    dispatch_time_t v6 = dispatch_time(0, v5);
    dispatch_after(v6, (dispatch_queue_t)self->_queue, block);
  }
}

- (void)suspend
{
}

- (void)resume
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end