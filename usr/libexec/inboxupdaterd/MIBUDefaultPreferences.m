@interface MIBUDefaultPreferences
+ (BOOL)removeObjectForKey:(id)a3;
+ (BOOL)setObject:(id)a3 forKey:(id)a4;
+ (id)dictionaryRepresentation;
+ (id)objectForKey:(id)a3;
@end

@implementation MIBUDefaultPreferences

+ (BOOL)setObject:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005AE00);
  }
  v7 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    v13 = "+[MIBUDefaultPreferences setObject:forKey:]";
    __int16 v14 = 2114;
    id v15 = v5;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s - Setting %{public}@ for key %{public}@", (uint8_t *)&v12, 0x20u);
  }
  v8 = +[NSUserDefaults standardUserDefaults];
  [v8 setObject:v5 forKey:v6];
  unsigned __int8 v9 = [v8 synchronize];
  if ((v9 & 1) == 0)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005AE20);
    }
    v10 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003FE20((uint64_t)v5, (uint64_t)v6, v10);
    }
  }

  return v9;
}

+ (id)objectForKey:(id)a3
{
  id v3 = a3;
  v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 objectForKey:v3];

  return v5;
}

+ (BOOL)removeObjectForKey:(id)a3
{
  return [a1 setObject:0 forKey:a3];
}

+ (id)dictionaryRepresentation
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 dictionaryRepresentation];

  return v3;
}

@end