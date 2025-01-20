@interface MTAStateStore
+ (id)shared;
- (BOOL)shouldBypass;
- (MTAStateStore)init;
- (MTAStateStoreEvent)event;
- (OS_dispatch_queue)serializerQueue;
- (id)getCurrentEvent;
- (void)bypass;
- (void)clear;
- (void)localSetup;
- (void)pushEvent:(id)a3;
- (void)pushEvent:(id)a3 sync:(BOOL)a4;
- (void)restoreLastEventWithCompletion:(id)a3;
- (void)setEvent:(id)a3;
- (void)setSerializerQueue:(id)a3;
- (void)setShouldBypass:(BOOL)a3;
- (void)synchronize;
@end

@implementation MTAStateStore

+ (id)shared
{
  if (qword_1000C7D20 != -1) {
    dispatch_once(&qword_1000C7D20, &stru_1000A1CC0);
  }
  v2 = (void *)qword_1000C7D18;

  return v2;
}

- (MTAStateStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTAStateStore;
  v2 = [(MTAStateStore *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MTAStateStore *)v2 localSetup];
  }
  return v3;
}

- (void)synchronize
{
  v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronizing state store", buf, 0xCu);
  }

  serializerQueue = self->_serializerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006988;
  block[3] = &unk_1000A1428;
  block[4] = self;
  dispatch_async(serializerQueue, block);
}

- (void)pushEvent:(id)a3 sync:(BOOL)a4
{
  id v5 = a3;
  v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 description];
    *(_DWORD *)buf = 138543618;
    v13 = self;
    __int16 v14 = 2114;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ setting event: %{public}@", buf, 0x16u);
  }
  serializerQueue = self->_serializerQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000C948;
  v10[3] = &unk_1000A14C0;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_sync(serializerQueue, v10);
}

- (void)restoreLastEventWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  serializerQueue = self->_serializerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C80C;
  block[3] = &unk_1000A1CE8;
  block[4] = self;
  void block[5] = &v20;
  dispatch_sync(serializerQueue, block);
  if (*((unsigned char *)v21 + 24))
  {
    v6 = MTLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ bypassing state restore", buf, 0xCu);
    }

    v7 = +[MTAStateStoreEvent blankEvent];
    v4[2](v4, v7);

    [(MTAStateStore *)self clear];
    self->_shouldBypass = 0;
    goto LABEL_25;
  }
  v8 = MTLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ restoring last event", buf, 0xCu);
  }

  id v9 = +[NSUserDefaults standardUserDefaults];
  v10 = [v9 objectForKey:@"kMTAStateStoreLatestEvent"];

  if (v10)
  {
    id v18 = 0;
    id v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v18];
    id v12 = v18;
    if (v12)
    {
      v13 = MTLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10006CCEC((uint64_t)self, (uint64_t)v12, v13);
      }
    }
    if (v11) {
      goto LABEL_20;
    }
  }
  else
  {
    __int16 v14 = MTLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ no latest event restored", buf, 0xCu);
    }
  }
  v15 = MTLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = self;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ using blank event", buf, 0xCu);
  }

  id v11 = +[MTAStateStoreEvent blankEvent];
LABEL_20:
  v16 = MTLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [v11 description];
    *(_DWORD *)buf = 138543618;
    v25 = self;
    __int16 v26 = 2114;
    v27 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ restored last event: %{public}@", buf, 0x16u);
  }
  if (v4) {
    v4[2](v4, v11);
  }

LABEL_25:
  _Block_object_dispose(&v20, 8);
}

- (void)pushEvent:(id)a3
{
}

- (void)localSetup
{
  self->_serializerQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MTAStateStore.access-queue", 0);

  _objc_release_x1();
}

- (void)bypass
{
  serializerQueue = self->_serializerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034BC4;
  block[3] = &unk_1000A1428;
  block[4] = self;
  dispatch_sync(serializerQueue, block);
}

- (id)getCurrentEvent
{
  return self->_event;
}

- (void)clear
{
  v2 = +[NSUserDefaults standardUserDefaults];
  [v2 removeObjectForKey:@"kMTAStateStoreLatestEvent"];

  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 synchronize];
}

- (OS_dispatch_queue)serializerQueue
{
  return self->_serializerQueue;
}

- (void)setSerializerQueue:(id)a3
{
}

- (MTAStateStoreEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (BOOL)shouldBypass
{
  return self->_shouldBypass;
}

- (void)setShouldBypass:(BOOL)a3
{
  self->_shouldBypass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);

  objc_storeStrong((id *)&self->_serializerQueue, 0);
}

@end