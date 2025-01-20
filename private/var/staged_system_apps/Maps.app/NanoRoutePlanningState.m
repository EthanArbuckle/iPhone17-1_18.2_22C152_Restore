@interface NanoRoutePlanningState
+ (BOOL)controlsDiskRouteStorage;
+ (int64_t)requiredInitialStateForRequest:(id)a3;
- (BOOL)isActive;
- (NanoRoutePlanningState)initWithStateManager:(id)a3 isolationQueue:(id)a4;
- (NanoRoutePlanningStateManager)manager;
- (int64_t)sessionState;
- (void)enterToState:(int64_t)a3 fromState:(int64_t)a4;
- (void)leaveToState:(int64_t)a3;
- (void)setActive:(BOOL)a3;
- (void)setManager:(id)a3;
- (void)stop;
@end

@implementation NanoRoutePlanningState

+ (int64_t)requiredInitialStateForRequest:(id)a3
{
  return 1;
}

+ (BOOL)controlsDiskRouteStorage
{
  return 1;
}

- (NanoRoutePlanningState)initWithStateManager:(id)a3 isolationQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NanoRoutePlanningState;
  v8 = [(NanoRoutePlanningState *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_manager, v6);
    v9->_sessionState = -1;
    objc_storeStrong((id *)&v9->_isolationQueue, a4);
  }

  return v9;
}

- (void)enterToState:(int64_t)a3 fromState:(int64_t)a4
{
  self->_sessionState = a3;
  self->_previousState = a4;
  id v6 = sub_1005768D4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = sub_100A34658(a3);
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Entering '%@' state", buf, 0xCu);
  }
  +[NSDate timeIntervalSinceReferenceDate];
  self->_timestampStarted = v8;
  isolationQueue = self->_isolationQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009DBB5C;
  v10[3] = &unk_1012E69C0;
  v10[4] = self;
  v10[5] = a3;
  dispatch_async(isolationQueue, v10);
}

- (void)leaveToState:(int64_t)a3
{
  unint64_t v5 = [(NanoRoutePlanningState *)self sessionState];
  self->_nextState = a3;
  id v6 = sub_1005768D4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = sub_100A34658(v5);
    +[NSDate timeIntervalSinceReferenceDate];
    double v9 = v8 - self->_timestampStarted;
    *(_DWORD *)buf = 138412546;
    v13 = v7;
    __int16 v14 = 2048;
    double v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Leaving '%@' state (active for %#.5lfs)", buf, 0x16u);
  }
  isolationQueue = self->_isolationQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1009DBD74;
  v11[3] = &unk_1012E69C0;
  v11[4] = self;
  v11[5] = v5;
  dispatch_async(isolationQueue, v11);
}

- (void)stop
{
  if (self->_sessionState == 4 && [(id)objc_opt_class() controlsDiskRouteStorage])
  {
    v2 = sub_1005768D4();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Will clear disk route storage", v3, 2u);
    }

    +[NanoRoutePlanningResponse clearDiskRouteStorage];
  }
}

- (void)setActive:(BOOL)a3
{
  isolationQueue = self->_isolationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1009DBF44;
  v4[3] = &unk_1012E6300;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(isolationQueue, v4);
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (BOOL)isActive
{
  return self->_active;
}

- (NanoRoutePlanningStateManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);

  return (NanoRoutePlanningStateManager *)WeakRetained;
}

- (void)setManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);

  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end