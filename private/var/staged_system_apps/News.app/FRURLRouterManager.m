@interface FRURLRouterManager
- (BOOL)handleOpenURL:(id)a3 options:(id)a4 analyticsReferral:(id)a5;
- (FRURLRouterManager)init;
- (NSMutableArray)routers;
- (void)addRoutable:(id)a3;
@end

@implementation FRURLRouterManager

- (FRURLRouterManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)FRURLRouterManager;
  v2 = [(FRURLRouterManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    routers = v2->_routers;
    v2->_routers = v3;
  }
  return v2;
}

- (void)addRoutable:(id)a3
{
  id v4 = a3;
  id v5 = [(FRURLRouterManager *)self routers];
  [v5 addObject:v4];
}

- (NSMutableArray)routers
{
  return self->_routers;
}

- (BOOL)handleOpenURL:(id)a3 options:(id)a4 analyticsReferral:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = FRNavigationLog;
  if (os_log_type_enabled((os_log_t)FRNavigationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "URLRouterManager received URL to handle <%{public}@>", buf, 0xCu);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v12 = [(FRURLRouterManager *)self routers];
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v15 = *(void *)v22;
    *(void *)&long long v14 = 138543618;
    long long v20 = v14;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v18 = FRNavigationLog;
        if (os_log_type_enabled((os_log_t)FRNavigationLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v20;
          id v26 = v8;
          __int16 v27 = 2112;
          v28 = v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "URLRouterManager sending URL <%{public}@> to router %@", buf, 0x16u);
        }
        if (objc_msgSend(v17, "handleOpenURL:options:analyticsReferral:", v8, v9, v10, v20))
        {
          LOBYTE(v13) = 1;
          goto LABEL_15;
        }
      }
      id v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return (char)v13;
}

- (void).cxx_destruct
{
}

@end