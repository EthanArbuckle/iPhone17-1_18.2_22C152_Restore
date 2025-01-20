@interface UMLibNotifyProvider
- (BOOL)notificationHasPostedForToken:(int)a3 error:(id *)a4;
- (BOOL)post:(id)a3;
- (BOOL)setState:(unint64_t)a3 forToken:(int)a4;
- (int)registerCheck:(id)a3;
- (int)registerPlain:(id)a3;
- (unint64_t)stateForToken:(int)a3 error:(id *)a4;
@end

@implementation UMLibNotifyProvider

- (BOOL)notificationHasPostedForToken:(int)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  *a4 = 0;
  int check = 0;
  uint32_t v6 = notify_check(a3, &check);
  if (v6)
  {
    uint32_t v7 = v6;
    if (qword_1E92A9868 != -1) {
      dispatch_once(&qword_1E92A9868, &unk_1EE0913A0);
    }
    v8 = (id)qword_1E92A9898;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v9 = sub_190C3E7E8();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        unsigned int v10 = v9;
      }
      else {
        unsigned int v10 = v9 & 0xFFFFFFFE;
      }
      if (v10)
      {
        int v20 = 67109376;
        int v21 = a3;
        __int16 v22 = 1024;
        int v23 = v7;
        v11 = (void *)_os_log_send_and_compose_impl();
        if (v11) {
          sub_190C3E7F0();
        }
      }
      else
      {
        v11 = 0;
      }
      free(v11);
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v16, *MEMORY[0x1E4F28798], 5, 0);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a4 = v17;
  }
  else
  {
    if (qword_1E92A9868 != -1) {
      dispatch_once(&qword_1E92A9868, &unk_1EE0913A0);
    }
    v12 = (id)qword_1E92A9898;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v13 = sub_190C3E7E8();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        unsigned int v14 = v13;
      }
      else {
        unsigned int v14 = v13 & 0xFFFFFFFE;
      }
      if (v14)
      {
        int v20 = 67109376;
        int v21 = a3;
        __int16 v22 = 1024;
        int v23 = check;
        v15 = (void *)_os_log_send_and_compose_impl();
        if (v15) {
          sub_190C3E7F0();
        }
      }
      else
      {
        v15 = 0;
      }
      free(v15);
    }

    return check == 1;
  }
  return result;
}

- (BOOL)post:(id)a3
{
  id v3 = a3;
  uint32_t v6 = (const char *)objc_msgSend_UTF8String(v3, v4, v5);
  uint32_t v7 = notify_post(v6);
  if (v7)
  {
    if (qword_1E92A9868 != -1) {
      dispatch_once(&qword_1E92A9868, &unk_1EE0913A0);
    }
    v8 = (id)qword_1E92A9898;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v9 = sub_190C3E7E8();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        unsigned int v10 = v9;
      }
      else {
        unsigned int v10 = v9 & 0xFFFFFFFE;
      }
      if (v10)
      {
LABEL_17:
        unsigned int v13 = (void *)_os_log_send_and_compose_impl();
        if (v13) {
          sub_190C3E7F0();
        }
        goto LABEL_20;
      }
LABEL_19:
      unsigned int v13 = 0;
LABEL_20:
      free(v13);
    }
  }
  else
  {
    if (qword_1E92A9868 != -1) {
      dispatch_once(&qword_1E92A9868, &unk_1EE0913A0);
    }
    v8 = (id)qword_1E92A9898;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v11 = sub_190C3E7E8();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12) {
        goto LABEL_17;
      }
      goto LABEL_19;
    }
  }

  return v7 == 0;
}

- (int)registerPlain:(id)a3
{
  id v3 = a3;
  objc_msgSend_UTF8String(v3, v4, v5);
  if (notify_register_plain())
  {
    if (qword_1E92A9868 != -1) {
      dispatch_once(&qword_1E92A9868, &unk_1EE0913A0);
    }
    uint32_t v6 = (id)qword_1E92A9898;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      unsigned int v7 = sub_190C3E7E8();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        unsigned int v8 = v7;
      }
      else {
        unsigned int v8 = v7 & 0xFFFFFFFE;
      }
      if (v8)
      {
        unsigned int v9 = (void *)_os_log_send_and_compose_impl();
        if (v9) {
          sub_190C3E7F0();
        }
      }
      else
      {
        unsigned int v9 = 0;
      }
      free(v9);
    }
  }
  else
  {
    if (qword_1E92A9868 != -1) {
      dispatch_once(&qword_1E92A9868, &unk_1EE0913A0);
    }
    uint32_t v6 = (id)qword_1E92A9898;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v10 = sub_190C3E7E8();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        unsigned int v11 = v10;
      }
      else {
        unsigned int v11 = v10 & 0xFFFFFFFE;
      }
      if (v11)
      {
        unsigned int v12 = (void *)_os_log_send_and_compose_impl();
        if (v12) {
          sub_190C3E7F0();
        }
      }
      else
      {
        unsigned int v12 = 0;
      }
      free(v12);
    }
  }

  return -1;
}

- (int)registerCheck:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int out_token = -1;
  id v3 = a3;
  uint32_t v6 = (const char *)objc_msgSend_UTF8String(v3, v4, v5);
  uint32_t v7 = notify_register_check(v6, &out_token);
  if (v7)
  {
    uint32_t v8 = v7;
    if (qword_1E92A9868 != -1) {
      dispatch_once(&qword_1E92A9868, &unk_1EE0913A0);
    }
    unsigned int v9 = (id)qword_1E92A9898;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unsigned int v10 = sub_190C3E7E8();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        unsigned int v11 = v10;
      }
      else {
        unsigned int v11 = v10 & 0xFFFFFFFE;
      }
      if (v11)
      {
        int v20 = 138543618;
        id v21 = v3;
        __int16 v22 = 1024;
        int v23 = v8;
        unsigned int v12 = (void *)_os_log_send_and_compose_impl();
        if (v12) {
          sub_190C3E7F0();
        }
      }
      else
      {
        unsigned int v12 = 0;
      }
      free(v12);
    }

    int v17 = -1;
  }
  else
  {
    if (qword_1E92A9868 != -1) {
      dispatch_once(&qword_1E92A9868, &unk_1EE0913A0);
    }
    unsigned int v13 = (id)qword_1E92A9898;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v14 = sub_190C3E7E8();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        int v20 = 138543618;
        id v21 = v3;
        __int16 v22 = 1024;
        int v23 = out_token;
        v16 = (void *)_os_log_send_and_compose_impl();
        if (v16) {
          sub_190C3E7F0();
        }
      }
      else
      {
        v16 = 0;
      }
      free(v16);
    }

    int v17 = out_token;
  }

  return v17;
}

- (BOOL)setState:(unint64_t)a3 forToken:(int)a4
{
  uint32_t v4 = notify_set_state(a4, a3);
  if (v4)
  {
    if (qword_1E92A9868 != -1) {
      dispatch_once(&qword_1E92A9868, &unk_1EE0913A0);
    }
    uint64_t v5 = (id)qword_1E92A9898;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unsigned int v6 = sub_190C3E7E8();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        unsigned int v7 = v6;
      }
      else {
        unsigned int v7 = v6 & 0xFFFFFFFE;
      }
      if (v7)
      {
LABEL_17:
        unsigned int v10 = (void *)_os_log_send_and_compose_impl();
        if (v10) {
          sub_190C3E7F0();
        }
        goto LABEL_20;
      }
LABEL_19:
      unsigned int v10 = 0;
LABEL_20:
      free(v10);
    }
  }
  else
  {
    if (qword_1E92A9868 != -1) {
      dispatch_once(&qword_1E92A9868, &unk_1EE0913A0);
    }
    uint64_t v5 = (id)qword_1E92A9898;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v8 = sub_190C3E7E8();
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
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  *a4 = 0;
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(a3, &state64);
  if (state)
  {
    uint32_t v6 = state;
    if (qword_1E92A9868 != -1) {
      dispatch_once(&qword_1E92A9868, &unk_1EE0913A0);
    }
    unsigned int v7 = (id)qword_1E92A9898;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unsigned int v8 = sub_190C3E7E8();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9)
      {
        int v17 = 67109376;
        int v18 = a3;
        __int16 v19 = 1024;
        LODWORD(v20) = v6;
        unsigned int v10 = (void *)_os_log_send_and_compose_impl();
        if (v10) {
          sub_190C3E7F0();
        }
      }
      else
      {
        unsigned int v10 = 0;
      }
      free(v10);
    }

    return 0;
  }
  else
  {
    if (qword_1E92A9868 != -1) {
      dispatch_once(&qword_1E92A9868, &unk_1EE0913A0);
    }
    unsigned int v11 = (id)qword_1E92A9898;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v12 = sub_190C3E7E8();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = v12 & 0xFFFFFFFE;
      }
      if (v13)
      {
        int v17 = 67109376;
        int v18 = a3;
        __int16 v19 = 2048;
        uint64_t v20 = state64;
        unsigned int v14 = (void *)_os_log_send_and_compose_impl();
        if (v14) {
          sub_190C3E7F0();
        }
      }
      else
      {
        unsigned int v14 = 0;
      }
      free(v14);
    }

    return state64;
  }
}

@end