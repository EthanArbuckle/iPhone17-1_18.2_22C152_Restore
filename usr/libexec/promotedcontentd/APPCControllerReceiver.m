@interface APPCControllerReceiver
- (APUnfairLock)lock;
- (APXPCConnection)connection;
- (NSMutableSet)coordinators;
- (Protocol)exportedInterface;
- (id)_coordinatorForRequester:(id)a3 clientInfo:(id)a4;
- (id)remoteObjectInterface;
- (void)_finishedWithAllRequests;
- (void)_finishedWithRequestsForCoordinator:(id)a3;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)extendCollectionClassesForExportedInterface:(id)a3;
- (void)extendCollectionClassesForRemoteInterface:(id)a3;
- (void)finishedWithRequestsForRequester:(id)a3;
- (void)preWarm:(id)a3;
- (void)proxyURLWithCompletionHandler:(id)a3;
- (void)requestPromotedContentOfTypes:(id)a3 forRequester:(id)a4 forContext:(id)a5 withClientInfo:(id)a6 deliverEntireBatch:(BOOL)a7 completionHandler:(id)a8;
- (void)sendAndRankContent:(id)a3 forContext:(id)a4 placement:(unint64_t)a5 completionHandler:(id)a6;
- (void)setConnection:(id)a3;
- (void)setCoordinators:(id)a3;
@end

@implementation APPCControllerReceiver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinators, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)connectionInvalidated
{
  v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 141558274;
    uint64_t v6 = 1752392040;
    __int16 v7 = 2112;
    id v8 = (id)objc_opt_class();
    id v4 = v8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{mask.hash}@] Connection from client has been invalidated.", (uint8_t *)&v5, 0x16u);
  }
  [(APPCControllerReceiver *)self _finishedWithAllRequests];
}

- (void)extendCollectionClassesForRemoteInterface:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, objc_opt_class(), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setClasses:v5 forSelector:"contentResponses:requester:" argumentIndex:0 ofReply:0];
}

- (void)extendCollectionClassesForExportedInterface:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, objc_opt_class(), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setClasses:v5 forSelector:"sendAndRankContent:forContext:placement:completionHandler:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v5 forSelector:"sendAndRankContent:forContext:placement:completionHandler:" argumentIndex:0 ofReply:1];
}

- (void)finishedWithRequestsForRequester:(id)a3
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10017F104;
  v14[3] = &unk_100238A08;
  id v4 = a3;
  id v15 = v4;
  id v5 = +[NSPredicate predicateWithBlock:v14];
  uint64_t v6 = [(APPCControllerReceiver *)self lock];
  [v6 lock];

  __int16 v7 = APLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_opt_class();
    *(_DWORD *)buf = 138478083;
    v17 = v8;
    __int16 v18 = 2114;
    id v19 = v4;
    id v9 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{private}@] Finished with requests for %{public}@", buf, 0x16u);
  }
  v10 = [(APPCControllerReceiver *)self coordinators];
  [v10 filterUsingPredicate:v5];

  v11 = [(APPCControllerReceiver *)self lock];
  [v11 unlock];

  v12 = [(APPCControllerReceiver *)self coordinators];
  id v13 = [v12 count];

  if (!v13) {
    [(APPCControllerReceiver *)self _finishedWithAllRequests];
  }
}

- (NSMutableSet)coordinators
{
  return self->_coordinators;
}

- (void)_finishedWithAllRequests
{
  id v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v9 = 136642819;
    v10 = "-[APPCControllerReceiver _finishedWithAllRequests]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{sensitive}s: Removing all coordinators and setting APXPCConnection to nil", (uint8_t *)&v9, 0xCu);
  }

  id v4 = [(APPCControllerReceiver *)self lock];
  [v4 lock];

  id v5 = [(APPCControllerReceiver *)self coordinators];
  [v5 removeAllObjects];

  uint64_t v6 = APLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 136642819;
    v10 = "-[APPCControllerReceiver _finishedWithAllRequests]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{sensitive}s: Invalidating APXPCConnection", (uint8_t *)&v9, 0xCu);
  }

  __int16 v7 = [(APPCControllerReceiver *)self connection];
  [v7 invalidate];

  [(APPCControllerReceiver *)self setConnection:0];
  id v8 = [(APPCControllerReceiver *)self lock];
  [v8 unlock];
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)setConnection:(id)a3
{
  id v5 = a3;
  p_connection = &self->_connection;
  objc_storeStrong((id *)p_connection, a3);
  __int16 v7 = APLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = *p_connection;
    int v9 = 136643075;
    v10 = "-[APPCControllerReceiver setConnection:]";
    __int16 v11 = 2114;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{sensitive}s: APXPCConnection set to %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

- (APXPCConnection)connection
{
  return self->_connection;
}

- (id)remoteObjectInterface
{
  return &OBJC_PROTOCOL___APPCControllerClientInterface;
}

- (void)preWarm:(id)a3
{
}

- (Protocol)exportedInterface
{
  return (Protocol *)&OBJC_PROTOCOL___APPCControllerDaemonInterface;
}

- (void)requestPromotedContentOfTypes:(id)a3 forRequester:(id)a4 forContext:(id)a5 withClientInfo:(id)a6 deliverEntireBatch:(BOOL)a7 completionHandler:(id)a8
{
  unsigned int v34 = a7;
  id v13 = a3;
  id v36 = a4;
  id v14 = a5;
  id v37 = a6;
  id v33 = a8;
  id v15 = APLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = [v14 identifier];
    *(_DWORD *)buf = 138543362;
    v44 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Received request to fetch ad for context %{public}@", buf, 0xCu);
  }
  v35 = [v14 identifier];
  v17 = APLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    __int16 v18 = (char *)objc_opt_class();
    *(_DWORD *)buf = 138478595;
    v44 = v18;
    __int16 v45 = 2114;
    id v46 = v35;
    __int16 v47 = 2114;
    v48 = v35;
    __int16 v49 = 2114;
    id v50 = v13;
    id v19 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{private}@ %{public}@] Prefetching promoted content for context %{public}@ with requested Ad types %{public}@", buf, 0x2Au);
  }
  objc_initWeak(&location, self);
  v20 = APLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v21 = objc_loadWeakRetained(&location);
    id v22 = v13;
    id v23 = v21;
    v24 = [v23 connection];
    id v25 = objc_loadWeakRetained(&location);
    v26 = [v25 connection];
    v27 = [v26 bundleID];
    *(_DWORD *)buf = 136643587;
    v44 = "-[APPCControllerReceiver requestPromotedContentOfTypes:forRequester:forContext:withClientInfo:deliverEntireBat"
          "ch:completionHandler:]";
    __int16 v45 = 2050;
    id v46 = v21;
    __int16 v47 = 2050;
    v48 = v24;
    __int16 v49 = 2114;
    id v50 = v27;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%{sensitive}s: controller (weakSelf) %{public}p connection %{public}p bundleID is %{public}@.", buf, 0x2Au);

    id v13 = v22;
  }

  v28 = [(APPCControllerReceiver *)self _coordinatorForRequester:v36 clientInfo:v37];
  v29 = [(APPCControllerReceiver *)self connection];
  v30 = [v29 bundleID];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10017EF58;
  v38[3] = &unk_1002389E0;
  objc_copyWeak(&v41, &location);
  id v31 = v28;
  id v39 = v31;
  id v32 = v33;
  id v40 = v32;
  sub_10017B9FC(v31, v13, v14, v30, v37, v34, v38);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
}

- (void)_finishedWithRequestsForCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(APPCControllerReceiver *)self lock];
  [v5 lock];

  uint64_t v6 = APLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __int16 v7 = objc_opt_class();
    id v8 = v7;
    int v9 = sub_1000E8498((uint64_t)v4);
    int v12 = 138478083;
    id v13 = v7;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{private}@] Finished with requests for coordinator %{public}@", (uint8_t *)&v12, 0x16u);
  }
  v10 = [(APPCControllerReceiver *)self coordinators];
  [v10 removeObject:v4];

  __int16 v11 = [(APPCControllerReceiver *)self lock];
  [v11 unlock];
}

- (void)proxyURLWithCompletionHandler:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  if (v3)
  {
    id v4 = +[APProxySettings settings];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 resourceConnectProxyURL];
      __int16 v7 = APLogForCategory();
      id v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v13 = 138478083;
          id v14 = (id)objc_opt_class();
          __int16 v15 = 2114;
          id v16 = v6;
          id v9 = v14;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{private}@] Retrieved APProxySettings, resourceConnectProxyURL is %{public}@", (uint8_t *)&v13, 0x16u);
        }
        v3[2](v3, v6);
      }
      else
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v13 = 138477827;
          id v14 = (id)objc_opt_class();
          id v12 = v14;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%{private}@] resourceConnectProxyURL not found in proxySettings.", (uint8_t *)&v13, 0xCu);
        }
        v3[2](v3, 0);
      }
      goto LABEL_15;
    }
    v10 = APLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138477827;
      id v14 = (id)objc_opt_class();
      id v11 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{private}@] Error reading proxySettings.", (uint8_t *)&v13, 0xCu);
    }
    v3[2](v3, 0);
  }
  else
  {
    id v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138477827;
      id v14 = (id)objc_opt_class();
      id v6 = v14;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[%{private}@] completionHandler not present", (uint8_t *)&v13, 0xCu);
LABEL_15:
    }
  }
}

- (void)sendAndRankContent:(id)a3 forContext:(id)a4 placement:(unint64_t)a5 completionHandler:(id)a6
{
}

- (id)_coordinatorForRequester:(id)a3 clientInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = APLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = objc_loadWeakRetained(&location);
    id v10 = v9;
    id v11 = [v10 connection];
    id v12 = objc_loadWeakRetained(&location);
    int v13 = [v12 connection];
    id v14 = [v13 bundleID];
    *(_DWORD *)buf = 136643587;
    unsigned int v34 = "-[APPCControllerReceiver _coordinatorForRequester:clientInfo:]";
    __int16 v35 = 2050;
    id v36 = v9;
    __int16 v37 = 2050;
    v38 = v11;
    __int16 v39 = 2114;
    id v40 = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{sensitive}s: controller (weakSelf) %{public}p connection %{public}p bundleID is %{public}@.", buf, 0x2Au);
  }
  __int16 v15 = [APPCControllerCoordinator alloc];
  id v16 = [(APPCControllerReceiver *)self connection];
  v17 = [v16 bundleID];
  id v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  v27 = sub_10017F6D0;
  v28 = &unk_100238A30;
  id v18 = v7;
  id v29 = v18;
  objc_copyWeak(&v31, &location);
  id v19 = v6;
  id v30 = v19;
  v20 = sub_10017B78C((id *)&v15->super.isa, v17, v19, &v25);

  id v21 = [(APPCControllerReceiver *)self lock];
  [v21 lock];

  id v22 = [(APPCControllerReceiver *)self coordinators];
  [v22 addObject:v20];

  id v23 = [(APPCControllerReceiver *)self lock];
  [v23 unlock];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

  return v20;
}

- (void)connectionInterrupted
{
  id v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 141558274;
    uint64_t v6 = 1752392040;
    __int16 v7 = 2112;
    id v8 = (id)objc_opt_class();
    id v4 = v8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] Connection from client has been interrupted.", (uint8_t *)&v5, 0x16u);
  }
  [(APPCControllerReceiver *)self _finishedWithAllRequests];
}

- (void)setCoordinators:(id)a3
{
}

@end