@interface NSKeyedUnarchiver
+ (id)crl_securelyUnarchiveObjectWithFile:(id)a3 ofClasses:(id)a4;
+ (id)crl_securelyUnarchiveRoot:(id)a3 forClass:(Class)a4;
+ (id)crl_securelyUnarchiveRoot:(id)a3 forClasses:(id)a4;
@end

@implementation NSKeyedUnarchiver

+ (id)crl_securelyUnarchiveRoot:(id)a3 forClass:(Class)a4
{
  id v5 = a3;
  v6 = objc_opt_class();
  v7 = +[NSSet setWithObject:a4];
  v8 = [v6 crl_securelyUnarchiveRoot:v5 forClasses:v7];

  return v8;
}

+ (id)crl_securelyUnarchiveRoot:(id)a3 forClasses:(id)a4
{
  id v5 = a3;
  id v11 = 0;
  v6 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:a4 fromData:v5 error:&v11];
  id v7 = v11;
  if (!v6)
  {
    if (qword_101719A68 != -1) {
      dispatch_once(&qword_101719A68, &stru_1014D0888);
    }
    v8 = off_10166B498;
    if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
      sub_10106F86C((uint64_t)v5, v8, v7);
    }
    if (qword_101719A68 != -1) {
      dispatch_once(&qword_101719A68, &stru_1014D08A8);
    }
    v9 = off_10166B498;
    if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_DEBUG)) {
      sub_10106F7F4((uint64_t)v5, v9);
    }
  }

  return v6;
}

+ (id)crl_securelyUnarchiveObjectWithFile:(id)a3 ofClasses:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v12 = 0;
  id v7 = +[NSData dataWithContentsOfFile:v5 options:0 error:&v12];
  id v8 = v12;
  if (v7)
  {
    v9 = [objc_opt_class() crl_securelyUnarchiveRoot:v7 forClasses:v6];
  }
  else
  {
    if (qword_101719A68 != -1) {
      dispatch_once(&qword_101719A68, &stru_1014D08C8);
    }
    v10 = off_10166B498;
    if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
      sub_10106F934((uint64_t)v5, v10, v8);
    }
    v9 = 0;
  }

  return v9;
}

@end