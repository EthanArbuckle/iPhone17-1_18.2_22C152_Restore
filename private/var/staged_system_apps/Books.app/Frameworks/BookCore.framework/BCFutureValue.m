@interface BCFutureValue
+ (id)reportState;
+ (void)futures:(id)a3 notify:(id)a4;
+ (void)initialize;
- (BCFutureValue)init;
- (BCFutureValue)initWithValue:(id)a3;
- (BOOL)cancelled;
- (BOOL)hasValue;
- (NSError)error;
- (NSMutableArray)waitingBlocks;
- (OS_dispatch_queue)sync;
- (id)get;
- (id)getNonBlockingError:(id *)a3;
- (id)sq_get:(id)a3 caller:(void *)a4 value:(id *)a5 error:(id *)a6;
- (id)value;
- (void)_addToState:(id)a3;
- (void)_get:(id)a3 caller:(void *)a4;
- (void)_notifyBlocks:(id)a3 withValue:(id)a4 error:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)get:(id)a3;
- (void)getBefore:(unint64_t)a3 block:(id)a4;
- (void)setCancelled:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setSync:(id)a3;
- (void)setValue:(id)a3;
- (void)setWaitingBlocks:(id)a3;
@end

@implementation BCFutureValue

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    dispatch_queue_t v2 = dispatch_queue_create("BCFutureValue.outstandingSync", 0);
    v3 = (void *)qword_349460;
    qword_349460 = (uint64_t)v2;

    uint64_t v4 = +[NSHashTable hashTableWithOptions:517];
    v5 = (void *)qword_349468;
    qword_349468 = v4;

    v6 = dispatch_get_global_queue(2, 0);
    os_state_add_handler();
  }
}

+ (id)reportState
{
  dispatch_queue_t v2 = objc_opt_new();
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_1676D4;
  v19 = sub_1676E4;
  id v20 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_167FC0;
  block[3] = &unk_2C7A38;
  block[4] = &v15;
  dispatch_sync((dispatch_queue_t)qword_349460, block);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = (id)v16[5];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(id *)(*((void *)&v10 + 1) + 8 * i);
        [v7 _addToState:v2, v10];
      }
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v23 count:16];
    }
    while (v4);
  }

  CFStringRef v21 = @"BCFutureValueThreadingState";
  v22 = v2;
  v8 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  _Block_object_dispose(&v15, 8);

  return v8;
}

- (void)_addToState:(id)a3
{
  id v4 = a3;
  sync = self->_sync;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1680C0;
  v7[3] = &unk_2C3AF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(sync, v7);
}

- (BCFutureValue)init
{
  v11.receiver = self;
  v11.super_class = (Class)BCFutureValue;
  dispatch_queue_t v2 = [(BCFutureValue *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("BCFutureValue", 0);
    sync = v2->_sync;
    v2->_sync = (OS_dispatch_queue *)v3;

    uint64_t v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    waitingBlocks = v2->_waitingBlocks;
    v2->_waitingBlocks = v5;

    id v7 = qword_349460;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_168334;
    block[3] = &unk_2C3C50;
    long long v10 = v2;
    dispatch_sync(v7, block);
  }
  return v2;
}

- (BCFutureValue)initWithValue:(id)a3
{
  id v5 = a3;
  id v6 = [(BCFutureValue *)self init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_value, a3);
    v7->_hasValue = 1;
  }

  return v7;
}

- (void)dealloc
{
  if (![(BCFutureValue *)self hasValue] && ![(BCFutureValue *)self cancelled])
  {
    [(BCFutureValue *)self setCancelled:1];
    dispatch_queue_t v3 = [(BCFutureValue *)self waitingBlocks];
    id v4 = [v3 copy];

    id v5 = [(BCFutureValue *)self waitingBlocks];
    [v5 removeAllObjects];

    if (v4)
    {
      id v6 = +[NSError errorWithDomain:@"BCFutureErrorDomain" code:1 userInfo:0];
      [(BCFutureValue *)self _notifyBlocks:v4 withValue:0 error:v6];
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1684E4;
  block[3] = &unk_2C3C50;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)qword_349460, block);
  v7.receiver = self;
  v7.super_class = (Class)BCFutureValue;
  [(BCFutureValue *)&v7 dealloc];
}

- (void)cancel
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = sub_1676D4;
  objc_super v11 = sub_1676E4;
  id v12 = 0;
  sync = self->_sync;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_16862C;
  v6[3] = &unk_2C6758;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(sync, v6);
  uint64_t v4 = v8[5];
  if (v4)
  {
    id v5 = +[NSError errorWithDomain:@"BCFutureErrorDomain" code:1 userInfo:0];
    [(BCFutureValue *)self _notifyBlocks:v4 withValue:0 error:v5];
  }
  _Block_object_dispose(&v7, 8);
}

+ (void)futures:(id)a3 notify:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = dispatch_group_create();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v15 = v5;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v12);
          dispatch_group_enter(v7);
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_16889C;
          v16[3] = &unk_2CA8D0;
          uint64_t v17 = v7;
          [v13 get:v16];

          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    v14 = dispatch_get_global_queue(0, 0);
    dispatch_group_notify(v7, v14, v6);

    id v5 = v15;
  }
}

- (id)getNonBlockingError:(id *)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1676D4;
  uint64_t v11 = sub_1676E4;
  id v12 = 0;
  sync = self->_sync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_168998;
  block[3] = &unk_2C66C0;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(sync, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)get
{
  id v15 = 0;
  uint64_t v16 = 0;
  backtrace(&v15, 2);
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_1676D4;
  long long v13 = sub_1676E4;
  id v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_168B68;
  v6[3] = &unk_2CA8F8;
  dispatch_queue_t v3 = dispatch_semaphore_create(0);
  uint64_t v7 = v3;
  id v8 = &v9;
  [(BCFutureValue *)self _get:v6 caller:v16];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

- (id)sq_get:(id)a3 caller:(void *)a4 value:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  if ([(BCFutureValue *)self hasValue])
  {
    if (a5)
    {
      *a5 = [(BCFutureValue *)self value];
    }
    if (a6)
    {
      uint64_t v11 = [(BCFutureValue *)self error];
LABEL_11:
      id v12 = 0;
      *a6 = v11;
      goto LABEL_14;
    }
LABEL_12:
    id v12 = 0;
    goto LABEL_14;
  }
  if ([(BCFutureValue *)self cancelled])
  {
    if (a5) {
      *a5 = 0;
    }
    if (a6)
    {
      uint64_t v11 = +[NSError errorWithDomain:@"BCFutureErrorDomain" code:1 userInfo:0];
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v12 = objc_opt_new();
  [v12 setBlock:v10];
  [v12 setCaller:a4];
  long long v13 = [(BCFutureValue *)self waitingBlocks];
  [v13 addObject:v12];

LABEL_14:

  return v12;
}

- (void)get:(id)a3
{
  if (a3)
  {
    id v5 = 0;
    uint64_t v6 = 0;
    id v4 = a3;
    backtrace(&v5, 2);
    [(BCFutureValue *)self _get:v4 caller:v6];
  }
}

- (void)_get:(id)a3 caller:(void *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = sub_1676D4;
    v30 = sub_1676E4;
    id v31 = 0;
    uint64_t v20 = 0;
    long long v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = sub_1676D4;
    v24 = sub_1676E4;
    id v25 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    sync = self->_sync;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_168F44;
    v10[3] = &unk_2CA920;
    id v12 = &v16;
    v10[4] = self;
    id v9 = v6;
    id v11 = v9;
    long long v13 = &v20;
    id v14 = &v26;
    id v15 = a4;
    dispatch_sync(sync, v10);
    if (*((unsigned char *)v17 + 24)) {
      (*((void (**)(id, uint64_t, uint64_t))v9 + 2))(v9, v21[5], v27[5]);
    }

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
  }
}

- (void)getBefore:(unint64_t)a3 block:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v33 = 0;
    uint64_t v34 = 0;
    backtrace(&v33, 2);
    uint64_t v7 = v34;
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = sub_1676D4;
    id v31 = sub_1676E4;
    id v32 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = sub_1676D4;
    id v25 = sub_1676E4;
    id v26 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    sync = self->_sync;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_169200;
    v10[3] = &unk_2CA948;
    v10[4] = self;
    id v12 = &v27;
    long long v13 = &v21;
    id v14 = &v17;
    unint64_t v15 = a3;
    id v9 = v6;
    id v11 = v9;
    uint64_t v16 = v7;
    dispatch_sync(sync, v10);
    if (*((unsigned char *)v18 + 24)) {
      (*((void (**)(id, uint64_t, uint64_t))v9 + 2))(v9, v28[5], v22[5]);
    }

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
  }
}

- (void)_notifyBlocks:(id)a3 withValue:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v7);
        }
        id v14 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v13) block];
        ((void (**)(void, id, id))v14)[2](v14, v8, v9);

        long long v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (OS_dispatch_queue)sync
{
  return self->_sync;
}

- (void)setSync:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)hasValue
{
  return self->_hasValue;
}

- (void)setHasValue:(BOOL)a3
{
  self->_hasValue = a3;
}

- (NSMutableArray)waitingBlocks
{
  return self->_waitingBlocks;
}

- (void)setWaitingBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingBlocks, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_sync, 0);
}

@end