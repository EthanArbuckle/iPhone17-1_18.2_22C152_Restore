@interface SSKRootDisplayDriver
- (BOOL)isTrackingDisplays;
- (BOOL)isTrackingProfile:(id)a3;
- (BOOL)isTrackingProfileForDisplay:(id)a3;
- (NSString)description;
- (SSKRootDisplayDriver)initWithRootIdentity:(id)a3 transformUpdater:(id)a4 assertionCoordinator:(id)a5 builderClass:(Class)a6;
- (id)controllerForDisplay:(id)a3;
- (id)profileForDisplay:(id)a3;
- (id)transformDisplayConfiguration:(id)a3;
- (void)_derivedDisplayConnected:(id)a3;
- (void)_performWithRecordForDisplay:(id)a3 block:(id)a4;
- (void)_rootDisplayConnected:(id)a3;
- (void)addProfile:(id)a3;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)displayConnected:(id)a3;
- (void)displayDisconnected:(id)a3;
- (void)displayUpdated:(id)a3;
- (void)removeProfile:(id)a3;
@end

@implementation SSKRootDisplayDriver

- (SSKRootDisplayDriver)initWithRootIdentity:(id)a3 transformUpdater:(id)a4 assertionCoordinator:(id)a5 builderClass:(Class)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_12:
    v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 65, @"Invalid parameter not satisfying: %@", @"transformUpdater" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_13;
  }
  v26 = [MEMORY[0x263F08690] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 64, @"Invalid parameter not satisfying: %@", @"rootIdentity" object file lineNumber description];

  if (!v13) {
    goto LABEL_12;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_13:
  v28 = [MEMORY[0x263F08690] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 66, @"Invalid parameter not satisfying: %@", @"assertionCoordinator" object file lineNumber description];

LABEL_4:
  v30.receiver = self;
  v30.super_class = (Class)SSKRootDisplayDriver;
  v15 = [(SSKRootDisplayDriver *)&v30 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_rootIdentity, a3);
    objc_storeStrong((id *)&v16->_assertionCoordinator, a5);
    objc_storeStrong((id *)&v16->_transformUpdater, a4);
    if (!a6) {
      a6 = (Class)objc_opt_class();
    }
    v16->_ConfigBuilderClass = a6;
    if (([(objc_class *)a6 conformsToProtocol:&unk_2709B7C60] & 1) == 0)
    {
      v29 = [MEMORY[0x263F08690] currentHandler];
      [v29 handleFailureInMethod:a2, v16, @"SSKRootDisplayDriver.m", 72, @"Invalid parameter not satisfying: %@", @"[_ConfigBuilderClass conformsToProtocol:@protocol(SSKDisplayConfigurationBuilding)]" object file lineNumber description];
    }
    uint64_t v17 = [MEMORY[0x263EFF9C0] set];
    trackedDisplays = v16->_trackedDisplays;
    v16->_trackedDisplays = (NSMutableSet *)v17;

    v16->_lock._os_unfair_lock_opaque = 0;
    uint64_t v19 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:512 valueOptions:512 capacity:1];
    lock_recordsByProfile = v16->_lock_recordsByProfile;
    v16->_lock_recordsByProfile = (NSMapTable *)v19;

    uint64_t v21 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    lock_seedsByProfile = v16->_lock_seedsByProfile;
    v16->_lock_seedsByProfile = (NSMapTable *)v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0x10000 valueOptions:517 capacity:1];
    lock_index_recordsByDisplay = v16->_lock_index_recordsByDisplay;
    v16->_lock_index_recordsByDisplay = (NSMapTable *)v23;
  }
  return v16;
}

- (void)addProfile:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v19 = [NSString stringWithUTF8String:"-[SSKRootDisplayDriver addProfile:]"];
    [v18 handleFailureInFunction:v19 file:@"SSKRootDisplayDriver.m" lineNumber:92 description:@"this call must be made on the main thread"];
  }
  v6 = SSKLogRootDisplayDriver();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v16 = _SSKLoggingMethodProem(self, 1);
    rootIdentity = self->_rootIdentity;
    *(_DWORD *)location = 138412802;
    *(void *)&location[4] = v16;
    __int16 v27 = 2112;
    v28 = rootIdentity;
    __int16 v29 = 2114;
    id v30 = v5;
    _os_log_debug_impl(&dword_25C444000, v6, OS_LOG_TYPE_DEBUG, "%@:[%@] profile: %{public}@", location, 0x20u);
  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (!self->_rootConfiguration)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 97, @"attemping to add a profile before a root display is connected. how did you evaluate the profile in the first place?: %@", v5 object file lineNumber description];
  }
  v7 = [(NSMapTable *)self->_lock_recordsByProfile objectForKey:v5];
  if (v7)
  {
    uint64_t v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 100, @"[%@] trying to add a profile we're already tracking. profile: %@\n preexisting: %@", self->_rootIdentity, v5, v7 object file lineNumber description];
  }
  v8 = [(NSMapTable *)self->_lock_seedsByProfile objectForKey:v5];
  uint64_t v9 = [v8 unsignedIntegerValue];

  lock_seedsByProfile = self->_lock_seedsByProfile;
  v11 = [NSNumber numberWithUnsignedInteger:v9 + 1];
  [(NSMapTable *)lock_seedsByProfile setObject:v11 forKey:v5];

  LODWORD(v11) = [v5 usesRootDisplay];
  id v12 = [SSKDisplayDriverRecord alloc];
  if (v11)
  {
    id v13 = [(SSKDisplayDriverRecord *)v12 initWithProfile:v5 rootDisplay:self->_rootIdentity];
    [(NSMapTable *)self->_lock_recordsByProfile setObject:v13 forKey:v5];
    [(NSMapTable *)self->_lock_index_recordsByDisplay setObject:v13 forKey:self->_rootIdentity];
    os_unfair_lock_unlock(&self->_lock);
    objc_initWeak((id *)location, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __35__SSKRootDisplayDriver_addProfile___block_invoke;
    aBlock[3] = &unk_2654B18C0;
    objc_copyWeak(v25, (id *)location);
    id v14 = v5;
    v25[1] = (id)a2;
    id v23 = v14;
    v24 = self;
    v15 = (void (**)(void))_Block_copy(aBlock);
    if ([v14 shouldTransformConnectingDisplays]) {
      [(SSKDisplayTransformUpdating *)self->_transformUpdater updateTransformsWithCompletion:v15];
    }
    else {
      v15[2](v15);
    }

    objc_destroyWeak(v25);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v13 = [(SSKDisplayDriverRecord *)v12 initWithProfile:v5];
    [(NSMapTable *)self->_lock_recordsByProfile setObject:v13 forKey:v5];
    os_unfair_lock_unlock(&self->_lock);
    [(SSKDisplayTransformUpdating *)self->_transformUpdater updateTransformsWithCompletion:0];
  }
}

void __35__SSKRootDisplayDriver_addProfile___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained + 16;
    id v12 = (id *)WeakRetained;
    os_unfair_lock_assert_not_owner(WeakRetained + 16);
    os_unfair_lock_lock(v3);
    v4 = [v12[9] objectForKey:*(void *)(a1 + 32)];
    os_unfair_lock_unlock(v3);
    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) displayControllerForDisplay:v12[2] configuration:v12[6]];
      if (!v5)
      {
        v11 = [MEMORY[0x263F08690] currentHandler];
        [v11 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"SSKRootDisplayDriver.m", 124, @"[%@] profile usesRootDisplay=YES but got nil controller: %@", v12[2], *(void *)(a1 + 32) object file lineNumber description];
      }
      v6 = objc_msgSend(v12[3], "acquireAssertionForDisplay:level:delegate:", v12[2], objc_msgSend(*(id *)(a1 + 32), "priorityLevel"), v5);
      id v7 = v12[2];
      id v8 = v12[6];
      id v9 = v12[4];
      v10 = +[CADisplayQueue queue];
      [v5 connectToDisplayIdentity:v7 configuration:v8 displayTransformUpdater:v9 caDisplayQueue:v10 assertion:v6];

      [v4 associateController:v5 assertion:v6];
    }

    WeakRetained = (os_unfair_lock *)v12;
  }
}

- (void)removeProfile:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = SSKLogRootDisplayDriver();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v13 = _SSKLoggingMethodProem(self, 1);
    rootIdentity = self->_rootIdentity;
    *(_DWORD *)buf = 138412802;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    uint64_t v19 = rootIdentity;
    __int16 v20 = 2114;
    id v21 = v5;
    _os_log_debug_impl(&dword_25C444000, v6, OS_LOG_TYPE_DEBUG, "%@:[%@] profile: %{public}@", buf, 0x20u);
  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(NSMapTable *)self->_lock_recordsByProfile objectForKey:v5];
  if (!v7)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 158, @"[%@] trying to remove a profile we're not tracking: %@", self->_rootIdentity, v5 object file lineNumber description];
  }
  id v8 = [v7 profile];
  int v9 = [v8 usesRootDisplay];

  if (v9)
  {
    [(NSMapTable *)self->_lock_recordsByProfile removeObjectForKey:v5];
    os_unfair_lock_unlock(&self->_lock);
    assertionCoordinator = self->_assertionCoordinator;
    v11 = [v7 assertion];
    [(SSKDisplayAssertionCoordinator *)assertionCoordinator invalidateAssertion:v11];

    id v12 = [v7 controller];
    [v12 displayIdentityDidDisconnect:self->_rootIdentity];
  }
  else
  {
    [v7 dissociateFromController];
    os_unfair_lock_unlock(&self->_lock);
    [(SSKDisplayTransformUpdating *)self->_transformUpdater updateTransformsWithCompletion:0];
  }
}

- (void)_rootDisplayConnected:(id)a3
{
  id v6 = a3;
  id v7 = [v6 identity];
  if (([v7 isRootIdentity] & 1) == 0)
  {
    int v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 181, @"asked to connect a root display that isn't a root [%@]", v7 object file lineNumber description];
  }
  if (([(FBSDisplayIdentity *)self->_rootIdentity isEqual:v7] & 1) == 0)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 182, @"trying to connect a root identity [%@] when we already have one: [%@]", v7, self->_rootIdentity object file lineNumber description];
  }
  if (self->_didConnectRootIdentity)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 183, @"connecting a root identity when we had one connect before. it probably disconnected, and we shouldn't be getting reused: [%@]", v7 object file lineNumber description];
  }
  objc_storeStrong((id *)&self->_rootConfiguration, a3);
  self->_didConnectRootIdentity = 1;
  [(NSMutableSet *)self->_trackedDisplays addObject:v7];
  [(SSKDisplayAssertionCoordinator *)self->_assertionCoordinator rootDisplayDidConnect:v7];
  if ([v7 isMainDisplay])
  {
    [(SSKDisplayAssertionCoordinator *)self->_assertionCoordinator activateAssertionsForDisplay:v7];
  }
  else
  {
    objc_initWeak(&location, self);
    dispatch_time_t v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__SSKRootDisplayDriver__rootDisplayConnected___block_invoke;
    block[3] = &unk_2654B18E8;
    objc_copyWeak(&v14, &location);
    id v13 = v7;
    dispatch_after(v8, MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __46__SSKRootDisplayDriver__rootDisplayConnected___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[3] activateAssertionsForDisplay:*(void *)(a1 + 32)];
    WeakRetained = v3;
  }
}

- (void)_derivedDisplayConnected:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 identity];
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSMapTable *)self->_lock_index_recordsByDisplay objectForKey:v5];
  os_unfair_lock_unlock(&self->_lock);
  id v7 = SSKLogRootDisplayDriver();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v16 = _SSKLoggingMethodProem(self, 1);
    rootIdentity = self->_rootIdentity;
    int v20 = 138413058;
    id v21 = v16;
    __int16 v22 = 2112;
    id v23 = rootIdentity;
    __int16 v24 = 2114;
    v25 = v5;
    __int16 v26 = 2114;
    __int16 v27 = v6;
    _os_log_debug_impl(&dword_25C444000, v7, OS_LOG_TYPE_DEBUG, "%@:[%@] %{public}@ record: %{public}@", (uint8_t *)&v20, 0x2Au);
  }
  if (v6)
  {
    [(NSMutableSet *)self->_trackedDisplays addObject:v5];
    dispatch_time_t v8 = [v6 profile];
    int v9 = [v8 displayControllerForDisplay:v5 configuration:v4];
    v10 = [(SSKDisplayAssertionCoordinator *)self->_assertionCoordinator acquireAssertionForDisplay:self->_rootIdentity level:[v8 priorityLevel] delegate:v9];
    v11 = SSKLogRootDisplayDriver();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      __int16 v18 = _SSKLoggingMethodProem(self, 1);
      uint64_t v19 = self->_rootIdentity;
      int v20 = 138413058;
      id v21 = v18;
      __int16 v22 = 2112;
      id v23 = v19;
      __int16 v24 = 2114;
      v25 = v9;
      __int16 v26 = 2114;
      __int16 v27 = v10;
      _os_log_debug_impl(&dword_25C444000, v11, OS_LOG_TYPE_DEBUG, "%@:[%@] --> associating %{public}@ with assertion %{public}@", (uint8_t *)&v20, 0x2Au);
    }
    [v6 associateController:v9 assertion:v10];
    transformUpdater = self->_transformUpdater;
    id v13 = +[CADisplayQueue queue];
    [v9 connectToDisplayIdentity:v5 configuration:v4 displayTransformUpdater:transformUpdater caDisplayQueue:v13 assertion:v10];
  }
  else
  {
    dispatch_time_t v8 = SSKLogRootDisplayDriver();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = _SSKLoggingMethodProem(self, 1);
      v15 = self->_rootIdentity;
      int v20 = 138412802;
      id v21 = v14;
      __int16 v22 = 2112;
      id v23 = v15;
      __int16 v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_25C444000, v8, OS_LOG_TYPE_DEFAULT, "%@:[%@] ignoring untracked connecting derived display: [%@]", (uint8_t *)&v20, 0x20u);
    }
  }
}

- (void)displayConnected:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    __int16 v18 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v19 = [NSString stringWithUTF8String:"-[SSKRootDisplayDriver displayConnected:]"];
    [v18 handleFailureInFunction:v19 file:@"SSKRootDisplayDriver.m" lineNumber:228 description:@"this call must be made on the main thread"];
  }
  id v6 = [v5 identity];
  id v7 = SSKLogRootDisplayDriver();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v16 = _SSKLoggingMethodProem(self, 1);
    rootIdentity = self->_rootIdentity;
    *(_DWORD *)buf = 138412802;
    __int16 v26 = v16;
    __int16 v27 = 2112;
    uint64_t v28 = rootIdentity;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_debug_impl(&dword_25C444000, v7, OS_LOG_TYPE_DEBUG, "%@:[%@] identity: [%@]", buf, 0x20u);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  dispatch_time_t v8 = self->_trackedDisplays;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    unint64_t v12 = 0x263F08000uLL;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ((SSKDisplaysShareRoot(v6, v14) & 1) == 0)
        {
          v15 = [*(id *)(v12 + 1680) currentHandler];
          [v15 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 233, @"connecting display [%@] with different root from already connected display [%@]", v6, v14, (void)v20 object file lineNumber description];

          unint64_t v12 = 0x263F08000;
        }
      }
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  if ([v6 isRootIdentity]) {
    [(SSKRootDisplayDriver *)self _rootDisplayConnected:v5];
  }
  else {
    [(SSKRootDisplayDriver *)self _derivedDisplayConnected:v5];
  }
}

- (void)displayUpdated:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    long long v21 = [MEMORY[0x263F08690] currentHandler];
    long long v22 = [NSString stringWithUTF8String:"-[SSKRootDisplayDriver displayUpdated:]"];
    [v21 handleFailureInFunction:v22 file:@"SSKRootDisplayDriver.m" lineNumber:244 description:@"this call must be made on the main thread"];
  }
  id v7 = [v6 identity];
  dispatch_time_t v8 = SSKLogRootDisplayDriver();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = _SSKLoggingMethodProem(self, 1);
    rootIdentity = self->_rootIdentity;
    *(_DWORD *)buf = 138412802;
    v25 = v19;
    __int16 v26 = 2112;
    __int16 v27 = rootIdentity;
    __int16 v28 = 2112;
    __int16 v29 = v7;
    _os_log_debug_impl(&dword_25C444000, v8, OS_LOG_TYPE_DEBUG, "%@:[%@] identity: [%@]", buf, 0x20u);
  }
  if ((SSKDisplaysShareRoot(v7, self->_rootIdentity) & 1) == 0)
  {
    long long v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 248, @"updating display [%@] with different root from ours [%@]", v7, self->_rootIdentity object file lineNumber description];
  }
  if ([v7 isEqual:self->_rootIdentity]) {
    objc_storeStrong((id *)&self->_rootConfiguration, a3);
  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = [(NSMapTable *)self->_lock_index_recordsByDisplay objectForKey:v7];
  os_unfair_lock_unlock(&self->_lock);
  char v10 = [v7 isEqual:self->_rootIdentity];
  if (v9)
  {
    if ((v10 & 1) == 0)
    {
      uint64_t v11 = [v9 state];
      char v12 = [v11 isEqual:@".DisplayConnected"];

      if ((v12 & 1) == 0)
      {
        id v13 = [MEMORY[0x263F08690] currentHandler];
        id v14 = self->_rootIdentity;
        v15 = [v9 state];
        [v13 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 261, @"[%@] expected record [%@] to be in state %@ but found in state %@", v14, v9, @".DisplayConnected", v15 object file lineNumber description];
      }
    }
    v16 = [v9 controller];
    [v16 displayIdentityDidUpdate:v7 configuration:v6];
  }
  else
  {
    if (v10) {
      goto LABEL_15;
    }
    v16 = SSKLogRootDisplayDriver();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = _SSKLoggingMethodProem(self, 1);
      __int16 v18 = self->_rootIdentity;
      *(_DWORD *)buf = 138412802;
      v25 = v17;
      __int16 v26 = 2112;
      __int16 v27 = v18;
      __int16 v28 = 2112;
      __int16 v29 = v7;
      _os_log_impl(&dword_25C444000, v16, OS_LOG_TYPE_DEFAULT, "%@:[%@] ignoring untracked updating derived display [%@]", buf, 0x20u);
    }
  }

LABEL_15:
}

- (void)displayDisconnected:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    long long v23 = [MEMORY[0x263F08690] currentHandler];
    __int16 v24 = [NSString stringWithUTF8String:"-[SSKRootDisplayDriver displayDisconnected:]"];
    [v23 handleFailureInFunction:v24 file:@"SSKRootDisplayDriver.m" lineNumber:269 description:@"this call must be made on the main thread"];
  }
  if ((SSKDisplaysShareRoot(v5, self->_rootIdentity) & 1) == 0)
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 270, @"updating display [%@] with different root from ours [%@]", v5, self->_rootIdentity object file lineNumber description];
  }
  id v6 = SSKLogRootDisplayDriver();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    long long v21 = _SSKLoggingMethodProem(self, 1);
    rootIdentity = self->_rootIdentity;
    *(_DWORD *)buf = 138412802;
    __int16 v29 = v21;
    __int16 v30 = 2112;
    uint64_t v31 = rootIdentity;
    __int16 v32 = 2112;
    id v33 = v5;
    _os_log_debug_impl(&dword_25C444000, v6, OS_LOG_TYPE_DEBUG, "%@:[%@] identity: [%@]", buf, 0x20u);
  }
  if ([(NSMutableSet *)self->_trackedDisplays containsObject:v5])
  {
    if ([v5 isEqual:self->_rootIdentity])
    {
      rootConfiguration = self->_rootConfiguration;
      self->_rootConfiguration = 0;
    }
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    dispatch_time_t v8 = [(NSMapTable *)self->_lock_index_recordsByDisplay objectForKey:v5];
    lock_recordsByProfile = self->_lock_recordsByProfile;
    char v10 = [v8 profile];
    [(NSMapTable *)lock_recordsByProfile removeObjectForKey:v10];

    [(NSMapTable *)self->_lock_index_recordsByDisplay removeObjectForKey:v5];
    os_unfair_lock_unlock(&self->_lock);
    [(NSMutableSet *)self->_trackedDisplays removeObject:v5];
    if (v8)
    {
      uint64_t v11 = [v8 state];
      int v12 = [v5 isRootIdentity];
      char v13 = [v11 isEqual:@".DisplayConnected"];
      if (v12)
      {
        if ((v13 & 1) == 0)
        {
          __int16 v26 = [MEMORY[0x263F08690] currentHandler];
          [v26 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 296, @"[%@] expected record [%@] to be in state %@ but found in state %@", self->_rootIdentity, v8, @".DisplayConnected", v11 object file lineNumber description];
        }
        [(SSKDisplayAssertionCoordinator *)self->_assertionCoordinator rootDisplayDidDisconnect:self->_rootIdentity];
      }
      else
      {
        if ((v13 & 1) == 0 && ([v11 isEqual:@".AwaitingDisconnect"] & 1) == 0)
        {
          __int16 v27 = [MEMORY[0x263F08690] currentHandler];
          [v27 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 299, @"[%@] expected record [%@] to be in state %@ or %@ but found in state %@", self->_rootIdentity, v8, @".DisplayConnected", @".AwaitingDisconnect", v11 object file lineNumber description];
        }
        assertionCoordinator = self->_assertionCoordinator;
        uint64_t v17 = [v8 assertion];
        [(SSKDisplayAssertionCoordinator *)assertionCoordinator invalidateAssertion:v17];
      }
      __int16 v18 = [v8 controller];
      [v18 displayIdentityDidDisconnect:v5];

LABEL_24:
      goto LABEL_25;
    }
    if (![v5 isEqual:self->_rootIdentity])
    {
      uint64_t v11 = SSKLogRootDisplayDriver();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = _SSKLoggingMethodProem(self, 1);
        long long v20 = self->_rootIdentity;
        *(_DWORD *)buf = 138412802;
        __int16 v29 = v19;
        __int16 v30 = 2112;
        uint64_t v31 = v20;
        __int16 v32 = 2112;
        id v33 = v5;
        _os_log_impl(&dword_25C444000, v11, OS_LOG_TYPE_DEFAULT, "%@:[%@] ignoring untracked disconnecting derived display [%@]", buf, 0x20u);
      }
      goto LABEL_24;
    }
    [(SSKDisplayAssertionCoordinator *)self->_assertionCoordinator rootDisplayDidDisconnect:self->_rootIdentity];
  }
  else
  {
    dispatch_time_t v8 = SSKLogRootDisplayDriver();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = _SSKLoggingMethodProem(self, 1);
      v15 = self->_rootIdentity;
      *(_DWORD *)buf = 138412802;
      __int16 v29 = v14;
      __int16 v30 = 2112;
      uint64_t v31 = v15;
      __int16 v32 = 2112;
      id v33 = v5;
      _os_log_impl(&dword_25C444000, v8, OS_LOG_TYPE_DEFAULT, "%@:[%@] ignoring untracked disconnecting display: [%@]", buf, 0x20u);
    }
  }
LABEL_25:
}

- (BOOL)isTrackingProfile:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  id v6 = [(NSMapTable *)self->_lock_recordsByProfile objectForKey:v5];

  LOBYTE(v5) = [v6 isValid];
  os_unfair_lock_unlock(p_lock);
  return (char)v5;
}

- (BOOL)isTrackingProfileForDisplay:(id)a3
{
  id v5 = a3;
  if ((SSKDisplaysShareRoot(v5, self->_rootIdentity) & 1) == 0)
  {
    char v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 322, @"[%@] being asked if tracking unrelated display [%@]", self->_rootIdentity, v5 object file lineNumber description];
  }
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(NSMapTable *)self->_lock_index_recordsByDisplay objectForKey:v5];
  BOOL v8 = v7 != 0;

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (BOOL)isTrackingDisplays
{
  return [(NSMutableSet *)self->_trackedDisplays count] != 0;
}

- (void)_performWithRecordForDisplay:(id)a3 block:(id)a4
{
  id v11 = a3;
  id v7 = (void (**)(id, void *))a4;
  if ((SSKDisplaysShareRoot(v11, self->_rootIdentity) & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 336, @"[%@] being asked for record of unrelated display [%@]", self->_rootIdentity, v11 object file lineNumber description];
  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  BOOL v8 = [(NSMapTable *)self->_lock_index_recordsByDisplay objectForKey:v11];
  if (!v8)
  {
    char v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 342, @"not tracking display %@", v11 object file lineNumber description];
  }
  v7[2](v7, v8);

  os_unfair_lock_unlock(&self->_lock);
}

- (id)controllerForDisplay:(id)a3
{
  id v5 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__SSKRootDisplayDriver_controllerForDisplay___block_invoke;
  v10[3] = &unk_2654B1910;
  v10[4] = &v11;
  [(SSKRootDisplayDriver *)self _performWithRecordForDisplay:v5 block:v10];
  id v6 = (void *)v12[5];
  if (!v6)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SSKRootDisplayDriver.m" lineNumber:356 description:@"no controller for display"];

    id v6 = (void *)v12[5];
  }
  id v7 = v6;
  _Block_object_dispose(&v11, 8);

  return v7;
}

uint64_t __45__SSKRootDisplayDriver_controllerForDisplay___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 controller];
  return MEMORY[0x270F9A758]();
}

- (id)profileForDisplay:(id)a3
{
  id v5 = a3;
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__SSKRootDisplayDriver_profileForDisplay___block_invoke;
  v8[3] = &unk_2654B1938;
  v8[5] = &v9;
  v8[6] = a2;
  v8[4] = self;
  [(SSKRootDisplayDriver *)self _performWithRecordForDisplay:v5 block:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __42__SSKRootDisplayDriver_profileForDisplay___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = [a2 profile];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a1[6] object:a1[4] file:@"SSKRootDisplayDriver.m" lineNumber:364 description:@"no profile for display"];
  }
}

- (id)transformDisplayConfiguration:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v44 = a3;
  uint64_t v4 = [v44 identity];
  id v5 = [v4 rootIdentity];

  v39 = v5;
  if (([v5 isEqual:self->_rootIdentity] & 1) == 0)
  {
    v35 = [MEMORY[0x263F08690] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 373, @"[%@] asked to transform display configuration that's not our root: [%@]", self->_rootIdentity, v44 object file lineNumber description];
  }
  id v42 = [MEMORY[0x263EFF9C0] set];
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obj = self->_lock_recordsByProfile;
  uint64_t v45 = [(NSMapTable *)obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  id v6 = 0;
  if (v45)
  {
    uint64_t v43 = *(void *)v49;
    v46 = self;
    do
    {
      uint64_t v7 = 0;
      do
      {
        BOOL v8 = v6;
        if (*(void *)v49 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v48 + 1) + 8 * v7);
        uint64_t v10 = [objc_alloc(self->_ConfigBuilderClass) initWithConfiguration:v44];
        uint64_t v11 = [(NSMapTable *)self->_lock_seedsByProfile objectForKey:v9];
        uint64_t v12 = [v11 unsignedIntegerValue];

        v47 = (void *)v10;
        uint64_t v13 = [[SSKSeededDisplayConfigurationBuilder alloc] initWithSeed:v12 builder:v10];
        [v9 transformPhysicalDisplayWithBuilder:v13];
        id v14 = SSKExtractFromBuilder(v13);
        v15 = [v14 identity];
        int v16 = [v15 isRootIdentity];
        int v17 = [v9 usesRootDisplay];
        if (!v16 || (v17 & 1) != 0)
        {
          if ((v16 | v17 ^ 1)) {
            goto LABEL_14;
          }
          __int16 v18 = [MEMORY[0x263F08690] currentHandler];
          rootIdentity = v46->_rootIdentity;
          long long v20 = [v15 rootIdentity];
          v37 = rootIdentity;
          self = v46;
            v37,
            v15,
            v20,
            v9);
        }
        else
        {
          __int16 v18 = [MEMORY[0x263F08690] currentHandler];
          uint64_t v19 = v46->_rootIdentity;
          long long v20 = [v15 rootIdentity];
          v36 = v19;
          self = v46;
            v36,
            v15,
            v20,
            v9);
        }

LABEL_14:
        if (v8) {
          int v22 = v16;
        }
        else {
          int v22 = 0;
        }
        if (v22 == 1)
        {
          id v33 = [MEMORY[0x263F08690] currentHandler];
          [v33 handleFailureInMethod:a2, self, @"SSKRootDisplayDriver.m", 399, @"[%@] multiple profiles using root display\nfirst: [%@]\nsecond: [%@]", self->_rootIdentity, v8, v9 object file lineNumber description];
        }
        if (v16) {
          long long v23 = v9;
        }
        else {
          long long v23 = 0;
        }
        id v6 = v23;

        __int16 v24 = [(NSMapTable *)self->_lock_recordsByProfile objectForKey:v9];
        v25 = [v24 state];
        int v26 = [v25 isEqual:@".ProfileAdded"];

        if (v26)
        {
          [v24 associateDisplay:v15];
          [v42 addObject:v14];
          [(NSMapTable *)self->_lock_index_recordsByDisplay setObject:v24 forKey:v15];
          __int16 v27 = v47;
        }
        else
        {
          __int16 v28 = [v24 state];
          int v29 = [v28 isEqual:@".DisplayTransformed"];

          __int16 v27 = v47;
          if (v29)
          {
            [v42 addObject:v14];
          }
          else
          {
            __int16 v30 = [v24 state];
            int v31 = [v30 isEqual:@".DisplayConnected"];

            if (v31)
            {
              __int16 v32 = SSKExtractFromBuilder(v13);
              [v42 addObject:v32];
            }
          }
        }

        ++v7;
      }
      while (v45 != v7);
      uint64_t v45 = [(NSMapTable *)obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v45);
  }

  os_unfair_lock_unlock(lock);
  if (!v6) {
    [v42 addObject:v44];
  }

  return v42;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __53__SSKRootDisplayDriver_appendDescriptionToFormatter___block_invoke;
  v16[3] = &unk_2654B15F8;
  id v9 = v8;
  id v17 = v9;
  __int16 v18 = self;
  [v9 appendProem:self block:v16];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  lock_recordsByProfile = self->_lock_recordsByProfile;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__SSKRootDisplayDriver_appendDescriptionToFormatter___block_invoke_2;
  v13[3] = &unk_2654B1988;
  id v14 = v9;
  v15 = self;
  id v12 = v9;
  [v12 appendCollection:lock_recordsByProfile withName:0 itemBlock:v13];
  os_unfair_lock_unlock(p_lock);
}

id __53__SSKRootDisplayDriver_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:0];
}

void __53__SSKRootDisplayDriver_appendDescriptionToFormatter___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__SSKRootDisplayDriver_appendDescriptionToFormatter___block_invoke_3;
  v7[3] = &unk_2654B1960;
  uint64_t v5 = a1 + 32;
  id v4 = *(void **)(a1 + 32);
  v7[4] = *(void *)(v5 + 8);
  id v8 = v3;
  id v9 = v4;
  id v6 = v3;
  [v4 sameLine:v7];
}

void __53__SSKRootDisplayDriver_appendDescriptionToFormatter___block_invoke_3(uint64_t a1)
{
  id v7 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) appendProem:v7 block:&__block_literal_global_1];
  v2 = *(void **)(a1 + 48);
  id v3 = [v7 state];
  id v4 = (id)[v2 appendObject:v3 withName:0];

  id v5 = (id)objc_msgSend(*(id *)(a1 + 48), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "priorityLevel"), @"lvl");
  id v6 = (id)[*(id *)(a1 + 48) appendPointer:*(void *)(a1 + 40) withName:@"profile"];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x263F29C48] descriptionForRootObject:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_index_recordsByDisplay, 0);
  objc_storeStrong((id *)&self->_lock_seedsByProfile, 0);
  objc_storeStrong((id *)&self->_lock_recordsByProfile, 0);
  objc_storeStrong((id *)&self->_trackedDisplays, 0);
  objc_storeStrong((id *)&self->_rootConfiguration, 0);
  objc_storeStrong((id *)&self->_transformUpdater, 0);
  objc_storeStrong((id *)&self->_assertionCoordinator, 0);
  objc_storeStrong((id *)&self->_rootIdentity, 0);
}

@end