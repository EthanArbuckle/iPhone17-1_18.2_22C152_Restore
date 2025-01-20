@interface VVMSharedNetworkObserver
+ (id)sharedInstance;
- (BOOL)isNetworkReachable;
- (VVMSharedNetworkObserver)init;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)networkReachabilityChanged:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)startObservingNetworkSync;
- (void)stopObservingNetworkSync;
@end

@implementation VVMSharedNetworkObserver

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006C4D8;
  block[3] = &unk_1000C2A70;
  block[4] = a1;
  if (qword_1000E09A8 != -1) {
    dispatch_once(&qword_1000E09A8, block);
  }
  v2 = (void *)qword_1000E09A0;
  return v2;
}

- (VVMSharedNetworkObserver)init
{
  v9.receiver = self;
  v9.super_class = (Class)VVMSharedNetworkObserver;
  v2 = [(VVMSharedNetworkObserver *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->fLock._os_unfair_lock_opaque = 0;
    v2->fIsObservingNetwork = 0;
    uint64_t v4 = +[NSMapTable weakToWeakObjectsMapTable];
    fDelegates = v3->fDelegates;
    v3->fDelegates = (NSMapTable *)v4;

    v3->fIsNetworkReachable = 0;
    dispatch_queue_t v6 = dispatch_queue_create("VVMSharedNetworkObserverQueue", 0);
    fQueue = v3->fQueue;
    v3->fQueue = (OS_dispatch_queue *)v6;
  }
  return v3;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->fLock);
  [(NSMapTable *)self->fDelegates setObject:v6 forKey:v7];
  [(VVMSharedNetworkObserver *)self startObservingNetworkSync];
  os_unfair_lock_unlock(&self->fLock);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->fLock);
  [(NSMapTable *)self->fDelegates removeObjectForKey:v4];
  if (![(NSMapTable *)self->fDelegates count]) {
    [(VVMSharedNetworkObserver *)self stopObservingNetworkSync];
  }
  os_unfair_lock_unlock(&self->fLock);
}

- (void)startObservingNetworkSync
{
  if (!self->fIsObservingNetwork)
  {
    v3 = +[CPNetworkObserver sharedNetworkObserver];
    self->fIsNetworkReachable = [v3 isNetworkReachable];

    fQueue = self->fQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006C7B4;
    block[3] = &unk_1000C1A98;
    block[4] = self;
    dispatch_async((dispatch_queue_t)fQueue, block);
    self->fIsObservingNetwork = 1;
  }
}

- (void)stopObservingNetworkSync
{
  if (self->fIsObservingNetwork)
  {
    fQueue = self->fQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006C8B0;
    block[3] = &unk_1000C1A98;
    block[4] = self;
    dispatch_async((dispatch_queue_t)fQueue, block);
    self->fIsObservingNetwork = 0;
  }
}

- (void)networkReachabilityChanged:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  unsigned __int8 v6 = [v5 isEqualToString:CPNetworkObserverNetworkReachableNotification];

  if (v6)
  {
    id v7 = [v4 userInfo];
    v8 = [v7 objectForKeyedSubscript:CPNetworkObserverReachable];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v9 = [v8 BOOLValue];
      os_unfair_lock_t lock = &self->fLock;
      os_unfair_lock_lock(&self->fLock);
      self->fIsNetworkReachable = v9;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      obj = self->fDelegates;
      id v10 = [(NSMapTable *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v20;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            v14 = -[NSMapTable objectForKey:](self->fDelegates, "objectForKey:", v13, lock);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10006CBC0;
            block[3] = &unk_1000C1670;
            block[4] = v13;
            unsigned __int8 v18 = v9;
            dispatch_async(v14, block);
          }
          id v10 = [(NSMapTable *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v10);
      }

      os_unfair_lock_unlock(lock);
    }
  }
}

- (BOOL)isNetworkReachable
{
  p_fLock = &self->fLock;
  os_unfair_lock_lock(&self->fLock);
  if (self->fIsObservingNetwork)
  {
    unsigned __int8 fIsNetworkReachable = self->fIsNetworkReachable;
    os_unfair_lock_unlock(p_fLock);
  }
  else
  {
    os_unfair_lock_unlock(p_fLock);
    v5 = +[CPNetworkObserver sharedNetworkObserver];
    unsigned __int8 fIsNetworkReachable = [v5 isNetworkReachable];
  }
  return fIsNetworkReachable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fDelegates, 0);
  objc_storeStrong((id *)&self->fQueue, 0);
}

@end