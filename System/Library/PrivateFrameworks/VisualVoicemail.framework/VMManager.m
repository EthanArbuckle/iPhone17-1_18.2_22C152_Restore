@interface VMManager
- (NSMapTable)delegateToQueue;
- (OS_dispatch_queue)queue;
- (VMManager)init;
- (VMManager)initWithQueue:(id)a3;
- (os_unfair_lock_s)accessorLock;
- (os_unfair_lock_s)delegateLock;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)performAtomicAccessorBlock:(id)a3;
- (void)performAtomicDelegateBlock:(id)a3;
- (void)removeDelegate:(id)a3;
@end

@implementation VMManager

- (VMManager)init
{
  v3 = objc_msgSend((id)objc_opt_class(), "vm_classIdentifier");
  v4 = NSStringFromSelector("queue");
  v5 = +[NSString stringWithFormat:@"%@.%@", v3, v4];

  id v6 = v5;
  dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
  v8 = [(VMManager *)self initWithQueue:v7];

  return v8;
}

- (VMManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VMManager;
  id v6 = [(VMManager *)&v11 init];
  dispatch_queue_t v7 = v6;
  if (v6)
  {
    *(void *)&v6->_accessorLock._os_unfair_lock_opaque = 0;
    uint64_t v8 = +[NSMapTable weakToStrongObjectsMapTable];
    delegateToQueue = v7->_delegateToQueue;
    v7->_delegateToQueue = (NSMapTable *)v8;

    objc_storeStrong((id *)&v7->_queue, a3);
  }

  return v7;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001F664;
  v9[3] = &unk_1000C11E0;
  v9[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  [(VMManager *)self performAtomicDelegateBlock:v9];
}

- (void)removeDelegate:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001F75C;
  v4[3] = &unk_1000C11B8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(VMManager *)v5 performAtomicDelegateBlock:v4];
}

- (void)performAtomicAccessorBlock:(id)a3
{
  id v6 = (void (**)(void))a3;
  if (v6)
  {
    os_unfair_lock_lock_with_options();
    v6[2]();
    os_unfair_lock_unlock(&self->_accessorLock);
  }
  else
  {
    id v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2, self, @"VMManager.m", 63, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
}

- (void)performAtomicDelegateBlock:(id)a3
{
  id v6 = (void (**)(void))a3;
  if (v6)
  {
    os_unfair_lock_lock_with_options();
    v6[2]();
    os_unfair_lock_unlock(&self->_delegateLock);
  }
  else
  {
    id v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2, self, @"VMManager.m", 75, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (os_unfair_lock_s)delegateLock
{
  return self->_delegateLock;
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
}

@end