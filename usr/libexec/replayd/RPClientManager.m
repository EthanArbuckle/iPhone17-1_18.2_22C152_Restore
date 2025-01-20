@interface RPClientManager
+ (id)sharedInstance;
- (NSMutableDictionary)bundleIDToClientDictionary;
- (RPClientManager)init;
- (id)getClientContainingBundleID:(id)a3;
- (id)getClientForBroadcastWithHostBundleID:(id)a3;
- (id)getClientMatchingBundleID:(id)a3;
- (id)getClientWithBundleID:(id)a3;
- (void)addClient:(id)a3;
- (void)dealloc;
- (void)removeClient:(id)a3;
- (void)setBundleIDToClientDictionary:(id)a3;
- (void)stopAllClientsWithHandler:(id)a3;
@end

@implementation RPClientManager

+ (id)sharedInstance
{
  if (qword_100099C70 != -1) {
    dispatch_once(&qword_100099C70, &stru_100085928);
  }
  v2 = (void *)qword_100099C68;

  return v2;
}

- (RPClientManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)RPClientManager;
  v2 = [(RPClientManager *)&v8 init];
  if (v2)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v10 = "-[RPClientManager init]";
      __int16 v11 = 1024;
      int v12 = 34;
      __int16 v13 = 2048;
      v14 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    bundleIDToClientDictionary = v2->_bundleIDToClientDictionary;
    v2->_bundleIDToClientDictionary = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mainBundleIDToBundleID = v2->_mainBundleIDToBundleID;
    v2->_mainBundleIDToBundleID = v5;
  }
  return v2;
}

- (void)dealloc
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPClientManager dealloc]";
    __int16 v6 = 1024;
    int v7 = 44;
    __int16 v8 = 2048;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v3.receiver = self;
  v3.super_class = (Class)RPClientManager;
  [(RPClientManager *)&v3 dealloc];
}

- (void)addClient:(id)a3
{
  bundleIDToClientDictionary = self->_bundleIDToClientDictionary;
  id v5 = a3;
  __int16 v6 = [v5 clientBundleID];
  [(NSMutableDictionary *)bundleIDToClientDictionary setObject:v5 forKey:v6];

  id v9 = [v5 clientBundleID];
  mainBundleIDToBundleID = self->_mainBundleIDToBundleID;
  __int16 v8 = [v5 clientMainBundleID];

  [(NSMutableDictionary *)mainBundleIDToBundleID setObject:v9 forKeyedSubscript:v8];
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  [v4 stopCurrentActiveSessionWithHandler:&stru_100085948];
  [v4 invalidate];
  bundleIDToClientDictionary = self->_bundleIDToClientDictionary;
  __int16 v6 = [v4 clientBundleID];
  [(NSMutableDictionary *)bundleIDToClientDictionary removeObjectForKey:v6];

  mainBundleIDToBundleID = self->_mainBundleIDToBundleID;
  id v8 = [v4 clientMainBundleID];

  [(NSMutableDictionary *)mainBundleIDToBundleID setObject:0 forKeyedSubscript:v8];
}

- (id)getClientWithBundleID:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(NSMutableDictionary *)self->_bundleIDToClientDictionary objectForKeyedSubscript:v4], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    __int16 v6 = [(NSMutableDictionary *)self->_bundleIDToClientDictionary objectForKeyedSubscript:v4];
  }
  else
  {
    int v7 = [(NSMutableDictionary *)self->_mainBundleIDToBundleID objectForKeyedSubscript:v4];
    if (v7)
    {
      __int16 v6 = [(NSMutableDictionary *)self->_bundleIDToClientDictionary objectForKeyedSubscript:v7];
    }
    else
    {
      __int16 v6 = 0;
    }
  }

  return v6;
}

- (id)getClientForBroadcastWithHostBundleID:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(NSMutableDictionary *)self->_bundleIDToClientDictionary objectForKeyedSubscript:v4], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = [(NSMutableDictionary *)self->_bundleIDToClientDictionary objectForKeyedSubscript:v4];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    int v7 = [(NSMutableDictionary *)self->_bundleIDToClientDictionary allValues];
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          __int16 v13 = [v12 clientBundleID];
          v14 = [v13 componentsSeparatedByString:@".pid."];

          if (v14)
          {
            if ([v14 count])
            {
              v15 = [v14 objectAtIndexedSubscript:0];
              unsigned __int8 v16 = [v4 isEqualToString:v15];

              if (v16)
              {
                id v6 = v12;

                goto LABEL_16;
              }
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v6 = 0;
  }
LABEL_16:

  return v6;
}

- (id)getClientContainingBundleID:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(NSMutableDictionary *)self->_bundleIDToClientDictionary allValues];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 clientBundleID];
        unsigned __int8 v11 = [v10 containsString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)getClientMatchingBundleID:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(NSMutableDictionary *)self->_bundleIDToClientDictionary objectForKeyedSubscript:v4], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = [(NSMutableDictionary *)self->_bundleIDToClientDictionary objectForKeyedSubscript:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)stopAllClientsWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[RPClientManager stopAllClientsWithHandler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 107;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v5 = dispatch_group_create();
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v30 = 1;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [(NSMutableDictionary *)self->_bundleIDToClientDictionary allValues];
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
  long long v13 = v4;
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v24 = 136446466;
          v25 = "-[RPClientManager stopAllClientsWithHandler:]";
          __int16 v26 = 1024;
          int v27 = 115;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d enter stop group", v24, 0x12u);
        }
        dispatch_group_enter(v5);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100024378;
        v17[3] = &unk_100085568;
        long long v19 = buf;
        long long v18 = v5;
        [v10 stopCurrentActiveSessionWithHandler:v17];
      }
      id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v7);
  }

  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v24 = 136446466;
    v25 = "-[RPClientManager stopAllClientsWithHandler:]";
    __int16 v26 = 1024;
    int v27 = 133;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notify stop group", v24, 0x12u);
  }
  unsigned __int8 v11 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024484;
  block[3] = &unk_100085970;
  id v15 = v13;
  long long v16 = buf;
  id v12 = v13;
  dispatch_group_notify(v5, v11, block);

  _Block_object_dispose(buf, 8);
}

- (NSMutableDictionary)bundleIDToClientDictionary
{
  return self->_bundleIDToClientDictionary;
}

- (void)setBundleIDToClientDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainBundleIDToBundleID, 0);

  objc_storeStrong((id *)&self->_bundleIDToClientDictionary, 0);
}

@end