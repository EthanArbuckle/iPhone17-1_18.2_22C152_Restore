@interface SDActivityController
- (BOOL)restart;
- (BOOL)shouldStart;
- (IDSService)activityService;
- (NSArray)allPeerBTIdentifiers;
- (NSString)appleID;
- (SDActivityController)init;
- (id)idsDeviceFromBTIdentifier:(id)a3;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setActivityService:(id)a3;
- (void)setAllPeerBTIdentifiers:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setShouldStart:(BOOL)a3;
@end

@implementation SDActivityController

- (SDActivityController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDActivityController;
  v2 = [(SDXPCDaemon *)&v6 init];
  if (v2)
  {
    v3 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.continuity.activity"];
    activityService = v2->_activityService;
    v2->_activityService = v3;

    [(IDSService *)v2->_activityService addDelegate:v2 queue:&_dispatch_main_q];
  }
  return v2;
}

- (BOOL)restart
{
  return 0;
}

- (id)idsDeviceFromBTIdentifier:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(IDSService *)self->_activityService devices];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 nsuuid];
        v11 = [v10 UUIDString];
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)appleID
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(SDActivityController *)self activityService];
  v3 = [v2 accounts];

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v8 = [v7 loginID];

        if (v8)
        {
          id v4 = [v7 loginID];
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (NSString *)v4;
}

- (BOOL)shouldStart
{
  v3 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v4 = [v3 isActivityContinuationAllowed];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = handoff_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Handoff is disabled in settings on this device", buf, 2u);
    }
    BOOL v8 = 0;
    goto LABEL_27;
  }
  uint64_t v5 = +[SDStatusMonitor sharedMonitor];
  if (([v5 deviceWasUnlockedOnce] & 1) != 0
    || ([v5 deviceUIUnlocked] & 1) != 0)
  {
    if ([v5 alwaysSendPayload])
    {
      id v6 = handoff_log();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      uint64_t v7 = "Real Handoff is disabled since alwaysSendPayload is enabled";
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v6 = [(IDSService *)self->_activityService devices];
      id v9 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v17;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v6);
            }
            long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if ([v13 supportsHandoff])
            {
              long long v14 = [v13 nsuuid];

              if (v14)
              {
                BOOL v8 = 1;
                goto LABEL_26;
              }
            }
          }
          id v10 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      id v6 = handoff_log();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      uint64_t v7 = "Failed to find any valid cloud paired devices";
    }
  }
  else
  {
    id v6 = handoff_log();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    uint64_t v7 = "Handoff is disabled until first unlock has occurred";
  }
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, buf, 2u);
LABEL_24:
  BOOL v8 = 0;
LABEL_26:

LABEL_27:
  return v8;
}

- (NSArray)allPeerBTIdentifiers
{
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned __int8 v4 = [(IDSService *)self->_activityService devices];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 nsuuid];
        if ([v9 supportsHandoff]) {
          BOOL v11 = v10 == 0;
        }
        else {
          BOOL v11 = 1;
        }
        if (!v11) {
          [v3 addObject:v10];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = a4;
  id v6 = handoff_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 valueForKeyPath:@"@unionOfObjects.uniqueIDOverride"];
    BOOL v8 = SFCompactStringFromCollection();
    int v10 = 138412290;
    BOOL v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "List of Activity Continuation devices changed %@", (uint8_t *)&v10, 0xCu);
  }
  [(SDActivityController *)self activityServiceDevicesChanged:v5];
  if ([v5 count])
  {
    [(SDActivityController *)self restart];
  }
  else
  {
    id v9 = +[SDActivityEncryptionManager sharedEncryptionManager];
    [v9 deleteAllEncryptionAndDecryptionKeys];
  }
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = handoff_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100091950(v6, v8);
  }

  id v9 = [v7 devices];

  [(SDActivityController *)self nearbyServiceDevicesChanged:v9];
}

- (IDSService)activityService
{
  return self->_activityService;
}

- (void)setActivityService:(id)a3
{
}

- (void)setShouldStart:(BOOL)a3
{
  self->_shouldStart = a3;
}

- (void)setAllPeerBTIdentifiers:(id)a3
{
}

- (void)setAppleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_allPeerBTIdentifiers, 0);

  objc_storeStrong((id *)&self->_activityService, 0);
}

@end