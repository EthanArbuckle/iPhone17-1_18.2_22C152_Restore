@interface VMTelephonyRequestController
- (NSMapTable)delegateToQueue;
- (NSMutableOrderedSet)requests;
- (OS_dispatch_queue)queue;
- (VMTelephonyRequest)pendingRequest;
- (VMTelephonyRequestController)init;
- (VMTelephonyRequestController)initWithQueue:(id)a3;
- (os_unfair_lock_s)accessorLock;
- (os_unfair_lock_s)delegateLock;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)addRequest:(id)a3;
- (void)execute;
- (void)executeRequest:(id)a3;
- (void)performAtomicAccessorBlock:(id)a3;
- (void)performAtomicDelegateBlock:(id)a3;
- (void)postResponse:(id)a3 forRequest:(id)a4;
- (void)removeDelegate:(id)a3;
- (void)removeRequest:(id)a3;
- (void)setPendingRequest:(id)a3;
- (void)setRequests:(id)a3;
@end

@implementation VMTelephonyRequestController

- (VMTelephonyRequestController)init
{
  v3 = objc_msgSend((id)objc_opt_class(), "vm_classIdentifier");
  v4 = NSStringFromSelector("queue");
  v5 = +[NSString stringWithFormat:@"%@.%@", v3, v4];

  v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  id v7 = v5;
  dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 UTF8String], v6);
  v9 = [(VMTelephonyRequestController *)self initWithQueue:v8];

  return v9;
}

- (VMTelephonyRequestController)initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VMTelephonyRequestController;
  v6 = [(VMTelephonyRequestController *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    *(void *)&v6->_accessorLock._os_unfair_lock_opaque = 0;
    uint64_t v8 = +[NSMapTable weakToStrongObjectsMapTable];
    delegateToQueue = v7->_delegateToQueue;
    v7->_delegateToQueue = (NSMapTable *)v8;

    objc_storeStrong((id *)&v7->_queue, a3);
    v10 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    requests = v7->_requests;
    v7->_requests = v10;
  }
  return v7;
}

- (VMTelephonyRequest)pendingRequest
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_100002E70;
  v9 = sub_100002E80;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100002E88;
  v4[3] = &unk_1000C1190;
  v4[4] = self;
  v4[5] = &v5;
  [(VMTelephonyRequestController *)self performAtomicAccessorBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (VMTelephonyRequest *)v2;
}

- (void)setPendingRequest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100002F30;
  v4[3] = &unk_1000C11B8;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(VMTelephonyRequestController *)v5 performAtomicAccessorBlock:v4];
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100003014;
  v9[3] = &unk_1000C11E0;
  v9[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  [(VMTelephonyRequestController *)self performAtomicDelegateBlock:v9];
}

- (void)removeDelegate:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000310C;
  v4[3] = &unk_1000C11B8;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(VMTelephonyRequestController *)v5 performAtomicDelegateBlock:v4];
}

- (void)addRequest:(id)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003250;
  v5[3] = &unk_1000C1208;
  id v6 = self;
  id v4 = a3;
  id v7 = v4;
  id v8 = &v9;
  [(VMTelephonyRequestController *)v6 performAtomicAccessorBlock:v5];
  if (*((unsigned char *)v10 + 24)) {
    [(VMTelephonyRequestController *)self execute];
  }

  _Block_object_dispose(&v9, 8);
}

- (void)removeRequest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003330;
  v4[3] = &unk_1000C11B8;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(VMTelephonyRequestController *)v5 performAtomicAccessorBlock:v4];
}

- (void)execute
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = sub_100002E70;
  id v8 = sub_100002E80;
  id v9 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100003430;
  v3[3] = &unk_1000C1230;
  v3[4] = self;
  v3[5] = &v4;
  [(VMTelephonyRequestController *)self performAtomicAccessorBlock:v3];
  if (v5[5]) {
    -[VMTelephonyRequestController executeRequest:](self, "executeRequest:");
  }
  _Block_object_dispose(&v4, 8);
}

- (void)executeRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [VMTelephonyResponse alloc];
  uint64_t v6 = [v4 subscription];
  id v7 = [(VMTelephonyResponse *)v5 initWithSubscription:v6 error:0];

  [(VMTelephonyRequestController *)self postResponse:v7 forRequest:v4];
}

- (void)postResponse:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100003690;
  v13[3] = &unk_1000C11B8;
  v13[4] = self;
  id v7 = a4;
  id v14 = v7;
  [(VMTelephonyRequestController *)self performAtomicAccessorBlock:v13];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000036E8;
  v10[3] = &unk_1000C11E0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(VMTelephonyRequestController *)self performAtomicDelegateBlock:v10];
  [(VMTelephonyRequestController *)self execute];
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
    uint64_t v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2, self, @"VMTelephonyRequestController.m", 164, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
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
    uint64_t v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2, self, @"VMTelephonyRequestController.m", 176, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
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

- (NSMutableOrderedSet)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);
}

@end