@interface NSSKeyedArchiverUtil
+ (BOOL)archiveObject:(id)a3 toFile:(id)a4 options:(unint64_t)a5 error:(id *)a6;
+ (id)archiveObject:(id)a3;
+ (id)unarchiveObjectOfClasses:(id)a3 withData:(id)a4;
+ (id)unarchiveObjectOfClasses:(id)a3 withFile:(id)a4;
@end

@implementation NSSKeyedArchiverUtil

+ (id)unarchiveObjectOfClasses:(id)a3 withFile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v13 = 0;
  v8 = +[NSData dataWithContentsOfFile:v7 options:0 error:&v13];
  id v9 = v13;
  if (v9)
  {
    v10 = NSSLogForType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
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
    id v12 = 0;
    id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v5 fromData:v6 error:&v12];
    id v8 = v12;
    if (v8)
    {
      id v9 = NSSLogForType();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 length]);
        *(_DWORD *)buf = 138412802;
        id v14 = v8;
        __int16 v15 = 2112;
        id v16 = v5;
        __int16 v17 = 2112;
        v18 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error (%@) unarchiving expected classes (%@) with (%@) bytes data", buf, 0x20u);
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
    id v10 = 0;
    v4 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v10];
    id v5 = v10;
    if (v5)
    {
      id v6 = NSSLogForType();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = (objc_class *)objc_opt_class();
        id v8 = NSStringFromClass(v7);
        *(_DWORD *)buf = 138412546;
        id v12 = v5;
        __int16 v13 = 2112;
        id v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Error (%@) archiving (%@)", buf, 0x16u);
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)archiveObject:(id)a3 toFile:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  v11 = [a1 archiveObject:a3];
  LOBYTE(a6) = [v11 writeToFile:v10 options:a5 error:a6];

  return (char)a6;
}

@end