@interface SAURlSizersManager
+ (id)addURLSizerConfiguration:(id)a3;
+ (id)getURLSizerConfiguration:(id)a3;
+ (id)setUniqueIDForURLSizer:(id)a3;
+ (void)callURLSizer:(id)a3 withResults:(id)a4 error:(id)a5;
+ (void)removeURLSizerHandler:(id)a3;
@end

@implementation SAURlSizersManager

+ (id)setUniqueIDForURLSizer:(id)a3
{
  id v3 = a3;
  v4 = 0;
  while (1)
  {
    v5 = v4;
    v4 = +[NSUUID UUID];

    id v6 = (id)qword_10005AAE0;
    objc_sync_enter(v6);
    v7 = (void *)qword_10005AAE0;
    if (!qword_10005AAE0)
    {
      uint64_t v8 = objc_opt_new();
      v9 = (void *)qword_10005AAE0;
      qword_10005AAE0 = v8;

      v7 = (void *)qword_10005AAE0;
    }
    v10 = [v7 objectForKey:v4];

    if (!v10) {
      break;
    }
    objc_sync_exit(v6);
  }
  [(id)qword_10005AAE0 setObject:v3 forKey:v4];
  objc_sync_exit(v6);

  [v3 setSizerID:v4];
  return v4;
}

+ (id)getURLSizerConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = (id)qword_10005AAE0;
  objc_sync_enter(v4);
  v5 = [(id)qword_10005AAE0 objectForKey:v3];
  objc_sync_exit(v4);

  if (!v5)
  {
    id v6 = SALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100031D10(v3, v6);
    }
  }
  return v5;
}

+ (id)addURLSizerConfiguration:(id)a3
{
  id v18 = a3;
  id v4 = objc_msgSend(a1, "setUniqueIDForURLSizer:");
  id obj = (id)qword_10005AAD8;
  objc_sync_enter(obj);
  if (!qword_10005AAD8)
  {
    uint64_t v5 = objc_opt_new();
    id v6 = (void *)qword_10005AAD8;
    qword_10005AAD8 = v5;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v7 = objc_msgSend(v18, "urls", obj);
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v13 = [(id)qword_10005AAD8 objectForKeyedSubscript:v11];
        if (!v13)
        {
          v14 = objc_opt_new();
          [(id)qword_10005AAD8 setObject:v14 forKeyedSubscript:v11];

          v13 = [(id)qword_10005AAD8 objectForKeyedSubscript:v11];
        }
        [v13 addObject:v4];
      }
      id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  objc_sync_exit(obja);
  return v4;
}

+ (void)removeURLSizerHandler:(id)a3
{
  id v3 = a3;
  id v4 = (id)qword_10005AAE0;
  objc_sync_enter(v4);
  if (qword_10005AAE0
    && ([(id)qword_10005AAE0 objectForKeyedSubscript:v3],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [(id)qword_10005AAE0 removeObjectForKey:v3];
    objc_sync_exit(v4);

    id obj = (id)qword_10005AAD8;
    objc_sync_enter(obj);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v6 = (id)qword_10005AAD8;
    id v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    long long v20 = (void *)v5;
    id v8 = 0;
    if (v7)
    {
      uint64_t v9 = *(void *)v28;
      do
      {
        v10 = 0;
        uint64_t v11 = v8;
        do
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v6);
          }
          id v8 = [(id)qword_10005AAD8 objectForKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * (void)v10)];

          [v8 removeObject:v3];
          v10 = (char *)v10 + 1;
          uint64_t v11 = v8;
        }
        while (v7 != v10);
        id v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v7);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = [(id)qword_10005AAD8 copy];
    id v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v24;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v17 = [v12 objectForKeyedSubscript:v16];
          BOOL v18 = [v17 count] == 0;

          if (v18) {
            [(id)qword_10005AAD8 removeObjectForKey:v16];
          }
        }
        id v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v13);
    }

    objc_sync_exit(obj);

    id v4 = v20;
  }
  else
  {
    long long v19 = SALog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100031DAC((uint64_t)v3, v19);
    }

    objc_sync_exit(v4);
  }
}

+ (void)callURLSizer:(id)a3 withResults:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = SALog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100031EA8(v10);
  }

  uint64_t v11 = [v7 sizerID];
  id v12 = [v7 replyController];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001DEC8;
  v23[3] = &unk_10004CF28;
  id v13 = v11;
  id v24 = v13;
  uint64_t v14 = [v12 remoteObjectProxyWithErrorHandler:v23];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001DF38;
  v19[3] = &unk_10004CF78;
  id v20 = v13;
  id v21 = v7;
  id v22 = v8;
  id v15 = v8;
  id v16 = v7;
  id v17 = v13;
  [v14 callURLSizerHandlerWithResults:v15 error:v9 withHandlerResultsBlock:v19];

  BOOL v18 = SALog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_100031E24(v18);
  }
}

@end