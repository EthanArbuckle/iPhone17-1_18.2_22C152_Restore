@interface BKAppLaunchCoordinator
- (BKAppLaunchCoordinator)init;
- (BOOL)appLaunchCoordinatorHasAppLaunched;
- (BOOL)appLaunchCoordinatorIsConditionSatisfied:(unint64_t)a3;
- (NSMutableArray)launchBlocks;
- (NSMutableDictionary)coordinators;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (id)_conditionSatisfied:(unint64_t)a3 invalidatingAssertion:(BOOL)a4;
- (id)_onConditionMask:(unint64_t)a3 flags:(unint64_t)a4 blockID:(id)a5 performBlock:(id)a6;
- (id)appLaunchCoordinatorHoldAtConditionAssertion:(unint64_t)a3;
- (id)appLaunchCoordinatorHoldAtLaunchingAssertion;
- (void)_appLaunchCoordinatorOnConditionMask:(unint64_t)a3 flags:(unint64_t)a4 blockID:(id)a5 performBlock:(id)a6;
- (void)_appLaunchCoordinatorOnConditionMask:(unint64_t)a3 timeout:(double)a4 flags:(unint64_t)a5 blockID:(id)a6 performBlock:(id)a7;
- (void)_dispatchBlocks:(id)a3;
- (void)_launchBlockTimedout:(id)a3;
- (void)appLaunchCoordinatorOnConditionMask:(unint64_t)a3 blockID:(id)a4 performBlock:(id)a5;
- (void)appLaunchCoordinatorOnConditionMask:(unint64_t)a3 timeout:(double)a4 blockID:(id)a5 performBlock:(id)a6;
- (void)appLaunchCoordinatorPerformWhenLaunched:(id)a3 block:(id)a4;
- (void)setCoordinators:(id)a3;
- (void)setLaunchBlocks:(id)a3;
- (void)signalConditionSatisfied:(unint64_t)a3;
- (void)signalConditionSatisfied:(unint64_t)a3 blockID:(id)a4 notifyBlock:(id)a5;
- (void)signalConditionSatisfied:(unint64_t)a3 notifyWithTimeout:(double)a4 blockID:(id)a5 block:(id)a6;
@end

@implementation BKAppLaunchCoordinator

- (void)appLaunchCoordinatorPerformWhenLaunched:(id)a3 block:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100051434;
    v8[3] = &unk_100A44638;
    id v9 = v6;
    [(BKAppLaunchCoordinator *)self appLaunchCoordinatorOnConditionMask:32 blockID:a3 performBlock:v8];
  }
}

- (void)_appLaunchCoordinatorOnConditionMask:(unint64_t)a3 flags:(unint64_t)a4 blockID:(id)a5 performBlock:(id)a6
{
  id v10 = a6;
  v11 = v10;
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10005105C;
    v13[3] = &unk_100A4AA90;
    id v14 = v10;
    id v12 = [(BKAppLaunchCoordinator *)self _onConditionMask:a3 flags:a4 blockID:a5 performBlock:v13];
  }
}

- (void)appLaunchCoordinatorOnConditionMask:(unint64_t)a3 blockID:(id)a4 performBlock:(id)a5
{
}

- (id)_onConditionMask:(unint64_t)a3 flags:(unint64_t)a4 blockID:(id)a5 performBlock:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_100078480;
  v29 = sub_100078478;
  id v30 = 0;
  id v12 = [(BKAppLaunchCoordinator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051BA8;
  block[3] = &unk_100A4AAB8;
  v21 = &v31;
  v22 = &v25;
  block[4] = self;
  unint64_t v23 = a3;
  id v13 = v11;
  id v20 = v13;
  unint64_t v24 = a4;
  id v14 = v10;
  id v19 = v14;
  dispatch_sync(v12, block);

  if (v13 && *((unsigned char *)v32 + 24))
  {
    v15 = BCIMLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v36 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "BKAppLaunchCoordinator: running #blockID:'%{public}@'", buf, 0xCu);
    }

    (*((void (**)(id, uint64_t, void))v13 + 2))(v13, 1, 0);
  }
  id v16 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

- (BOOL)appLaunchCoordinatorIsConditionSatisfied:(unint64_t)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v5 = [(BKAppLaunchCoordinator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006CA4;
  block[3] = &unk_100A47CB0;
  block[4] = self;
  void block[5] = &v8;
  block[6] = a3;
  dispatch_sync(v5, block);

  LOBYTE(a3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)_conditionSatisfied:(unint64_t)a3 invalidatingAssertion:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = 1 << a3;
  coordinators = self->_coordinators;
  id v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  uint64_t v10 = [(NSMutableDictionary *)coordinators objectForKeyedSubscript:v9];

  if (v4)
  {
    unint64_t pendingConditionMask = self->_pendingConditionMask;
    if ((pendingConditionMask & v7) != 0)
    {
      self->_unint64_t pendingConditionMask = pendingConditionMask & ~v7;
      goto LABEL_7;
    }
    id v12 = BCIMLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = sub_1000537E8(a3);
      *(_DWORD *)buf = 138412290;
      uint64_t v32 = (uint64_t)v13;
      id v14 = "BKAppLaunchCoordinator: Assertion invalidated but waiting for explicit condition signal: %@";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if ([v10 holdCount])
  {
    self->_pendingConditionMask |= v7;
    id v12 = BCIMLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = sub_1000537E8(a3);
      *(_DWORD *)buf = 138412290;
      uint64_t v32 = (uint64_t)v13;
      id v14 = "BKAppLaunchCoordinator: Condition satisfied but waiting for assertion invalidation: %@";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
    }
LABEL_22:

LABEL_23:
    v28 = 0;
    goto LABEL_26;
  }
LABEL_7:
  unint64_t v15 = v7 & ~self->_currentConditionMask;
  id v16 = BCIMLog();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (!v15)
  {
    if (v17)
    {
      uint64_t v18 = sub_1000537E8(a3);
      id v19 = (void *)v18;
      CFStringRef v20 = @"NO";
      if (v4) {
        CFStringRef v20 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v32 = v18;
      __int16 v33 = 2112;
      CFStringRef v34 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "BKAppLaunchCoordinator: Condition already satisfied: %@, invalidatingAssertion: %@", buf, 0x16u);
    }
    goto LABEL_23;
  }
  if (v17)
  {
    uint64_t v21 = sub_1000537E8(a3);
    v22 = (void *)v21;
    CFStringRef v23 = @"NO";
    if (v4) {
      CFStringRef v23 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v32 = v21;
    __int16 v33 = 2112;
    CFStringRef v34 = v23;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "BKAppLaunchCoordinator: Condition Satisfied: %@, invalidatingAssertion: %@", buf, 0x16u);
  }
  unint64_t v24 = self->_coordinators;
  uint64_t v25 = +[NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)v24 setObject:0 forKeyedSubscript:v25];

  self->_currentConditionMask |= v7;
  launchBlocks = self->_launchBlocks;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100051A7C;
  v30[3] = &unk_100A4AA00;
  v30[4] = self;
  v30[5] = v7;
  uint64_t v27 = [(NSMutableArray *)launchBlocks indexesOfObjectsPassingTest:v30];
  if ([v27 count])
  {
    v28 = [(NSMutableArray *)self->_launchBlocks objectsAtIndexes:v27];
    [(NSMutableArray *)self->_launchBlocks removeObjectsAtIndexes:v27];
  }
  else
  {
    v28 = 0;
  }

LABEL_26:

  return v28;
}

- (void)signalConditionSatisfied:(unint64_t)a3
{
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  kdebug_trace();
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100078480;
  char v11 = sub_100078478;
  id v12 = 0;
  v5 = [(BKAppLaunchCoordinator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000330C8;
  block[3] = &unk_100A47CB0;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(v5, block);

  [(BKAppLaunchCoordinator *)self _dispatchBlocks:v8[5]];
  kdebug_trace();
  _Block_object_dispose(&v7, 8);
}

- (void)_dispatchBlocks:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if ((self->_currentConditionMask & 8) == 0)
  {
    id v6 = 0;
LABEL_5:
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_6;
  }
  uint64_t v7 = [v4 indexesOfObjectsPassingTest:&stru_100A4AA40];
  id v6 = v7;
  if (!v7) {
    goto LABEL_5;
  }
  uint64_t v8 = (uint64_t)[v7 lastIndex];
LABEL_6:
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100050F84;
  v10[3] = &unk_100A4AA68;
  id v11 = v6;
  uint64_t v12 = v8;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v10];
}

- (void)signalConditionSatisfied:(unint64_t)a3 blockID:(id)a4 notifyBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(BKAppLaunchCoordinator *)self signalConditionSatisfied:a3];
  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100051444;
    v10[3] = &unk_100A44638;
    id v11 = v9;
    [(BKAppLaunchCoordinator *)self _appLaunchCoordinatorOnConditionMask:1 << a3 flags:1 blockID:v8 performBlock:v10];
  }
}

- (void)signalConditionSatisfied:(unint64_t)a3 notifyWithTimeout:(double)a4 blockID:(id)a5 block:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  [(BKAppLaunchCoordinator *)self signalConditionSatisfied:a3];
  if (v11)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100078528;
    v12[3] = &unk_100A4AA90;
    id v13 = v11;
    [(BKAppLaunchCoordinator *)self _appLaunchCoordinatorOnConditionMask:1 << a3 timeout:1 flags:v10 blockID:v12 performBlock:a4];
  }
}

- (BKAppLaunchCoordinator)init
{
  v10.receiver = self;
  v10.super_class = (Class)BKAppLaunchCoordinator;
  v2 = [(BKAppLaunchCoordinator *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("BKAppLaunchCoordinator", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_opt_new();
    launchBlocks = v2->_launchBlocks;
    v2->_launchBlocks = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    coordinators = v2->_coordinators;
    v2->_coordinators = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (id)appLaunchCoordinatorHoldAtLaunchingAssertion
{
  return [(BKAppLaunchCoordinator *)self appLaunchCoordinatorHoldAtConditionAssertion:2];
}

- (id)appLaunchCoordinatorHoldAtConditionAssertion:(unint64_t)a3
{
  kdebug_trace();
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  unint64_t v15 = sub_100078480;
  id v16 = sub_100078478;
  id v17 = 0;
  uint64_t v5 = [(BKAppLaunchCoordinator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D838;
  block[3] = &unk_100A4A9B0;
  block[4] = self;
  void block[5] = &v18;
  block[6] = &v12;
  void block[7] = a3;
  dispatch_sync(v5, block);

  if (*((unsigned char *)v19 + 24) && v13[5])
  {
    id v6 = [BKAppLaunchAssertion alloc];
    uint64_t v7 = [(BKAppLaunchCoordinator *)self queue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000156AC;
    v10[3] = &unk_100A47F20;
    void v10[4] = self;
    v10[5] = &v12;
    v10[6] = a3;
    id v8 = [(BKAppLaunchAssertion *)v6 initWithQueue:v7 releaseBlock:v10];
  }
  else
  {
    id v8 = 0;
  }
  kdebug_trace();
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

- (void)_appLaunchCoordinatorOnConditionMask:(unint64_t)a3 timeout:(double)a4 flags:(unint64_t)a5 blockID:(id)a6 performBlock:(id)a7
{
  id v9 = [(BKAppLaunchCoordinator *)self _onConditionMask:a3 flags:a5 blockID:a6 performBlock:a7];
  if (v9)
  {
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001D0C50;
    v11[3] = &unk_100A43DD8;
    v11[4] = self;
    id v12 = v9;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v11);
  }
}

- (NSString)description
{
  unint64_t currentConditionMask = self->_currentConditionMask;
  unint64_t pendingConditionMask = self->_pendingConditionMask;
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = sub_1000536C8(currentConditionMask);
  id v8 = sub_1000536C8(pendingConditionMask);
  id v9 = +[NSString stringWithFormat:@"<%@: %p, currentConditionMask: %@, pendingConditionMask: %@>", v6, self, v7, v8];

  return (NSString *)v9;
}

- (BOOL)appLaunchCoordinatorHasAppLaunched
{
  return [(BKAppLaunchCoordinator *)self appLaunchCoordinatorIsConditionSatisfied:5];
}

- (void)_launchBlockTimedout:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v5 = [(BKAppLaunchCoordinator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D0BD0;
  block[3] = &unk_100A440F8;
  block[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  dispatch_sync(v5, block);

  if (v6 && *((unsigned char *)v13 + 24))
  {
    uint64_t v7 = [v6 block];
    id v8 = (void *)v7;
    if (v7) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, 1, 1);
    }
  }
  _Block_object_dispose(&v12, 8);
}

- (void)appLaunchCoordinatorOnConditionMask:(unint64_t)a3 timeout:(double)a4 blockID:(id)a5 performBlock:(id)a6
{
}

- (NSMutableArray)launchBlocks
{
  return self->_launchBlocks;
}

- (void)setLaunchBlocks:(id)a3
{
}

- (NSMutableDictionary)coordinators
{
  return self->_coordinators;
}

- (void)setCoordinators:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinators, 0);
  objc_storeStrong((id *)&self->_launchBlocks, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end