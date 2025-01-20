@interface DMDAppLifeCycle
+ (id)_lifeCycleByBundleIdentifier;
+ (id)lifeCycleForBundleIdentifier:(id)a3;
+ (void)_removeLifeCycleForBundleIdentifier:(id)a3;
- (BOOL)_isInTransitoryState;
- (BOOL)_isStale;
- (BOOL)_isUnchangedForInterval:(double)a3;
- (CATStateMachine)stateMachine;
- (DMDAppLifeCycle)initWithBundleIdentifier:(id)a3;
- (DMDAppLifeCycle)initWithBundleIdentifier:(id)a3 currentState:(unint64_t)a4;
- (NSDate)lastModified;
- (NSOperationQueue)queue;
- (NSPointerArray)observers;
- (NSProgress)progress;
- (NSString)bundleIdentifier;
- (NSString)currentStateName;
- (unint64_t)currentState;
- (void)_updateLastModified;
- (void)addObserver:(id)a3;
- (void)cancelAndWaitUntilAllOperationsAreFinished;
- (void)didCancelInstalling;
- (void)didCancelUpdating;
- (void)didChangeInstallingProgress;
- (void)didChangeUpdatingProgress;
- (void)didFailInstalling;
- (void)didFailUninstalling;
- (void)didFailUpdating;
- (void)didFinishInstalling;
- (void)didFinishUninstalling;
- (void)didFinishUpdating;
- (void)didPauseInstalling;
- (void)didPauseUpdating;
- (void)didResetState;
- (void)didResumeInstalling;
- (void)didResumeUpdating;
- (void)didStartInstalling;
- (void)didStartUpdating;
- (void)removeObserver:(id)a3;
- (void)setLastModified:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)willStartInstalling;
- (void)willStartUninstalling;
- (void)willStartUpdating;
@end

@implementation DMDAppLifeCycle

+ (id)lifeCycleForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  v6 = [v5 _lifeCycleByBundleIdentifier];
  v7 = [v6 objectForKeyedSubscript:v4];
  if ([v7 _isStale])
  {
    v8 = [v7 observers];
    v9 = DMFAppLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218242;
      id v15 = [v8 count];
      __int16 v16 = 2114;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Preserving %lu observers for bundle ID: %{public}@", (uint8_t *)&v14, 0x16u);
    }

    v10 = DMFAppLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Discard stale app lifecycle for bundle ID: %{public}@", (uint8_t *)&v14, 0xCu);
    }

LABEL_10:
    id v12 = [objc_alloc((Class)objc_opt_class()) initWithBundleIdentifier:v4];
    v7 = v12;
    if (v8) {
      [v12 setObservers:v8];
    }
    [v6 setObject:v7 forKeyedSubscript:v4];
    [v7 didResetState];
    goto LABEL_13;
  }
  v11 = DMFAppLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Lifecycle is not stale for bundle ID: %{public}@", (uint8_t *)&v14, 0xCu);
  }

  v8 = 0;
  if (!v7) {
    goto LABEL_10;
  }
LABEL_13:

  objc_sync_exit(v5);

  return v7;
}

+ (void)_removeLifeCycleForBundleIdentifier:(id)a3
{
  id v6 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  id v5 = [v4 _lifeCycleByBundleIdentifier];
  [v5 setObject:0 forKeyedSubscript:v6];

  objc_sync_exit(v4);
}

+ (id)_lifeCycleByBundleIdentifier
{
  if (qword_1000FB9B8 != -1) {
    dispatch_once(&qword_1000FB9B8, &stru_1000CA470);
  }
  v2 = (void *)qword_1000FB9B0;

  return v2;
}

- (DMDAppLifeCycle)initWithBundleIdentifier:(id)a3
{
  id v5 = +[NSAssertionHandler currentHandler];
  id v6 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"DMDAppLifeCycle.m", 88, @"%@ must implement %@", self, v6 object file lineNumber description];

  return 0;
}

- (DMDAppLifeCycle)initWithBundleIdentifier:(id)a3 currentState:(unint64_t)a4
{
  id v6 = a3;
  v52.receiver = self;
  v52.super_class = (Class)DMDAppLifeCycle;
  v7 = [(DMDAppLifeCycle *)&v52 init];
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = v8;

    uint64_t v10 = +[NSDate now];
    lastModified = v7->_lastModified;
    v7->_lastModified = (NSDate *)v10;

    uint64_t v12 = +[NSPointerArray weakObjectsPointerArray];
    observers = v7->_observers;
    v7->_observers = (NSPointerArray *)v12;

    uint64_t v14 = objc_opt_new();
    queue = v7->_queue;
    v7->_queue = (NSOperationQueue *)v14;

    __int16 v16 = +[NSString stringWithFormat:@"com.apple.dmd.%@.%p(%@).queue", objc_opt_class(), v7, v6];
    [(NSOperationQueue *)v7->_queue setName:v16];

    [(NSOperationQueue *)v7->_queue setMaxConcurrentOperationCount:1];
    id v17 = (CATStateMachine *)[objc_alloc((Class)CATStateMachine) initWithTarget:v7];
    stateMachine = v7->_stateMachine;
    v7->_stateMachine = v17;

    v19 = v7->_stateMachine;
    +[DMFApp stringForInstallationState:0];
    v20 = id v50 = v6;
    [(CATStateMachine *)v19 addStateWithName:v20];
    v21 = unint64_t v49 = a4;

    v22 = v7->_stateMachine;
    v23 = +[DMFApp stringForInstallationState:1];
    v51 = [(CATStateMachine *)v22 addStateWithName:v23];

    v24 = v7->_stateMachine;
    v25 = +[DMFApp stringForInstallationState:2];
    v26 = [(CATStateMachine *)v24 addStateWithName:v25];

    v27 = v7->_stateMachine;
    v28 = +[DMFApp stringForInstallationState:3];
    v29 = [(CATStateMachine *)v27 addStateWithName:v28];

    v30 = v7->_stateMachine;
    v31 = +[DMFApp stringForInstallationState:4];
    v32 = [(CATStateMachine *)v30 addStateWithName:v31];

    v33 = v7->_stateMachine;
    v34 = +[DMFApp stringForInstallationState:5];
    v35 = [(CATStateMachine *)v33 addStateWithName:v34];

    v36 = v7->_stateMachine;
    v37 = +[DMFApp stringForInstallationState:6];
    v38 = [(CATStateMachine *)v36 addStateWithName:v37];

    v39 = v7->_stateMachine;
    v40 = +[DMFApp stringForInstallationState:7];
    v48 = [(CATStateMachine *)v39 addStateWithName:v40];

    v41 = v7->_stateMachine;
    v42 = +[DMFApp stringForInstallationState:8];
    v43 = [(CATStateMachine *)v41 addStateWithName:v42];

    [v21 addTransitionToState:v51 triggeringEvent:@"willStartInstalling"];
    [v51 addTransitionToState:v26 triggeringEvent:@"didStartInstalling"];
    [v51 addTransitionToState:v21 triggeringEvent:@"didCancelInstalling"];
    [v26 addTransitionToState:v29 triggeringEvent:@"didPauseInstalling"];
    [v26 addTransitionToState:v21 triggeringEvent:@"didCancelInstalling"];
    [v26 addTransitionToState:v21 triggeringEvent:@"didFailInstalling"];
    [v26 addTransitionToState:v32 triggeringEvent:@"didFinishInstalling"];
    [v29 addTransitionToState:v26 triggeringEvent:@"didResumeInstalling"];
    [v29 addTransitionToState:v21 triggeringEvent:@"didCancelInstalling"];
    [v32 addTransitionToState:v35 triggeringEvent:@"willStartUpdating"];
    [v32 addTransitionToState:v43 triggeringEvent:@"willStartUninstalling"];
    [v35 addTransitionToState:v38 triggeringEvent:@"didStartUpdating"];
    [v35 addTransitionToState:v32 triggeringEvent:@"didCancelUpdating"];
    [v38 addTransitionToState:v48 triggeringEvent:@"didPauseUpdating"];
    [v38 addTransitionToState:v32 triggeringEvent:@"didCancelUpdating"];
    [v38 addTransitionToState:v32 triggeringEvent:@"didFailUpdating"];
    [v38 addTransitionToState:v32 triggeringEvent:@"didFinishUpdating"];
    [v43 addTransitionToState:v32 triggeringEvent:@"didFailUninstalling"];
    [v43 addTransitionToState:v21 triggeringEvent:@"didFinishUninstalling"];
    v44 = v7->_stateMachine;
    v45 = +[DMFApp stringForInstallationState:v49];
    v46 = [(CATStateMachine *)v44 stateWithName:v45];
    [(CATStateMachine *)v7->_stateMachine setInitialState:v46];

    id v6 = v50;
    [(CATStateMachine *)v7->_stateMachine setLogLevel:2];
    [(CATStateMachine *)v7->_stateMachine start];
  }
  return v7;
}

- (BOOL)_isStale
{
  unsigned int v3 = [(DMDAppLifeCycle *)self _isInTransitoryState];
  double v4 = 60.0;
  if (v3) {
    double v4 = 10.0;
  }

  return [(DMDAppLifeCycle *)self _isUnchangedForInterval:v4];
}

- (BOOL)_isInTransitoryState
{
  return ([(DMDAppLifeCycle *)self currentState] & 0xFFFFFFFFFFFFFFFBLL) != 0;
}

- (BOOL)_isUnchangedForInterval:(double)a3
{
  double v4 = [(DMDAppLifeCycle *)self lastModified];
  [v4 timeIntervalSinceNow];
  double v6 = -v5;

  return v6 >= a3;
}

- (void)_updateLastModified
{
  id v3 = +[NSDate now];
  [(DMDAppLifeCycle *)self setLastModified:v3];
}

- (unint64_t)currentState
{
  if (qword_1000FB9C8 != -1) {
    dispatch_once(&qword_1000FB9C8, &stru_1000CA490);
  }
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000220A4;
  v8[3] = &unk_1000CA4B8;
  v8[4] = self;
  v8[5] = &v9;
  id v3 = +[NSBlockOperation blockOperationWithBlock:v8];
  double v4 = [(DMDAppLifeCycle *)self queue];
  v13 = v3;
  double v5 = +[NSArray arrayWithObjects:&v13 count:1];
  [v4 addOperations:v5 waitUntilFinished:1];

  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (NSString)currentStateName
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_1000222E4;
  v13 = sub_1000222F4;
  id v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000222FC;
  v8[3] = &unk_1000CA4B8;
  v8[4] = self;
  v8[5] = &v9;
  id v3 = +[NSBlockOperation blockOperationWithBlock:v8];
  double v4 = [(DMDAppLifeCycle *)self queue];
  id v15 = v3;
  double v5 = +[NSArray arrayWithObjects:&v15 count:1];
  [v4 addOperations:v5 waitUntilFinished:1];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSString *)v6;
}

- (void)willStartInstalling
{
  double v4 = [(DMDAppLifeCycle *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100022408;
  v5[3] = &unk_1000CA4E0;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didStartInstalling
{
  double v4 = [(DMDAppLifeCycle *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002263C;
  v5[3] = &unk_1000CA4E0;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didPauseInstalling
{
  double v4 = [(DMDAppLifeCycle *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100022870;
  v5[3] = &unk_1000CA4E0;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didResumeInstalling
{
  double v4 = [(DMDAppLifeCycle *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100022AA4;
  v5[3] = &unk_1000CA4E0;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didCancelInstalling
{
  double v4 = [(DMDAppLifeCycle *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100022CD8;
  v5[3] = &unk_1000CA4E0;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didFailInstalling
{
  double v4 = [(DMDAppLifeCycle *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100022F0C;
  v5[3] = &unk_1000CA4E0;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didFinishInstalling
{
  double v4 = [(DMDAppLifeCycle *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100023140;
  v5[3] = &unk_1000CA4E0;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)willStartUpdating
{
  double v4 = [(DMDAppLifeCycle *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100023374;
  v5[3] = &unk_1000CA4E0;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didStartUpdating
{
  double v4 = [(DMDAppLifeCycle *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000235A8;
  v5[3] = &unk_1000CA4E0;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didPauseUpdating
{
  double v4 = [(DMDAppLifeCycle *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000237DC;
  v5[3] = &unk_1000CA4E0;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didResumeUpdating
{
  double v4 = [(DMDAppLifeCycle *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100023A10;
  v5[3] = &unk_1000CA4E0;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didCancelUpdating
{
  double v4 = [(DMDAppLifeCycle *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100023C44;
  v5[3] = &unk_1000CA4E0;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didFailUpdating
{
  double v4 = [(DMDAppLifeCycle *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100023E78;
  v5[3] = &unk_1000CA4E0;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didFinishUpdating
{
  double v4 = [(DMDAppLifeCycle *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000240AC;
  v5[3] = &unk_1000CA4E0;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)willStartUninstalling
{
  double v4 = [(DMDAppLifeCycle *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000242E0;
  v5[3] = &unk_1000CA4E0;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didFailUninstalling
{
  double v4 = [(DMDAppLifeCycle *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100024514;
  v5[3] = &unk_1000CA4E0;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didFinishUninstalling
{
  double v4 = [(DMDAppLifeCycle *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100024748;
  v5[3] = &unk_1000CA4E0;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  double v5 = [(DMDAppLifeCycle *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002499C;
  v7[3] = &unk_1000C9BE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  double v5 = [(DMDAppLifeCycle *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100024AA4;
  v7[3] = &unk_1000C9BE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (void)didChangeInstallingProgress
{
  id v3 = [(DMDAppLifeCycle *)self queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100024BFC;
  v4[3] = &unk_1000CA508;
  v4[4] = self;
  [v3 addOperationWithBlock:v4];
}

- (void)didChangeUpdatingProgress
{
  id v3 = [(DMDAppLifeCycle *)self queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100024DA8;
  v4[3] = &unk_1000CA508;
  v4[4] = self;
  [v3 addOperationWithBlock:v4];
}

- (void)didResetState
{
  id v3 = DMFAppLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(DMDAppLifeCycle *)self bundleIdentifier];
    double v5 = [(DMDAppLifeCycle *)self observers];
    *(_DWORD *)buf = 138543618;
    uint64_t v10 = v4;
    __int16 v11 = 2048;
    id v12 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Did reset state for lifecycle for bundle ID: %{public}@, observer count = %lu", buf, 0x16u);
  }
  unint64_t v6 = [(DMDAppLifeCycle *)self currentState];
  v7 = [(DMDAppLifeCycle *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100025020;
  v8[3] = &unk_1000CA4E0;
  v8[4] = self;
  v8[5] = v6;
  [v7 addOperationWithBlock:v8];
}

- (void)cancelAndWaitUntilAllOperationsAreFinished
{
  id v2 = [(DMDAppLifeCycle *)self queue];
  [v2 cancelAllOperations];
  [v2 waitUntilAllOperationsAreFinished];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSPointerArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CATStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- (void)setLastModified:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_progress, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end