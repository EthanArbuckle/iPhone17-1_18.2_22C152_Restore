@interface NBKeyedArchiverUtil
+ (id)archiveObject:(id)a3;
+ (id)unarchiveObjectOfClasses:(id)a3 withData:(id)a4;
+ (id)unarchiveObjectOfClasses:(id)a3 withFile:(id)a4;
@end

@implementation NBKeyedArchiverUtil

+ (id)unarchiveObjectOfClasses:(id)a3 withFile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v13 = 0;
  v8 = +[NSData dataWithContentsOfFile:v7 options:0 error:&v13];
  id v9 = v13;
  if (v9)
  {
    v10 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Error (%@) reading data from (%@)", buf, 0x16u);
    }
  }
  if (v8)
  {
    v11 = [a1 unarchiveObjectOfClasses:v6 withData:v8];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)unarchiveObjectOfClasses:(id)a3 withData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v13 = 0;
    id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v5 fromData:v6 error:&v13];
    id v8 = v13;
    if (v8)
    {
      id v9 = (void *)nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 length]);
        *(_DWORD *)buf = 138412802;
        id v15 = v8;
        __int16 v16 = 2112;
        id v17 = v5;
        __int16 v18 = 2112;
        v19 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Error (%@) unarchiving expected classes (%@) with (%@) bytes data", buf, 0x20u);
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)archiveObject:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v11 = 0;
    v4 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v11];
    id v5 = v11;
    if (v5)
    {
      id v6 = (void *)nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = v6;
        id v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138412546;
        id v13 = v5;
        __int16 v14 = 2112;
        id v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error (%@) archiving (%@)", buf, 0x16u);
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end