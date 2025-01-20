@interface RPHomeKitManager
- (BOOL)invalidateCalled;
- (BOOL)personalRequestsStateForAccessory:(id)a3;
- (HMHome)currentHome;
- (HMHomeManager)homeManager;
- (HMUser)currentUser;
- (NSArray)homeKitCurrentUserIDs;
- (OS_dispatch_queue)dispatchQueue;
- (RPHomeKitManager)initWithQueue:(id)a3;
- (id)filterHomeKitUserIdentifiers:(id)a3;
- (id)homeHubDeviceWithIdentifier:(id)a3;
- (id)homeKitUserIdentifiers;
- (id)mediaGroupsChangedHandler;
- (id)personalRequestsStateChangedHandler;
- (id)roomUpdatedHandler;
- (void)_setupHome;
- (void)getPairingIdentityFromHomeWithAccessory:(id)a3 completionHandler:(id)a4;
- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5;
- (void)invalidate;
- (void)resetHomeKitUserIdentifiers;
- (void)setCurrentHome:(id)a3;
- (void)setCurrentUser:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setHomeKitCurrentUserIDs:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setInvalidateCalled:(BOOL)a3;
- (void)setMediaGroupsChangedHandler:(id)a3;
- (void)setPersonalRequestsStateChangedHandler:(id)a3;
- (void)setRoomUpdatedHandler:(id)a3;
- (void)user:(id)a3 didUpdateAssistantAccessControl:(id)a4 forHome:(id)a5;
@end

@implementation RPHomeKitManager

- (RPHomeKitManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RPHomeKitManager;
  v6 = [(RPHomeKitManager *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    id v8 = [objc_alloc(off_1001418D0()) initWithOptions:32780 cachePolicy:2];
    v9 = (HMHomeManager *)[objc_alloc(off_1001418D8()) initWithHomeMangerConfiguration:v8];
    homeManager = v7->_homeManager;
    v7->_homeManager = v9;
  }
  return v7;
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    [(HMHomeManager *)self->_homeManager setDelegate:0];
    homeManager = self->_homeManager;
    self->_homeManager = 0;

    [(HMUser *)self->_currentUser setDelegate:0];
    currentUser = self->_currentUser;
    self->_currentUser = 0;

    [(HMHome *)self->_currentHome setDelegate:0];
    currentHome = self->_currentHome;
    self->_currentHome = 0;

    id mediaGroupsChangedHandler = self->_mediaGroupsChangedHandler;
    self->_id mediaGroupsChangedHandler = 0;

    id personalRequestsStateChangedHandler = self->_personalRequestsStateChangedHandler;
    self->_id personalRequestsStateChangedHandler = 0;

    id roomUpdatedHandler = self->_roomUpdatedHandler;
    self->_id roomUpdatedHandler = 0;

    if (dword_100141860 <= 30 && (dword_100141860 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (id)homeKitUserIdentifiers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  homeKitCurrentUserIDs = self->_homeKitCurrentUserIDs;
  if (homeKitCurrentUserIDs)
  {
    v4 = homeKitCurrentUserIDs;
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v21 = self;
    id v5 = [(HMHomeManager *)self->_homeManager homes];
    id v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      id v7 = v6;
      id v8 = 0;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v12 = [v11 currentUser];
          if (v12)
          {
            v13 = (void *)v12;
            v14 = [v11 currentUser];
            v15 = [v14 uniqueIdentifier];

            if (v15)
            {
              if (!v8)
              {
                id v8 = +[NSMutableArray array];
              }
              v16 = [v11 currentUser];
              v17 = [v16 uniqueIdentifier];
              [(NSArray *)v8 addObject:v17];
            }
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v7);
    }
    else
    {
      id v8 = 0;
    }

    v18 = v21->_homeKitCurrentUserIDs;
    v21->_homeKitCurrentUserIDs = v8;
    v19 = v8;

    v4 = v21->_homeKitCurrentUserIDs;
  }

  return v4;
}

- (id)filterHomeKitUserIdentifiers:(id)a3
{
  id v4 = a3;
  v29 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = +[NSMutableArray array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v6 = v4;
  id v30 = [v6 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v30)
  {
    uint64_t v26 = *(void *)v43;
    v27 = v6;
    v28 = v5;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v43 != v26) {
          objc_enumerationMutation(v6);
        }
        uint64_t v31 = v7;
        uint64_t v33 = *(void *)(*((void *)&v42 + 1) + 8 * v7);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id obj = [(HMHomeManager *)v29->_homeManager homes];
        id v8 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v39;
          while (2)
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v39 != v10) {
                objc_enumerationMutation(obj);
              }
              uint64_t v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              v13 = +[NSMutableArray array];
              long long v34 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              v14 = [v12 users];
              id v15 = [v14 countByEnumeratingWithState:&v34 objects:v46 count:16];
              if (v15)
              {
                id v16 = v15;
                uint64_t v17 = *(void *)v35;
                do
                {
                  for (j = 0; j != v16; j = (char *)j + 1)
                  {
                    if (*(void *)v35 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    v19 = [*(id *)(*((void *)&v34 + 1) + 8 * (void)j) uniqueIdentifier];
                    [v13 addObject:v19];
                  }
                  id v16 = [v14 countByEnumeratingWithState:&v34 objects:v46 count:16];
                }
                while (v16);
              }

              v20 = [v12 currentUser];

              if (v20)
              {
                v21 = [v12 currentUser];
                long long v22 = [v21 uniqueIdentifier];
                [v13 addObject:v22];
              }
              unsigned __int8 v23 = [v13 containsObject:v33];

              if (v23)
              {

                id v5 = v28;
                goto LABEL_25;
              }
            }
            id v9 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }

        id v5 = v28;
        [v28 addObject:v33];
LABEL_25:
        uint64_t v7 = v31 + 1;
        id v6 = v27;
      }
      while ((id)(v31 + 1) != v30);
      id v30 = [v27 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v30);
  }

  if ([v5 count])
  {
    id v24 = [v6 mutableCopy];
    [v24 removeObjectsInArray:v5];
  }
  else
  {
    id v24 = v6;
  }

  return v24;
}

- (void)resetHomeKitUserIdentifiers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  homeKitCurrentUserIDs = self->_homeKitCurrentUserIDs;
  self->_homeKitCurrentUserIDs = 0;
}

- (id)homeHubDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  [(RPHomeKitManager *)self _setupHome];
  id v5 = [(RPHomeKitManager *)self currentHome];
  id v6 = [v5 accessoryWithSiriEndpointIdentifier:v4];

  return v6;
}

- (BOOL)personalRequestsStateForAccessory:(id)a3
{
  id v4 = a3;
  [(RPHomeKitManager *)self _setupHome];
  currentUser = self->_currentUser;
  if (currentUser)
  {
    id v6 = [(HMUser *)currentUser assistantAccessControlForHome:self->_currentHome];
    if ([v6 isEnabled])
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v7 = [v6 accessories];
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v15;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v7);
            }
            v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) siriEndpointIdentifier];
            unsigned __int8 v12 = [v11 isEqual:v4];

            if (v12)
            {
              LOBYTE(v8) = 1;
              goto LABEL_15;
            }
          }
          id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return (char)v8;
}

- (void)setCurrentUser:(id)a3
{
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  p_currentUser = &self->_currentUser;
  if (!self->_currentUser) {
    goto LABEL_15;
  }
  id v6 = [v11 uniqueIdentifier];
  uint64_t v7 = [(HMUser *)*p_currentUser uniqueIdentifier];
  unsigned __int8 v8 = [v6 isEqual:v7];

  uint64_t v9 = v11;
  if ((v8 & 1) == 0)
  {
LABEL_15:
    if (dword_100141860 <= 30 && (dword_100141860 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v10 = [v11 uniqueIdentifier];
      LogPrintF();
    }
    if (*p_currentUser) {
      [(HMUser *)*p_currentUser setDelegate:0];
    }
    objc_storeStrong((id *)&self->_currentUser, a3);
    [(HMUser *)self->_currentUser setDelegate:self];
    uint64_t v9 = v11;
  }
}

- (void)setCurrentHome:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = v7;
  if (!self->_currentHome)
  {
    if (dword_100141860 <= 30 && (dword_100141860 != -1 || _LogCategory_Initialize()))
    {
      id v6 = [v7 name];
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_currentHome, a3);
    [(HMHome *)self->_currentHome setDelegate:self];
    id v5 = v7;
  }
}

- (void)_setupHome
{
  if (!self->_currentUser || !self->_currentHome)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v3 = [(HMHomeManager *)self->_homeManager homes];
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          unsigned __int8 v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          uint64_t v9 = [v8 currentUser];

          if (v9)
          {
            [(RPHomeKitManager *)self setCurrentHome:v8];
            uint64_t v10 = [v8 currentUser];
            [(RPHomeKitManager *)self setCurrentUser:v10];

            goto LABEL_13;
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

- (void)getPairingIdentityFromHomeWithAccessory:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  homeManager = self->_homeManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005A668;
  v9[3] = &unk_100122DB8;
  id v10 = v6;
  id v8 = v6;
  [(HMHomeManager *)homeManager currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier:a3 completionHandler:v9];
}

- (void)user:(id)a3 didUpdateAssistantAccessControl:(id)a4 forHome:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005A89C;
  block[3] = &unk_100121770;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v8 siriEndpointProfile];

  if (v9)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005AA5C;
    block[3] = &unk_100121770;
    block[4] = self;
    id v12 = v7;
    id v13 = v8;
    dispatch_async(dispatchQueue, block);
  }
}

- (HMUser)currentUser
{
  return self->_currentUser;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)mediaGroupsChangedHandler
{
  return self->_mediaGroupsChangedHandler;
}

- (void)setMediaGroupsChangedHandler:(id)a3
{
}

- (id)personalRequestsStateChangedHandler
{
  return self->_personalRequestsStateChangedHandler;
}

- (void)setPersonalRequestsStateChangedHandler:(id)a3
{
}

- (id)roomUpdatedHandler
{
  return self->_roomUpdatedHandler;
}

- (void)setRoomUpdatedHandler:(id)a3
{
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (HMHome)currentHome
{
  return self->_currentHome;
}

- (NSArray)homeKitCurrentUserIDs
{
  return self->_homeKitCurrentUserIDs;
}

- (void)setHomeKitCurrentUserIDs:(id)a3
{
}

- (BOOL)invalidateCalled
{
  return self->_invalidateCalled;
}

- (void)setInvalidateCalled:(BOOL)a3
{
  self->_invalidateCalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitCurrentUserIDs, 0);
  objc_storeStrong((id *)&self->_currentHome, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong(&self->_roomUpdatedHandler, 0);
  objc_storeStrong(&self->_personalRequestsStateChangedHandler, 0);
  objc_storeStrong(&self->_mediaGroupsChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_currentUser, 0);
}

@end