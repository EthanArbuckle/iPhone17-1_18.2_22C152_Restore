@interface MTBaseProcessor
+ (id)sharedInstance;
+ (void)initialize;
- (BOOL)isRunning;
- (BOOL)isStopping;
- (BOOL)start;
- (MTBaseProcessor)init;
- (MTBaseQueryObserver)queryObserver;
- (MTDefaultsChangeNotifier)defaultsNotifier;
- (NSObject)isStoppingLock;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)timer;
- (double)updatePredicateDuration;
- (id)createQueryObserver;
- (id)defaultPropertiesThatAffectPredicate;
- (id)entityName;
- (id)predicate;
- (void)enqueueWorkBlock:(id)a3;
- (void)results:(id)a3;
- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5;
- (void)setDefaultsNotifier:(id)a3;
- (void)setIsStopping:(BOOL)a3;
- (void)setIsStoppingLock:(id)a3;
- (void)setQueryObserver:(id)a3;
- (void)setTimer:(id)a3;
- (void)stop;
- (void)updatePredicate;
@end

@implementation MTBaseProcessor

- (void)setQueryObserver:(id)a3
{
}

- (MTBaseQueryObserver)queryObserver
{
  return self->_queryObserver;
}

- (id)createQueryObserver
{
  v3 = [MTSafeUuidQueryObserver alloc];
  v4 = [(MTBaseProcessor *)self entityName];
  v5 = [(MTBaseProcessor *)self predicate];
  v6 = [(MTSafeUuidQueryObserver *)v3 initWithEntityName:v4 predicate:v5];

  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E04E0;
  v9[3] = &unk_100550E08;
  objc_copyWeak(&v10, &location);
  id v7 = [(MTSafeUuidQueryObserver *)v6 addResultsChangedHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

+ (id)sharedInstance
{
  v3 = NSStringFromClass((Class)a1);
  id v4 = (id)qword_10060A7D8;
  objc_sync_enter(v4);
  id v5 = [(id)qword_10060A7D8 objectForKey:v3];
  objc_sync_exit(v4);

  if (!v5)
  {
    id v6 = (id)qword_10060A7D8;
    objc_sync_enter(v6);
    id v5 = [(id)qword_10060A7D8 objectForKey:v3];
    if (!v5)
    {
      v8.receiver = a1;
      v8.super_class = (Class)&OBJC_METACLASS___MTBaseProcessor;
      id v5 = objc_msgSend(objc_msgSendSuper2(&v8, "allocWithZone:", 0), "init");
      [(id)qword_10060A7D8 setObject:v5 forKey:v3];
    }
    objc_sync_exit(v6);
  }

  return v5;
}

- (BOOL)start
{
  unsigned __int8 v3 = [(MTBaseProcessor *)self isStopping];
  if ((v3 & 1) == 0)
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    id v6 = +[NSString stringWithFormat:@"%@SerialQueue", v5];

    id v7 = v6;
    objc_super v8 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v7 UTF8String], 0);
    workQueue = self->_workQueue;
    self->_workQueue = v8;

    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100035B94;
    v11[3] = &unk_100550DB8;
    v11[4] = self;
    objc_copyWeak(&v12, &location);
    [(MTBaseProcessor *)self enqueueWorkBlock:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3 ^ 1;
}

- (BOOL)isRunning
{
  if (self->_workQueue) {
    return ![(MTBaseProcessor *)self isStopping];
  }
  else {
    return 0;
  }
}

- (MTBaseProcessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTBaseProcessor;
  v2 = [(MTBaseProcessor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    isStoppingLock = v2->_isStoppingLock;
    v2->_isStoppingLock = v3;

    v2->_isStopping = 0;
  }
  return v2;
}

- (void)enqueueWorkBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MTBaseProcessor *)self workQueue];

  if (v5)
  {
    if (![(MTBaseProcessor *)self isStopping])
    {
      objc_initWeak(buf, self);
      objc_super v8 = [(MTBaseProcessor *)self workQueue];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100035AC0;
      v9[3] = &unk_100550CD8;
      objc_copyWeak(&v11, buf);
      id v10 = v4;
      dispatch_async(v8, v9);

      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
      goto LABEL_10;
    }
    objc_super v6 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      id v7 = "Attempting to enqueue work after the processor has stopped.";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)buf, 2u);
    }
  }
  else
  {
    objc_super v6 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      id v7 = "Attempting to enqueue work before processor has been started.";
      goto LABEL_7;
    }
  }

LABEL_10:
}

- (BOOL)isStopping
{
  v2 = self;
  uint64_t v3 = [(MTBaseProcessor *)self isStoppingLock];
  objc_sync_enter(v3);
  LOBYTE(v2) = v2->_isStopping;
  objc_sync_exit(v3);

  return (char)v2;
}

- (NSObject)isStoppingLock
{
  return self->_isStoppingLock;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

+ (void)initialize
{
  if (qword_10060A7E0 != -1) {
    dispatch_once(&qword_10060A7E0, &stru_100550D90);
  }
}

- (void)stop
{
  [(MTBaseProcessor *)self setIsStopping:1];
  uint64_t v3 = [(MTBaseProcessor *)self queryObserver];
  [v3 stop];

  id v4 = [(MTBaseProcessor *)self defaultsNotifier];
  [v4 stop];
}

- (void)setIsStopping:(BOOL)a3
{
  id obj = [(MTBaseProcessor *)self isStoppingLock];
  objc_sync_enter(obj);
  self->_isStopping = a3;
  objc_sync_exit(obj);
}

- (void)updatePredicate
{
  uint64_t v3 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v8 = 138543362;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ updated predicate", (uint8_t *)&v8, 0xCu);
  }
  objc_super v6 = [(MTBaseProcessor *)self queryObserver];
  id v7 = [(MTBaseProcessor *)self predicate];
  [v6 setPredicate:v7];
}

- (double)updatePredicateDuration
{
  return 0.0;
}

- (id)entityName
{
  id v2 = +[NSException exceptionWithName:NSGenericException reason:@"entityName must be implemented by subclasses" userInfo:0];
  objc_exception_throw(v2);
}

- (id)predicate
{
  id v2 = +[NSException exceptionWithName:NSGenericException reason:@"Predicate must be implemented by subclasses" userInfo:0];
  objc_exception_throw(v2);
}

- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSException exceptionWithName:NSGenericException reason:@"resulstChanged must be implemented by subclasses" userInfo:0];
  objc_exception_throw(v10);
}

- (void)results:(id)a3
{
  id v4 = a3;
  id v5 = [(MTBaseProcessor *)self queryObserver];
  [v5 results:v4];
}

- (id)defaultPropertiesThatAffectPredicate
{
  return 0;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (MTDefaultsChangeNotifier)defaultsNotifier
{
  return self->_defaultsNotifier;
}

- (void)setDefaultsNotifier:(id)a3
{
}

- (void)setIsStoppingLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isStoppingLock, 0);
  objc_storeStrong((id *)&self->_defaultsNotifier, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_queryObserver, 0);
}

@end