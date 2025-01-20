@interface MRDTaskAssertion
+ (OS_dispatch_queue)workerQueue;
- (BOOL)invalidateInDuration:(double)a3;
- (BOOL)isValid;
- (MRDTaskAssertion)initWithType:(int64_t)a3 pid:(int)a4 bundleID:(id)a5 name:(id)a6;
- (MRDTaskAssertion)initWithType:(int64_t)a3 pid:(int)a4 bundleID:(id)a5 name:(id)a6 invalidationHandler:(id)a7;
- (MRSingleShotTimer)invalidationTimer;
- (NSString)bundleID;
- (NSString)name;
- (RBSAssertion)assertion;
- (RBSAssertion)hostAssertion;
- (double)remainingDuration;
- (id)_assertionForType:(int64_t)a3 pid:(int)a4 bundleID:(id)a5 name:(id)a6;
- (id)_hostAssertionForType:(int64_t)a3 pid:(int)a4 bundleID:(id)a5 name:(id)a6;
- (id)description;
- (id)invalidationHandler;
- (int)pid;
- (int64_t)type;
- (void)_acquire;
- (void)callInvalidationHandlerWithReason:(id)a3;
- (void)dealloc;
- (void)invalidateWithReason:(id)a3;
- (void)setAssertion:(id)a3;
- (void)setHostAssertion:(id)a3;
- (void)setInvalidationTimer:(id)a3;
@end

@implementation MRDTaskAssertion

- (MRDTaskAssertion)initWithType:(int64_t)a3 pid:(int)a4 bundleID:(id)a5 name:(id)a6
{
  return [(MRDTaskAssertion *)self initWithType:a3 pid:*(void *)&a4 bundleID:a5 name:a6 invalidationHandler:0];
}

- (MRDTaskAssertion)initWithType:(int64_t)a3 pid:(int)a4 bundleID:(id)a5 name:(id)a6 invalidationHandler:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v30.receiver = self;
  v30.super_class = (Class)MRDTaskAssertion;
  v15 = [(MRDTaskAssertion *)&v30 init];
  if (v15)
  {
    if (!v12)
    {
      sub_10016A160(v9);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15->_pid = v9;
    objc_storeStrong((id *)&v15->_bundleID, v12);
    v15->_type = a3;
    objc_storeStrong((id *)&v15->_name, a6);
    id v16 = [v14 copy];
    id invalidationHandler = v15->_invalidationHandler;
    v15->_id invalidationHandler = v16;

    uint64_t v18 = [(MRDTaskAssertion *)v15 _assertionForType:a3 pid:v9 bundleID:v12 name:v13];
    assertion = v15->_assertion;
    v15->_assertion = (RBSAssertion *)v18;

    uint64_t v20 = [(MRDTaskAssertion *)v15 _hostAssertionForType:a3 pid:v9 bundleID:v12 name:v13];
    hostAssertion = v15->_hostAssertion;
    v15->_hostAssertion = (RBSAssertion *)v20;

    objc_initWeak(&location, v15);
    v22 = v15->_assertion;
    v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    v26 = sub_10010D8EC;
    v27 = &unk_10041D080;
    objc_copyWeak(&v28, &location);
    [(RBSAssertion *)v22 setInvalidationHandler:&v24];
    [(MRDTaskAssertion *)v15 _acquire];
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (id)_hostAssertionForType:(int64_t)a3 pid:(int)a4 bundleID:(id)a5 name:(id)a6
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a6;
  uint64_t v9 = +[RBSProcessIdentifier identifierWithPid:v6];
  uint64_t v21 = 0;
  v10 = +[RBSProcessHandle handleForIdentifier:v9 error:&v21];
  v11 = [v10 hostProcess];
  id v12 = v11;
  if (!v11 || [v11 pid] == -1)
  {
    v19 = 0;
  }
  else
  {
    id v13 = [v12 bundle];
    uint64_t v14 = [v13 identifier];
    v15 = (void *)v14;
    id v16 = @"none";
    if (v14) {
      id v16 = (__CFString *)v14;
    }
    v17 = v16;

    uint64_t v18 = [v8 stringByAppendingFormat:@" host process: %@(%d)", v17, objc_msgSend(v12, "pid")];
    v19 = -[MRDTaskAssertion _assertionForType:pid:bundleID:name:](self, "_assertionForType:pid:bundleID:name:", self->_type, [v12 pid], v17, v18);
  }

  return v19;
}

- (id)_assertionForType:(int64_t)a3 pid:(int)a4 bundleID:(id)a5 name:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a5;
  id v10 = a6;
  if ((unint64_t)a3 > 8)
  {
    v11 = 0;
  }
  else
  {
    v11 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.mediaremote" name:*(&off_10041D128 + a3)];
  }
  if ((int)v7 < 1)
  {
    id v13 = +[RBSProcessIdentity identityForApplicationJobLabel:v9];
    id v12 = +[RBSTarget targetWithProcessIdentity:v13];
  }
  else
  {
    id v12 = +[RBSTarget targetWithPid:v7];
  }
  id v14 = objc_alloc((Class)RBSAssertion);
  uint64_t v18 = v11;
  v15 = +[NSArray arrayWithObjects:&v18 count:1];
  id v16 = [v14 initWithExplanation:v10 target:v12 attributes:v15];

  return v16;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = self->_type - 1;
  if (v4 > 7) {
    CFStringRef v5 = @"UnknownType";
  }
  else {
    CFStringRef v5 = *(&off_10041D0E8 + v4);
  }
  unint64_t type = self->_type;
  if (type > 8) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = (uint64_t)*(&off_10041D128 + type);
  }
  id v8 = +[NSMutableString stringWithFormat:@"<%@:%p> %@-%u:%@:%@", v3, self, self->_bundleID, self->_pid, v5, v7];
  id v9 = v8;
  if (self->_hostAssertion) {
    [v8 appendFormat:@"hostAssertion=%@", self->_hostAssertion];
  }
  id v10 = self;
  objc_sync_enter(v10);
  invalidationTimer = v10->_invalidationTimer;
  if (invalidationTimer)
  {
    [(MRSingleShotTimer *)invalidationTimer remainingDuration];
    objc_msgSend(v9, "appendFormat:", @"<%lf more seconds", v12);
  }
  objc_sync_exit(v10);

  [v9 appendString:@">"];

  return v9;
}

- (void)dealloc
{
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  [(MRDTaskAssertion *)self invalidateWithReason:@"Dealloc"];
  v4.receiver = self;
  v4.super_class = (Class)MRDTaskAssertion;
  [(MRDTaskAssertion *)&v4 dealloc];
}

- (BOOL)isValid
{
  if ([(RBSAssertion *)self->_assertion isValid]) {
    return 1;
  }
  hostAssertion = self->_hostAssertion;

  return [(RBSAssertion *)hostAssertion isValid];
}

- (void)invalidateWithReason:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = self;
  objc_sync_enter(v5);
  invalidationTimer = v5->_invalidationTimer;
  v5->_invalidationTimer = 0;

  objc_sync_exit(v5);
  [(MRDTaskAssertion *)v5 callInvalidationHandlerWithReason:v4];
  if ([(RBSAssertion *)v5->_assertion isValid])
  {
    uint64_t v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412546;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Releasing assertion %@ %@", (uint8_t *)&v9, 0x16u);
    }

    [(RBSAssertion *)v5->_assertion invalidate];
  }
  if ([(RBSAssertion *)v5->_hostAssertion isValid])
  {
    id v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412546;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Releasing host assertion %@ %@", (uint8_t *)&v9, 0x16u);
    }

    [(RBSAssertion *)v5->_hostAssertion invalidate];
  }
}

- (BOOL)invalidateInDuration:(double)a3
{
  if (a3 > 30.0)
  {
    CFStringRef v5 = _MRLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10032F40C((uint64_t)self, v5, a3);
    }
  }
  uint64_t v6 = self;
  objc_sync_enter(v6);
  unsigned __int8 v7 = [(MRDTaskAssertion *)v6 isValid];
  if (v7)
  {
    [(MRSingleShotTimer *)v6->_invalidationTimer remainingDuration];
    if (v8 < a3)
    {
      invalidationTimer = v6->_invalidationTimer;
      if (invalidationTimer)
      {
        id v10 = _MRLogForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          [(MRSingleShotTimer *)v6->_invalidationTimer remainingDuration];
          *(_DWORD *)buf = 134218242;
          double v20 = v11;
          __int16 v21 = 2112;
          v22 = v6;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Replacing host assertion invalidation timer that was due to fire in %lf seconds %@", buf, 0x16u);
        }

        invalidationTimer = v6->_invalidationTimer;
      }
      v6->_invalidationTimer = 0;

      id v12 = [MRSingleShotTimer alloc];
      id v13 = [(id)objc_opt_class() workerQueue];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10010E21C;
      v18[3] = &unk_10041D0A8;
      v18[4] = v6;
      id v14 = [(MRSingleShotTimer *)v12 initWithInterval:v13 queue:v18 block:a3];
      v15 = v6->_invalidationTimer;
      v6->_invalidationTimer = v14;

      id v16 = _MRLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        double v20 = a3;
        __int16 v21 = 2112;
        v22 = v6;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Setting host assertion invalidation timer to fire in %lf seconds %@", buf, 0x16u);
      }
    }
  }
  objc_sync_exit(v6);

  return v7;
}

- (double)remainingDuration
{
  v2 = self;
  objc_sync_enter(v2);
  [(MRSingleShotTimer *)v2->_invalidationTimer remainingDuration];
  double v4 = v3;
  objc_sync_exit(v2);

  return v4;
}

- (id)invalidationHandler
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [v2->_invalidationHandler copy];
  objc_sync_exit(v2);

  return v3;
}

- (void)callInvalidationHandlerWithReason:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = (void (**)(id, MRDTaskAssertion *, id))[v5->_invalidationHandler copy];
  id invalidationHandler = v5->_invalidationHandler;
  v5->_id invalidationHandler = 0;

  objc_sync_exit(v5);
  if (v6)
  {
    double v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412546;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Calling assertion invalidation handler %@ %@", (uint8_t *)&v9, 0x16u);
    }

    v6[2](v6, v5, v4);
  }
}

+ (OS_dispatch_queue)workerQueue
{
  if (qword_10047E200 != -1) {
    dispatch_once(&qword_10047E200, &stru_10041D0C8);
  }
  v2 = (void *)qword_10047E1F8;

  return (OS_dispatch_queue *)v2;
}

- (void)_acquire
{
  assertion = self->_assertion;
  if (assertion && ([(RBSAssertion *)assertion isValid] & 1) == 0)
  {
    id v4 = self->_assertion;
    id v16 = 0;
    unsigned __int8 v5 = [(RBSAssertion *)v4 acquireWithError:&v16];
    id v6 = v16;
    unsigned __int8 v7 = _MRLogForCategory();
    double v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Acquired assertion: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      sub_10032F508((uint64_t)self, v8);
    }
  }
  hostAssertion = self->_hostAssertion;
  if (hostAssertion && ([(RBSAssertion *)hostAssertion isValid] & 1) == 0)
  {
    id v10 = self->_hostAssertion;
    id v15 = 0;
    unsigned __int8 v11 = [(RBSAssertion *)v10 acquireWithError:&v15];
    id v12 = v15;
    id v13 = _MRLogForCategory();
    id v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Acquired host assertion: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      sub_10032F490((uint64_t)self, v14);
    }
  }
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)name
{
  return self->_name;
}

- (RBSAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (RBSAssertion)hostAssertion
{
  return self->_hostAssertion;
}

- (void)setHostAssertion:(id)a3
{
}

- (MRSingleShotTimer)invalidationTimer
{
  return self->_invalidationTimer;
}

- (void)setInvalidationTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_hostAssertion, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end