@interface SACallbackManager
+ (id)activeHandlers;
+ (id)addAppSizerHandler:(id)a3;
+ (id)setUniqueIDForHandler:(id)a3;
+ (int)handlersCount;
+ (void)callAppSizeHandlersWithResults:(id)a3 error:(id)a4;
+ (void)removeAppSizerHandler:(id)a3;
@end

@implementation SACallbackManager

+ (id)setUniqueIDForHandler:(id)a3
{
  id v3 = a3;
  v4 = 0;
  while (1)
  {
    v5 = v4;
    v4 = +[NSUUID UUID];

    id v6 = (id)qword_10005AAD0;
    objc_sync_enter(v6);
    v7 = [(id)qword_10005AAD0 objectForKeyedSubscript:v4];

    if (!v7) {
      break;
    }
    objc_sync_exit(v6);
  }
  [(id)qword_10005AAD0 setObject:v3 forKeyedSubscript:v4];
  objc_sync_exit(v6);

  return v4;
}

+ (id)addAppSizerHandler:(id)a3
{
  id v3 = a3;
  id v4 = (id)qword_10005AAD0;
  objc_sync_enter(v4);
  if (!qword_10005AAD0)
  {
    uint64_t v5 = objc_opt_new();
    id v6 = (void *)qword_10005AAD0;
    qword_10005AAD0 = v5;
  }
  objc_sync_exit(v4);

  v7 = +[SACallbackManager setUniqueIDForHandler:v3];
  v8 = SALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100031A18();
  }

  return v7;
}

+ (void)removeAppSizerHandler:(id)a3
{
  id v3 = a3;
  id v4 = (id)qword_10005AAD0;
  objc_sync_enter(v4);
  if (!v3 || !qword_10005AAD0)
  {
LABEL_9:
    objc_sync_exit(v4);
    goto LABEL_10;
  }
  uint64_t v5 = [(id)qword_10005AAD0 objectForKeyedSubscript:v3];

  if (!v5)
  {
    id v6 = SALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100031A9C((uint64_t)v3, v6);
    }

    goto LABEL_9;
  }
  [(id)qword_10005AAD0 removeObjectForKey:v3];
  objc_sync_exit(v4);

  id v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100031B14();
  }
LABEL_10:
}

+ (id)activeHandlers
{
  v2 = [(id)qword_10005AAD0 allKeys];
  id v3 = +[NSSet setWithArray:v2];

  return v3;
}

+ (int)handlersCount
{
  return [(id)qword_10005AAD0 count];
}

+ (void)callAppSizeHandlersWithResults:(id)a3 error:(id)a4
{
  id v19 = a3;
  id v18 = a4;
  uint64_t v5 = SALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100031BDC(v5);
  }

  id v6 = (id)qword_10005AAD0;
  objc_sync_enter(v6);
  id v7 = [(id)qword_10005AAD0 copy];
  objc_sync_exit(v6);

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v9)
  {
    v10 = 0;
    uint64_t v17 = *(void *)v23;
    do
    {
      v11 = 0;
      v12 = v10;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v11);
        v14 = SALog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v27 = v13;
          _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "callAppSizeHandlersWithResults id (%@)", buf, 0xCu);
        }

        v10 = [v8 objectForKey:v13];

        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10001CDA0;
        v21[3] = &unk_10004CF28;
        v21[4] = v13;
        v15 = [v10 remoteObjectProxyWithErrorHandler:v21];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_10001CE10;
        v20[3] = &unk_10004CF50;
        v20[4] = v13;
        [v15 callAppSizerHandlerWithResults:v19 error:v18 withHandlerResultBlock:v20];

        v11 = (char *)v11 + 1;
        v12 = v10;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v9);
  }
  v16 = SALog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100031B98(v16);
  }
}

@end