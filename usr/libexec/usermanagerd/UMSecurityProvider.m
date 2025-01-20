@interface UMSecurityProvider
- (BOOL)deleteKeychainItemsForPersonaWithUUID:(id)a3 error:(id *)a4;
@end

@implementation UMSecurityProvider

- (BOOL)deleteKeychainItemsForPersonaWithUUID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (qword_1000E4220 != -1) {
    dispatch_once(&qword_1000E4220, &stru_1000D5D40);
  }
  v6 = (id)qword_1000E4218;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v7 = sub_100055404(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      unsigned int v8 = v7;
    }
    else {
      unsigned int v8 = v7 & 0xFFFFFFFE;
    }
    if (v8)
    {
      v9 = (const char *)_os_log_send_and_compose_impl();
      v10 = (char *)v9;
      if (v9) {
        sub_100055434(v9);
      }
    }
    else
    {
      v10 = 0;
    }
    free(v10);
  }

  id v11 = v5;
  _SecKeychainDeleteMultiUser();
  if (qword_1000E4220 != -1) {
    dispatch_once(&qword_1000E4220, &stru_1000D5D40);
  }
  v12 = (id)qword_1000E4218;
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
      v15 = (const char *)_os_log_send_and_compose_impl();
      v16 = (char *)v15;
      if (v15) {
        sub_100055434(v15);
      }
    }
    else
    {
      v16 = 0;
    }
    free(v16);
  }

  if (a4) {
    *a4 = 0;
  }

  return 1;
}

@end