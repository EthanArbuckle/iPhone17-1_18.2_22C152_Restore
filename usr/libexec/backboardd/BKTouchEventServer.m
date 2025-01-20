@interface BKTouchEventServer
- (BKTouchEventServer)init;
- (id)transform3DForDisplayUUID:(id)a3 layerID:(id)a4 contextID:(id)a5;
- (void)_lock_updateContextIDMap;
- (void)_lock_updateSceneHostSettings;
- (void)connectionDidBegin:(id)a3 process:(id)a4;
- (void)connectionDidTerminate:(id)a3 process:(id)a4;
- (void)setContextIDs:(id)a3 forHitTestContextCategory:(id)a4;
- (void)setSceneHostSettings:(id)a3 forContextID:(id)a4;
@end

@implementation BKTouchEventServer

- (void)setSceneHostSettings:(id)a3 forContextID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[BSServiceConnection currentContext];
  v9 = [v8 remoteProcess];
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = [v9 auditToken];
  v11 = v10;
  if (v10)
  {
    [v10 realToken];
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }

  v12 = +[BKSystemShellSentinel sharedInstance];
  unsigned __int8 v13 = [v12 auditTokenRepresentsSystemApp:&v24];

  if (v13)
  {
    os_unfair_lock_lock(&self->_lock);
    uint64_t v14 = [(BKHIDDomainServiceServer *)self->_server userInfoForConnection:v8];
    v15 = v14;
    if (v14) {
      v16 = *(void **)(v14 + 8);
    }
    else {
      v16 = 0;
    }
    id v17 = v16;
    v18 = [v17 objectForKey:v7];
    if ((BSEqualObjects() & 1) == 0)
    {
      v19 = BKLogTouchEvents();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v21 = [v7 unsignedIntValue];
        v23 = [v6 identifier];
        [v18 touchBehavior];
        v22 = NSStringFromBKSSceneHostTouchBehavior();
        [v6 touchBehavior];
        v20 = NSStringFromBKSSceneHostTouchBehavior();
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v27 = v21;
        *(_WORD *)&v27[4] = 2114;
        *(void *)&v27[6] = v23;
        __int16 v28 = 2114;
        v29 = v22;
        __int16 v30 = 2114;
        v31 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "new scene host settings: contextID:%X <%{public}@> %{public}@ -> %{public}@", buf, 0x26u);
      }
      if (v6) {
        [v17 setObject:v6 forKey:v7];
      }
      else {
        [v17 removeObjectForKey:v7];
      }
      [(BKTouchEventServer *)self _lock_updateSceneHostSettings];
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v15 = BKLogTouchEvents();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v27 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "non-shell process cannot modify scene host settings: %{public}@", buf, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_contextIDToCategory, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

- (void)_lock_updateContextIDMap
{
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_10004F144;
  v11 = sub_10004F154;
  id v12 = 0;
  server = self->_server;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004F15C;
  v6[3] = &unk_1000F6D40;
  v6[4] = &v7;
  [(BKHIDDomainServiceServer *)server enumerateUserInfoWithBlock:v6];
  v4 = BKLogTouchEvents();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v8[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "contextID category map is now %{public}@", buf, 0xCu);
  }

  objc_storeStrong((id *)&self->_lock_contextIDToCategory, (id)v8[5]);
  _Block_object_dispose(&v7, 8);
}

- (void)_lock_updateSceneHostSettings
{
  os_unfair_lock_assert_owner(&self->_lock);
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  server = self->_server;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004F3FC;
  v7[3] = &unk_1000F6CF0;
  id v8 = v3;
  id v5 = v3;
  [(BKHIDDomainServiceServer *)server enumerateUserInfoWithBlock:v7];
  id v6 = +[BKDisplayController sharedInstance];
  [v6 setSceneHostSettings:v5];
}

- (void)connectionDidTerminate:(id)a3 process:(id)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(BKTouchEventServer *)self _lock_updateSceneHostSettings];
  [(BKTouchEventServer *)self _lock_updateContextIDMap];

  os_unfair_lock_unlock(p_lock);
}

- (void)connectionDidBegin:(id)a3 process:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(_BKTouchServerClientRecord);
  [(BKHIDDomainServiceServer *)self->_server setUserInfo:v6 forConnection:v5];
}

- (void)setContextIDs:(id)a3 forHitTestContextCategory:(id)a4
{
  id v6 = a3;
  id v7 = [a4 integerValue];
  if (a4)
  {
    id v8 = v7;
    uint64_t v9 = +[BSServiceConnection currentContext];
    v10 = [v9 remoteProcess];
    v11 = [v10 auditToken];
    uint64_t v12 = BKHitTestContextCategoryEntitlement;
    unsigned int v13 = [v11 hasEntitlement:BKHitTestContextCategoryEntitlement];

    if (v13)
    {
      os_unfair_lock_lock(&self->_lock);
      uint64_t v14 = [(BKHIDDomainServiceServer *)self->_server userInfoForConnection:v9];
      id v15 = v6;
      v16 = v15;
      if (v14)
      {
        if (![v15 count])
        {

          v16 = 0;
        }
        id v17 = [v16 copy];
        v18 = (void *)v14[2];
        v19 = +[NSNumber numberWithInteger:v8];
        [v18 setObject:v17 forKeyedSubscript:v19];
      }
      [(BKTouchEventServer *)self _lock_updateContextIDMap];
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      v20 = BKLogTouchEvents();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v21 = 138543618;
        v22 = v10;
        __int16 v23 = 2114;
        uint64_t v24 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "setContextIDs:forHitTestContextCategory: %{public}@ doesn't have entitlement %{public}@", (uint8_t *)&v21, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v9 = BKLogTouchEvents();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "gotta specify a category, bucko", (uint8_t *)&v21, 2u);
    }
  }
}

- (id)transform3DForDisplayUUID:(id)a3 layerID:(id)a4 contextID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[BSServiceConnection currentContext];
  v11 = [v10 remoteProcess];
  uint64_t v12 = [v11 auditToken];
  uint64_t v13 = BKLayerTransformLookupEntitlement;
  unsigned __int8 v14 = [v12 hasEntitlement:BKLayerTransformLookupEntitlement];

  if (v14)
  {
    if (v7)
    {
      id v15 = +[CAWindowServer serverIfRunning];
      v16 = [v15 displayWithUniqueId:v7];
    }
    else
    {
      v16 = sub_100010DDC();
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    memset(buf, 0, sizeof(buf));
    id v18 = [v8 unsignedLongLongValue];
    id v19 = [v9 unsignedIntValue];
    if (v16)
    {
      [v16 transformFromLayerId:v18 inContextId:v19];
    }
    else
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      memset(buf, 0, sizeof(buf));
    }
    id v17 = objc_alloc_init((Class)_BKSCATransform3DContainer);
    v22[4] = v26;
    v22[5] = v27;
    v22[6] = v28;
    v22[7] = v29;
    v22[0] = *(_OWORD *)buf;
    v22[1] = *(_OWORD *)&buf[16];
    v22[2] = v24;
    v22[3] = v25;
    [v17 setTransform:v22];
  }
  else
  {
    v16 = BKLogTouchEvents();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      [v11 pid];
      int v21 = BSProcessDescriptionForPID();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "process '%{public}@' must have entitlement %{public}@ to look up CA transforms", buf, 0x16u);
    }
    id v17 = 0;
  }

  return v17;
}

- (BKTouchEventServer)init
{
  v9.receiver = self;
  v9.super_class = (Class)BKTouchEventServer;
  v2 = [(BKTouchEventServer *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)BKHIDDomainServiceServer);
    uint64_t v4 = BKSTouchEventBSServiceName;
    id v5 = BKLogTouchEvents();
    id v6 = (BKHIDDomainServiceServer *)[v3 initWithDelegate:v2 serverTarget:v2 serverProtocol:&OBJC_PROTOCOL___BKSTouchEventServer_IPC clientProtocol:&OBJC_PROTOCOL___BKSTouchEventClient_IPC serviceName:v4 queue:0 log:v5 entitlement:0];
    server = v2->_server;
    v2->_server = v6;

    [(BKHIDDomainServiceServer *)v2->_server activate];
  }
  return v2;
}

@end