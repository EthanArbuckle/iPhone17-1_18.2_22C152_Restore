@interface BABlockQueue
- (BABlockQueue)initWithIdentifier:(id)a3;
- (BOOL)awaitingBlockCompletion;
- (BOOL)consumeToken:(id)a3;
- (BOOL)drainSpecificWithToken:(id)a3;
- (NSLock)blockQueueLock;
- (NSMutableOrderedSet)blockQueue;
- (NSString)identifier;
- (id)__enqueue:(id)a3;
- (unint64_t)queueRetainCount;
- (void)_decrement;
- (void)_dequeueNext;
- (void)_increment;
- (void)dealloc;
- (void)drain;
- (void)enqueue:(id)a3;
- (void)enqueue:(id)a3 waitLimitDate:(id)a4;
- (void)setAwaitingBlockCompletion:(BOOL)a3;
@end

@implementation BABlockQueue

- (BABlockQueue)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BABlockQueue;
  v6 = [(BABlockQueue *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    uint64_t v8 = objc_opt_new();
    blockQueue = v7->_blockQueue;
    v7->_blockQueue = (NSMutableOrderedSet *)v8;

    uint64_t v10 = objc_opt_new();
    blockQueueLock = v7->_blockQueueLock;
    v7->_blockQueueLock = (NSLock *)v10;

    v7->_awaitingBlockCompletion = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(BABlockQueue *)self drain];
  v3.receiver = self;
  v3.super_class = (Class)BABlockQueue;
  [(BABlockQueue *)&v3 dealloc];
}

- (id)__enqueue:(id)a3
{
  id v4 = a3;
  id v5 = 0;
  do
  {
    v6 = v5;
    v7 = [BABlock alloc];
    uint64_t v8 = +[NSUUID UUID];
    id v5 = [(BABlock *)v7 initWithToken:v8 block:v4];

    v9 = [(BABlockQueue *)self blockQueue];
    LOBYTE(v6) = [v9 containsObject:v5];
  }
  while ((v6 & 1) != 0);
  uint64_t v10 = [(BABlockQueue *)self blockQueue];
  [v10 addObject:v5];

  return v5;
}

- (void)enqueue:(id)a3
{
  id v7 = a3;
  id v4 = [(BABlockQueue *)self blockQueueLock];
  [v4 lock];

  id v5 = [(BABlockQueue *)self __enqueue:v7];
  v6 = [(BABlockQueue *)self blockQueueLock];
  [v6 unlock];

  [(BABlockQueue *)self _dequeueNext];
}

- (void)enqueue:(id)a3 waitLimitDate:(id)a4
{
  v6 = (void (**)(id, void, id))a3;
  [a4 timeIntervalSinceNow];
  if (v7 <= 0.0)
  {
    id v18 = +[NSUUID UUID];
    v6[2](v6, 0, v18);
  }
  else
  {
    double v8 = v7;
    qos_class_t v9 = qos_class_self();
    uint64_t v10 = dispatch_get_global_queue(v9, 0);
    v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v10);

    v12 = [(BABlockQueue *)self blockQueueLock];
    [v12 lock];

    objc_super v13 = [(BABlockQueue *)self __enqueue:v6];

    [v13 setFireByTimer:v11];
    v14 = [(BABlockQueue *)self blockQueueLock];
    [v14 unlock];

    dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    dispatch_source_set_timer(v11, v15, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001446C;
    handler[3] = &unk_10005CE30;
    handler[4] = self;
    id v20 = v13;
    v21 = v11;
    v16 = v11;
    id v17 = v13;
    dispatch_source_set_event_handler(v16, handler);
    dispatch_resume(v16);
    [(BABlockQueue *)self _dequeueNext];
  }
}

- (void)_dequeueNext
{
  objc_super v3 = [(BABlockQueue *)self blockQueueLock];
  [v3 lock];

  if ([(BABlockQueue *)self awaitingBlockCompletion]) {
    goto LABEL_5;
  }
  id v4 = [(BABlockQueue *)self blockQueue];
  id v5 = [v4 count];

  if (!v5) {
    goto LABEL_5;
  }
  v6 = [(BABlockQueue *)self blockQueue];
  id v8 = [v6 objectAtIndex:0];

  if (v8)
  {
    [(BABlockQueue *)self setAwaitingBlockCompletion:1];
    [v8 executeWithSuccessfulDequeue:1];
  }
  else
  {
LABEL_5:
    id v8 = 0;
  }
  double v7 = [(BABlockQueue *)self blockQueueLock];
  [v7 unlock];
}

- (BOOL)consumeToken:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = sub_1000147E4;
    v21 = sub_1000147F4;
    id v22 = 0;
    id v5 = [(BABlockQueue *)self blockQueueLock];
    [v5 lock];

    v6 = [(BABlockQueue *)self blockQueue];
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    objc_super v13 = sub_1000147FC;
    v14 = &unk_10005CE58;
    id v15 = v4;
    v16 = &v17;
    [v6 enumerateObjectsUsingBlock:&v11];

    if (v18[5])
    {
      double v7 = [(BABlockQueue *)self blockQueue];
      [v7 removeObject:v18[5]];
    }
    if ([(BABlockQueue *)self awaitingBlockCompletion]) {
      [(BABlockQueue *)self setAwaitingBlockCompletion:0];
    }
    id v8 = [(BABlockQueue *)self blockQueueLock];
    [v8 unlock];

    [(BABlockQueue *)self _dequeueNext];
    BOOL v9 = v18[5] != 0;

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    [(BABlockQueue *)self _dequeueNext];
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)drainSpecificWithToken:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = sub_1000147E4;
    id v22 = sub_1000147F4;
    id v23 = 0;
    id v5 = [(BABlockQueue *)self blockQueueLock];
    [v5 lock];

    v6 = [(BABlockQueue *)self blockQueue];
    uint64_t v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_100014A84;
    id v15 = &unk_10005CE58;
    id v16 = v4;
    uint64_t v17 = &v18;
    [v6 enumerateObjectsUsingBlock:&v12];

    uint64_t v7 = v19[5];
    BOOL v8 = v7 != 0;
    if (v7)
    {
      BOOL v9 = [(BABlockQueue *)self blockQueue];
      [v9 removeObject:v19[5]];

      if ([(BABlockQueue *)self awaitingBlockCompletion]) {
        [(BABlockQueue *)self setAwaitingBlockCompletion:0];
      }
      [(id)v19[5] executeWithSuccessfulDequeue:0];
      uint64_t v10 = [(BABlockQueue *)self blockQueueLock];
      [v10 unlock];
    }
    else
    {
      uint64_t v10 = [(BABlockQueue *)self blockQueueLock];
      [v10 unlock];
    }

    [(BABlockQueue *)self _dequeueNext];
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)drain
{
  objc_super v3 = [(BABlockQueue *)self blockQueueLock];
  [v3 lock];

  id v4 = [(BABlockQueue *)self blockQueue];
  [v4 enumerateObjectsUsingBlock:&stru_10005CE98];

  [(BABlockQueue *)self setAwaitingBlockCompletion:0];
  id v5 = [(BABlockQueue *)self blockQueue];
  [v5 removeAllObjects];

  id v6 = [(BABlockQueue *)self blockQueueLock];
  [v6 unlock];
}

- (void)_increment
{
}

- (void)_decrement
{
  unint64_t queueRetainCount = self->_queueRetainCount;
  if (!queueRetainCount)
  {
    id v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"BABlockQueue retain count is being decremented past 0." userInfo:0];
    objc_exception_throw(v3);
  }
  self->_unint64_t queueRetainCount = queueRetainCount - 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)queueRetainCount
{
  return self->_queueRetainCount;
}

- (NSLock)blockQueueLock
{
  return self->_blockQueueLock;
}

- (NSMutableOrderedSet)blockQueue
{
  return self->_blockQueue;
}

- (BOOL)awaitingBlockCompletion
{
  return self->_awaitingBlockCompletion;
}

- (void)setAwaitingBlockCompletion:(BOOL)a3
{
  self->_awaitingBlockCompletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockQueue, 0);
  objc_storeStrong((id *)&self->_blockQueueLock, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end