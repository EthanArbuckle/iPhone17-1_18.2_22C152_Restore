@interface SALLMList
+ (BOOL)isLLM:(id)a3;
+ (void)billLLMsToSystemOn:(id)a3 andTelemetry:(id)a4;
@end

@implementation SALLMList

+ (BOOL)isLLM:(id)a3
{
  id v3 = a3;
  if (qword_10005AB58 != -1) {
    dispatch_once(&qword_10005AB58, &stru_10004D278);
  }
  v4 = [(id)qword_10005AB50 objectForKeyedSubscript:v3];
  if (v4)
  {
    v5 = [(id)qword_10005AB50 objectForKeyedSubscript:v3];
    unsigned __int8 v6 = [v5 isEqual:&__kCFBooleanTrue];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

+ (void)billLLMsToSystemOn:(id)a3 andTelemetry:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = SALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "+[SALLMList billLLMsToSystemOn:andTelemetry:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s start", buf, 0xCu);
  }

  v8 = [v5 appsDataInternal];
  id v9 = [v8 mutableCopy];

  +[NSSet setWithObject:@"com.apple.fakeapp.System"];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002388C;
  v14[3] = &unk_10004D2A0;
  id v15 = v5;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v6;
  id v10 = v6;
  id v11 = v16;
  id v12 = v5;
  [v9 enumerateKeysAndObjectsUsingBlock:v14];
  v13 = SALog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "+[SALLMList billLLMsToSystemOn:andTelemetry:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s end", buf, 0xCu);
  }
}

@end