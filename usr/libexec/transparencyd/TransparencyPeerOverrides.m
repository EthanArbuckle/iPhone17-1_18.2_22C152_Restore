@interface TransparencyPeerOverrides
- (NSMutableDictionary)storage;
- (TransparencyPeerOverrides)init;
- (id)listPeerOverrides;
- (void)applyPeerOverrides:(id)a3 peer:(id)a4;
- (void)clearPeerOverride:(id)a3 application:(id)a4;
- (void)setPeerOverride:(id)a3 application:(id)a4 state:(id)a5;
- (void)setStorage:(id)a3;
@end

@implementation TransparencyPeerOverrides

- (TransparencyPeerOverrides)init
{
  v5.receiver = self;
  v5.super_class = (Class)TransparencyPeerOverrides;
  v2 = [(TransparencyPeerOverrides *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    [(TransparencyPeerOverrides *)v2 setStorage:v3];
  }
  return v2;
}

- (void)setPeerOverride:(id)a3 application:(id)a4 state:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_10032F308 != -1) {
    dispatch_once(&qword_10032F308, &stru_1002C9650);
  }
  v11 = (void *)qword_10032F310;
  if (os_log_type_enabled((os_log_t)qword_10032F310, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    *(_DWORD *)buf = 138412802;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2048;
    id v22 = [v10 uiStatus];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "setPeerOverride %@ %@ %lu", buf, 0x20u);
  }
  v13 = [(TransparencyPeerOverrides *)self storage];
  objc_sync_enter(v13);
  v14 = [(TransparencyPeerOverrides *)self storage];
  v16[0] = v8;
  v16[1] = v9;
  v15 = +[NSArray arrayWithObjects:v16 count:2];
  [v14 setObject:v10 forKeyedSubscript:v15];

  objc_sync_exit(v13);
}

- (void)clearPeerOverride:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10032F308 != -1) {
    dispatch_once(&qword_10032F308, &stru_1002C9670);
  }
  id v8 = qword_10032F310;
  if (os_log_type_enabled((os_log_t)qword_10032F310, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "clearPeerOverride %@ %@", buf, 0x16u);
  }
  id v9 = [(TransparencyPeerOverrides *)self storage];
  objc_sync_enter(v9);
  id v10 = [(TransparencyPeerOverrides *)self storage];
  v12[0] = v6;
  v12[1] = v7;
  v11 = +[NSArray arrayWithObjects:v12 count:2];
  [v10 removeObjectForKey:v11];

  objc_sync_exit(v9);
}

- (id)listPeerOverrides
{
  id v3 = [(TransparencyPeerOverrides *)self storage];
  objc_sync_enter(v3);
  v4 = [(TransparencyPeerOverrides *)self storage];
  objc_sync_exit(v3);

  return v4;
}

- (void)applyPeerOverrides:(id)a3 peer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = os_variant_allows_internal_security_policies();
  if (v7)
  {
    if (v8)
    {
      id v9 = [v7 uri];
      if (v9)
      {
        id v10 = [v7 application];

        if (v10)
        {
          v11 = [v7 uri];
          v30[0] = v11;
          v12 = [v7 application];
          v30[1] = v12;
          v13 = +[NSArray arrayWithObjects:v30 count:2];

          id v14 = [(TransparencyPeerOverrides *)self storage];
          objc_sync_enter(v14);
          __int16 v15 = [(TransparencyPeerOverrides *)self storage];
          id v16 = [v15 objectForKey:v13];
          BOOL v17 = v16 == 0;

          if (!v17)
          {
            id v18 = [(TransparencyPeerOverrides *)self storage];
            __int16 v19 = [v18 objectForKeyedSubscript:v13];

            if (qword_10032F308 != -1) {
              dispatch_once(&qword_10032F308, &stru_1002C9690);
            }
            id v20 = (id)qword_10032F310;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              id v21 = [v19 uiStatus];
              id v22 = [v7 uri];
              v23 = [v7 application];
              int v24 = 134218498;
              id v25 = v21;
              __int16 v26 = 2112;
              v27 = v22;
              __int16 v28 = 2112;
              v29 = v23;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "applyPeerOverrides setting UI status %lu for %@, %@", (uint8_t *)&v24, 0x20u);
            }
            [v6 setUiStatus:[v19 uiStatus]];
          }
          objc_sync_exit(v14);
        }
      }
    }
  }
}

- (NSMutableDictionary)storage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end