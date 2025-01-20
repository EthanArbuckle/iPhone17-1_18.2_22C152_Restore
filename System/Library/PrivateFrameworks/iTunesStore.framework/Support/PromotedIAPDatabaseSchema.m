@interface PromotedIAPDatabaseSchema
+ (BOOL)createOrUpdateSchemaInDatabase:(id)a3;
+ (id)databasePath;
+ (id)databasePath_11_0_00;
@end

@implementation PromotedIAPDatabaseSchema

+ (BOOL)createOrUpdateSchemaInDatabase:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (uint64_t)[v3 userVersion];
  uint64_t v21 = v4;
  if (v4 > 11000)
  {
LABEL_6:
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = v4;
    while (!v5)
    {
      if ((sub_10007C510(v3, &v21) & 1) == 0)
      {
        v7 = +[SSLogConfig sharedConfig];
        unsigned int v14 = [v7 shouldLog];
        if ([v7 shouldLogToDisk]) {
          int v15 = v14 | 2;
        }
        else {
          int v15 = v14;
        }
        v16 = [v7 OSLogObject];
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          v15 &= 2u;
        }
        if (v15)
        {
          v17 = objc_opt_class();
          int v22 = 138543618;
          v23 = v17;
          __int16 v24 = 2048;
          uint64_t v25 = v21;
          id v18 = v17;
          LODWORD(v20) = 22;
          v13 = (void *)_os_log_send_and_compose_impl();

          if (!v13) {
            goto LABEL_25;
          }
LABEL_22:
          v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v22, v20);
          free(v13);
          SSFileLog();
        }

        goto LABEL_25;
      }
      uint64_t v5 = v21;
      if (v21 > 11000) {
        goto LABEL_6;
      }
    }
    v7 = +[SSLogConfig sharedConfig];
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      v11 = objc_opt_class();
      int v22 = 138543874;
      v23 = v11;
      __int16 v24 = 2048;
      uint64_t v25 = v5;
      __int16 v26 = 2048;
      uint64_t v27 = 11001;
      id v12 = v11;
      LODWORD(v20) = 32;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13) {
        goto LABEL_25;
      }
      goto LABEL_22;
    }

LABEL_25:
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)databasePath
{
  if (qword_100401CF8 != -1) {
    dispatch_once(&qword_100401CF8, &stru_1003A4DA0);
  }
  v2 = (void *)qword_100401CF0;

  return v2;
}

+ (id)databasePath_11_0_00
{
  id v2 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", CPSharedResourcesDirectory(), @"Library", @"Caches", @"com.apple.itunesstored", @"PromotedIAPs.sqlitedb", 0);
  id v3 = +[NSString pathWithComponents:v2];

  return v3;
}

@end