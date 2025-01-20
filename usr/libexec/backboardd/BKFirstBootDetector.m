@interface BKFirstBootDetector
+ (id)sharedInstance;
- (BKAlternateSystemAppManager)alternateSystemAppManager;
- (BKFirstBootDetector)initWithSystemAppSentinel:(id)a3 firstBootToken:(id)a4 alternateSystemAppManager:(id)a5;
- (BKSystemShellSentinel)systemAppSentinel;
- (BOOL)isFirstBoot;
- (NSString)description;
- (void)_queue_finishBootingIfNecessaryAndTellObservers:(BOOL)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAlternateSystemAppManager:(id)a3;
- (void)setSystemAppSentinel:(id)a3;
- (void)systemShellDidFinishLaunching:(id)a3;
- (void)systemShellWillBootstrap;
@end

@implementation BKFirstBootDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_alternateSystemAppManager, 0);
  objc_storeStrong((id *)&self->_systemShellObserving, 0);
  objc_storeStrong((id *)&self->_lock_firstBootToken, 0);

  objc_storeStrong((id *)&self->_systemAppSentinel, 0);
}

- (void)setAlternateSystemAppManager:(id)a3
{
}

- (BKAlternateSystemAppManager)alternateSystemAppManager
{
  return self->_alternateSystemAppManager;
}

- (void)setSystemAppSentinel:(id)a3
{
}

- (BKSystemShellSentinel)systemAppSentinel
{
  return self->_systemAppSentinel;
}

- (void)_queue_finishBootingIfNecessaryAndTellObservers:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssert();
  if ([(BKFirstBootDetector *)self isFirstBoot])
  {
    v5 = [(BKSystemShellSentinel *)self->_systemAppSentinel primarySystemShell];
    v6 = [(BKAlternateSystemAppManager *)self->_alternateSystemAppManager alternateSystemAppBundleIdentifier];
    if (v5)
    {
      v7 = [v5 bundleIdentifier];
      unsigned __int8 v8 = [v7 isEqualToString:v6];

      if ((v8 & 1) == 0)
      {
        v9 = sub_10005F9DC();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "First boot is finished", buf, 2u);
        }

        os_unfair_lock_lock(&self->_lock);
        [(BKFirstBootTokenProviding *)self->_lock_firstBootToken unsetToken];
        self->_lock_isFirstBoot = 0;
        os_unfair_lock_unlock(&self->_lock);
        if (v3)
        {
          v10 = [(NSHashTable *)self->_queue_observers allObjects];
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          id v11 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v16;
            do
            {
              v14 = 0;
              do
              {
                if (*(void *)v16 != v13) {
                  objc_enumerationMutation(v10);
                }
                [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) firstBootDetectorDidFinishFirstBoot:self];
                v14 = (char *)v14 + 1;
              }
              while (v12 != v14);
              id v12 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
            }
            while (v12);
          }
        }
      }
    }
  }
}

- (void)systemShellWillBootstrap
{
  BOOL v3 = sub_10005F9DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "First boot: systemShellWillBootstrap", v4, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  [(BKFirstBootTokenProviding *)self->_lock_firstBootToken unsetToken];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)systemShellDidFinishLaunching:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052000;
  block[3] = &unk_1000F8E78;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000520A4;
  v7[3] = &unk_1000F8E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100052148;
  v7[3] = &unk_1000F8E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)isFirstBoot
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_isFirstBoot;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)description
{
  BOOL v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendBool:self->_lock_isFirstBoot withName:@"isFirstBoot"];
  id v5 = [v3 appendObject:self->_lock_firstBootToken withName:@"firstBootToken"];
  id v6 = [v3 build];

  return (NSString *)v6;
}

- (BKFirstBootDetector)initWithSystemAppSentinel:(id)a3 firstBootToken:(id)a4 alternateSystemAppManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)BKFirstBootDetector;
  id v12 = [(BKFirstBootDetector *)&v26 init];
  uint64_t v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_systemAppSentinel, a3);
    objc_storeStrong((id *)&v13->_lock_firstBootToken, a4);
    objc_storeStrong((id *)&v13->_alternateSystemAppManager, a5);
    v14 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:517 capacity:2];
    queue_observers = v13->_queue_observers;
    v13->_queue_observers = v14;

    long long v16 = (objc_class *)objc_opt_class();
    long long v17 = NSStringFromClass(v16);
    uint64_t SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)SerialWithQoS;

    unsigned __int8 v20 = [v10 isTokenSet];
    v13->_lock_isFirstBoot = v20;
    v21 = v13->_queue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000523A8;
    v23[3] = &unk_1000F8A48;
    unsigned __int8 v25 = v20;
    v24 = v13;
    dispatch_sync(v21, v23);
  }
  return v13;
}

+ (id)sharedInstance
{
  if (qword_100122F20 != -1) {
    dispatch_once(&qword_100122F20, &stru_1000F6E18);
  }
  v2 = (void *)qword_100122F18;

  return v2;
}

@end