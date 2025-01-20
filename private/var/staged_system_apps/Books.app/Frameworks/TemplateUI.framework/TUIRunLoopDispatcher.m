@interface TUIRunLoopDispatcher
+ (id)sharedInstance;
+ (int)drainWithTimeout:(double)a3;
+ (void)dispatchAfter:(unint64_t)a3 toMain:(id)a4;
+ (void)dispatchAsyncToMain:(id)a3;
+ (void)dispatchGroup:(id)a3 notifyMain:(id)a4;
- (NSMutableArray)pendingBlocks;
- (OS_dispatch_queue)runLoopDispatchQueue;
- (__CFRunLoop)runLoop;
- (__CFRunLoopSource)runLoopSource;
- (id)initSharedInstance;
- (int)_drainWithTimeout:(double)a3;
- (os_unfair_lock_s)lock;
- (void)_dispatchAfter:(unint64_t)a3 toMain:(id)a4;
- (void)_dispatchAsyncToMain:(id)a3;
- (void)_dispatchGroup:(id)a3 notifyMain:(id)a4;
- (void)_performPendingBlocks;
- (void)dealloc;
@end

@implementation TUIRunLoopDispatcher

+ (id)sharedInstance
{
  if (qword_2DF798 != -1) {
    dispatch_once(&qword_2DF798, &stru_2562F0);
  }
  v2 = (void *)qword_2DF790;

  return v2;
}

- (id)initSharedInstance
{
  v11.receiver = self;
  v11.super_class = (Class)TUIRunLoopDispatcher;
  v2 = [(TUIRunLoopDispatcher *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v10.version = 0;
    memset(&v10.retain, 0, 56);
    v10.info = v2;
    v10.perform = (void (__cdecl *)(void *))j__objc_msgSend__performPendingBlocks;
    v2->_runLoopSource = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &v10);
    CFRunLoopRef Main = CFRunLoopGetMain();
    v3->_runLoop = Main;
    CFRetain(Main);
    CFRunLoopAddSource(v3->_runLoop, v3->_runLoopSource, kCFRunLoopDefaultMode);
    CFRunLoopAddSource(v3->_runLoop, v3->_runLoopSource, (CFRunLoopMode)UITrackingRunLoopMode);
    CFRunLoopAddSource(v3->_runLoop, v3->_runLoopSource, @"com.apple.iBooks.TemplateUI");
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.iBooks.TUIRunLoopDispatcher.runLoopDispatchQueue", v6);
    runLoopDispatchQueue = v3->_runLoopDispatchQueue;
    v3->_runLoopDispatchQueue = (OS_dispatch_queue *)v7;
  }
  return v3;
}

- (void)dealloc
{
  CFRunLoopSourceInvalidate(self->_runLoopSource);
  CFRelease(self->_runLoopSource);
  CFRelease(self->_runLoop);
  v3.receiver = self;
  v3.super_class = (Class)TUIRunLoopDispatcher;
  [(TUIRunLoopDispatcher *)&v3 dealloc];
}

+ (void)dispatchAsyncToMain:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedInstance];
  [v5 _dispatchAsyncToMain:v4];
}

+ (void)dispatchAfter:(unint64_t)a3 toMain:(id)a4
{
  id v6 = a4;
  id v7 = [a1 sharedInstance];
  [v7 _dispatchAfter:a3 toMain:v6];
}

+ (int)drainWithTimeout:(double)a3
{
  id v4 = [a1 sharedInstance];
  int v5 = [v4 _drainWithTimeout:a3];

  return v5;
}

+ (void)dispatchGroup:(id)a3 notifyMain:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 sharedInstance];
  [v8 _dispatchGroup:v7 notifyMain:v6];
}

- (void)_dispatchAsyncToMain:(id)a3
{
  id v9 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableArray *)self->_pendingBlocks count];
  pendingBlocks = self->_pendingBlocks;
  if (!pendingBlocks)
  {
    id v6 = (NSMutableArray *)objc_opt_new();
    id v7 = self->_pendingBlocks;
    self->_pendingBlocks = v6;

    pendingBlocks = self->_pendingBlocks;
  }
  id v8 = objc_retainBlock(v9);
  [(NSMutableArray *)pendingBlocks addObject:v8];

  os_unfair_lock_unlock(&self->_lock);
  if (!v4)
  {
    CFRunLoopSourceSignal(self->_runLoopSource);
    CFRunLoopWakeUp(self->_runLoop);
  }
}

- (void)_dispatchAfter:(unint64_t)a3 toMain:(id)a4
{
  id v6 = a4;
  runLoopDispatchQueue = self->_runLoopDispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_13F7DC;
  v9[3] = &unk_2525D8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_after(a3, runLoopDispatchQueue, v9);
}

- (int)_drainWithTimeout:(double)a3
{
  if (CFRunLoopGetCurrent() == self->_runLoop)
  {
    return CFRunLoopRunInMode(@"com.apple.iBooks.TemplateUI", a3, 1u);
  }
  else
  {
    id v4 = TUIDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_192B28(v4);
    }

    if (_TUIDeviceHasInternalInstall()) {
      objc_exception_throw([objc_alloc((Class)NSException) initWithName:@"InvalidInvocation" reason:@"-drainWithTimeout should be called in main runloop only" userInfo:0]);
    }
    return 1;
  }
}

- (void)_dispatchGroup:(id)a3 notifyMain:(id)a4
{
  id v6 = a4;
  runLoopDispatchQueue = self->_runLoopDispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_13F95C;
  v9[3] = &unk_2525D8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_group_notify((dispatch_group_t)a3, runLoopDispatchQueue, v9);
}

- (void)_performPendingBlocks
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_pendingBlocks;
  pendingBlocks = self->_pendingBlocks;
  self->_pendingBlocks = 0;

  os_unfair_lock_unlock(p_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v10);
        (*(void (**)(uint64_t))(v11 + 16))(v11);
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMutableArray)pendingBlocks
{
  return self->_pendingBlocks;
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (__CFRunLoop)runLoop
{
  return self->_runLoop;
}

- (OS_dispatch_queue)runLoopDispatchQueue
{
  return self->_runLoopDispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runLoopDispatchQueue, 0);

  objc_storeStrong((id *)&self->_pendingBlocks, 0);
}

@end