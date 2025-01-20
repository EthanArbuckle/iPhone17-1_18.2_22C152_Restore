@interface NSKeyedUnarchiver
+ (id)tsu_securelyUnarchiveObjectWithFile:(id)a3 ofClasses:(id)a4;
+ (id)tsu_securelyUnarchiveRoot:(id)a3 forClass:(Class)a4;
+ (id)tsu_securelyUnarchiveRoot:(id)a3 forClasses:(id)a4;
@end

@implementation NSKeyedUnarchiver

+ (id)tsu_securelyUnarchiveRoot:(id)a3 forClass:(Class)a4
{
  id v5 = a3;
  v6 = objc_opt_class();
  v7 = +[NSSet setWithObject:a4];
  v8 = objc_msgSend(v6, "tsu_securelyUnarchiveRoot:forClasses:", v5, v7);

  return v8;
}

+ (id)tsu_securelyUnarchiveRoot:(id)a3 forClasses:(id)a4
{
  id v5 = a3;
  id v11 = 0;
  v6 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:a4 fromData:v5 error:&v11];
  id v7 = v11;
  if (!v6)
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001CBC88);
    }
    v8 = TSUDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100164238((uint64_t)v5, v8, v7);
    }
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001CBCA8);
    }
    v9 = TSUDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_DEBUG)) {
      sub_1001641C0((uint64_t)v5, v9);
    }
  }

  return v6;
}

+ (id)tsu_securelyUnarchiveObjectWithFile:(id)a3 ofClasses:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v12 = 0;
  id v7 = +[NSData dataWithContentsOfFile:v5 options:0 error:&v12];
  id v8 = v12;
  if (v7)
  {
    v9 = objc_msgSend((id)objc_opt_class(), "tsu_securelyUnarchiveRoot:forClasses:", v7, v6);
  }
  else
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001CBCC8);
    }
    v10 = TSUDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100164300((uint64_t)v5, v10, v8);
    }
    v9 = 0;
  }

  return v9;
}

@end