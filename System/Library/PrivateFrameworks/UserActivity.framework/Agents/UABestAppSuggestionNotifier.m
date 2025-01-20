@interface UABestAppSuggestionNotifier
- (BOOL)active;
- (BOOL)requiresBoosted;
- (BOOL)resume;
- (BOOL)suspend;
- (BOOL)terminate;
- (BOOL)wantsBestAppChangedNotifications;
- (NSArray)lastItemUUIDs;
- (NSArray)lastItemWhens;
- (NSMutableDictionary)possibleItems;
- (NSMutableDictionary)supressedUntil;
- (NSString)lastItemStr;
- (NSXPCConnection)connection;
- (UABestAppSuggestionNotifier)initWithManager:(id)a3 connection:(id)a4;
- (UADispatchScheduler)scheduler;
- (id)bestCornerItemsFromItems:(id)a3;
- (id)items;
- (id)statusString;
- (id)userActivityInfoForUUID:(id)a3;
- (void)doConnected;
- (void)doDetermineBestAppSuggestionWithCompletionHandler:(id)a3;
- (void)doDetermineBestAppSuggestions:(int64_t)a3 completionHandler:(id)a4;
- (void)doLaunchFollowUp:(id)a3 interactionType:(unint64_t)a4 cancelled:(BOOL)a5;
- (void)doQueueFetchOfPayloadForBestAppSuggestion:(id)a3 completionHandler:(id)a4;
- (void)doRegisterForBestAppChangeNotification;
- (void)doRemoveBestAppSuggestion:(id)a3 options:(id)a4;
- (void)doUnregisterForBestAppChangeNotification;
- (void)fetchAllNearbyAppSuggestions:(id)a3;
- (void)notifyBestAppsChanged:(id)a3 atTime:(id)a4;
- (void)setConnection:(id)a3;
- (void)setItems:(id)a3;
- (void)setLastItemStr:(id)a3;
- (void)setLastItemUUIDs:(id)a3;
- (void)setLastItemWhens:(id)a3;
- (void)setPossibleItems:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setSupressedUntil:(id)a3;
- (void)setWantsBestAppChangedNotifications:(BOOL)a3;
- (void)update;
@end

@implementation UABestAppSuggestionNotifier

- (UABestAppSuggestionNotifier)initWithManager:(id)a3 connection:(id)a4
{
  uint64_t v4 = __chkstk_darwin(self, a2, a3, a4);
  v6 = v5;
  v7 = (void *)v4;
  id v9 = v8;
  id v10 = v6;
  v11 = v10;
  if (v10) {
    [v10 auditToken];
  }
  else {
    memset(&v38[1], 0, sizeof(audit_token_t));
  }
  pid_t pidp = 0;
  audit_token_t atoken = v38[1];
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  int v12 = proc_pidpath(pidp, buffer, 0x1000u);
  if (v12 < 1 || !buffer[0]) {
    goto LABEL_14;
  }
  while (!buffer[v12])
  {
    BOOL v13 = __OFSUB__(v12--, 1);
    if ((v12 < 0) ^ v13 | (v12 == 0))
    {
      int v12 = 0;
      break;
    }
  }
  uint64_t v14 = -1;
  do
  {
    int v15 = v12 - 1;
    ++v14;
    if (!v12) {
      break;
    }
    int v16 = buffer[v12--];
  }
  while (v16 != 47);
  v17 = (__CFString *)[objc_alloc((Class)NSString) initWithBytes:&buffer[v15 + 2] length:v14 encoding:4];
  if (!v17)
  {
LABEL_14:
    if (v11) {
      [v11 auditToken];
    }
    else {
      memset(v38, 0, 32);
    }
    pid_t pidp = 0;
    audit_token_t atoken = v38[0];
    audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
    v17 = +[NSString stringWithFormat:@"(PID:%ld)", pidp];
  }
  if (v17) {
    CFStringRef v18 = v17;
  }
  else {
    CFStringRef v18 = @"BestApp";
  }
  v37.receiver = v7;
  v37.super_class = (Class)UABestAppSuggestionNotifier;
  v19 = [(UAActivityNotifier *)&v37 initWithManager:v9 name:v18];
  v20 = v19;
  if (v19)
  {
    [(UABestAppSuggestionNotifier *)v19 setConnection:v11];
    v21 = +[NSMutableDictionary dictionary];
    [(UABestAppSuggestionNotifier *)v20 setSupressedUntil:v21];

    v22 = dispatch_get_global_queue(0, 0);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100013E90;
    v35[3] = &unk_1000C4D40;
    v23 = v20;
    v36 = v23;
    v24 = +[UADispatchScheduler dispatchScheduler:@"bestApp" frequency:v22 queue:v35 block:0.0];
    [(UABestAppSuggestionNotifier *)v23 setScheduler:v24];

    v25 = sub_1000469C0();
    [v11 setExportedInterface:v25];

    v26 = sub_100046AD4();
    [v11 setRemoteObjectInterface:v26];

    [v11 setExportedObject:v23];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100013ED4;
    v33[3] = &unk_1000C4D40;
    v27 = v23;
    v34 = v27;
    v28 = [(UABestAppSuggestionNotifier *)v27 connection];
    [v28 setInvalidationHandler:v33];

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100014000;
    v31[3] = &unk_1000C4D40;
    id v32 = v11;
    v29 = [(UABestAppSuggestionNotifier *)v27 connection];
    [v29 setInterruptionHandler:v31];
  }
  return v20;
}

- (BOOL)wantsBestAppChangedNotifications
{
  return self->_wantsBestAppChangedNotifications;
}

- (void)setWantsBestAppChangedNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  uint64_t v4 = obj;
  if (obj->_wantsBestAppChangedNotifications != v3)
  {
    obj->_wantsBestAppChangedNotifications = v3;
    v5 = [(UACornerActionManagerHandler *)obj manager];
    [v5 triggerUserIdleDetermination];

    uint64_t v4 = obj;
    if (v3)
    {
      v6 = [(UACornerActionManagerHandler *)obj manager];
      [v6 scheduleBestAppDetermination];

      uint64_t v4 = obj;
    }
  }
  objc_sync_exit(v4);
}

- (BOOL)requiresBoosted
{
  return 1;
}

- (id)items
{
  v2 = [(UABestAppSuggestionNotifier *)self possibleItems];
  BOOL v3 = [v2 allValues];
  uint64_t v4 = +[NSSet setWithArray:v3];

  return v4;
}

- (void)setItems:(id)a3
{
  id v4 = a3;
  v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [v4 description];
    v7 = sub_100063FF0(v6);
    *(_DWORD *)buf = 138477827;
    v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "setItems(%{private}@)", buf, 0xCu);
  }
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = +[NSMutableDictionary dictionary];
  [(UABestAppSuggestionNotifier *)v8 setPossibleItems:v9];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v20;
    do
    {
      BOOL v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v13);
        int v15 = [(UABestAppSuggestionNotifier *)v8 possibleItems];
        int v16 = [v14 uuid];
        [v15 setObject:v14 forKeyedSubscript:v16];

        BOOL v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  v17 = [(UABestAppSuggestionNotifier *)v8 bestCornerItemsFromItems:v10];
  CFStringRef v18 = +[NSDate date];
  [(UABestAppSuggestionNotifier *)v8 notifyBestAppsChanged:v17 atTime:v18];

  objc_sync_exit(v8);
}

- (id)userActivityInfoForUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v5 = [(UABestAppSuggestionNotifier *)self items];
    id v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v27;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
        id v10 = [v9 uuid];
        unsigned __int8 v11 = [v4 isEqual:v10];

        if (v11) {
          break;
        }
        if (v6 == (id)++v8)
        {
          id v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v12 = v9;

      if (v12) {
        goto LABEL_23;
      }
    }
    else
    {
LABEL_10:
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  BOOL v13 = [(UACornerActionManagerHandler *)self manager];
  uint64_t v14 = [v13 cornerActionItems];

  id v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v14);
        }
        CFStringRef v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v19 = [v18 uuid];
        unsigned int v20 = [v4 isEqual:v19];

        if (v20)
        {
          id v12 = v18;
          goto LABEL_22;
        }
      }
      id v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_22:

LABEL_23:

  return v12;
}

- (id)bestCornerItemsFromItems:(id)a3
{
  id v47 = a3;
  id v4 = +[UAUserActivityDefaults sharedDefaults];
  [v4 cornerActionItemTimeout];
  double v6 = v5;

  v51 = +[NSDate date];
  if (v6 <= 0.0)
  {
    v52 = 0;
  }
  else
  {
    v52 = +[NSDate dateWithTimeIntervalSinceNow:-v6];
  }
  v49 = +[NSMutableArray array];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v47;
  id v7 = [obj countByEnumeratingWithState:&v55 objects:v69 count:16];
  if (!v7) {
    goto LABEL_35;
  }
  uint64_t v53 = *(void *)v56;
  v48 = self;
  do
  {
    id v54 = v7;
    for (i = 0; i != v54; i = (char *)i + 1)
    {
      if (*(void *)v56 != v53) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v55 + 1) + 8 * i);
      id v10 = [(UABestAppSuggestionNotifier *)self supressedUntil];
      unsigned __int8 v11 = [v9 uuid];
      id v12 = [v10 objectForKey:v11];

      if (v12)
      {
        BOOL v13 = [v12 hardSupressUntil];
        if (v13)
        {
          uint64_t v14 = [v12 hardSupressUntil];
          BOOL v15 = sub_100063C78(v51, v14);

          if (v15)
          {
            uint64_t v16 = sub_10000BA18(0);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              v17 = [v9 activityType];
              CFStringRef v18 = [v9 uuid];
              id v19 = [v18 UUIDString];
              unsigned int v20 = [v12 hardSupressUntil];
              long long v21 = sub_10007C018(v20);
              *(_DWORD *)buf = 138478595;
              v60 = v17;
              __int16 v61 = 2114;
              id v62 = v19;
              __int16 v63 = 2114;
              id v64 = v21;
              __int16 v65 = 2114;
              v66 = v51;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "BESTAPP: -- Ignoring supressed item, %{private}@ %{public}@ (until %{public}@, now=%{public}@)", buf, 0x2Au);

              self = v48;
            }
LABEL_31:

            goto LABEL_33;
          }
        }
        long long v22 = [v12 supressUntil];
        if (v22)
        {
          long long v23 = [v12 supressUntil];
          BOOL v24 = sub_100063C78(v51, v23);

          if (v24)
          {
            uint64_t v16 = sub_10000BA18(0);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              long long v25 = [v9 activityType];
              long long v26 = [v9 uuid];
              id v27 = [v26 UUIDString];
              long long v28 = [v12 supressUntil];
              sub_10007C018(v28);
              id v29 = (id)objc_claimAutoreleasedReturnValue();
              v30 = [v9 when];
              v31 = sub_10007C018(v30);
              *(_DWORD *)buf = 138478851;
              v60 = v25;
              __int16 v61 = 2114;
              id v62 = v27;
              __int16 v63 = 2114;
              id v64 = v29;
              __int16 v65 = 2114;
              v66 = v31;
              __int16 v67 = 2114;
              v68 = v51;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "BESTAPP: -- Ignoring supressed item, %{private}@ %{public}@ (until %{public}@, item.when=%{public}@, now=%{public}@)", buf, 0x34u);

              self = v48;
            }
            goto LABEL_31;
          }
        }
      }
      BOOL v32 = sub_10000AA28((uint64_t)[v9 type]);
      if (v52) {
        BOOL v33 = v32;
      }
      else {
        BOOL v33 = 0;
      }
      if (v33)
      {
        v34 = [v9 when];
        if (v34)
        {
          v35 = [v9 when];
          BOOL v36 = sub_100063C78(v35, v52);

          if (v36)
          {
            uint64_t v16 = sub_10000BA18(0);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              objc_super v37 = [v9 uuid];
              v38 = [v37 UUIDString];
              v39 = [v9 when];
              *(_DWORD *)buf = 138544131;
              v60 = v38;
              __int16 v61 = 2113;
              id v62 = v9;
              __int16 v63 = 2114;
              id v64 = v39;
              __int16 v65 = 2114;
              v66 = v52;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "BESTAPP: Ignoring item %{public}@/%{private}@ %{public}@, because it is earlier than %{public}@", buf, 0x2Au);
            }
            goto LABEL_31;
          }
        }
      }
      v40 = +[UAUserActivityDefaults sharedDefaults];
      if ([v40 activityReceivingAllowed])
      {
      }
      else
      {
        BOOL v41 = sub_10000AA28((uint64_t)[v9 type]);

        if (v41)
        {
          uint64_t v16 = sub_10000BA18(0);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v42 = [v9 uuid];
            v43 = [v42 UUIDString];
            *(_DWORD *)buf = 138543619;
            v60 = v43;
            __int16 v61 = 2113;
            id v62 = v9;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "BESTAPP: -- Ignoring item %{public}@/%{private}@, because it is not a local action", buf, 0x16u);
          }
          goto LABEL_31;
        }
      }
      [v49 addObject:v9];
LABEL_33:
    }
    id v7 = [obj countByEnumeratingWithState:&v55 objects:v69 count:16];
  }
  while (v7);
LABEL_35:

  [v49 sortUsingComparator:&stru_1000C4D80];
  if ((unint64_t)[v49 count] < 0x10)
  {
    id v44 = v49;
  }
  else
  {
    objc_msgSend(v49, "subarrayWithRange:", 0, 15);
    id v44 = (id)objc_claimAutoreleasedReturnValue();
  }
  v45 = v44;

  return v45;
}

- (void)notifyBestAppsChanged:(id)a3 atTime:(id)a4
{
  id v59 = a3;
  id v56 = a4;
  long long v58 = self;
  if (![(UABestAppSuggestionNotifier *)self wantsBestAppChangedNotifications]) {
    goto LABEL_42;
  }
  double v6 = (char *)[v59 count];
  if (!v59)
  {
    id v7 = [(UABestAppSuggestionNotifier *)self lastItemUUIDs];
    if (!v7)
    {
      uint64_t v8 = [(UABestAppSuggestionNotifier *)self lastItemWhens];
      unsigned int v17 = v8 == 0;
LABEL_21:

      goto LABEL_22;
    }
    goto LABEL_15;
  }
  id v7 = [(UABestAppSuggestionNotifier *)self lastItemUUIDs];
  if (!v7)
  {
LABEL_16:
    unsigned int v17 = 0;
    goto LABEL_23;
  }
  uint64_t v8 = [(UABestAppSuggestionNotifier *)self lastItemWhens];
  if (!v8)
  {
LABEL_15:
    unsigned int v17 = 0;
LABEL_22:

    goto LABEL_23;
  }
  id v9 = [(UABestAppSuggestionNotifier *)self lastItemUUIDs];
  if ([v9 count] != v6)
  {
LABEL_20:

    unsigned int v17 = 0;
    goto LABEL_21;
  }
  id v10 = [(UABestAppSuggestionNotifier *)v58 lastItemWhens];
  unsigned __int8 v11 = (char *)[v10 count];

  if (v11 != v6) {
    goto LABEL_16;
  }
  if (v6)
  {
    id v12 = 0;
    while (1)
    {
      id v7 = [v59 objectAtIndex:v12];
      uint64_t v8 = [v7 when];
      id v9 = [(UABestAppSuggestionNotifier *)v58 lastItemWhens];
      BOOL v13 = [v9 objectAtIndex:v12];
      if (([v8 isEqual:v13] & 1) == 0) {
        break;
      }
      uint64_t v14 = [v7 uuid];
      BOOL v15 = [(UABestAppSuggestionNotifier *)v58 lastItemUUIDs];
      uint64_t v16 = [v15 objectAtIndex:v12];
      unsigned int v17 = [v14 isEqual:v16];

      if (v17)
      {
        if (v6 - 1 != v12++) {
          continue;
        }
      }
      goto LABEL_23;
    }

    goto LABEL_20;
  }
  unsigned int v17 = 1;
LABEL_23:
  long long v57 = [v59 firstObject];
  if (v17)
  {
    id v19 = sub_10000BA18(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v20 = [v57 uuid];
      long long v21 = [v20 UUIDString];
      id v22 = [v57 logString];
      long long v23 = [v57 when];
      [v59 count];
      *(_DWORD *)buf = 138544131;
      __int16 v61 = v21;
      __int16 v62 = 2113;
      id v63 = v22;
      __int16 v64 = 2114;
      __int16 v65 = v23;
      __int16 v66 = 2048;
      __int16 v67 = (char *)[v59 count] - 1;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "BESTAPP: Not notifying clients about new best app %{public}@/%{private}@ .when=%{public}@ (and %lu more best app options) because it matches last item.", buf, 0x2Au);
    }
  }
  else
  {
    BOOL v24 = sub_10000BA18(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      long long v25 = [v57 uuid];
      long long v26 = [v25 UUIDString];
      id v27 = [v57 debugDescription];
      [v59 count];
      *(_DWORD *)buf = 138543875;
      __int16 v61 = v26;
      __int16 v62 = 2113;
      id v63 = v27;
      __int16 v64 = 2048;
      __int16 v65 = (char *)[v59 count] - 1;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Notifying clients about new best app: %{public}@/%{private}@ (and %lu more best app options)", buf, 0x20u);
    }
    long long v28 = [(UABestAppSuggestionNotifier *)v58 connection];
    long long v55 = [v28 remoteObjectProxy];

    if (v59)
    {
      id v29 = +[NSMutableArray arrayWithCapacity:v6];
      v30 = +[NSMutableArray arrayWithCapacity:v6];
      v31 = +[NSMutableArray arrayWithCapacity:v6];
      if (v6)
      {
        for (i = 0; i != v6; ++i)
        {
          BOOL v33 = [v59 objectAtIndex:i];
          v34 = [v33 uuid];
          [v29 setObject:v34 atIndexedSubscript:i];

          v35 = [v33 when];
          [v30 setObject:v35 atIndexedSubscript:i];

          id v36 = [objc_alloc((Class)UAUserActivityInfo) initWithUserActivityInfo:v33];
          objc_super v37 = [v33 peerDevice];
          v38 = [v37 deviceType];
          [v36 setPeerDeviceType:v38];

          [v31 setObject:v36 atIndexedSubscript:i];
        }
      }
      [(UABestAppSuggestionNotifier *)v58 setLastItemUUIDs:v29];
      [(UABestAppSuggestionNotifier *)v58 setLastItemWhens:v30];
      [v55 notifyBestAppsChanged:v31 when:v56 confidence:1.0];
      v39 = [v57 bundleIdentifier];
      id v54 = [v57 activityType];
      v40 = [v57 uuid];
      BOOL v41 = [v40 UUIDString];
      v42 = [v57 peerDevice];
      v43 = [v42 name];
      [v59 count];
      id v44 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/%@ %@ %@ (and %lu more best app options)", v39, v54, v41, v43, (char *)[v59 count] - 1);
      [(UABestAppSuggestionNotifier *)v58 setLastItemStr:v44];

      v45 = +[UADiagnosticManager sharedManager];
      v46 = [v57 wasContinuedInfo];
      [v45 submitUserActivityWasSuggestedInfo:v46];
    }
    else
    {
      [v55 notifyBestAppsChanged:0 when:v56 confidence:0.0];
      [(UABestAppSuggestionNotifier *)v58 setLastItemUUIDs:0];
      [(UABestAppSuggestionNotifier *)v58 setLastItemWhens:0];
    }
    id v47 = [v57 bundleIdentifier];
    BOOL v48 = v47 == 0;

    if (!v48)
    {
      v49 = [v57 bundleIdentifier];
      char v50 = BRHandoffDidReceiveApplicationContinuity();
      id v51 = 0;

      if ((v50 & 1) == 0)
      {
        v52 = sub_10000BA18(0);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          uint64_t v53 = [v57 bundleIdentifier];
          *(_DWORD *)buf = 138478083;
          __int16 v61 = v53;
          __int16 v62 = 2114;
          id v63 = v51;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Error when nudging cloud docs for bundleIdentifier=%{private}@, err=%{public}@", buf, 0x16u);
        }
      }
    }
    id v19 = v55;
  }

LABEL_42:
}

- (void)update
{
  v2 = self;
  objc_sync_enter(v2);
  v60 = v2;
  long long v58 = +[NSDate date];
  BOOL v3 = [(UABestAppSuggestionNotifier *)v2 supressedUntil];
  id v4 = [v3 count];

  if (v4)
  {
    double v5 = sub_10000BA18(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      double v6 = [(UABestAppSuggestionNotifier *)v2 supressedUntil];
      id v7 = [v6 description];
      uint64_t v8 = sub_100063FF0(v7);
      *(_DWORD *)buf = 138477827;
      __int16 v66 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "BESTAPP: supressedUntil=%{private}@", buf, 0xCu);
    }
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v9 = [(UABestAppSuggestionNotifier *)v2 supressedUntil];
  id obj = [v9 allValues];

  id v10 = [obj countByEnumeratingWithState:&v61 objects:v77 count:16];
  if (v10)
  {
    uint64_t v59 = *(void *)v62;
    *(void *)&long long v11 = 138544642;
    long long v51 = v11;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v62 != v59) {
          objc_enumerationMutation(obj);
        }
        BOOL v13 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        uint64_t v14 = [(UABestAppSuggestionNotifier *)v60 possibleItems];
        BOOL v15 = [v13 itemUUID];
        uint64_t v16 = [v14 objectForKeyedSubscript:v15];

        if (!v16) {
          goto LABEL_30;
        }
        unsigned int v17 = [v13 hardSupressUntil];
        if (v17)
        {
          CFStringRef v18 = [v13 hardSupressUntil];
          BOOL v19 = sub_100063C78(v18, v58);

          if (v19)
          {
            unsigned int v20 = sub_10000BA18(0);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              long long v21 = [v13 itemUUID];
              id v22 = [v21 UUIDString];
              *(_DWORD *)buf = 138543362;
              __int16 v66 = v22;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "BESTAPP: Setting .hardSupressedUntil for %{public}@ to nil, because that time has passed.", buf, 0xCu);
            }
            [v13 setHardSupressUntil:0];
          }
        }
        long long v23 = [v13 supressUntil];
        BOOL v24 = v23 == 0;

        if (!v24)
        {
          long long v25 = [v13 supressUntil];
          BOOL v26 = sub_100063C78(v25, v58);

          if (v26)
          {
            id v27 = sub_10000BA18(0);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              long long v28 = [v13 itemUUID];
              id v29 = [v28 UUIDString];
              *(_DWORD *)buf = 138543362;
              __int16 v66 = v29;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "BESTAPP: Setting .supressUntil for %{public}@ to nil, because that time has passed.", buf, 0xCu);
            }
LABEL_25:

            [v13 setSupressUntil:0];
            goto LABEL_26;
          }
          v30 = [v13 lastInterestingTime];
          if (v30)
          {
            v31 = [v13 lastInterestingTime];
            BOOL v32 = [v16 lastInterestingTime];
            BOOL v33 = sub_100063C78(v31, v32);

            if (v33)
            {
              id v27 = sub_10000BA18(0);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                id v54 = [v16 uuid];
                long long v55 = [v54 UUIDString];
                uint64_t v53 = [v13 lastInterestingTime];
                sub_10007C018(v53);
                id v56 = (id)objc_claimAutoreleasedReturnValue();
                v52 = [v16 lastInterestingTime];
                sub_10007C018(v52);
                id v34 = (id)objc_claimAutoreleasedReturnValue();
                v35 = [v13 lastInterestingTime];
                id v36 = [v16 lastInterestingTime];
                objc_super v37 = [v16 when];
                v38 = sub_10007C018(v37);
                *(_DWORD *)buf = v51;
                __int16 v66 = v55;
                __int16 v67 = 2114;
                id v68 = v56;
                __int16 v69 = 2114;
                id v70 = v34;
                __int16 v71 = 2114;
                v72 = v35;
                __int16 v73 = 2114;
                v74 = v36;
                __int16 v75 = 2114;
                v76 = v38;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "BESTAPP: Setting .supressedUntil for %{public}@ to nil, because the .lastInterestingTime is earlier the last update for this item (%{public}@ vs %{public}@ (%{public}@ vs %{public}@), when=%{public}@).", buf, 0x3Eu);
              }
              goto LABEL_25;
            }
          }
        }
LABEL_26:
        v39 = [v13 hardSupressUntil];
        BOOL v40 = v39 == 0;

        if (!v40)
        {
          BOOL v41 = [(UABestAppSuggestionNotifier *)v60 scheduler];
          v42 = [v13 hardSupressUntil];
          [v41 scheduleAt:v42];
          goto LABEL_31;
        }
        v43 = [v13 supressUntil];
        BOOL v44 = v43 == 0;

        if (!v44)
        {
          BOOL v41 = [(UABestAppSuggestionNotifier *)v60 scheduler];
          v42 = [v13 supressUntil];
          [v41 scheduleAt:v42];
          goto LABEL_31;
        }
LABEL_30:
        BOOL v41 = [(UABestAppSuggestionNotifier *)v60 supressedUntil];
        v42 = [v13 itemUUID];
        [v41 removeObjectForKey:v42];
LABEL_31:
      }
      id v10 = [obj countByEnumeratingWithState:&v61 objects:v77 count:16];
    }
    while (v10);
  }

  v45 = [(UABestAppSuggestionNotifier *)v60 supressedUntil];
  id v46 = [v45 count];
  id v47 = [(UABestAppSuggestionNotifier *)v60 possibleItems];
  BOOL v48 = v46 < [v47 count];

  if (v48)
  {
    v49 = [(UABestAppSuggestionNotifier *)v60 items];
    char v50 = [(UABestAppSuggestionNotifier *)v60 bestCornerItemsFromItems:v49];
    [(UABestAppSuggestionNotifier *)v60 notifyBestAppsChanged:v50 atTime:v58];
  }
  else
  {
    [(UABestAppSuggestionNotifier *)v60 notifyBestAppsChanged:0 atTime:v58];
  }

  objc_sync_exit(v60);
}

- (BOOL)active
{
  BOOL v3 = [(UABestAppSuggestionNotifier *)self connection];
  if (v3) {
    BOOL v4 = [(UABestAppSuggestionNotifier *)self wantsBestAppChangedNotifications];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)suspend
{
  v7.receiver = self;
  v7.super_class = (Class)UABestAppSuggestionNotifier;
  BOOL v3 = [(UACornerActionManagerHandler *)&v7 suspend];
  if (v3)
  {
    BOOL v4 = [(UABestAppSuggestionNotifier *)self scheduler];
    [v4 suspend];

    double v5 = [(UABestAppSuggestionNotifier *)self connection];
    [v5 suspend];
  }
  return v3;
}

- (BOOL)resume
{
  v7.receiver = self;
  v7.super_class = (Class)UABestAppSuggestionNotifier;
  BOOL v3 = [(UACornerActionManagerHandler *)&v7 resume];
  if (v3)
  {
    BOOL v4 = [(UABestAppSuggestionNotifier *)self scheduler];
    [v4 resume];

    double v5 = [(UABestAppSuggestionNotifier *)self connection];
    [v5 resume];
  }
  return v3;
}

- (BOOL)terminate
{
  v6.receiver = self;
  v6.super_class = (Class)UABestAppSuggestionNotifier;
  BOOL v3 = [(UACornerActionManagerHandler *)&v6 terminate];
  if (v3)
  {
    BOOL v4 = [(UABestAppSuggestionNotifier *)self connection];
    [v4 invalidate];
  }
  return v3;
}

- (id)statusString
{
  BOOL v3 = [(UACornerActionManagerHandler *)self name];
  BOOL v4 = [(UABestAppSuggestionNotifier *)self connection];
  double v5 = v4;
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(&v14, 0, sizeof(v14));
  }
  pid_t pidp = 0;
  audit_token_t atoken = v14;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  uint64_t v6 = pidp;
  objc_super v7 = [(UABestAppSuggestionNotifier *)self lastItemStr];
  if (v7)
  {
    uint64_t v8 = [(UABestAppSuggestionNotifier *)self lastItemStr];
  }
  else
  {
    uint64_t v8 = @"-";
  }
  id v9 = [(UABestAppSuggestionNotifier *)self scheduler];
  id v10 = sub_10007C214((unint64_t)[v9 nextTime]);
  long long v11 = [(UABestAppSuggestionNotifier *)self scheduler];
  id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/%ld:%@, next=%@/%lld", v3, v6, v8, v10, [v11 runCount]);

  if (v7) {

  }
  return v12;
}

- (void)doConnected
{
  BOOL v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    BOOL v4 = [(UABestAppSuggestionNotifier *)self connection];
    double v5 = v4;
    if (v4) {
      [v4 auditToken];
    }
    else {
      memset(&v6, 0, sizeof(v6));
    }
    pid_t pidp = 0;
    audit_token_t atoken = v6;
    audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
    *(_DWORD *)buf = 67109120;
    pid_t v10 = pidp;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "doConnected, bestApp client connected. pid=%d", buf, 8u);
  }
}

- (void)doDetermineBestAppSuggestionWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void *, void *, double))a3;
  double v5 = [(UACornerActionManagerHandler *)self manager];
  audit_token_t v6 = [v5 cornerActionItems];
  objc_super v7 = [(UABestAppSuggestionNotifier *)self bestCornerItemsFromItems:v6];

  if (v7)
  {
    long long v23 = [v7 firstObject];
    uint64_t v8 = sub_10000BA18(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v23 uuid];
      pid_t v10 = [v9 UUIDString];
      [v7 count];
      *(_DWORD *)buf = 138543875;
      long long v25 = v10;
      __int16 v26 = 2113;
      id v27 = v23;
      __int16 v28 = 2048;
      id v29 = (char *)[v7 count] - 1;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "doDetermineBestAppSuggestionWithCompletionHandler, bestApp=%{public}@/%{private}@ (and %lu more app suggestions)", buf, 0x20u);
    }
    if (v4)
    {
      long long v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
      for (unint64_t i = 0; i < (unint64_t)[v7 count]; ++i)
      {
        BOOL v13 = [v7 objectAtIndex:i];
        id v14 = [objc_alloc((Class)UAUserActivityInfo) initWithUserActivityInfo:v13];
        BOOL v15 = [v13 peerDevice];
        char v16 = objc_opt_respondsToSelector();

        if (v16)
        {
          unsigned int v17 = [v13 peerDevice];
          CFStringRef v18 = [v17 deviceType];
          [v14 setPeerDeviceType:v18];
        }
        [v11 setObject:v14 atIndexedSubscript:i];
      }
      BOOL v19 = +[NSDate date];
      v4[2](v4, v11, v19, 1.0);

      unsigned int v20 = +[UADiagnosticManager sharedManager];
      long long v21 = [v23 wasContinuedInfo];
      [v20 submitUserActivityWasSuggestedInfo:v21];
    }
  }
  else if (v4)
  {
    id v22 = sub_10000BA18(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "doDetermineBestAppSuggestionWithCompletionHandler, bestItem = nil", buf, 2u);
    }

    v4[2](v4, 0, 0, 0.0);
  }
}

- (void)fetchAllNearbyAppSuggestions:(id)a3
{
  double v5 = (void (**)(id, id))a3;
  BOOL v4 = [(UACornerActionManagerHandler *)self manager];
  v5[2](v5, [v4 fetchMoreAppSuggestions]);
}

- (void)doDetermineBestAppSuggestions:(int64_t)a3 completionHandler:(id)a4
{
  double v5 = (void (**)(id, void *, void))a4;
  BOOL v4 = +[NSMutableArray array];
  if (v5) {
    v5[2](v5, v4, 0);
  }
}

- (void)doRemoveBestAppSuggestion:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v34 = a4;
  objc_super v7 = sub_10000BA18(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [v6 UUIDString];
    id v9 = [v34 description];
    pid_t v10 = sub_100063FF0(v9);
    *(_DWORD *)buf = 138543618;
    id v36 = v8;
    __int16 v37 = 2114;
    v38 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "uuid=%{public}@ options=%{public}@", buf, 0x16u);
  }
  if (v6)
  {
    long long v11 = self;
    objc_sync_enter(v11);
    id v12 = [(UABestAppSuggestionNotifier *)v11 userActivityInfoForUUID:v6];
    if (v12)
    {
      BOOL v13 = [(UABestAppSuggestionNotifier *)v11 supressedUntil];
      id v14 = [v13 objectForKey:v6];

      if (v14)
      {
        BOOL v15 = sub_10000BA18(0);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          char v16 = [v12 uuid];
          unsigned int v17 = [v16 UUIDString];
          CFStringRef v18 = [(UABestAppUserActivityInfoSuppressionRecord *)v14 description];
          *(_DWORD *)buf = 138543875;
          id v36 = v17;
          __int16 v37 = 2113;
          v38 = v12;
          __int16 v39 = 2114;
          BOOL v40 = v18;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "BESTAPP: Updating existing supression record for item %{public}@/%{private}@, %{public}@", buf, 0x20u);
        }
      }
      else
      {
        id v14 = objc_alloc_init(UABestAppUserActivityInfoSuppressionRecord);
      }
      BOOL v19 = [v12 uuid];
      [(UABestAppUserActivityInfoSuppressionRecord *)v14 setItemUUID:v19];

      unsigned int v20 = +[UAUserActivityDefaults sharedDefaults];
      [v20 cornerActionItemSupressionInterval];
      long long v21 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
      [(UABestAppUserActivityInfoSuppressionRecord *)v14 setHardSupressUntil:v21];

      id v22 = +[UAUserActivityDefaults sharedDefaults];
      [v22 bestAppSuggestionSupressionIntervalForUnchangingItem];
      long long v23 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
      [(UABestAppUserActivityInfoSuppressionRecord *)v14 setSupressUntil:v23];

      BOOL v24 = [v12 lastInterestingTime];
      [(UABestAppUserActivityInfoSuppressionRecord *)v14 setLastInterestingTime:v24];

      long long v25 = sub_10000BA18(0);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        BOOL v33 = [v12 uuid];
        __int16 v26 = [v33 UUIDString];
        id v27 = [v12 when];
        __int16 v28 = [(UABestAppUserActivityInfoSuppressionRecord *)v14 hardSupressUntil];
        id v29 = [(UABestAppUserActivityInfoSuppressionRecord *)v14 supressUntil];
        v30 = [v12 lastInterestingTime];
        *(_DWORD *)buf = 138544643;
        id v36 = v26;
        __int16 v37 = 2113;
        v38 = v12;
        __int16 v39 = 2114;
        BOOL v40 = v27;
        __int16 v41 = 2114;
        v42 = v28;
        __int16 v43 = 2114;
        BOOL v44 = v29;
        __int16 v45 = 2114;
        id v46 = v30;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "BESTAPP: Setting supressedUntil for item %{public}@/%{private}@ item.when=%{public}@ to %{public}@/%{public}@ lastInterestingTime=%{public}@", buf, 0x3Eu);
      }
      v31 = [(UABestAppSuggestionNotifier *)v11 supressedUntil];
      [v31 setObject:v14 forKey:v6];

      BOOL v32 = [(UABestAppSuggestionNotifier *)v11 scheduler];
      [v32 scheduleNext:0.0];
    }
    objc_sync_exit(v11);
  }
}

- (void)doLaunchFollowUp:(id)a3 interactionType:(unint64_t)a4 cancelled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (v8)
  {
    id v9 = [(UACornerActionManagerHandler *)self manager];
    pid_t v10 = [v9 cornerActionItemForUUID:v8];

    if (v10)
    {
      long long v11 = sub_10000BA18(@"Diagnostic");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        CFStringRef v12 = @"No";
        *(_DWORD *)buf = 138478339;
        CFStringRef v66 = v10;
        if (v5) {
          CFStringRef v12 = @"Yes";
        }
        __int16 v67 = 2048;
        unint64_t v68 = a4;
        __int16 v69 = 2114;
        CFStringRef v70 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "doLaunchFollowUp cornerActionItem: %{private}@, interactionType: %lx, cancelled: %{public}@", buf, 0x20u);
      }

      BOOL v13 = [(__CFString *)v10 wasContinuedInfo];
      BOOL v14 = v13 == 0;

      if (v14)
      {
        BOOL v15 = sub_10000BA18(@"Diagnostic");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Empty wasContinuedInfo, creating it", buf, 2u);
        }

        char v16 = objc_alloc_init(UAUserActivityAnalyticsInfo);
        [(__CFString *)v10 setWasContinuedInfo:v16];

        unsigned int v17 = [(__CFString *)v10 activityType];
        CFStringRef v18 = [(__CFString *)v10 wasContinuedInfo];
        [v18 setActivityType:v17];

        BOOL v19 = [(__CFString *)v10 bundleIdentifier];
        unsigned int v20 = [(__CFString *)v10 wasContinuedInfo];
        [v20 setBundleIdentifier:v19];

        id v21 = [(__CFString *)v10 type];
        id v22 = [(__CFString *)v10 wasContinuedInfo];
        [v22 setSuggestedActionType:v21];

        long long v23 = [(__CFString *)v10 uuid];
        BOOL v24 = [(__CFString *)v10 wasContinuedInfo];
        [v24 setUuid:v23];
      }
      long long v25 = sub_10000BA18(@"Diagnostic");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        __int16 v26 = [(__CFString *)v10 wasContinuedInfo];
        unsigned int v27 = [v26 scheduledForSubmission];
        CFStringRef v28 = @"No";
        if (v27) {
          CFStringRef v28 = @"Yes";
        }
        *(_DWORD *)buf = 138543362;
        CFStringRef v66 = v28;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "WasContinuedInfo scheduledForSubmission: %{public}@", buf, 0xCu);
      }
      id v29 = [(__CFString *)v10 wasContinuedInfo];
      unsigned __int8 v30 = [v29 scheduledForSubmission];

      if ((v30 & 1) == 0)
      {
        v31 = [(__CFString *)v10 wasContinuedInfo];
        [v31 setScheduledForSubmission:1];

        BOOL v32 = [(__CFString *)v10 wasContinuedInfo];
        [v32 setInteractionType:a4];

        BOOL v33 = [(__CFString *)v10 wasContinuedInfo];
        [v33 setCancelled:v5];

        id v34 = sub_10000BA18(@"Diagnostic");
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v35 = [(__CFString *)v10 uuid];
          id v36 = [v35 UUIDString];
          __int16 v37 = [(__CFString *)v10 wasContinuedInfo];
          *(_DWORD *)buf = 138543619;
          CFStringRef v66 = v36;
          __int16 v67 = 2113;
          unint64_t v68 = (unint64_t)v37;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "-- Scheduling messagetracer info for submission: %{public}@, %{private}@", buf, 0x16u);
        }
        dispatch_time_t v38 = dispatch_time(0, 90000000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100017CA0;
        block[3] = &unk_1000C4D40;
        long long v61 = v10;
        dispatch_after(v38, (dispatch_queue_t)&_dispatch_main_q, block);
      }
      if (!v5 && [(__CFString *)v10 type] == (id)10)
      {
        __int16 v39 = [(__CFString *)v10 bundleIdentifier];
        if (v39)
        {
          BOOL v40 = [(__CFString *)v10 bundleIdentifier];
          BOOL v41 = [v40 caseInsensitiveCompare:@"com.apple.AppStore"] == 0;

          if (v41)
          {
            uint64_t v42 = [(__CFString *)v10 webpageURL];
            long long v55 = (void *)v42;
            if (v42)
            {
              id v43 = [objc_alloc((Class)NSURLComponents) initWithURL:v42 resolvingAgainstBaseURL:1];
              if (v43)
              {
                long long v58 = 0u;
                long long v59 = 0u;
                long long v56 = 0u;
                long long v57 = 0u;
                id v54 = v43;
                BOOL v44 = [v43 queryItems];
                id v45 = [v44 countByEnumeratingWithState:&v56 objects:v64 count:16];
                if (v45)
                {
                  uint64_t v46 = *(void *)v57;
                  do
                  {
                    for (unint64_t i = 0; i != v45; unint64_t i = (char *)i + 1)
                    {
                      if (*(void *)v57 != v46) {
                        objc_enumerationMutation(v44);
                      }
                      BOOL v48 = *(void **)(*((void *)&v56 + 1) + 8 * i);
                      v49 = [v48 name];
                      if ([v49 isEqual:@"ids"])
                      {
                        char v50 = [v48 value];
                        BOOL v51 = v50 == 0;

                        if (!v51)
                        {
                          uint64_t v62 = _UAUserActivityDidContinueToAppStoreApplicationIdentifierKey;
                          v52 = [v48 value];
                          long long v63 = v52;
                          id v45 = +[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];

                          goto LABEL_39;
                        }
                      }
                      else
                      {
                      }
                    }
                    id v45 = [v44 countByEnumeratingWithState:&v56 objects:v64 count:16];
                  }
                  while (v45);
                }
LABEL_39:

                id v43 = v54;
              }
              else
              {
                id v45 = 0;
              }
            }
            else
            {
              id v45 = 0;
            }
            uint64_t v53 = +[NSDistributedNotificationCenter defaultCenter];
            [v53 postNotificationName:_UAUserActivityDidContinueToAppStoreNotification object:0 userInfo:v45];
          }
        }
      }
    }
  }
}

- (void)doRegisterForBestAppChangeNotification
{
  BOOL v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    BOOL v4 = [(UABestAppSuggestionNotifier *)self connection];
    BOOL v5 = v4;
    if (v4) {
      [v4 auditToken];
    }
    else {
      memset(&v6, 0, sizeof(v6));
    }
    pid_t pidp = 0;
    audit_token_t atoken = v6;
    audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
    *(_DWORD *)buf = 134349056;
    uint64_t v10 = pidp;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "doRegisterForBestAppChangeNotification, clientPid=%{public}ld", buf, 0xCu);
  }
  [(UABestAppSuggestionNotifier *)self setWantsBestAppChangedNotifications:1];
}

- (void)doUnregisterForBestAppChangeNotification
{
  BOOL v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    BOOL v4 = [(UABestAppSuggestionNotifier *)self connection];
    BOOL v5 = v4;
    if (v4) {
      [v4 auditToken];
    }
    else {
      memset(&v6, 0, sizeof(v6));
    }
    pid_t pidp = 0;
    audit_token_t atoken = v6;
    audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
    *(_DWORD *)buf = 134349056;
    uint64_t v10 = pidp;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "doUnregisterForBestAppChangeNotification, clientPid=%{public}ld", buf, 0xCu);
  }
  [(UABestAppSuggestionNotifier *)self setWantsBestAppChangedNotifications:0];
  [(UABestAppSuggestionNotifier *)self setLastItemUUIDs:0];
  [(UABestAppSuggestionNotifier *)self setLastItemWhens:0];
}

- (void)doQueueFetchOfPayloadForBestAppSuggestion:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000BA18(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v6 UUIDString];
    *(_DWORD *)buf = 138543362;
    unsigned int v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Queuing fetch for bestAppUUID %{public}@", buf, 0xCu);
  }
  kdebug_trace();
  uint64_t v10 = [(UABestAppSuggestionNotifier *)self userActivityInfoForUUID:v6];
  if (v10)
  {
    long long v11 = sub_10000BA18(@"signposts");
    CFStringRef v12 = v11;
    if (v10 != (void *)-1 && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "bestAppFetch", "", buf, 2u);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100018330;
    v13[3] = &unk_1000C4DA8;
    id v14 = v10;
    id v15 = v7;
    [v14 requestPayloadWithCompletionHandler:v13];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConnection:(id)a3
{
}

- (NSMutableDictionary)supressedUntil
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSupressedUntil:(id)a3
{
}

- (UADispatchScheduler)scheduler
{
  return (UADispatchScheduler *)objc_getProperty(self, a2, 72, 1);
}

- (void)setScheduler:(id)a3
{
}

- (NSMutableDictionary)possibleItems
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPossibleItems:(id)a3
{
}

- (NSArray)lastItemUUIDs
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastItemUUIDs:(id)a3
{
}

- (NSArray)lastItemWhens
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastItemWhens:(id)a3
{
}

- (NSString)lastItemStr
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLastItemStr:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastItemStr, 0);
  objc_storeStrong((id *)&self->_lastItemWhens, 0);
  objc_storeStrong((id *)&self->_lastItemUUIDs, 0);
  objc_storeStrong((id *)&self->_possibleItems, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_supressedUntil, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end