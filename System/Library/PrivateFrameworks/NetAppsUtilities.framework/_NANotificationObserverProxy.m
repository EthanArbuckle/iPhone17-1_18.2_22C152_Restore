@interface _NANotificationObserverProxy
- (NSOperationQueue)observerQueue;
- (NSString)notificationName;
- (_NANotificationObserverProxy)initWithWeakObserver:(id)a3 notificationName:(id)a4 observerQueue:(id)a5 observerBlock:(id)a6;
- (id)observerBlock;
- (void)invalidate;
- (void)performObserverBlock;
@end

@implementation _NANotificationObserverProxy

- (_NANotificationObserverProxy)initWithWeakObserver:(id)a3 notificationName:(id)a4 observerQueue:(id)a5 observerBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)_NANotificationObserverProxy;
  v14 = [(_NAObserverProxy *)&v26 initWithWeakObserver:v10];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_notificationName, a4);
    objc_storeStrong((id *)&v15->_observerQueue, a5);
    uint64_t v16 = MEMORY[0x1BA99CF00](v13);
    id observerBlock = v15->_observerBlock;
    v15->_id observerBlock = (id)v16;

    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__2;
    v24[4] = __Block_byref_object_dispose__2;
    v18 = v15;
    v25 = v18;
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __98___NANotificationObserverProxy_initWithWeakObserver_notificationName_observerQueue_observerBlock___block_invoke;
    v23[3] = &unk_1E610A2E8;
    v23[4] = v24;
    uint64_t v20 = [v19 addObserverForName:v11 object:0 queue:v12 usingBlock:v23];
    id notificationObserver = v18->_notificationObserver;
    v18->_id notificationObserver = (id)v20;

    _Block_object_dispose(v24, 8);
  }

  return v15;
}

- (void)performObserverBlock
{
  if ([(_NAObserverProxy *)self isValid])
  {
    id v3 = [(_NAObserverProxy *)self weakObserver];
    (*((void (**)(void))self->_observerBlock + 2))();
  }
}

- (void)invalidate
{
  if (self->_notificationObserver)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_notificationObserver];

    id notificationObserver = self->_notificationObserver;
    self->_id notificationObserver = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_NANotificationObserverProxy;
  [(_NAObserverProxy *)&v5 invalidate];
}

- (NSOperationQueue)observerQueue
{
  return self->_observerQueue;
}

- (id)observerBlock
{
  return self->_observerBlock;
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationName, 0);
  objc_storeStrong(&self->_observerBlock, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong(&self->_notificationObserver, 0);
}

@end