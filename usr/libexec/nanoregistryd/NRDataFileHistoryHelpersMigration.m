@interface NRDataFileHistoryHelpersMigration
+ (BOOL)archiveMigrationRoutingSlip:(id)a3;
+ (BOOL)createClassAFile;
+ (BOOL)hasClassAFile;
+ (BOOL)removeMigrationRoutingSlip;
+ (id)unarchiveMigrationRoutingSlip;
@end

@implementation NRDataFileHistoryHelpersMigration

+ (BOOL)archiveMigrationRoutingSlip:(id)a3
{
  id v3 = a3;
  v4 = +[NRDataFilePaths pathToNanoRegistryMigrationRoutingSlip];
  v6 = +[NSKeyedArchiver nr_secureArchivedDataWithRootObject:v3];
  v7 = v6;
  if (!v6)
  {
    v11 = nr_daemon_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (!v12)
    {
      id v9 = 0;
      goto LABEL_13;
    }
    v13 = nr_daemon_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000FB604((uint64_t)v4, v13);
    }
    id v9 = 0;
    goto LABEL_11;
  }
  v17[0] = 0;
  unsigned __int8 v8 = [v6 writeToFile:v4 options:268435457 error:v17];
  id v9 = v17[0];
  if ((v8 & 1) == 0)
  {
    v14 = nr_daemon_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

    if (!v15)
    {
LABEL_13:
      BOOL v10 = 0;
      goto LABEL_14;
    }
    v13 = nr_daemon_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [v9 nr_safeDescription];
      objc_claimAutoreleasedReturnValue();
      sub_1000FB67C();
    }
LABEL_11:

    goto LABEL_13;
  }
  BOOL v10 = 1;
LABEL_14:

  return v10;
}

+ (id)unarchiveMigrationRoutingSlip
{
  v2 = +[NSSet setWithObject:objc_opt_class()];
  id v3 = +[NRDataFilePaths pathToNanoRegistryMigrationRoutingSlip];
  v4 = +[NSKeyedUnarchiver nr_secureUnarchiveObjectOfClasses:v2 withFile:v3];

  if (!v4)
  {
    v5 = nr_daemon_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      v7 = nr_daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v8 = +[NRDataFilePaths pathToNanoRegistryMigrationRoutingSlip];
        int v10 = 138543362;
        v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failure loading migration routing slip file %{public}@: Unarchiver returned nil.", (uint8_t *)&v10, 0xCu);
      }
    }
    v4 = 0;
  }

  return v4;
}

+ (BOOL)removeMigrationRoutingSlip
{
  v2 = +[NSFileManager defaultManager];
  id v3 = +[NRDataFilePaths pathToNanoRegistryMigrationRoutingSlip];
  id v9 = 0;
  [v2 removeItemAtPath:v3 error:&v9];
  id v4 = v9;

  if (v4)
  {
    v5 = nr_daemon_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      v7 = nr_daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000FB710(v4, v7);
      }
    }
  }

  return v4 == 0;
}

+ (BOOL)createClassAFile
{
  v2 = +[NRDataFilePaths pathToNanoRegistryClassAFile];
  id v3 = +[NSFileManager defaultManager];
  unsigned __int8 v4 = [v3 fileExistsAtPath:v2];

  v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    if (!v6)
    {
      unsigned __int8 v8 = 1;
      goto LABEL_17;
    }
    v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "createClassAFile: File already exists", v14, 2u);
    }
    unsigned __int8 v8 = 1;
  }
  else
  {
    if (v6)
    {
      id v9 = nr_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "createClassAFile: Class A file does not exist", buf, 2u);
      }
    }
    v7 = [@"Class A file\n" dataUsingEncoding:4];
    unsigned __int8 v8 = [v7 writeToFile:v2 options:536870913 error:0];
    if ((v8 & 1) == 0)
    {
      int v10 = nr_daemon_log();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

      if (v11)
      {
        BOOL v12 = nr_daemon_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)BOOL v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "createClassAFile: Failed to create Class A file", v15, 2u);
        }
      }
    }
  }

LABEL_17:
  return v8;
}

+ (BOOL)hasClassAFile
{
  v2 = +[NRDataFilePaths pathToNanoRegistryClassAFile];
  id v3 = +[NSFileManager defaultManager];
  unsigned int v4 = [v3 fileExistsAtPath:v2];

  v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v8 = "NOT ";
      if (v4) {
        unsigned __int8 v8 = "";
      }
      int v10 = 136315138;
      BOOL v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Class A file %sfound!", (uint8_t *)&v10, 0xCu);
    }
  }
  return v4;
}

@end