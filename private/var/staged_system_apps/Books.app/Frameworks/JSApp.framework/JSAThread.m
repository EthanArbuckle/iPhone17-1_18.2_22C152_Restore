@interface JSAThread
- (BOOL)isRunningOnThread;
- (JSAThread)initWithName:(id)a3;
- (NSMutableArray)pendingBlocks;
- (NSObject)scriptingThreadContext;
- (NSString)name;
- (OS_dispatch_queue)accessQueue;
- (__CFRunLoop)runLoop;
- (__CFRunLoopSource)runLoopSource;
- (int64_t)state;
- (void)_performPendingBlocks;
- (void)_scriptingThreadMain;
- (void)enqueueBlock:(id)a3;
- (void)enqueueBlockSync:(id)a3;
- (void)setAccessQueue:(id)a3;
- (void)setPendingBlocks:(id)a3;
- (void)setRunLoop:(__CFRunLoop *)a3;
- (void)setRunLoopSource:(__CFRunLoopSource *)a3;
- (void)setScriptingThreadContext:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation JSAThread

- (JSAThread)initWithName:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)JSAThread;
  v6 = [(JSAThread *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v8 = objc_alloc_init((Class)NSObject);
    scriptingThreadContext = v7->_scriptingThreadContext;
    v7->_scriptingThreadContext = v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.iBooks.JSAThread", v11);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v12;

    v7->_state = 0;
    uint64_t v14 = +[NSMutableArray array];
    pendingBlocks = v7->_pendingBlocks;
    v7->_pendingBlocks = (NSMutableArray *)v14;
  }
  return v7;
}

- (BOOL)isRunningOnThread
{
  v3 = +[NSThread currentThread];
  v4 = [v3 threadDictionary];
  id v5 = [v4 objectForKeyedSubscript:kScriptingThreadIdentifier];
  LOBYTE(self) = v5 == self->_scriptingThreadContext;

  return (char)self;
}

- (void)enqueueBlock:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  objc_super v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  objc_initWeak(&location, self);
  id v5 = [(JSAThread *)self accessQueue];
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_13FB0;
  v11 = &unk_B2960;
  objc_copyWeak(&v14, &location);
  v13 = &v16;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(v5, &v8);

  uint64_t v7 = v17[3];
  if (v7)
  {
    if (v7 == 2)
    {
      CFRunLoopSourceSignal([(JSAThread *)self runLoopSource]);
      CFRunLoopWakeUp([(JSAThread *)self runLoop]);
    }
  }
  else
  {
    sub_14058((uint64_t)self);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);
}

- (void)enqueueBlockSync:(id)a3
{
  id v4 = a3;
  if ([(JSAThread *)self isRunningOnThread])
  {
    uint64_t v7 = JSALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_85080(v7);
    }

    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s called on its own JSAThread", "-[JSAThread enqueueBlockSync:]");
    id v9 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v8 userInfo:0];

    objc_exception_throw(v9);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1423C;
  v10[3] = &unk_B2988;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  id v12 = v4;
  id v5 = v11;
  id v6 = v4;
  [(JSAThread *)self enqueueBlock:v10];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_performPendingBlocks
{
  uint64_t v16 = 0;
  objc_super v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_14488;
  v20 = sub_14498;
  id v21 = 0;
  id v4 = [(JSAThread *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_144A0;
  block[3] = &unk_B2430;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(v4, block);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = (id)v17[5];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v8);
        (*(void (**)(uint64_t))(v9 + 16))(v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v22 count:16];
    }
    while (v6);
  }

  _Block_object_dispose(&v16, 8);
}

- (void)_scriptingThreadMain
{
  scriptingThreadContext = self->_scriptingThreadContext;
  id v4 = +[NSThread currentThread];
  id v5 = [v4 threadDictionary];
  [v5 setObject:scriptingThreadContext forKeyedSubscript:kScriptingThreadIdentifier];

  context.version = 0;
  memset(&context.retain, 0, 56);
  context.info = self;
  context.perform = (void (__cdecl *)(void *))j__objc_msgSend__performPendingBlocks;
  self->_runLoopSource = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
  Current = CFRunLoopGetCurrent();
  self->_runLoop = Current;
  CFRunLoopAddSource(Current, self->_runLoopSource, kCFRunLoopDefaultMode);
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v7 = [(JSAThread *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_146FC;
  block[3] = &unk_B29B0;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(v7, block);

  if (*((unsigned char *)v12 + 24))
  {
    CFRunLoopSourceSignal(self->_runLoopSource);
    CFRunLoopWakeUp(self->_runLoop);
  }
  CFRunLoopRun();
  v8 = [(JSAThread *)self accessQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1476C;
  v9[3] = &unk_B29B0;
  v9[4] = self;
  v9[5] = &v11;
  dispatch_sync(v8, v9);

  if (*((unsigned char *)v12 + 24)) {
    sub_14058((uint64_t)self);
  }
  _Block_object_dispose(&v11, 8);
}

- (NSString)name
{
  return self->_name;
}

- (NSObject)scriptingThreadContext
{
  return self->_scriptingThreadContext;
}

- (void)setScriptingThreadContext:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSMutableArray)pendingBlocks
{
  return self->_pendingBlocks;
}

- (void)setPendingBlocks:(id)a3
{
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (void)setRunLoopSource:(__CFRunLoopSource *)a3
{
  self->_runLoopSource = a3;
}

- (__CFRunLoop)runLoop
{
  return self->_runLoop;
}

- (void)setRunLoop:(__CFRunLoop *)a3
{
  self->_runLoop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBlocks, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_scriptingThreadContext, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end