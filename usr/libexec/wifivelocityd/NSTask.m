@interface NSTask
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 error:(id *)a5;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 launchHandler:(id)a5 didLaunch:(BOOL *)a6 error:(id *)a7;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 error:(id *)a6;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 launchHandler:(id)a6 didLaunch:(BOOL *)a7 error:(id *)a8;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 error:(id *)a6;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 launchHandler:(id)a6 didLaunch:(BOOL *)a7 error:(id *)a8;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 error:(id *)a6;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 launchHandler:(id)a6 didLaunch:(BOOL *)a7 error:(id *)a8;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputData:(id)a6 errorData:(id)a7 launchHandler:(id)a8 didLaunch:(BOOL *)a9 error:(id *)a10;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFileHandle:(id)a6 errorFileHandle:(id)a7 launchHandler:(id)a8 didLaunch:(BOOL *)a9 error:(id *)a10;
+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFilePath:(id)a6 errorFilePath:(id)a7 redirectErrorToOutput:(BOOL)a8 launchHandler:(id)a9 didLaunch:(BOOL *)a10 error:(id *)a11;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 launchHandler:(id)a5 reply:(id)a6;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 launchHandler:(id)a6 reply:(id)a7;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 reply:(id)a6;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 launchHandler:(id)a6 reply:(id)a7;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 reply:(id)a6;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 launchHandler:(id)a6 reply:(id)a7;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 reply:(id)a6;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 reply:(id)a5;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputData:(id)a6 errorData:(id)a7 launchHandler:(id)a8 reply:(id)a9;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFileHandle:(id)a6 errorFileHandle:(id)a7 launchHandler:(id)a8 reply:(id)a9;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFilePath:(id)a6 errorFilePath:(id)a7 redirectErrorToOutput:(BOOL)a8 launchHandler:(id)a9 reply:(id)a10;
+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 startBlock:(id)a6 updateBlock:(id)a7 endBlock:(id)a8;
@end

@implementation NSTask

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 reply:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018D04;
  v5[3] = &unk_1000DD7C8;
  v5[4] = a5;
  +[NSTask runTaskWithLaunchPath:a3 arguments:a4 timeout:0 outputData:0 errorData:0 launchHandler:v5 reply:10.0];
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 launchHandler:(id)a5 reply:(id)a6
{
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 reply:(id)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100018DBC;
  v6[3] = &unk_1000DD7C8;
  v6[4] = a6;
  +[NSTask runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputData:0 errorData:0 launchHandler:v6 reply:10.0];
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 launchHandler:(id)a6 reply:(id)a7
{
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputData:(id)a6 errorData:(id)a7 launchHandler:(id)a8 reply:(id)a9
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100018EE8;
  v11[3] = &unk_1000DD7F0;
  v11[4] = a9;
  v11[5] = a8;
  v9[4] = a9;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100018F20;
  v10[3] = &unk_1000DD818;
  v10[4] = a6;
  v10[5] = a7;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100018F78;
  v9[3] = &unk_1000DD840;
  +[NSTask runTaskWithLaunchPath:a3 arguments:a4 timeout:v11 startBlock:v10 updateBlock:v9 endBlock:a5];
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 reply:(id)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001901C;
  v6[3] = &unk_1000DD7C8;
  v6[4] = a6;
  +[NSTask runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputFilePath:0 errorFilePath:0 redirectErrorToOutput:0 launchHandler:10.0 reply:v6];
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 launchHandler:(id)a6 reply:(id)a7
{
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFilePath:(id)a6 errorFilePath:(id)a7 redirectErrorToOutput:(BOOL)a8 launchHandler:(id)a9 reply:(id)a10
{
  if ((unint64_t)a6 | (unint64_t)a7)
  {
    BOOL v14 = a8;
    v16 = (NSError *)a6;
    if (a6)
    {
      [+[NSFileManager defaultManager] removeItemAtPath:a6 error:0];
      [+[NSFileManager defaultManager] createFileAtPath:v16 contents:0 attributes:0];
      v17 = +[NSFileHandle fileHandleForUpdatingAtPath:v16];
      if (v17)
      {
        v18 = v17;
        v16 = 0;
        if (!a7) {
          goto LABEL_20;
        }
        goto LABEL_13;
      }
      v19 = sub_10009756C();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 136316162;
        v32 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorT"
              "oOutput:launchHandler:reply:]";
        __int16 v33 = 2080;
        v34 = "W5TaskUtil.m";
        __int16 v35 = 1024;
        int v36 = 146;
        __int16 v37 = 2114;
        id v38 = [a3 lastPathComponent];
        __int16 v39 = 2114;
        id v40 = v16;
        LODWORD(v25) = 48;
        v24 = &v31;
        _os_log_send_and_compose_impl();
      }
      NSErrorUserInfoKey v29 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v30 = @"W5ResourceErr";
      v16 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 7, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1, v24, v25));
    }
    v18 = 0;
    if (!a7) {
      goto LABEL_20;
    }
LABEL_13:
    [+[NSFileManager defaultManager] removeItemAtPath:a7 error:0];
    [+[NSFileManager defaultManager] createFileAtPath:a7 contents:0 attributes:0];
    v20 = +[NSFileHandle fileHandleForUpdatingAtPath:a7];
    if (v20)
    {
      if (!v16)
      {
LABEL_21:
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_1000194CC;
        v26[3] = &unk_1000DD868;
        if (v14) {
          v23 = v18;
        }
        else {
          v23 = v20;
        }
        v26[4] = v18;
        v26[5] = v20;
        v26[6] = a10;
        +[NSTask runTaskWithLaunchPath:a3 arguments:a4 timeout:v18 outputFileHandle:v23 errorFileHandle:a9 launchHandler:v26 reply:a5];
        return;
      }
      goto LABEL_15;
    }
    v21 = sub_10009756C();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [a3 lastPathComponent];
      int v31 = 136316162;
      v32 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToO"
            "utput:launchHandler:reply:]";
      __int16 v33 = 2080;
      v34 = "W5TaskUtil.m";
      __int16 v35 = 1024;
      int v36 = 160;
      __int16 v37 = 2114;
      id v38 = v22;
      __int16 v39 = 2114;
      id v40 = a7;
      LODWORD(v25) = 48;
      v24 = &v31;
      _os_log_send_and_compose_impl();
    }
    NSErrorUserInfoKey v27 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v28 = @"W5ResourceErr";
    v16 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 7, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1, v24, v25));
LABEL_20:
    v20 = 0;
    if (!v16) {
      goto LABEL_21;
    }
LABEL_15:
    [(NSFileHandle *)v18 closeFile];
    [(NSFileHandle *)v20 closeFile];
    if (a10) {
      (*((void (**)(id, NSError *, void))a10 + 2))(a10, v16, 0);
    }
    return;
  }

  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:", a3, a4, 0, 0, a9, a10);
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 reply:(id)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000195C4;
  v6[3] = &unk_1000DD7C8;
  v6[4] = a6;
  +[NSTask runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputFileHandle:0 errorFileHandle:0 launchHandler:v6 reply:10.0];
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 launchHandler:(id)a6 reply:(id)a7
{
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFileHandle:(id)a6 errorFileHandle:(id)a7 launchHandler:(id)a8 reply:(id)a9
{
  if ((unint64_t)a6 | (unint64_t)a7)
  {
    [a6 seekToEndOfFile];
    [a7 seekToEndOfFile];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000197A0;
    v18[3] = &unk_1000DD7F0;
    v18[4] = a9;
    v18[5] = a8;
    v16[4] = a9;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000197D8;
    v17[3] = &unk_1000DD818;
    v17[4] = a6;
    v17[5] = a7;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000199E0;
    v16[3] = &unk_1000DD840;
    +[NSTask runTaskWithLaunchPath:a3 arguments:a4 timeout:v18 startBlock:v17 updateBlock:v16 endBlock:a5];
  }
  else
  {
    +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:", a3, a4, 0, 0);
  }
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 startBlock:(id)a6 updateBlock:(id)a7 endBlock:(id)a8
{
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifivelocity.task.%@", [a3 lastPathComponent]);
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3052000000;
  v69[3] = sub_10001A620;
  v69[4] = sub_10001A630;
  uint64_t v70 = 0;
  [(NSString *)v13 UTF8String];
  uint64_t v14 = os_transaction_create();
  [[+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager") osTransactionCreate:v13 transaction:v14];
  uint64_t v70 = v14;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  char v68 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  char v66 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3052000000;
  v62 = sub_10001A620;
  v63 = sub_10001A630;
  uint64_t v64 = 0;
  v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v16 = &off_1000B0000;
  identifier = dispatch_queue_create(0, v15);
  if (!identifier)
  {
    NSErrorUserInfoKey v92 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v93 = @"W5NoMemErr";
    int v36 = +[NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];
    uint64_t v35 = 2;
LABEL_33:
    __int16 v37 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:v35 userInfo:v36];
    id v26 = 0;
    id v24 = 0;
    id v45 = 0;
    id v21 = 0;
    CFStringRef v30 = 0;
    id v48 = 0;
    goto LABEL_34;
  }
  id v17 = a3;
  if ([a3 isEqualToString:@"/bin/sh"]) {
    id v17 = [a4 firstObject];
  }
  if ((([v17 hasPrefix:@"/usr/local/"] & 1) != 0
     || [v17 hasPrefix:@"/AppleInternal/"])
    && (os_variant_allows_internal_security_policies() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v44 = (const char *)[v17 UTF8String];
      *(_DWORD *)buf = 136446210;
      v78 = v44;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] '%{public}s' not allowed on non-internal install variants, will not run task", buf, 0xCu);
    }
    NSErrorUserInfoKey v90 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v91 = @"W5NotPermittedErr";
    int v36 = +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
    uint64_t v35 = 5;
    goto LABEL_33;
  }
  if (!a3
    || ![+[NSFileManager defaultManager] isExecutableFileAtPath:a3])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v43 = (const char *)[a3 UTF8String];
      *(_DWORD *)buf = 136446210;
      v78 = v43;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] '%{public}s' does not exist, will not run task", buf, 0xCu);
    }
    NSErrorUserInfoKey v88 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v89 = @"W5ParamErr";
    uint64_t v35 = 1;
    int v36 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
    goto LABEL_33;
  }
  id v48 = objc_alloc_init((Class)NSTask);
  [v48 setLaunchPath:a3];
  if (a4) {
    [v48 setArguments:a4];
  }
  *(void *)v58 = 0;
  uintptr_t handle = 0;
  memset(&v87, 0, sizeof(v87));
  int v18 = openpty(&v58[1], v58, 0, &v87, 0);
  if (v18)
  {
    NSErrorUserInfoKey v85 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v86 = @"err";
    __int16 v37 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v18, +[NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1]);
    id v38 = sub_10009756C();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = *__error();
      *(_DWORD *)buf = 136315906;
      v78 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]";
      __int16 v79 = 2080;
      v80 = "W5TaskUtil.m";
      __int16 v81 = 1024;
      int v82 = 335;
      __int16 v83 = 1024;
      int v84 = v39;
LABEL_25:
      _os_log_send_and_compose_impl();
    }
LABEL_26:
    id v26 = 0;
    id v24 = 0;
    id v45 = 0;
    id v21 = 0;
LABEL_28:
    CFStringRef v30 = 0;
    goto LABEL_34;
  }
  memset(&v87, 0, sizeof(v87));
  int v19 = openpty((int *)&handle + 1, (int *)&handle, 0, &v87, 0);
  if (v19)
  {
    NSErrorUserInfoKey v75 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v76 = @"err";
    __int16 v37 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v19, +[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1]);
    id v40 = sub_10009756C();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = *__error();
      *(_DWORD *)buf = 136315906;
      v78 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]";
      __int16 v79 = 2080;
      v80 = "W5TaskUtil.m";
      __int16 v81 = 1024;
      int v82 = 339;
      __int16 v83 = 1024;
      int v84 = v41;
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  id v20 = objc_alloc((Class)NSFileHandle);
  id v21 = [v20 initWithFileDescriptor:v58[1] closeOnDealloc:1];
  id v22 = objc_alloc((Class)NSFileHandle);
  id v45 = [v22 initWithFileDescriptor:v58[0] closeOnDealloc:1];
  id v23 = objc_alloc((Class)NSFileHandle);
  id v24 = [v23 initWithFileDescriptor:HIDWORD(handle) closeOnDealloc:1];
  id v25 = objc_alloc((Class)NSFileHandle);
  id v26 = [v25 initWithFileDescriptor:handle closeOnDealloc:1];
  [v48 setStandardOutput:v45];
  [v48 setStandardError:v26];
  [v48 setStandardInput:0];
  fcntl(v58[1], 4, 4);
  fcntl(SHIDWORD(handle), 4, 4);
  uintptr_t v27 = v58[1];
  global_queue = dispatch_get_global_queue(0, 0);
  NSErrorUserInfoKey v29 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v27, 0, global_queue);
  if (!v29)
  {
    NSErrorUserInfoKey v73 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v74 = @"W5NoMemErr";
    __int16 v37 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 2, +[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1]);
    goto LABEL_28;
  }
  CFStringRef v30 = v29;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001A63C;
  handler[3] = &unk_1000DD8B8;
  int v56 = v58[1];
  handler[7] = v65;
  handler[6] = a7;
  handler[4] = identifier;
  handler[5] = v48;
  dispatch_source_set_event_handler(v29, handler);
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_10001A7A4;
  v54[3] = &unk_1000DD8E0;
  v54[4] = v45;
  v54[5] = v21;
  v54[6] = v30;
  dispatch_source_set_cancel_handler(v30, v54);
  dispatch_resume(v30);
  int v31 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, SHIDWORD(handle), 0, global_queue);
  if (v31)
  {
    v32 = v31;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10001A7E8;
    v52[3] = &unk_1000DD8B8;
    int v53 = HIDWORD(handle);
    v52[6] = a7;
    v52[7] = v65;
    v52[4] = identifier;
    v52[5] = v48;
    dispatch_source_set_event_handler(v31, v52);
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10001A950;
    v51[3] = &unk_1000DD8E0;
    v51[4] = v26;
    v51[5] = v24;
    v51[6] = v32;
    dispatch_source_set_cancel_handler(v32, v51);
    dispatch_resume(v32);
    __int16 v33 = +[NSNotificationCenter defaultCenter];
    +[NSOperationQueue mainQueue];
    block[15] = _NSConcreteStackBlock;
    block[16] = 3221225472;
    block[17] = sub_10001A994;
    block[18] = &unk_1000DD908;
    block[27] = v65;
    block[28] = v67;
    block[19] = identifier;
    block[20] = v48;
    block[21] = a3;
    block[22] = a4;
    block[25] = a8;
    block[26] = &v59;
    block[29] = v69;
    block[23] = v32;
    block[24] = v30;
    id v34 = -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](v33, "addObserverForName:object:queue:usingBlock:", NSTaskDidTerminateNotification);
    v60[5] = (uint64_t)v34;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001AED0;
    block[3] = &unk_1000DD9A8;
    block[4] = v48;
    block[5] = a3;
    block[6] = v32;
    block[7] = v30;
    block[8] = identifier;
    block[9] = a4;
    block[10] = 0;
    block[11] = a6;
    *(double *)&block[14] = a5;
    block[12] = v69;
    block[13] = v67;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    goto LABEL_16;
  }
  NSErrorUserInfoKey v71 = NSLocalizedFailureReasonErrorKey;
  CFStringRef v72 = @"W5NoMemErr";
  v16 = &off_1000B0000;
  __int16 v37 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 2, +[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1]);
LABEL_34:

  if (v30)
  {
    dispatch_source_cancel(v30);
  }
  else
  {
  }
  v42 = identifier;
  if (!identifier) {
    v42 = dispatch_get_global_queue(0, 0);
  }
  v49[0] = _NSConcreteStackBlock;
  v49[1] = *((void *)v16 + 239);
  v49[2] = sub_10001B598;
  v49[3] = &unk_1000DD930;
  v49[4] = a3;
  v49[5] = v37;
  v49[6] = a4;
  v49[7] = v48;
  v49[8] = a6;
  v49[9] = v69;
  dispatch_async(v42, v49);
  if (identifier) {
    dispatch_release(identifier);
  }

LABEL_16:
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(v65, 8);
  _Block_object_dispose(v67, 8);
  _Block_object_dispose(v69, 8);
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 error:(id *)a5
{
  return +[NSTask runTaskWithLaunchPath:a3 arguments:a4 timeout:0 outputData:0 errorData:0 launchHandler:0 didLaunch:0.0 error:a5];
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 launchHandler:(id)a5 didLaunch:(BOOL *)a6 error:(id *)a7
{
  return +[NSTask runTaskWithLaunchPath:a3 arguments:a4 timeout:0 outputData:0 errorData:a5 launchHandler:a6 didLaunch:0.0 error:a7];
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 error:(id *)a6
{
  return +[NSTask runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputData:0 errorData:0 launchHandler:0 didLaunch:0.0 error:a6];
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 launchHandler:(id)a6 didLaunch:(BOOL *)a7 error:(id *)a8
{
  return +[NSTask runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputData:0 errorData:a6 launchHandler:a7 didLaunch:0.0 error:a8];
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputData:(id)a6 errorData:(id)a7 launchHandler:(id)a8 didLaunch:(BOOL *)a9 error:(id *)a10
{
  uint64_t v29 = 0;
  CFStringRef v30 = &v29;
  uint64_t v31 = 0x3052000000;
  v32 = sub_10001A620;
  __int16 v33 = sub_10001A630;
  uint64_t v34 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  id v17 = dispatch_semaphore_create(0);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001BAA4;
  v24[3] = &unk_1000DD9D0;
  v24[5] = &v29;
  v24[6] = &v25;
  v24[4] = v17;
  +[NSTask runTaskWithLaunchPath:a3 arguments:a4 timeout:a6 outputData:a7 errorData:a8 launchHandler:v24 reply:a5];
  dispatch_time_t v18 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v17, v18) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v36 = 0x4082C00000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  id v19 = (id)v30[5];
  if (a9) {
    *a9 = *((unsigned char *)v26 + 24);
  }
  id v20 = v30;
  if (a10)
  {
    id v21 = (void *)v30[5];
    if (v21) {
      *a10 = v21;
    }
  }
  BOOL v22 = v20[5] == 0;
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v22;
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 error:(id *)a6
{
  return +[NSTask runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputFilePath:0 errorFilePath:0 redirectErrorToOutput:0 launchHandler:0.0 didLaunch:0 error:a6];
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 launchHandler:(id)a6 didLaunch:(BOOL *)a7 error:(id *)a8
{
  return +[NSTask runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputFilePath:0 errorFilePath:0 redirectErrorToOutput:a6 launchHandler:0.0 didLaunch:a7 error:a8];
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFilePath:(id)a6 errorFilePath:(id)a7 redirectErrorToOutput:(BOOL)a8 launchHandler:(id)a9 didLaunch:(BOOL *)a10 error:(id *)a11
{
  BOOL v12 = a8;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3052000000;
  __int16 v33 = sub_10001A620;
  uint64_t v34 = sub_10001A630;
  uint64_t v35 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  dispatch_time_t v18 = dispatch_semaphore_create(0);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10001BDE4;
  v25[3] = &unk_1000DD9D0;
  v25[5] = &v30;
  v25[6] = &v26;
  v25[4] = v18;
  +[NSTask runTaskWithLaunchPath:a3 arguments:a4 timeout:a6 outputFilePath:a7 errorFilePath:v12 redirectErrorToOutput:a9 launchHandler:a5 reply:v25];
  dispatch_time_t v19 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v18, v19) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v37 = 0x4082C00000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  id v20 = (id)v31[5];
  if (a10) {
    *a10 = *((unsigned char *)v27 + 24);
  }
  id v21 = v31;
  if (a11)
  {
    BOOL v22 = (void *)v31[5];
    if (v22) {
      *a11 = v22;
    }
  }
  BOOL v23 = v21[5] == 0;
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  return v23;
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 error:(id *)a6
{
  return +[NSTask runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputFileHandle:0 errorFileHandle:0 launchHandler:0 didLaunch:0.0 error:a6];
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 launchHandler:(id)a6 didLaunch:(BOOL *)a7 error:(id *)a8
{
  return +[NSTask runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputFileHandle:0 errorFileHandle:a6 launchHandler:a7 didLaunch:0.0 error:a8];
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFileHandle:(id)a6 errorFileHandle:(id)a7 launchHandler:(id)a8 didLaunch:(BOOL *)a9 error:(id *)a10
{
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3052000000;
  uint64_t v32 = sub_10001A620;
  __int16 v33 = sub_10001A630;
  uint64_t v34 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  id v17 = dispatch_semaphore_create(0);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001C124;
  v24[3] = &unk_1000DD9D0;
  v24[5] = &v29;
  v24[6] = &v25;
  v24[4] = v17;
  +[NSTask runTaskWithLaunchPath:a3 arguments:a4 timeout:a6 outputFileHandle:a7 errorFileHandle:a8 launchHandler:v24 reply:a5];
  dispatch_time_t v18 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v17, v18) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v36 = 0x4082C00000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  id v19 = (id)v30[5];
  if (a9) {
    *a9 = *((unsigned char *)v26 + 24);
  }
  id v20 = v30;
  if (a10)
  {
    id v21 = (void *)v30[5];
    if (v21) {
      *a10 = v21;
    }
  }
  BOOL v22 = v20[5] == 0;
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v22;
}

@end