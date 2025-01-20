@interface UAUserActivityClientProcessesController
- (BKSApplicationStateMonitor)appStateMonitor;
- (BOOL)addAdditionalUserActivityAdvertisableItems:(id)a3;
- (BOOL)clientIsActive:(id)a3;
- (BOOL)ifLockScreenIsActive:(id)a3 visibleBundleIdentifiers:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)registerAsProxyApplication:(id)a3 forPid:(int)a4;
- (BOOL)removeAdditionalUserActivityAdvertisableItems:(id)a3;
- (BOOL)resume;
- (BOOL)suspend;
- (BOOL)updateCarPlayScreenLayout:(id)a3;
- (BOOL)updateMainScreenLayout:(id)a3;
- (FBSDisplayLayoutMonitor)carPlayDisplayLayoutMonitor;
- (FBSDisplayLayoutMonitor)mainDisplayLayoutMonitor;
- (NSArray)DEBUG_lastEligibleItems;
- (NSArray)carPlayScreenBundleIdentifiersInOrder;
- (NSArray)mainScreenBundleIdentifiersInOrder;
- (NSArray)userActivityClients;
- (NSDate)ignoreLockScreenUntil;
- (NSMutableDictionary)proxiedClients;
- (NSSet)additionalUserActivityAdvertisableItems;
- (NSSet)visibleUserActivityClients;
- (NSString)frontBundleID;
- (UADispatchScheduler)layoutUpdateScheduler;
- (UALocalItemReceiver)localReceiver;
- (UAUserActivityClientProcessesController)initWithManager:(id)a3 name:(id)a4;
- (double)intervalToDelaySuspensionOfAdvertisingForItem:(id)a3;
- (id)advertiseableItemForBundleIdentifier:(id)a3;
- (id)determineVisibleOrderingForProcessesWithUserActivities:(id)a3 previousBundleIDOrdering:(id)a4;
- (id)eligibleAdvertiseableItemsInOrder;
- (id)items;
- (id)recentEligibleItemsInOrder:(double)a3;
- (id)statusString;
- (id)userActivityClientForBundleIdentifier:(id)a3;
- (id)userActivityClientForPID:(int)a3;
- (id)userActivityClientForUUID:(id)a3;
- (id)userActivityInfoForUUID:(id)a3;
- (void)addUserActivityClient:(id)a3;
- (void)dealloc;
- (void)handleAppStateMonitorUpdate:(id)a3;
- (void)removeClientActivityClient:(id)a3;
- (void)setAppStateMonitor:(id)a3;
- (void)setCarPlayScreenBundleIdentifiersInOrder:(id)a3;
- (void)setFrontBundleID:(id)a3;
- (void)setIgnoreLockScreenUntil:(id)a3;
- (void)setLocalReceiver:(id)a3;
- (void)setMainScreenBundleIdentifiersInOrder:(id)a3;
@end

@implementation UAUserActivityClientProcessesController

- (BOOL)updateCarPlayScreenLayout:(id)a3
{
  id v4 = a3;
  v5 = [(UAUserActivityClientProcessesController *)self carPlayScreenBundleIdentifiersInOrder];
  v6 = [(UAUserActivityClientProcessesController *)self determineVisibleOrderingForProcessesWithUserActivities:v4 previousBundleIDOrdering:v5];

  if (v6 && ![v6 isEqual:v5] || v5 && objc_msgSend(v5, "count"))
  {
    v7 = sub_10000BA18(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "LAYOUT: Updating advertisement because the list of carplay screen visible bundle identifiers changed", v14, 2u);
    }

    [(UAUserActivityClientProcessesController *)self setCarPlayScreenBundleIdentifiersInOrder:v6];
    v8 = [(UACornerActionManagerHandler *)self manager];
    [v8 scheduleUpdatingAdvertisableItems:0.0];

    v9 = +[UAUserActivityDefaults sharedDefaults];
    unsigned int v10 = [v9 debugCrossoverAllActivities];

    if (v10)
    {
      v11 = [(UACornerActionManagerHandler *)self manager];
      [v11 scheduleBestAppDetermination];
    }
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_10000BA18(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138478083;
    id v13 = v6;
    __int16 v14 = 2113;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "listener=%{private}@ newConnection=%{private}@", (uint8_t *)&v12, 0x16u);
  }

  v9 = [[UAUserActivityClientProcess alloc] initWithController:self connection:v7];
  unsigned int v10 = self;
  objc_sync_enter(v10);
  [(NSMutableSet *)v10->_clients addObject:v9];
  objc_sync_exit(v10);

  [v7 resume];
  return 1;
}

- (id)eligibleAdvertiseableItemsInOrder
{
  v2 = +[NSMutableArray array];
  v3 = +[UAUserActivityDefaults sharedDefaults];
  unsigned int v4 = [v3 debugEnablePinging];

  if (v4)
  {
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    v5 = [(UAUserActivityClientProcessesController *)self userActivityClients];
    id v6 = [v5 countByEnumeratingWithState:&v101 objects:v113 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v102;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v102 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v101 + 1) + 8 * i);
          unsigned int v10 = [v9 currentAdvertisableActivity];
          v11 = v10;
          if (v10)
          {
            int v12 = [v10 activityType];
            unsigned int v13 = [v12 isEqual:@"com.apple.coreservices.ping"];

            if (v13)
            {
              __int16 v14 = sub_10000BA18(0);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                id v15 = [v9 currentAdvertisableActivity];
                *(_DWORD *)buf = 138477827;
                v112 = v15;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "*** FORCING item %{private}@ as the most eligible item, since it's a ping", buf, 0xCu);
              }
              [v2 addObject:v11];
            }
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v101 objects:v113 count:16];
      }
      while (v6);
    }
  }
  v16 = +[NSMutableArray array];
  v17 = +[NSMutableArray array];
  v84 = +[NSMutableDictionary dictionary];
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  v18 = [(UAUserActivityClientProcessesController *)self userActivityClients];
  id v19 = [v18 countByEnumeratingWithState:&v97 objects:v110 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v98;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v98 != v20) {
          objc_enumerationMutation(v18);
        }
        v22 = [*(id *)(*((void *)&v97 + 1) + 8 * (void)j) currentAdvertisableActivity];
        if (([v22 eligibleToAdvertise] & 1) != 0
          || ([v22 proxiedBundleIdentifier],
              v23 = objc_claimAutoreleasedReturnValue(),
              BOOL v24 = v23 == 0,
              v23,
              !v24))
        {
          if ([v22 alwaysPick]) {
            [v16 addObject:v22];
          }
          if ([v22 eligibleInBackground]) {
            [v17 addObject:v22];
          }
          v25 = [v22 proxiedBundleIdentifier];
          if (v25)
          {
            unsigned int v26 = [v22 eligibleToAdvertise];

            if (v26)
            {
              v27 = [v22 proxiedBundleIdentifier];
              [v84 setObject:v22 forKey:v27];
            }
          }
        }
      }
      id v19 = [v18 countByEnumeratingWithState:&v97 objects:v110 count:16];
    }
    while (v19);
  }

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  v28 = [(UAUserActivityClientProcessesController *)self additionalUserActivityAdvertisableItems];
  id v29 = [v28 countByEnumeratingWithState:&v93 objects:v109 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v94;
    do
    {
      for (k = 0; k != v29; k = (char *)k + 1)
      {
        if (*(void *)v94 != v30) {
          objc_enumerationMutation(v28);
        }
        v32 = *(void **)(*((void *)&v93 + 1) + 8 * (void)k);
        if ([v32 eligibleToAdvertise])
        {
          if ([v32 alwaysPick]) {
            [v16 addObject:v32];
          }
          if ([v32 eligibleInBackground]) {
            [v17 addObject:v32];
          }
        }
      }
      id v29 = [v28 countByEnumeratingWithState:&v93 objects:v109 count:16];
    }
    while (v29);
  }

  if ([v16 count])
  {
    v33 = +[NSString stringWithFormat:@"options.%@", UAUserActivityAlwaysPickKey];
    v34 = +[NSSortDescriptor sortDescriptorWithKey:v33 ascending:0];
    v108 = v34;
    v35 = +[NSArray arrayWithObjects:&v108 count:1];
    [v16 sortUsingDescriptors:v35];

    v36 = sub_10000BA18(0);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v112 = v16;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "eligibleAdvertiseableItemsInOrder: alwaysPickItems=%{public}@", buf, 0xCu);
    }

    [v2 addObjectsFromArray:v16];
  }
  v37 = [(UAUserActivityClientProcessesController *)self carPlayScreenBundleIdentifiersInOrder];
  if (!v37) {
    goto LABEL_54;
  }
  v38 = [(UAUserActivityClientProcessesController *)self carPlayScreenBundleIdentifiersInOrder];
  v39 = [v38 firstObject];
  BOOL v40 = v39 == 0;

  if (v40)
  {
LABEL_54:
    v46 = [(UAUserActivityClientProcessesController *)self mainScreenBundleIdentifiersInOrder];
    v47 = [v46 firstObject];

    if (!v47) {
      goto LABEL_74;
    }
    v48 = [(UAUserActivityClientProcessesController *)self mainScreenBundleIdentifiersInOrder];
    id v83 = [v48 firstObject];

    id v81 = [(UAUserActivityClientProcessesController *)self userActivityClientForBundleIdentifier:v83];
    v49 = [v81 currentAdvertisableActivity];
    v50 = v49;
    if (v81 && v49 && [v49 eligibleToAdvertise])
    {
      [v2 addObject:v50];
    }
    else
    {
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      v51 = [(UAUserActivityClientProcessesController *)self userActivityClients];
      id v52 = [v51 countByEnumeratingWithState:&v89 objects:v107 count:16];
      if (v52)
      {
        uint64_t v53 = *(void *)v90;
        do
        {
          for (m = 0; m != v52; m = (char *)m + 1)
          {
            if (*(void *)v90 != v53) {
              objc_enumerationMutation(v51);
            }
            v55 = [*(id *)(*((void *)&v89 + 1) + 8 * (void)m) currentAdvertisableActivity];

            v50 = v55;
            if (v55)
            {
              if ([v55 eligibleToAdvertise])
              {
                v56 = [v55 proxiedBundleIdentifier];
                unsigned int v57 = [v56 isEqual:v83];

                if (v57) {
                  [v2 addObject:v50];
                }
              }
            }
          }
          id v52 = [v51 countByEnumeratingWithState:&v89 objects:v107 count:16];
        }
        while (v52);
      }
    }
    v44 = v81;
    goto LABEL_72;
  }
  v41 = [(UAUserActivityClientProcessesController *)self carPlayScreenBundleIdentifiersInOrder];
  v42 = [v41 firstObject];
  id v83 = [(UAUserActivityClientProcessesController *)self userActivityClientForBundleIdentifier:v42];

  v43 = v83;
  if (v83)
  {
    v44 = [v83 currentAdvertisableActivity];
    v45 = v44;
    if (v44)
    {
      if ([v44 eligibleToAdvertise]) {
        [v2 addObject:v45];
      }
      v44 = v45;
    }
LABEL_72:

    v43 = v83;
  }

LABEL_74:
  v58 = [(UAUserActivityClientProcessesController *)self frontBundleID];

  if (v58)
  {
    v59 = [(UAUserActivityClientProcessesController *)self frontBundleID];
    v60 = [v84 objectForKeyedSubscript:v59];

    if (v60
      || ([(UAUserActivityClientProcessesController *)self frontBundleID],
          v61 = objc_claimAutoreleasedReturnValue(),
          [(UAUserActivityClientProcessesController *)self advertiseableItemForBundleIdentifier:v61], v60 = objc_claimAutoreleasedReturnValue(), v61, v60))
    {
      if ([v60 eligibleToAdvertise]) {
        [v2 addObject:v60];
      }
    }
  }
  if ([v17 count])
  {
    v62 = +[NSString stringWithFormat:@"options.%@", UAUserActivityEligibleEvenWhenInBackgroundKey];
    v63 = +[NSSortDescriptor sortDescriptorWithKey:v62 ascending:0];
    v106 = v63;
    v64 = +[NSArray arrayWithObjects:&v106 count:1];
    [v17 sortUsingDescriptors:v64];

    v65 = sub_10000BA18(0);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      v66 = [v17 description];
      v67 = sub_100063FF0(v66);
      *(_DWORD *)buf = 138477827;
      v112 = v67;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "-- Adding in eligibleItemsWhenInBackground items, %{private}@. ", buf, 0xCu);
    }
    [v2 addObjectsFromArray:v17];
  }
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  v68 = [(UAUserActivityClientProcessesController *)self additionalUserActivityAdvertisableItems];
  id v69 = [v68 countByEnumeratingWithState:&v85 objects:v105 count:16];
  if (v69)
  {
    uint64_t v70 = *(void *)v86;
    do
    {
      for (n = 0; n != v69; n = (char *)n + 1)
      {
        if (*(void *)v86 != v70) {
          objc_enumerationMutation(v68);
        }
        uint64_t v72 = *(void *)(*((void *)&v85 + 1) + 8 * (void)n);
        if (([v2 containsObject:v72] & 1) == 0) {
          [v2 addObject:v72];
        }
      }
      id v69 = [v68 countByEnumeratingWithState:&v85 objects:v105 count:16];
    }
    while (v69);
  }

  if (v2 && [v2 count])
  {
    v73 = sub_10000BA18(0);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
    {
      v74 = [v2 description];
      v75 = sub_100063FF0(v74);
      *(_DWORD *)buf = 138543362;
      v112 = v75;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEBUG, "eligibleAdvertiseableItemsInOrder: result=%{public}@", buf, 0xCu);
    }
  }
  v76 = self;
  objc_sync_enter(v76);
  v77 = (NSArray *)[v2 copy];
  DEBUG_lastEligibleItems = v76->_DEBUG_lastEligibleItems;
  v76->_DEBUG_lastEligibleItems = v77;

  objc_sync_exit(v76);
  if (v2) {
    id v79 = [v2 copy];
  }
  else {
    id v79 = 0;
  }

  return v79;
}

- (NSSet)additionalUserActivityAdvertisableItems
{
  v3 = self->_additionalUserActivityAdvertisableItems;
  objc_sync_enter(v3);
  id v4 = [(NSMutableSet *)self->_additionalUserActivityAdvertisableItems copy];
  objc_sync_exit(v3);

  return (NSSet *)v4;
}

- (BOOL)clientIsActive:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 bundleIdentifier];

    if (v6)
    {
      uint64_t v7 = self;
      objc_sync_enter(v7);
      v8 = [(UAUserActivityClientProcessesController *)v7 carPlayScreenBundleIdentifiersInOrder];
      if (v8
        && (-[UAUserActivityClientProcessesController carPlayScreenBundleIdentifiersInOrder](v7, "carPlayScreenBundleIdentifiersInOrder"), v9 = objc_claimAutoreleasedReturnValue(), [v9 firstObject], unsigned int v10 = objc_claimAutoreleasedReturnValue(), v10, v9, v8, v10))
      {
        v11 = [(UAUserActivityClientProcessesController *)v7 carPlayScreenBundleIdentifiersInOrder];
        int v12 = [v11 firstObject];
        unsigned int v13 = [v5 bundleIdentifier];
        unsigned __int8 v14 = [v12 isEqual:v13];
      }
      else
      {
        v16 = [(UAUserActivityClientProcessesController *)v7 mainScreenBundleIdentifiersInOrder];

        if (!v16)
        {
          BOOL v15 = 0;
          goto LABEL_11;
        }
        v11 = [v5 bundleIdentifier];
        int v12 = [(UAUserActivityClientProcessesController *)v7 mainScreenBundleIdentifiersInOrder];
        unsigned int v13 = [v12 firstObject];
        unsigned __int8 v14 = [v11 isEqual:v13];
      }
      BOOL v15 = v14;

LABEL_11:
      objc_sync_exit(v7);

      goto LABEL_12;
    }
  }
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

- (BOOL)updateMainScreenLayout:(id)a3
{
  id v4 = a3;
  v5 = [(UAUserActivityClientProcessesController *)self mainScreenBundleIdentifiersInOrder];
  unsigned __int8 v6 = [(UAUserActivityClientProcessesController *)self ifLockScreenIsActive:v4 visibleBundleIdentifiers:v5];

  uint64_t v7 = [(UAUserActivityClientProcessesController *)self mainScreenBundleIdentifiersInOrder];
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    uint64_t v9 = [(UAUserActivityClientProcessesController *)self determineVisibleOrderingForProcessesWithUserActivities:v4 previousBundleIDOrdering:v7];
    unsigned int v10 = (NSArray *)v9;
    if (v8 && v9)
    {
      if ([(id)v9 isEqual:v8])
      {
LABEL_7:

        goto LABEL_20;
      }
    }
    else if (!((unint64_t)v8 | v9))
    {
      goto LABEL_7;
    }
    v11 = sub_10000BA18(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "LAYOUT: Updating advertisement because the list of main screen visible bundle identifiers changed", buf, 2u);
    }

    mainScreenBundleIdentifiersInOrder = self->_mainScreenBundleIdentifiersInOrder;
    self->_mainScreenBundleIdentifiersInOrder = v10;

    goto LABEL_16;
  }
  if (![(NSArray *)v7 count])
  {
    unsigned int v13 = [(UAUserActivityClientProcessesController *)self carPlayScreenBundleIdentifiersInOrder];
    id v14 = [v13 count];

    if (v14) {
      goto LABEL_13;
    }
    v21 = self->_mainScreenBundleIdentifiersInOrder;
    self->_mainScreenBundleIdentifiersInOrder = 0;

LABEL_20:
    BOOL v20 = 0;
    goto LABEL_21;
  }

LABEL_13:
  BOOL v15 = sub_10000BA18(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "LAYOUT: Updating advertisement because the lock screen is present and there were previous main screen bundles.", v23, 2u);
  }

  v8 = self->_mainScreenBundleIdentifiersInOrder;
  self->_mainScreenBundleIdentifiersInOrder = 0;
LABEL_16:

  v16 = [(UACornerActionManagerHandler *)self manager];
  [v16 scheduleUpdatingAdvertisableItems:0.0];

  v17 = +[UAUserActivityDefaults sharedDefaults];
  unsigned int v18 = [v17 debugCrossoverAllActivities];

  if (v18)
  {
    id v19 = [(UACornerActionManagerHandler *)self manager];
    [v19 scheduleBestAppDetermination];
  }
  BOOL v20 = 1;
LABEL_21:

  return v20;
}

- (NSArray)mainScreenBundleIdentifiersInOrder
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (BOOL)ifLockScreenIsActive:(id)a3 visibleBundleIdentifiers:(id)a4
{
  id v6 = a3;
  id v46 = a4;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v7 = [v6 elements];
  id v8 = [v7 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v8)
  {
    id v9 = v8;
    v44 = self;
    v45 = v6;
    uint64_t v10 = *(void *)v52;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v52 != v10) {
        objc_enumerationMutation(v7);
      }
      int v12 = *(void **)(*((void *)&v51 + 1) + 8 * v11);
      if ([v12 conformsToProtocol:&OBJC_PROTOCOL___FBSDisplayLayoutElement])
      {
        uint64_t v13 = [v12 bundleIdentifier];
        if (v13)
        {
          id v14 = (void *)v13;
          BOOL v15 = [v12 bundleIdentifier];
          unsigned int v16 = [v15 isEqual:@"com.apple.lock-screen"];

          if (v16) {
            break;
          }
        }
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v51 objects:v58 count:16];
        if (v9) {
          goto LABEL_3;
        }
LABEL_38:
        self = v44;
        id v6 = v45;
        goto LABEL_39;
      }
    }
    v17 = sub_10000BA18(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "LOCKSCREEN: New layout contains modal lock screen.", buf, 2u);
    }

    id v18 = v12;
    self = v44;
    id v6 = v45;
    if (!v18) {
      goto LABEL_40;
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v7 = [v45 elements];
    id v19 = [v7 countByEnumeratingWithState:&v47 objects:v57 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v48;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v48 != v21) {
            objc_enumerationMutation(v7);
          }
          id v23 = *(id *)(*((void *)&v47 + 1) + 8 * i);
          unsigned int v24 = [v23 conformsToProtocol:&OBJC_PROTOCOL___FBSDisplayLayoutElement];
          if (v23 != v18 && v24 != 0)
          {
            id v26 = [v23 level];
            if ((uint64_t)v26 >= (uint64_t)[v18 level])
            {
              uint64_t v27 = [v23 bundleIdentifier];
              if (v27)
              {
                v28 = (void *)v27;
                id v29 = [v23 bundleIdentifier];
                unsigned int v30 = [v46 containsObject:v29];

                if (v30)
                {

                  v41 = sub_10000BA18(0);
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    id v56 = v23;
                    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "LOCKSCREEN: Ignoring lock-screen element because %{public}@ is at or above.", buf, 0xCu);
                  }

                  goto LABEL_38;
                }
              }
            }
          }
        }
        id v20 = [v7 countByEnumeratingWithState:&v47 objects:v57 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    if (![v46 count])
    {
      [(UAUserActivityClientProcessesController *)v44 setIgnoreLockScreenUntil:0];

      BOOL v40 = 0;
      id v6 = v45;
      goto LABEL_43;
    }
    uint64_t v31 = [(UAUserActivityClientProcessesController *)v44 ignoreLockScreenUntil];
    id v6 = v45;
    if (v31)
    {
      v32 = (void *)v31;
      v33 = [(UAUserActivityClientProcessesController *)v44 ignoreLockScreenUntil];
      v34 = +[NSDate date];
      id v35 = [v33 compare:v34];

      if (v35 == (id)-1)
      {
        [(UAUserActivityClientProcessesController *)v44 setIgnoreLockScreenUntil:0];

        goto LABEL_42;
      }
    }
    v36 = [(UAUserActivityClientProcessesController *)v44 ignoreLockScreenUntil];

    if (!v36)
    {
      v37 = +[NSDate dateWithTimeIntervalSinceNow:8.0];
      [(UAUserActivityClientProcessesController *)v44 setIgnoreLockScreenUntil:v37];
    }
    v38 = [(UAUserActivityClientProcessesController *)v44 layoutUpdateScheduler];
    v39 = [(UAUserActivityClientProcessesController *)v44 ignoreLockScreenUntil];
    [v38 scheduleAt:v39];

    BOOL v40 = 1;
  }
  else
  {
LABEL_39:

LABEL_40:
    v42 = [(UAUserActivityClientProcessesController *)self ignoreLockScreenUntil];

    if (v42) {
      [(UAUserActivityClientProcessesController *)self setIgnoreLockScreenUntil:0];
    }
LABEL_42:
    BOOL v40 = 0;
  }
LABEL_43:

  return v40;
}

- (NSDate)ignoreLockScreenUntil
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (NSArray)carPlayScreenBundleIdentifiersInOrder
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)handleAppStateMonitorUpdate:(id)a3
{
  id v4 = a3;
  v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v4 objectForKey:BKSApplicationStateKey];
    id v7 = [v6 integerValue];
    id v8 = [v4 description];
    id v9 = sub_100063FF0(v8);
    *(_DWORD *)buf = 134218243;
    uint64_t v56 = (uint64_t)v7;
    __int16 v57 = 2113;
    uint64_t v58 = (uint64_t)v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "MAKEFRONT: handleAppStateMonitorUpdate:%ld %{private}@", buf, 0x16u);
  }
  if (v4)
  {
    uint64_t v10 = [v4 objectForKey:BKSApplicationStateDisplayIDKey];
    uint64_t v11 = [v4 objectForKey:BKSApplicationStateAppIsFrontmostKey];
    unsigned int v12 = [v11 BOOLValue];

    uint64_t v13 = [(UAUserActivityClientProcessesController *)self userActivityClientForBundleIdentifier:v10];
    if (v10)
    {
      if (v12)
      {
        if (v13)
        {
          id v14 = self;
          objc_sync_enter(v14);
          [(NSMutableSet *)v14->_visibleUserActivityClients addObject:v13];
          objc_sync_exit(v14);

          BOOL v15 = [(UAUserActivityClientProcessesController *)v14 frontBundleID];
          unsigned int v54 = [v10 isEqual:v15];

          unsigned int v16 = [v13 bundleIdentifier];
          [(UAUserActivityClientProcessesController *)v14 setFrontBundleID:v16];

          v17 = sub_10000BA18(0);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id v18 = [v13 bundleIdentifier];
            uint64_t v19 = [v13 auditToken];
            id v20 = (void *)v19;
            uint64_t v21 = " and possibly change advertisement.";
            *(_DWORD *)buf = 138543874;
            uint64_t v56 = (uint64_t)v18;
            if (v54) {
              uint64_t v21 = "";
            }
            __int16 v57 = 2114;
            uint64_t v58 = v19;
            __int16 v59 = 2080;
            v60 = v21;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "MAKEFRONT: %{public}@/%{public}@ %s", buf, 0x20u);
          }
          v22 = [v13 bundleIdentifier];
          id v23 = [v13 currentAdvertisableActivity];
          unsigned int v24 = [v23 uuid];
          uint64_t v25 = [v24 UUIDString];
          id v26 = (void *)v25;
          uint64_t v27 = "(update)";
          if (v54) {
            uint64_t v27 = "";
          }
          v28 = +[NSString stringWithFormat:@"APP:%@, %@ %s", v22, v25, v27];
          +[ActivityManagerDebuggingManager appendRecentAction:v28];

          if (v54) {
            goto LABEL_53;
          }
        }
        else
        {
          v33 = [(UAUserActivityClientProcessesController *)self frontBundleID];
          v34 = [(UAUserActivityClientProcessesController *)self userActivityClientForBundleIdentifier:v33];
          id v35 = [v34 currentAdvertisableActivity];

          v36 = sub_10000BA18(0);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            uint64_t v37 = [(UAUserActivityClientProcessesController *)self frontBundleID];
            v38 = (void *)v37;
            v39 = " and possibly change advertisement.";
            if (!v35) {
              v39 = "";
            }
            *(_DWORD *)buf = 138543618;
            uint64_t v56 = v37;
            __int16 v57 = 2082;
            uint64_t v58 = (uint64_t)v39;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "MAKEFRONT: -(was %{public}@/%{public}s)", buf, 0x16u);
          }
          BOOL v40 = "(update)";
          if (!v35) {
            BOOL v40 = "";
          }
          v41 = +[NSString stringWithFormat:@"APP:- %s", v40];
          +[ActivityManagerDebuggingManager appendRecentAction:v41];

          [(UAUserActivityClientProcessesController *)self setFrontBundleID:0];
          if (!v35) {
            goto LABEL_53;
          }
        }
        goto LABEL_52;
      }
      if (v13)
      {
        id v29 = [v13 currentAdvertisableActivity];

        unsigned int v30 = self;
        objc_sync_enter(v30);
        if ([(NSMutableSet *)v30->_visibleUserActivityClients containsObject:v13])
        {
          [(NSMutableSet *)v30->_visibleUserActivityClients removeObject:v13];
          uint64_t v31 = [v13 currentAdvertisableActivity];
          if (v31)
          {
            v32 = +[NSDate date];
          }
          else
          {
            v32 = 0;
          }
          [v13 setLastFrontTime:v32];
          if (v31) {

          }
          v42 = sub_10000BA18(0);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            v43 = [(UAUserActivityClientProcessesController *)v30 frontBundleID];
            if (v43)
            {
              v44 = [(UAUserActivityClientProcessesController *)v30 frontBundleID];
            }
            else
            {
              v44 = @"-";
            }
            v45 = "";
            if (v29) {
              v45 = " and possibly change advertisement.";
            }
            *(_DWORD *)buf = 138412546;
            uint64_t v56 = (uint64_t)v44;
            __int16 v57 = 2082;
            uint64_t v58 = (uint64_t)v45;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "MAKEFRONT:- (was %@) %{public}s", buf, 0x16u);
            if (v43) {
          }
            }
          id v46 = [(UAUserActivityClientProcessesController *)v30 frontBundleID];
          if (v46)
          {
            long long v47 = [(UAUserActivityClientProcessesController *)v30 frontBundleID];
          }
          else
          {
            long long v47 = @"-";
          }
          long long v48 = " and possibly change advertisement.";
          if (!v29) {
            long long v48 = "";
          }
          long long v49 = +[NSString stringWithFormat:@"APP:- (was %@) %s", v47, v48];
          +[ActivityManagerDebuggingManager appendRecentAction:v49];

          if (v46) {
        }
          }
        objc_sync_exit(v30);

        long long v50 = [(UAUserActivityClientProcessesController *)v30 frontBundleID];
        if (v50)
        {
          long long v51 = [(UAUserActivityClientProcessesController *)v30 frontBundleID];
          unsigned int v52 = [v51 isEqual:v10];

          if (v52)
          {
            [(UAUserActivityClientProcessesController *)v30 setFrontBundleID:0];
            if (!v29) {
              goto LABEL_53;
            }
            goto LABEL_52;
          }
        }
        if (v29)
        {
LABEL_52:
          long long v53 = [(UACornerActionManagerHandler *)self manager];
          [v53 scheduleUpdatingAdvertisableItems:0.1];
        }
      }
    }
LABEL_53:
  }
}

- (id)userActivityClientForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    id v6 = [(NSMutableDictionary *)v5->_userActivityClientsByBundleID objectForKey:v4];
    objc_sync_exit(v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSString)frontBundleID
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (id)determineVisibleOrderingForProcessesWithUserActivities:(id)a3 previousBundleIDOrdering:(id)a4
{
  id v42 = a3;
  id v41 = a4;
  v43 = self;
  id v7 = [(UACornerActionManagerHandler *)self manager];
  id v8 = [v7 mainDispatchQ];
  dispatch_assert_queue_V2(v8);

  id v9 = +[NSMutableArray array];
  uint64_t v10 = [v42 elements];
  uint64_t v11 = +[NSMutableArray arrayWithArray:v10];

  [v11 sortUsingComparator:&stru_1000C5C18];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v11;
  id v47 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v58;
    do
    {
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(void *)v58 != v46) {
          objc_enumerationMutation(obj);
        }
        unsigned int v12 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if ([v12 conformsToProtocol:&OBJC_PROTOCOL___SBSDisplayLayoutElement])
        {
          unint64_t v13 = (unint64_t)[v12 layoutRole];
          BOOL v14 = !SBSDisplayLayoutRoleIsDefined() || v13 > 7;
          if (v14 || ((1 << v13) & 0xDE) == 0) {
            continue;
          }
        }
        if ([v12 conformsToProtocol:&OBJC_PROTOCOL___FBSDisplayLayoutElement])
        {
          unsigned int v16 = [v12 bundleIdentifier];

          if (v16)
          {
            v17 = [v12 bundleIdentifier];
            v45 = [(UAUserActivityClientProcessesController *)v43 userActivityClientForBundleIdentifier:v17];

            if (v45)
            {
              id v18 = sub_10000BA18(0);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543618;
                v64 = v12;
                __int16 v65 = 2114;
                v66 = v45;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "LAYOUT: Found %{public}@/%{public}@ as active layout", buf, 0x16u);
              }

              uint64_t v19 = [v12 bundleIdentifier];
              [v9 addObject:v19];
            }
            else
            {
              long long v55 = 0u;
              long long v56 = 0u;
              long long v53 = 0u;
              long long v54 = 0u;
              uint64_t v19 = [(UAUserActivityClientProcessesController *)v43 userActivityClients];
              id v20 = [v19 countByEnumeratingWithState:&v53 objects:v62 count:16];
              if (v20)
              {
                uint64_t v21 = *(void *)v54;
                do
                {
                  for (j = 0; j != v20; j = (char *)j + 1)
                  {
                    if (*(void *)v54 != v21) {
                      objc_enumerationMutation(v19);
                    }
                    id v23 = [*(id *)(*((void *)&v53 + 1) + 8 * (void)j) currentAdvertisableActivity];
                    unsigned int v24 = [v23 proxiedBundleIdentifier];
                    uint64_t v25 = [v12 bundleIdentifier];
                    id v4 = [v24 isEqual:v25];

                    if (v4)
                    {
                      id v26 = sub_10000BA18(0);
                      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138543618;
                        v64 = v12;
                        __int16 v65 = 2114;
                        v66 = 0;
                        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "LAYOUT: Found %{public}@/%{public}@ as proxy for active layout", buf, 0x16u);
                      }

                      uint64_t v27 = [v12 bundleIdentifier];
                      [v9 addObject:v27];
                    }
                  }
                  id v20 = [v19 countByEnumeratingWithState:&v53 objects:v62 count:16];
                }
                while (v20);
              }
            }
          }
        }
      }
      id v47 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
    }
    while (v47);
  }

  v28 = v43;
  objc_sync_enter(v28);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v29 = v41;
  id v30 = [v29 countByEnumeratingWithState:&v49 objects:v61 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v50;
    do
    {
      for (k = 0; k != v30; k = (char *)k + 1)
      {
        if (*(void *)v50 != v31) {
          objc_enumerationMutation(v29);
        }
        v33 = [(UAUserActivityClientProcessesController *)v28 userActivityClientForBundleIdentifier:*(void *)(*((void *)&v49 + 1) + 8 * (void)k)];
        v34 = v33;
        if (v33)
        {
          id v35 = [v33 bundleIdentifier];
          unsigned __int8 v36 = [v9 containsObject:v35];

          if ((v36 & 1) == 0)
          {
            uint64_t v37 = [v34 currentAdvertisableActivity];
            if (v37)
            {
              id v4 = +[NSDate date];
              id v38 = v4;
            }
            else
            {
              id v38 = 0;
            }
            [v34 setLastFrontTime:v38];
            if (v37) {
          }
            }
        }
      }
      id v30 = [v29 countByEnumeratingWithState:&v49 objects:v61 count:16];
    }
    while (v30);
  }

  objc_sync_exit(v28);
  id v39 = [v9 copy];

  return v39;
}

- (NSArray)userActivityClients
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NSMutableDictionary *)v2->_userActivityClientsByPID allValues];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setFrontBundleID:(id)a3
{
}

- (id)items
{
  v3 = +[NSMutableSet set];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [(UAUserActivityClientProcessesController *)self userActivityClients];
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v21 + 1) + 8 * i) currentAdvertisableActivity];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [(UAUserActivityClientProcessesController *)self additionalUserActivityAdvertisableItems];
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        [v3 addObject:*(void *)(*((void *)&v17 + 1) + 8 * (void)j)];
      }
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  id v15 = [v3 copy];

  return v15;
}

- (void)addUserActivityClient:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 auditToken];
    int v7 = [v6 pid];

    if (v7 >= 1)
    {
      id v8 = self;
      objc_sync_enter(v8);
      id v9 = sub_10000BA18(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = [v5 auditToken];
        id v11 = [v5 bundleIdentifier];
        int v19 = 138478339;
        long long v20 = v5;
        __int16 v21 = 2114;
        long long v22 = v10;
        __int16 v23 = 2113;
        long long v24 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Adding client %{private}@, %{public}@, bundleID=%{private}@ to known userActivityClients.", (uint8_t *)&v19, 0x20u);
      }
      userActivityClientsByPID = v8->_userActivityClientsByPID;
      uint64_t v13 = [v5 auditToken];
      BOOL v14 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (int)[v13 pid]);
      [(NSMutableDictionary *)userActivityClientsByPID setObject:v5 forKey:v14];

      id v15 = [v5 bundleIdentifier];

      if (v15)
      {
        userActivityClientsByBundleID = v8->_userActivityClientsByBundleID;
        long long v17 = [v5 bundleIdentifier];
        [(NSMutableDictionary *)userActivityClientsByBundleID setObject:v5 forKey:v17];
      }
      long long v18 = [(UAUserActivityClientProcessesController *)v8 layoutUpdateScheduler];
      [v18 scheduleNext:0.0];

      objc_sync_exit(v8);
    }
  }
}

- (FBSDisplayLayoutMonitor)mainDisplayLayoutMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 104, 1);
}

- (UADispatchScheduler)layoutUpdateScheduler
{
  return (UADispatchScheduler *)objc_getProperty(self, a2, 144, 1);
}

- (FBSDisplayLayoutMonitor)carPlayDisplayLayoutMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 112, 1);
}

- (BKSApplicationStateMonitor)appStateMonitor
{
  return (BKSApplicationStateMonitor *)objc_getProperty(self, a2, 120, 1);
}

- (UAUserActivityClientProcessesController)initWithManager:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)UAUserActivityClientProcessesController;
  id v8 = [(UAClientController *)&v43 initWithManager:v6 name:v7];
  if (v8)
  {
    id v9 = objc_alloc((Class)NSXPCListener);
    uint64_t v10 = UActivityCreationXPCServiceName();
    id v11 = (NSXPCListener *)[v9 initWithMachServiceName:v10];
    activityManagerListener = v8->_activityManagerListener;
    v8->_activityManagerListener = v11;

    [(NSXPCListener *)v8->_activityManagerListener setDelegate:v8];
    uint64_t v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    userActivityClientsByPID = v8->_userActivityClientsByPID;
    v8->_userActivityClientsByPID = v13;

    id v15 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    clients = v8->_clients;
    v8->_clients = v15;

    long long v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    userActivityClientsByBundleID = v8->_userActivityClientsByBundleID;
    v8->_userActivityClientsByBundleID = v17;

    int v19 = [(UACornerActionManagerHandler *)v8 manager];
    long long v20 = [v19 mainDispatchQ];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1000046F8;
    v41[3] = &unk_1000C4CF0;
    __int16 v21 = v8;
    id v42 = v21;
    uint64_t v22 = +[UADispatchScheduler dispatchScheduler:@"layoutUpdate" frequency:v20 queue:v41 block:0.0];
    layoutUpdateScheduler = v21->_layoutUpdateScheduler;
    v21->_layoutUpdateScheduler = (UADispatchScheduler *)v22;

    long long v24 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    visibleUserActivityClients = v21->_visibleUserActivityClients;
    v21->_visibleUserActivityClients = v24;

    id v26 = [(UAUserActivityClientProcessesController *)v21 appStateMonitor];

    if (!v26)
    {
      id v27 = objc_alloc_init((Class)BKSApplicationStateMonitor);
      [(UAUserActivityClientProcessesController *)v21 setAppStateMonitor:v27];

      objc_initWeak(&location, v21);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100007654;
      v38[3] = &unk_1000C5B88;
      objc_copyWeak(&v39, &location);
      v28 = [(UAUserActivityClientProcessesController *)v21 appStateMonitor];
      [v28 setHandler:v38];

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
    uint64_t v29 = +[NSMutableSet set];
    additionalUserActivityAdvertisableItems = v21->_additionalUserActivityAdvertisableItems;
    v21->_additionalUserActivityAdvertisableItems = (NSMutableSet *)v29;

    uint64_t v31 = [UALocalItemReceiver alloc];
    v32 = [(UACornerActionManagerHandler *)v21 manager];
    v33 = [(UALocalItemReceiver *)v31 initWithManager:v32 controller:v21];
    localReceiver = v21->_localReceiver;
    v21->_localReceiver = v33;

    id v35 = [(UACornerActionManagerHandler *)v21 manager];
    unsigned __int8 v36 = [(UAUserActivityClientProcessesController *)v21 localReceiver];
    [v35 addReceiver:v36];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [(UACornerActionManagerHandler *)self manager];
  id v4 = [(UAUserActivityClientProcessesController *)self localReceiver];
  [v3 removeReceiver:v4];

  id v5 = [(UAUserActivityClientProcessesController *)self mainDisplayLayoutMonitor];

  if (v5)
  {
    id v6 = [(UAUserActivityClientProcessesController *)self mainDisplayLayoutMonitor];
    [v6 invalidate];

    mainDisplayLayoutMonitor = self->_mainDisplayLayoutMonitor;
    self->_mainDisplayLayoutMonitor = 0;
  }
  id v8 = [(UAUserActivityClientProcessesController *)self carPlayDisplayLayoutMonitor];

  if (v8)
  {
    id v9 = [(UAUserActivityClientProcessesController *)self carPlayDisplayLayoutMonitor];
    [v9 invalidate];

    carPlayDisplayLayoutMonitor = self->_carPlayDisplayLayoutMonitor;
    self->_carPlayDisplayLayoutMonitor = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)UAUserActivityClientProcessesController;
  [(UAUserActivityClientProcessesController *)&v11 dealloc];
}

- (BOOL)suspend
{
  v6.receiver = self;
  v6.super_class = (Class)UAUserActivityClientProcessesController;
  BOOL v3 = [(UACornerActionManagerHandler *)&v6 suspend];
  if (v3)
  {
    [(NSXPCListener *)self->_activityManagerListener suspend];
    id v4 = [(UAUserActivityClientProcessesController *)self localReceiver];
    [v4 suspend];
  }
  return v3;
}

- (BOOL)resume
{
  v23.receiver = self;
  v23.super_class = (Class)UAUserActivityClientProcessesController;
  BOOL v3 = [(UACornerActionManagerHandler *)&v23 resume];
  if (v3)
  {
    id v4 = [(UAUserActivityClientProcessesController *)self localReceiver];
    [v4 resume];

    [(NSXPCListener *)self->_activityManagerListener resume];
    id v5 = [(UAUserActivityClientProcessesController *)self mainDisplayLayoutMonitor];

    if (!v5)
    {
      objc_super v6 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
      [v6 setNeedsUserInteractivePriority:1];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10000758C;
      v22[3] = &unk_1000C5BD8;
      v22[4] = self;
      [v6 setTransitionHandler:v22];
      id v7 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:v6];
      mainDisplayLayoutMonitor = self->_mainDisplayLayoutMonitor;
      self->_mainDisplayLayoutMonitor = v7;

      id v9 = [(UACornerActionManagerHandler *)self manager];
      uint64_t v10 = [v9 mainDispatchQ];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000488D8;
      block[3] = &unk_1000C4CF0;
      block[4] = self;
      dispatch_async(v10, block);
    }
    objc_super v11 = [(UAUserActivityClientProcessesController *)self carPlayDisplayLayoutMonitor];

    if (!v11 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v12 = +[FBSDisplayLayoutMonitorConfiguration configurationForCarDisplayMonitor];
      uint64_t v13 = v12;
      if (v12)
      {
        [v12 setNeedsUserInteractivePriority:1];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100048940;
        v20[3] = &unk_1000C5BD8;
        v20[4] = self;
        [v13 setTransitionHandler:v20];
        BOOL v14 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:v13];
        carPlayDisplayLayoutMonitor = self->_carPlayDisplayLayoutMonitor;
        self->_carPlayDisplayLayoutMonitor = v14;

        unsigned int v16 = [(UACornerActionManagerHandler *)self manager];
        long long v17 = [v16 mainDispatchQ];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100048A14;
        v19[3] = &unk_1000C4CF0;
        v19[4] = self;
        dispatch_async(v17, v19);
      }
    }
  }
  return v3;
}

- (double)intervalToDelaySuspensionOfAdvertisingForItem:(id)a3
{
  uint64_t v4 = [(UAUserActivityClientProcessesController *)self carPlayScreenBundleIdentifiersInOrder];
  double v5 = 0.0;
  if (v4)
  {
    objc_super v6 = (void *)v4;
    id v7 = [(UAUserActivityClientProcessesController *)self carPlayScreenBundleIdentifiersInOrder];
    id v8 = [v7 count];

    if (v8)
    {
      id v9 = [(UAUserActivityClientProcessesController *)self carPlayScreenBundleIdentifiersInOrder];
      uint64_t v10 = [v9 firstObject];

      if (v10)
      {
        objc_super v11 = [(UAUserActivityClientProcessesController *)self userActivityClientForBundleIdentifier:v10];
        if (v11) {
          double v5 = 1.0e99;
        }
        else {
          double v5 = 0.0;
        }
      }
    }
  }
  return v5;
}

- (id)userActivityInfoForUUID:(id)a3
{
  id v4 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  double v5 = [(UAUserActivityClientProcessesController *)self userActivityClients];
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v24 + 1) + 8 * i) userActivityAdvertisableItemByUUID:v4];
        if (v10)
        {
LABEL_19:
          long long v18 = v10;
          goto LABEL_20;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v5 = [(UAUserActivityClientProcessesController *)self additionalUserActivityAdvertisableItems];
  id v11 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    while (2)
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v5);
        }
        id v15 = *(void **)(*((void *)&v20 + 1) + 8 * (void)j);
        unsigned int v16 = [v15 uuid];
        unsigned int v17 = [v16 isEqual:v4];

        if (v17)
        {
          id v10 = v15;
          goto LABEL_19;
        }
      }
      id v12 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  long long v18 = 0;
LABEL_20:

  return v18;
}

- (NSSet)visibleUserActivityClients
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = +[NSMutableSet set];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v2->_mainScreenBundleIdentifiersInOrder;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [(UAUserActivityClientProcessesController *)v2 userActivityClientForBundleIdentifier:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        if (v8) {
          [v3 addObject:v8];
        }
      }
      id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = [(UAUserActivityClientProcessesController *)v2 carPlayScreenBundleIdentifiersInOrder];
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = [(UAUserActivityClientProcessesController *)v2 userActivityClientForBundleIdentifier:*(void *)(*((void *)&v16 + 1) + 8 * (void)j)];
        if (v13) {
          [v3 addObject:v13];
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v10);
  }

  id v14 = [v3 copy];
  objc_sync_exit(v2);

  return (NSSet *)v14;
}

- (id)userActivityClientForUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [(UAUserActivityClientProcessesController *)v5 userActivityClients];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = [v10 uniqueIdentifiers];
          unsigned int v12 = [v11 containsObject:v4];

          if (v12)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    objc_sync_exit(v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)userActivityClientForPID:(int)a3
{
  if (a3 < 2)
  {
    id v7 = 0;
  }
  else
  {
    id v4 = self;
    objc_sync_enter(v4);
    userActivityClientsByPID = v4->_userActivityClientsByPID;
    uint64_t v6 = +[NSNumber numberWithLong:a3];
    id v7 = [(NSMutableDictionary *)userActivityClientsByPID objectForKey:v6];

    objc_sync_exit(v4);
  }

  return v7;
}

- (BOOL)addAdditionalUserActivityAdvertisableItems:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self->_additionalUserActivityAdvertisableItems;
    objc_sync_enter(v5);
    unsigned __int8 v6 = [(NSMutableSet *)self->_additionalUserActivityAdvertisableItems containsObject:v4];
    [(NSMutableSet *)self->_additionalUserActivityAdvertisableItems addObject:v4];
    char v7 = v6 ^ 1;
    objc_sync_exit(v5);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)removeAdditionalUserActivityAdvertisableItems:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self->_additionalUserActivityAdvertisableItems;
    objc_sync_enter(v5);
    unsigned __int8 v6 = [(NSMutableSet *)self->_additionalUserActivityAdvertisableItems containsObject:v4];
    [(NSMutableSet *)self->_additionalUserActivityAdvertisableItems removeObject:v4];
    objc_sync_exit(v5);
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)removeClientActivityClient:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = [v4 auditToken];
    int v38 = 138478083;
    id v39 = v4;
    __int16 v40 = 2114;
    id v41 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing client %{private}@, application %{public}@, from known userActivityClients.", (uint8_t *)&v38, 0x16u);
  }
  char v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [v4 currentAdvertisableActivity];
  if (v8)
  {
    id v9 = [v4 currentAdvertisableActivity];
    id v10 = [v9 options];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"LSLivePastProcessExit"];
    unsigned int v12 = [v11 BOOLValue];

    if (v12)
    {
      uint64_t v13 = sub_10000BA18(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        long long v14 = [v4 currentAdvertisableActivity];
        long long v15 = [v14 uuid];
        long long v16 = [v15 UUIDString];
        long long v17 = [v4 currentAdvertisableActivity];
        long long v18 = [v4 auditToken];
        int v38 = 138543875;
        id v39 = v16;
        __int16 v40 = 2113;
        id v41 = v17;
        __int16 v42 = 2114;
        objc_super v43 = v18;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Moving 'LSLivePastProcessExit' activity %{public}@/%{private}@ from process %{public}@ into additionalUserActivityAdvertisableItems", (uint8_t *)&v38, 0x20u);
      }
      long long v19 = [v4 currentAdvertisableActivity];
      [(UAUserActivityClientProcessesController *)v7 addAdditionalUserActivityAdvertisableItems:v19];
    }
  }
  long long v20 = [v4 auditToken];
  BOOL v21 = (int)[v20 pid] > 0;

  if (v21)
  {
    long long v22 = sub_10000BA18(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      long long v23 = [v4 auditToken];
      int v38 = 138543362;
      id v39 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Removing client %{public}@ from _userActivityClientsByPID", (uint8_t *)&v38, 0xCu);
    }
    userActivityClientsByPID = v7->_userActivityClientsByPID;
    long long v25 = [v4 auditToken];
    long long v26 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (int)[v25 pid]);
    [(NSMutableDictionary *)userActivityClientsByPID removeObjectForKey:v26];
  }
  long long v27 = [v4 bundleIdentifier];

  if (v27)
  {
    v28 = sub_10000BA18(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = [v4 bundleIdentifier];
      int v38 = 138477827;
      id v39 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Removing client %{private}@ from _userActivityClientsByBundleIdentifier", (uint8_t *)&v38, 0xCu);
    }
    userActivityClientsByBundleID = v7->_userActivityClientsByBundleID;
    uint64_t v31 = [v4 bundleIdentifier];
    [(NSMutableDictionary *)userActivityClientsByBundleID removeObjectForKey:v31];
  }
  [(NSMutableSet *)v7->_visibleUserActivityClients removeObject:v4];
  [(NSMutableSet *)v7->_clients removeObject:v4];
  v32 = [(UAUserActivityClientProcessesController *)v7 proxiedClients];

  if (v32)
  {
    v33 = [(UAUserActivityClientProcessesController *)v7 proxiedClients];
    v34 = [v4 uuid];
    [v33 removeObjectForKey:v34];
  }
  id v35 = [(UAUserActivityClientProcessesController *)v7 layoutUpdateScheduler];
  [v35 scheduleNext:0.01];

  unsigned __int8 v36 = [(UACornerActionManagerHandler *)v7 manager];
  [v36 scheduleUpdatingAdvertisableItems:0.1];

  uint64_t v37 = [(UACornerActionManagerHandler *)v7 manager];
  [v37 processWasRemoved];

  objc_sync_exit(v7);
}

- (id)advertiseableItemForBundleIdentifier:(id)a3
{
  if (a3)
  {
    BOOL v3 = -[UAUserActivityClientProcessesController userActivityClientForBundleIdentifier:](self, "userActivityClientForBundleIdentifier:");
    id v4 = v3;
    if (v3)
    {
      id v5 = [v3 currentAdvertisableActivity];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)registerAsProxyApplication:(id)a3 forPid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  char v7 = sub_10000BA18(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v20 = 67240450;
    LODWORD(v21[0]) = v4;
    WORD2(v21[0]) = 2114;
    *(void *)((char *)v21 + 6) = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "registerAsProxyApplication, pid=%{public}d controller=%{public}@", (uint8_t *)&v20, 0x12u);
  }

  uint64_t v8 = [(UAUserActivityClientProcessesController *)self proxiedClients];
  id v9 = v8;
  if ((int)v4 >= 1)
  {

    if (!v9)
    {
      id v10 = +[NSMutableDictionary dictionary];
      proxiedClients = self->_proxiedClients;
      self->_proxiedClients = v10;
    }
    unsigned int v12 = +[NSNumber numberWithInt:v4];
    uint64_t v13 = [(UAUserActivityClientProcessesController *)self proxiedClients];
    long long v14 = [v6 uuid];
    [v13 setObject:v12 forKeyedSubscript:v14];

    long long v15 = sub_10000BA18(0);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    long long v16 = [(UAUserActivityClientProcessesController *)self proxiedClients];
    int v20 = 138543362;
    v21[0] = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "registerAsProxyApplication, added, proxiedClients=%{public}@", (uint8_t *)&v20, 0xCu);
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }

  if (v9)
  {
    long long v17 = sub_10000BA18(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      long long v18 = [(UAUserActivityClientProcessesController *)self proxiedClients];
      int v20 = 138543362;
      v21[0] = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "registerAsProxyApplication, removed, proxiedClients=%{public}@", (uint8_t *)&v20, 0xCu);
    }
    long long v15 = [(UAUserActivityClientProcessesController *)self proxiedClients];
    long long v16 = [v6 uuid];
    [v15 removeObjectForKey:v16];
    goto LABEL_12;
  }
LABEL_14:

  return 1;
}

- (id)recentEligibleItemsInOrder:(double)a3
{
  id v5 = +[NSMutableArray array];
  id v6 = +[NSDate dateWithTimeIntervalSinceNow:-a3];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  char v7 = [(UAUserActivityClientProcessesController *)self userActivityClients];
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v13 = [v12 lastFrontTime];
        if (v13)
        {
          long long v14 = (void *)v13;
          long long v15 = [v12 lastFrontTime];
          BOOL v16 = sub_100063D74(v15, v6);

          if (v16) {
            [v5 addObject:v12];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  if ([v5 count])
  {
    [v5 sortUsingComparator:&stru_1000C5C38];
    long long v17 = [v5 firstObject];
    long long v18 = [v17 currentAdvertisableActivity];
    if (v18)
    {
      long long v19 = [v5 firstObject];
      int v20 = [v19 currentAdvertisableActivity];
      long long v27 = v20;
      BOOL v21 = +[NSArray arrayWithObjects:&v27 count:1];
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (id)statusString
{
  v2 = self;
  objc_sync_enter(v2);
  p_isa = (id *)&v2->super.super.super.isa;
  BOOL v3 = +[NSMutableString stringWithFormat:@"##### Client processes: %ld clients", [(NSMutableSet *)v2->_clients count]];
  [v3 appendString:@" Layout:"];
  uint64_t v4 = [(UAUserActivityClientProcessesController *)v2 carPlayScreenBundleIdentifiersInOrder];
  if (v4)
  {
    id v5 = [(UAUserActivityClientProcessesController *)v2 carPlayScreenBundleIdentifiersInOrder];
    id v6 = [v5 count];

    if (v6)
    {
      [v3 appendString:@" car:"];
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      char v7 = [p_isa carPlayScreenBundleIdentifiersInOrder];
      id v8 = [v7 countByEnumeratingWithState:&v68 objects:v76 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v69;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v69 != v9) {
              objc_enumerationMutation(v7);
            }
            [v3 appendString:*(void *)(*((void *)&v68 + 1) + 8 * i)];
            [v3 appendString:@" "];
          }
          id v8 = [v7 countByEnumeratingWithState:&v68 objects:v76 count:16];
        }
        while (v8);
      }

      [v3 appendString:@"main:"];
    }
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v11 = p_isa[19];
  id v12 = [v11 countByEnumeratingWithState:&v64 objects:v75 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v65;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v65 != v13) {
          objc_enumerationMutation(v11);
        }
        [v3 appendString:*(void *)(*((void *)&v64 + 1) + 8 * (void)j)];
        [v3 appendString:@" "];
      }
      id v12 = [v11 countByEnumeratingWithState:&v64 objects:v75 count:16];
    }
    while (v12);
  }

  [v3 appendString:@"\n"];
  uint64_t v46 = +[NSMutableArray array];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v15 = [p_isa[7] allObjects];
  id obj = [v15 sortedArrayUsingComparator:&stru_1000C5C78];

  id v16 = [obj countByEnumeratingWithState:&v60 objects:v74 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v61;
    do
    {
      for (k = 0; k != v16; k = (char *)k + 1)
      {
        if (*(void *)v61 != v17) {
          objc_enumerationMutation(obj);
        }
        long long v19 = *(void **)(*((void *)&v60 + 1) + 8 * (void)k);
        unsigned int v20 = [p_isa clientIsActive:v19];
        uint64_t v21 = [v19 statusString];
        long long v22 = (void *)v21;
        long long v23 = "";
        if (v20) {
          long long v23 = "FRONT ";
        }
        long long v24 = +[NSString stringWithFormat:@" - %s%@\n", v23, v21];
        if (v20) {
          id v25 = 0;
        }
        else {
          id v25 = [v46 count];
        }
        [v46 insertObject:v24 atIndex:v25];
      }
      id v16 = [obj countByEnumeratingWithState:&v60 objects:v74 count:16];
    }
    while (v16);
  }

  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_10004A4FC;
  v58[3] = &unk_1000C5CA0;
  id v43 = v3;
  id v59 = v43;
  [v46 enumerateObjectsUsingBlock:v58];
  long long v26 = objc_msgSend(p_isa, "DEBUG_lastEligibleItems");
  if (v26)
  {
    [v43 appendString:@" Order:{"];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v41 = v26;
    id v42 = v26;
    id v45 = [v42 countByEnumeratingWithState:&v54 objects:v73 count:16];
    if (v45)
    {
      uint64_t v44 = *(void *)v55;
      do
      {
        for (id obja = 0; obja != v45; id obja = (char *)obja + 1)
        {
          if (*(void *)v55 != v44) {
            objc_enumerationMutation(v42);
          }
          long long v27 = *(void **)(*((void *)&v54 + 1) + 8 * (void)obja);
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          v28 = [p_isa userActivityClients];
          id v29 = [v28 countByEnumeratingWithState:&v50 objects:v72 count:16];
          if (v29)
          {
            uint64_t v30 = *(void *)v51;
            while (2)
            {
              for (m = 0; m != v29; m = (char *)m + 1)
              {
                if (*(void *)v51 != v30) {
                  objc_enumerationMutation(v28);
                }
                v32 = *(void **)(*((void *)&v50 + 1) + 8 * (void)m);
                v33 = [v32 bundleIdentifier];
                if (v33)
                {
                  v34 = [v32 uniqueIdentifiers];
                  id v35 = [v27 uuid];
                  unsigned int v36 = [v34 containsObject:v35];

                  if (v36)
                  {
                    uint64_t v37 = [v32 bundleIdentifier];
                    int v38 = [v27 uuid];
                    id v39 = [v38 UUIDString];
                    [v43 appendFormat:@"%@/%@ ", v37, v39];

                    goto LABEL_47;
                  }
                }
              }
              id v29 = [v28 countByEnumeratingWithState:&v50 objects:v72 count:16];
              if (v29) {
                continue;
              }
              break;
            }
          }
LABEL_47:
        }
        id v45 = [v42 countByEnumeratingWithState:&v54 objects:v73 count:16];
      }
      while (v45);
    }

    [v43 appendString:@"}\n"];
    long long v26 = v41;
  }

  objc_sync_exit(p_isa);

  return v43;
}

- (void)setAppStateMonitor:(id)a3
{
}

- (NSMutableDictionary)proxiedClients
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (UALocalItemReceiver)localReceiver
{
  return (UALocalItemReceiver *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLocalReceiver:(id)a3
{
}

- (void)setMainScreenBundleIdentifiersInOrder:(id)a3
{
}

- (void)setCarPlayScreenBundleIdentifiersInOrder:(id)a3
{
}

- (void)setIgnoreLockScreenUntil:(id)a3
{
}

- (NSArray)DEBUG_lastEligibleItems
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DEBUG_lastEligibleItems, 0);
  objc_storeStrong((id *)&self->_ignoreLockScreenUntil, 0);
  objc_storeStrong((id *)&self->_carPlayScreenBundleIdentifiersInOrder, 0);
  objc_storeStrong((id *)&self->_mainScreenBundleIdentifiersInOrder, 0);
  objc_storeStrong((id *)&self->_layoutUpdateScheduler, 0);
  objc_storeStrong((id *)&self->_localReceiver, 0);
  objc_storeStrong((id *)&self->_frontBundleID, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_carPlayDisplayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_mainDisplayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_visibleUserActivityClients, 0);
  objc_storeStrong((id *)&self->_userActivityClientsByBundleID, 0);
  objc_storeStrong((id *)&self->_proxiedClients, 0);
  objc_storeStrong((id *)&self->_additionalUserActivityAdvertisableItems, 0);
  objc_storeStrong((id *)&self->_userActivityClientsByPID, 0);
  objc_storeStrong((id *)&self->_clients, 0);

  objc_storeStrong((id *)&self->_activityManagerListener, 0);
}

@end