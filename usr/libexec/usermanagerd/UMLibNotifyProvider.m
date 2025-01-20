@interface UMLibNotifyProvider
- (BOOL)notificationHasPostedForToken:(int)a3 error:(id *)a4;
- (BOOL)post:(id)a3;
- (BOOL)setState:(unint64_t)a3 forToken:(int)a4;
- (int)registerCheck:(id)a3;
- (int)registerPlain:(id)a3;
- (unint64_t)stateForToken:(int)a3 error:(id *)a4;
@end

@implementation UMLibNotifyProvider

- (BOOL)post:(id)a3
{
  id v3 = a3;
  uint32_t v4 = notify_post((const char *)[v3 UTF8String]);
  if (v4)
  {
    if (qword_1000E4008 != -1) {
      dispatch_once(&qword_1000E4008, &stru_1000D5368);
    }
    v5 = (id)qword_1000E4000;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unsigned int v6 = sub_100055404(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        unsigned int v7 = v6;
      }
      else {
        unsigned int v7 = v6 & 0xFFFFFFFE;
      }
      if (v7)
      {
LABEL_17:
        v10 = (const char *)_os_log_send_and_compose_impl();
        v11 = (char *)v10;
        if (v10) {
          sub_100055434(v10);
        }
        goto LABEL_20;
      }
LABEL_19:
      v11 = 0;
LABEL_20:
      free(v11);
    }
  }
  else
  {
    if (qword_1000E4008 != -1) {
      dispatch_once(&qword_1000E4008, &stru_1000D5368);
    }
    v5 = (id)qword_1000E4000;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v8 = sub_100055404(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9) {
        goto LABEL_17;
      }
      goto LABEL_19;
    }
  }

  return v4 == 0;
}

- (int)registerPlain:(id)a3
{
  id v3 = a3;
  [v3 UTF8String];
  if (notify_register_plain())
  {
    if (qword_1000E4008 != -1) {
      dispatch_once(&qword_1000E4008, &stru_1000D5368);
    }
    uint32_t v4 = (id)qword_1000E4000;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      unsigned int v5 = sub_100055404(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        unsigned int v6 = v5;
      }
      else {
        unsigned int v6 = v5 & 0xFFFFFFFE;
      }
      if (v6)
      {
        unsigned int v7 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v8 = (char *)v7;
        if (v7) {
          sub_100055434(v7);
        }
      }
      else
      {
        unsigned int v8 = 0;
      }
      free(v8);
    }
  }
  else
  {
    if (qword_1000E4008 != -1) {
      dispatch_once(&qword_1000E4008, &stru_1000D5368);
    }
    uint32_t v4 = (id)qword_1000E4000;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v9 = sub_100055404(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
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

  return -1;
}

- (int)registerCheck:(id)a3
{
  int out_token = -1;
  id v3 = a3;
  uint32_t v4 = notify_register_check((const char *)[v3 UTF8String], &out_token);
  if (v4)
  {
    uint32_t v5 = v4;
    if (qword_1000E4008 != -1) {
      dispatch_once(&qword_1000E4008, &stru_1000D5368);
    }
    unsigned int v6 = (id)qword_1000E4000;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      unsigned int v7 = sub_100055404(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        unsigned int v8 = v7;
      }
      else {
        unsigned int v8 = v7 & 0xFFFFFFFE;
      }
      if (v8)
      {
        int v19 = 138543618;
        id v20 = v3;
        __int16 v21 = 1024;
        int v22 = v5;
        unsigned int v9 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v10 = (char *)v9;
        if (v9) {
          sub_100055434(v9);
        }
      }
      else
      {
        unsigned int v10 = 0;
      }
      free(v10);
    }

    int v16 = -1;
  }
  else
  {
    if (qword_1000E4008 != -1) {
      dispatch_once(&qword_1000E4008, &stru_1000D5368);
    }
    v11 = (id)qword_1000E4000;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v12 = sub_100055404(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = v12 & 0xFFFFFFFE;
      }
      if (v13)
      {
        int v19 = 138543618;
        id v20 = v3;
        __int16 v21 = 1024;
        int v22 = out_token;
        v14 = (const char *)_os_log_send_and_compose_impl();
        v15 = (char *)v14;
        if (v14) {
          sub_100055434(v14);
        }
      }
      else
      {
        v15 = 0;
      }
      free(v15);
    }

    int v16 = out_token;
  }

  return v16;
}

- (BOOL)notificationHasPostedForToken:(int)a3 error:(id *)a4
{
  *a4 = 0;
  int check = 0;
  uint32_t v6 = notify_check(a3, &check);
  if (v6)
  {
    uint32_t v7 = v6;
    if (qword_1000E4008 != -1) {
      dispatch_once(&qword_1000E4008, &stru_1000D5368);
    }
    unsigned int v8 = (id)qword_1000E4000;
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
        int v21 = 67109376;
        int v22 = a3;
        __int16 v23 = 1024;
        int v24 = v7;
        v11 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v12 = (char *)v11;
        if (v11) {
          sub_100055434(v11);
        }
      }
      else
      {
        unsigned int v12 = 0;
      }
      free(v12);
    }

    id v18 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:5 userInfo:0];
    BOOL result = 0;
    *a4 = v18;
  }
  else
  {
    if (qword_1000E4008 != -1) {
      dispatch_once(&qword_1000E4008, &stru_1000D5368);
    }
    unsigned int v13 = (id)qword_1000E4000;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v14 = sub_100055404(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        int v21 = 67109376;
        int v22 = a3;
        __int16 v23 = 1024;
        int v24 = check;
        int v16 = (const char *)_os_log_send_and_compose_impl();
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

    return check == 1;
  }
  return result;
}

- (BOOL)setState:(unint64_t)a3 forToken:(int)a4
{
  uint32_t v4 = notify_set_state(a4, a3);
  if (v4)
  {
    if (qword_1000E4008 != -1) {
      dispatch_once(&qword_1000E4008, &stru_1000D5368);
    }
    uint32_t v5 = (id)qword_1000E4000;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unsigned int v6 = sub_100055404(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        unsigned int v7 = v6;
      }
      else {
        unsigned int v7 = v6 & 0xFFFFFFFE;
      }
      if (v7)
      {
LABEL_17:
        unsigned int v10 = (const char *)_os_log_send_and_compose_impl();
        v11 = (char *)v10;
        if (v10) {
          sub_100055434(v10);
        }
        goto LABEL_20;
      }
LABEL_19:
      v11 = 0;
LABEL_20:
      free(v11);
    }
  }
  else
  {
    if (qword_1000E4008 != -1) {
      dispatch_once(&qword_1000E4008, &stru_1000D5368);
    }
    uint32_t v5 = (id)qword_1000E4000;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v8 = sub_100055404(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9) {
        goto LABEL_17;
      }
      goto LABEL_19;
    }
  }

  return v4 == 0;
}

- (unint64_t)stateForToken:(int)a3 error:(id *)a4
{
  *a4 = 0;
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(a3, &state64);
  if (state)
  {
    uint32_t v6 = state;
    if (qword_1000E4008 != -1) {
      dispatch_once(&qword_1000E4008, &stru_1000D5368);
    }
    unsigned int v7 = (id)qword_1000E4000;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unsigned int v8 = sub_100055404(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9)
      {
        int v19 = 67109376;
        int v20 = a3;
        __int16 v21 = 1024;
        LODWORD(v22) = v6;
        unsigned int v10 = (const char *)_os_log_send_and_compose_impl();
        v11 = (char *)v10;
        if (v10) {
          sub_100055434(v10);
        }
      }
      else
      {
        v11 = 0;
      }
      free(v11);
    }

    return 0;
  }
  else
  {
    if (qword_1000E4008 != -1) {
      dispatch_once(&qword_1000E4008, &stru_1000D5368);
    }
    unsigned int v12 = (id)qword_1000E4000;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v13 = sub_100055404(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        unsigned int v14 = v13;
      }
      else {
        unsigned int v14 = v13 & 0xFFFFFFFE;
      }
      if (v14)
      {
        int v19 = 67109376;
        int v20 = a3;
        __int16 v21 = 2048;
        uint64_t v22 = state64;
        unsigned int v15 = (const char *)_os_log_send_and_compose_impl();
        int v16 = (char *)v15;
        if (v15) {
          sub_100055434(v15);
        }
      }
      else
      {
        int v16 = 0;
      }
      free(v16);
    }

    return state64;
  }
}

@end