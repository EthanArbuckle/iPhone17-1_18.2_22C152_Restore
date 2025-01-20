@interface MIBUDiagnosticsOperation
- (BOOL)isCommandAllowed:(id)a3;
- (MIBUDiagnosticsController)diagController;
- (MIBUDiagnosticsOperation)initWithDelegate:(id)a3;
- (id)error;
- (void)_cleanup;
- (void)_operationDone;
- (void)_resume;
- (void)appDidExitWithError:(id)a3;
- (void)appDidLaunchWithError:(id)a3;
- (void)setDiagController:(id)a3;
@end

@implementation MIBUDiagnosticsOperation

- (MIBUDiagnosticsOperation)initWithDelegate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MIBUDiagnosticsOperation;
  v3 = [(MIBUOperation *)&v7 initWithDelegate:a3];
  v4 = v3;
  if (v3)
  {
    [(MIBUOperation *)v3 setOpCode:2];
    [(MIBUDiagnosticsOperation *)v4 setDiagController:0];
    error = v4->_error;
    v4->_error = 0;
  }
  return v4;
}

- (void)_resume
{
  v3 = [[MIBUDiagnosticsController alloc] initWithDelegate:self];
  [(MIBUDiagnosticsOperation *)self setDiagController:v3];

  if (![(MIBUOperation *)self inProgress])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A3E8);
    }
    objc_super v7 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = +[NSString stringWithFormat:@"Starting Diagnostics operation"];
      *(_DWORD *)buf = 138543618;
      v12 = self;
      __int16 v13 = 2114;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
    }
    [(MIBUOperation *)self saveOpCode];
    v5 = dispatch_get_global_queue(33, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018C00;
    block[3] = &unk_100059D00;
    block[4] = self;
    dispatch_async(v5, block);
    goto LABEL_11;
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A3C8);
  }
  v4 = (void *)qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = +[NSString stringWithFormat:@"Diagnostics operation already in progress; resuming..."];
    *(_DWORD *)buf = 138543618;
    v12 = self;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

LABEL_11:
  }
}

- (BOOL)isCommandAllowed:(id)a3
{
  id v3 = a3;
  v4 = +[NSSet setWithArray:&off_100061228];
  unsigned __int8 v5 = [v4 containsObject:v3];

  return v5;
}

- (void)appDidLaunchWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int8 v5 = [(MIBUOperation *)self syncQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100018E4C;
    v9[3] = &unk_10005A430;
    v9[4] = self;
    id v10 = v4;
    dispatch_async(v5, v9);
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A450);
    }
    v6 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v7 = v6;
      v8 = +[NSString stringWithFormat:@"Diagnostic app successfully launched!"];
      *(_DWORD *)buf = 138543618;
      v12 = self;
      __int16 v13 = 2114;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
    }
  }
}

- (void)appDidExitWithError:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MIBUOperation *)self syncQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019124;
  v7[3] = &unk_10005A430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_cleanup
{
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A490);
  }
  id v3 = (void *)qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    unsigned __int8 v5 = +[NSString stringWithFormat:@"removing default preference keys..."];
    *(_DWORD *)buf = 138543618;
    v17 = self;
    __int16 v18 = 2114;
    v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  +[MIBUDefaultPreferences removeObjectForKey:@"CurrentOperation"];
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A4B0);
  }
  id v6 = (void *)qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = v6;
    id v8 = +[NSString stringWithFormat:@"Terminating diag controller..."];
    *(_DWORD *)buf = 138543618;
    v17 = self;
    __int16 v18 = 2114;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  v9 = [(MIBUDiagnosticsOperation *)self diagController];
  id v15 = 0;
  unsigned __int8 v10 = [v9 terminate:&v15];
  id v11 = v15;

  if ((v10 & 1) == 0)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A4D0);
    }
    v12 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = v12;
      v14 = +[NSString stringWithFormat:@"Failed to terminate Diagnostics App. err: %@", v11];
      *(_DWORD *)buf = 138543618;
      v17 = self;
      __int16 v18 = 2114;
      v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
    }
  }
}

- (void)_operationDone
{
  [(MIBUDiagnosticsOperation *)self _cleanup];
  id v3 = [(MIBUOperation *)self delegate];
  [v3 operationFinishedWithError:self->_error];
}

- (id)error
{
  return self->_error;
}

- (MIBUDiagnosticsController)diagController
{
  return self->_diagController;
}

- (void)setDiagController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagController, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end