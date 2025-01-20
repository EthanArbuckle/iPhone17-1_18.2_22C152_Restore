@interface GTLaunchService
- (BOOL)foregroundService:(unint64_t)a3 error:(id *)a4;
- (BOOL)launchReplayService:(id)a3 error:(id *)a4;
- (BOOL)resumeService:(unint64_t)a3 error:(id *)a4;
- (BOOL)resumeTaskForPid:(int)a3 error:(id *)a4;
- (GTLaunchService)initWithServiceProvider:(id)a3;
- (void)bringGuestAppToForeground:(int)a3 completionHandler:(id)a4;
- (void)launchReplayerLocallyWithConfiguration:(id)a3 competionHandler:(id)a4;
- (void)launchReplayerLocallyWithConfigurationEmbedded:(id)a3 competionHandler:(id)a4;
- (void)processStateForService:(unint64_t)a3 completionHandler:(id)a4;
- (void)symbolicatorForService:(unint64_t)a3 completionHandler:(id)a4;
- (void)symbolicatorSignatureForPid:(int)a3 completionHandler:(id)a4;
@end

@implementation GTLaunchService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProvider, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

- (void)processStateForService:(unint64_t)a3 completionHandler:(id)a4
{
  kern_return_t v12;
  kern_return_t v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  BOOL v18;
  void *v19;
  void *v20;
  id v21;
  kern_return_t v22;
  kern_return_t v23;
  NSString *v24;
  void *v25;
  GTProcessState *v26;
  mach_msg_type_number_t task_info_outCnt;
  mach_port_name_t tn;
  NSErrorUserInfoKey v29;
  void *v30;
  NSErrorUserInfoKey v31;
  integer_t task_info_out[4];
  long long v33;
  long long v34;
  NSErrorUserInfoKey v35;

  v6 = (void (**)(id, void, id))a4;
  v7 = [(GTServiceProvider *)self->_serviceProvider allServices];
  v8 = filteredArrayByPort(v7, (id)a3);

  if ([v8 count] != (id)1)
  {
    v29 = NSLocalizedDescriptionKey;
    v19 = +[NSString stringWithFormat:@"Invalid service port"];
    v30 = v19;
    v20 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v21 = +[NSError errorWithDomain:@"com.apple.gputools.LaunchService" code:6 userInfo:v20];

LABEL_10:
    v6[2](v6, 0, v21);
    goto LABEL_11;
  }
  v9 = [v8 firstObject];
  v10 = [v9 processInfo];
  int v11 = [v10 processIdentifier];
  tn = 0;
  v12 = task_name_for_pid(mach_task_self_, v11, &tn);
  if (v12)
  {
    v13 = v12;
    v14 = +[NSString stringWithFormat:@"Failed to get name port for message destination pid %ld", v11];
    v35 = NSLocalizedDescriptionKey;
    *(void *)task_info_out = v14;
    v15 = +[NSDictionary dictionaryWithObjects:task_info_out forKeys:&v35 count:1];
    v16 = +[NSError errorWithDomain:NSMachErrorDomain code:v13 userInfo:v15];

    v17 = 0;
    v18 = 0;
  }
  else
  {
    v33 = 0u;
    v34 = 0u;
    *(_OWORD *)task_info_out = 0u;
    task_info_outCnt = 12;
    v22 = task_info(tn, 0x14u, task_info_out, &task_info_outCnt);
    v18 = v22 == 0;
    if (v22)
    {
      v23 = v22;
      v24 = +[NSString stringWithFormat:@"Failed to get task basic info for pid %ld", v11];
      v31 = NSLocalizedDescriptionKey;
      v35 = v24;
      v25 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v31 count:1];
      v16 = +[NSError errorWithDomain:NSMachErrorDomain code:v23 userInfo:v25];

      v17 = 0;
    }
    else
    {
      v16 = 0;
      v17 = HIDWORD(v34) != 0;
    }
  }
  v21 = v16;

  if (!v18) {
    goto LABEL_10;
  }
  v26 = objc_alloc_init(GTProcessState);
  [(GTProcessState *)v26 setIsSuspended:v17];
  ((void (**)(id, GTProcessState *, id))v6)[2](v6, v26, 0);

LABEL_11:
}

- (void)symbolicatorForService:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = [(GTServiceProvider *)self->_serviceProvider allServices];
  v8 = filteredArrayByPort(v7, (id)a3);

  if ([v8 count] == (id)1)
  {
    v9 = [v8 firstObject];
    v10 = [v9 processInfo];
    id v11 = [v10 processIdentifier];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001E458;
    v12[3] = &unk_100034FA8;
    id v13 = v6;
    [(GTLaunchService *)self symbolicatorSignatureForPid:v11 completionHandler:v12];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (BOOL)resumeService:(unint64_t)a3 error:(id *)a4
{
  v7 = [(GTServiceProvider *)self->_serviceProvider allServices];
  v8 = filteredArrayByPort(v7, (id)a3);

  if ([v8 count] == (id)1)
  {
    v9 = [v8 firstObject];
    v10 = [v9 processInfo];
    id v11 = [v10 processIdentifier];

    LOBYTE(a4) = [(GTLaunchService *)self resumeTaskForPid:v11 error:a4];
  }
  else if (a4)
  {
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    v12 = +[NSString stringWithFormat:@"Invalid service port"];
    v16 = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    *a4 = +[NSError errorWithDomain:@"com.apple.gputools.LaunchService" code:6 userInfo:v13];

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (BOOL)foregroundService:(unint64_t)a3 error:(id *)a4
{
  v7 = [(GTServiceProvider *)self->_serviceProvider allServices];
  v8 = filteredArrayByPort(v7, (id)a3);

  if ([v8 count] == (id)1)
  {
    v9 = [v8 firstObject];
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = sub_10001E930;
    v34 = sub_10001E940;
    id v35 = 0;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_10001E948;
    v22 = &unk_100034F80;
    v24 = &v26;
    v25 = &v30;
    v10 = dispatch_semaphore_create(0);
    v23 = v10;
    id v11 = objc_retainBlock(&v19);
    v12 = [v9 processInfo:v19, v20, v21, v22];
    id v13 = [v12 processIdentifier];

    [(GTLaunchService *)self bringGuestAppToForeground:v13 completionHandler:v11];
    dispatch_time_t v14 = dispatch_time(0, 1000000000 * qword_100041CE8);
    if (dispatch_semaphore_wait(v10, v14))
    {
      if (a4)
      {
        NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
        NSErrorUserInfoKey v15 = +[NSString stringWithFormat:@"Foreground service timed out"];
        v37 = v15;
        v16 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        *a4 = +[NSError errorWithDomain:@"com.apple.gputools.LaunchService" code:7 userInfo:v16];
      }
    }
    else if (a4)
    {
      *a4 = (id) v31[5];
    }
    LOBYTE(a4) = *((unsigned char *)v27 + 24) != 0;

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);

    goto LABEL_10;
  }
  if (a4)
  {
    NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
    v9 = +[NSString stringWithFormat:@"Invalid service port"];
    v39 = v9;
    v17 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    *a4 = +[NSError errorWithDomain:@"com.apple.gputools.LaunchService" code:6 userInfo:v17];

    LOBYTE(a4) = 0;
LABEL_10:
  }
  return (char)a4;
}

- (BOOL)launchReplayService:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = [v6 environment];
  v9 = modifyReplayerEnvironment(v8);
  [v7 setObject:v9 forKeyedSubscript:@"environment"];

  v10 = [v6 arguments];

  [v7 setObject:v10 forKeyedSubscript:@"arguments"];
  uint64_t v11 = qword_100041CE8;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_10001E930;
  v34 = sub_10001E940;
  dispatch_semaphore_t v35 = dispatch_semaphore_create(0);
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_10001E930;
  v24 = sub_10001E940;
  id v25 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001ECC0;
  v19[3] = &unk_100034F58;
  v19[4] = &v26;
  v19[5] = &v20;
  v19[6] = &v30;
  [(GTLaunchService *)self launchReplayerLocallyWithConfiguration:v7 competionHandler:v19];
  v12 = v31[5];
  dispatch_time_t v13 = dispatch_time(0, 1000000000 * v11);
  if (dispatch_semaphore_wait(v12, v13))
  {
    if (a4)
    {
      NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
      dispatch_time_t v14 = +[NSString stringWithFormat:@"Replayer launch timed out"];
      v37 = v14;
      NSErrorUserInfoKey v15 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      *a4 = +[NSError errorWithDomain:@"com.apple.gputools.LaunchService" code:8 userInfo:v15];
    }
  }
  else if (a4)
  {
    v16 = (void *)v21[5];
    if (v16) {
      *a4 = v16;
    }
  }
  char v17 = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v17;
}

- (void)bringGuestAppToForeground:(int)a3 completionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "bringGuestAppToForeground:%d", buf, 8u);
  }
  v8 = +[NSNumber numberWithInt:v4];
  v9 = +[RBSProcessPredicate predicateMatchingIdentifier:v8];

  id v21 = 0;
  v10 = +[RBSProcessHandle handleForPredicate:v9 error:&v21];
  id v11 = v21;
  if (v10)
  {
    v12 = [v10 bundle];
    dispatch_time_t v13 = [v12 identifier];

    dispatch_time_t v14 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001EFB8;
    v19[3] = &unk_100034F30;
    v19[4] = self;
    id v20 = v6;
    [v14 openApplication:v13 withOptions:0 completion:v19];
  }
  else
  {
    NSErrorUserInfoKey v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      id v17 = [v11 description];
      id v18 = [v17 UTF8String];
      *(_DWORD *)buf = 136315138;
      id v23 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Cannot bring app to foreground: error = %s", buf, 0xCu);
    }
    (*((void (**)(id, void, id))v6 + 2))(v6, 0, v11);
  }
}

- (BOOL)resumeTaskForPid:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v30) = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "resumeTaskForPid:%d", buf, 8u);
  }
  if ((int)v5 < 1) {
    goto LABEL_14;
  }
  mach_error_t v8 = task_read_for_pid();
  if (!v8)
  {
    mach_error_t v16 = task_resume(0);
    if (!v16)
    {
      LOBYTE(v12) = 1;
      return v12;
    }
    mach_error_t v17 = v16;
    id v18 = +[NSString stringWithFormat:@"failed resume task for process %d: %s", v5, mach_error_string(v16)];
    v19 = self->_log;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      if (a4)
      {
LABEL_11:
        NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
        id v20 = +[NSString stringWithFormat:@"failed resume task for process %d: %s", v5, mach_error_string(v17)];
        uint64_t v28 = v20;
        id v21 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        *a4 = +[NSError errorWithDomain:@"com.apple.gputools.LaunchService" code:5 userInfo:v21];

        uint64_t v22 = self->_log;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          id v23 = *a4;
          v24 = v22;
          id v25 = [v23 localizedDescription];
          *(_DWORD *)buf = 138412290;
          uint64_t v30 = v25;
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
    else if (a4)
    {
      goto LABEL_11;
    }

    goto LABEL_14;
  }
  if (!a4)
  {
LABEL_14:
    LOBYTE(v12) = 0;
    return v12;
  }
  NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
  v9 = +[NSString stringWithFormat:@"failed to get task port for process %d: %s", v5, mach_error_string(v8)];
  uint64_t v32 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  *a4 = +[NSError errorWithDomain:@"com.apple.gputools.LaunchService" code:4 userInfo:v10];

  id v11 = self->_log;
  BOOL v12 = os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR);
  if (v12)
  {
    id v13 = *a4;
    dispatch_time_t v14 = v11;
    NSErrorUserInfoKey v15 = [v13 localizedDescription];
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    goto LABEL_14;
  }
  return v12;
}

- (void)launchReplayerLocallyWithConfiguration:(id)a3 competionHandler:(id)a4
{
}

- (void)launchReplayerLocallyWithConfigurationEmbedded:(id)a3 competionHandler:(id)a4
{
  id v6 = a4;
  v22[0] = FBSOpenApplicationOptionKeyDebuggingOptions;
  v20[0] = FBSDebugOptionKeyArguments;
  id v7 = a3;
  uint64_t v8 = [v7 objectForKeyedSubscript:@"arguments"];
  v9 = (void *)v8;
  v10 = &__NSArray0__struct;
  if (v8) {
    v10 = (void *)v8;
  }
  v21[0] = v10;
  v20[1] = FBSDebugOptionKeyEnvironment;
  id v11 = [v7 objectForKeyedSubscript:@"environment"];

  BOOL v12 = &__NSDictionary0__struct;
  if (v11) {
    BOOL v12 = v11;
  }
  v21[1] = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  v23[0] = v13;
  v23[1] = &__kCFBooleanTrue;
  v22[1] = FBSOpenApplicationOptionKeyUnlockDevice;
  v22[2] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v23[2] = &__kCFBooleanTrue;
  dispatch_time_t v14 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];

  NSErrorUserInfoKey v15 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  mach_error_t v16 = +[FBSOpenApplicationOptions optionsWithDictionary:v14];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001F698;
  v18[3] = &unk_100034F30;
  v18[4] = self;
  id v19 = v6;
  id v17 = v6;
  [v15 openApplication:@"com.apple.MTLReplayer" withOptions:v16 completion:v18];
}

- (void)symbolicatorSignatureForPid:(int)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = dispatch_get_global_queue(0, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001F878;
  v8[3] = &unk_100034F08;
  int v10 = a3;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (GTLaunchService)initWithServiceProvider:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTLaunchService;
  id v6 = [(GTLaunchService *)&v10 init];
  if (v6)
  {
    os_log_t v7 = os_log_create("com.apple.gputools.transport", "GTLaunchService");
    log = v6->_log;
    v6->_log = (OS_os_log *)v7;

    objc_storeStrong((id *)&v6->_serviceProvider, a3);
  }

  return v6;
}

@end