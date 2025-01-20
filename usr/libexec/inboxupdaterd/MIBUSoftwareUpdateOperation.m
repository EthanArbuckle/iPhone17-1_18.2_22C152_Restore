@interface MIBUSoftwareUpdateOperation
- (BOOL)isCommandAllowed:(id)a3;
- (MIBUSUController)suController;
- (MIBUSoftwareUpdateOperation)initWithDelegate:(id)a3;
- (NSDictionary)stateTransitionTable;
- (NSNumber)targetSUBundleSize;
- (NSString)currentBuildVersion;
- (NSString)targetBuildVersion;
- (NSString)targetOSVersion;
- (PCPersistentTimer)installTimer;
- (double)idleTimeInterval;
- (id)_getStateTransitionTable;
- (id)details;
- (id)error;
- (unint64_t)state;
- (void)_cleanup;
- (void)_resume;
- (void)_startInstallTimer;
- (void)_stopInstallTimer;
- (void)_terminateNow;
- (void)_transitionToState:(unint64_t)a3 error:(id *)a4;
- (void)didHandleCommand:(id)a3 withError:(id)a4;
- (void)downloadDidFinishForUpdate:(id)a3;
- (void)handleInstallTimer:(id)a3;
- (void)installDidStartForUpdate:(id)a3;
- (void)scanDidFinishWithResults:(id)a3;
- (void)setCurrentBuildVersion:(id)a3;
- (void)setIdleTimeInterval:(double)a3;
- (void)setInstallTimer:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setStateTransitionTable:(id)a3;
- (void)setSuController:(id)a3;
- (void)setTargetBuildVersion:(id)a3;
- (void)setTargetOSVersion:(id)a3;
- (void)setTargetSUBundleSize:(id)a3;
- (void)updateDidFinishWithError:(id)a3;
@end

@implementation MIBUSoftwareUpdateOperation

- (MIBUSoftwareUpdateOperation)initWithDelegate:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MIBUSoftwareUpdateOperation;
  v3 = [(MIBUOperation *)&v10 initWithDelegate:a3];
  v4 = v3;
  if (v3)
  {
    [(MIBUOperation *)v3 setOpCode:1];
    [(MIBUSoftwareUpdateOperation *)v4 setState:0];
    [(MIBUSoftwareUpdateOperation *)v4 setIdleTimeInterval:300.0];
    [(MIBUSoftwareUpdateOperation *)v4 setInstallTimer:0];
    [(MIBUSoftwareUpdateOperation *)v4 setSuController:0];
    error = v4->_error;
    v4->_error = 0;

    [(MIBUSoftwareUpdateOperation *)v4 setTargetBuildVersion:0];
    [(MIBUSoftwareUpdateOperation *)v4 setTargetOSVersion:0];
    v6 = +[MIBUDeviceController sharedInstance];
    v7 = [v6 buildVersion];
    [(MIBUSoftwareUpdateOperation *)v4 setCurrentBuildVersion:v7];

    [(MIBUSoftwareUpdateOperation *)v4 setTargetSUBundleSize:0];
    v8 = [(MIBUSoftwareUpdateOperation *)v4 _getStateTransitionTable];
    [(MIBUSoftwareUpdateOperation *)v4 setStateTransitionTable:v8];
  }
  return v4;
}

- (void)_resume
{
  v3 = [[MIBUSUController alloc] initWithDelegate:self];
  [(MIBUSoftwareUpdateOperation *)self setSuController:v3];

  v4 = [(MIBUOperation *)self delegate];
  v5 = [v4 nfcController];
  [v5 addObserver:self];

  if ([(MIBUOperation *)self inProgress])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C598);
    }
    v6 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = +[NSString stringWithFormat:@"already in progress; resuming..."];
      *(_DWORD *)buf = 138543618;
      v51 = self;
      __int16 v52 = 2114;
      v53 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
    }
    v9 = +[MIBUDefaultPreferences objectForKey:@"PreviousOSVersion"];
    objc_super v10 = +[MIBUDefaultPreferences objectForKey:@"TargetOSVersion"];
    [(MIBUSoftwareUpdateOperation *)self setTargetBuildVersion:v10];

    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C5B8);
    }
    v11 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = [(MIBUSoftwareUpdateOperation *)self currentBuildVersion];
      [(MIBUSoftwareUpdateOperation *)self targetBuildVersion];
      v46 = uint64_t v45 = (uint64_t)v13;
      v14 = +[NSString stringWithFormat:@"Current build version: %@; target version: %@"];
      *(_DWORD *)buf = 138543618;
      v51 = self;
      __int16 v52 = 2114;
      v53 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
    }
    if (v9
      && ([(MIBUSoftwareUpdateOperation *)self targetBuildVersion],
          v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          v15))
    {
      v16 = [(MIBUSoftwareUpdateOperation *)self currentBuildVersion];
      v17 = [(MIBUSoftwareUpdateOperation *)self targetBuildVersion];
      unsigned int v18 = [v16 isEqualToString:v17];

      if (v18)
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005C5D8);
        }
        v19 = (void *)qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v19;
          v21 = [(MIBUSoftwareUpdateOperation *)self currentBuildVersion];
          v22 = +[NSString stringWithFormat:@"OS updated from %@ to %@, update successful", v9, v21];
          *(_DWORD *)buf = 138543618;
          v51 = self;
          __int16 v52 = 2114;
          v53 = v22;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
        }
        v23 = 0;
      }
      else
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005C5F8);
        }
        v37 = (void *)qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_100041E1C(self, v37);
        }
        id v49 = 0;
        v38 = [(MIBUSoftwareUpdateOperation *)self currentBuildVersion];
        v47 = [(MIBUSoftwareUpdateOperation *)self targetBuildVersion];
        sub_1000102B8(&v49, 0x4000000, 0, @"Current os version %@ != %@, update failed", v39, v40, v41, v42, (uint64_t)v38);
        v23 = (NSError *)v49;
      }
    }
    else
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005C618);
      }
      v29 = (void *)qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        v30 = v29;
        v31 = +[NSString stringWithFormat:@"cancelling previously started operation..."];
        *(_DWORD *)buf = 138543618;
        v51 = self;
        __int16 v52 = 2114;
        v53 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
      }
      v32 = [(MIBUSoftwareUpdateOperation *)self suController];
      [v32 forcePurge];

      id v48 = 0;
      sub_1000102B8(&v48, 67108870, 0, @"Software update operation cancelled", v33, v34, v35, v36, v45);
      v23 = (NSError *)v48;
    }

    uint64_t v28 = 4;
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C638);
    }
    v24 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v26 = [(MIBUSoftwareUpdateOperation *)self currentBuildVersion];
      v27 = +[NSString stringWithFormat:@"starting operation from %@...", v26];
      *(_DWORD *)buf = 138543618;
      v51 = self;
      __int16 v52 = 2114;
      v53 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
    }
    v23 = 0;
    uint64_t v28 = 1;
  }
  error = self->_error;
  self->_error = v23;
  v44 = v23;

  [(MIBUSoftwareUpdateOperation *)self _transitionToState:v28 error:0];
}

- (void)_terminateNow
{
  if ((id)[(MIBUSoftwareUpdateOperation *)self state] == (id)4)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C658);
    }
    v3 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v5 = +[NSString stringWithFormat:@"already terminated"];
      int v9 = 138543618;
      objc_super v10 = self;
      __int16 v11 = 2114;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C678);
    }
    v6 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = +[NSString stringWithFormat:@"terminating..."];
      int v9 = 138543618;
      objc_super v10 = self;
      __int16 v11 = 2114;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
    }
    [(MIBUSoftwareUpdateOperation *)self _transitionToState:4 error:0];
  }
}

- (id)details
{
  v3 = objc_opt_new();
  v4 = [(MIBUSoftwareUpdateOperation *)self suController];

  if (v4)
  {
    v5 = [(MIBUSoftwareUpdateOperation *)self suController];
    v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 phase]);
    [v3 setObject:v6 forKey:@"SoftwareUpdatePhase"];
  }
  v7 = [(MIBUSoftwareUpdateOperation *)self targetOSVersion];

  if (v7)
  {
    v8 = [(MIBUSoftwareUpdateOperation *)self targetOSVersion];
    [v3 setObject:v8 forKey:@"TargetOSVersion"];
  }
  int v9 = [(MIBUSoftwareUpdateOperation *)self targetBuildVersion];

  if (v9)
  {
    objc_super v10 = [(MIBUSoftwareUpdateOperation *)self targetBuildVersion];
    [v3 setObject:v10 forKey:@"TargetBuildVersion"];
  }
  __int16 v11 = [(MIBUSoftwareUpdateOperation *)self suController];
  v12 = [v11 progress];

  if (v12)
  {
    v13 = [(MIBUSoftwareUpdateOperation *)self suController];
    v14 = [v13 progress];
    [v3 setObject:v14 forKey:@"Progress"];
  }
  v15 = [(MIBUSoftwareUpdateOperation *)self suController];
  v16 = [v15 timeRemaining];

  if (v16)
  {
    v17 = [(MIBUSoftwareUpdateOperation *)self suController];
    unsigned int v18 = [v17 timeRemaining];
    [v3 setObject:v18 forKey:@"TimeRemaining"];
  }
  v19 = [(MIBUSoftwareUpdateOperation *)self targetSUBundleSize];

  if (v19)
  {
    v20 = [(MIBUSoftwareUpdateOperation *)self targetSUBundleSize];
    [v3 setObject:v20 forKey:@"TargetSUBundleSize"];
  }

  return v3;
}

- (BOOL)isCommandAllowed:(id)a3
{
  id v4 = a3;
  v5 = +[NSSet setWithArray:&off_1000613C0];
  if ([v4 intValue] == 8) {
    unsigned __int8 v6 = (id)[(MIBUSoftwareUpdateOperation *)self state] == (id)2;
  }
  else {
    unsigned __int8 v6 = [v5 containsObject:v4];
  }

  return v6;
}

- (void)scanDidFinishWithResults:(id)a3
{
  id v4 = a3;
  v5 = [(MIBUOperation *)self syncQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003057C;
  v7[3] = &unk_10005A430;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)downloadDidFinishForUpdate:(id)a3
{
  id v4 = [(MIBUOperation *)self syncQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000306DC;
  block[3] = &unk_100059D00;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)installDidStartForUpdate:(id)a3
{
  id v4 = a3;
  v5 = [(MIBUOperation *)self syncQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000307A0;
  v7[3] = &unk_10005A430;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)updateDidFinishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(MIBUOperation *)self syncQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100030A74;
  v7[3] = &unk_10005A430;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)didHandleCommand:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MIBUOperation *)self syncQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030D10;
  block[3] = &unk_10005C720;
  id v12 = v6;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)handleInstallTimer:(id)a3
{
  id v4 = [(MIBUOperation *)self syncQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031048;
  block[3] = &unk_100059D00;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)_transitionToState:(unint64_t)a3 error:(id *)a4
{
  objc_initWeak(&location, self);
  id v7 = [(MIBUSoftwareUpdateOperation *)self stateTransitionTable];
  id v8 = +[NSNumber numberWithUnsignedInteger:[(MIBUSoftwareUpdateOperation *)self state]];
  id v9 = [v7 objectForKey:v8];

  if ([(MIBUSoftwareUpdateOperation *)self state] == a3)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C780);
    }
    v23 = (id)qword_10006C950;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = +[NSString stringWithFormat:@"already in state %lu", [(MIBUSoftwareUpdateOperation *)self state]];
      *(_DWORD *)buf = 138543618;
      v32 = self;
      __int16 v33 = 2114;
      uint64_t v34 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
    }
    goto LABEL_41;
  }
  if (!v9)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C7A0);
    }
    v23 = (id)qword_10006C950;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Unrecognized device state %lu; cannot transition to %lu",
        [(MIBUSoftwareUpdateOperation *)self state],
        a3);
      objc_claimAutoreleasedReturnValue();
      sub_1000420A4();
    }
    goto LABEL_41;
  }
  id v10 = +[NSNumber numberWithUnsignedInteger:a3];
  unsigned __int8 v11 = [v9 containsObject:v10];

  if ((v11 & 1) == 0)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C7C0);
    }
    v23 = (id)qword_10006C950;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      +[NSString stringWithFormat:@"Not allowed to transition from state %lu to state %lu", [(MIBUSoftwareUpdateOperation *)self state], a3];
      objc_claimAutoreleasedReturnValue();
      sub_1000420A4();
    }
LABEL_41:
    id v18 = 0;
    goto LABEL_23;
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005C7E0);
  }
  id v12 = (id)qword_10006C950;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = +[NSString stringWithFormat:@"changing state from %lu to %lu", [(MIBUSoftwareUpdateOperation *)self state], a3];
    *(_DWORD *)buf = 138543618;
    v32 = self;
    __int16 v33 = 2114;
    uint64_t v34 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  switch(a3)
  {
    case 1uLL:
      [(MIBUOperation *)self saveOpCode];
      v14 = dispatch_get_global_queue(33, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100031BDC;
      block[3] = &unk_10005C808;
      objc_copyWeak(&v29, &location);
      dispatch_async(v14, block);

      objc_destroyWeak(&v29);
      goto LABEL_12;
    case 2uLL:
      v19 = [(MIBUOperation *)self delegate];
      v20 = [v19 nfcController];
      id v27 = 0;
      [v20 start:&v27];
      id v18 = v27;

      [(MIBUSoftwareUpdateOperation *)self _startInstallTimer];
      goto LABEL_14;
    case 3uLL:
      [(MIBUSoftwareUpdateOperation *)self _stopInstallTimer];
      v15 = [(MIBUOperation *)self delegate];
      v16 = [v15 nfcController];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100031C34;
      v25[3] = &unk_10005C830;
      objc_copyWeak(&v26, &location);
      [v16 terminateWithCompletion:v25];

      objc_destroyWeak(&v26);
      goto LABEL_12;
    case 4uLL:
      [(MIBUSoftwareUpdateOperation *)self _cleanup];
      v17 = [(MIBUOperation *)self delegate];
      [v17 operationFinishedWithError:self->_error];

LABEL_12:
      id v18 = 0;
LABEL_14:
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005C850);
      }
      v21 = (id)qword_10006C950;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = +[NSString stringWithFormat:@"state changed from %lu to %lu", [(MIBUSoftwareUpdateOperation *)self state], a3];
        *(_DWORD *)buf = 138543618;
        v32 = self;
        __int16 v33 = 2114;
        uint64_t v34 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
      }
      [(MIBUSoftwareUpdateOperation *)self setState:a3];
      if (!v18) {
        goto LABEL_24;
      }
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005C870);
      }
      v23 = (id)qword_10006C950;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Failed to transition to state: %ld; current device state is: %ld; error: %@",
          a3,
          [(MIBUSoftwareUpdateOperation *)self state],
          v18);
        objc_claimAutoreleasedReturnValue();
        sub_1000420A4();
      }
      break;
    default:
      id v18 = 0;
      if (a4) {
        goto LABEL_25;
      }
      goto LABEL_26;
  }
LABEL_23:

LABEL_24:
  if (a4) {
LABEL_25:
  }
    *a4 = v18;
LABEL_26:

  objc_destroyWeak(&location);
}

- (id)_getStateTransitionTable
{
  v4[0] = &off_100060CD8;
  v4[1] = &off_100060CF0;
  v5[0] = &off_1000613D8;
  v5[1] = &off_1000613F0;
  v4[2] = &off_100060D20;
  v4[3] = &off_100060D38;
  v5[2] = &off_100061408;
  v5[3] = &off_100061420;
  v4[4] = &off_100060D08;
  v5[4] = &__NSArray0__struct;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];

  return v2;
}

- (void)_startInstallTimer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031F5C;
  block[3] = &unk_100059D00;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_stopInstallTimer
{
  v3 = [(MIBUSoftwareUpdateOperation *)self installTimer];

  if (v3)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C8B0);
    }
    id v4 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      id v6 = +[NSString stringWithFormat:@"Stopping Install Timer..."];
      int v8 = 138543618;
      id v9 = self;
      __int16 v10 = 2114;
      unsigned __int8 v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
    }
    id v7 = [(MIBUSoftwareUpdateOperation *)self installTimer];
    [v7 invalidate];

    [(MIBUSoftwareUpdateOperation *)self setInstallTimer:0];
  }
}

- (void)_cleanup
{
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005C8D0);
  }
  v3 = (void *)qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    v5 = +[NSString stringWithFormat:@"removing default preference keys..."];
    int v15 = 138543618;
    v16 = self;
    __int16 v17 = 2114;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v15, 0x16u);
  }
  +[MIBUDefaultPreferences removeObjectForKey:@"CurrentOperation"];
  +[MIBUDefaultPreferences removeObjectForKey:@"PreviousOSVersion"];
  +[MIBUDefaultPreferences removeObjectForKey:@"TargetOSVersion"];
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005C8F0);
  }
  id v6 = (void *)qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    int v8 = +[NSString stringWithFormat:@"removing nfc observer..."];
    int v15 = 138543618;
    v16 = self;
    __int16 v17 = 2114;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v15, 0x16u);
  }
  id v9 = [(MIBUOperation *)self delegate];
  __int16 v10 = [v9 nfcController];
  [v10 removeObserver:self];

  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005C910);
  }
  unsigned __int8 v11 = (void *)qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    id v13 = +[NSString stringWithFormat:@"termination SU controller..."];
    int v15 = 138543618;
    v16 = self;
    __int16 v17 = 2114;
    id v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v15, 0x16u);
  }
  v14 = [(MIBUSoftwareUpdateOperation *)self suController];
  [v14 terminate];
}

- (id)error
{
  return self->_error;
}

- (MIBUSUController)suController
{
  return self->_suController;
}

- (void)setSuController:(id)a3
{
}

- (PCPersistentTimer)installTimer
{
  return self->_installTimer;
}

- (void)setInstallTimer:(id)a3
{
}

- (double)idleTimeInterval
{
  return self->_idleTimeInterval;
}

- (void)setIdleTimeInterval:(double)a3
{
  self->_idleTimeInterval = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)targetBuildVersion
{
  return self->_targetBuildVersion;
}

- (void)setTargetBuildVersion:(id)a3
{
}

- (NSString)targetOSVersion
{
  return self->_targetOSVersion;
}

- (void)setTargetOSVersion:(id)a3
{
}

- (NSString)currentBuildVersion
{
  return self->_currentBuildVersion;
}

- (void)setCurrentBuildVersion:(id)a3
{
}

- (NSNumber)targetSUBundleSize
{
  return self->_targetSUBundleSize;
}

- (void)setTargetSUBundleSize:(id)a3
{
}

- (NSDictionary)stateTransitionTable
{
  return self->_stateTransitionTable;
}

- (void)setStateTransitionTable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateTransitionTable, 0);
  objc_storeStrong((id *)&self->_targetSUBundleSize, 0);
  objc_storeStrong((id *)&self->_currentBuildVersion, 0);
  objc_storeStrong((id *)&self->_targetOSVersion, 0);
  objc_storeStrong((id *)&self->_targetBuildVersion, 0);
  objc_storeStrong((id *)&self->_installTimer, 0);
  objc_storeStrong((id *)&self->_suController, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end