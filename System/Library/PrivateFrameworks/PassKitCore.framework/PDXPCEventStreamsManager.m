@interface PDXPCEventStreamsManager
+ (id)eventStreamManager;
- (PDXPCEventStreamsManager)init;
- (id)_init;
- (id)_managerForEventStream:(id)a3;
- (void)beginEventDelivery;
- (void)pauseEventDelivery;
- (void)registerForLaunchEvents;
- (void)registerObserver:(id)a3 forEventStream:(id)a4;
- (void)registerObserver:(id)a3 forEventStream:(id)a4 withReplyQueue:(id)a5;
- (void)unregisterObserver:(id)a3 forEventStream:(id)a4;
@end

@implementation PDXPCEventStreamsManager

+ (id)eventStreamManager
{
  if (qword_100808B58 != -1) {
    dispatch_once(&qword_100808B58, &stru_1007311E0);
  }
  v2 = (void *)qword_100808B50;
  return v2;
}

- (PDXPCEventStreamsManager)init
{
  return 0;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)PDXPCEventStreamsManager;
  v2 = [(PDXPCEventStreamsManager *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_pauseCounter = 1;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    streamToStreamManagerMap = v3->_streamToStreamManagerMap;
    v3->_streamToStreamManagerMap = v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.passd.xpcEventStreamsManager.state", 0);
    stateQueue = v3->_stateQueue;
    v3->_stateQueue = (OS_dispatch_queue *)v6;
  }
  return v3;
}

- (void)registerForLaunchEvents
{
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000655B4;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

- (void)pauseEventDelivery
{
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100065690;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

- (void)beginEventDelivery
{
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000657C8;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

- (void)registerObserver:(id)a3 forEventStream:(id)a4
{
}

- (void)registerObserver:(id)a3 forEventStream:(id)a4 withReplyQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 length])
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = sub_10002077C;
    v19 = sub_100020EB0;
    id v20 = 0;
    stateQueue = self->_stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100065AC4;
    block[3] = &unk_100731208;
    v14 = &v15;
    block[4] = self;
    id v13 = v9;
    dispatch_sync(stateQueue, block);
    [(id)v16[5] registerObserver:v8 withReplyQueue:v10];

    _Block_object_dispose(&v15, 8);
  }
}

- (void)unregisterObserver:(id)a3 forEventStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = sub_10002077C;
    v16 = sub_100020EB0;
    id v17 = 0;
    stateQueue = self->_stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100065C48;
    block[3] = &unk_100731208;
    v11 = &v12;
    block[4] = self;
    id v10 = v7;
    dispatch_sync(stateQueue, block);
    [(id)v13[5] unregisterObserver:v6];

    _Block_object_dispose(&v12, 8);
  }
}

- (id)_managerForEventStream:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_streamToStreamManagerMap objectForKeyedSubscript:v4];
  if (!v5)
  {
    v5 = [[PDXPCEventStreamManager alloc] initWithEventStream:v4 startedPaused:self->_pauseCounter != 0];
    [(NSMutableDictionary *)self->_streamToStreamManagerMap setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_streamToStreamManagerMap, 0);
}

@end