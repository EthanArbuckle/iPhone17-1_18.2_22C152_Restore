@interface BSUIVideoStateProvider
+ (id)sharedInstance;
- (BOOL)captionsEnabled;
- (BSUIVideoStateProvider)init;
- (NSMutableSet)weakObservers;
- (void)addWeakObserver:(id)a3;
- (void)manager:(id)a3 didSetCaptions:(BOOL)a4;
- (void)setWeakObservers:(id)a3;
@end

@implementation BSUIVideoStateProvider

- (BSUIVideoStateProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)BSUIVideoStateProvider;
  v2 = [(BSUIVideoStateProvider *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    weakObservers = v2->_weakObservers;
    v2->_weakObservers = v3;

    v2->_observerAccessLock._os_unfair_lock_opaque = 0;
    v5 = +[BSUITemplate manager];
    v6 = [v5 videoPlayerManager];
    [v6 addObserver:v2];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_3D4108 != -1) {
    dispatch_once(&qword_3D4108, &stru_38EA48);
  }
  v2 = (void *)qword_3D4100;

  return v2;
}

- (BOOL)captionsEnabled
{
  v2 = +[BSUITemplate manager];
  v3 = [v2 videoPlayerManager];
  unsigned __int8 v4 = [v3 captionsEnabledForActivePlayer];

  return v4;
}

- (void)addWeakObserver:(id)a3
{
  p_observerAccessLock = &self->_observerAccessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observerAccessLock);
  v6 = [(BSUIVideoStateProvider *)self weakObservers];
  v7 = +[JSManagedValue managedValueWithValue:v5];

  [v6 addObject:v7];

  os_unfair_lock_unlock(p_observerAccessLock);
}

- (void)manager:(id)a3 didSetCaptions:(BOOL)a4
{
  BOOL v4 = a4;
  p_observerAccessLock = &self->_observerAccessLock;
  os_unfair_lock_lock(&self->_observerAccessLock);
  v7 = [(BSUIVideoStateProvider *)self weakObservers];
  id v8 = [v7 copy];

  os_unfair_lock_unlock(p_observerAccessLock);
  v25 = +[NSMutableSet set];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v14 = [v13 value:v25];
        if (v14)
        {
          v15 = +[JSABridge sharedInstance];
          v16 = +[NSNumber numberWithBool:v4];
          v36 = v16;
          v17 = +[NSArray arrayWithObjects:&v36 count:1];
          [v15 enqueueValueCall:v14 arguments:v17 file:@"BSUIVideoStateProvider.m" line:76];
        }
        else
        {
          [v25 addObject:v13];
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v10);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v18 = v25;
  id v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * (void)j);
        os_unfair_lock_lock(p_observerAccessLock);
        v24 = [(BSUIVideoStateProvider *)self weakObservers];
        [v24 removeObject:v23];

        os_unfair_lock_unlock(p_observerAccessLock);
      }
      id v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v20);
  }
}

- (NSMutableSet)weakObservers
{
  return self->_weakObservers;
}

- (void)setWeakObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end