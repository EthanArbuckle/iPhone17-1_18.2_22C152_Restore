@interface NRPowerAssertion
+ (id)sharedInstance;
+ (unsigned)takeAssertionWithSuffix:(id)a3;
+ (void)releaseAssertion:(unsigned int)a3;
- (AbstractTimer)assertionLockoutTimer;
- (BOOL)assertionLockoutTimerDidTimeOut;
- (BOOL)containsProcessGroup;
- (NROSTransaction)transaction;
- (NRPowerAssertion)init;
- (NSCountedSet)liveActivities;
- (NSMutableArray)activityGroups;
- (NSMutableDictionary)liveActivityInfos;
- (NSString)assertionSuffix;
- (OS_dispatch_queue)queue;
- (id)addActivityWithName:(id)a3;
- (unsigned)assertion;
- (void)_powerAssertionLockoutTimeout;
- (void)_removeActivityWithUUID:(id)a3;
- (void)addActivityGroup:(id)a3;
- (void)dumpProcesses:(id)a3 isAdded:(BOOL)a4;
- (void)releaseAssertion;
- (void)removeActivityWithUUID:(id)a3;
- (void)renameAssertionWithSuffix:(id)a3;
- (void)setActivityGroups:(id)a3;
- (void)setAssertion:(unsigned int)a3;
- (void)setAssertionLockoutTimer:(id)a3;
- (void)setAssertionLockoutTimerDidTimeOut:(BOOL)a3;
- (void)setAssertionSuffix:(id)a3;
- (void)setLiveActivities:(id)a3;
- (void)setLiveActivityInfos:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTransaction:(id)a3;
- (void)takeAssertion;
@end

@implementation NRPowerAssertion

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100085174;
  block[3] = &unk_100165618;
  block[4] = a1;
  if (qword_1001A11F8 != -1) {
    dispatch_once(&qword_1001A11F8, block);
  }
  v2 = (void *)qword_1001A11F0;

  return v2;
}

- (void)addActivityGroup:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100085244;
  v7[3] = &unk_100165530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (NRPowerAssertion)init
{
  v13.receiver = self;
  v13.super_class = (Class)NRPowerAssertion;
  v2 = [(NRPowerAssertion *)&v13 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    liveActivityInfos = v2->_liveActivityInfos;
    v2->_liveActivityInfos = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSCountedSet set];
    liveActivities = v2->_liveActivities;
    v2->_liveActivities = (NSCountedSet *)v5;

    uint64_t v7 = +[NSMutableArray array];
    activityGroups = v2->_activityGroups;
    v2->_activityGroups = (NSMutableArray *)v7;

    v2->_assertion = 0;
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.nanoregistryd.NRPowerAssertion", v9);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;
  }
  return v2;
}

- (void)dumpProcesses:(id)a3 isAdded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [@"NRPowerAssertion activities: " mutableCopy];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = self->_liveActivityInfos;
  id v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    if (v4) {
      CFStringRef v12 = @"+";
    }
    else {
      CFStringRef v12 = @"-";
    }
    CFStringRef v22 = v12;
    char v13 = 1;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v16 = [(NSMutableDictionary *)self->_liveActivityInfos objectForKeyedSubscript:v15];
        if ((v13 & 1) == 0) {
          [v7 appendString:@", "];
        }
        if (v6 && [v15 isEqual:v6]) {
          [v7 appendString:v22];
        }
        v17 = [v16 name];

        if (v17)
        {
          v18 = [v16 name];
          [v7 appendString:v18];
        }
        char v13 = 0;
      }
      id v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
      char v13 = 0;
    }
    while (v10);
  }

  v19 = nr_daemon_log();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

  if (v20)
  {
    v21 = nr_daemon_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v7;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }
}

- (BOOL)containsProcessGroup
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = self->_activityGroups;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "isSubsetOfSet:", self->_liveActivities, (void)v10))
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (id)addActivityWithName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100085870;
  v16 = sub_100085880;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100085888;
  block[3] = &unk_100165508;
  block[4] = self;
  id v10 = v4;
  long long v11 = &v12;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

+ (unsigned)takeAssertionWithSuffix:(id)a3
{
  id v3 = a3;
  IOPMAssertionID AssertionID = 0;
  if (v3)
  {
    id v4 = [@"com.apple.nanoregistry" stringByAppendingString:@"."];
    id v5 = [v4 stringByAppendingString:v3];
  }
  else
  {
    id v5 = @"com.apple.nanoregistry";
  }
  v22[0] = @"AssertName";
  v22[1] = @"TimeoutSeconds";
  v23[0] = v5;
  v23[1] = &off_100176BC8;
  v22[2] = @"TimeoutAction";
  v22[3] = @"AssertType";
  v23[2] = @"TimeoutActionRelease";
  v23[3] = @"PreventUserIdleSystemSleep";
  CFDictionaryRef v6 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
  uint64_t v7 = IOPMAssertionCreateWithProperties(v6, &AssertionID);
  BOOL v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = +[NSNumber numberWithUnsignedInt:AssertionID];
      uint64_t v12 = +[NSNumber numberWithInt:v7];
      *(_DWORD *)buf = 138412802;
      id v17 = v11;
      __int16 v18 = 2112;
      v19 = v5;
      __int16 v20 = 2114;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "NRPowerAssertion power assertion %@ %@ created status=%{public}@", buf, 0x20u);
    }
  }
  IOPMAssertionID v13 = AssertionID;

  return v13;
}

+ (void)releaseAssertion:(unsigned int)a3
{
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    IOPMAssertionRelease(a3);
    id v4 = nr_daemon_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      CFDictionaryRef v6 = nr_daemon_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = +[NSNumber numberWithUnsignedInt:v3];
        int v8 = 138412290;
        BOOL v9 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NRPowerAssertion power assertion %@ released", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

- (void)takeAssertion
{
  if (!self->_assertion) {
    self->_assertion = [(id)objc_opt_class() takeAssertionWithSuffix:self->_assertionSuffix];
  }
}

- (void)releaseAssertion
{
  [(id)objc_opt_class() releaseAssertion:self->_assertion];
  self->_assertion = 0;
  assertionSuffix = self->_assertionSuffix;
  self->_assertionSuffix = 0;
}

- (void)renameAssertionWithSuffix:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100085F18;
  v7[3] = &unk_100165530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)_powerAssertionLockoutTimeout
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100086020;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_removeActivityWithUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NSMutableDictionary *)self->_liveActivityInfos objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    liveActivities = self->_liveActivities;
    id v8 = [v5 name];
    [(NSCountedSet *)liveActivities removeObject:v8];

    LOBYTE(liveActivities) = [(NRPowerAssertion *)self containsProcessGroup];
    BOOL v9 = [v6 uuid];
    [(NRPowerAssertion *)self dumpProcesses:v9 isAdded:0];

    [(NSMutableDictionary *)self->_liveActivityInfos removeObjectForKey:v4];
    if ((liveActivities & 1) == 0)
    {
      [(NRPowerAssertion *)self releaseAssertion];
      if (self->_assertionLockoutTimer)
      {
        id v10 = nr_daemon_log();
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

        if (v11)
        {
          uint64_t v12 = nr_daemon_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "NRPowerAssertion stopping/resetting lockout timer", buf, 2u);
          }
        }
        [(AbstractTimer *)self->_assertionLockoutTimer invalidate];
        assertionLockoutTimer = self->_assertionLockoutTimer;
        self->_assertionLockoutTimer = 0;
      }
      if (self->_assertionLockoutTimerDidTimeOut)
      {
        uint64_t v14 = nr_daemon_log();
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

        if (v15)
        {
          v16 = nr_daemon_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)CFStringRef v22 = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NRPowerAssertion clearing _assertionLockoutTimerDidTimeOut", v22, 2u);
          }
        }
        self->_assertionLockoutTimerDidTimeOut = 0;
      }
      if (self->_transaction)
      {
        id v17 = nr_daemon_log();
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

        if (v18)
        {
          v19 = nr_daemon_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v21 = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Assertion timer reset! No power assertion called for, NRPowerAssertion releasing transaction", v21, 2u);
          }
        }
        transaction = self->_transaction;
        self->_transaction = 0;
      }
    }
  }
}

- (void)removeActivityWithUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100086454;
    v7[3] = &unk_100165530;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)queue, v7);
  }
}

- (NSMutableDictionary)liveActivityInfos
{
  return self->_liveActivityInfos;
}

- (void)setLiveActivityInfos:(id)a3
{
}

- (NSCountedSet)liveActivities
{
  return self->_liveActivities;
}

- (void)setLiveActivities:(id)a3
{
}

- (NSMutableArray)activityGroups
{
  return self->_activityGroups;
}

- (void)setActivityGroups:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NROSTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (unsigned)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(unsigned int)a3
{
  self->_assertion = a3;
}

- (NSString)assertionSuffix
{
  return self->_assertionSuffix;
}

- (void)setAssertionSuffix:(id)a3
{
}

- (AbstractTimer)assertionLockoutTimer
{
  return self->_assertionLockoutTimer;
}

- (void)setAssertionLockoutTimer:(id)a3
{
}

- (BOOL)assertionLockoutTimerDidTimeOut
{
  return self->_assertionLockoutTimerDidTimeOut;
}

- (void)setAssertionLockoutTimerDidTimeOut:(BOOL)a3
{
  self->_assertionLockoutTimerDidTimeOut = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionLockoutTimer, 0);
  objc_storeStrong((id *)&self->_assertionSuffix, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activityGroups, 0);
  objc_storeStrong((id *)&self->_liveActivities, 0);

  objc_storeStrong((id *)&self->_liveActivityInfos, 0);
}

@end