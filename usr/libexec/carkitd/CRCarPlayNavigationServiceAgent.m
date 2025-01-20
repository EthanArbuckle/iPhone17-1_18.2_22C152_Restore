@interface CRCarPlayNavigationServiceAgent
- (BOOL)_work_queue_doWeHaveOwners;
- (BOOL)_work_queue_navigationOwnerExistsForIdentifier:(id)a3;
- (BOOL)_work_queue_updateOwnershipToiOSIfNecessary;
- (BOOL)cachedDoWeOwnNavigation;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CARSession)lock_session;
- (CARSessionStatus)sessionStatus;
- (CRAccNavProvider)accNavProvider;
- (CRCarPlayNavigationServiceAgent)initWithSessionStatus:(id)a3;
- (NSMutableArray)observers;
- (NSMutableOrderedSet)owners;
- (OS_dispatch_queue)workQueue;
- (id)_work_queue_activeNavigationIdentifiers;
- (id)_work_queue_ownersForIdentifier:(id)a3 pid:(int)a4;
- (unint64_t)maximumConcurrentNavigationOwners;
- (void)_navigationOwnershipChangedFromCar:(id)a3;
- (void)_removeConnection:(id)a3;
- (void)_work_queue_addNavigationIdentifer:(id)a3 supportsAccNav:(BOOL)a4 forConnection:(id)a5;
- (void)_work_queue_navigationOwnershipChangedFromCar;
- (void)_work_queue_removeNavigationOwner:(id)a3;
- (void)_work_queue_removeNavigationOwnerForConnection:(id)a3;
- (void)_work_queue_removeOwnerWithIdentifier:(id)a3 forConnection:(id)a4;
- (void)_work_queue_updateActiveComponents:(id)a3 forOwner:(id)a4;
- (void)_work_queue_updateNavigationStateForRemoval;
- (void)addNavigationOwnerWithIdentifier:(id)a3;
- (void)addNavigationOwnerWithIdentifier:(id)a3 supportsAccNav:(BOOL)a4;
- (void)beginObserving;
- (void)fetchNavigationIdentifierWithReply:(id)a3;
- (void)fetchNavigationIdentifiersWithReply:(id)a3;
- (void)fetchNavigationOwnerWithReply:(id)a3;
- (void)removeNavigationOwnerWithIdentifier:(id)a3;
- (void)sendInfo:(id)a3 toComponentUID:(id)a4;
- (void)session:(id)a3 didUpdateActiveComponents:(id)a4;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setAccNavProvider:(id)a3;
- (void)setCachedDoWeOwnNavigation:(BOOL)a3;
- (void)setLock_session:(id)a3;
- (void)setMaximumConcurrentNavigationOwners:(unint64_t)a3;
- (void)setObservers:(id)a3;
- (void)setOwners:(id)a3;
- (void)setSessionStatus:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation CRCarPlayNavigationServiceAgent

- (CRCarPlayNavigationServiceAgent)initWithSessionStatus:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRCarPlayNavigationServiceAgent;
  v6 = [(CRCarPlayNavigationServiceAgent *)&v20 init];
  v7 = v6;
  if (v6)
  {
    v6->_sessionLock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.carkit.navigationService", 0);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v7->_sessionStatus, a3);
    os_unfair_lock_lock(&v7->_sessionLock);
    v10 = [(CARSessionStatus *)v7->_sessionStatus currentSession];
    [(CRCarPlayNavigationServiceAgent *)v7 setLock_session:v10];

    os_unfair_lock_unlock(&v7->_sessionLock);
    [(CARSessionStatus *)v7->_sessionStatus addSessionObserver:v7];
    v11 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    owners = v7->_owners;
    v7->_owners = v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    observers = v7->_observers;
    v7->_observers = v13;

    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v15 = (void *)qword_1000E3898;
    uint64_t v25 = qword_1000E3898;
    if (!qword_1000E3898)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10003FEC8;
      v21[3] = &unk_1000BD318;
      v21[4] = &v22;
      sub_10003FEC8((uint64_t)v21);
      v15 = (void *)v23[3];
    }
    v16 = v15;
    _Block_object_dispose(&v22, 8);
    v17 = (CRAccNavProvider *)[[v16 alloc] initWithDelegate:v7];
    accNavProvider = v7->_accNavProvider;
    v7->_accNavProvider = v17;

    v7->_cachedDoWeOwnNavigation = 0;
    v7->_maximumConcurrentNavigationOwners = 0;
  }

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = [v7 serviceName];
  unsigned int v9 = [v8 isEqualToString:@"com.apple.carkit.navowners.service"];

  if (v9)
  {
    v10 = CRCarPlayNavigationOwnersServiceInterface();
    [v7 setExportedInterface:v10];

    v11 = CRCarPlayNavigationOwnerClientInterface();
    [v7 setRemoteObjectInterface:v11];

    v12 = sub_10005C6FC(1uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Receiving navigation ownership connection: %{public}@", (uint8_t *)&buf, 0xCu);
    }
LABEL_14:

    [v7 setExportedObject:self];
    objc_initWeak((id *)&buf, self);
    objc_initWeak(&location, v7);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10003CF48;
    v32[3] = &unk_1000BE570;
    objc_copyWeak(&v33, &location);
    objc_copyWeak(&v34, (id *)&buf);
    [v7 setInterruptionHandler:v32];
    v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    v28 = sub_10003CFC4;
    v29 = &unk_1000BE570;
    objc_copyWeak(&v30, &location);
    objc_copyWeak(&v31, (id *)&buf);
    [v7 setInvalidationHandler:&v26];
    [v7 resume:v26, v27, v28, v29];
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)&buf);
    BOOL v24 = 1;
    goto LABEL_18;
  }
  v13 = [v7 serviceName];
  unsigned int v14 = [v13 isEqualToString:@"com.apple.carkit.navigation.service"];

  v15 = sub_10005C6FC(1uLL);
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Receiving accessory navigation connection: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    id location = 0;
    p_id location = &location;
    uint64_t v37 = 0x2020000000;
    v17 = (void (*)(void))off_1000E38A8;
    v38 = off_1000E38A8;
    if (!off_1000E38A8)
    {
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v40 = sub_100040094;
      v41 = &unk_1000BD318;
      v42 = &location;
      v18 = (void *)sub_10003FF20();
      v19 = dlsym(v18, "CRNavigationServiceInterface");
      *((void *)v42[1] + 3) = v19;
      off_1000E38A8 = (_UNKNOWN *)*((void *)v42[1] + 3);
      v17 = (void (*)(void))p_location[3];
    }
    _Block_object_dispose(&location, 8);
    if (!v17) {
      goto LABEL_19;
    }
    objc_super v20 = v17();
    [v7 setExportedInterface:v20];

    id location = 0;
    p_id location = &location;
    uint64_t v37 = 0x2020000000;
    v21 = (void (*)(void))off_1000E38B0;
    v38 = off_1000E38B0;
    if (!off_1000E38B0)
    {
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v40 = sub_1000400E4;
      v41 = &unk_1000BD318;
      v42 = &location;
      uint64_t v22 = (void *)sub_10003FF20();
      v23 = dlsym(v22, "CRNavigationClientInterface");
      *((void *)v42[1] + 3) = v23;
      off_1000E38B0 = (_UNKNOWN *)*((void *)v42[1] + 3);
      v21 = (void (*)(void))p_location[3];
    }
    _Block_object_dispose(&location, 8);
    if (!v21)
    {
LABEL_19:
      sub_100072208();
      __break(1u);
    }
    v12 = v21();
    [v7 setRemoteObjectInterface:v12];
    goto LABEL_14;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100074134();
  }

  BOOL v24 = 0;
LABEL_18:

  return v24;
}

- (void)_removeConnection:(id)a3
{
  id v4 = a3;
  id v5 = sub_10005C6FC(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing owners requested for connection: %{public}@", buf, 0xCu);
  }

  id v6 = [(CRCarPlayNavigationServiceAgent *)self workQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003D174;
  v8[3] = &unk_1000BD3A8;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)sessionDidConnect:(id)a3
{
  id v4 = a3;
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_navigationOwnershipChangedFromCar:" name:CARSessionOwnsTurnByTurnNavigationChangedNotification object:v4];

  id v6 = sub_10005C6FC(1uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "connected session: %{public}@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_sessionLock);
  [(CRCarPlayNavigationServiceAgent *)self setLock_session:v4];
  os_unfair_lock_unlock(&self->_sessionLock);
  id v7 = [(CRCarPlayNavigationServiceAgent *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D3BC;
  block[3] = &unk_1000BD1B0;
  block[4] = self;
  dispatch_async(v7, block);
}

- (void)sessionDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = sub_10005C6FC(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "disconnected session: %{public}@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_sessionLock);
  [(CRCarPlayNavigationServiceAgent *)self setLock_session:0];
  os_unfair_lock_unlock(&self->_sessionLock);
  id v6 = [(CRCarPlayNavigationServiceAgent *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D504;
  block[3] = &unk_1000BD1B0;
  block[4] = self;
  dispatch_async(v6, block);
}

- (void)_navigationOwnershipChangedFromCar:(id)a3
{
  id v4 = sub_10005C6FC(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Notified ownership changed by car", buf, 2u);
  }

  id v5 = [(CRCarPlayNavigationServiceAgent *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D630;
  block[3] = &unk_1000BD1B0;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)addNavigationOwnerWithIdentifier:(id)a3
{
}

- (void)addNavigationOwnerWithIdentifier:(id)a3 supportsAccNav:(BOOL)a4
{
  id v6 = a3;
  id v7 = +[NSXPCConnection currentConnection];
  dispatch_queue_t v8 = [(CRCarPlayNavigationServiceAgent *)self workQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003D730;
  v11[3] = &unk_1000BE598;
  v11[4] = self;
  id v12 = v6;
  BOOL v14 = a4;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)beginObserving
{
  v3 = +[NSXPCConnection currentConnection];
  if (v3)
  {
    id v4 = [(CRCarPlayNavigationServiceAgent *)self workQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10003D808;
    v5[3] = &unk_1000BD3A8;
    v5[4] = self;
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

- (void)removeNavigationOwnerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[NSXPCConnection currentConnection];
  id v6 = [(CRCarPlayNavigationServiceAgent *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D93C;
  block[3] = &unk_1000BD3D0;
  block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)fetchNavigationOwnerWithReply:(id)a3
{
  p_sessionLock = &self->_sessionLock;
  id v7 = (void (**)(id, id))a3;
  os_unfair_lock_lock(p_sessionLock);
  id v5 = [(CRCarPlayNavigationServiceAgent *)self lock_session];
  id v6 = [v5 navigationOwner];

  os_unfair_lock_unlock(p_sessionLock);
  v7[2](v7, v6);
}

- (void)fetchNavigationIdentifierWithReply:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_sessionLock);
  id v5 = [(CRCarPlayNavigationServiceAgent *)self lock_session];
  id v6 = [v5 navigationOwner];

  os_unfair_lock_unlock(&self->_sessionLock);
  if (v6 == (id)1)
  {
    id v7 = [(CRCarPlayNavigationServiceAgent *)self workQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003DAD0;
    v8[3] = &unk_1000BD668;
    void v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

- (void)fetchNavigationIdentifiersWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(CRCarPlayNavigationServiceAgent *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003DC0C;
  v7[3] = &unk_1000BD668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)_work_queue_ownersForIdentifier:(id)a3 pid:(int)a4
{
  id v6 = a3;
  id v7 = [(CRCarPlayNavigationServiceAgent *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = objc_opt_new();
  id v9 = [(CRCarPlayNavigationServiceAgent *)self owners];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003DD78;
  v15[3] = &unk_1000BE5C0;
  int v18 = a4;
  id v16 = v6;
  id v10 = v8;
  id v17 = v10;
  id v11 = v6;
  [v9 enumerateObjectsUsingBlock:v15];

  id v12 = v17;
  id v13 = v10;

  return v13;
}

- (void)_work_queue_addNavigationIdentifer:(id)a3 supportsAccNav:(BOOL)a4 forConnection:(id)a5
{
  BOOL v6 = a4;
  id v8 = (_CRAppStateNavigationOwner *)a3;
  id v9 = a5;
  id v10 = [(CRCarPlayNavigationServiceAgent *)self workQueue];
  dispatch_assert_queue_V2(v10);

  if (v8 && v9)
  {
    id v11 = -[CRCarPlayNavigationServiceAgent _work_queue_ownersForIdentifier:pid:](self, "_work_queue_ownersForIdentifier:pid:", v8, [v9 processIdentifier]);
    id v12 = [v11 count];

    if (v12)
    {
      sub_10005C6FC(1uLL);
      id v13 = (_CRAppStateNavigationOwner *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR)) {
        sub_1000742B0((uint64_t)v8, v9);
      }
    }
    else
    {
      id v13 = objc_alloc_init(_CRAppStateNavigationOwner);
      [(_CRAppStateNavigationOwner *)v13 setIdentifier:v8];
      [(_CRAppStateNavigationOwner *)v13 setConnection:v9];
      [(_CRAppStateNavigationOwner *)v13 setSupportsAccNav:v6];
      BOOL v14 = sub_10005C6FC(1uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v15 = @"NO";
        if (v6) {
          CFStringRef v15 = @"YES";
        }
        *(_DWORD *)long long buf = 138543618;
        v41 = v13;
        __int16 v42 = 2114;
        CFStringRef v43 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[addNavigationIdentifer] Adding navigation owner: %{public}@ suportsAccNav: %{public}@", buf, 0x16u);
      }

      id v16 = [(CRCarPlayNavigationServiceAgent *)self owners];
      [v16 addObject:v13];

      if (![(CRCarPlayNavigationServiceAgent *)self _work_queue_updateOwnershipToiOSIfNecessary])
      {
        os_unfair_lock_lock(&self->_sessionLock);
        id v17 = [(CRCarPlayNavigationServiceAgent *)self lock_session];
        id v18 = [v17 navigationOwner];

        os_unfair_lock_unlock(&self->_sessionLock);
        v19 = sub_10005C6FC(1uLL);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v20 = [(_CRAppStateNavigationOwner *)v13 identifier];
          v21 = @"None";
          if (v18 == (id)1) {
            v21 = @"iOS";
          }
          if (v18 == (id)2) {
            v21 = @"Car";
          }
          uint64_t v22 = v21;
          *(_DWORD *)long long buf = 138543618;
          v41 = v20;
          __int16 v42 = 2114;
          CFStringRef v43 = v22;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[addNavigationIdentifer] Informing navigation owner: %{public}@ ownership is %{public}@", buf, 0x16u);
        }
        v23 = [v9 remoteObjectProxy];
        [v23 navigationOwnershipChangedTo:v18];
      }
      BOOL v24 = [(CRCarPlayNavigationServiceAgent *)self owners];
      id v25 = [v24 count];

      if (v25 > (id)[(CRCarPlayNavigationServiceAgent *)self maximumConcurrentNavigationOwners])[(CRCarPlayNavigationServiceAgent *)self setMaximumConcurrentNavigationOwners:v25]; {
      unsigned __int8 v26 = [(_CRAppStateNavigationOwner *)v13 supportsAccNav];
      }
      uint64_t v27 = sub_10005C6FC(1uLL);
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      if (v26)
      {
        if (v28)
        {
          *(_DWORD *)long long buf = 138543362;
          v41 = v8;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[addNavigationIdentifer] Updating new owner with components: %{public}@", buf, 0xCu);
        }

        v29 = [(CRCarPlayNavigationServiceAgent *)self accNavProvider];
        id v30 = [v29 activeComponents];
        [(CRCarPlayNavigationServiceAgent *)self _work_queue_updateActiveComponents:v30 forOwner:v13];
      }
      else
      {
        if (v28)
        {
          *(_DWORD *)long long buf = 138543362;
          v41 = v8;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[addNavigationIdentifer] Sending app identifier as no ACCNav support after adding: %{public}@", buf, 0xCu);
        }

        v29 = [(CRCarPlayNavigationServiceAgent *)self accNavProvider];
        id v30 = [(_CRAppStateNavigationOwner *)v13 identifier];
        [v29 sendNoSupportForAppIdentifier:v30];
      }

      id v31 = sub_10005C6FC(1uLL);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        v41 = v8;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[addNavigationIdentifer] Informing navigation observers of new arrival: %{public}@", buf, 0xCu);
      }

      v32 = +[NSDistributedNotificationCenter defaultCenter];
      [v32 postNotificationName:CARNavigationOwnerRequestedNotificationName object:v8];

      id v33 = [(CRCarPlayNavigationServiceAgent *)self _work_queue_activeNavigationIdentifiers];
      id v34 = sub_10005C6FC(1uLL);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        v41 = v33;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[addNavigationIdentifer] Active navigation owners after addition: %{public}@", buf, 0xCu);
      }

      v35 = [(CRCarPlayNavigationServiceAgent *)self observers];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10003E3D4;
      v37[3] = &unk_1000BE5E8;
      v38 = v33;
      v39 = self;
      v36 = v33;
      [v35 enumerateObjectsUsingBlock:v37];
    }
  }
  else
  {
    sub_10005C6FC(1uLL);
    id v13 = (_CRAppStateNavigationOwner *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR)) {
      sub_100074330((uint64_t)v8, v9);
    }
  }
}

- (void)_work_queue_removeOwnerWithIdentifier:(id)a3 forConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CRCarPlayNavigationServiceAgent *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (v6 && v7)
  {
    id v9 = -[CRCarPlayNavigationServiceAgent _work_queue_ownersForIdentifier:pid:](self, "_work_queue_ownersForIdentifier:pid:", v6, [v7 processIdentifier]);
    id v10 = sub_10005C6FC(1uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218498;
      id v22 = [v9 count];
      __int16 v23 = 2114;
      id v24 = v6;
      __int16 v25 = 1024;
      unsigned int v26 = [v7 processIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Removing %lu owners for %{public}@(%d)", buf, 0x1Cu);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        CFStringRef v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          -[CRCarPlayNavigationServiceAgent _work_queue_removeNavigationOwner:](self, "_work_queue_removeNavigationOwner:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v15), (void)v16);
          CFStringRef v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }
  }
  else
  {
    id v11 = sub_10005C6FC(1uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000743B0();
    }
  }
}

- (void)_work_queue_removeNavigationOwnerForConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(CRCarPlayNavigationServiceAgent *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = -[CRCarPlayNavigationServiceAgent _work_queue_ownersForIdentifier:pid:](self, "_work_queue_ownersForIdentifier:pid:", 0, [v4 processIdentifier]);
  id v7 = sub_10005C6FC(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    id v19 = [v6 count];
    __int16 v20 = 2114;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing %lu owners for %{public}@", buf, 0x16u);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[CRCarPlayNavigationServiceAgent _work_queue_removeNavigationOwner:](self, "_work_queue_removeNavigationOwner:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v12), (void)v13);
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_work_queue_removeNavigationOwner:(id)a3
{
  id v4 = a3;
  id v5 = [(CRCarPlayNavigationServiceAgent *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_10005C6FC(1uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[removeNavigationOwner] Removing navigation owner: %{public}@", buf, 0xCu);
  }

  id v7 = [(CRCarPlayNavigationServiceAgent *)self owners];
  [v7 removeObject:v4];

  [(CRCarPlayNavigationServiceAgent *)self _work_queue_updateNavigationStateForRemoval];
  id v8 = sub_10005C6FC(1uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v4 identifier];
    *(_DWORD *)long long buf = 138543362;
    id v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[removeNavigationOwner] Informing navigation observers of released owner: %{public}@", buf, 0xCu);
  }
  id v10 = +[NSDistributedNotificationCenter defaultCenter];
  uint64_t v11 = CARNavigationOwnerReleasedNotificationName;
  id v12 = [v4 identifier];
  [v10 postNotificationName:v11 object:v12];

  long long v13 = [(CRCarPlayNavigationServiceAgent *)self accNavProvider];
  [v13 resetActiveComponents];

  long long v14 = [(CRCarPlayNavigationServiceAgent *)self owners];
  long long v15 = [v14 lastObject];

  if ([v15 supportsAccNav])
  {
    long long v16 = sub_10005C6FC(1uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v17 = [v15 identifier];
      *(_DWORD *)long long buf = 138543362;
      id v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[removeNavigationOwner] Updating new owner with components: %{public}@", buf, 0xCu);
    }
    long long v18 = [(CRCarPlayNavigationServiceAgent *)self accNavProvider];
    id v19 = [v18 activeComponents];
    [(CRCarPlayNavigationServiceAgent *)self _work_queue_updateActiveComponents:v19 forOwner:v15];
  }
  else
  {
    __int16 v20 = [v15 identifier];

    if (!v20) {
      goto LABEL_12;
    }
    long long v18 = [(CRCarPlayNavigationServiceAgent *)self accNavProvider];
    id v19 = [v15 identifier];
    [v18 sendNoSupportForAppIdentifier:v19];
  }

LABEL_12:
  id v21 = [(CRCarPlayNavigationServiceAgent *)self _work_queue_activeNavigationIdentifiers];
  id v22 = sub_10005C6FC(1uLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v28 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[removeNavigationOwner] Active navigation owners after removal: %{public}@", buf, 0xCu);
  }

  __int16 v23 = [(CRCarPlayNavigationServiceAgent *)self observers];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10003ED2C;
  v25[3] = &unk_1000BE610;
  id v26 = v21;
  id v24 = v21;
  [v23 enumerateObjectsUsingBlock:v25];
}

- (void)_work_queue_navigationOwnershipChangedFromCar
{
  p_sessionLock = &self->_sessionLock;
  os_unfair_lock_lock(&self->_sessionLock);
  id v4 = [(CRCarPlayNavigationServiceAgent *)self lock_session];
  id v5 = [v4 navigationOwner];

  os_unfair_lock_unlock(p_sessionLock);
  if (v5 == (id)1)
  {
    CFStringRef v7 = @"iOS";
  }
  else if (v5 == (id)2)
  {
    id v6 = +[NSDistributedNotificationCenter defaultCenter];
    [v6 postNotificationName:CARNavigationOwnerRequestedNotificationName object:@"OEM"];

    CFStringRef v7 = @"car";
  }
  else
  {
    CFStringRef v7 = @"nobody";
  }
  id v8 = sub_10005C6FC(1uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    CFStringRef v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[navigationOwnershipChangedFromCar] Received notification indicating ownership changed to %{public}@", buf, 0xCu);
  }

  id v9 = [(CRCarPlayNavigationServiceAgent *)self owners];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003EFA8;
  v10[3] = &unk_1000BE630;
  v10[4] = v5;
  [v9 enumerateObjectsUsingBlock:v10];
}

- (BOOL)_work_queue_navigationOwnerExistsForIdentifier:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(CRCarPlayNavigationServiceAgent *)self owners];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) identifier];
        unsigned __int8 v10 = [v9 isEqualToString:v4];

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (id)_work_queue_activeNavigationIdentifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(CRCarPlayNavigationServiceAgent *)self owners];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003F2D4;
  v8[3] = &unk_1000BE658;
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v8];

  id v6 = [v5 copy];

  return v6;
}

- (BOOL)_work_queue_doWeHaveOwners
{
  id v3 = [(CRCarPlayNavigationServiceAgent *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CRCarPlayNavigationServiceAgent *)self owners];
  LOBYTE(v3) = [v4 count] != 0;

  return (char)v3;
}

- (BOOL)_work_queue_updateOwnershipToiOSIfNecessary
{
  id v3 = [(CRCarPlayNavigationServiceAgent *)self workQueue];
  dispatch_assert_queue_V2(v3);

  os_unfair_lock_lock(&self->_sessionLock);
  id v4 = [(CRCarPlayNavigationServiceAgent *)self lock_session];
  os_unfair_lock_unlock(&self->_sessionLock);
  if (!v4)
  {
    uint64_t v11 = sub_10005C6FC(1uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100074434(v11);
    }
    goto LABEL_13;
  }
  id v5 = [v4 navigationOwner];
  unsigned int v6 = [(CRCarPlayNavigationServiceAgent *)self _work_queue_doWeHaveOwners];
  uint64_t v7 = sub_10005C6FC(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(CRCarPlayNavigationServiceAgent *)self owners];
    int v14 = 138543362;
    long long v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[updateOwnershipToiOSIfNecessary] Owners: %{public}@", (uint8_t *)&v14, 0xCu);
  }
  if (!v6)
  {
    uint64_t v11 = sub_10005C6FC(1uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[updateOwnershipToiOSIfNecessary] No current navigation owners", (uint8_t *)&v14, 2u);
    }
LABEL_13:

LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
  id v9 = sub_10005C6FC(1uLL);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v5 == (id)1)
  {
    if (v10)
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[updateOwnershipToiOSIfNecessary] iOS already has ownership", (uint8_t *)&v14, 2u);
    }

    goto LABEL_14;
  }
  if (v10)
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[updateOwnershipToiOSIfNecessary] Requesting iOS ownership", (uint8_t *)&v14, 2u);
  }

  [v4 requestTurnByTurnOwnership];
  [(CRCarPlayNavigationServiceAgent *)self _work_queue_navigationOwnershipChangedFromCar];
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (void)_work_queue_updateNavigationStateForRemoval
{
  p_sessionLock = &self->_sessionLock;
  os_unfair_lock_lock(&self->_sessionLock);
  id v4 = [(CRCarPlayNavigationServiceAgent *)self lock_session];
  os_unfair_lock_unlock(p_sessionLock);
  unsigned int v5 = [(CRCarPlayNavigationServiceAgent *)self _work_queue_doWeHaveOwners];
  if (!v4) {
    goto LABEL_12;
  }
  id v6 = [v4 navigationOwner];
  uint64_t v7 = sub_10005C6FC(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(CRCarPlayNavigationServiceAgent *)self owners];
    int v12 = 138543362;
    long long v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[updateNavigationStateForRemoval] Owners: %{public}@", (uint8_t *)&v12, 0xCu);
  }
  id v9 = sub_10005C6FC(1uLL);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6 != (id)1)
  {
    if (v10)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[updateNavigationStateForRemoval] iOS does not have ownership", (uint8_t *)&v12, 2u);
    }

LABEL_12:
    if (v5) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  if (v5)
  {
    if (v10)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[updateNavigationStateForRemoval] Holding iOS ownership", (uint8_t *)&v12, 2u);
    }

    goto LABEL_19;
  }
  if (v10)
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[updateNavigationStateForRemoval] Releasing iOS ownership", (uint8_t *)&v12, 2u);
  }

  [v4 releaseTurnByTurnOwnership];
  [(CRCarPlayNavigationServiceAgent *)self setCachedDoWeOwnNavigation:0];
LABEL_17:
  if ([(CRCarPlayNavigationServiceAgent *)self maximumConcurrentNavigationOwners])
  {
    uint64_t v11 = +[CARAnalytics sharedInstance];
    [v11 navigationOwnershipEndedWithMaximumConcurrentCount:-[CRCarPlayNavigationServiceAgent maximumConcurrentNavigationOwners](self, "maximumConcurrentNavigationOwners")];

    [(CRCarPlayNavigationServiceAgent *)self setMaximumConcurrentNavigationOwners:0];
  }
LABEL_19:
}

- (void)sendInfo:(id)a3 toComponentUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CRCarPlayNavigationServiceAgent *)self owners];
  id v9 = [v8 lastObject];
  BOOL v10 = [v9 connection];
  uint64_t v11 = +[NSXPCConnection currentConnection];

  if (v10 == v11)
  {
    long long v17 = [(CRCarPlayNavigationServiceAgent *)self accNavProvider];
    [v17 sendInfo:v6 toComponentUID:v7];
  }
  else
  {
    int v12 = sub_10005C6FC(1uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = objc_opt_class();
      int v14 = [(CRCarPlayNavigationServiceAgent *)self owners];
      long long v15 = [v14 lastObject];
      long long v16 = [v15 identifier];
      int v18 = 138543874;
      id v19 = self;
      __int16 v20 = 2114;
      uint64_t v21 = v13;
      __int16 v22 = 2114;
      __int16 v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@ %{public}@ not sent.  NavOwner=%{public}@", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
}

- (NSMutableOrderedSet)owners
{
  return self->_owners;
}

- (void)setOwners:(id)a3
{
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (CRAccNavProvider)accNavProvider
{
  return self->_accNavProvider;
}

- (void)setAccNavProvider:(id)a3
{
}

- (BOOL)cachedDoWeOwnNavigation
{
  return self->_cachedDoWeOwnNavigation;
}

- (void)setCachedDoWeOwnNavigation:(BOOL)a3
{
  self->_cachedDoWeOwnNavigation = a3;
}

- (unint64_t)maximumConcurrentNavigationOwners
{
  return self->_maximumConcurrentNavigationOwners;
}

- (void)setMaximumConcurrentNavigationOwners:(unint64_t)a3
{
  self->_maximumConcurrentNavigationOwners = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (CARSession)lock_session
{
  return self->_lock_session;
}

- (void)setLock_session:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_session, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_accNavProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_owners, 0);

  objc_storeStrong((id *)&self->_sessionStatus, 0);
}

- (void)session:(id)a3 didUpdateActiveComponents:(id)a4
{
  id v5 = a4;
  id v6 = [(CRCarPlayNavigationServiceAgent *)self workQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003FB4C;
  v8[3] = &unk_1000BD3A8;
  id v9 = v5;
  BOOL v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)_work_queue_updateActiveComponents:(id)a3 forOwner:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CRCarPlayNavigationServiceAgent *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if ([v7 supportsAccNav])
  {
    id v9 = [v7 connection];
    id v10 = [v9 remoteObjectProxy];
    if ([v10 conformsToProtocol:&OBJC_PROTOCOL___CRNavigationClient]) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    int v12 = sub_10005C6FC(1uLL);
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        int v14 = [v7 identifier];
        long long v15 = [v7 connection];
        int v18 = 138543618;
        id v19 = v14;
        __int16 v20 = 1024;
        unsigned int v21 = [v15 processIdentifier];
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[updateActiveComponents] Informing navigation owner: %{public}@(%d)", (uint8_t *)&v18, 0x12u);
      }
      [v11 didUpdateActiveComponents:v6];
    }
    else
    {
      if (v13)
      {
        long long v16 = [v7 identifier];
        long long v17 = [v7 connection];
        int v18 = 138543618;
        id v19 = v16;
        __int16 v20 = 1024;
        unsigned int v21 = [v17 processIdentifier];
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[updateActiveComponents] Navigation supports accNav but is not client: %{public}@(%d)", (uint8_t *)&v18, 0x12u);
      }
    }
  }
}

@end