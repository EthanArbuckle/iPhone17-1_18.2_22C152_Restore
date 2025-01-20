@interface FedStatsSQLiteDatabase
+ (FedStatsSQLiteDatabase)databaseWithURL:(id)a3 mode:(char)a4 error:(id *)a5;
- (BOOL)execute:(id)a3 error:(id *)a4;
- (FedStatsSQLiteDatabase)initWithDatabase:(sqlite3 *)a3;
- (id)runQuery:(id)a3 error:(id *)a4;
- (sqlite3)database;
- (void)dealloc;
@end

@implementation FedStatsSQLiteDatabase

- (FedStatsSQLiteDatabase)initWithDatabase:(sqlite3 *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FedStatsSQLiteDatabase;
  result = [(FedStatsSQLiteDatabase *)&v5 init];
  if (result) {
    result->_database = a3;
  }
  return result;
}

- (void)dealloc
{
  sqlite3_close_v2([(FedStatsSQLiteDatabase *)self database]);
  v3.receiver = self;
  v3.super_class = (Class)FedStatsSQLiteDatabase;
  [(FedStatsSQLiteDatabase *)&v3 dealloc];
}

+ (FedStatsSQLiteDatabase)databaseWithURL:(id)a3 mode:(char)a4 error:(id *)a5
{
  int v6 = a4;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = +[NSFileManager defaultManager];
    v10 = +[NSURLComponents componentsWithURL:v8 resolvingAgainstBaseURL:1];
    unsigned __int8 v37 = 0;
    if (v6 == 97)
    {
      v19 = [v8 path];
      unsigned __int8 v20 = [v9 fileExistsAtPath:v19 isDirectory:&v37];

      if ((v20 & 1) == 0)
      {
        if (a5)
        {
          goto LABEL_30;
        }
        goto LABEL_40;
      }
      if (!v37)
      {
        int v17 = 33554498;
LABEL_35:
        ppDb = 0;
        v30 = [v10 URL];
        id v31 = [v30 absoluteString];
        int v32 = sqlite3_open_v2((const char *)[v31 UTF8String], &ppDb, v17, 0);

        if (!v32)
        {
          id v34 = objc_alloc((Class)a1);
          id v18 = [v34 initWithDatabase:ppDb];
          goto LABEL_41;
        }
        if (!a5) {
          goto LABEL_40;
        }
        v15 = +[NSString stringWithFormat:@"Cannot load database: %s", sqlite3_errmsg(ppDb)];
        CFStringRef v28 = v15;
        goto LABEL_38;
      }
      goto LABEL_14;
    }
    if (v6 != 119)
    {
      if (v6 != 114)
      {
        if (a5)
        {
          CFStringRef v21 = @"Mode can be one of 'r', 'w', 'a'";
          goto LABEL_30;
        }
        goto LABEL_40;
      }
      v11 = [v8 path];
      unsigned __int8 v12 = [v9 fileExistsAtPath:v11 isDirectory:&v37];

      if ((v12 & 1) == 0)
      {
        if (a5)
        {
          goto LABEL_30;
        }
        goto LABEL_40;
      }
      if (!v37)
      {
        v13 = [v8 path];
        unsigned __int8 v14 = [v9 isReadableFileAtPath:v13];

        if (v14)
        {
          v15 = +[NSURLQueryItem queryItemWithName:@"nolock" value:@"1"];
          v38 = v15;
          id v16 = +[NSArray arrayWithObjects:&v38 count:1];
          [v10 setQueryItems:v16];
          int v17 = 33554497;
LABEL_33:

          goto LABEL_34;
        }
        if (!a5) {
          goto LABEL_40;
        }
LABEL_30:
        +[FedStatsError errorWithCode:302 description:v21];
        id v18 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:

        goto LABEL_42;
      }
LABEL_14:
      if (a5)
      {
        goto LABEL_30;
      }
LABEL_40:
      id v18 = 0;
      goto LABEL_41;
    }
    v22 = [v8 URLByResolvingSymlinksInPath];
    v15 = [v22 URLByDeletingLastPathComponent];

    v23 = [(__CFString *)v15 path];
    unsigned int v24 = [v9 fileExistsAtPath:v23 isDirectory:&v37];
    int v25 = v37;

    if (v24 && v25)
    {
      int v17 = 33554502;
      v26 = [v8 path];
      unsigned int v27 = [v9 fileExistsAtPath:v26 isDirectory:&v37];

      if (!v27)
      {
LABEL_34:

        goto LABEL_35;
      }
      if (!v37)
      {
        id v36 = 0;
        unsigned __int8 v29 = [v9 removeItemAtURL:v8 error:&v36];
        id v16 = v36;
        if ((v29 & 1) == 0)
        {
          if (a5)
          {
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_39;
        }
        goto LABEL_33;
      }
      if (a5)
      {
LABEL_38:
        *a5 = +[FedStatsError errorWithCode:302 description:v28];
      }
    }
    else if (a5)
    {
      CFStringRef v28 = @"The directory for the URL does not exist";
      goto LABEL_38;
    }
LABEL_39:

    goto LABEL_40;
  }
  if (a5)
  {
    id v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = 0;
  }
LABEL_42:

  return (FedStatsSQLiteDatabase *)v18;
}

- (id)runQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  ppStmt = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  int v7 = sqlite3_prepare_v2(-[FedStatsSQLiteDatabase database](self, "database"), (const char *)[v6 UTF8String], -1, &ppStmt, 0);
  if (v7)
  {
    if (a4)
    {
      id v8 = +[NSString stringWithFormat:@"Cannot prepare query: %s", sqlite3_errstr(v7)];
      *a4 = +[FedStatsError errorWithCode:302 description:v8];
    }
LABEL_7:
    v9 = 0;
    goto LABEL_9;
  }
  v10 = [FedStatSQLiteDatabaseQueryResult alloc];
  v9 = [(FedStatSQLiteDatabaseQueryResult *)v10 initWithQueryStatement:ppStmt];
LABEL_9:

  return v9;
}

- (BOOL)execute:(id)a3 error:(id *)a4
{
  errmsg = 0;
  id v6 = a3;
  int v7 = [(FedStatsSQLiteDatabase *)self database];
  id v8 = v6;
  v9 = (const char *)[v8 UTF8String];

  int v10 = sqlite3_exec(v7, v9, 0, 0, &errmsg);
  int v11 = v10;
  if (a4 && v10)
  {
    unsigned __int8 v12 = +[NSString stringWithFormat:@"Database execute error: %s", errmsg];
    *a4 = +[FedStatsError errorWithCode:302 description:v12];
  }
  return v11 == 0;
}

- (sqlite3)database
{
  return self->_database;
}

@end