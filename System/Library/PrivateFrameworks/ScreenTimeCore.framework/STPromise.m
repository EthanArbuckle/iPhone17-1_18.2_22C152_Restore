@interface STPromise
+ (OS_dispatch_group)dispatchGroup;
+ (id)all:(id)a3;
+ (id)createQueue;
+ (id)do:(id)a3;
+ (id)doOn;
+ (id)doWork;
+ (id)onQueue:(id)a3 all:(id)a4;
+ (id)onQueue:(id)a3 do:(id)a4;
+ (id)pendingPromise;
+ (id)resolved;
+ (id)resolvedWith:(id)a3;
- (BOOL)isCanceled;
- (BOOL)isPending;
- (BOOL)isResolved;
- (NSMutableArray)observers;
- (NSObject)stateLock;
- (OS_dispatch_queue)queue;
- (STPromise)initWithResolution:(id)a3 onQueue:(id)a4;
- (STResult)result;
- (id)catch;
- (id)catch:(id)a3;
- (id)catchOn;
- (id)chainOnQueue:(id)a3 chainedResolve:(id)a4 chainedError:(id)a5;
- (id)description;
- (id)given;
- (id)given:(id)a3;
- (id)givenOn;
- (id)initPendingOnQueue:(id)a3;
- (id)onQueue:(id)a3 catch:(id)a4;
- (id)onQueue:(id)a3 given:(id)a4;
- (id)onQueue:(id)a3 then:(id)a4;
- (id)then;
- (id)then:(id)a3;
- (id)thenOn;
- (int64_t)state;
- (void)cancel;
- (void)dealloc;
- (void)observeOnQueue:(id)a3 resolve:(id)a4 cancel:(id)a5;
- (void)resolve:(id)a3;
@end

@implementation STPromise

- (void)dealloc
{
  if (!self->_state)
  {
    v3 = +[STPromise dispatchGroup];
    dispatch_group_leave(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)STPromise;
  [(STPromise *)&v4 dealloc];
}

- (id)initPendingOnQueue:(id)a3
{
  objc_super v4 = (OS_dispatch_queue *)a3;
  v12.receiver = self;
  v12.super_class = (Class)STPromise;
  v5 = [(STPromise *)&v12 init];
  queue = v5->_queue;
  v5->_queue = v4;
  v7 = v4;

  v5->_state = 0;
  uint64_t v8 = objc_opt_new();
  stateLock = v5->_stateLock;
  v5->_stateLock = v8;

  v10 = +[STPromise dispatchGroup];

  dispatch_group_enter(v10);
  return v5;
}

- (STPromise)initWithResolution:(id)a3 onQueue:(id)a4
{
  v6 = (OS_dispatch_queue *)a4;
  v16.receiver = self;
  v16.super_class = (Class)STPromise;
  id v7 = a3;
  uint64_t v8 = [(STPromise *)&v16 init];
  queue = v8->_queue;
  v8->_queue = v6;
  v10 = v6;

  v11 = (STResult *)objc_msgSend(v7, "copy", v16.receiver, v16.super_class);
  objc_super v12 = v8->_result;
  v8->_result = v11;

  v8->_state = 1;
  uint64_t v13 = objc_opt_new();
  stateLock = v8->_stateLock;
  v8->_stateLock = v13;

  return v8;
}

+ (id)pendingPromise
{
  id v3 = objc_alloc((Class)a1);
  objc_super v4 = [a1 createQueue];
  id v5 = [v3 initPendingOnQueue:v4];

  return v5;
}

+ (id)resolvedWith:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [a1 createQueue];
  id v7 = [v5 initWithResolution:v4 onQueue:v6];

  return v7;
}

+ (id)createQueue
{
  v2 = objc_opt_new();
  id v3 = [v2 UUIDString];
  id v4 = +[NSString stringWithFormat:@"com.apple.ScreenTimeAgent.promise.%@", v3];

  id v5 = v4;
  v6 = (const char *)[v5 UTF8String];
  id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v8 = dispatch_queue_create(v6, v7);

  return v8;
}

- (id)description
{
  id v4 = self->_stateLock;
  objc_sync_enter(v4);
  int64_t state = self->_state;
  if (state == 2)
  {
    v9 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v9);
    uint64_t v8 = +[NSString stringWithFormat:@"<%@:%p { Canceled }>", v7, self];
  }
  else if (state == 1)
  {
    v10 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v10);
    uint64_t v8 = +[NSString stringWithFormat:@"<%@:%p { Resolved: %@ }>", v7, self, self->_result];
  }
  else
  {
    if (state) {
      goto LABEL_8;
    }
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = +[NSString stringWithFormat:@"<%@:%p { Pending }>", v7, self];
  }
  v2 = (void *)v8;

LABEL_8:
  objc_sync_exit(v4);

  return v2;
}

- (BOOL)isPending
{
  v2 = self;
  id v3 = self->_stateLock;
  objc_sync_enter(v3);
  LOBYTE(v2) = v2->_state == 0;
  objc_sync_exit(v3);

  return (char)v2;
}

- (BOOL)isResolved
{
  v2 = self;
  id v3 = self->_stateLock;
  objc_sync_enter(v3);
  LOBYTE(v2) = v2->_state == 1;
  objc_sync_exit(v3);

  return (char)v2;
}

- (BOOL)isCanceled
{
  v2 = self;
  id v3 = self->_stateLock;
  objc_sync_enter(v3);
  LOBYTE(v2) = v2->_state == 2;
  objc_sync_exit(v3);

  return (char)v2;
}

+ (OS_dispatch_group)dispatchGroup
{
  if (qword_100346988 != -1) {
    dispatch_once(&qword_100346988, &stru_1002FD240);
  }
  v2 = (void *)qword_100346980;
  return (OS_dispatch_group *)v2;
}

- (void)resolve:(id)a3
{
  id v5 = a3;
  v6 = self->_stateLock;
  objc_sync_enter(v6);
  int64_t state = self->_state;
  switch(state)
  {
    case 2:
      objc_super v12 = +[STLog promise];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1002638CC();
      }
      goto LABEL_16;
    case 1:
      objc_super v12 = +[STLog promise];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100263864();
      }
      goto LABEL_16;
    case 0:
      self->_int64_t state = 1;
      objc_storeStrong((id *)&self->_result, a3);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v8 = self->_observers;
      id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v15;
        do
        {
          v11 = 0;
          do
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v8);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v11) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v11));
            v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }

      objc_super v12 = +[STPromise dispatchGroup];
      dispatch_group_leave(v12);
LABEL_16:

      break;
  }
  observers = self->_observers;
  self->_observers = 0;

  objc_sync_exit(v6);
}

- (void)cancel
{
  id v3 = self->_stateLock;
  objc_sync_enter(v3);
  int64_t state = self->_state;
  switch(state)
  {
    case 2:
      uint64_t v10 = +[STLog promise];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10026399C();
      }
      goto LABEL_16;
    case 1:
      uint64_t v10 = +[STLog promise];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100263934();
      }
      goto LABEL_16;
    case 0:
      self->_int64_t state = 2;
      result = self->_result;
      self->_result = 0;

      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      v6 = self->_observers;
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v13;
        do
        {
          id v9 = 0;
          do
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v6);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * (void)v9) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * (void)v9));
            id v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }

      uint64_t v10 = +[STPromise dispatchGroup];
      dispatch_group_leave(v10);
LABEL_16:

      break;
  }
  observers = self->_observers;
  self->_observers = 0;

  objc_sync_exit(v3);
}

- (void)observeOnQueue:(id)a3 resolve:(id)a4 cancel:(id)a5
{
  uint64_t v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self->_stateLock;
  objc_sync_enter(v11);
  int64_t state = self->_state;
  switch(state)
  {
    case 2:
      v18 = +[STPromise dispatchGroup];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10005D3A0;
      v20[3] = &unk_1002FCB70;
      long long v17 = &v21;
      id v21 = v10;
      dispatch_group_async(v18, v8, v20);

LABEL_9:
      break;
    case 1:
      v19 = +[STPromise dispatchGroup];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005D388;
      block[3] = &unk_1002FD220;
      long long v17 = &v23;
      block[4] = self;
      id v23 = v9;
      dispatch_group_async(v19, v8, block);

      goto LABEL_9;
    case 0:
      observers = self->_observers;
      if (!observers)
      {
        long long v14 = (NSMutableArray *)objc_opt_new();
        long long v15 = self->_observers;
        self->_observers = v14;

        observers = self->_observers;
      }
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10005D25C;
      v24[3] = &unk_1002FD290;
      v25 = v8;
      id v26 = v9;
      id v27 = v10;
      long long v16 = objc_retainBlock(v24);
      [(NSMutableArray *)observers addObject:v16];
      long long v17 = (id *)&v25;

      goto LABEL_9;
  }
  objc_sync_exit(v11);
}

- (id)chainOnQueue:(id)a3 chainedResolve:(id)a4 chainedError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10005D5B0;
  v28[3] = &unk_1002FD2B8;
  id v29 = v8;
  id v11 = [[STPromise alloc] initPendingOnQueue:v8];
  id v30 = v11;
  id v12 = v8;
  long long v13 = objc_retainBlock(v28);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10005D728;
  v23[3] = &unk_1002FD2E0;
  id v25 = v9;
  id v26 = v10;
  id v24 = v11;
  id v27 = v13;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10005D82C;
  v21[3] = &unk_1002FB6A8;
  id v14 = v24;
  id v22 = v14;
  long long v15 = v13;
  id v16 = v10;
  id v17 = v9;
  [(STPromise *)self observeOnQueue:v12 resolve:v23 cancel:v21];
  v18 = v22;
  id v19 = v14;

  return v19;
}

- (int64_t)state
{
  return self->_state;
}

- (NSObject)stateLock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (NSMutableArray)observers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (STResult)result
{
  return (STResult *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
}

+ (id)resolved
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005D944;
  v4[3] = &unk_1002FD300;
  v4[4] = a1;
  v2 = objc_retainBlock(v4);
  return v2;
}

+ (id)all:(id)a3
{
  id v4 = a3;
  id v5 = [a1 createQueue];
  v6 = [a1 onQueue:v5 all:v4];

  return v6;
}

+ (id)onQueue:(id)a3 all:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 count];
  id v9 = [STPromise alloc];
  id v10 = v9;
  if (v8)
  {
    id v11 = [(STPromise *)v9 initPendingOnQueue:v6];
    id v12 = +[STPromise dispatchGroup];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10005DB40;
    v18[3] = &unk_1002FD350;
    id v19 = v7;
    id v22 = a1;
    dispatch_queue_t v20 = (dispatch_queue_t)v6;
    id v13 = v11;
    id v21 = v13;
    dispatch_group_async(v12, v20, v18);

    id v14 = v21;
    long long v15 = (STPromise *)v13;
  }
  else
  {
    id v16 = +[STResult success:&__NSArray0__struct];
    long long v15 = [(STPromise *)v10 initWithResolution:v16 onQueue:v6];
  }
  return v15;
}

- (id)catch:(id)a3
{
  id v4 = a3;
  id v5 = [(STPromise *)self queue];
  id v6 = [(STPromise *)self onQueue:v5 catch:v4];

  return v6;
}

- (id)onQueue:(id)a3 catch:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005E448;
  v9[3] = &unk_1002FD378;
  id v10 = a4;
  id v6 = v10;
  id v7 = [(STPromise *)self chainOnQueue:a3 chainedResolve:0 chainedError:v9];

  return v7;
}

- (id)catch
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005E538;
  v4[3] = &unk_1002FD3A0;
  v4[4] = self;
  v2 = objc_retainBlock(v4);
  return v2;
}

- (id)catchOn
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005E5C0;
  v4[3] = &unk_1002FD3C8;
  v4[4] = self;
  v2 = objc_retainBlock(v4);
  return v2;
}

+ (id)do:(id)a3
{
  id v4 = a3;
  id v5 = [a1 createQueue];
  id v6 = [a1 onQueue:v5 do:v4];

  return v6;
}

+ (id)onQueue:(id)a3 do:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[STPromise alloc] initPendingOnQueue:v5];
  id v8 = +[STPromise dispatchGroup];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005E75C;
  block[3] = &unk_1002FD3F0;
  id v18 = v6;
  id v16 = v5;
  id v9 = v7;
  id v17 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_group_async(v8, v10, block);

  id v12 = v17;
  id v13 = v9;

  return v13;
}

+ (id)doWork
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005E978;
  v4[3] = &unk_1002FD410;
  v4[4] = a1;
  v2 = objc_retainBlock(v4);
  return v2;
}

+ (id)doOn
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005EA00;
  v4[3] = &unk_1002FD430;
  v4[4] = a1;
  v2 = objc_retainBlock(v4);
  return v2;
}

- (id)given:(id)a3
{
  id v4 = a3;
  id v5 = [(STPromise *)self queue];
  id v6 = [(STPromise *)self onQueue:v5 given:v4];

  return v6;
}

- (id)onQueue:(id)a3 given:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005EB48;
  v9[3] = &unk_1002FD458;
  id v10 = a4;
  id v6 = v10;
  id v7 = [(STPromise *)self chainOnQueue:a3 chainedResolve:v9 chainedError:0];

  return v7;
}

- (id)given
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005EC4C;
  v4[3] = &unk_1002FD480;
  v4[4] = self;
  v2 = objc_retainBlock(v4);
  return v2;
}

- (id)givenOn
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005ECD4;
  v4[3] = &unk_1002FD4A8;
  v4[4] = self;
  v2 = objc_retainBlock(v4);
  return v2;
}

- (id)then:(id)a3
{
  id v4 = a3;
  id v5 = [(STPromise *)self queue];
  id v6 = [(STPromise *)self onQueue:v5 then:v4];

  return v6;
}

- (id)onQueue:(id)a3 then:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005F328;
  v9[3] = &unk_1002FD458;
  id v10 = a4;
  id v6 = v10;
  id v7 = [(STPromise *)self chainOnQueue:a3 chainedResolve:v9 chainedError:0];

  return v7;
}

- (id)then
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005F410;
  v4[3] = &unk_1002FD4D0;
  v4[4] = self;
  v2 = objc_retainBlock(v4);
  return v2;
}

- (id)thenOn
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005F498;
  v4[3] = &unk_1002FD4F8;
  v4[4] = self;
  v2 = objc_retainBlock(v4);
  return v2;
}

@end