@interface MZAsynchronousTask
- (BOOL)taskInvalidationDisabled;
- (MZAsynchronousTask)initWithHandlerQueue:(id)a3 taskTimeout:(double)a4 assertionTimeout:(double)a5 debugDescription:(id)a6;
- (MZTaskAssertion)taskAssertion;
- (NSError)error;
- (NSMutableArray)completions;
- (NSString)taskDebugDescription;
- (OS_dispatch_queue)handlerQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)assertionTimeoutTimer;
- (OS_dispatch_source)taskTimeoutTimer;
- (double)assertionTimeout;
- (double)taskTimeout;
- (id)description;
- (id)expirationHandler;
- (id)finishedHandler;
- (id)result;
- (int)cancelType;
- (void)_invalidateAssertionTimer;
- (void)_invalidateTaskAssertionForced:(BOOL)a3;
- (void)_invalidateTaskTimer;
- (void)_onQueueFireExpirationHandlerIfNecesary;
- (void)addTaskCompletionBlock:(id)a3;
- (void)beginTaskOperation;
- (void)dealloc;
- (void)endTaskOperation;
- (void)finishTaskOperationWithResult:(id)a3 error:(id)a4;
- (void)invalidate;
- (void)invokeTaskCompletionBlocksWithBlock:(id)a3;
- (void)setAssertionTimeout:(double)a3;
- (void)setAssertionTimeoutTimer:(id)a3;
- (void)setCancelType:(int)a3;
- (void)setCompletions:(id)a3;
- (void)setError:(id)a3;
- (void)setExpirationHandler:(id)a3;
- (void)setFinishedHandler:(id)a3;
- (void)setHandlerQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResult:(id)a3;
- (void)setTaskAssertion:(id)a3;
- (void)setTaskDebugDescription:(id)a3;
- (void)setTaskInvalidationDisabled:(BOOL)a3;
- (void)setTaskTimeout:(double)a3;
- (void)setTaskTimeoutTimer:(id)a3;
@end

@implementation MZAsynchronousTask

- (MZAsynchronousTask)initWithHandlerQueue:(id)a3 taskTimeout:(double)a4 assertionTimeout:(double)a5 debugDescription:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v34.receiver = self;
  v34.super_class = (Class)MZAsynchronousTask;
  v13 = [(MZAsynchronousTask *)&v34 init];
  v14 = v13;
  if (v13)
  {
    if (a5 > a4) {
      a5 = a4;
    }
    objc_storeStrong((id *)&v13->_handlerQueue, a3);
    dispatch_queue_t v15 = dispatch_queue_create(0, 0);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v15;

    double v17 = a4 - a5;
    if (a4 - a5 < 0.00000011920929) {
      a5 = *(double *)&qword_10061A940;
    }
    v18 = +[NSMutableArray array];
    [(MZAsynchronousTask *)v14 setCompletions:v18];

    [(MZAsynchronousTask *)v14 setTaskDebugDescription:v12];
    v14->_taskTimeout = a4;
    v19 = dispatch_queue_create(0, 0);
    dispatch_source_t v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v19);
    taskTimeoutTimer = v14->_taskTimeoutTimer;
    v14->_taskTimeoutTimer = (OS_dispatch_source *)v20;

    dispatch_source_set_timer((dispatch_source_t)v14->_taskTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v22 = v14->_taskTimeoutTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000975C4;
    handler[3] = &unk_10054D570;
    v23 = v14;
    v33 = v23;
    dispatch_source_set_event_handler(v22, handler);
    dispatch_resume((dispatch_object_t)v14->_taskTimeoutTimer);
    *((double *)v23 + 13) = a5;
    dispatch_source_t v24 = v23[14];
    v23[14] = 0;

    if (*((double *)v23 + 13) != *(double *)&qword_10061A940)
    {
      *((double *)v23 + 13) = a5;
      v25 = dispatch_queue_create(0, 0);
      dispatch_source_t v26 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v25);
      dispatch_source_t v27 = v23[14];
      v23[14] = v26;

      dispatch_source_set_timer(v23[14], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      v28 = v23[14];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100097680;
      v30[3] = &unk_10054D570;
      v31 = v23;
      dispatch_source_set_event_handler(v28, v30);
      dispatch_resume(v23[14]);
    }
  }

  return v14;
}

- (void)dealloc
{
  v3 = _MTLogCategoryAsyncTask();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "dealloc task: %@", buf, 0xCu);
  }

  [(MZAsynchronousTask *)self _invalidateTaskTimer];
  [(MZAsynchronousTask *)self _invalidateAssertionTimer];
  v4.receiver = self;
  v4.super_class = (Class)MZAsynchronousTask;
  [(MZAsynchronousTask *)&v4 dealloc];
}

- (void)_invalidateTaskTimer
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100097880;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_invalidateAssertionTimer
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100097968;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)MZAsynchronousTask;
  v3 = [(MZAsynchronousTask *)&v7 description];
  objc_super v4 = [(MZAsynchronousTask *)self taskDebugDescription];
  v5 = +[NSString stringWithFormat:@"%@ '%@'", v3, v4];

  return v5;
}

- (void)setExpirationHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100097B18;
  v7[3] = &unk_10054E398;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (id)expirationHandler
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100056F00;
  v10 = sub_100057258;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100097CFC;
  v5[3] = &unk_10054E2A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = objc_retainBlock((id)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setFinishedHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100097DE0;
  v7[3] = &unk_10054E398;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (id)finishedHandler
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100056F00;
  v10 = sub_100057258;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100097FC4;
  v5[3] = &unk_10054E2A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = objc_retainBlock((id)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_onQueueFireExpirationHandlerIfNecesary
{
  id v3 = objc_retainBlock(self->_expirationHandler);
  if (v3)
  {
    id expirationHandler = self->_expirationHandler;
    self->_id expirationHandler = 0;

    int cancelType = self->_cancelType;
    handlerQueue = self->_handlerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000980D0;
    block[3] = &unk_10054F2B8;
    block[4] = self;
    int v9 = cancelType;
    id v8 = v3;
    dispatch_async(handlerQueue, block);
  }
}

- (void)setCancelType:(int)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100098210;
  v4[3] = &unk_10054F2E0;
  int v5 = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

- (int)cancelType
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000982E8;
  v5[3] = &unk_10054E2A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setResult:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100098394;
  v7[3] = &unk_10054D9B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (id)result
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = sub_100098490;
  v10 = sub_1000984A0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000984A8;
  v5[3] = &unk_10054E2A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100098554;
  v7[3] = &unk_10054D9B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (NSError)error
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = sub_100098490;
  v10 = sub_1000984A0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100098650;
  v5[3] = &unk_10054E2A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

- (void)beginTaskOperation
{
  id v3 = _MTLogCategoryAsyncTask();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "beginTaskOperation %@", buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000987E4;
  v8[3] = &unk_10054D570;
  v8[4] = self;
  id v4 = [(MZAsynchronousTask *)self description];
  id v5 = +[MZTaskAssertion newBackgroundTaskWithExpirationHandler:v8 debugInfo:v4];
  [(MZAsynchronousTask *)self setTaskAssertion:v5];

  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009882C;
  v7[3] = &unk_10054D570;
  v7[4] = self;
  dispatch_sync(queue, v7);
}

- (void)finishTaskOperationWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MZAsynchronousTask *)self setResult:v6];
  [(MZAsynchronousTask *)self setError:v7];
  [(MZAsynchronousTask *)self setExpirationHandler:0];
  handlerQueue = self->_handlerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100098A88;
  block[3] = &unk_10054E708;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(handlerQueue, block);
}

- (void)endTaskOperation
{
  [(MZAsynchronousTask *)self finishTaskOperationWithResult:0 error:0];

  [(MZAsynchronousTask *)self invalidate];
}

- (void)_invalidateTaskAssertionForced:(BOOL)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_100098490;
  v14 = sub_1000984A0;
  id v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100098D54;
  block[3] = &unk_10054E2D0;
  BOOL v9 = a3;
  block[4] = self;
  void block[5] = &v10;
  dispatch_sync(queue, block);
  id v5 = (void *)v11[5];
  if (v5)
  {
    [v5 invalidate];
    id v6 = _MTLogCategoryAsyncTask();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v11[5];
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Releasing the background task assertion %@ for task: %@.", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v10, 8);
}

- (void)invalidate
{
  [(MZAsynchronousTask *)self _invalidateTaskTimer];
  [(MZAsynchronousTask *)self setExpirationHandler:0];
  [(MZAsynchronousTask *)self setFinishedHandler:0];

  [(MZAsynchronousTask *)self _invalidateTaskAssertionForced:0];
}

- (void)addTaskCompletionBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_retainBlock(v4);
    id v9 = [v6 copy];

    uint64_t v7 = [(MZAsynchronousTask *)self completions];
    id v8 = objc_retainBlock(v9);
    [v7 addObject:v8];
  }
}

- (void)invokeTaskCompletionBlocksWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MZAsynchronousTask *)self completions];
  id v6 = [v5 copy];

  [(MZAsynchronousTask *)self setCompletions:0];
  uint64_t v7 = [(MZAsynchronousTask *)self result];
  id v8 = [(MZAsynchronousTask *)self error];
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100099104;
  block[3] = &unk_10054DF08;
  block[4] = self;
  void block[5] = v21;
  dispatch_sync(queue, block);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10009914C;
  v15[3] = &unk_10054F330;
  uint64_t v10 = dispatch_group_create();
  v16 = v10;
  id v11 = v4;
  id v19 = v11;
  id v12 = v7;
  id v17 = v12;
  id v13 = v8;
  id v18 = v13;
  [v6 enumerateObjectsUsingBlock:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000992A8;
  v14[3] = &unk_10054E2A8;
  v14[4] = self;
  v14[5] = v21;
  dispatch_group_notify(v10, (dispatch_queue_t)&_dispatch_main_q, v14);

  _Block_object_dispose(v21, 8);
}

- (NSString)taskDebugDescription
{
  return self->_taskDebugDescription;
}

- (void)setTaskDebugDescription:(id)a3
{
}

- (MZTaskAssertion)taskAssertion
{
  return self->_taskAssertion;
}

- (void)setTaskAssertion:(id)a3
{
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (void)setCompletions:(id)a3
{
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)taskInvalidationDisabled
{
  return self->_taskInvalidationDisabled;
}

- (void)setTaskInvalidationDisabled:(BOOL)a3
{
  self->_taskInvalidationDisabled = a3;
}

- (double)taskTimeout
{
  return self->_taskTimeout;
}

- (void)setTaskTimeout:(double)a3
{
  self->_taskTimeout = a3;
}

- (OS_dispatch_source)taskTimeoutTimer
{
  return self->_taskTimeoutTimer;
}

- (void)setTaskTimeoutTimer:(id)a3
{
}

- (double)assertionTimeout
{
  return self->_assertionTimeout;
}

- (void)setAssertionTimeout:(double)a3
{
  self->_assertionTimeout = a3;
}

- (OS_dispatch_source)assertionTimeoutTimer
{
  return self->_assertionTimeoutTimer;
}

- (void)setAssertionTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_taskTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_taskAssertion, 0);
  objc_storeStrong((id *)&self->_taskDebugDescription, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong(&self->_finishedHandler, 0);

  objc_storeStrong(&self->_expirationHandler, 0);
}

@end