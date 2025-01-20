@interface UNCRemoteNotificationServer
+ (id)_newPushServiceConnectionWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4 queue:(id)a5;
- (BOOL)_canMoveTopic:(id)a3 fromList:(unint64_t)a4 toList:(unint64_t)a5 connection:(id)a6;
- (BOOL)_queue_allowServiceExtensionFilteringForMessage:(id)a3;
- (BOOL)_queue_canDeliverMessageToBundle:(id)a3;
- (BOOL)_queue_enforcePushTypeForMessage:(id)a3;
- (BOOL)_queue_isApplicationForeground:(id)a3;
- (BOOL)_queue_isApplicationRunning:(id)a3;
- (BOOL)_queue_isBackgroundAppRefreshAllowedForBundleIdentifier:(id)a3;
- (BOOL)_queue_isPushEnabledForApplication:(id)a3;
- (BOOL)_queue_isUserNotificationEnabledForApplication:(id)a3;
- (BOOL)_queue_isVisibleUserNotificationEnabledForApplication:(id)a3;
- (BOOL)_queue_messageIsValidForDelivery:(id)a3;
- (BOOL)_queue_shouldBoostTopicToEnabled:(id)a3;
- (BOOL)_requestContainsDisallowedPrivateUserInfo:(id)a3;
- (BOOL)allowsRemoteNotificationsForBundleIdentifier:(id)a3;
- (UNCRemoteNotificationServer)initWithNotificationRepository:(id)a3 attachmentsService:(id)a4 pushRegistrationRepository:(id)a5 platform:(id)a6;
- (UNCRemoteNotificationServerObserver)observer;
- (id)_initWithNotificationRepository:(id)a3 attachmentsService:(id)a4 pushRegistrationRepository:(id)a5 platform:(id)a6 queue:(id)a7 apsQueue:(id)a8 duetActivityScheduler:(id)a9 serviceExtensionManager:(id)a10;
- (id)_portNameForEnvironmentName:(id)a3;
- (id)_queue_allTopicsForApplication:(id)a3;
- (id)_topicsForList:(unint64_t)a3 connection:(id)a4;
- (void)_extensionQueue_modifyNotificationRequest:(id)a3 bundleIdentifier:(id)a4 message:(id)a5 extension:(id)a6 enforcePushType:(BOOL)a7;
- (void)_queue_applicationDidBecomeBackground:(id)a3;
- (void)_queue_applicationDidBecomeForeground:(id)a3;
- (void)_queue_applicationDidLaunch:(id)a3;
- (void)_queue_applicationDidTerminate:(id)a3;
- (void)_queue_backgroundRefreshApplicationsDidChange;
- (void)_queue_calculateTopics;
- (void)_queue_connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)_queue_connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)_queue_deliverNotificationRequest:(id)a3 bundleIdentifier:(id)a4 message:(id)a5 enforcePushType:(BOOL)a6;
- (void)_queue_deliverNotificationRequest:(id)a3 bundleIdentifier:(id)a4 message:(id)a5 enforcePushType:(BOOL)a6 extensionStart:(id)a7 extensionEnd:(id)a8;
- (void)_queue_didChangeNotificationSettings:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_didChangeProcessState:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_didCompleteInitialization;
- (void)_queue_didReceiveIncomingMessage:(id)a3;
- (void)_queue_invalidateTokenForBundleIdentifier:(id)a3;
- (void)_queue_moveTopicsForApplication:(id)a3 fromList:(unint64_t)a4 toList:(unint64_t)a5;
- (void)_queue_registerApplicationWithBundleIdentifier:(id)a3 forEnvironment:(id)a4;
- (void)_queue_reloadBackgroundAppRefreshDisabledList;
- (void)_queue_reloadRegistrations;
- (void)_queue_removeRegistrationForBundleIdentifier:(id)a3;
- (void)_queue_setPushRegistration:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_tryToModifyNotificationRequest:(id)a3 bundleIdentifier:(id)a4 message:(id)a5 enforcePushType:(BOOL)a6;
- (void)_scheduleContentAvailablePushActivityForMessage:(id)a3 bundleIdentifier:(id)a4;
- (void)backgroundRefreshApplicationsDidChange;
- (void)bluelistStatusChanged;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)dealloc;
- (void)didChangeNotificationSettings:(id)a3 forBundleIdentifier:(id)a4;
- (void)didChangeProcessState:(id)a3 forBundleIdentifier:(id)a4;
- (void)didCompleteInitialization;
- (void)invalidateTokenForRemoteNotificationsForBundleIdentifier:(id)a3;
- (void)notificationSourcesDidInstall:(id)a3;
- (void)notificationSourcesDidUninstall:(id)a3;
- (void)requestRemoteNotificationTokenWithEnvironment:(id)a3 forBundleIdentifier:(id)a4;
- (void)setObserver:(id)a3;
@end

@implementation UNCRemoteNotificationServer

uint64_t __73__UNCRemoteNotificationServer_didChangeProcessState_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didChangeProcessState:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)invalidateTokenForRemoteNotificationsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __88__UNCRemoteNotificationServer_invalidateTokenForRemoteNotificationsForBundleIdentifier___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__UNCRemoteNotificationServer_connection_didReceiveToken_forTopic_identifier___block_invoke;
  block[3] = &unk_2655678A0;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(queue, block);
}

- (void)requestRemoteNotificationTokenWithEnvironment:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__UNCRemoteNotificationServer_requestRemoteNotificationTokenWithEnvironment_forBundleIdentifier___block_invoke;
  block[3] = &unk_2655676D8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)didChangeProcessState:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__UNCRemoteNotificationServer_didChangeProcessState_forBundleIdentifier___block_invoke;
  block[3] = &unk_2655676D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_queue_didChangeProcessState:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = *MEMORY[0x263F1E060];
  id v9 = *MEMORY[0x263F1E060];
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543874;
      id v16 = v7;
      __int16 v17 = 2114;
      id v18 = v7;
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_impl(&dword_2608DB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ application state changed to %{public}@", (uint8_t *)&v15, 0x20u);
    }
    int v10 = [(UNCRemoteNotificationServer *)self _queue_isApplicationForeground:v7];
    if ([v6 isRunning])
    {
      id v11 = [v6 endowmentNamespaces];
      int v12 = [v11 containsObject:@"com.apple.frontboard.visibility"];

      if (v10 == v12) {
        goto LABEL_12;
      }
      if (v12)
      {
        [(UNCRemoteNotificationServer *)self _queue_applicationDidBecomeForeground:v7];
        goto LABEL_12;
      }
    }
    else if ((v10 & 1) == 0)
    {
      goto LABEL_12;
    }
    [(UNCRemoteNotificationServer *)self _queue_applicationDidBecomeBackground:v7];
LABEL_12:
    int v13 = [(UNCRemoteNotificationServer *)self _queue_isApplicationRunning:v7];
    int v14 = [v6 isRunning];
    if (v13 != v14)
    {
      if (v14) {
        [(UNCRemoteNotificationServer *)self _queue_applicationDidLaunch:v7];
      }
      else {
        [(UNCRemoteNotificationServer *)self _queue_applicationDidTerminate:v7];
      }
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[UNCRemoteNotificationServer _queue_didChangeProcessState:forBundleIdentifier:](v8);
  }
LABEL_16:
}

- (BOOL)_queue_isApplicationRunning:(id)a3
{
  v3 = self;
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  LOBYTE(v3) = [(NSMutableSet *)v3->_runningBundleIdentifiers containsObject:v5];

  return (char)v3;
}

- (BOOL)_queue_isApplicationForeground:(id)a3
{
  v3 = self;
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  LOBYTE(v3) = [(NSMutableSet *)v3->_foregroundBundleIdentifiers containsObject:v5];

  return (char)v3;
}

- (void)_queue_applicationDidLaunch:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(NSMutableSet *)self->_runningBundleIdentifiers addObject:v5];
}

- (void)_queue_applicationDidBecomeForeground:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSMutableSet *)self->_foregroundBundleIdentifiers addObject:v4];
  id v5 = [(NSMutableDictionary *)self->_bundleIdentifierToRegistration objectForKey:v4];

  if (v5)
  {
    if ([(UNCRemoteNotificationServer *)self _queue_isUserNotificationEnabledForApplication:v4])
    {
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v6 = 3;
    }
    [(UNCRemoteNotificationServer *)self _queue_moveTopicsForApplication:v4 fromList:v6 toList:0];
  }
  else
  {
    id v7 = *MEMORY[0x263F1E060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignore becoming foreground for application without push registration", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (BOOL)_queue_isUserNotificationEnabledForApplication:(id)a3
{
  v3 = self;
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  LOBYTE(v3) = [(NSMutableSet *)v3->_userNotificationEnabledBundleIdentifiers containsObject:v5];

  return (char)v3;
}

- (void)_queue_calculateTopics
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_initializationCompleted)
  {
    id v58 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v57 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v56 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v55 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v54 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v3 = self->_bundleIdentifierToRegistration;
    uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v71 objects:v87 count:16];
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)v72;
      *(void *)&long long v5 = 138543362;
      long long v52 = v5;
      v53 = v3;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v72 != v7) {
            objc_enumerationMutation(v3);
          }
          id v9 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          if (-[NSMutableSet containsObject:](self->_installedBundleIdentifiers, "containsObject:", v9, v52)&& ([(NSMutableSet *)self->_restrictedBundleIdentifiers containsObject:v9] & 1) == 0)
          {
            uint64_t v10 = [(NSMutableDictionary *)self->_bundleIdentifierToRegistration objectForKey:v9];
            id v11 = v10;
            if (v10)
            {
              int v12 = [v10 environment];
              if (v12)
              {
                BOOL v13 = [(UNCRemoteNotificationServer *)self _queue_isApplicationForeground:v9];
                BOOL v14 = [(UNCRemoteNotificationServer *)self _queue_isUserNotificationEnabledForApplication:v9];
                BOOL v61 = v13;
                BOOL v60 = v14
                   && [(UNCRemoteNotificationServer *)self _queue_shouldBoostTopicToEnabled:v9];
                BOOL v59 = [(UNCRemoteNotificationServer *)self _queue_isPushEnabledForApplication:v9];
                uint64_t v17 = [v58 indexOfObject:v12];
                if (v17 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  uint64_t v17 = [v58 count];
                  [v58 addObject:v12];
                  id v18 = [MEMORY[0x263EFF980] array];
                  [v57 addObject:v18];

                  __int16 v19 = [MEMORY[0x263EFF980] array];
                  [v56 addObject:v19];

                  id v20 = [MEMORY[0x263EFF980] array];
                  [v55 addObject:v20];

                  uint64_t v21 = [MEMORY[0x263EFF980] array];
                  [v54 addObject:v21];
                }
                id v22 = [(UNCRemoteNotificationServer *)self _queue_allTopicsForApplication:v9];
                id v23 = v56;
                if (!v14) {
                  id v23 = v55;
                }
                id v24 = v57;
                if (!v61 && !v60) {
                  id v24 = v23;
                }
                if (v59) {
                  v25 = v24;
                }
                else {
                  v25 = v54;
                }
                v26 = [v25 objectAtIndex:v17];
                [v26 addObjectsFromArray:v22];

                v3 = v53;
              }
              else
              {
                id v16 = *MEMORY[0x263F1E060];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v52;
                  v77 = v9;
                  _os_log_error_impl(&dword_2608DB000, v16, OS_LOG_TYPE_ERROR, "[%{public}@] Push registration with a nil environment was encountered, will ignore", buf, 0xCu);
                }
              }
            }
            else
            {
              int v15 = *MEMORY[0x263F1E060];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v52;
                v77 = v9;
                _os_log_error_impl(&dword_2608DB000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Missing push registration was encountered, will ignore", buf, 0xCu);
              }
            }
          }
        }
        uint64_t v6 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v71 objects:v87 count:16];
      }
      while (v6);
    }

    id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v28 = self->_environmentsToConnections;
    uint64_t v29 = [(NSMutableDictionary *)v28 countByEnumeratingWithState:&v67 objects:v86 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v68;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v68 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v67 + 1) + 8 * j);
          if (([v58 containsObject:v33] & 1) == 0) {
            [v27 addObject:v33];
          }
        }
        uint64_t v30 = [(NSMutableDictionary *)v28 countByEnumeratingWithState:&v67 objects:v86 count:16];
      }
      while (v30);
    }

    uint64_t v62 = [v58 count];
    if (v62 >= 1)
    {
      for (uint64_t k = 0; k != v62; ++k)
      {
        v35 = [v58 objectAtIndex:k];
        v36 = [v57 objectAtIndex:k];
        v37 = [v56 objectAtIndex:k];
        v38 = [v55 objectAtIndex:k];
        v39 = [v54 objectAtIndex:k];
        v40 = [(NSMutableDictionary *)self->_environmentsToConnections objectForKey:v35];
        if (!v40)
        {
          v41 = [(UNCRemoteNotificationServer *)self _portNameForEnvironmentName:v35];
          v40 = (void *)[(id)objc_opt_class() _newPushServiceConnectionWithEnvironmentName:v35 namedDelegatePort:v41 queue:self->_apsQueue];
          [v40 setDelegate:self];
          [(NSMutableDictionary *)self->_environmentsToConnections setObject:v40 forKey:v35];
        }
        v42 = *MEMORY[0x263F1E060];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544386;
          v77 = v35;
          __int16 v78 = 2114;
          v79 = v36;
          __int16 v80 = 2114;
          v81 = v39;
          __int16 v82 = 2114;
          v83 = v37;
          __int16 v84 = 2114;
          v85 = v38;
          _os_log_impl(&dword_2608DB000, v42, OS_LOG_TYPE_DEFAULT, "Setting topics for environment %{public}@:\nenabled: %{public}@\nignored: %{public}@\nopportunistic:%{public}@\nnonWakingOpportunistic:%{public}@", buf, 0x34u);
        }
        [v40 setEnabledTopics:v36 ignoredTopics:v39 opportunisticTopics:v37 nonWakingTopics:v38];
      }
    }
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v43 = v27;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v63 objects:v75 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v64;
      uint64_t v47 = MEMORY[0x263EFFA68];
      do
      {
        for (uint64_t m = 0; m != v45; ++m)
        {
          if (*(void *)v64 != v46) {
            objc_enumerationMutation(v43);
          }
          v49 = *(void **)(*((void *)&v63 + 1) + 8 * m);
          v50 = [(NSMutableDictionary *)self->_environmentsToConnections objectForKey:v49];
          v51 = *MEMORY[0x263F1E060];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v77 = v49;
            _os_log_impl(&dword_2608DB000, v51, OS_LOG_TYPE_DEFAULT, "Setting no enabled, ignored or opportunistic topics for environment %{public}@", buf, 0xCu);
          }
          [v50 setEnabledTopics:v47 ignoredTopics:v47 opportunisticTopics:v47 nonWakingTopics:v47];
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v63 objects:v75 count:16];
      }
      while (v45);
    }

    [(NSMutableDictionary *)self->_environmentsToConnections removeObjectsForKeys:v43];
  }
}

- (void)_queue_moveTopicsForApplication:(id)a3 fromList:(unint64_t)a4 toList:(unint64_t)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v23 = v8;
  id v9 = [(UNCRemoteNotificationServer *)self _queue_allTopicsForApplication:v8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v26 = self;
  obuint64_t j = self->_environmentsToConnections;
  uint64_t v10 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v25 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(obj);
        }
        BOOL v13 = [(NSMutableDictionary *)v26->_environmentsToConnections objectForKey:*(void *)(*((void *)&v31 + 1) + 8 * i)];
        BOOL v14 = (void *)*MEMORY[0x263F1E060];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
        {
          int v15 = @"Unknown";
          if (a4 <= 3) {
            int v15 = off_265567910[a4];
          }
          id v16 = @"Unknown";
          if (a5 <= 3) {
            id v16 = off_265567910[a5];
          }
          *(_DWORD *)buf = 138543874;
          v37 = v15;
          __int16 v38 = 2114;
          v39 = v16;
          __int16 v40 = 2114;
          v41 = v9;
          uint64_t v17 = v14;
          _os_log_impl(&dword_2608DB000, v17, OS_LOG_TYPE_DEFAULT, "Move topics from %{public}@ to %{public}@: %{public}@", buf, 0x20u);
        }
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v18 = v9;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v28;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v28 != v21) {
                objc_enumerationMutation(v18);
              }
              [v13 moveTopic:*(void *)(*((void *)&v27 + 1) + 8 * j) fromList:a4 toList:a5];
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v20);
        }
      }
      uint64_t v11 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v31 objects:v42 count:16];
    }
    while (v11);
  }
}

- (id)_queue_allTopicsForApplication:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v5 = [MEMORY[0x263EFF980] arrayWithObject:v4];
  if ([(NSMutableSet *)self->_cloudKitBundleIdentifiers containsObject:v4])
  {
    uint64_t v6 = [@"com.apple.icloud-container." stringByAppendingString:v4];
    [v5 addObject:v6];
  }

  return v5;
}

- (void)_queue_connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v8)
  {
    if (v9)
    {
      if ([v9 hasPrefix:@"com.apple.icloud-container."])
      {
        uint64_t v10 = *MEMORY[0x263F1E060];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v39 = 138543362;
          *(void *)&v39[4] = v9;
          _os_log_impl(&dword_2608DB000, v10, OS_LOG_TYPE_DEFAULT, "Do not deliver per-app token for CloudKit topic %{public}@", v39, 0xCu);
        }
        goto LABEL_34;
      }
      int v12 = [(NSMutableDictionary *)self->_bundleIdentifierToRegistration objectForKey:v9];
      BOOL v13 = v12;
      if (!v12)
      {
        id v23 = *MEMORY[0x263F1E060];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v39 = 138543362;
          *(void *)&v39[4] = v9;
          _os_log_impl(&dword_2608DB000, v23, OS_LOG_TYPE_DEFAULT, "Received per-app token for topic %{public}@ for unregistered app", v39, 0xCu);
        }
        goto LABEL_33;
      }
      BOOL v14 = [v12 token];
      int v15 = [v14 isEqual:v8];
      char v16 = v15;
      int v17 = v15 ^ 1;

      id v18 = (os_log_t *)MEMORY[0x263F1E060];
      uint64_t v19 = (void *)*MEMORY[0x263F1E060];
      BOOL v20 = os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (!v20) {
          goto LABEL_19;
        }
        uint64_t v21 = v19;
        *(_DWORD *)v39 = 134349314;
        *(void *)&v39[4] = [v8 length];
        *(_WORD *)&v39[12] = 2114;
        *(void *)&v39[14] = v9;
        id v22 = "Received same per-app token [%{public}lu] for topic %{public}@";
      }
      else
      {
        if (!v20) {
          goto LABEL_19;
        }
        uint64_t v21 = v19;
        *(_DWORD *)v39 = 134349314;
        *(void *)&v39[4] = [v8 length];
        *(_WORD *)&v39[12] = 2114;
        *(void *)&v39[14] = v9;
        id v22 = "Received new per-app token [%{public}lu] for topic %{public}@";
      }
      _os_log_impl(&dword_2608DB000, v21, OS_LOG_TYPE_DEFAULT, v22, v39, 0x16u);

LABEL_19:
      int v24 = -[NSMutableSet containsObject:](self->_bundleIdentifiersNeedingToken, "containsObject:", v9, *(_OWORD *)v39, *(void *)&v39[16], v40) | v17;
      [(NSMutableSet *)self->_bundleIdentifiersNeedingToken removeObject:v9];
      if (![(NSMutableSet *)self->_bundleIdentifiersNeedingToken count])
      {
        bundleIdentifiersNeedingToken = self->_bundleIdentifiersNeedingToken;
        self->_bundleIdentifiersNeedingToken = 0;
      }
      if (!v24) {
        goto LABEL_31;
      }
      int v26 = [(NSMutableSet *)self->_installedBundleIdentifiers containsObject:v9];
      os_log_t v27 = *v18;
      BOOL v28 = os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT);
      if (v26)
      {
        if (v28)
        {
          long long v29 = v27;
          uint64_t v30 = [v8 length];
          *(_DWORD *)v39 = 134349314;
          *(void *)&v39[4] = v30;
          *(_WORD *)&v39[12] = 2114;
          *(void *)&v39[14] = v9;
          _os_log_impl(&dword_2608DB000, v29, OS_LOG_TYPE_DEFAULT, "Send per-app token [%{public}lu] to client for topic %{public}@", v39, 0x16u);
        }
        if (objc_opt_respondsToSelector()) {
          [(UNCRemoteNotificationServerObserver *)self->_observer didReceiveDeviceToken:v8 forBundleIdentifier:v9];
        }
        long long v31 = [v13 environment];
        long long v32 = [v13 tokenIdentifier];
        long long v33 = +[UNCPushRegistration pushRegistrationWithEnvironment:v31 tokenIdentifier:v32 token:v8];

        [(UNCRemoteNotificationServer *)self _queue_setPushRegistration:v33 forBundleIdentifier:v9];
      }
      else
      {
        if (!v28) {
          goto LABEL_31;
        }
        long long v33 = v27;
        uint64_t v34 = [v8 length];
        *(_DWORD *)v39 = 134349314;
        *(void *)&v39[4] = v34;
        *(_WORD *)&v39[12] = 2114;
        *(void *)&v39[14] = v9;
        _os_log_impl(&dword_2608DB000, v33, OS_LOG_TYPE_DEFAULT, "Do not send per-app token [%{public}lu] to client for topic %{public}@", v39, 0x16u);
      }

LABEL_31:
      os_log_t v35 = *v18;
      if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
      {
        v36 = self->_bundleIdentifiersNeedingToken;
        v37 = v35;
        uint64_t v38 = [(NSMutableSet *)v36 count];
        *(_DWORD *)v39 = 134217984;
        *(void *)&v39[4] = v38;
        _os_log_impl(&dword_2608DB000, v37, OS_LOG_TYPE_DEFAULT, "%lu apps waiting for tokens", v39, 0xCu);
      }
LABEL_33:

      goto LABEL_34;
    }
    uint64_t v11 = (void *)*MEMORY[0x263F1E060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_ERROR)) {
      -[UNCRemoteNotificationServer _queue_connection:didReceiveToken:forTopic:identifier:](v11, v8);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_ERROR))
  {
    -[UNCRemoteNotificationServer _queue_connection:didReceiveToken:forTopic:identifier:]();
  }
LABEL_34:
}

- (void)_queue_setPushRegistration:(id)a3 forBundleIdentifier:(id)a4
{
  bundleIdentifierToRegistration = self->_bundleIdentifierToRegistration;
  id v7 = a4;
  id v8 = a3;
  [(NSMutableDictionary *)bundleIdentifierToRegistration setObject:v8 forKey:v7];
  [(UNCPushRegistrationRepository *)self->_pushRegistrationRepository setRegistration:v8 forBundleIdentifier:v7];
}

- (void)_queue_registerApplicationWithBundleIdentifier:(id)a3 forEnvironment:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [(NSMutableDictionary *)self->_bundleIdentifierToRegistration objectForKey:v6];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = [v8 environment];
    char v11 = [v10 isEqual:v7];

    if (v11)
    {
      int v12 = 0;
      goto LABEL_7;
    }
    BOOL v13 = [v9 tokenIdentifier];
    id v14 = v7;
    int v15 = v13;
  }
  else
  {
    BOOL v13 = [MEMORY[0x263F08C38] UUID];
    id v9 = [v13 UUIDString];
    id v14 = v7;
    int v15 = v9;
  }
  uint64_t v16 = +[UNCPushRegistration pushRegistrationWithEnvironment:v14 tokenIdentifier:v15 token:0];

  [(UNCRemoteNotificationServer *)self _queue_setPushRegistration:v16 forBundleIdentifier:v6];
  int v12 = 1;
  id v9 = (void *)v16;
LABEL_7:
  int v17 = [(NSMutableDictionary *)self->_environmentsToConnections objectForKey:v7];
  if (!v17)
  {
    [(UNCRemoteNotificationServer *)self _queue_calculateTopics];
    int v17 = [(NSMutableDictionary *)self->_environmentsToConnections objectForKey:v7];
  }
  if (!self->_bundleIdentifiersNeedingToken)
  {
    id v18 = (NSMutableSet *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:1];
    bundleIdentifiersNeedingToken = self->_bundleIdentifiersNeedingToken;
    self->_bundleIdentifiersNeedingToken = v18;
  }
  BOOL v20 = [v9 tokenIdentifier];
  uint64_t v21 = (void *)*MEMORY[0x263F1E060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
  {
    id v22 = v21;
    id v23 = [v9 tokenIdentifier];
    int v24 = 138543618;
    id v25 = v6;
    __int16 v26 = 2114;
    os_log_t v27 = v23;
    _os_log_impl(&dword_2608DB000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request per-app token with token identifier %{public}@", (uint8_t *)&v24, 0x16u);
  }
  [(NSMutableSet *)self->_bundleIdentifiersNeedingToken addObject:v6];
  [v17 requestTokenForTopic:v6 identifier:v20];
  if (v12) {
    [(UNCRemoteNotificationServer *)self _queue_calculateTopics];
  }
}

uint64_t __97__UNCRemoteNotificationServer_requestRemoteNotificationTokenWithEnvironment_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_registerApplicationWithBundleIdentifier:forEnvironment:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t __78__UNCRemoteNotificationServer_connection_didReceiveToken_forTopic_identifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_connection:didReceiveToken:forTopic:identifier:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

uint64_t __88__UNCRemoteNotificationServer_invalidateTokenForRemoteNotificationsForBundleIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_invalidateTokenForBundleIdentifier:", *(void *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_queue_removeRegistrationForBundleIdentifier:", *(void *)(a1 + 40));
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_queue_calculateTopics");
}

- (void)_queue_removeRegistrationForBundleIdentifier:(id)a3
{
  bundleIdentifierToRegistration = self->_bundleIdentifierToRegistration;
  id v5 = a3;
  [(NSMutableDictionary *)bundleIdentifierToRegistration removeObjectForKey:v5];
  [(UNCPushRegistrationRepository *)self->_pushRegistrationRepository removeRegistrationForBundleIdentifier:v5];
}

- (void)_queue_invalidateTokenForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_bundleIdentifierToRegistration objectForKey:v4];
  id v6 = [v5 environment];
  if (v6)
  {
    id v7 = [v5 tokenIdentifier];
    id v8 = [(NSMutableDictionary *)self->_environmentsToConnections objectForKey:v6];
    [v8 invalidateTokenForTopic:v4 identifier:v7];
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_ERROR))
  {
    -[UNCRemoteNotificationServer _queue_invalidateTokenForBundleIdentifier:]();
  }
}

- (void)_queue_invalidateTokenForBundleIdentifier:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2608DB000, v0, v1, "[%{public}@] Push registration with a nil environment was encountered, will not invalidate token", v2);
}

- (UNCRemoteNotificationServer)initWithNotificationRepository:(id)a3 attachmentsService:(id)a4 pushRegistrationRepository:(id)a5 platform:(id)a6
{
  char v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  dispatch_queue_t v16 = dispatch_queue_create("com.apple.usernotificationsserver.RemoteNotificationServer", v11);

  int v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v18 = dispatch_queue_create("com.apple.usernotificationsserver.RemoteNotificationServer.APSConnection", v17);

  uint64_t v19 = [MEMORY[0x263F3AFD8] scheduler];
  BOOL v20 = objc_alloc_init(UNCNotificationServiceExtensionManager);
  uint64_t v21 = [(UNCRemoteNotificationServer *)self _initWithNotificationRepository:v15 attachmentsService:v14 pushRegistrationRepository:v13 platform:v12 queue:v16 apsQueue:v18 duetActivityScheduler:v19 serviceExtensionManager:v20];

  return v21;
}

- (id)_initWithNotificationRepository:(id)a3 attachmentsService:(id)a4 pushRegistrationRepository:(id)a5 platform:(id)a6 queue:(id)a7 apsQueue:(id)a8 duetActivityScheduler:(id)a9 serviceExtensionManager:(id)a10
{
  id v51 = a3;
  id v50 = a4;
  id v49 = a5;
  id v48 = a6;
  id v47 = a7;
  id v46 = a8;
  id v45 = a9;
  id v17 = a10;
  v52.receiver = self;
  v52.super_class = (Class)UNCRemoteNotificationServer;
  dispatch_queue_t v18 = [(UNCRemoteNotificationServer *)&v52 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_notificationRepository, a3);
    objc_storeStrong((id *)&v19->_attachmentsService, a4);
    objc_storeStrong((id *)&v19->_pushRegistrationRepository, a5);
    objc_storeStrong((id *)&v19->_platform, a6);
    objc_storeStrong((id *)&v19->_duetActivityScheduler, a9);
    objc_storeStrong((id *)&v19->_serviceExtensionManager, a10);
    objc_storeStrong((id *)&v19->_queue, a7);
    objc_storeStrong((id *)&v19->_apsQueue, a8);
    BOOL v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    cloudKitBundleIdentifiers = v19->_cloudKitBundleIdentifiers;
    v19->_cloudKitBundleIdentifiers = v20;

    id v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    contentAvailableBundleIdentifiers = v19->_contentAvailableBundleIdentifiers;
    v19->_contentAvailableBundleIdentifiers = v22;

    int v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    quietServiceExtensionBundleIdentifiers = v19->_quietServiceExtensionBundleIdentifiers;
    v19->_quietServiceExtensionBundleIdentifiers = v24;

    __int16 v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    foregroundBundleIdentifiers = v19->_foregroundBundleIdentifiers;
    v19->_foregroundBundleIdentifiers = v26;

    uint64_t v28 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    installedBundleIdentifiers = v19->_installedBundleIdentifiers;
    v19->_installedBundleIdentifiers = v28;

    uint64_t v30 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    restrictedBundleIdentifiers = v19->_restrictedBundleIdentifiers;
    v19->_restrictedBundleIdentifiers = v30;

    long long v32 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    runningBundleIdentifiers = v19->_runningBundleIdentifiers;
    v19->_runningBundleIdentifiers = v32;

    uint64_t v34 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    userNotificationEnabledBundleIdentifiers = v19->_userNotificationEnabledBundleIdentifiers;
    v19->_userNotificationEnabledBundleIdentifiers = v34;

    v36 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    visibleUserNotificationEnabledBundleIdentifiers = v19->_visibleUserNotificationEnabledBundleIdentifiers;
    v19->_visibleUserNotificationEnabledBundleIdentifiers = v36;

    uint64_t v38 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    bundleIdentifierToRegistration = v19->_bundleIdentifierToRegistration;
    v19->_bundleIdentifierToRegistration = v38;

    uint64_t v40 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    environmentsToConnections = v19->_environmentsToConnections;
    v19->_environmentsToConnections = v40;

    v42 = objc_alloc_init(UNCBlueListMonitor);
    blueListMonitor = v19->_blueListMonitor;
    v19->_blueListMonitor = v42;
  }
  return v19;
}

- (void)dealloc
{
  [(UNCRemoteNotificationServer *)self setObserver:0];
  v3.receiver = self;
  v3.super_class = (Class)UNCRemoteNotificationServer;
  [(UNCRemoteNotificationServer *)&v3 dealloc];
}

- (void)didChangeNotificationSettings:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__UNCRemoteNotificationServer_didChangeNotificationSettings_forBundleIdentifier___block_invoke;
  block[3] = &unk_2655676D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __81__UNCRemoteNotificationServer_didChangeNotificationSettings_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didChangeNotificationSettings:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)didCompleteInitialization
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__UNCRemoteNotificationServer_didCompleteInitialization__block_invoke;
  block[3] = &unk_265567728;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __56__UNCRemoteNotificationServer_didCompleteInitialization__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didCompleteInitialization");
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__UNCRemoteNotificationServer_connection_didReceivePublicToken___block_invoke;
  block[3] = &unk_2655676D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __64__UNCRemoteNotificationServer_connection_didReceivePublicToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_connection:didReceivePublicToken:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queue_connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [(NSMutableDictionary *)self->_environmentsToConnections allKeysForObject:v6];
  uint64_t v9 = [v8 lastObject];

  id v10 = (void *)*MEMORY[0x263F1E060];
  long long v64 = (void *)v9;
  char v11 = *MEMORY[0x263F1E060];
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v10;
      *(_DWORD *)buf = 134349314;
      uint64_t v76 = [v7 length];
      __int16 v77 = 2114;
      uint64_t v78 = v9;
      _os_log_impl(&dword_2608DB000, v12, OS_LOG_TYPE_DEFAULT, "Received new public token [%{public}lu] for environment %{public}@", buf, 0x16u);
    }
    id v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v14 = [v13 dictionaryForKey:@"SBEnvironmentsToLastKnownTokens"];
    id v15 = (id)[v14 mutableCopy];

    uint64_t v16 = [v15 objectForKey:v9];
    id v17 = (void *)v16;
    if ((id)v16 == v7 || v16 && [v7 isEqualToData:v16])
    {
      dispatch_queue_t v18 = (void *)*MEMORY[0x263F1E060];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = v18;
        uint64_t v20 = [v7 length];
        *(_DWORD *)buf = 134349056;
        uint64_t v76 = v20;
        _os_log_impl(&dword_2608DB000, v19, OS_LOG_TYPE_DEFAULT, "Received same public token [%{public}lu]", buf, 0xCu);
      }
    }
    else
    {
      BOOL v59 = v17;
      uint64_t v21 = (void *)*MEMORY[0x263F1E060];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
      {
        id v22 = v21;
        uint64_t v23 = [v7 length];
        *(_DWORD *)buf = 134349056;
        uint64_t v76 = v23;
        _os_log_impl(&dword_2608DB000, v22, OS_LOG_TYPE_DEFAULT, "Received new public token [%{public}lu]", buf, 0xCu);
      }
      if (!v15) {
        id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      }
      long long v63 = v6;
      if (v7) {
        [v15 setObject:v7 forKey:v9];
      }
      else {
        [v15 removeObjectForKey:v9];
      }
      id v62 = v7;
      int v24 = objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults", v59);
      id v61 = v15;
      [v24 setValue:v15 forKey:@"SBEnvironmentsToLastKnownTokens"];

      id v25 = (void *)*MEMORY[0x263F1E060];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
      {
        bundleIdentifierToRegistration = self->_bundleIdentifierToRegistration;
        os_log_t v27 = v25;
        uint64_t v28 = [(NSMutableDictionary *)bundleIdentifierToRegistration count];
        *(_DWORD *)buf = 134349056;
        uint64_t v76 = v28;
        _os_log_impl(&dword_2608DB000, v27, OS_LOG_TYPE_DEFAULT, "Flush per-app tokens for %{public}lu apps", buf, 0xCu);
      }
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v29 = [(NSMutableDictionary *)self->_bundleIdentifierToRegistration allKeys];
      uint64_t v30 = [v29 countByEnumeratingWithState:&v69 objects:v74 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v70;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v70 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void *)(*((void *)&v69 + 1) + 8 * i);
            os_log_t v35 = [(NSMutableDictionary *)self->_bundleIdentifierToRegistration objectForKey:v34];
            v36 = [v35 environment];
            int v37 = [v36 isEqualToString:v64];

            if (v37)
            {
              uint64_t v38 = [v35 environment];
              v39 = [v35 tokenIdentifier];
              uint64_t v40 = +[UNCPushRegistration pushRegistrationWithEnvironment:v38 tokenIdentifier:v39 token:0];

              [(UNCRemoteNotificationServer *)self _queue_setPushRegistration:v40 forBundleIdentifier:v34];
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v69 objects:v74 count:16];
        }
        while (v31);
      }

      v41 = (void *)*MEMORY[0x263F1E060];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
      {
        runningBundleIdentifiers = self->_runningBundleIdentifiers;
        uint64_t v43 = v41;
        uint64_t v44 = [(NSMutableSet *)runningBundleIdentifiers count];
        *(_DWORD *)buf = 134217984;
        uint64_t v76 = v44;
        _os_log_impl(&dword_2608DB000, v43, OS_LOG_TYPE_DEFAULT, "Request per-app tokens for %lu running apps", buf, 0xCu);
      }
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v45 = [(NSMutableSet *)self->_runningBundleIdentifiers allObjects];
      uint64_t v46 = [v45 countByEnumeratingWithState:&v65 objects:v73 count:16];
      id v6 = v63;
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v66;
        do
        {
          for (uint64_t j = 0; j != v47; ++j)
          {
            if (*(void *)v66 != v48) {
              objc_enumerationMutation(v45);
            }
            uint64_t v50 = *(void *)(*((void *)&v65 + 1) + 8 * j);
            id v51 = [(NSMutableDictionary *)self->_bundleIdentifierToRegistration objectForKey:v50];
            objc_super v52 = v51;
            if (v51)
            {
              v53 = [v51 environment];
              int v54 = [v53 isEqual:v64];

              if (v54)
              {
                id v55 = (void *)*MEMORY[0x263F1E060];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
                {
                  id v56 = v55;
                  id v57 = [v52 tokenIdentifier];
                  *(_DWORD *)buf = 138543618;
                  uint64_t v76 = v50;
                  __int16 v77 = 2114;
                  uint64_t v78 = (uint64_t)v57;
                  _os_log_impl(&dword_2608DB000, v56, OS_LOG_TYPE_DEFAULT, "Request per-app token with topic %{public}@ identifier %{public}@", buf, 0x16u);
                }
                id v58 = [v52 tokenIdentifier];
                [v63 requestTokenForTopic:v50 identifier:v58];
              }
            }
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v65 objects:v73 count:16];
        }
        while (v47);
      }

      id v15 = v61;
      id v7 = v62;
      id v17 = v60;
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    -[UNCRemoteNotificationServer _queue_connection:didReceivePublicToken:](v10, v7);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__UNCRemoteNotificationServer_connection_didReceiveIncomingMessage___block_invoke;
  v8[3] = &unk_265567628;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __68__UNCRemoteNotificationServer_connection_didReceiveIncomingMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didReceiveIncomingMessage:", *(void *)(a1 + 40));
}

- (void)_queue_didReceiveIncomingMessage:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = _os_activity_create(&dword_2608DB000, "PushNotification", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__UNCRemoteNotificationServer__queue_didReceiveIncomingMessage___block_invoke;
  v7[3] = &unk_265567628;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

void __64__UNCRemoteNotificationServer__queue_didReceiveIncomingMessage___block_invoke(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(*(id *)(a1 + 32), "unc_bundleIdentifier");
  objc_super v3 = (os_log_t *)MEMORY[0x263F1E060];
  id v4 = (void *)*MEMORY[0x263F1E060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = [v5 topic];
    uint64_t v8 = [*(id *)(a1 + 32) priority];
    *(_DWORD *)buf = 138543618;
    v53 = v7;
    __int16 v54 = 2048;
    uint64_t v55 = v8;
    _os_log_impl(&dword_2608DB000, v6, OS_LOG_TYPE_DEFAULT, "Received incoming message on topic %{public}@ at priority %ld", buf, 0x16u);
  }
  int v9 = objc_msgSend(*(id *)(a1 + 40), "_queue_canDeliverMessageToBundle:", v2);
  int v10 = objc_msgSend(*(id *)(a1 + 40), "_queue_messageIsValidForDelivery:", *(void *)(a1 + 32));
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    id v12 = (void *)MEMORY[0x263F1DF48];
    id v13 = [*(id *)(a1 + 32) correlationIdentifier];
    id v14 = [*(id *)(a1 + 32) userInfo];
    id v15 = [v12 requestWithIdentifier:v13 pushPayload:v14 bundleIdentifier:v2];

    if (!v15)
    {
      os_log_t v40 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v41 = *(void **)(a1 + 32);
        v42 = v40;
        uint64_t v43 = [v41 topic];
        *(_DWORD *)buf = 138543362;
        v53 = v43;
        _os_log_impl(&dword_2608DB000, v42, OS_LOG_TYPE_DEFAULT, "Received invalid remote notification request on topic %{public}@", buf, 0xCu);
      }
      goto LABEL_24;
    }
    char log = [*(id *)(a1 + 32) pushFlags];
    uint64_t v16 = [v15 content];
    int v51 = objc_msgSend(v16, "unc_willAlertUser");

    id v17 = [v15 trigger];
    dispatch_queue_t v18 = [v15 content];
    uint64_t v19 = [v18 badge];

    uint64_t v20 = [v15 content];
    uint64_t v21 = [v20 sound];

    int v46 = [v17 isContentAvailable];
    int v22 = [v17 isMutableContent];
    unsigned int v50 = objc_msgSend(*(id *)(a1 + 40), "_queue_enforcePushTypeForMessage:", *(void *)(a1 + 32));
    uint64_t v49 = [*(id *)(a1 + 32) pushType];
    int v23 = objc_msgSend(*(id *)(a1 + 40), "_queue_allowServiceExtensionFilteringForMessage:", *(void *)(a1 + 32));
    os_log_t v24 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v44 = v19 != 0;
      BOOL v45 = v21 != 0;
      id v25 = v17;
      int v26 = log & 1;
      loga = v24;
      os_log_t v27 = [v15 identifier];
      uint64_t v28 = objc_msgSend(v27, "un_logDigest");
      long long v29 = objc_msgSend(*(id *)(a1 + 32), "unc_pushTypeDescription");
      *(_DWORD *)buf = 138545410;
      v53 = v2;
      __int16 v54 = 2114;
      uint64_t v55 = (uint64_t)v28;
      __int16 v56 = 1024;
      int v57 = v26;
      id v17 = v25;
      __int16 v58 = 1024;
      int v59 = v51;
      __int16 v60 = 1024;
      BOOL v61 = v45;
      __int16 v62 = 1024;
      BOOL v63 = v44;
      __int16 v64 = 1024;
      int v65 = v46;
      __int16 v66 = 1024;
      int v67 = v22;
      __int16 v68 = 2114;
      long long v69 = v29;
      _os_log_impl(&dword_2608DB000, loga, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received remote notification request %{public}@ [ waking: %d, hasAlertContent: %d, hasSound: %d hasBadge: %d hasContentAvailable: %d hasMutableContent: %d pushType: %{public}@]", buf, 0x44u);

      objc_super v3 = (os_log_t *)MEMORY[0x263F1E060];
    }
    uint64_t v30 = v50;
    if (v49 == 8) {
      char v31 = 0;
    }
    else {
      char v31 = v50;
    }
    uint64_t v32 = *(void **)(a1 + 40);
    if ((v51 | v23) & v22) != 1 || (v31)
    {
      uint64_t v39 = *(void *)(a1 + 32);
    }
    else
    {
      int v33 = objc_msgSend(v32, "_queue_isVisibleUserNotificationEnabledForApplication:", v2);
      int v34 = v33 | v23 & objc_msgSend(*(id *)(a1 + 40), "_queue_isUserNotificationEnabledForApplication:", v2);
      os_log_t v35 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v36 = v35;
        int v37 = [v15 identifier];
        uint64_t v38 = objc_msgSend(v37, "un_logDigest");
        *(_DWORD *)buf = 138543874;
        v53 = v2;
        __int16 v54 = 2114;
        uint64_t v55 = (uint64_t)v38;
        __int16 v56 = 1024;
        int v57 = v34;
        _os_log_impl(&dword_2608DB000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remote notification request %{public}@ can be modified: %d", buf, 0x1Cu);

        uint64_t v30 = v50;
      }
      uint64_t v39 = *(void *)(a1 + 32);
      uint64_t v32 = *(void **)(a1 + 40);
      if (v34)
      {
        objc_msgSend(v32, "_queue_tryToModifyNotificationRequest:bundleIdentifier:message:enforcePushType:", v15, v2, v39, v30);
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
    }
    objc_msgSend(v32, "_queue_deliverNotificationRequest:bundleIdentifier:message:enforcePushType:", v15, v2, v39, v30);
    goto LABEL_23;
  }
LABEL_25:
}

- (BOOL)_queue_canDeliverMessageToBundle:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableSet *)self->_installedBundleIdentifiers containsObject:v4])
  {
    if ([(NSMutableSet *)self->_restrictedBundleIdentifiers containsObject:v4])
    {
      id v5 = *MEMORY[0x263F1E060];
      BOOL v6 = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543362;
        id v15 = v4;
        id v7 = "[%{public}@] Received incoming message for restricted app";
LABEL_7:
        _os_log_impl(&dword_2608DB000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v14, 0xCu);
        BOOL v6 = 0;
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    uint64_t v8 = [(NSMutableDictionary *)self->_bundleIdentifierToRegistration objectForKey:v4];
    if (v8)
    {
      if ([(UNCRemoteNotificationServer *)self _queue_isPushEnabledForApplication:v4])
      {
        BOOL v6 = 1;
LABEL_16:

        goto LABEL_17;
      }
      int v10 = (void *)*MEMORY[0x263F1E060];
      BOOL v6 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      contentAvailableBundleIdentifiers = self->_contentAvailableBundleIdentifiers;
      id v12 = v10;
      int v14 = 138544130;
      id v15 = v4;
      __int16 v16 = 1024;
      int v17 = [(NSMutableSet *)contentAvailableBundleIdentifiers containsObject:v4];
      __int16 v18 = 1024;
      BOOL v19 = [(UNCRemoteNotificationServer *)self _queue_isBackgroundAppRefreshAllowedForBundleIdentifier:v4];
      __int16 v20 = 1024;
      BOOL v21 = [(UNCRemoteNotificationServer *)self _queue_isUserNotificationEnabledForApplication:v4];
      _os_log_impl(&dword_2608DB000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received incoming message for push disabled app [ supportsContentAvailableRemoteNotification: %{BOOL}d; backgroundRefreshEnabled: %{BOOL}d; allowsUserNotifications: %{BOOL}d ]",
        (uint8_t *)&v14,
        0x1Eu);
    }
    else
    {
      int v9 = *MEMORY[0x263F1E060];
      BOOL v6 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      int v14 = 138543362;
      id v15 = v4;
      _os_log_impl(&dword_2608DB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received incoming message for unregistered app", (uint8_t *)&v14, 0xCu);
    }
    BOOL v6 = 0;
    goto LABEL_16;
  }
  id v5 = *MEMORY[0x263F1E060];
  BOOL v6 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = v4;
    id v7 = "[%{public}@] Received incoming message for uninstalled app";
    goto LABEL_7;
  }
LABEL_17:

  return v6;
}

- (BOOL)_queue_enforcePushTypeForMessage:(id)a3
{
  platforuint64_t m = self->_platform;
  id v4 = a3;
  BOOL v5 = [(BSPlatform *)platform deviceClass] == 4;
  uint64_t v6 = [v4 pushType];

  if (v6 == 8 || v6 == 4) {
    return 1;
  }
  return v5;
}

- (BOOL)_queue_messageIsValidForDelivery:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 pushType];
  if ([(BSPlatform *)self->_platform deviceClass] == 4)
  {
    BOOL v6 = 1;
    if (v5 != 4 && v5 != 8)
    {
      id v7 = (void *)*MEMORY[0x263F1E060];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_ERROR)) {
        -[UNCRemoteNotificationServer _queue_messageIsValidForDelivery:](v7, v4);
      }
LABEL_11:
      BOOL v6 = 0;
    }
  }
  else
  {
    if (v5 > 8 || ((1 << v5) & 0x111) == 0)
    {
      uint64_t v8 = (void *)*MEMORY[0x263F1E060];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_ERROR)) {
        -[UNCRemoteNotificationServer _queue_messageIsValidForDelivery:](v8, v4);
      }
      goto LABEL_11;
    }
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)_queue_allowServiceExtensionFilteringForMessage:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_msgSend(v4, "unc_bundleIdentifier");
  if (![(NSMutableSet *)self->_quietServiceExtensionBundleIdentifiers containsObject:v5])
  {
LABEL_6:
    BOOL v6 = 0;
    goto LABEL_7;
  }
  if ([v4 pushType] != 8)
  {
    id v7 = (void *)*MEMORY[0x263F1E060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_ERROR)) {
      [(UNCRemoteNotificationServer *)(uint64_t)v5 _queue_allowServiceExtensionFilteringForMessage:v4];
    }
    goto LABEL_6;
  }
  BOOL v6 = 1;
LABEL_7:

  return v6;
}

- (void)_queue_tryToModifyNotificationRequest:(id)a3 bundleIdentifier:(id)a4 message:(id)a5 enforcePushType:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  serviceExtensionManager = self->_serviceExtensionManager;
  id v25 = 0;
  int v14 = [(UNCNotificationServiceExtensionManager *)serviceExtensionManager extensionForBundleIdentifier:v11 error:&v25];
  id v15 = v25;
  if (v14)
  {
    __int16 v16 = [v14 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __110__UNCRemoteNotificationServer__queue_tryToModifyNotificationRequest_bundleIdentifier_message_enforcePushType___block_invoke;
    block[3] = &unk_2655678C8;
    block[4] = self;
    id v20 = v10;
    id v21 = v11;
    id v22 = v12;
    id v23 = v14;
    BOOL v24 = v6;
    dispatch_async(v16, block);
  }
  else
  {
    int v17 = *MEMORY[0x263F1E060];
    __int16 v18 = *MEMORY[0x263F1E060];
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[UNCRemoteNotificationServer _queue_tryToModifyNotificationRequest:bundleIdentifier:message:enforcePushType:]();
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v11;
      _os_log_impl(&dword_2608DB000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notification request was marked as mutable but no service extension is available", buf, 0xCu);
    }
    [(UNCRemoteNotificationServer *)self _queue_deliverNotificationRequest:v10 bundleIdentifier:v11 message:v12 enforcePushType:v6];
  }
}

uint64_t __110__UNCRemoteNotificationServer__queue_tryToModifyNotificationRequest_bundleIdentifier_message_enforcePushType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_extensionQueue_modifyNotificationRequest:bundleIdentifier:message:extension:enforcePushType:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(unsigned __int8 *)(a1 + 72));
}

- (void)_extensionQueue_modifyNotificationRequest:(id)a3 bundleIdentifier:(id)a4 message:(id)a5 extension:(id)a6 enforcePushType:(BOOL)a7
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  __int16 v16 = [v15 queue];
  dispatch_assert_queue_V2(v16);

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  int v17 = _os_activity_create(&dword_2608DB000, "PushNotificationModification", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v17, &state);
  __int16 v80 = self;
  __int16 v77 = v14;
  BOOL v18 = [(UNCRemoteNotificationServer *)self _queue_allowServiceExtensionFilteringForMessage:v14];
  id v19 = v12;
  id v20 = [MEMORY[0x263EFF910] date];
  CFStringRef v21 = [NSString stringWithFormat:@"%@.NSE-runtime", v13];
  IOPMAssertionID AssertionID = 0;
  [v15 serviceTime];
  uint64_t v76 = (__CFString *)v21;
  IOPMAssertionCreateWithDescription(@"NoIdleSleepAssertion", v21, 0, 0, 0, v22 + v22, @"TimeoutActionRelease", &AssertionID);
  id v89 = 0;
  id v23 = [v15 mutateContentForNotificationRequest:v19 error:&v89];
  id v79 = v89;
  if (AssertionID) {
    IOPMAssertionRelease(AssertionID);
  }
  BOOL v24 = [MEMORY[0x263EFF910] date];
  [v24 timeIntervalSinceReferenceDate];
  double v26 = v25;
  [v20 timeIntervalSinceReferenceDate];
  double v28 = v26 - v27;
  uint64_t v78 = v23;
  if (v23)
  {
    if (objc_msgSend(v23, "unc_willAlertUser"))
    {
      long long v72 = v17;
      long long v29 = (void *)MEMORY[0x263F1DF48];
      uint64_t v30 = [v19 identifier];
      uint64_t v31 = [v19 trigger];
      uint64_t v32 = v23;
      int v33 = (void *)v31;
      int v34 = [v29 requestWithIdentifier:v30 content:v32 trigger:v31];

      attachmentsService = v80->_attachmentsService;
      v36 = [v15 proxy];
      int v37 = [(UNCAttachmentsService *)attachmentsService resolveAttachmentsSkippingErrorsForRequest:v34 bundleIdentifier:v13 fromBundleProxyForServiceExtension:v36];

      uint64_t v38 = [v37 content];
      uint64_t v39 = [v38 attachments];
      uint64_t v40 = [v39 count];

      v41 = (void *)*MEMORY[0x263F1E060];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
      {
        v42 = v41;
        uint64_t v43 = [v19 identifier];
        objc_msgSend(v43, "un_logDigest");
        BOOL v44 = v73 = a7;
        *(_DWORD *)buf = 138544130;
        id v93 = v13;
        __int16 v94 = 2114;
        v95 = v44;
        __int16 v96 = 2048;
        double v97 = *(double *)&v40;
        __int16 v98 = 2048;
        double v99 = v28;
        _os_log_impl(&dword_2608DB000, v42, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will deliver mutated notification content; notificationRequest=%{public}@, attachmentCount=%lu, runtime: %f",
          buf,
          0x2Au);

        a7 = v73;
      }
      int v17 = v72;
      goto LABEL_19;
    }
    if (v18)
    {
      v53 = (void *)MEMORY[0x263F1DF48];
      __int16 v54 = [v19 identifier];
      uint64_t v55 = [v19 trigger];
      int v37 = [v53 requestWithIdentifier:v54 content:v78 trigger:v55];

      __int16 v56 = (void *)*MEMORY[0x263F1E060];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
      {
        int v57 = v56;
        __int16 v58 = [v19 identifier];
        objc_msgSend(v58, "un_logDigest");
        int v59 = v75 = a7;
        *(_DWORD *)buf = 138544130;
        id v93 = v13;
        __int16 v94 = 2114;
        v95 = v59;
        __int16 v96 = 2114;
        double v97 = *(double *)&v79;
        __int16 v98 = 2048;
        double v99 = v28;
        _os_log_impl(&dword_2608DB000, v57, OS_LOG_TYPE_DEFAULT, "[%{public}@] Mutated notification request will not visibly alert the user, will supress original content; noti"
          "ficationRequest=%{public}@, error=%{public}@, runtime: %f",
          buf,
          0x2Au);

        a7 = v75;
      }
      goto LABEL_19;
    }
    __int16 v64 = (void *)*MEMORY[0x263F1E060];
    int v37 = v19;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    BOOL v61 = v64;
    __int16 v62 = [v19 identifier];
    BOOL v63 = objc_msgSend(v62, "un_logDigest");
    *(_DWORD *)buf = 138543874;
    id v93 = v13;
    __int16 v94 = 2114;
    v95 = v63;
    __int16 v96 = 2048;
    double v97 = v28;
    _os_log_error_impl(&dword_2608DB000, v61, OS_LOG_TYPE_ERROR, "[%{public}@] Mutated notification request will not visibly alert the user, will deliver original content; notifica"
      "tionRequest=%{public}@, runtime: %f",
      buf,
      0x20u);
LABEL_17:

    int v37 = v19;
    goto LABEL_19;
  }
  if (!v18)
  {
    __int16 v60 = (void *)*MEMORY[0x263F1E060];
    int v37 = v19;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    BOOL v61 = v60;
    __int16 v62 = [v19 identifier];
    BOOL v63 = objc_msgSend(v62, "un_logDigest");
    *(_DWORD *)buf = 138544130;
    id v93 = v13;
    __int16 v94 = 2114;
    v95 = v63;
    __int16 v96 = 2114;
    double v97 = *(double *)&v79;
    __int16 v98 = 2048;
    double v99 = v28;
    _os_log_impl(&dword_2608DB000, v61, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did not mutate content for notification request, will deliver original content; notificationRequest=%"
      "{public}@, error=%{public}@, runtime: %f",
      buf,
      0x2Au);
    goto LABEL_17;
  }
  BOOL v74 = a7;
  BOOL v45 = (void *)MEMORY[0x263F1DF48];
  int v46 = [v19 identifier];
  id v47 = objc_alloc_init(MEMORY[0x263F1DF38]);
  uint64_t v48 = [v19 trigger];
  int v37 = [v45 requestWithIdentifier:v46 content:v47 trigger:v48];

  uint64_t v49 = (void *)*MEMORY[0x263F1E060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v50 = v49;
    int v51 = [v19 identifier];
    objc_super v52 = objc_msgSend(v51, "un_logDigest");
    *(_DWORD *)buf = 138544130;
    id v93 = v13;
    __int16 v94 = 2114;
    v95 = v52;
    __int16 v96 = 2114;
    double v97 = *(double *)&v79;
    __int16 v98 = 2048;
    double v99 = v28;
    _os_log_impl(&dword_2608DB000, v50, OS_LOG_TYPE_DEFAULT, "[%{public}@] Mutated notification request is nil, will supress original content; notificationRequest=%{public}@, e"
      "rror=%{public}@, runtime: %f",
      buf,
      0x2Au);
  }
  a7 = v74;
LABEL_19:
  os_activity_scope_leave(&state);
  queue = v80->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __124__UNCRemoteNotificationServer__extensionQueue_modifyNotificationRequest_bundleIdentifier_message_extension_enforcePushType___block_invoke;
  block[3] = &unk_2655678F0;
  block[4] = v80;
  id v82 = v37;
  id v83 = v13;
  id v84 = v77;
  BOOL v88 = a7;
  id v85 = v20;
  id v86 = v24;
  id v87 = v15;
  id v66 = v15;
  id v67 = v24;
  id v68 = v20;
  id v69 = v77;
  id v70 = v13;
  id v71 = v37;
  dispatch_async(queue, block);
}

void __124__UNCRemoteNotificationServer__extensionQueue_modifyNotificationRequest_bundleIdentifier_message_extension_enforcePushType___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_deliverNotificationRequest:bundleIdentifier:message:enforcePushType:extensionStart:extensionEnd:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 88), *(void *)(a1 + 64), *(void *)(a1 + 72));
  v2 = [*(id *)(a1 + 80) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __124__UNCRemoteNotificationServer__extensionQueue_modifyNotificationRequest_bundleIdentifier_message_extension_enforcePushType___block_invoke_2;
  block[3] = &unk_265567728;
  id v4 = *(id *)(a1 + 80);
  dispatch_async(v2, block);
}

uint64_t __124__UNCRemoteNotificationServer__extensionQueue_modifyNotificationRequest_bundleIdentifier_message_extension_enforcePushType___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanUp];
}

- (void)_queue_deliverNotificationRequest:(id)a3 bundleIdentifier:(id)a4 message:(id)a5 enforcePushType:(BOOL)a6
{
}

- (void)_queue_deliverNotificationRequest:(id)a3 bundleIdentifier:(id)a4 message:(id)a5 enforcePushType:(BOOL)a6 extensionStart:(id)a7 extensionEnd:(id)a8
{
  BOOL v10 = a6;
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v61 = a7;
  id v60 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v17 = (os_log_t *)MEMORY[0x263F1E060];
  BOOL v18 = (void *)*MEMORY[0x263F1E060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
  {
    id v19 = v18;
    id v20 = [v14 identifier];
    CFStringRef v21 = objc_msgSend(v20, "un_logDigest");
    *(_DWORD *)buf = 138543618;
    id v65 = v15;
    __int16 v66 = 2114;
    id v67 = v21;
    _os_log_impl(&dword_2608DB000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Process delivery of push notification %{public}@", buf, 0x16u);
  }
  uint64_t v58 = [v16 pushType];
  double v22 = [v14 content];
  int v23 = objc_msgSend(v22, "unc_willNotifyUser");

  BOOL v24 = [(UNCRemoteNotificationServer *)self _queue_allowServiceExtensionFilteringForMessage:v16];
  int v59 = [v14 trigger];
  if ([v59 isContentAvailable])
  {
    int v25 = v23 | v24;
    if (v58 != 8) {
      int v25 = 0;
    }
    if (!v10 || v58 == 4 || v25)
    {
      [(UNCRemoteNotificationServer *)self _scheduleContentAvailablePushActivityForMessage:v16 bundleIdentifier:v15];
    }
    else
    {
      if (v58 == 8) {
        int v26 = v23;
      }
      else {
        int v26 = 1;
      }
      if (((v26 | v24) & 1) == 0)
      {
        os_log_t v27 = *v17;
        if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
        {
          double v28 = v27;
          __int16 v62 = [v14 identifier];
          long long v29 = objc_msgSend(v62, "un_logDigest");
          uint64_t v30 = objc_msgSend(v16, "unc_pushTypeDescription");
          *(_DWORD *)buf = 138544130;
          id v65 = v15;
          __int16 v66 = 2114;
          id v67 = v29;
          __int16 v68 = 2114;
          id v69 = v30;
          __int16 v70 = 1024;
          int v71 = 0;
          _os_log_error_impl(&dword_2608DB000, v28, OS_LOG_TYPE_ERROR, "[%{public}@] NOT requesting DUET deliver content-available, non-notifiying push notification %{public}@ [pushType: %{public}@ willNotifyUser: %d]", buf, 0x26u);
        }
      }
    }
  }
  BOOL v31 = v24;
  int v32 = v23;
  int v33 = v16;
  id v34 = v15;
  BOOL v35 = v10;
  BOOL v63 = v14;
  v36 = [v14 content];
  int v37 = [v36 userInfo];
  uint64_t v38 = self;
  BOOL v39 = [(UNCRemoteNotificationServer *)self _requestContainsDisallowedPrivateUserInfo:v37];

  if (!v39)
  {
    char v43 = !v35;
    int v44 = v58 == 8 || !v35;
    int v45 = v44 & v32;
    if ((v44 & v32) == 1)
    {
      v42 = v34;
      [(UNCNotificationRepository *)self->_notificationRepository saveNotificationRequest:v63 shouldRepost:1 withMessage:v33 forBundleIdentifier:v34];
LABEL_36:
      uint64_t v53 = [v33 pushFlags] & 1;
      BOOL v54 = [(UNCRemoteNotificationServer *)self _queue_isVisibleUserNotificationEnabledForApplication:v42];
      v41 = v60;
      uint64_t v40 = v61;
      UNCPowerLogUserNotificationExtendedTriggerEvent(v42, 3u, v53, v61, v60, v45 & v54);
      goto LABEL_37;
    }
    int v46 = v32;
    if (v58 == 8) {
      char v47 = v32;
    }
    else {
      char v47 = 1;
    }
    v42 = v34;
    if ((v47 & 1) != 0 || !v31)
    {
      if (v58 == 4) {
        char v43 = 1;
      }
      if (v43) {
        goto LABEL_36;
      }
      objc_super v52 = (void *)*MEMORY[0x263F1E060];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      uint64_t v49 = v52;
      uint64_t v55 = [v63 identifier];
      objc_msgSend(v55, "un_logDigest");
      v51 = int v56 = v46;
      int v57 = objc_msgSend(v33, "unc_pushTypeDescription");
      *(_DWORD *)buf = 138544130;
      id v65 = v34;
      __int16 v66 = 2114;
      id v67 = v51;
      __int16 v68 = 2114;
      id v69 = v57;
      __int16 v70 = 1024;
      int v71 = v56;
      self = v38;
      _os_log_error_impl(&dword_2608DB000, v49, OS_LOG_TYPE_ERROR, "[%{public}@] NOT delivering non-notifying push notification %{public}@ [pushType: %{public}@ willNotifyUser: %d]", buf, 0x26u);
    }
    else
    {
      uint64_t v48 = (void *)*MEMORY[0x263F1E060];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      uint64_t v49 = v48;
      unsigned int v50 = [v63 identifier];
      int v51 = objc_msgSend(v50, "un_logDigest");
      *(_DWORD *)buf = 138543618;
      id v65 = v34;
      __int16 v66 = 2114;
      id v67 = v51;
      _os_log_impl(&dword_2608DB000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] NOT delivering filtered push notification %{public}@", buf, 0x16u);
    }
    goto LABEL_36;
  }
  v41 = v60;
  uint64_t v40 = v61;
  v42 = v34;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_ERROR)) {
    -[UNCRemoteNotificationServer _queue_deliverNotificationRequest:bundleIdentifier:message:enforcePushType:extensionStart:extensionEnd:]();
  }
LABEL_37:
}

- (BOOL)_requestContainsDisallowedPrivateUserInfo:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    id v4 = [v3 allKeys];
    char v5 = [v4 containsObject:@"com.apple.private.untool.override"];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_scheduleContentAvailablePushActivityForMessage:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F1E060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = v7;
    _os_log_impl(&dword_2608DB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request DUET delivers content-available push notification to application", (uint8_t *)&v14, 0xCu);
  }
  BOOL v9 = [v6 priority] > 9;
  BOOL v10 = (void *)MEMORY[0x263F3AFC8];
  id v11 = [v6 topic];
  id v12 = [v6 userInfo];
  id v13 = [v10 launchForRemoteNotificationWithTopic:v11 withPayload:v12 highPriority:v9];

  [(_DASActivityScheduler *)self->_duetActivityScheduler submitActivity:v13];
}

- (void)notificationSourcesDidInstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__UNCRemoteNotificationServer_notificationSourcesDidInstall___block_invoke;
  v7[3] = &unk_265567628;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __61__UNCRemoteNotificationServer_notificationSourcesDidInstall___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "bundleIdentifier", (void)v18);
        [*(id *)(*(void *)(a1 + 40) + 112) addObject:v8];
        int v9 = [v7 isRestricted];
        BOOL v10 = *(void **)(*(void *)(a1 + 40) + 120);
        if (v9) {
          [v10 addObject:v8];
        }
        else {
          [v10 removeObject:v8];
        }
        int v11 = [v7 usesCloudKit];
        id v12 = *(void **)(*(void *)(a1 + 40) + 80);
        if (v11) {
          [v12 addObject:v8];
        }
        else {
          [v12 removeObject:v8];
        }
        int v13 = [v7 supportsContentAvailableRemoteNotifications];
        int v14 = *(void **)(*(void *)(a1 + 40) + 88);
        if (v13) {
          [v14 addObject:v8];
        }
        else {
          [v14 removeObject:v8];
        }
        int v15 = [v7 allowServiceExtensionFiltering];
        uint64_t v16 = *(void **)(*(void *)(a1 + 40) + 96);
        if (v15) {
          [v16 addObject:v8];
        }
        else {
          [v16 removeObject:v8];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_queue_calculateTopics");
}

- (void)notificationSourcesDidUninstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__UNCRemoteNotificationServer_notificationSourcesDidUninstall___block_invoke;
  v7[3] = &unk_265567628;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __63__UNCRemoteNotificationServer_notificationSourcesDidUninstall___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "bundleIdentifier", (void)v9);
        [*(id *)(*(void *)(a1 + 40) + 80) removeObject:v7];
        [*(id *)(*(void *)(a1 + 40) + 88) removeObject:v7];
        [*(id *)(*(void *)(a1 + 40) + 96) removeObject:v7];
        [*(id *)(*(void *)(a1 + 40) + 112) removeObject:v7];
        [*(id *)(*(void *)(a1 + 40) + 120) removeObject:v7];
        [*(id *)(*(void *)(a1 + 40) + 136) removeObject:v7];
        objc_msgSend(*(id *)(a1 + 40), "_queue_invalidateTokenForBundleIdentifier:", v7);
        objc_msgSend(*(id *)(a1 + 40), "_queue_removeRegistrationForBundleIdentifier:", v7);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_queue_calculateTopics");
}

- (void)_queue_reloadRegistrations
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(UNCPushRegistrationRepository *)self->_pushRegistrationRepository allBundleIdentifiers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        long long v10 = (void *)MEMORY[0x261221EF0](v5);
        long long v11 = -[UNCPushRegistrationRepository registrationForBundleIdentifier:](self->_pushRegistrationRepository, "registrationForBundleIdentifier:", v9, (void)v13);
        if (v11) {
          [(NSMutableDictionary *)v3 setObject:v11 forKey:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }

  bundleIdentifierToRegistration = self->_bundleIdentifierToRegistration;
  self->_bundleIdentifierToRegistration = v3;
}

- (void)_queue_reloadBackgroundAppRefreshDisabledList
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9C0] set];
  id v4 = (void *)CFPreferencesCopyAppValue(@"KeepAppsUpToDateAppList", @"com.apple.mt");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = [v4 objectForKey:v10];
        char v12 = [v11 BOOLValue];

        if ((v12 & 1) == 0) {
          [(NSSet *)v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  backgroundAppRefreshDisabledList = self->_backgroundAppRefreshDisabledList;
  self->_backgroundAppRefreshDisabledList = v3;
}

- (void)_queue_backgroundRefreshApplicationsDidChange
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[(NSSet *)self->_backgroundAppRefreshDisabledList copy];
  [(UNCRemoteNotificationServer *)self _queue_reloadBackgroundAppRefreshDisabledList];
  id v4 = (void *)[(NSSet *)self->_backgroundAppRefreshDisabledList copy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_bundleIdentifierToRegistration allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v17;
    uint64_t v10 = (os_log_t *)MEMORY[0x263F1E060];
    *(void *)&long long v7 = 138543362;
    long long v15 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        int v13 = objc_msgSend(v3, "containsObject:", v12, v15);
        if (v13 != [v4 containsObject:v12])
        {
          long long v14 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            uint64_t v21 = v12;
            _os_log_impl(&dword_2608DB000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Calcualate push topics because backgound refresh was changed", buf, 0xCu);
          }
          [(UNCRemoteNotificationServer *)self _queue_calculateTopics];
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v8);
  }
}

- (BOOL)_canMoveTopic:(id)a3 fromList:(unint64_t)a4 toList:(unint64_t)a5 connection:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  long long v11 = [(UNCRemoteNotificationServer *)self _topicsForList:a4 connection:v10];
  uint64_t v12 = [(UNCRemoteNotificationServer *)self _topicsForList:a5 connection:v10];

  LOBYTE(a4) = 0;
  if (v11 && v12)
  {
    if ([v11 containsObject:v9]) {
      LODWORD(a4) = [v12 containsObject:v9] ^ 1;
    }
    else {
      LOBYTE(a4) = 0;
    }
  }

  return a4;
}

- (id)_topicsForList:(unint64_t)a3 connection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  switch(a3)
  {
    case 0uLL:
      uint64_t v7 = [v5 enabledTopics];
      goto LABEL_7;
    case 1uLL:
      uint64_t v7 = [v5 opportunisticTopics];
      goto LABEL_7;
    case 2uLL:
      uint64_t v7 = [v5 ignoredTopics];
      goto LABEL_7;
    case 3uLL:
      uint64_t v7 = [v5 nonWakingTopics];
LABEL_7:
      uint64_t v8 = (void *)v7;
      break;
    default:
      uint64_t v8 = 0;
      break;
  }

  return v8;
}

- (void)_queue_applicationDidBecomeBackground:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSMutableSet *)self->_foregroundBundleIdentifiers removeObject:v4];
  id v5 = [(NSMutableDictionary *)self->_bundleIdentifierToRegistration objectForKey:v4];

  if (v5)
  {
    if ([(UNCRemoteNotificationServer *)self _queue_shouldBoostTopicToEnabled:v4])
    {
      uint64_t v6 = *MEMORY[0x263F1E060];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        id v10 = v4;
        uint64_t v7 = "[%{public}@] Leaving topic enabled for application becoming background";
LABEL_7:
        _os_log_impl(&dword_2608DB000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      if ([(UNCRemoteNotificationServer *)self _queue_isUserNotificationEnabledForApplication:v4])
      {
        uint64_t v8 = 1;
      }
      else
      {
        uint64_t v8 = 3;
      }
      [(UNCRemoteNotificationServer *)self _queue_moveTopicsForApplication:v4 fromList:0 toList:v8];
    }
  }
  else
  {
    uint64_t v6 = *MEMORY[0x263F1E060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v4;
      uint64_t v7 = "[%{public}@] Ignore becoming background for application without push registration";
      goto LABEL_7;
    }
  }
}

- (void)_queue_applicationDidTerminate:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(NSMutableSet *)self->_runningBundleIdentifiers removeObject:v5];
}

- (BOOL)_queue_isBackgroundAppRefreshAllowedForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)CFPreferencesCopyAppValue(@"KeepAppsUpToDateAppList", @"com.apple.mt");
  id v5 = [v4 objectForKey:v3];

  if ([v5 BOOLValue]) {
    char v6 = [v5 BOOLValue];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)_queue_isPushEnabledForApplication:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_bundleIdentifierToRegistration objectForKey:v4];
  BOOL v6 = v5
    && ([(NSMutableSet *)self->_contentAvailableBundleIdentifiers containsObject:v4]
     && [(UNCRemoteNotificationServer *)self _queue_isBackgroundAppRefreshAllowedForBundleIdentifier:v4]|| [(UNCRemoteNotificationServer *)self _queue_isUserNotificationEnabledForApplication:v4]);

  return v6;
}

- (BOOL)_queue_shouldBoostTopicToEnabled:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v5 = [(NSMutableSet *)self->_userNotificationEnabledBundleIdentifiers containsObject:v4]&& ([(NSMutableSet *)self->_quietServiceExtensionBundleIdentifiers containsObject:v4] & 1) == 0&& [(UNCBlueListMonitor *)self->_blueListMonitor shouldBoostOpportunisticTopicsToEnabled];

  return v5;
}

- (void)_queue_didChangeNotificationSettings:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 hasEnabledSettings];
  int v9 = v8 ^ [(NSMutableSet *)self->_userNotificationEnabledBundleIdentifiers containsObject:v7];
  id v10 = (os_log_t *)MEMORY[0x263F1E060];
  if (v9 == 1)
  {
    uint64_t v11 = *MEMORY[0x263F1E060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543618;
      id v19 = v7;
      __int16 v20 = 1024;
      int v21 = v8;
      _os_log_impl(&dword_2608DB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Update enabled user notifications for remote notifications: %{BOOL}d", (uint8_t *)&v18, 0x12u);
    }
    uint64_t v12 = *v10;
    BOOL v13 = os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v13)
      {
        int v18 = 138543362;
        id v19 = v7;
        _os_log_impl(&dword_2608DB000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Enable user notifications for remote notifications", (uint8_t *)&v18, 0xCu);
      }
      [(NSMutableSet *)self->_userNotificationEnabledBundleIdentifiers addObject:v7];
    }
    else
    {
      if (v13)
      {
        int v18 = 138543362;
        id v19 = v7;
        _os_log_impl(&dword_2608DB000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Disable user notifications for remote notifications", (uint8_t *)&v18, 0xCu);
      }
      [(NSMutableSet *)self->_userNotificationEnabledBundleIdentifiers removeObject:v7];
    }
  }
  int v14 = [v6 hasEnabledAlertSettings];
  if (v14 == [(NSMutableSet *)self->_visibleUserNotificationEnabledBundleIdentifiers containsObject:v7])
  {
    if (!v9) {
      goto LABEL_24;
    }
  }
  else
  {
    long long v15 = *MEMORY[0x263F1E040];
    BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        int v18 = 138543362;
        id v19 = v7;
        _os_log_impl(&dword_2608DB000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Enabled visible user notifications for remote notifications", (uint8_t *)&v18, 0xCu);
      }
      [(NSMutableSet *)self->_visibleUserNotificationEnabledBundleIdentifiers addObject:v7];
    }
    else
    {
      if (v16)
      {
        int v18 = 138543362;
        id v19 = v7;
        _os_log_impl(&dword_2608DB000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Disable visible user notifications for remote notifications", (uint8_t *)&v18, 0xCu);
      }
      [(NSMutableSet *)self->_visibleUserNotificationEnabledBundleIdentifiers removeObject:v7];
    }
  }
  long long v17 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_2608DB000, v17, OS_LOG_TYPE_DEFAULT, "Calcualate topics because user notification settings authorization changed", (uint8_t *)&v18, 2u);
  }
  [(UNCRemoteNotificationServer *)self _queue_calculateTopics];
LABEL_24:
}

- (BOOL)_queue_isVisibleUserNotificationEnabledForApplication:(id)a3
{
  id v3 = self;
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  LOBYTE(v3) = [(NSMutableSet *)v3->_visibleUserNotificationEnabledBundleIdentifiers containsObject:v5];

  return (char)v3;
}

- (id)_portNameForEnvironmentName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F280D0]])
  {
    id v4 = @"com.apple.aps.usernotifications";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F280C8]])
  {
    id v4 = @"com.apple.aps.usernotifications.dev";
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)backgroundRefreshApplicationsDidChange
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__UNCRemoteNotificationServer_backgroundRefreshApplicationsDidChange__block_invoke;
  block[3] = &unk_265567728;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __69__UNCRemoteNotificationServer_backgroundRefreshApplicationsDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_backgroundRefreshApplicationsDidChange");
}

- (void)bluelistStatusChanged
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__UNCRemoteNotificationServer_bluelistStatusChanged__block_invoke;
  block[3] = &unk_265567728;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __52__UNCRemoteNotificationServer_bluelistStatusChanged__block_invoke(uint64_t a1)
{
  id v2 = *MEMORY[0x263F1E060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2608DB000, v2, OS_LOG_TYPE_DEFAULT, "Calculate push topics because bluelist status changed", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_calculateTopics");
}

- (BOOL)allowsRemoteNotificationsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__UNCRemoteNotificationServer_allowsRemoteNotificationsForBundleIdentifier___block_invoke;
  block[3] = &unk_265567700;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __76__UNCRemoteNotificationServer_allowsRemoteNotificationsForBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_isPushEnabledForApplication:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_queue_didCompleteInitialization
{
  self->_initializationCompleted = 1;
  [(UNCRemoteNotificationServer *)self _queue_reloadRegistrations];
  [(UNCRemoteNotificationServer *)self _queue_reloadBackgroundAppRefreshDisabledList];
  [(UNCRemoteNotificationServer *)self _queue_calculateTopics];
  [(UNCBlueListMonitor *)self->_blueListMonitor setDelegate:self];
  id v3 = *MEMORY[0x263F1E060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2608DB000, v3, OS_LOG_TYPE_DEFAULT, "Notify APS that all connections are configured", v4, 2u);
  }
  [MEMORY[0x263F280F0] notifySafeToSendFilter];
}

+ (id)_newPushServiceConnectionWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4 queue:(id)a5
{
  id v7 = (objc_class *)MEMORY[0x263F280F0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[[v7 alloc] initWithEnvironmentName:v10 namedDelegatePort:v9 queue:v8];

  return v11;
}

- (UNCRemoteNotificationServerObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
  self->_observer = (UNCRemoteNotificationServerObserver *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiersNeedingToken, 0);
  objc_storeStrong((id *)&self->_environmentsToConnections, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierToRegistration, 0);
  objc_storeStrong((id *)&self->_backgroundAppRefreshDisabledList, 0);
  objc_storeStrong((id *)&self->_visibleUserNotificationEnabledBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_userNotificationEnabledBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_runningBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_restrictedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_installedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_foregroundBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_quietServiceExtensionBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_contentAvailableBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_cloudKitBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_apsQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_serviceExtensionManager, 0);
  objc_storeStrong((id *)&self->_blueListMonitor, 0);
  objc_storeStrong((id *)&self->_duetActivityScheduler, 0);
  objc_storeStrong((id *)&self->_pushRegistrationRepository, 0);
  objc_storeStrong((id *)&self->_attachmentsService, 0);

  objc_storeStrong((id *)&self->_notificationRepository, 0);
}

- (void)_queue_connection:didReceiveToken:forTopic:identifier:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2608DB000, v0, v1, "Received invalid per-app token for topic %{public}@", v2);
}

- (void)_queue_connection:(void *)a1 didReceiveToken:(void *)a2 forTopic:identifier:.cold.2(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  [a2 length];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2608DB000, v3, v4, "Received per-app token [%{public}lu] for invalid topic", v5);
}

- (void)_queue_connection:(void *)a1 didReceivePublicToken:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  [a2 length];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2608DB000, v3, v4, "Received new public token [%{public}lu] for unknown connection ", v5);
}

- (void)_queue_messageIsValidForDelivery:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "unc_pushTypeDescription");
  id v5 = [a2 topic];
  int v7 = 138543618;
  id v8 = v4;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2608DB000, v3, v6, "Received invalid remote notification push type %{public}@ on topic %{public}@", (uint8_t *)&v7);
}

- (void)_queue_messageIsValidForDelivery:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "unc_pushTypeDescription");
  id v5 = [a2 topic];
  int v7 = 138543618;
  id v8 = v4;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2608DB000, v3, v6, "Received remote notification for non-UNC push type %{public}@ on topic %{public}@", (uint8_t *)&v7);
}

- (void)_queue_allowServiceExtensionFilteringForMessage:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = objc_msgSend(a3, "unc_pushTypeDescription");
  int v8 = 138543618;
  uint64_t v9 = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2608DB000, v5, v7, "[%{public}@] Notification filtering will not be allowed because the push type '%{public}@' is not 'Alert'", (uint8_t *)&v8);
}

- (void)_queue_tryToModifyNotificationRequest:bundleIdentifier:message:enforcePushType:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_3(&dword_2608DB000, v1, (uint64_t)v1, "[%{public}@] Error was encountered trying to find service extension: error=%{public}@", v2);
}

- (void)_queue_deliverNotificationRequest:bundleIdentifier:message:enforcePushType:extensionStart:extensionEnd:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2608DB000, v0, v1, "[%{public}@] NOT delivering push notification contains Apple private user info!", v2);
}

- (void)_queue_didChangeProcessState:(os_log_t)log forBundleIdentifier:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2608DB000, log, OS_LOG_TYPE_ERROR, "Ignore application state change for process without bundle identifier", v1, 2u);
}

@end