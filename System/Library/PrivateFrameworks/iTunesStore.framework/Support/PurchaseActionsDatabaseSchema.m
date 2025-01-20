@interface PurchaseActionsDatabaseSchema
+ (BOOL)createOrUpdateSchemaInDatabase:(id)a3;
+ (id)databasePath;
@end

@implementation PurchaseActionsDatabaseSchema

+ (BOOL)createOrUpdateSchemaInDatabase:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (uint64_t)[v3 userVersion];
  uint64_t v20 = v4;
  if (v4 > 11301)
  {
LABEL_15:
    BOOL v7 = 1;
    goto LABEL_27;
  }
  while (1)
  {
    if (v4 > 11000)
    {
      switch(v4)
      {
        case 11001:
          v5 = sub_10014D814;
          break;
        case 11300:
          v5 = (id (*)(void *, uint64_t *))sub_10014D888;
          break;
        case 11301:
          v5 = sub_10014D928;
          break;
        default:
          goto LABEL_28;
      }
      goto LABEL_12;
    }
    v6 = sub_10014D6F4;
    if (!v4) {
      goto LABEL_13;
    }
    if (v4 != 11000) {
      break;
    }
    v5 = sub_10014D7A0;
LABEL_12:
    v6 = v5;
LABEL_13:
    if (((uint64_t)v6(v3, &v20) & 1) == 0)
    {
      v8 = +[SSLogConfig sharedConfig];
      unsigned int v9 = [v8 shouldLog];
      if ([v8 shouldLogToDisk]) {
        int v10 = v9 | 2;
      }
      else {
        int v10 = v9;
      }
      v11 = [v8 OSLogObject];
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        v10 &= 2u;
      }
      if (!v10) {
        goto LABEL_25;
      }
      v12 = objc_opt_class();
      int v21 = 138543618;
      v22 = v12;
      __int16 v23 = 2048;
      uint64_t v24 = v20;
      id v13 = v12;
      LODWORD(v19) = 22;
      goto LABEL_23;
    }
    uint64_t v4 = v20;
    if (v20 > 11301) {
      goto LABEL_15;
    }
  }
LABEL_28:
  v8 = +[SSLogConfig sharedConfig];
  unsigned int v16 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v17 = v16 | 2;
  }
  else {
    int v17 = v16;
  }
  v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    v17 &= 2u;
  }
  if (!v17) {
    goto LABEL_25;
  }
  v18 = objc_opt_class();
  int v21 = 138543874;
  v22 = v18;
  __int16 v23 = 2048;
  uint64_t v24 = v20;
  __int16 v25 = 2048;
  uint64_t v26 = 11302;
  id v13 = v18;
  LODWORD(v19) = 32;
LABEL_23:
  v14 = (void *)_os_log_send_and_compose_impl();

  if (!v14) {
    goto LABEL_26;
  }
  v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v21, v19);
  free(v14);
  SSFileLog();
LABEL_25:

LABEL_26:
  BOOL v7 = 0;
LABEL_27:

  return v7;
}

+ (id)databasePath
{
  if (qword_100401F10 != -1) {
    dispatch_once(&qword_100401F10, &stru_1003A7E00);
  }
  v2 = (void *)qword_100401F08;

  return v2;
}

@end