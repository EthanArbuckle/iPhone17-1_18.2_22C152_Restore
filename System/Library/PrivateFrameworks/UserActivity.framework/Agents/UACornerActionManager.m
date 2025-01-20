@interface UACornerActionManager
+ (id)cornerActionManager;
+ (id)sharedActivityManagerServer;
- (ActivityManagerDebuggingManager)debugManager;
- (BOOL)activityAdvertisingAllowed;
- (BOOL)activityReceivingAllowed;
- (BOOL)advertisingSuspended;
- (BOOL)deviceUILocked;
- (BOOL)fetchMoreAppSuggestions;
- (BOOL)haveBestAppChangeNotificationClients;
- (BOOL)isBacklightOn;
- (BOOL)isBatterySaverModeEnabled;
- (BOOL)isBluetoothEnabled;
- (BOOL)isMirroringActive;
- (BOOL)isSharingModeBlockingReceiving;
- (BOOL)pingMode;
- (BOOL)receivingSuspended;
- (BOOL)scheduleBestAppDetermination;
- (BOOL)scheduleBestAppDetermination:(double)a3;
- (BOOL)screenDimmed;
- (BOOL)shouldItemBeAdvertised:(id)a3;
- (BOOL)suspended;
- (BOOL)systemHasSuspendedAdvertisements;
- (BOOL)systemHasSuspendedScanning;
- (BOOL)systemIsIdle;
- (BOOL)userActive;
- (BOOL)weAreAdvertisingAnItem;
- (BOOL)weAreAdvertisingAtLeastOneItem;
- (FBSDisplayLayoutMonitor)mirroringMonitor;
- (NSArray)itemsBeingAdvertised;
- (NSDate)holdPowerAssertionUntil;
- (NSDate)lastTimePayloadWasRequestedForAdvertisedItem;
- (NSDate)pingStart;
- (NSObject)bluetoothStatusCallbackIdentifier;
- (NSSet)activeDevicesIdentifiers;
- (NSSet)advertisers;
- (NSSet)allHandlers;
- (NSSet)clients;
- (NSSet)handlers;
- (NSSet)notifiers;
- (NSSet)receivers;
- (NSTimer)pongTimer;
- (NSUUID)uuid;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)mainDispatchQ;
- (OS_dispatch_semaphore)pongSem;
- (OS_dispatch_source)holdPowerAssertionSourceTimer;
- (PowerManagerIdleTracker)userIdleTracker;
- (UABluetoothStatus)bluetoothStatus;
- (UACornerActionManager)init;
- (UADispatchScheduler)nextScheduleBestAppDeterminationScheduler;
- (UADispatchScheduler)nextUpdateAdvertisedItemsScheduler;
- (UADispatchScheduler)nextUserIdleDeterminationScheduler;
- (UAPingController)pingController;
- (UASharedPasteboardClientController)pasteboardController;
- (UATimedPowerAssertions)deviceUILockedPowerAssertion;
- (UATimedPowerAssertions)screenDimmedPowerAssertion;
- (UATimedPowerAssertions)userInactivePowerAssertion;
- (UAUserActivityInfo)debugCornerItem;
- (UAUserActivityInfo)pinnedUserActivityInfoItem;
- (double)avgPingTime;
- (id)activeAdvertiseableItemsUUIDs;
- (id)advertiseableItems;
- (id)bestCornerItem;
- (id)bestCornerItem:(id)a3;
- (id)cornerActionItemForUUID:(id)a3;
- (id)cornerActionItems;
- (id)debuggingInfo;
- (id)dictionaryForAdvertisableItem:(id)a3;
- (id)dictionaryForCornerActionItem:(id)a3;
- (id)dynamicUserActivitiesString;
- (id)shortStatusString;
- (id)statusString;
- (id)uaAdvertisableItemsInOrder;
- (id)uaAdvertisableItemsInOrder:(BOOL)a3;
- (int)backlightLevelToken;
- (int)systemPreferenceChangedToken;
- (int)uiLockStatusToken;
- (unsigned)holdPowerAssertion;
- (void)_checkIfBestApplicationChangedThread;
- (void)_determineItemToAdvertiseForHandoffThread;
- (void)_determineWhenSystemGoesIdleThread;
- (void)addActivityNotifier:(id)a3;
- (void)addAdvertiser:(id)a3;
- (void)addClient:(id)a3;
- (void)addHandler:(id)a3;
- (void)addReceiver:(id)a3;
- (void)checkIfBestCornerItemChanged:(double)a3;
- (void)dealloc;
- (void)processWasRemoved;
- (void)removeActivityNotifier:(id)a3;
- (void)removeAdvertiser:(id)a3;
- (void)removeClient:(id)a3;
- (void)removeHandler:(id)a3;
- (void)removeReceiver:(id)a3;
- (void)resume;
- (void)resumeListeningForBluetooth;
- (void)scheduleUpdatingAdvertisableItems;
- (void)scheduleUpdatingAdvertisableItems:(double)a3;
- (void)setAdvertisingSuspended:(BOOL)a3;
- (void)setAvgPingTime:(double)a3;
- (void)setBacklightLevelToken:(int)a3;
- (void)setBacklightOn:(BOOL)a3;
- (void)setBluetoothStatus:(id)a3;
- (void)setBluetoothStatusCallbackIdentifier:(id)a3;
- (void)setDebugCornerItem:(id)a3;
- (void)setDeviceUILocked:(BOOL)a3;
- (void)setDeviceUILockedPowerAssertion:(id)a3;
- (void)setHoldPowerAssertion:(unsigned int)a3;
- (void)setHoldPowerAssertionSourceTimer:(id)a3;
- (void)setHoldPowerAssertionUntil:(id)a3;
- (void)setIsMirroringActive:(BOOL)a3;
- (void)setLastTimePayloadWasRequestedForAdvertisedItem:(id)a3;
- (void)setMainDispatchQ:(id)a3;
- (void)setMirroringMonitor:(id)a3;
- (void)setPasteboardController:(id)a3;
- (void)setPingController:(id)a3;
- (void)setPingMode:(BOOL)a3;
- (void)setPingStart:(id)a3;
- (void)setPinnedUserActivityInfoItem:(id)a3;
- (void)setPongSem:(id)a3;
- (void)setPongTimer:(id)a3;
- (void)setReceivingSuspended:(BOOL)a3;
- (void)setScreenDimmed:(BOOL)a3;
- (void)setScreenDimmedPowerAssertion:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setSystemHasSuspendedAdvertisements:(BOOL)a3;
- (void)setSystemHasSuspendedScanning:(BOOL)a3;
- (void)setSystemIsIdle:(BOOL)a3;
- (void)setSystemPreferenceChangedToken:(int)a3;
- (void)setUiLockStatusToken:(int)a3;
- (void)setUserActive:(BOOL)a3;
- (void)setUserIdleTracker:(id)a3;
- (void)setUserInactivePowerAssertion:(id)a3;
- (void)suspend;
- (void)suspendListeningForBluetooth;
- (void)terminate;
- (void)triggerAll;
- (void)triggerUserIdleDetermination;
- (void)triggerUserIdleDetermination:(double)a3;
- (void)updateScreenDimStateState:(BOOL)a3;
- (void)updateUIDeviceLockedState:(BOOL)a3;
- (void)updateUserActiveState:(BOOL)a3;
- (void)userActivityItemsChanged;
@end

@implementation UACornerActionManager

- (BOOL)isBluetoothEnabled
{
  v2 = [(UACornerActionManager *)self bluetoothStatus];
  unsigned __int8 v3 = [v2 poweredOn];

  return v3;
}

- (void)triggerUserIdleDetermination:(double)a3
{
  id v4 = [(UACornerActionManager *)self nextUserIdleDeterminationScheduler];
  [v4 scheduleNext:a3];
}

- (BOOL)activityAdvertisingAllowed
{
  v2 = +[UAUserActivityDefaults sharedDefaults];
  unsigned int v3 = [v2 activityAdvertisingAllowed];

  if (v3)
  {
    id v4 = +[MCProfileConnection sharedConnection];
    unsigned int v5 = [v4 isActivityContinuationAllowed];

    if (v5)
    {
      v6 = +[UMUserManager sharedManager];
      unsigned int v7 = [v6 isSharedIPad];

      if (!v7) {
        return 1;
      }
      v8 = sub_10000BA18(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Disabling Handoff/UserActivity because the system is in multi-user mode", v10, 2u);
      }
    }
  }
  return 0;
}

- (BOOL)advertisingSuspended
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL advertisingSuspended = v2->_advertisingSuspended;
  objc_sync_exit(v2);

  return advertisingSuspended;
}

- (NSSet)advertisers
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableSet *)v2->_advertisers copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)scheduleUpdatingAdvertisableItems:(double)a3
{
  id v4 = [(UACornerActionManager *)self nextUpdateAdvertisedItemsScheduler];
  [v4 scheduleNext:a3];
}

- (UADispatchScheduler)nextUpdateAdvertisedItemsScheduler
{
  return (UADispatchScheduler *)objc_getProperty(self, a2, 224, 1);
}

- (OS_dispatch_queue)mainDispatchQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 208, 1);
}

- (void)_determineItemToAdvertiseForHandoffThread
{
  v2 = sub_10000BA18(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "DETERMINE: Determining list of items to be advertised thread starting up: ", buf, 2u);
  }

  dispatch_group_enter((dispatch_group_t)self->_helpersDispatchGroup);
  v79 = +[NSMutableArray array];
  BOOL v3 = [(UACornerActionManager *)self screenDimmed];
  if (![v79 count])
  {
    if (v3)
    {
      id v4 = sub_10000BA18(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "DETERMINE: Checking for recentlyEligible items because the screen is dimmed (includeRecentItems == YES).", buf, 2u);
      }
    }
    unsigned int v5 = [(UACornerActionManager *)self uaAdvertisableItemsInOrder:v3];
    v6 = v5;
    if (v5 && [v5 count])
    {
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v7 = v6;
      id v8 = [v7 countByEnumeratingWithState:&v89 objects:v99 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v90;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v90 != v9) {
              objc_enumerationMutation(v7);
            }
            uint64_t v11 = *(void *)(*((void *)&v89 + 1) + 8 * i);
            if (v11
              && [*(id *)(*((void *)&v89 + 1) + 8 * i) eligibleForHandoff])
            {
              [v79 addObject:v11];
            }
          }
          id v8 = [v7 countByEnumeratingWithState:&v89 objects:v99 count:16];
        }
        while (v8);
      }
    }
  }
  if (!v79 || ![v79 count])
  {
    int v42 = 0;
    int v43 = 0;
    goto LABEL_63;
  }
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v12 = [v79 copy];
  id obj = v12;
  id v13 = [v12 countByEnumeratingWithState:&v85 objects:v98 count:16];
  if (!v13)
  {
    LODWORD(v76) = 0;
    unsigned __int8 v77 = 0;
    goto LABEL_62;
  }
  LODWORD(v76) = 0;
  unsigned __int8 v77 = 0;
  uint64_t v14 = *(void *)v86;
  uint64_t v72 = _LSUserActivityContainsUnsynchronizedCloudDocsKey;
  uint64_t v73 = _UAUserActivityContainsCloudDocsKey;
  do
  {
    v15 = 0;
    do
    {
      if (*(void *)v86 != v14) {
        objc_enumerationMutation(obj);
      }
      v16 = *(void **)(*((void *)&v85 + 1) + 8 * (void)v15);
      if (v16 && [*(id *)(*((void *)&v85 + 1) + 8 * (void)v15) eligibleForHandoff])
      {
        if (v77) {
          unsigned __int8 v77 = 1;
        }
        else {
          unsigned __int8 v77 = [v16 eligibleToAlwaysAdvertise];
        }
        v17 = [v16 options];
        if (v17)
        {
          v18 = [v16 options];
          v19 = [v18 objectForKeyedSubscript:v73];
          if ([v19 BOOLValue])
          {
            v20 = [v16 options];
            v21 = [v20 objectForKeyedSubscript:v72];
            unsigned int v22 = [v21 BOOLValue];

            if (v22)
            {
              [v79 removeObject:v16];
              v23 = sub_10000BA18(0);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                v24 = [v16 uuid];
                id v25 = [v24 UUIDString];
                v26 = [v16 activityType];
                *(_DWORD *)buf = 138543619;
                id v95 = v25;
                __int16 v96 = 2113;
                v97 = v26;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "DETERMINE: Since this activityItem's .userInfo, %{public}@ type=%{private}@, has unsynchronized cloud documents, we can't actually advertise this item.", buf, 0x16u);
              }
              uint64_t v27 = +[UAUserActivityDefaults sharedDefaults];
              [(id)v27 intervalToAskClientWithUnsynchronizedDocumentsToUpdate];
              double v29 = v28;

              v30 = [(UACornerActionManager *)self lastTimePayloadWasRequestedForAdvertisedItem];
              LOBYTE(v27) = v30 == 0;

              double v31 = 3.40282347e38;
              if ((v27 & 1) == 0)
              {
                v32 = [(UACornerActionManager *)self lastTimePayloadWasRequestedForAdvertisedItem];
                [v32 timeIntervalSinceNow];
                double v34 = v33;

                if (v34 > 0.0)
                {
                  [(UACornerActionManager *)self setLastTimePayloadWasRequestedForAdvertisedItem:0];
                  goto LABEL_57;
                }
                double v31 = -v34;
              }
              if (v31 <= v29)
              {
                double v29 = v29 - v31;
LABEL_57:
                [(UACornerActionManager *)self scheduleUpdatingAdvertisableItems:v29];
              }
              else
              {
                v38 = +[NSDate date];
                [(UACornerActionManager *)self setLastTimePayloadWasRequestedForAdvertisedItem:v38];

                v39 = sub_10000BA18(@"signposts");
                v40 = v39;
                if (v16 != (void *)-1 && os_signpost_enabled(v39))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v16, "handoffFetchSpeculative enableTelemetry=YES ", "", buf, 2u);
                }

                v84[0] = _NSConcreteStackBlock;
                v84[1] = 3221225472;
                v84[2] = sub_1000257F8;
                v84[3] = &unk_1000C50D0;
                v84[4] = self;
                v84[5] = v16;
                *(double *)&v84[6] = v29;
                [v16 requestPayloadWithCompletionHandlerEvenIfClean:1 withCompletionHandler:v84];
              }
LABEL_44:
              v35 = [v16 activityType];
              unsigned int v36 = [v35 isEqual:NSUserActivityTypeBrowsingWeb];

              if (v36) {
                int v37 = 1;
              }
              else {
                int v37 = v76;
              }
              LODWORD(v76) = v37;
              goto LABEL_48;
            }
          }
          else
          {
          }
        }
        [(UACornerActionManager *)self setLastTimePayloadWasRequestedForAdvertisedItem:0];
        goto LABEL_44;
      }
LABEL_48:
      v15 = (char *)v15 + 1;
    }
    while (v13 != v15);
    id v12 = obj;
    id v41 = [obj countByEnumeratingWithState:&v85 objects:v98 count:16];
    id v13 = v41;
  }
  while (v41);
LABEL_62:

  int v42 = v76 & 1;
  int v43 = v77 & 1;
LABEL_63:
  v44 = [(UACornerActionManager *)self advertiseableItems];
  int v45 = [v44 count];

  int lastNumAdvertiseableProcesses = self->_lastNumAdvertiseableProcesses;
  v47 = [(UACornerActionManager *)self itemsBeingAdvertised];
  unsigned int v48 = [v79 isEqual:v47];

  if ((v48 ^ 1 | v42 | (lastNumAdvertiseableProcesses != v45)) == 1)
  {
    v49 = self;
    objc_sync_enter(v49);
    if (![v79 count] && -[NSArray count](v49->_itemsBeingAdvertised, "count"))
    {
      int v51 = 1;
      goto LABEL_81;
    }
    v50 = [v79 firstObject];
    if (v50)
    {
      v47 = [v79 firstObject];
      uint64_t v76 = [(NSArray *)v49->_itemsBeingAdvertised firstObject];
      if (!objc_msgSend(v47, "isEqual:"))
      {
        v78 = v47;
        int v51 = 1;
        goto LABEL_79;
      }
    }
    v78 = v47;
    v52 = [v79 firstObject];
    v53 = [v52 activityType];
    if ([v53 isEqual:NSUserActivityTypeBrowsingWeb])
    {

      int v51 = 1;
      if (!v50) {
        goto LABEL_80;
      }
LABEL_79:
    }
    else
    {
      v54 = [(NSArray *)v49->_itemsBeingAdvertised firstObject];
      if (v54)
      {
        v55 = [(NSArray *)v49->_itemsBeingAdvertised firstObject];
        v56 = [v79 firstObject];
        unsigned int v57 = [v55 isEqual:v56];

        int v51 = v57 ^ 1;
        if (!v50) {
          goto LABEL_80;
        }
        goto LABEL_79;
      }

      int v51 = 0;
      if (v50) {
        goto LABEL_79;
      }
    }
LABEL_80:

LABEL_81:
    self->_int lastNumAdvertiseableProcesses = v45;
    v58 = (NSArray *)[v79 copy];
    itemsBeingAdvertised = v49->_itemsBeingAdvertised;
    v49->_itemsBeingAdvertised = v58;

    objc_sync_exit(v49);
    if (v51)
    {
      v60 = [v79 firstObject];
      if (v60)
      {
        v61 = sub_10000BA18(0);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          v62 = [v60 uuid];
          v63 = [v62 UUIDString];
          v64 = [v60 logString];
          *(_DWORD *)buf = 138543619;
          id v95 = v63;
          __int16 v96 = 2113;
          v97 = v64;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "DETERMINE: %{public}@/%{private}@ as the current item-to-advertise.", buf, 0x16u);
        }
        unsigned int v65 = [(UACornerActionManager *)v49 advertisingSuspended];
        double v66 = 1.0;
        if (v65) {
          double v66 = 0.0;
        }
        [(UACornerActionManager *)v49 triggerUserIdleDetermination:v66];
        LOBYTE(v43) = 0;
      }
      else
      {
        v67 = sub_10000BA18(0);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "DETERMINE: No item is being advertised, so removing any previously set of advertised items.", buf, 2u);
        }
      }
    }
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v68 = [(UACornerActionManager *)v49 advertisers];
    id v69 = [v68 countByEnumeratingWithState:&v80 objects:v93 count:16];
    if (v69)
    {
      uint64_t v70 = *(void *)v81;
      do
      {
        for (j = 0; j != v69; j = (char *)j + 1)
        {
          if (*(void *)v81 != v70) {
            objc_enumerationMutation(v68);
          }
          [*(id *)(*((void *)&v80 + 1) + 8 * (void)j) setAdvertisableItems:v79];
        }
        id v69 = [v68 countByEnumeratingWithState:&v80 objects:v93 count:16];
      }
      while (v69);
    }

    if (v43) {
LABEL_100:
    }
      [(UACornerActionManager *)self triggerUserIdleDetermination];
  }
  else if (v43)
  {
    goto LABEL_100;
  }
  dispatch_group_leave((dispatch_group_t)self->_helpersDispatchGroup);
}

- (BOOL)screenDimmed
{
  return self->_screenDimmed;
}

- (NSArray)itemsBeingAdvertised
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSArray *)v2->_itemsBeingAdvertised copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (id)advertiseableItems
{
  v2 = [(UACornerActionManager *)self clients];
  id v3 = [v2 copy];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v3;
  id v5 = 0;
  id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "items", (void)v14);
        uint64_t v11 = v10;
        if (v9)
        {
          if (v5)
          {
            uint64_t v12 = [v5 setByAddingObjectsFromSet:v10];

            id v5 = (id)v12;
          }
          else
          {
            id v5 = v10;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v5;
}

- (NSSet)clients
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableSet *)v2->_clients copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (id)uaAdvertisableItemsInOrder:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UACornerActionManager *)self clients];
  id v5 = [v4 allObjects];
  id v6 = [v5 sortedArrayUsingComparator:&stru_1000C5080];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (!v8)
  {
    id v10 = 0;
    uint64_t v9 = 0;
    long long v17 = v7;
LABEL_30:

    goto LABEL_31;
  }
  uint64_t v9 = 0;
  id v10 = 0;
  uint64_t v11 = *(void *)v24;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v24 != v11) {
        objc_enumerationMutation(v7);
      }
      id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      long long v14 = objc_msgSend(v13, "eligibleAdvertiseableItemsInOrder", (void)v23);
      long long v15 = v14;
      if (v14 && [v14 count])
      {
        if (!v10)
        {
          id v10 = +[NSMutableArray array];
        }
        [v10 addObjectsFromArray:v15];
      }
      else if (v3)
      {
        long long v16 = [v13 recentEligibleItemsInOrder:5.0];

        long long v15 = v16;
        if (v16)
        {
          if ([v16 count])
          {
            if (!v9)
            {
              uint64_t v9 = +[NSMutableArray array];
            }
            [v9 addObjectsFromArray:v16];
          }
        }
      }
    }
    id v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
  }
  while (v8);

  if (v9 && [v9 count])
  {
    if (v10) {
      [v10 addObjectsFromArray:v9];
    }
    else {
      id v10 = v9;
    }
    goto LABEL_27;
  }
  if (v10)
  {
LABEL_27:
    if (![v10 count]) {
      goto LABEL_31;
    }
    long long v17 = sub_10000BA18(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = [v10 description];
      v19 = sub_100063FF0(v18);
      id v20 = [v10 count];
      *(_DWORD *)buf = 138478083;
      double v28 = v19;
      __int16 v29 = 2048;
      id v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "result=%{private}@/%ld items", buf, 0x16u);
    }
    goto LABEL_30;
  }
LABEL_31:
  if (objc_msgSend(v10, "count", (void)v23)) {
    id v21 = [v10 copy];
  }
  else {
    id v21 = 0;
  }

  return v21;
}

- (void)setLastTimePayloadWasRequestedForAdvertisedItem:(id)a3
{
}

- (void)scheduleUpdatingAdvertisableItems
{
}

- (UAUserActivityInfo)pinnedUserActivityInfoItem
{
  return (UAUserActivityInfo *)objc_getProperty(self, a2, 184, 1);
}

- (UADispatchScheduler)nextUserIdleDeterminationScheduler
{
  return (UADispatchScheduler *)objc_getProperty(self, a2, 216, 1);
}

- (BOOL)isBatterySaverModeEnabled
{
  return self->_batterySaverModeEnabled;
}

- (UABluetoothStatus)bluetoothStatus
{
  return (UABluetoothStatus *)objc_getProperty(self, a2, 336, 1);
}

+ (id)cornerActionManager
{
  v2 = objc_alloc_init(UACornerActionManager);

  return v2;
}

+ (id)sharedActivityManagerServer
{
  if (qword_1000E6720 != -1) {
    dispatch_once(&qword_1000E6720, &stru_1000C5018);
  }
  v2 = (void *)qword_1000E6728;

  return v2;
}

- (UACornerActionManager)init
{
  v60.receiver = self;
  v60.super_class = (Class)UACornerActionManager;
  v2 = [(UACornerActionManager *)&v60 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("cornerActionManagerQ", 0);
    [v2 setMainDispatchQ:v3];

    id v4 = [[ActivityManagerDebuggingManager alloc] initWithManager:v2];
    id v5 = (void *)*((void *)v2 + 22);
    *((void *)v2 + 22) = v4;

    id v6 = [v2 debugManager];
    [v6 resume];

    uint64_t v7 = +[NSUUID UUID];
    id v8 = (void *)*((void *)v2 + 19);
    *((void *)v2 + 19) = v7;

    v2[8] = 1;
    uint64_t v9 = +[NSDate date];
    id v10 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v9;

    uint64_t v11 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = 0;

    dispatch_group_t v12 = dispatch_group_create();
    id v13 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v12;

    uint64_t v14 = +[NSMutableSet set];
    long long v15 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v14;

    uint64_t v16 = +[NSMutableSet set];
    long long v17 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v16;

    uint64_t v18 = +[NSMutableSet set];
    v19 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v18;

    uint64_t v20 = +[NSMutableSet set];
    id v21 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v20;

    uint64_t v22 = +[NSMutableSet set];
    long long v23 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v22;

    *(_WORD *)(v2 + 121) = 0;
    *((_DWORD *)v2 + 25) = 0;
    long long v24 = [v2 mainDispatchQ];
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_10002502C;
    v58[3] = &unk_1000C4D40;
    long long v25 = v2;
    v59 = v25;
    uint64_t v26 = +[UADispatchScheduler dispatchScheduler:@"idleDetermination" frequency:v24 queue:v58 block:0.0];
    uint64_t v27 = (void *)*((void *)v25 + 27);
    *((void *)v25 + 27) = v26;

    double v28 = [v25 mainDispatchQ];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10000CC7C;
    v56[3] = &unk_1000C4D40;
    __int16 v29 = v25;
    unsigned int v57 = v29;
    uint64_t v30 = +[UADispatchScheduler dispatchScheduler:@"updateAdvertisedItems" frequency:v28 queue:v56 block:0.0];
    double v31 = (void *)*((void *)v29 + 28);
    *((void *)v29 + 28) = v30;

    v32 = [v29 mainDispatchQ];
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100025034;
    v54[3] = &unk_1000C4D40;
    double v33 = v29;
    v55 = v33;
    uint64_t v34 = +[UADispatchScheduler dispatchScheduler:@"bestApp" frequency:v32 queue:v54 block:0.0];
    v35 = (void *)*((void *)v33 + 29);
    *((void *)v33 + 29) = v34;

    int v36 = MKBGetDeviceLockState();
    int v37 = v36;
    if ((v36 - 1) < 2)
    {
      v38 = sub_10000BA18(0);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "-- Setting device lock to YES since MobileKeyBag() is locked or locking.", buf, 2u);
      }
      uint64_t v40 = 1;
      goto LABEL_14;
    }
    if (v36)
    {
      if (v36 != 3)
      {
        id v41 = sub_10000BA18(0);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v62 = v37;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "*** Unexpected result from MKBGetDeviceLockState(), %d, so device is assumed to be locked.", buf, 8u);
        }

        goto LABEL_18;
      }
      v38 = sub_10000BA18(0);
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      v39 = "-- Setting device lock to NO since MobileKeyBag() is disabled";
    }
    else
    {
      v38 = sub_10000BA18(0);
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
LABEL_13:
        uint64_t v40 = 0;
LABEL_14:

        [v33 setDeviceUILocked:v40];
LABEL_18:
        v33[130] = 0;
        *((void *)v33 + 38) = 0xC000000000000000;
        int v42 = [v33 mainDispatchQ];
        int v43 = +[UAUserActivityDefaults sharedDefaults];
        [v43 userIdleInterval];
        double v45 = v44;
        v49 = _NSConcreteStackBlock;
        uint64_t v50 = 3221225472;
        int v51 = sub_10002503C;
        v52 = &unk_1000C5040;
        v46 = v33;
        v53 = v46;
        v47 = +[PowerManagerIdleTracker idleTracker:@"SuspendAdvertisingIdleTracker" queue:v42 interval:&v49 block:v45];
        objc_msgSend(v46, "setUserIdleTracker:", v47, v49, v50, v51, v52);

        return (UACornerActionManager *)v2;
      }
      *(_WORD *)buf = 0;
      v39 = "-- Setting device lock to NO since MobileKeyBag() is unlocked";
    }
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, v39, buf, 2u);
    goto LABEL_13;
  }
  return (UACornerActionManager *)v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)UACornerActionManager;
  [(UACornerActionManager *)&v2 dealloc];
}

- (BOOL)weAreAdvertisingAnItem
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v2 = [(UACornerActionManager *)self advertisers];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if [v6 active] && (objc_msgSend(v6, "advertising"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (BOOL)shouldItemBeAdvertised:(id)a3
{
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(UACornerActionManager *)self clients];
  id v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v19 = *(void *)v26;
    do
    {
      id v18 = v5;
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = v7;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v9 = [v8 userActivityClients];
          id v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v22;
            while (2)
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v22 != v11) {
                  objc_enumerationMutation(v9);
                }
                id v13 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)j) bundleIdentifier];
                uint64_t v14 = [v4 bundleIdentifier];
                unsigned __int8 v15 = [v13 isEqualToString:v14];

                if (v15)
                {

                  BOOL v16 = 1;
                  goto LABEL_21;
                }
              }
              id v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      BOOL v16 = 0;
    }
    while (v5);
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_21:

  return v16;
}

- (id)activeAdvertiseableItemsUUIDs
{
  id v3 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(UACornerActionManager *)self advertiseableItems];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 eligibleToAdvertise])
        {
          long long v9 = [v8 uuid];
          [v3 addObject:v9];
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  id v10 = [v3 copy];

  return v10;
}

- (id)uaAdvertisableItemsInOrder
{
  return [(UACornerActionManager *)self uaAdvertisableItemsInOrder:0];
}

- (void)userActivityItemsChanged
{
  id v3 = [(UACornerActionManager *)self advertisers];

  if (v3)
  {
    id v4 = self;
    objc_sync_enter(v4);
    id v5 = sub_10000BA18(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "-- signalling thread to determine what activity to advertise because one of our userActivityItems changed.", v6, 2u);
    }

    [(UACornerActionManager *)v4 scheduleUpdatingAdvertisableItems];
    objc_sync_exit(v4);
  }
}

- (BOOL)weAreAdvertisingAtLeastOneItem
{
  objc_super v2 = self;
  objc_sync_enter(v2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(UACornerActionManager *)v2 advertisers];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if [v7 active] && (objc_msgSend(v7, "advertising"))
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  objc_sync_exit(v2);
  return (char)v4;
}

- (BOOL)activityReceivingAllowed
{
  objc_super v2 = +[UAUserActivityDefaults sharedDefaults];
  unsigned int v3 = [v2 activityReceivingAllowed];

  if (v3)
  {
    id v4 = +[MCProfileConnection sharedConnection];
    unsigned int v5 = [v4 isActivityContinuationAllowed];

    if (v5)
    {
      uint64_t v6 = +[UMUserManager sharedManager];
      unsigned int v7 = [v6 isSharedIPad];

      if (!v7) {
        return 1;
      }
      id v8 = sub_10000BA18(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Disabling Handoff/UserActivity because the system is in multi-user mode", v10, 2u);
      }
    }
  }
  return 0;
}

- (BOOL)isSharingModeBlockingReceiving
{
  return 0;
}

- (void)triggerUserIdleDetermination
{
}

- (void)setAdvertisingSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v4->_BOOL advertisingSuspended = v3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v5 = [(UACornerActionManager *)v4 advertisers];
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setSuspended:v3];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  if (!v3) {
    [(UACornerActionManager *)v4 scheduleUpdatingAdvertisableItems];
  }
  objc_sync_exit(v4);
}

- (void)_determineWhenSystemGoesIdleThread
{
  BOOL v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Determining idleDetermination, entering", buf, 2u);
  }

  dispatch_group_enter((dispatch_group_t)self->_helpersDispatchGroup);
  id v4 = self;
  objc_sync_enter(v4);
  unsigned int v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if ([(UACornerActionManager *)v4 screenDimmed]) {
      id v6 = "yes";
    }
    else {
      id v6 = "no";
    }
    unsigned int v7 = [(UACornerActionManager *)v4 deviceUILocked];
    unsigned int v8 = [(UACornerActionManager *)v4 userActive];
    if (v7) {
      long long v9 = "yes";
    }
    else {
      long long v9 = "no";
    }
    *(_DWORD *)buf = 136315650;
    if (v8) {
      long long v10 = "yes";
    }
    else {
      long long v10 = "no";
    }
    uint64_t v70 = (void *)v6;
    __int16 v71 = 2080;
    uint64_t v72 = v9;
    __int16 v73 = 2080;
    v74 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "IDLE: screen dimmed: %s, deviceUILocked: %s, useractive: %s", buf, 0x20u);
  }

  unsigned int v11 = [(UACornerActionManager *)v4 activityAdvertisingAllowed];
  unsigned int v12 = [(UACornerActionManager *)v4 activityReceivingAllowed];
  if (v11)
  {
    if (byte_1000E6738 || (int v13 = MKBDeviceUnlockedSinceBoot(), byte_1000E6738 = v13 != 0, v13))
    {
      int v14 = 0;
      goto LABEL_22;
    }
    long long v15 = sub_10000BA18(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "IDLE: since the device hasn't been unlocked since boot, setting mustSuspendAdvertising = YES.", buf, 2u);
    }
  }
  int v14 = 1;
LABEL_22:
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  BOOL v16 = [(UACornerActionManager *)v4 itemsBeingAdvertised];
  id v17 = [v16 countByEnumeratingWithState:&v64 objects:v77 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v65;
    while (2)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v65 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        if ([v20 alwaysPick])
        {
          long long v22 = sub_10000BA18(0);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            long long v23 = [v20 uuid];
            long long v24 = [v23 UUIDString];
            *(_DWORD *)buf = 138543362;
            uint64_t v70 = v24;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "IDLE: Setting preventAdvertisingSuspensionBecauseOfAlwaysPickItem = YES for item %{public}@", buf, 0xCu);
          }
          int v21 = 1;
          goto LABEL_34;
        }
      }
      id v17 = [v16 countByEnumeratingWithState:&v64 objects:v77 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  int v21 = 0;
LABEL_34:

  int v25 = v11 ^ 1;
  if (![(UACornerActionManager *)v4 userActive]
    && ![(UACornerActionManager *)v4 isMirroringActive])
  {
    if (![(UACornerActionManager *)v4 weAreAdvertisingAtLeastOneItem])
    {
      long long v26 = sub_10000BA18(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "IDLE: Setting self.userIsInactivePowerAssertion == nil because there are no items being advertised and the user is not active", buf, 2u);
      }

      [(UACornerActionManager *)v4 setUserInactivePowerAssertion:0];
    }
    long long v27 = [(UACornerActionManager *)v4 userInactivePowerAssertion];
    BOOL v28 = v27 == 0;

    if (v28)
    {
      __int16 v29 = sub_10000BA18(0);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "IDLE: Setting shouldSuspendAdvertising == YES because userInactivePowerAssertion == nil and the user is not active", buf, 2u);
      }

      int v25 = 1;
    }
  }
  int v30 = v12 ^ 1;
  if ([(UACornerActionManager *)v4 screenDimmed]
    && ![(UACornerActionManager *)v4 isMirroringActive])
  {
    if (![(UACornerActionManager *)v4 weAreAdvertisingAtLeastOneItem])
    {
      uint64_t v40 = sub_10000BA18(0);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "IDLE: Setting self.screenDimmedPowerAssertion == nil because there are no items being advertised and the screen is dimmed", buf, 2u);
      }

      [(UACornerActionManager *)v4 setScreenDimmedPowerAssertion:0];
    }
    id v41 = [(UACornerActionManager *)v4 screenDimmedPowerAssertion];
    BOOL v42 = v41 == 0;

    if (v42)
    {
      unsigned int v57 = sub_10000BA18(0);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "IDLE: Setting shouldSuspendAdvertising == YES because self.screenDimmedPowerAssertion == nil and the screen is dimmed", buf, 2u);
      }

      int v31 = 0;
      int v32 = 1;
      int v25 = 1;
    }
    else
    {
      int v31 = 1;
      int v32 = 1;
    }
  }
  else
  {
    int v31 = 0;
    int v32 = v12 ^ 1;
  }
  if (![(UACornerActionManager *)v4 deviceUILocked]
    || ([(UACornerActionManager *)v4 deviceUILockedPowerAssertion],
        double v33 = objc_claimAutoreleasedReturnValue(),
        BOOL v34 = v33 == 0,
        v33,
        !v34))
  {
    if (v14) {
      goto LABEL_50;
    }
LABEL_69:
    if ((v31 | v25 ^ 1))
    {
      if (!v25) {
        goto LABEL_86;
      }
    }
    else
    {
      double v44 = [(UACornerActionManager *)v4 deviceUILockedPowerAssertion];
      if (v44) {
        char v45 = 1;
      }
      else {
        char v45 = v21;
      }

      if ((v45 & 1) == 0)
      {
        if (!v25) {
          goto LABEL_86;
        }
        if (![(UACornerActionManager *)v4 weAreAdvertisingAtLeastOneItem])
        {
          int v25 = 1;
          goto LABEL_86;
        }
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        v52 = [(UACornerActionManager *)v4 advertisers];
        id v53 = [v52 countByEnumeratingWithState:&v60 objects:v68 count:16];
        if (v53)
        {
          uint64_t v54 = *(void *)v61;
          while (2)
          {
            for (j = 0; j != v53; j = (char *)j + 1)
            {
              if (*(void *)v61 != v54) {
                objc_enumerationMutation(v52);
              }
              v56 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
              if ([v56 active]
                && [v56 advertising]
                && ([v56 okToSuspendAdvertising] & 1) == 0)
              {
                v58 = sub_10000BA18(0);
                if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v70 = v56;
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "IDLE: Setting systemShouldNotBeAdvertising=NO because advertiser %{public}@ always wants to be advertised.", buf, 0xCu);
                }

                int v25 = 0;
                goto LABEL_113;
              }
            }
            id v53 = [v52 countByEnumeratingWithState:&v60 objects:v68 count:16];
            if (v53) {
              continue;
            }
            break;
          }
        }
        int v25 = 1;
LABEL_113:

        goto LABEL_50;
      }
    }
    v35 = sub_10000BA18(0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v46 = [(UACornerActionManager *)v4 deviceUILockedPowerAssertion];
      v47 = (void *)v46;
      unsigned int v48 = "";
      v49 = "dimmed ";
      if (!v31) {
        v49 = "";
      }
      uint64_t v50 = "uilock ";
      if (!v46) {
        uint64_t v50 = "";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v70 = (void *)v49;
      __int16 v71 = 2080;
      uint64_t v72 = "";
      __int16 v73 = 2080;
      v74 = v50;
      if (v21) {
        unsigned int v48 = "alwaysPick ";
      }
      __int16 v75 = 2080;
      uint64_t v76 = v48;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "IDLE: Setting shouldSuspendAdvertising to NO because one or more of our assertions still exists. (%s%s%s%s)", buf, 0x2Au);
    }
    int v25 = 0;
    goto LABEL_85;
  }
  int v43 = sub_10000BA18(0);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "IDLE: Setting shouldSuspendAdvertising == YES because the device is locked and our power assertion has expired.", buf, 2u);
  }

  int v25 = 1;
  if ((v14 & 1) == 0) {
    goto LABEL_69;
  }
LABEL_50:
  if (v14 && (v25 & 1) == 0)
  {
    v35 = sub_10000BA18(0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      if ([(UACornerActionManager *)v4 activityAdvertisingAllowed]) {
        CFStringRef v36 = @"(activityAdvertisingAllowed = NO) ";
      }
      else {
        CFStringRef v36 = &stru_1000C6800;
      }
      int v37 = +[UAUserActivityDefaults sharedDefaults];
      unsigned int v38 = [v37 activityAdvertisingAllowed];
      CFStringRef v39 = @"(disabled in System Preferences) ";
      if (!v38) {
        CFStringRef v39 = &stru_1000C6800;
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v70 = (void *)v36;
      __int16 v71 = 2112;
      uint64_t v72 = (const char *)v39;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "IDLE: Setting shouldSuspendAdvertising = YES because mustSuspendAdvertising == YES %@%@", buf, 0x16u);
    }
    int v25 = 1;
LABEL_85:
  }
LABEL_86:
  if (v25 != [(UACornerActionManager *)v4 systemHasSuspendedAdvertisements])
  {
    if (v25)
    {
      int v51 = sub_10000BA18(0);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v70 = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "IDLE: Determined that advertising should be suspended, removing any active advertisement and setting self.systemHasSuspendedAdvertisements = YES(idle=%.2f seconds)", buf, 0xCu);
      }

      [(UACornerActionManager *)v4 setSystemHasSuspendedAdvertisements:1];
    }
    else
    {
      [(UACornerActionManager *)v4 setSystemHasSuspendedAdvertisements:0];
      [(UACornerActionManager *)v4 scheduleUpdatingAdvertisableItems];
    }
  }
  [(UACornerActionManager *)v4 setSystemHasSuspendedScanning:v32 | v30];
  objc_sync_exit(v4);

  dispatch_group_leave((dispatch_group_t)self->_helpersDispatchGroup);
}

- (BOOL)systemHasSuspendedAdvertisements
{
  objc_super v2 = self;
  objc_sync_enter(v2);
  BOOL systemHasSuspendedAdvertisements = v2->_systemHasSuspendedAdvertisements;
  objc_sync_exit(v2);

  return systemHasSuspendedAdvertisements;
}

- (void)setSystemHasSuspendedAdvertisements:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_systemHasSuspendedAdvertisements != v3)
  {
    v4->_BOOL systemHasSuspendedAdvertisements = v3;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    unsigned int v5 = [(UACornerActionManager *)v4 advertisers];
    id obj = v5;
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      do
      {
        unsigned int v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v8);
          long long v10 = [(UACornerActionManager *)v4 mainDispatchQ];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100026A08;
          block[3] = &unk_1000C50F8;
          BOOL v13 = v3;
          block[4] = v9;
          dispatch_async(v10, block);

          unsigned int v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        unsigned int v5 = obj;
        id v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    if (!v3) {
      [(UACornerActionManager *)v4 scheduleUpdatingAdvertisableItems];
    }
  }
  objc_sync_exit(v4);
}

- (BOOL)systemHasSuspendedScanning
{
  objc_super v2 = self;
  objc_sync_enter(v2);
  BOOL systemHasSuspendedScanning = v2->_systemHasSuspendedScanning;
  objc_sync_exit(v2);

  return systemHasSuspendedScanning;
}

- (void)setSystemHasSuspendedScanning:(BOOL)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  v4->_BOOL systemHasSuspendedScanning = a3;
  if (a3)
  {
    unsigned int v5 = 0;
  }
  else
  {
    unsigned int v5 = +[NSMutableSet set];
    if (![(UACornerActionManager *)v4 deviceUILocked]
      && ![(UACornerActionManager *)v4 screenDimmed])
    {
      [v5 addObject:off_1000E5C70];
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = [(UACornerActionManager *)v4 notifiers];
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v6);
          }
          long long v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v10 active])
          {
            if (([v10 suspended] & 1) == 0)
            {
              [v5 addObject:off_1000E5C68];
              if ([v10 requiresBoosted])
              {
                [v5 addObject:off_1000E5C78];
                goto LABEL_18;
              }
            }
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_18:
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned int v11 = [(UACornerActionManager *)v4 receivers];
  id v12 = [v11 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)j) setScanningForTypes:v5];
      }
      id v12 = [v11 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  objc_sync_exit(v4);
}

- (id)cornerActionItems
{
  long long v16 = +[NSMutableSet set];
  BOOL v3 = [(UACornerActionManager *)self debugCornerItem];

  if (v3)
  {
    id v4 = [(UACornerActionManager *)self debugCornerItem];
    [v16 addObject:v4];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(UACornerActionManager *)self receivers];
  id v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v8 active])
        {
          uint64_t v9 = [v8 receivedItems];
          if (v9)
          {
            [v16 addObjectsFromArray:v9];
            long long v20 = 0u;
            long long v21 = 0u;
            long long v18 = 0u;
            long long v19 = 0u;
            id v10 = v9;
            unsigned int v11 = (char *)[v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v11)
            {
              uint64_t v12 = *(void *)v19;
              do
              {
                for (j = 0; j != v11; ++j)
                {
                  if (*(void *)v19 != v12) {
                    objc_enumerationMutation(v10);
                  }
                  objc_opt_class();
                  objc_opt_isKindOfClass();
                }
                unsigned int v11 = (char *)[v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
              }
              while (v11);
            }
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }

  if ([v16 count]) {
    id v14 = [v16 copy];
  }
  else {
    id v14 = 0;
  }

  return v14;
}

- (id)cornerActionItemForUUID:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(UACornerActionManager *)self cornerActionItems];
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
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 uuid];
        unsigned int v11 = [v10 isEqual:v4];

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

- (id)bestCornerItem
{
  objc_super v2 = [(UACornerActionManager *)self cornerActionItems];
  BOOL v3 = [v2 anyObject];

  return v3;
}

- (id)bestCornerItem:(id)a3
{
  return 0;
}

- (void)setDebugCornerItem:(id)a3
{
  id v5 = (UAUserActivityInfo *)a3;
  if (self->_debugCornerItem != v5)
  {
    objc_storeStrong((id *)&self->_debugCornerItem, a3);
    [(UACornerActionManager *)self scheduleBestAppDetermination];
  }
}

- (UAUserActivityInfo)debugCornerItem
{
  return self->_debugCornerItem;
}

- (void)checkIfBestCornerItemChanged:(double)a3
{
  if ([(UACornerActionManager *)self haveBestAppChangeNotificationClients])
  {
    id v4 = sub_10000BA18(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, " -- there are listening clients, so firing the check-and-update-BestApplication thread.", v5, 2u);
    }

    [(UACornerActionManager *)self scheduleBestAppDetermination];
  }
}

- (BOOL)scheduleBestAppDetermination
{
  return [(UACornerActionManager *)self scheduleBestAppDetermination:0.0];
}

- (BOOL)scheduleBestAppDetermination:(double)a3
{
  id v4 = [(UACornerActionManager *)self nextScheduleBestAppDeterminationScheduler];
  unsigned __int8 v5 = [v4 scheduleNext:a3];

  return v5;
}

- (void)_checkIfBestApplicationChangedThread
{
  BOOL v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Creating loop to check-for-and-update BestApplication", buf, 2u);
  }

  dispatch_group_enter((dispatch_group_t)self->_helpersDispatchGroup);
  id v4 = [(UACornerActionManager *)self cornerActionItems];
  unsigned __int8 v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v4 description];
    uint64_t v7 = sub_100063FF0(v6);
    *(_DWORD *)buf = 138477827;
    long long v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Candidate bestAppSuggestions: %{private}@", buf, 0xCu);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [(UACornerActionManager *)self notifiers];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v12 active]) {
          [v12 setItems:v4];
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  long long v13 = +[UAUserActivityDefaults sharedDefaults];
  [v13 cornerActionItemTimeout];
  -[UACornerActionManager scheduleBestAppDetermination:](self, "scheduleBestAppDetermination:");

  dispatch_group_leave((dispatch_group_t)self->_helpersDispatchGroup);
}

- (BOOL)haveBestAppChangeNotificationClients
{
  objc_super v2 = self;
  BOOL v3 = self->_notifiers;
  objc_sync_enter(v3);
  LOBYTE(v2) = [(NSMutableSet *)v2->_notifiers count] != 0;
  objc_sync_exit(v3);

  return (char)v2;
}

- (BOOL)fetchMoreAppSuggestions
{
  BOOL v3 = +[UAUserActivityDefaults sharedDefaults];
  unsigned int v4 = [v3 multiHandoffEnabled];

  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    unsigned __int8 v5 = [(UACornerActionManager *)self receivers];
    unsigned int v4 = 0;
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          v4 |= [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) fetchMoreAppSuggestions];
          uint64_t v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  return v4 & 1;
}

- (void)processWasRemoved
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  objc_super v2 = [(UACornerActionManager *)self advertisers];
  id v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      unsigned __int8 v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * (void)v5) setShouldAdvertiseAutoPullActivityList:1];
        unsigned __int8 v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)triggerAll
{
  [(UACornerActionManager *)self scheduleUpdatingAdvertisableItems:0.01];
  [(UACornerActionManager *)self triggerUserIdleDetermination:0.03];

  [(UACornerActionManager *)self scheduleBestAppDetermination:0.04];
}

- (void)suspendListeningForBluetooth
{
  id v3 = [(UACornerActionManager *)self bluetoothStatusCallbackIdentifier];

  if (v3)
  {
    uint64_t v4 = [(UACornerActionManager *)self bluetoothStatus];
    unsigned __int8 v5 = [(UACornerActionManager *)self bluetoothStatusCallbackIdentifier];
    [v4 unregisterCallback:v5];

    [(UACornerActionManager *)self setBluetoothStatusCallbackIdentifier:0];
  }
}

- (void)resumeListeningForBluetooth
{
  id v3 = [(UACornerActionManager *)self bluetoothStatus];

  if (!v3)
  {
    uint64_t v4 = +[UABluetoothStatus sharedInstance];
    [(UACornerActionManager *)self setBluetoothStatus:v4];
  }
  unsigned __int8 v5 = [(UACornerActionManager *)self bluetoothStatusCallbackIdentifier];

  if (!v5)
  {
    long long v6 = [(UACornerActionManager *)self bluetoothStatus];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100027B88;
    v8[3] = &unk_1000C5120;
    v8[4] = self;
    long long v7 = [v6 registerCallback:v8];
    [(UACornerActionManager *)self setBluetoothStatusCallbackIdentifier:v7];
  }
}

- (BOOL)suspended
{
  objc_super v2 = self;
  objc_sync_enter(v2);
  BOOL suspended = v2->_suspended;
  objc_sync_exit(v2);

  return suspended;
}

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  if (obj->_suspended != v3)
  {
    obj->_BOOL suspended = v3;
    if (v3) {
      [(UACornerActionManager *)obj suspend];
    }
    else {
      [(UACornerActionManager *)obj resume];
    }
  }
  objc_sync_exit(obj);
}

- (void)suspend
{
  objc_super v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    if (v2->_suspended) {
      CFStringRef v4 = @"YES";
    }
    else {
      CFStringRef v4 = @"NO";
    }
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CornerActionManger:  suspend(was BOOL suspended = %{public}@)", (uint8_t *)&buf, 0xCu);
  }

  if (!v2->_suspended)
  {
    getpid();
    v2->_BOOL suspended = 1;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    unsigned __int8 v5 = [(UACornerActionManager *)v2 advertisers];
    id v6 = [v5 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v46;
      *(void *)&long long v7 = 138543362;
      long long v31 = v7;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v46 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          long long v11 = sub_10000BA18(0);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf) = v31;
            *(void *)((char *)&buf + 4) = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "*** Suspending advertiser %{public}@", (uint8_t *)&buf, 0xCu);
          }

          [v10 suspend];
        }
        id v6 = [v5 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v6);
    }

    long long v12 = [(UACornerActionManager *)v2 nextUpdateAdvertisedItemsScheduler];
    [v12 suspend];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v13 = [(UACornerActionManager *)v2 clients];
    id v14 = [v13 countByEnumeratingWithState:&v41 objects:v54 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v42;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v42 != v15) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * (void)j), "suspend", v31);
        }
        id v14 = [v13 countByEnumeratingWithState:&v41 objects:v54 count:16];
      }
      while (v14);
    }

    long long v17 = [(UACornerActionManager *)v2 nextUserIdleDeterminationScheduler];
    [v17 suspend];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v18 = [(UACornerActionManager *)v2 notifiers];
    id v19 = [v18 countByEnumeratingWithState:&v37 objects:v53 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v38;
      do
      {
        for (k = 0; k != v19; k = (char *)k + 1)
        {
          if (*(void *)v38 != v20) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * (void)k), "suspend", v31);
        }
        id v19 = [v18 countByEnumeratingWithState:&v37 objects:v53 count:16];
      }
      while (v19);
    }

    long long v22 = [(UACornerActionManager *)v2 nextScheduleBestAppDeterminationScheduler];
    [v22 suspend];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v23 = [(UACornerActionManager *)v2 handlers];
    id v24 = [v23 countByEnumeratingWithState:&v33 objects:v52 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v34;
      do
      {
        for (m = 0; m != v24; m = (char *)m + 1)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v23);
          }
          objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * (void)m), "suspend", v31);
        }
        id v24 = [v23 countByEnumeratingWithState:&v33 objects:v52 count:16];
      }
      while (v24);
    }
  }
  if (v2->_managedSettingsChangedNotificationToken)
  {
    long long v27 = sub_10000BA18(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "--- Cancelling MCEffectiveSettingsChangedNotification notification.", (uint8_t *)&buf, 2u);
    }

    notify_cancel(v2->_managedSettingsChangedNotificationToken);
    v2->_managedSettingsChangedNotificationToken = 0;
  }
  if ([(UACornerActionManager *)v2 systemPreferenceChangedToken]) {
    notify_suspend([(UACornerActionManager *)v2 systemPreferenceChangedToken]);
  }
  BOOL v28 = +[NSDistributedNotificationCenter defaultCenter];
  [v28 removeObserver:v2 name:@"com.apple.screensaver.didstart" object:0];
  [v28 removeObserver:v2 name:@"com.apple.screensaver.didstop" object:0];
  notify_cancel([(UACornerActionManager *)v2 uiLockStatusToken]);
  [(UACornerActionManager *)v2 setUiLockStatusToken:0];
  SBSEventObserverStopObservingAllEvents();
  if (!byte_1000E6738)
  {
    int v29 = MKBDeviceUnlockedSinceBoot();
    byte_1000E6738 = v29 != 0;
    if (!v29)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v50 = 0x2020000000;
      v51[0] = 0;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000283B4;
      handler[3] = &unk_1000C5148;
      handler[4] = v2;
      handler[5] = &buf;
      notify_register_dispatch(kMobileKeyBagLockStatusNotifyToken, v51, (dispatch_queue_t)&_dispatch_main_q, handler);
      _Block_object_dispose(&buf, 8);
    }
  }
  [(UACornerActionManager *)v2 suspendListeningForBluetooth];
  int v30 = [(UACornerActionManager *)v2 userIdleTracker];
  [v30 setEnabled:0];

  objc_sync_exit(v2);
  dispatch_group_wait((dispatch_group_t)v2->_helpersDispatchGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)resume
{
  objc_super v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CornerActionManger:  resume", buf, 2u);
  }

  if (v2->_suspended)
  {
    getpid();
    v2->_BOOL suspended = 0;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    CFStringRef v4 = [(UACornerActionManager *)v2 handlers];
    id v5 = [v4 countByEnumeratingWithState:&v75 objects:v84 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v76;
      do
      {
        long long v7 = 0;
        do
        {
          if (*(void *)v76 != v6) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v75 + 1) + 8 * (void)v7) resume];
          long long v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v4 countByEnumeratingWithState:&v75 objects:v84 count:16];
      }
      while (v5);
    }

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    uint64_t v8 = [(UACornerActionManager *)v2 advertisers];
    id v9 = [v8 countByEnumeratingWithState:&v71 objects:v83 count:16];
    if (v9)
    {
      uint64_t v11 = *(void *)v72;
      *(void *)&long long v10 = 138543362;
      long long v51 = v10;
      do
      {
        long long v12 = 0;
        do
        {
          if (*(void *)v72 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v71 + 1) + 8 * (void)v12);
          id v14 = sub_10000BA18(0);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = v51;
            *(void *)&uint8_t buf[4] = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "*** Resuming advertiser %{public}@", buf, 0xCu);
          }

          [v13 resume];
          long long v12 = (char *)v12 + 1;
        }
        while (v9 != v12);
        id v9 = [v8 countByEnumeratingWithState:&v71 objects:v83 count:16];
      }
      while (v9);
    }

    uint64_t v15 = [(UACornerActionManager *)v2 nextUpdateAdvertisedItemsScheduler];
    [v15 resume];

    long long v16 = [(UACornerActionManager *)v2 nextUpdateAdvertisedItemsScheduler];
    [v16 scheduleNext:0.1];

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v17 = [(UACornerActionManager *)v2 receivers];
    id v18 = [v17 countByEnumeratingWithState:&v67 objects:v81 count:16];
    if (v18)
    {
      uint64_t v20 = *(void *)v68;
      *(void *)&long long v19 = 138543362;
      long long v51 = v19;
      do
      {
        long long v21 = 0;
        do
        {
          if (*(void *)v68 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = *(void **)(*((void *)&v67 + 1) + 8 * (void)v21);
          long long v23 = sub_10000BA18(0);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = v51;
            *(void *)&uint8_t buf[4] = v22;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "*** Resuming receiver %{public}@", buf, 0xCu);
          }

          [v22 resume];
          long long v21 = (char *)v21 + 1;
        }
        while (v18 != v21);
        id v18 = [v17 countByEnumeratingWithState:&v67 objects:v81 count:16];
      }
      while (v18);
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v24 = [(UACornerActionManager *)v2 clients];
    id v25 = [v24 countByEnumeratingWithState:&v63 objects:v80 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v64;
      do
      {
        long long v27 = 0;
        do
        {
          if (*(void *)v64 != v26) {
            objc_enumerationMutation(v24);
          }
          objc_msgSend(*(id *)(*((void *)&v63 + 1) + 8 * (void)v27), "resume", v51);
          long long v27 = (char *)v27 + 1;
        }
        while (v25 != v27);
        id v25 = [v24 countByEnumeratingWithState:&v63 objects:v80 count:16];
      }
      while (v25);
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    BOOL v28 = [(UACornerActionManager *)v2 notifiers];
    id v29 = [v28 countByEnumeratingWithState:&v59 objects:v79 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v60;
      do
      {
        long long v31 = 0;
        do
        {
          if (*(void *)v60 != v30) {
            objc_enumerationMutation(v28);
          }
          objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * (void)v31), "resume", v51);
          long long v31 = (char *)v31 + 1;
        }
        while (v29 != v31);
        id v29 = [v28 countByEnumeratingWithState:&v59 objects:v79 count:16];
      }
      while (v29);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_100028F10, @"com.apple.language.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    if (![(UACornerActionManager *)v2 systemPreferenceChangedToken])
    {
      long long v33 = [(UACornerActionManager *)v2 mainDispatchQ];
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100028F74;
      handler[3] = &unk_1000C5170;
      handler[4] = v2;
      notify_register_dispatch(UAUserActivityManagerActivityContinuationIsEnabledChangedNotification, &v2->_systemPreferenceChangedToken, v33, handler);
    }
    notify_resume([(UACornerActionManager *)v2 systemPreferenceChangedToken]);
    int out_token = 0;
    long long v34 = [(UACornerActionManager *)v2 mainDispatchQ];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100028FEC;
    v56[3] = &unk_1000C5170;
    void v56[4] = v2;
    notify_register_dispatch(kSBSLockStateNotifyKey, &out_token, v34, v56);

    [(UACornerActionManager *)v2 setUiLockStatusToken:out_token];
    if (![(UACornerActionManager *)v2 backlightLevelToken])
    {
      long long v35 = [(UACornerActionManager *)v2 mainDispatchQ];
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_100029080;
      v55[3] = &unk_1000C5170;
      v55[4] = v2;
      notify_register_dispatch("com.apple.backboardd.backlight.changed", &v2->_backlightLevelToken, v35, v55);

      *(void *)long long buf = 0;
      notify_get_state([(UACornerActionManager *)v2 backlightLevelToken], (uint64_t *)buf);
      v2->_backlightOn = *(void *)buf != 0;
    }
    long long v36 = +[FBSDisplayLayoutMonitorConfiguration configurationForContinuityDisplay];
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_1000291D0;
    v54[3] = &unk_1000C5198;
    void v54[4] = v2;
    [v36 setTransitionHandler:v54];
    long long v37 = sub_10000BA18(0);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Installed Mirroring Monitor", buf, 2u);
    }

    uint64_t v38 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:v36];
    mirroringMonitor = v2->_mirroringMonitor;
    v2->_mirroringMonitor = (FBSDisplayLayoutMonitor *)v38;

    if (!v2->_managedSettingsChangedNotificationToken)
    {
      long long v40 = (const char *)[MCEffectiveSettingsChangedNotification cStringUsingEncoding:4];
      long long v41 = dispatch_get_global_queue(2, 0);
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_1000293A0;
      v53[3] = &unk_1000C5170;
      v53[4] = v2;
      notify_register_dispatch(v40, &v2->_managedSettingsChangedNotificationToken, v41, v53);
    }
    [(UACornerActionManager *)v2 resumeListeningForBluetooth];
    long long v42 = [(UACornerActionManager *)v2 userIdleTracker];
    [v42 setEnabled:1];

    long long v43 = [(UACornerActionManager *)v2 nextScheduleBestAppDeterminationScheduler];
    [v43 reset];

    long long v44 = [(UACornerActionManager *)v2 nextScheduleBestAppDeterminationScheduler];
    [v44 resume];

    long long v45 = [(UACornerActionManager *)v2 nextScheduleBestAppDeterminationScheduler];
    [v45 scheduleNext:0.1];

    [(UACornerActionManager *)v2 setSystemHasSuspendedAdvertisements:1];
    [(UACornerActionManager *)v2 setSystemHasSuspendedAdvertisements:0];
    long long v46 = [(UACornerActionManager *)v2 nextUserIdleDeterminationScheduler];
    [v46 reset];

    long long v47 = [(UACornerActionManager *)v2 nextUserIdleDeterminationScheduler];
    [v47 resume];

    long long v48 = [(UACornerActionManager *)v2 nextUserIdleDeterminationScheduler];
    [v48 scheduleNext:0.1];

    v49 = [(UACornerActionManager *)v2 userIdleTracker];
    [v49 setEnabled:1];
  }
  objc_sync_exit(v2);

  uint64_t v50 = [(UACornerActionManager *)v2 mainDispatchQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000294F8;
  block[3] = &unk_1000C4D40;
  block[4] = v2;
  dispatch_async(v50, block);
}

- (void)terminate
{
}

- (BOOL)userActive
{
  objc_super v2 = self;
  objc_sync_enter(v2);
  BOOL userActive = v2->_userActive;
  objc_sync_exit(v2);

  return userActive;
}

- (void)setUserActive:(BOOL)a3
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_BOOL userActive = a3;
  objc_sync_exit(obj);
}

- (void)updateUserActiveState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    if (self->_userActive) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)long long buf = 138543618;
    CFStringRef v25 = v7;
    __int16 v26 = 2114;
    CFStringRef v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "setUserIsActive: %{public}@ (was %{public}@)", buf, 0x16u);
  }

  if ([(UACornerActionManager *)self userActive] != v3)
  {
    self->_BOOL userActive = v3;
    uint64_t v8 = sub_10000BA18(0);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v9)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "userInactivePowerAssertion, setting to NO, so removing power assertion & triggering idle determination.", buf, 2u);
      }

      [(UACornerActionManager *)self setUserInactivePowerAssertion:0];
      [(UACornerActionManager *)self triggerUserIdleDetermination];
      [(UACornerActionManager *)self scheduleUpdatingAdvertisableItems];
    }
    else
    {
      if (v9)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "setUserIsActive, setting to NO, so creating assertion if warranted.", buf, 2u);
      }

      long long v10 = [(UACornerActionManager *)self advertisers];
      uint64_t v11 = [(UACornerActionManager *)self clients];
      long long v12 = +[UAUserActivityDefaults sharedDefaults];
      [v12 userIdleRemovalDelay];
      double v14 = v13;
      uint64_t v15 = +[UAUserActivityDefaults sharedDefaults];
      [v15 userIdleRemovalDelay];
      double v17 = sub_100029948(v10, v11, v14, v16);

      id v18 = sub_10000BA18(0);
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
      if (v17 <= 0.0)
      {
        if (v19)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "setUserIsActive, no need for assertion, triggering updateAdvertisableItems", buf, 2u);
        }

        [(UACornerActionManager *)self setUserInactivePowerAssertion:0];
        [(UACornerActionManager *)self scheduleUpdatingAdvertisableItems];
      }
      else
      {
        if (v19)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "setUserIsActive, creating assertion because we are advertising something", buf, 2u);
        }

        uint64_t v20 = [UATimedPowerAssertions alloc];
        long long v21 = [(UACornerActionManager *)self mainDispatchQ];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100029C58;
        v23[3] = &unk_1000C5040;
        v23[4] = self;
        long long v22 = [(UATimedPowerAssertions *)v20 initWithName:@"userInactivePowerAssertion" delta:0 activityUUID:v21 queue:v23 runAtCompletion:v17];
        [(UACornerActionManager *)self setUserInactivePowerAssertion:v22];
      }
    }
  }
}

- (void)updateScreenDimStateState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    if (self->_screenDimmed) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)long long buf = 138543618;
    CFStringRef v27 = v7;
    __int16 v28 = 2114;
    CFStringRef v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "updateScreenDimState: %{public}@ (was %{public}@)", buf, 0x16u);
  }

  if ([(UACornerActionManager *)self screenDimmed] != v3)
  {
    self->_screenDimmed = v3;
    uint64_t v8 = "active";
    if (v3) {
      uint64_t v8 = "DIMMED";
    }
    BOOL v9 = +[NSString stringWithFormat:@"SCREEN: %s", v8];
    +[ActivityManagerDebuggingManager appendRecentAction:v9];

    long long v10 = sub_10000BA18(0);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v11)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "updateScreenDimmedState, setting to YES, so creating assertion if needed.", buf, 2u);
      }

      long long v12 = [(UACornerActionManager *)self advertisers];
      double v13 = [(UACornerActionManager *)self clients];
      double v14 = +[UAUserActivityDefaults sharedDefaults];
      [v14 screenDimDelayBeforeRemovingAdvertisements];
      double v16 = v15;
      double v17 = +[UAUserActivityDefaults sharedDefaults];
      [v17 screenDimDelayBeforeRemovingPasteboardAdvertisement];
      double v19 = sub_100029948(v12, v13, v16, v18);

      uint64_t v20 = sub_10000BA18(0);
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
      if (v19 <= 0.0)
      {
        if (v21)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "updateScreenDimmedState, no need for assertion, triggering state updates", buf, 2u);
        }

        [(UACornerActionManager *)self triggerUserIdleDetermination];
        [(UACornerActionManager *)self scheduleUpdatingAdvertisableItems];
      }
      else
      {
        if (v21)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "updateScreenDimmedState, creating assertion", buf, 2u);
        }

        long long v22 = [UATimedPowerAssertions alloc];
        long long v23 = [(UACornerActionManager *)self mainDispatchQ];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_10002A11C;
        v25[3] = &unk_1000C5040;
        v25[4] = self;
        id v24 = [(UATimedPowerAssertions *)v22 initWithName:@"screenDimmedPowerAssertion" delta:0 activityUUID:v23 queue:v25 runAtCompletion:v19];
        [(UACornerActionManager *)self setScreenDimmedPowerAssertion:v24];
      }
    }
    else
    {
      if (v11)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "updateUIDeviceLockedState, setting to NO, so removing power assertion & triggering idle determination.", buf, 2u);
      }

      [(UACornerActionManager *)self setScreenDimmedPowerAssertion:0];
      [(UACornerActionManager *)self triggerUserIdleDetermination];
      [(UACornerActionManager *)self scheduleUpdatingAdvertisableItems];
    }
  }
}

- (void)updateUIDeviceLockedState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    if (self->_deviceUILocked) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)long long buf = 138543618;
    double v27 = *(double *)&v7;
    __int16 v28 = 2114;
    CFStringRef v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "updateUIDeviceLockedState: %{public}@ (was %{public}@)", buf, 0x16u);
  }

  if ([(UACornerActionManager *)self deviceUILocked] != v3)
  {
    self->_deviceUILocked = v3;
    uint64_t v8 = "unlocked";
    if (v3) {
      uint64_t v8 = "LOCKED";
    }
    BOOL v9 = +[NSString stringWithFormat:@"DEVICELOCK: %s", v8];
    +[ActivityManagerDebuggingManager appendRecentAction:v9];

    long long v10 = sub_10000BA18(0);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v11)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "updateUIDeviceLockedState, setting to YES, so creating assertion if we have an advertisement.", buf, 2u);
      }

      long long v12 = [(UACornerActionManager *)self advertisers];
      double v13 = [(UACornerActionManager *)self clients];
      double v14 = +[UAUserActivityDefaults sharedDefaults];
      [v14 deviceLockDelayBeforeRemovingHandoffAdvertisement];
      double v16 = v15;
      double v17 = +[UAUserActivityDefaults sharedDefaults];
      [v17 deviceLockDelayBeforeRemovingPasteboardAdvertisement];
      double v19 = sub_100029948(v12, v13, v16, v18);

      uint64_t v20 = sub_10000BA18(0);
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
      if (v19 <= 0.0)
      {
        if (v21)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "updateUIDeviceLockedState, no need for assertion, triggering state updates", buf, 2u);
        }

        [(UACornerActionManager *)self triggerUserIdleDetermination];
        [(UACornerActionManager *)self scheduleUpdatingAdvertisableItems];
      }
      else
      {
        if (v21)
        {
          *(_DWORD *)long long buf = 134217984;
          double v27 = v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Creating power assertion of %g seconds, to keep advertisement alive.", buf, 0xCu);
        }

        long long v22 = [UATimedPowerAssertions alloc];
        long long v23 = [(UACornerActionManager *)self mainDispatchQ];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_10002A5E4;
        v25[3] = &unk_1000C5040;
        v25[4] = self;
        id v24 = [(UATimedPowerAssertions *)v22 initWithName:@"deviceUILockAssertion" delta:0 activityUUID:v23 queue:v25 runAtCompletion:v19];
        [(UACornerActionManager *)self setDeviceUILockedPowerAssertion:v24];
      }
    }
    else
    {
      if (v11)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "updateUIDeviceLockedState, device is unlocked, so removing power assertion & triggering advertising & idle determination.", buf, 2u);
      }

      [(UACornerActionManager *)self setDeviceUILockedPowerAssertion:0];
      [(UACornerActionManager *)self triggerAll];
    }
  }
}

- (id)dictionaryForAdvertisableItem:(id)a3
{
  return 0;
}

- (id)dictionaryForCornerActionItem:(id)a3
{
  return 0;
}

- (id)debuggingInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  BOOL v4 = [(UACornerActionManager *)self weAreAdvertisingAnItem];
  if (v4)
  {
    id v5 = [(UACornerActionManager *)self uaAdvertisableItemsInOrder];
    CFStringRef v6 = [v5 firstObject];
    CFStringRef v7 = [(UACornerActionManager *)self dictionaryForAdvertisableItem:v6];
    [v3 setObject:v7 forKey:@"kLSUserActivityDebuggingInfoCurrentAdvertisedItem"];

    uint64_t v8 = sub_100003070(0);
    [v3 setObject:v8 forKey:@"kLSUserActivityDebuggingInfoLastAdvertisedBytes"];
  }
  BOOL v9 = +[NSNumber numberWithBool:v4];
  [v3 setObject:v9 forKey:@"kLSUserActivityDebuggingInfoAdvertising"];

  id v10 = [v3 copy];

  return v10;
}

- (id)dynamicUserActivitiesString
{
  id v2 = objc_alloc((Class)NSUserDefaults);
  uint64_t v3 = kUADynamicUserActivitesPreferences;
  id v4 = [v2 initWithSuiteName:kUADynamicUserActivitesPreferences];
  id v5 = [v4 objectForKey:kUADynamicUserActivitiesKey];
  CFStringRef v6 = +[NSString stringWithFormat:@"Dynamic User Activities: (domain=%@) %@", v3, v5];

  return v6;
}

- (id)shortStatusString
{
  uint64_t v3 = +[NSMutableString string];
  pid_t v4 = getpid();
  uid_t v5 = geteuid();
  CFStringRef v6 = +[NSDate date];
  [v6 timeIntervalSinceDate:self->_creationTime];
  uint64_t v8 = sub_10007C2C0(v7);
  id v9 = objc_alloc_init((Class)NSDate);
  if (qword_1000E6780 != -1) {
    dispatch_once(&qword_1000E6780, &stru_1000C52D8);
  }
  [v3 appendFormat:@"Manager status: pid=%lld, uid=%lld, uptime=%@ %@ (Version %s, built %s %s %s)\n", v4, v5, v8, v9, &unk_1000E6739, "Nov 10 2024", "03:52:27", ""];

  long long v31 = [(UACornerActionManager *)self advertisers];
  if ([v31 count])
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v10 = [(UACornerActionManager *)self advertisers];
    BOOL v11 = [v10 allObjects];
    long long v12 = [v11 sortedArrayUsingComparator:&stru_1000C51D8];

    id v13 = [v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v37;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v12);
          }
          double v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if ([v16 advertising])
          {
            double v17 = [v16 statusString];
            sub_10002AE30(v3, v17, @"ADVERTISING:", @"  ");
          }
        }
        id v13 = [v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v13);
    }
  }
  else
  {
    [v3 appendString:@"*** No UAAdvertisers defined at present, so no advertising is taking place.\n\n"];
  }
  double v18 = [(UACornerActionManager *)self receivers];
  if ((unint64_t)[v18 count] < 2)
  {
    [v3 appendString:@"No UAReceivers defined at present, so no activities will be received.\n"];
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v30 = v18;
    double v19 = [v18 allObjects];
    uint64_t v20 = [v19 sortedArrayUsingComparator:&stru_1000C51F8];

    id v21 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v33;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v20);
          }
          id v24 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
          CFStringRef v25 = [v24 receivedItems];
          BOOL v26 = [v25 count] == 0;

          if (!v26)
          {
            double v27 = [v24 statusString];
            sub_10002AE30(v3, v27, @"RECEIVING:", @"  ");
          }
        }
        id v21 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v21);
    }

    double v18 = v30;
  }
  id v28 = [v3 copy];

  return v28;
}

- (id)statusString
{
  id v2 = [(UACornerActionManager *)self debugManager];
  [v2 currentPerfTime];
  double v4 = v3;

  id v150 = +[NSMutableString string];
  pid_t v5 = getpid();
  uid_t v6 = geteuid();
  double v7 = +[NSDate date];
  uint64_t v8 = self;
  [v7 timeIntervalSinceDate:self->_creationTime];
  id v10 = sub_10007C2C0(v9);
  id v11 = objc_alloc_init((Class)NSDate);
  long long v12 = sub_10007C2C0(v4 - *(double *)&qword_1000E6730);
  if (qword_1000E6780 != -1) {
    dispatch_once(&qword_1000E6780, &stru_1000C52D8);
  }
  [v150 appendFormat:@"Manager status: pid=%lld, uid=%lld, uptime=%@ %@ runtime=%@ (Version %s, built %s %s %s)\n", v5, v6, v10, v11, v12, &unk_1000E6739, "Nov 10 2024", "03:52:27", ""];

  v140 = [(UACornerActionManager *)self advertisers];
  if ([v140 count])
  {
    id v13 = [(UACornerActionManager *)self advertisers];
    id v14 = [v13 count];
    if ([(UACornerActionManager *)self advertisingSuspended]) {
      CFStringRef v15 = @"(SUSPENDED)";
    }
    else {
      CFStringRef v15 = &stru_1000C6800;
    }
    double v16 = [(UACornerActionManager *)self nextUpdateAdvertisedItemsScheduler];
    double v17 = [v16 nextRunTimeString];
    [v150 appendFormat:@"### ADVERTISERS (%ld total) %@ nextCheck=%@\n", v14, v15, v17];

    long long v189 = 0u;
    long long v190 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    double v18 = [(UACornerActionManager *)self advertisers];
    double v19 = [v18 allObjects];
    uint64_t v20 = [v19 sortedArrayUsingComparator:&stru_1000C5218];

    id v21 = [v20 countByEnumeratingWithState:&v187 objects:v200 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v188;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v188 != v22) {
            objc_enumerationMutation(v20);
          }
          id v24 = [*(id *)(*((void *)&v187 + 1) + 8 * i) statusString];
          sub_10002AE30(v150, v24, @" +", @"  ");
        }
        id v21 = [v20 countByEnumeratingWithState:&v187 objects:v200 count:16];
      }
      while (v21);
    }

    CFStringRef v25 = @"\n";
    uint64_t v8 = self;
  }
  else
  {
    CFStringRef v25 = @"*** No UAAdvertisers defined at present, so no advertising is taking place.\n\n";
  }
  [v150 appendString:v25];
  v142 = [(UACornerActionManager *)v8 receivers];
  if ((unint64_t)[v142 count] >= 2)
  {
    BOOL v26 = [(UACornerActionManager *)v8 receivers];
    objc_msgSend(v150, "appendFormat:", @"### RECEIVERS (%ld total)\n", objc_msgSend(v26, "count"));

    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    double v27 = [v142 allObjects];
    id v28 = [v27 sortedArrayUsingComparator:&stru_1000C5238];

    id v29 = [v28 countByEnumeratingWithState:&v183 objects:v199 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v184;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v184 != v30) {
            objc_enumerationMutation(v28);
          }
          long long v32 = [*(id *)(*((void *)&v183 + 1) + 8 * (void)j) statusString];
          sub_10002AE30(v150, v32, @" +", @"  ");
        }
        id v29 = [v28 countByEnumeratingWithState:&v183 objects:v199 count:16];
      }
      while (v29);
    }
    goto LABEL_27;
  }
  if ([v142 count] == (id)1)
  {
    id v28 = [(UACornerActionManager *)v8 receivers];
    long long v33 = [v28 anyObject];
    long long v34 = [v33 statusString];
    sub_10002AE30(v150, v34, @" +", @"  ");

LABEL_27:
    uint64_t v8 = self;
    goto LABEL_29;
  }
  [v150 appendString:@"No UAReceivers defined at present, so no activities will be received.\n"];
LABEL_29:
  uint64_t v35 = +[SharingBTLESuggestedItem statusString];
  v139 = (void *)v35;
  if (v35) {
    [v150 appendString:v35];
  }
  long long v36 = [(UACornerActionManager *)v8 advertiseableItems];
  long long v37 = [v36 allObjects];
  v143 = [v37 sortedArrayUsingComparator:&stru_1000C5258];

  long long v38 = self;
  if ([v143 count])
  {
    [v150 appendString:@"\n### AdvertiseableItems(that might be broadcast to other machines/remind me later)\n"];
    v145 = +[NSMutableArray array];
    long long v181 = 0u;
    long long v182 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    id obj = v143;
    id v39 = [obj countByEnumeratingWithState:&v179 objects:v198 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v180;
      do
      {
        for (k = 0; k != v39; k = (char *)k + 1)
        {
          if (*(void *)v180 != v40) {
            objc_enumerationMutation(obj);
          }
          long long v42 = *(void **)(*((void *)&v179 + 1) + 8 * (void)k);
          if (sub_10000AA28((uint64_t)[v42 type]))
          {
            long long v177 = 0u;
            long long v178 = 0u;
            long long v175 = 0u;
            long long v176 = 0u;
            long long v43 = [(UACornerActionManager *)self advertisers];
            id v44 = [v43 countByEnumeratingWithState:&v175 objects:v197 count:16];
            if (v44)
            {
              uint64_t v45 = *(void *)v176;
              while (2)
              {
                for (m = 0; m != v44; m = (char *)m + 1)
                {
                  if (*(void *)v176 != v45) {
                    objc_enumerationMutation(v43);
                  }
                  long long v47 = *(void **)(*((void *)&v175 + 1) + 8 * (void)m);
                  if ([v47 active])
                  {
                    long long v48 = [v47 advertisingItems];
                    unsigned __int8 v49 = [v48 containsObject:v42];

                    if (v49)
                    {
                      int v50 = 1;
                      goto LABEL_49;
                    }
                  }
                }
                id v44 = [v43 countByEnumeratingWithState:&v175 objects:v197 count:16];
                if (v44) {
                  continue;
                }
                break;
              }
            }
            int v50 = 0;
LABEL_49:

            long long v51 = [v42 options];
            v52 = [v51 objectForKeyedSubscript:@"UAUserActivityAdvertiserHasMoreActivities"];
            unsigned int v53 = [v52 BOOLValue];

            uint64_t v54 = [v42 statusString];
            v55 = (void *)v54;
            CFStringRef v56 = &stru_1000C6800;
            CFStringRef v57 = @"(more items available) ";
            if (!v53) {
              CFStringRef v57 = &stru_1000C6800;
            }
            if (v50) {
              CFStringRef v56 = @"(advertised) ";
            }
            v58 = +[NSString stringWithFormat:@"- %@%@%@\n", v56, v57, v54];

            if (v50) {
              id v59 = 0;
            }
            else {
              id v59 = [v145 count];
            }
            [v145 insertObject:v58 atIndex:v59];
          }
        }
        id v39 = [obj countByEnumeratingWithState:&v179 objects:v198 count:16];
      }
      while (v39);
    }

    long long v173 = 0u;
    long long v174 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    id obja = v145;
    id v60 = [obja countByEnumeratingWithState:&v171 objects:v196 count:16];
    if (v60)
    {
      uint64_t v61 = *(void *)v172;
      do
      {
        for (n = 0; n != v60; n = (char *)n + 1)
        {
          if (*(void *)v172 != v61) {
            objc_enumerationMutation(obja);
          }
          [v150 appendString:*(void *)(*((void *)&v171 + 1) + 8 * (void)n)];
        }
        id v60 = [obja countByEnumeratingWithState:&v171 objects:v196 count:16];
      }
      while (v60);
    }

    long long v38 = self;
  }
  v141 = [(UACornerActionManager *)v38 cornerActionItems];
  if ([v141 count])
  {
    [v150 appendString:@"\nCornerActionItems (potential items to appear on this device as resumable from other devices)\n"];
    long long v169 = 0u;
    long long v170 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    long long v63 = [v141 allObjects];
    long long v64 = [v63 sortedArrayUsingComparator:&stru_1000C5278];

    id v65 = [v64 countByEnumeratingWithState:&v167 objects:v195 count:16];
    if (v65)
    {
      uint64_t v66 = *(void *)v168;
      do
      {
        for (ii = 0; ii != v65; ii = (char *)ii + 1)
        {
          if (*(void *)v168 != v66) {
            objc_enumerationMutation(v64);
          }
          long long v68 = [*(id *)(*((void *)&v167 + 1) + 8 * (void)ii) statusString];
          long long v69 = +[NSString stringWithFormat:@"- %@\n", v68];
          [v150 appendString:v69];
        }
        id v65 = [v64 countByEnumeratingWithState:&v167 objects:v195 count:16];
      }
      while (v65);
    }

    long long v38 = self;
  }
  long long v70 = [(UACornerActionManager *)v38 pinnedUserActivityInfoItem];
  BOOL v71 = v70 == 0;

  if (!v71)
  {
    [v150 appendString:@"\nPinned Activity Info\n"];
    long long v72 = [(UACornerActionManager *)self pinnedUserActivityInfoItem];
    long long v73 = [v72 description];
    long long v74 = +[NSString stringWithFormat:@"- %@\n", v73];
    [v150 appendString:v74];
  }
  long long v75 = [(UACornerActionManager *)self notifiers];
  BOOL v76 = [v75 count] == 0;

  long long v77 = self;
  if (!v76)
  {
    long long v78 = [(UACornerActionManager *)self notifiers];
    id v79 = [v78 count];
    long long v80 = [(UACornerActionManager *)self nextScheduleBestAppDeterminationScheduler];
    long long v81 = [v80 nextRunTimeString];
    [v150 appendFormat:@"\n### NOTIFIERS (%ld total) nextCheck=%@\n", v79, v81];

    long long v165 = 0u;
    long long v166 = 0u;
    long long v163 = 0u;
    long long v164 = 0u;
    long long v82 = [(UACornerActionManager *)self notifiers];
    long long v83 = [v82 allObjects];
    v84 = [v83 sortedArrayUsingComparator:&stru_1000C5298];

    id v85 = [v84 countByEnumeratingWithState:&v163 objects:v194 count:16];
    if (v85)
    {
      uint64_t v86 = *(void *)v164;
      do
      {
        for (jj = 0; jj != v85; jj = (char *)jj + 1)
        {
          if (*(void *)v164 != v86) {
            objc_enumerationMutation(v84);
          }
          long long v88 = [*(id *)(*((void *)&v163 + 1) + 8 * (void)jj) statusString];
          sub_10002AE30(v150, v88, @" + ", @"   ");
        }
        id v85 = [v84 countByEnumeratingWithState:&v163 objects:v194 count:16];
      }
      while (v85);
    }

    [v150 appendString:@"\n"];
    long long v77 = self;
  }
  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  long long v89 = [(UACornerActionManager *)v77 clients];
  long long v90 = [v89 allObjects];
  long long v91 = [v90 sortedArrayUsingComparator:&stru_1000C52B8];

  id v92 = [v91 countByEnumeratingWithState:&v159 objects:v193 count:16];
  if (v92)
  {
    uint64_t v93 = *(void *)v160;
    do
    {
      for (kk = 0; kk != v92; kk = (char *)kk + 1)
      {
        if (*(void *)v160 != v93) {
          objc_enumerationMutation(v91);
        }
        id v95 = [*(id *)(*((void *)&v159 + 1) + 8 * (void)kk) statusString];
        if (v95) {
          [v150 appendString:v95];
        }
      }
      id v92 = [v91 countByEnumeratingWithState:&v159 objects:v193 count:16];
    }
    while (v92);
  }

  __int16 v96 = self;
  id objb = [(UACornerActionManager *)self handlers];
  if ([objb count])
  {
    objc_msgSend(v150, "appendFormat:", @"\n### HANDLERS: (%ld total)\n", objc_msgSend(objb, "count"));
    long long v157 = 0u;
    long long v158 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    id v97 = objb;
    id v98 = [v97 countByEnumeratingWithState:&v155 objects:v192 count:16];
    if (v98)
    {
      uint64_t v99 = *(void *)v156;
      do
      {
        for (mm = 0; mm != v98; mm = (char *)mm + 1)
        {
          if (*(void *)v156 != v99) {
            objc_enumerationMutation(v97);
          }
          v101 = [*(id *)(*((void *)&v155 + 1) + 8 * (void)mm) statusString];
          if (v101) {
            sub_10002AE30(v150, v101, @"-", 0);
          }
        }
        id v98 = [v97 countByEnumeratingWithState:&v155 objects:v192 count:16];
      }
      while (v98);
    }

    __int16 v96 = self;
  }
  v137 = [(UACornerActionManager *)v96 userIdleTracker];
  if ([v137 active]) {
    v102 = "";
  }
  else {
    v102 = " userIdle";
  }
  if ([(UACornerActionManager *)v96 systemHasSuspendedAdvertisements]) {
    v103 = "YES";
  }
  else {
    v103 = "NO";
  }
  unsigned int v104 = [(UACornerActionManager *)v96 screenDimmed];
  v105 = " dimmed:YES";
  if (!v104) {
    v105 = "";
  }
  v138 = v105;
  unsigned int v106 = [(UACornerActionManager *)v96 deviceUILocked];
  v107 = " locked:YES";
  if (!v106) {
    v107 = "";
  }
  v136 = v107;
  v135 = [(UACornerActionManager *)v96 nextUpdateAdvertisedItemsScheduler];
  id v108 = [v135 runCount];
  v134 = [(UACornerActionManager *)v96 nextUpdateAdvertisedItemsScheduler];
  v146 = sub_10007C214((unint64_t)[v134 nextTime]);
  v133 = [(UACornerActionManager *)v96 nextUserIdleDeterminationScheduler];
  id v109 = [v133 runCount];
  v110 = [(UACornerActionManager *)v96 nextUserIdleDeterminationScheduler];
  v111 = sub_10007C214((unint64_t)[v110 nextTime]);
  v112 = [(UACornerActionManager *)v96 nextScheduleBestAppDeterminationScheduler];
  v113 = v102;
  id v114 = [v112 runCount];
  v115 = [(UACornerActionManager *)self nextScheduleBestAppDeterminationScheduler];
  v116 = sub_10007C214((unint64_t)[v115 nextTime]);
  [v150 appendFormat:@"\nIdle determination:%s suspended=%s%s%s%s pick=%ld/%@ idle=%ld/%@ bestApp=%ld/%@\n", v113, v103, v138, v136, "", v108, v146, v109, v111, v114, v116];

  v117 = [(UACornerActionManager *)self debugManager];
  v118 = [v117 perfSummaryString];

  if (v118) {
    [v150 appendFormat:@"PERF:%@\n", v118];
  }
  uint64_t v119 = +[UATimedPowerAssertions statusString];
  v120 = (void *)v119;
  if (v119) {
    [v150 appendFormat:@"%@\n", v119];
  }
  [v150 appendString:@"\n"];
  +[ActivityManagerDebuggingManager actionStrs:5 maximumInternal:0 clear:30.0];
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  id v121 = (id)objc_claimAutoreleasedReturnValue();
  id v122 = [v121 countByEnumeratingWithState:&v151 objects:v191 count:16];
  if (v122)
  {
    uint64_t v123 = *(void *)v152;
    do
    {
      for (nn = 0; nn != v122; nn = (char *)nn + 1)
      {
        if (*(void *)v152 != v123) {
          objc_enumerationMutation(v121);
        }
        [v150 appendFormat:@" - %@\n", *(void *)(*((void *)&v151 + 1) + 8 * (void)nn)];
      }
      id v122 = [v121 countByEnumeratingWithState:&v151 objects:v191 count:16];
    }
    while (v122);
  }

  v125 = +[UAUserActivityDefaults sharedDefaults];
  v126 = [v125 statusString];
  [v150 appendString:v126];

  v127 = [(UACornerActionManager *)self pasteboardController];
  v128 = [v127 localPBStatus];
  [v150 appendFormat:@"\n%@\n", v128];

  v129 = NSTemporaryDirectory();
  [v150 appendFormat:@"NSTemporaryDirectory=%@\n", v129];

  v130 = [(UACornerActionManager *)self debugManager];
  [v130 currentPerfTime];
  *(double *)&qword_1000E6730 = v131 - v4 + *(double *)&qword_1000E6730;

  return v150;
}

- (void)addAdvertiser:(id)a3
{
  id v4 = a3;
  pid_t v5 = self;
  objc_sync_enter(v5);
  if (([(NSMutableSet *)v5->_advertisers containsObject:v4] & 1) == 0)
  {
    uid_t v6 = sub_10000BA18(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "addAdvertiser(%{public}@)", (uint8_t *)&v8, 0xCu);
    }

    [(NSMutableSet *)v5->_advertisers addObject:v4];
    uint64_t v7 = [(UACornerActionManager *)v5 suspended]
      || [(UACornerActionManager *)v5 advertisingSuspended];
    [v4 setSuspended:v7];
    [(UACornerActionManager *)v5 scheduleUpdatingAdvertisableItems];
  }
  objc_sync_exit(v5);
}

- (void)removeAdvertiser:(id)a3
{
  id v4 = a3;
  pid_t v5 = self;
  objc_sync_enter(v5);
  if (v4 && [(NSMutableSet *)v5->_advertisers containsObject:v4])
  {
    uid_t v6 = sub_10000BA18(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138543362;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "removeAdvertiser(%{public}@)", (uint8_t *)&v7, 0xCu);
    }

    [(NSMutableSet *)v5->_advertisers removeObject:v4];
    [(UACornerActionManager *)v5 scheduleUpdatingAdvertisableItems];
  }
  objc_sync_exit(v5);
}

- (NSSet)receivers
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableSet *)v2->_receivers copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)addReceiver:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (([(NSMutableSet *)v4->_receivers containsObject:v6] & 1) == 0)
  {
    [(NSMutableSet *)v4->_receivers addObject:v6];
    uint64_t v5 = v4->_suspended || [(UACornerActionManager *)v4 receivingSuspended];
    [v6 setSuspended:v5];
  }
  objc_sync_exit(v4);
}

- (void)removeReceiver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    uint64_t v5 = self;
    objc_sync_enter(v5);
    [(NSMutableSet *)v5->_receivers removeObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)addClient:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (([(NSMutableSet *)v4->_clients containsObject:v5] & 1) == 0)
  {
    [(NSMutableSet *)v4->_clients addObject:v5];
    objc_msgSend(v5, "setSuspended:", -[UACornerActionManager suspended](v4, "suspended"));
    [(UACornerActionManager *)v4 scheduleUpdatingAdvertisableItems];
  }
  objc_sync_exit(v4);
}

- (void)removeClient:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v5 && [(NSMutableSet *)v4->_clients containsObject:v5])
  {
    [(NSMutableSet *)v4->_clients removeObject:v5];
    [(UACornerActionManager *)v4 scheduleUpdatingAdvertisableItems];
  }
  objc_sync_exit(v4);
}

- (NSSet)notifiers
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableSet *)v2->_notifiers copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)addActivityNotifier:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableSet *)v4->_notifiers addObject:v5];
  objc_msgSend(v5, "setSuspended:", -[UACornerActionManager suspended](v4, "suspended"));
  [(UACornerActionManager *)v4 triggerUserIdleDetermination];
  objc_sync_exit(v4);
}

- (void)removeActivityNotifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    [(NSMutableSet *)v5->_notifiers removeObject:v6];
    [(UACornerActionManager *)v5 triggerUserIdleDetermination];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (NSSet)handlers
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableSet *)v2->_handlers copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)addHandler:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableSet *)v4->_handlers addObject:v5];
  objc_msgSend(v5, "setSuspended:", -[UACornerActionManager suspended](v4, "suspended"));
  objc_sync_exit(v4);
}

- (void)removeHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    [(NSMutableSet *)v5->_handlers removeObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (NSSet)allHandlers
{
  id v3 = +[NSMutableSet set];
  id v4 = self;
  objc_sync_enter(v4);
  [v3 unionSet:v4->_advertisers];
  [v3 unionSet:v4->_receivers];
  [v3 unionSet:v4->_clients];
  [v3 unionSet:v4->_notifiers];
  [v3 unionSet:v4->_handlers];
  objc_sync_exit(v4);

  id v5 = [v3 copy];

  return (NSSet *)v5;
}

- (BOOL)isBacklightOn
{
  return self->_backlightOn;
}

- (void)setBacklightOn:(BOOL)a3
{
  self->_backlightOn = a3;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 152, 1);
}

- (NSSet)activeDevicesIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 160, 1);
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 168, 1);
}

- (ActivityManagerDebuggingManager)debugManager
{
  return (ActivityManagerDebuggingManager *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPinnedUserActivityInfoItem:(id)a3
{
}

- (BOOL)receivingSuspended
{
  return self->_receivingSuspended;
}

- (void)setReceivingSuspended:(BOOL)a3
{
  self->_receivingSuspended = a3;
}

- (UASharedPasteboardClientController)pasteboardController
{
  return (UASharedPasteboardClientController *)objc_getProperty(self, a2, 192, 1);
}

- (void)setPasteboardController:(id)a3
{
}

- (UAPingController)pingController
{
  return (UAPingController *)objc_getProperty(self, a2, 200, 1);
}

- (void)setPingController:(id)a3
{
}

- (void)setMainDispatchQ:(id)a3
{
}

- (UADispatchScheduler)nextScheduleBestAppDeterminationScheduler
{
  return (UADispatchScheduler *)objc_getProperty(self, a2, 232, 1);
}

- (BOOL)deviceUILocked
{
  return self->_deviceUILocked;
}

- (void)setDeviceUILocked:(BOOL)a3
{
  self->_deviceUILocked = a3;
}

- (UATimedPowerAssertions)deviceUILockedPowerAssertion
{
  return (UATimedPowerAssertions *)objc_getProperty(self, a2, 240, 1);
}

- (void)setDeviceUILockedPowerAssertion:(id)a3
{
}

- (void)setScreenDimmed:(BOOL)a3
{
  self->_screenDimmed = a3;
}

- (UATimedPowerAssertions)screenDimmedPowerAssertion
{
  return (UATimedPowerAssertions *)objc_getProperty(self, a2, 248, 1);
}

- (void)setScreenDimmedPowerAssertion:(id)a3
{
}

- (int)backlightLevelToken
{
  return self->_backlightLevelToken;
}

- (void)setBacklightLevelToken:(int)a3
{
  self->_backlightLevelToken = a3;
}

- (NSDate)holdPowerAssertionUntil
{
  return (NSDate *)objc_getProperty(self, a2, 256, 1);
}

- (void)setHoldPowerAssertionUntil:(id)a3
{
}

- (OS_dispatch_source)holdPowerAssertionSourceTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 264, 1);
}

- (void)setHoldPowerAssertionSourceTimer:(id)a3
{
}

- (unsigned)holdPowerAssertion
{
  return self->_holdPowerAssertion;
}

- (void)setHoldPowerAssertion:(unsigned int)a3
{
  self->_holdPowerAssertion = a3;
}

- (PowerManagerIdleTracker)userIdleTracker
{
  return (PowerManagerIdleTracker *)objc_getProperty(self, a2, 272, 1);
}

- (void)setUserIdleTracker:(id)a3
{
}

- (UATimedPowerAssertions)userInactivePowerAssertion
{
  return (UATimedPowerAssertions *)objc_getProperty(self, a2, 280, 1);
}

- (void)setUserInactivePowerAssertion:(id)a3
{
}

- (BOOL)systemIsIdle
{
  return self->_systemIsIdle;
}

- (void)setSystemIsIdle:(BOOL)a3
{
  self->_systemIsIdle = a3;
}

- (NSDate)lastTimePayloadWasRequestedForAdvertisedItem
{
  return (NSDate *)objc_getProperty(self, a2, 288, 1);
}

- (int)systemPreferenceChangedToken
{
  return self->_systemPreferenceChangedToken;
}

- (void)setSystemPreferenceChangedToken:(int)a3
{
  self->_systemPreferenceChangedToken = a3;
}

- (int)uiLockStatusToken
{
  return self->_uiLockStatusToken;
}

- (void)setUiLockStatusToken:(int)a3
{
  self->_uiLockStatusToken = a3;
}

- (FBSDisplayLayoutMonitor)mirroringMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 296, 1);
}

- (void)setMirroringMonitor:(id)a3
{
}

- (BOOL)isMirroringActive
{
  return self->_isMirroringActive;
}

- (void)setIsMirroringActive:(BOOL)a3
{
  self->_isMirroringActive = a3;
}

- (BOOL)pingMode
{
  return self->_pingMode;
}

- (void)setPingMode:(BOOL)a3
{
  self->_pingMode = a3;
}

- (double)avgPingTime
{
  return self->_avgPingTime;
}

- (void)setAvgPingTime:(double)a3
{
  self->_avgPingTime = a3;
}

- (NSDate)pingStart
{
  return (NSDate *)objc_getProperty(self, a2, 312, 1);
}

- (void)setPingStart:(id)a3
{
}

- (OS_dispatch_semaphore)pongSem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 320, 1);
}

- (void)setPongSem:(id)a3
{
}

- (NSTimer)pongTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 328, 1);
}

- (void)setPongTimer:(id)a3
{
}

- (void)setBluetoothStatus:(id)a3
{
}

- (NSObject)bluetoothStatusCallbackIdentifier
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setBluetoothStatusCallbackIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothStatusCallbackIdentifier, 0);
  objc_storeStrong((id *)&self->_bluetoothStatus, 0);
  objc_storeStrong((id *)&self->_pongTimer, 0);
  objc_storeStrong((id *)&self->_pongSem, 0);
  objc_storeStrong((id *)&self->_pingStart, 0);
  objc_storeStrong((id *)&self->_mirroringMonitor, 0);
  objc_storeStrong((id *)&self->_lastTimePayloadWasRequestedForAdvertisedItem, 0);
  objc_storeStrong((id *)&self->_userInactivePowerAssertion, 0);
  objc_storeStrong((id *)&self->_userIdleTracker, 0);
  objc_storeStrong((id *)&self->_holdPowerAssertionSourceTimer, 0);
  objc_storeStrong((id *)&self->_holdPowerAssertionUntil, 0);
  objc_storeStrong((id *)&self->_screenDimmedPowerAssertion, 0);
  objc_storeStrong((id *)&self->_deviceUILockedPowerAssertion, 0);
  objc_storeStrong((id *)&self->_nextScheduleBestAppDeterminationScheduler, 0);
  objc_storeStrong((id *)&self->_nextUpdateAdvertisedItemsScheduler, 0);
  objc_storeStrong((id *)&self->_nextUserIdleDeterminationScheduler, 0);
  objc_storeStrong((id *)&self->_mainDispatchQ, 0);
  objc_storeStrong((id *)&self->_pingController, 0);
  objc_storeStrong((id *)&self->_pasteboardController, 0);
  objc_storeStrong((id *)&self->_pinnedUserActivityInfoItem, 0);
  objc_storeStrong((id *)&self->_debugManager, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_activeDevicesIdentifiers, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sharingPolicyWantsToBlockReceivingItems, 0);
  objc_storeStrong((id *)&self->_debugCornerItem, 0);
  objc_storeStrong((id *)&self->_helpersDispatchGroup, 0);
  objc_storeStrong((id *)&self->_itemsBeingAdvertised, 0);
  objc_storeStrong((id *)&self->_creationTime, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_notifiers, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_receivers, 0);

  objc_storeStrong((id *)&self->_advertisers, 0);
}

@end