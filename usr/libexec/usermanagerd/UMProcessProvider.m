@interface UMProcessProvider
- (BOOL)terminatePID:(int)a3 withReasonNamespace:(unsigned int)a4 reasonCode:(unint64_t)a5 reasonString:(id)a6 error:(id *)a7;
- (id)pathForPID:(int)a3 error:(id *)a4;
- (id)pidsUsingVolumeAtPath:(id)a3 error:(id *)a4;
- (int)pidForLaunchdJobWithLabel:(id)a3 forUser:(unsigned int)a4 error:(id *)a5;
- (unint64_t)uniquePIDForPID:(int)a3 error:(id *)a4;
@end

@implementation UMProcessProvider

- (id)pathForPID:(int)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  bzero(buffer, 0x401uLL);
  if (proc_pidpath(a3, buffer, 0x400u))
  {
    v6 = +[NSString stringWithUTF8String:buffer];
  }
  else
  {
    int v7 = *__error();
    if (a4)
    {
      *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v7 userInfo:0];
    }
    if (qword_1000E41B0 != -1) {
      dispatch_once(&qword_1000E41B0, &stru_1000D5C78);
    }
    v8 = (id)qword_1000E41A8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v9 = sub_100055404(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        unsigned int v10 = v9;
      }
      else {
        unsigned int v10 = v9 & 0xFFFFFFFE;
      }
      if (v10)
      {
        v11 = (const char *)_os_log_send_and_compose_impl();
        v12 = (char *)v11;
        if (v11) {
          sub_100055434(v11);
        }
      }
      else
      {
        v12 = 0;
      }
      free(v12);
    }

    v6 = 0;
  }

  return v6;
}

- (unint64_t)uniquePIDForPID:(int)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  uint64_t v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long buffer = 0u;
  int v5 = proc_pidinfo(a3, 17, 0, &buffer, 56);
  if (v5 < 0)
  {
    int v7 = *__error();
    if (a4)
    {
      *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v7 userInfo:0];
    }
    if (qword_1000E41B0 != -1) {
      dispatch_once(&qword_1000E41B0, &stru_1000D5C78);
    }
    v8 = (id)qword_1000E41A8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v9 = sub_100055404(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        unsigned int v10 = v9;
      }
      else {
        unsigned int v10 = v9 & 0xFFFFFFFE;
      }
      if (v10)
      {
        v11 = (const char *)_os_log_send_and_compose_impl();
        v12 = (char *)v11;
        if (v11) {
          sub_100055434(v11);
        }
      }
      else
      {
        v12 = 0;
      }
      free(v12);
    }
  }
  else
  {
    if (v5 == 56) {
      return v19;
    }
    if (a4)
    {
      *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:5 userInfo:0];
    }
    if (qword_1000E41B0 != -1) {
      dispatch_once(&qword_1000E41B0, &stru_1000D5C78);
    }
    v13 = (id)qword_1000E41A8;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      unsigned int v14 = sub_100055404(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        v16 = (const char *)_os_log_send_and_compose_impl();
        v17 = (char *)v16;
        if (v16) {
          sub_100055434(v16);
        }
      }
      else
      {
        v17 = 0;
      }
      free(v17);
    }
  }
  return 0;
}

- (id)pidsUsingVolumeAtPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v6 = v5;
  int v7 = proc_listpidspath(1u, 0, (const char *)[v6 UTF8String], 3u, 0, 0);
  if (v7 < 0)
  {
    int v18 = *__error();
    if (a4)
    {
      *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v18 userInfo:0];
    }
    if (qword_1000E41B0 != -1) {
      dispatch_once(&qword_1000E41B0, &stru_1000D5C78);
    }
    long long v19 = (id)qword_1000E41A8;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      unsigned int v20 = sub_100055404(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        unsigned int v21 = v20;
      }
      else {
        unsigned int v21 = v20 & 0xFFFFFFFE;
      }
      if (v21)
      {
        v22 = (const char *)_os_log_send_and_compose_impl();
        v23 = (char *)v22;
        if (v22) {
          sub_100055434(v22);
        }
      }
      else
      {
        v23 = 0;
      }
      free(v23);
    }

    v13 = 0;
  }
  else
  {
    int v8 = v7 + 200;
    unsigned int v9 = malloc_type_malloc(v7 + 200, 0xDC870336uLL);
    unsigned int v10 = proc_listpidspath(1u, 0, (const char *)[v6 UTF8String], 3u, v9, v8);
    unsigned int v11 = v10;
    if ((v10 & 0x80000000) != 0)
    {
      int v24 = *__error();
      if (a4)
      {
        *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v24 userInfo:0];
      }
      if (qword_1000E41B0 != -1) {
        dispatch_once(&qword_1000E41B0, &stru_1000D5C78);
      }
      v25 = (id)qword_1000E41A8;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        unsigned int v26 = sub_100055404(0);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          unsigned int v27 = v26;
        }
        else {
          unsigned int v27 = v26 & 0xFFFFFFFE;
        }
        if (v27)
        {
          v28 = (const char *)_os_log_send_and_compose_impl();
          v29 = (char *)v28;
          if (v28) {
            sub_100055434(v28);
          }
        }
        else
        {
          v29 = 0;
        }
        free(v29);
      }

      v13 = 0;
    }
    else
    {
      unsigned int v12 = v10 >> 2;
      v13 = +[NSMutableArray arrayWithCapacity:v10 >> 2];
      if (v11 >= 4)
      {
        if (v12 <= 1) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v12;
        }
        unsigned int v15 = (unsigned int *)v9;
        do
        {
          unsigned int v16 = *v15++;
          v17 = +[NSNumber numberWithInt:v16];
          [v13 addObject:v17];

          --v14;
        }
        while (v14);
      }
    }
    free(v9);
  }

  return v13;
}

- (int)pidForLaunchdJobWithLabel:(id)a3 forUser:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  if (objc_opt_class())
  {
    if (a5) {
      *a5 = 0;
    }
    int v8 = +[OSLaunchdDomain domainForUser:v6];
    id v9 = +[OSLaunchdJob copyJobWithLabel:v7 domain:v8];
    if (!v9)
    {
      if (qword_1000E41B0 != -1) {
        dispatch_once(&qword_1000E41B0, &stru_1000D5C78);
      }
      int v18 = (id)qword_1000E41A8;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = 0;
        unsigned int v19 = sub_100055404(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          unsigned int v20 = v19;
        }
        else {
          unsigned int v20 = v19 & 0xFFFFFFFE;
        }
        if (v20)
        {
          *(_DWORD *)v41 = 138543618;
          *(void *)&v41[4] = v7;
          *(_WORD *)&v41[12] = 1024;
          *(_DWORD *)&v41[14] = v6;
          unsigned int v21 = (const char *)_os_log_send_and_compose_impl();
          v22 = (char *)v21;
          if (v21) {
            sub_100055434(v21);
          }
        }
        else
        {
          v22 = 0;
        }
        free(v22);
      }

      if (a5)
      {
        +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
        int v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        int v12 = 0;
      }
      goto LABEL_51;
    }
    *(void *)v41 = 0;
    *(void *)&v41[8] = v41;
    *(void *)&v41[16] = 0x3032000000;
    v42 = sub_100084B34;
    v43 = sub_100084B44;
    id v44 = 0;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    int v34 = 8;
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.usermanagerd.launchjobmonitor", 0);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100084B4C;
    v30[3] = &unk_1000D5C58;
    v30[4] = v41;
    v30[5] = &v31;
    [v9 monitorOnQueue:v10 withHandler:v30];
    [v9 cancelMonitor];
    unsigned int v11 = *(void **)(*(void *)&v41[8] + 40);
    if (v11)
    {
      if ([v11 state] == (id)2)
      {
        int v12 = [*(id *)(*(void *)&v41[8] + 40) pid];
LABEL_50:

        _Block_object_dispose(&v31, 8);
        _Block_object_dispose(v41, 8);

LABEL_51:
        goto LABEL_52;
      }
    }
    else
    {
      if (qword_1000E41B0 != -1) {
        dispatch_once(&qword_1000E41B0, &stru_1000D5C78);
      }
      v23 = (id)qword_1000E41A8;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        unsigned int v24 = sub_100055404(0);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          unsigned int v25 = v24;
        }
        else {
          unsigned int v25 = v24 & 0xFFFFFFFE;
        }
        if (v25)
        {
          int v26 = *((_DWORD *)v32 + 6);
          int v35 = 138543874;
          id v36 = v7;
          __int16 v37 = 1024;
          int v38 = v6;
          __int16 v39 = 1024;
          int v40 = v26;
          unsigned int v27 = (const char *)_os_log_send_and_compose_impl();
          v28 = (char *)v27;
          if (v27) {
            sub_100055434(v27);
          }
        }
        else
        {
          v28 = 0;
        }
        free(v28);
      }

      if (a5)
      {
        +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
        int v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_50;
      }
    }
    int v12 = 0;
    goto LABEL_50;
  }
  if (qword_1000E41B0 != -1) {
    dispatch_once(&qword_1000E41B0, &stru_1000D5C78);
  }
  v13 = (id)qword_1000E41A8;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v31 = 0;
    unsigned int v14 = sub_100055404(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      unsigned int v15 = v14;
    }
    else {
      unsigned int v15 = v14 & 0xFFFFFFFE;
    }
    if (v15)
    {
      *(_DWORD *)v41 = 138543362;
      *(void *)&v41[4] = v7;
      unsigned int v16 = (const char *)_os_log_send_and_compose_impl();
      v17 = (char *)v16;
      if (v16) {
        sub_100055434(v16);
      }
    }
    else
    {
      v17 = 0;
    }
    free(v17);
  }

  if (a5)
  {
    +[NSError errorWithDomain:NSPOSIXErrorDomain code:45 userInfo:0];
    int v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v12 = 0;
  }
LABEL_52:

  return v12;
}

- (BOOL)terminatePID:(int)a3 withReasonNamespace:(unsigned int)a4 reasonCode:(unint64_t)a5 reasonString:(id)a6 error:(id *)a7
{
  if (a7) {
    *a7 = 0;
  }
  [a6 UTF8String];
  int v11 = terminate_with_reason();
  if (v11)
  {
    int v12 = *__error();
    if (a7)
    {
      *a7 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v12 userInfo:0];
    }
    if (qword_1000E41B0 != -1) {
      dispatch_once(&qword_1000E41B0, &stru_1000D5C78);
    }
    v13 = (id)qword_1000E41A8;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      unsigned int v14 = sub_100055404(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        *(_DWORD *)buf = 67109888;
        int v21 = a3;
        __int16 v22 = 1024;
        unsigned int v23 = a4;
        __int16 v24 = 2048;
        unint64_t v25 = a5;
        __int16 v26 = 1024;
        int v27 = v12;
        unsigned int v16 = (const char *)_os_log_send_and_compose_impl();
        v17 = (char *)v16;
        if (v16) {
          sub_100055434(v16);
        }
      }
      else
      {
        v17 = 0;
      }
      free(v17);
    }
  }
  else
  {
    if (qword_1000E41B0 != -1) {
      dispatch_once(&qword_1000E41B0, &stru_1000D5C78);
    }
    int v18 = qword_1000E41A8;
    if (os_log_type_enabled((os_log_t)qword_1000E41A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Terminated process %d", buf, 8u);
    }
  }
  return v11 == 0;
}

@end