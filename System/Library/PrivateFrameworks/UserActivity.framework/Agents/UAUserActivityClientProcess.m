@interface UAUserActivityClientProcess
- (BOOL)allowedToGetCurrentActivityInfo;
- (BOOL)allowedToMatchUserActivities;
- (BOOL)allowedToUseEligibleEvenWhenInBackground;
- (BOOL)allowedToUseLSAlwaysEligible;
- (BOOL)allowedToUseLSAlwaysPick;
- (BOOL)allowedToUseUAAlwaysAdvertise;
- (BOOL)askSourceProcessToUpdateActivityWithUUID:(id)a3 evenIfClean:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)clientIsSandboxed;
- (BOOL)clientIsSigned;
- (BOOL)didResumeUserActivityWithUUID:(id)a3 completionHandler:(id)a4;
- (BOOL)frontmost;
- (BOOL)isDirtyActivityWithUUID:(id)a3;
- (BOOL)isEligibleToAdvertiseWithUUID:(id)a3;
- (BOOL)isEligibleToAlwaysAdvertiseWithUUID:(id)a3;
- (BOOL)removeUserActivityAdvertiseableItemByUUID:(id)a3;
- (NSArray)uniqueIdentifiers;
- (NSDate)lastFrontTime;
- (NSMutableArray)pendingUpdateTasks;
- (NSMutableDictionary)userActivityAdvertisableItemsByUUID;
- (NSMutableSet)dirtyUUIDs;
- (NSString)applicationIdentifier;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)teamID;
- (NSString)teamIdentifier;
- (NSXPCConnection)connection;
- (OS_os_transaction)os_transaction;
- (UAAuditToken)auditToken;
- (UACornerActionManager)manager;
- (UAUserActivityAdvertisableItem)currentAdvertisableActivity;
- (UAUserActivityClientProcess)initWithController:(id)a3 connection:(id)a4;
- (UAUserActivityClientProcessesController)controller;
- (id)statusString;
- (id)userActivityAdvertisableItemByUUID:(id)a3;
- (unsigned)allowedToAccessAnyItem;
- (void)addUserActivity:(id)a3;
- (void)dispatchPendingTasksForUUID:(id)a3 error:(id)a4;
- (void)doAddDynamicUserActivity:(id)a3 matching:(id)a4;
- (void)doDeleteUserActivityWithUUID:(id)a3;
- (void)doDetermineIfUserActivityIsCurrent:(id)a3 completionHandler:(id)a4;
- (void)doFetchUserActivityInfoWithUUID:(id)a3 completionHandler:(id)a4;
- (void)doGetCurrentUserActivityInfo:(id)a3;
- (void)doGetLoggingFileForClient:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)doGetUserActivityProxiesWithOptions:(id)a3 completionHandler:(id)a4;
- (void)doInitializeWithClientVersion:(int64_t)a3 clientInfo:(id)a4 completionHandler:(id)a5;
- (void)doMarkUserActivityAsDirty:(id)a3 forceImmediate:(BOOL)a4 webpageURL:(id)a5 expiration:(id)a6 hasiCloudDocument:(BOOL)a7 hasUnsynchronizediCloudDoc:(BOOL)a8;
- (void)doPinUserActivityInfo:(id)a3 completionHandler:(id)a4;
- (void)doRegisterAsProxyApplicationForPid:(int)a3 options:(id)a4 completionHandler:(id)a5;
- (void)doRemoveDynamicUserActivity:(id)a3 matching:(id)a4;
- (void)doUpdateUserActivityInfo:(id)a3 makeCurrent:(BOOL)a4 completionHandler:(id)a5;
- (void)doUpdateUserActivityWithUUID:(id)a3 setActive:(BOOL)a4;
- (void)invalidate;
- (void)removeUserActivity:(id)a3;
- (void)setAllowedToAccessAnyItem:(unsigned __int8)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setLastFrontTime:(id)a3;
- (void)setManager:(id)a3;
- (void)setOs_transaction:(id)a3;
- (void)setPendingUpdateTasks:(id)a3;
- (void)setTeamID:(id)a3;
- (void)setUserActivityAdvertisableItemsByUUID:(id)a3;
@end

@implementation UAUserActivityClientProcess

- (UACornerActionManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);

  return (UACornerActionManager *)WeakRetained;
}

- (void)addUserActivity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    v5 = self;
    objc_sync_enter(v5);
    userActivityAdvertisableItemsByUUID = v5->_userActivityAdvertisableItemsByUUID;
    v7 = [v8 uuid];
    [(NSMutableDictionary *)userActivityAdvertisableItemsByUUID setObject:v8 forKey:v7];

    objc_sync_exit(v5);
    id v4 = v8;
  }
}

- (void)doMarkUserActivityAsDirty:(id)a3 forceImmediate:(BOOL)a4 webpageURL:(id)a5 expiration:(id)a6 hasiCloudDocument:(BOOL)a7 hasUnsynchronizediCloudDoc:(BOOL)a8
{
  BOOL v75 = a8;
  BOOL v76 = a4;
  BOOL v77 = a7;
  id v82 = a3;
  id v80 = a5;
  id v79 = a6;
  v11 = sub_10000BA18(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = [v82 UUIDString];
    v13 = [(UAUserActivityClientProcess *)self auditToken];
    CFStringRef v14 = @"NO";
    *(_DWORD *)buf = 138544898;
    v89 = v12;
    __int16 v90 = 2114;
    v91 = v13;
    if (v76) {
      CFStringRef v14 = @"YES";
    }
    if (v80) {
      CFStringRef v15 = @"private";
    }
    else {
      CFStringRef v15 = @"-";
    }
    __int16 v92 = 2114;
    CFStringRef v93 = v14;
    v16 = " iCloudDoc";
    if (!v77) {
      v16 = "";
    }
    __int16 v94 = 2114;
    CFStringRef v95 = v15;
    __int16 v96 = 2114;
    id v97 = v79;
    __int16 v98 = 2082;
    v99 = v16;
    if (v75) {
      v17 = " unSynchronizediCloudDoc";
    }
    else {
      v17 = "";
    }
    __int16 v100 = 2082;
    v101 = v17;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "doMarkUserActivityAsDirty(%{public}@) for app %{public}@ forceImmediate=%{public}@ webpageURL=%{public}@ expiration=%{public}@%{public}s%{public}s", buf, 0x48u);
  }
  v18 = self;
  objc_sync_enter(v18);
  [(NSMutableSet *)v18->_dirtyUUIDs addObject:v82];
  objc_sync_exit(v18);
  p_isa = (id *)&v18->super.super.isa;

  v19 = sub_10000BA18(0);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v74 = [(UAUserActivityClientProcess *)v18 dirtyUUIDs];
    v73 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v74 count]);
    id v20 = [(UAUserActivityClientProcess *)v18 dirtyUUIDs];
    v21 = +[NSMutableString stringWithFormat:@"{"];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v22 = v20;
    id v23 = [v22 countByEnumeratingWithState:&v84 objects:buf count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v85;
      uint64_t v25 = 10;
LABEL_16:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v85 != v24) {
          objc_enumerationMutation(v22);
        }
        if ((v25 & ~(v25 >> 63)) == v26) {
          break;
        }
        v27 = [*(id *)(*((void *)&v84 + 1) + 8 * v26) UUIDString];
        [v21 appendFormat:@"%@ ", v27];

        if (v23 == (id)++v26)
        {
          id v23 = [v22 countByEnumeratingWithState:&v84 objects:buf count:16];
          v25 -= v26;
          if (v23) {
            goto LABEL_16;
          }
          break;
        }
      }
    }

    [v21 appendString:@"}"];
    *(_DWORD *)buf = 138543618;
    v89 = v73;
    __int16 v90 = 2114;
    v91 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, " -- dirty activities for this client: (%{public}@) %{public}@", buf, 0x16u);
  }
  v28 = [p_isa userActivityAdvertisableItemByUUID:v82];
  if (v28)
  {
    id WeakRetained = objc_loadWeakRetained(p_isa + 10);
    v30 = [WeakRetained uaAdvertisableItemsInOrder];
    unsigned int v31 = [v30 containsObject:v28];

    if (v31)
    {
      v32 = sub_10000BA18(0);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v33 = [v82 UUIDString];
        *(_DWORD *)buf = 138543362;
        v89 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, " -- Updating the user activity, because it's the currently advertised item, to let the server know it should (maybe) re-fetch the payload: %{public}@", buf, 0xCu);
      }
      v34 = [(__CFString *)v28 webpageURL];
      v35 = v34;
      if (v80)
      {
        if (([v80 isEqual:v34] & 1) == 0)
        {

          [(__CFString *)v28 setWebpageURL:v80];
          goto LABEL_38;
        }
      }
      else
      {
        BOOL v36 = v34 == 0;

        if (v36) {
          goto LABEL_43;
        }
      }
      v37 = [(__CFString *)v28 webpageURL];
      if (!v37)
      {

        if (v80)
        {

          [(__CFString *)v28 setWebpageURL:v80];
        }
        else
        {
          [(__CFString *)v28 setWebpageURL:0];
        }
        goto LABEL_43;
      }
      v38 = [(__CFString *)v28 webpageURL];
      unsigned __int8 v39 = [v38 isEqual:v80];

      if (v80)
      {

        [(__CFString *)v28 setWebpageURL:v80];
      }
      else
      {
        [(__CFString *)v28 setWebpageURL:0];
      }
      if (v39)
      {
LABEL_43:
        v47 = [(__CFString *)v28 expirationDate];
        v48 = v47;
        if (v79)
        {
          if (([v79 isEqual:v47] & 1) == 0)
          {

            [(__CFString *)v28 setExpirationDate:v79];
            goto LABEL_54;
          }
        }
        else
        {
          BOOL v49 = v47 == 0;

          if (v49) {
            goto LABEL_57;
          }
        }
        v50 = [(__CFString *)v28 expirationDate];
        if (!v50)
        {

          if (v79)
          {

            [(__CFString *)v28 setExpirationDate:v79];
          }
          else
          {
            [(__CFString *)v28 setExpirationDate:0];
          }
          goto LABEL_57;
        }
        v51 = [(__CFString *)v28 expirationDate];
        unsigned __int8 v52 = [v51 isEqual:v79];

        if (v79)
        {

          [(__CFString *)v28 setExpirationDate:v79];
        }
        else
        {
          [(__CFString *)v28 setExpirationDate:0];
        }
        if (v52)
        {
LABEL_57:
          uint64_t v56 = [(__CFString *)v28 options];
          v57 = (void *)v56;
          if (v77)
          {
            if (v56)
            {
              v58 = [(__CFString *)v28 options];
              id v59 = [v58 mutableCopy];
            }
            else
            {
              id v59 = +[NSMutableDictionary dictionary];
            }

            [v59 setObject:&__kCFBooleanTrue forKeyedSubscript:_UAUserActivityContainsCloudDocsKey];
            if (v75) {
              v64 = &__kCFBooleanTrue;
            }
            else {
              v64 = &__kCFBooleanFalse;
            }
            [v59 setObject:v64 forKeyedSubscript:_LSUserActivityContainsUnsynchronizedCloudDocsKey];
            id v65 = [v59 copy];
            [(__CFString *)v28 setOptions:v65];

            goto LABEL_72;
          }
          if (v56)
          {
            v60 = [(__CFString *)v28 options];
            uint64_t v61 = _UAUserActivityContainsCloudDocsKey;
            v62 = [v60 objectForKeyedSubscript:_UAUserActivityContainsCloudDocsKey];
            if (v62)
            {

              uint64_t v63 = _LSUserActivityContainsUnsynchronizedCloudDocsKey;
              goto LABEL_69;
            }
            v66 = [(__CFString *)v28 options];
            uint64_t v63 = _LSUserActivityContainsUnsynchronizedCloudDocsKey;
            v67 = [v66 objectForKeyedSubscript:_LSUserActivityContainsUnsynchronizedCloudDocsKey];
            BOOL v68 = v67 == 0;

            if (!v68)
            {
LABEL_69:
              v69 = [(__CFString *)v28 options];
              id v59 = [v69 mutableCopy];

              [v59 removeObjectForKey:v61];
              [v59 removeObjectForKey:v63];
              if ([v59 count])
              {
                id v70 = [v59 copy];
                [(__CFString *)v28 setOptions:v70];
              }
              else
              {
                [(__CFString *)v28 setOptions:0];
              }
LABEL_72:
            }
          }
          if (v76)
          {
            v71 = [p_isa currentAdvertisableActivity];
            BOOL v72 = v71 == v28;

            if (v72)
            {
              v83[0] = _NSConcreteStackBlock;
              v83[1] = 3221225472;
              v83[2] = sub_100060434;
              v83[3] = &unk_1000C5DF0;
              v83[4] = p_isa;
              [(__CFString *)v28 requestPayloadWithCompletionHandler:v83];
            }
          }
          goto LABEL_76;
        }
LABEL_54:
        v53 = [p_isa currentAdvertisableActivity];
        BOOL v54 = v53 == v28;

        if (v54)
        {
          v55 = [p_isa manager];
          [v55 scheduleUpdatingAdvertisableItems];
        }
        goto LABEL_57;
      }
LABEL_38:
      v40 = [(__CFString *)v28 activityType];
      unsigned int v41 = [v40 isEqual:NSUserActivityTypeBrowsingWeb];

      if (v41)
      {
        v42 = sub_10000BA18(0);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          v43 = [p_isa auditToken];
          v44 = [(__CFString *)v28 uuid];
          v45 = [v44 UUIDString];
          *(_DWORD *)buf = 138543875;
          v89 = v43;
          __int16 v90 = 2114;
          v91 = v45;
          __int16 v92 = 2113;
          CFStringRef v93 = v28;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Scheduling an advertising item update, for application %{public}@, because the   changed on a NSUserActivityTypeBrowsingWeb item, %{public}@/%{private}@", buf, 0x20u);
        }
        v46 = [p_isa manager];
        [v46 scheduleUpdatingAdvertisableItems];
      }
      goto LABEL_43;
    }
  }
LABEL_76:
}

- (void)doUpdateUserActivityWithUUID:(id)a3 setActive:(BOOL)a4
{
  int v4 = a4;
  id v6 = a3;
  id v8 = sub_10000BA18(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [v6 UUIDString];
    CFStringRef v10 = @"NO";
    *(_DWORD *)buf = 138543875;
    v42 = v9;
    if (v4) {
      CFStringRef v10 = @"YES";
    }
    __int16 v43 = 2113;
    v44 = self;
    __int16 v45 = 2114;
    CFStringRef v46 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "doUpdateUserActivityWithUUID(%{public}@/%{private}@, current=%{public}@)", buf, 0x20u);
  }
  v11 = [(UAUserActivityClientProcess *)self userActivityAdvertisableItemByUUID:v6];
  if (v11)
  {
    unsigned __int8 v39 = v7;
    v12 = [(UAUserActivityClientProcess *)self currentAdvertisableActivity];
    id v40 = v6;
    if (v12)
    {
      v13 = [(UAUserActivityClientProcess *)self currentAdvertisableActivity];
      CFStringRef v14 = [v13 uuid];
      CFStringRef v15 = [(__CFString *)v11 uuid];
      unsigned int v16 = [v14 isEqual:v15];

      if (v16 == v4)
      {
        LODWORD(v12) = 0;
        int v17 = 0;
        goto LABEL_20;
      }
    }
    else
    {
      unsigned int v16 = 0;
      int v17 = 0;
      if ((v4 & 1) == 0) {
        goto LABEL_20;
      }
    }
    if ([(__CFString *)v11 alwaysPick])
    {
      LODWORD(v12) = 1;
    }
    else
    {
      id v22 = [(UAUserActivityClientProcess *)self controller];
      LODWORD(v12) = [v22 clientIsActive:self];
    }
    int v17 = 1;
LABEL_20:
    id v23 = sub_10000BA18(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = [(UAUserActivityClientProcess *)self auditToken];
      uint64_t v25 = [(__CFString *)v11 uuid];
      uint64_t v26 = [v25 UUIDString];
      v27 = (void *)v26;
      CFStringRef v28 = &stru_1000C6800;
      *(_DWORD *)buf = 138544387;
      v42 = v24;
      if (v16) {
        CFStringRef v28 = @"(already current)";
      }
      CFStringRef v29 = @".";
      __int16 v43 = 2114;
      __int16 v45 = 2113;
      v44 = (UAUserActivityClientProcess *)v26;
      CFStringRef v46 = v11;
      __int16 v47 = 2114;
      if (v12) {
        CFStringRef v29 = @", and updating advertisment.";
      }
      CFStringRef v48 = v28;
      __int16 v49 = 2114;
      CFStringRef v50 = v29;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Checking if the current item for %{public}@ is changed, %{public}@/%{private}@ %{public}@%{public}@", buf, 0x34u);
    }
    v30 = +[NSDate date];
    [(__CFString *)v11 setWhen:v30];

    if ((v4 ^ 1 | v16))
    {
      v7 = v39;
      if (!v17) {
        goto LABEL_33;
      }
      unsigned int v31 = sub_10000BA18(0);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = [(UAUserActivityClientProcess *)self auditToken];
        *(_DWORD *)buf = 138543362;
        v42 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Triggering the update of the advertisable items because the current status of our application, %{public}@, has changed.", buf, 0xCu);
      }
      currentAdvertisableActivity = self->_currentAdvertisableActivity;
      self->_currentAdvertisableActivity = 0;
      LODWORD(v12) = 1;
    }
    else
    {
      v34 = v11;
      currentAdvertisableActivity = self->_currentAdvertisableActivity;
      self->_currentAdvertisableActivity = v34;
      v7 = v39;
    }

LABEL_33:
    v35 = +[UAUserActivityDefaults sharedDefaults];
    if ([v35 debugCrossoverAllActivities])
    {

      id v6 = v40;
    }
    else
    {
      BOOL v36 = sub_10000AA28((uint64_t)[(__CFString *)v11 type]);

      id v6 = v40;
      if (v36) {
        goto LABEL_37;
      }
    }
    v37 = [(UAUserActivityClientProcess *)self manager];
    [v37 scheduleBestAppDetermination];

LABEL_37:
    if (v12)
    {
LABEL_38:
      v38 = [(UAUserActivityClientProcess *)self manager];
      [v38 scheduleUpdatingAdvertisableItems];

      goto LABEL_39;
    }
    goto LABEL_39;
  }
  if (!v6)
  {
    v18 = [(UAUserActivityClientProcess *)self currentAdvertisableActivity];

    if (v18)
    {
      if (v4)
      {
        v19 = sub_10000BA18(0);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = [(UAUserActivityClientProcess *)self auditToken];
          *(_DWORD *)buf = 138543362;
          v42 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Triggering the update of the advertisable items because uuid == nil, for application %{public}@, has changed.", buf, 0xCu);
        }
        v21 = self->_currentAdvertisableActivity;
        self->_currentAdvertisableActivity = 0;

        goto LABEL_38;
      }
    }
  }
LABEL_39:
}

- (UAUserActivityClientProcess)initWithController:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 manager];
  v98.receiver = self;
  v98.super_class = (Class)UAUserActivityClientProcess;
  CFStringRef v10 = [(UACornerActionManagerHandler *)&v98 initWithManager:v9 name:@"Application"];

  if (!v10) {
    goto LABEL_45;
  }
  snprintf(__str, 0x80uLL, "com.apple.coreservices.useractivity.client-connection.%d", [v8 processIdentifier]);
  v11 = (void *)os_transaction_create();
  [(UAUserActivityClientProcess *)v10 setOs_transaction:v11];

  objc_storeStrong((id *)&v10->_controller, a3);
  v12 = [v7 manager];
  objc_storeWeak((id *)&v10->_manager, v12);

  v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  userActivityAdvertisableItemsByUUID = v10->_userActivityAdvertisableItemsByUUID;
  v10->_userActivityAdvertisableItemsByUUID = v13;

  CFStringRef v15 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  dirtyUUIDs = v10->_dirtyUUIDs;
  v10->_dirtyUUIDs = v15;

  int v17 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  pendingResumeActivityUUIDs = v10->_pendingResumeActivityUUIDs;
  v10->_pendingResumeActivityUUIDs = v17;

  v19 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  pendingUpdateTasks = v10->_pendingUpdateTasks;
  v10->_pendingUpdateTasks = v19;

  [v8 setExportedObject:v10];
  v21 = sub_10000F4BC();
  [v8 setExportedInterface:v21];

  id v22 = sub_10000F468();
  [v8 setRemoteObjectInterface:v22];

  *(void *)__str = 0;
  v108 = __str;
  uint64_t v109 = 0x3042000000;
  v110 = sub_10000F420;
  v111 = sub_10005C1A0;
  objc_initWeak(v112, v10);
  v97[0] = _NSConcreteStackBlock;
  v97[1] = 3221225472;
  v97[2] = sub_10005C1A8;
  v97[3] = &unk_1000C57D0;
  v97[4] = __str;
  [v8 setInvalidationHandler:v97];
  objc_storeWeak((id *)&v10->_connection, v8);
  id v23 = [UAAuditToken alloc];
  uint64_t v24 = [(UAUserActivityClientProcess *)v10 connection];
  uint64_t v25 = v24;
  if (v24) {
    [v24 auditToken];
  }
  else {
    memset(v96, 0, sizeof(v96));
  }
  uint64_t v26 = [(UAAuditToken *)v23 initWithAuditToken:v96];
  auditToken = v10->_auditToken;
  v10->_auditToken = v26;

  if (sub_100008308(@"com.apple.security.app-sandbox"))
  {
    v10->_clientIsSandboxed = 1;
  }
  else
  {
    CFStringRef v28 = [(UAUserActivityClientProcess *)v10 auditToken];
    v10->_clientIsSandboxed = [v28 isSandboxed];
  }
  CFStringRef v29 = [(UAUserActivityClientProcess *)v10 connection];
  uint64_t v30 = [v29 valueForEntitlement:@"com.apple.application-identifier"];
  applicationIdentifier = v10->_applicationIdentifier;
  v10->_applicationIdentifier = (NSString *)v30;

  v32 = [(UAUserActivityClientProcess *)v10 connection];
  v33 = [v32 valueForEntitlement:@"useractivity-team-identifier"];

  if (v33)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = sub_10000BA18(0);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = [(UAUserActivityClientProcess *)v10 applicationIdentifier];
        *(_DWORD *)buf = 138543618;
        *(void *)__int16 v100 = v33;
        *(_WORD *)&v100[8] = 2114;
        *(void *)&v100[10] = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Using overridden team identifier %{public}@ for applicationIdentifier %{public}@", buf, 0x16u);
      }
      id v36 = v33;
LABEL_18:
      v38 = v36;
      teamID = v10->_teamID;
      v10->_teamID = (NSString *)v36;
      goto LABEL_19;
    }
  }
  teamID = [(UAUserActivityClientProcess *)v10 connection];
  v38 = [teamID valueForEntitlement:@"com.apple.developer.team-identifier"];

  if (v38)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_20;
    }
    id v40 = sub_10000BA18(0);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      unsigned int v41 = [(UAUserActivityClientProcess *)v10 applicationIdentifier];
      *(_DWORD *)buf = 138543618;
      *(void *)__int16 v100 = v38;
      *(_WORD *)&v100[8] = 2114;
      *(void *)&v100[10] = v41;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Using developer team identifier %{public}@ for applicationIdentifier %{public}@", buf, 0x16u);
    }
    id v36 = v38;
    goto LABEL_18;
  }
LABEL_19:

LABEL_20:
  v42 = [(UAUserActivityClientProcess *)v10 applicationIdentifier];

  if (v42)
  {
    v10->_clientIsSigned = 1;
  }
  else
  {
    __int16 v43 = [(UAUserActivityClientProcess *)v10 connection];
    uint64_t v44 = [v43 valueForEntitlement:@"application-identifier"];
    __int16 v45 = v10->_applicationIdentifier;
    v10->_applicationIdentifier = (NSString *)v44;
  }
  CFStringRef v46 = [(UAUserActivityClientProcess *)v10 teamID];
  if (v46) {
    goto LABEL_26;
  }
  __int16 v47 = [(UAUserActivityClientProcess *)v10 applicationIdentifier];
  BOOL v48 = v47 == 0;

  if (!v48)
  {
    CFStringRef v46 = [(UAUserActivityClientProcess *)v10 applicationIdentifier];
    uint64_t v49 = sub_10000351C(v46);
    CFStringRef v50 = v10->_teamID;
    v10->_teamID = (NSString *)v49;

LABEL_26:
  }
  v51 = [(UAUserActivityClientProcess *)v10 teamID];
  BOOL v52 = v51 == 0;

  if (v52)
  {
    v53 = v10->_teamID;
    v10->_teamID = (NSString *)&stru_1000C6800;
  }
  BOOL v54 = [(UAUserActivityClientProcess *)v10 connection];
  v55 = v54;
  if (v54) {
    [v54 auditToken];
  }
  else {
    memset(v95, 0, sizeof(v95));
  }
  uint64_t v56 = sub_10000C6B4(v95);
  [(UAUserActivityClientProcess *)v10 setBundleIdentifier:v56];

  v57 = [(UAUserActivityClientProcess *)v10 bundleIdentifier];
  LODWORD(v56) = v57 == 0;

  if (v56)
  {
    v58 = [(UAUserActivityClientProcess *)v10 applicationIdentifier];
    [(UAUserActivityClientProcess *)v10 setBundleIdentifier:v58];

    id v59 = [(UAUserActivityClientProcess *)v10 bundleIdentifier];
    v60 = (char *)[v59 rangeOfString:@":"];
    uint64_t v62 = v61;

    if (v62 == 1)
    {
      uint64_t v63 = [(UAUserActivityClientProcess *)v10 bundleIdentifier];
      v64 = [v63 substringFromIndex:v60 + 1];
      [(UAUserActivityClientProcess *)v10 setBundleIdentifier:v64];
    }
  }
  v10->_allowedToUseLSAlwaysEligible = 1;
  id v65 = [v8 valueForEntitlement:@"com.apple.private.coreservices.alwaysEligibleEvenWhenInBackground"];
  v10->_allowedToUseEligibleEvenWhenInBackground = sub_100008308(v65);

  v66 = [v8 valueForEntitlement:@"com.apple.private.coreservices.lsuseractivityd.LSAlwaysPick"];
  v10->_allowedToUseLSAlwaysPick = sub_100008308(v66);

  v67 = [v8 valueForEntitlement:@"com.apple.private.coreservices.canalwaysadvertise"];
  v10->_allowedToUseUAAlwaysAdvertise = sub_100008308(v67);

  BOOL v68 = [v8 valueForEntitlement:@"com.apple.private.coreservices.cangetcurrentactivityinfo"];
  v10->_allowedToGetCurrentActivityInfo = sub_100008308(v68);

  v69 = [v8 valueForEntitlement:@"com.apple.private.coreservices.allowedToMatchUserActivities"];
  if (sub_100008308(v69))
  {
    v10->_allowedToMatchUserActivities = 1;
  }
  else
  {
    id v70 = [v8 valueForEntitlement:@"com.apple.private.coreserivces.allowedToMatchUserActivities"];
    v10->_allowedToMatchUserActivities = sub_100008308(v70);
  }
  v71 = [(UAUserActivityClientProcess *)v10 connection];
  BOOL v72 = [v71 valueForEntitlement:@"com.apple.private.canmodifyanyuseractivity"];
  v10->_allowedToAccessAnyItem = sub_100008308(v72);

  v73 = sub_10000BA18(0);
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v74 = [(UAAuditToken *)v10->_auditToken pid];
    BOOL v75 = [v7 appStateMonitor];
    CFStringRef v76 = @"YES";
    if (!v75) {
      CFStringRef v76 = @"NO";
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)__int16 v100 = v74;
    *(_WORD *)&v100[4] = 2114;
    *(void *)&v100[6] = v76;
    _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEBUG, "About to fetch bundleIdentifier for process with pid %d. Has appStateMonitor: %{public}@", buf, 0x12u);
  }
  dispatch_time_t v77 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005C340;
  block[3] = &unk_1000C4CF0;
  v78 = v10;
  __int16 v94 = v78;
  dispatch_after(v77, (dispatch_queue_t)&_dispatch_main_q, block);
  id v79 = [v7 appStateMonitor];
  id v80 = (id)[(UAAuditToken *)v10->_auditToken pid];
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_1000052A4;
  v90[3] = &unk_1000C5EC0;
  v81 = v78;
  v91 = v81;
  id v92 = v7;
  [v79 applicationInfoForPID:v80 completion:v90];

  id v82 = +[NSNotificationCenter defaultCenter];
  [v82 addObserver:v81 selector:"debugStateChanged:" name:@"UAUserActivityDebugStateChanged" object:0];

  v83 = sub_10000BA18(0);
  if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
  {
    long long v84 = [(UAUserActivityClientProcess *)v81 auditToken];
    long long v85 = [(UAUserActivityClientProcess *)v81 teamID];
    long long v86 = [(UAUserActivityClientProcess *)v81 applicationIdentifier];
    long long v87 = [(UAUserActivityClientProcess *)v81 bundleIdentifier];
    unsigned int v88 = [(UAUserActivityClientProcess *)v81 allowedToAccessAnyItem];
    *(_DWORD *)buf = 138544387;
    *(void *)__int16 v100 = v84;
    *(_WORD *)&v100[8] = 2113;
    *(void *)&v100[10] = v85;
    __int16 v101 = 2113;
    v102 = v86;
    __int16 v103 = 2113;
    v104 = v87;
    __int16 v105 = 1026;
    unsigned int v106 = v88;
    _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_INFO, "UserActivityClient:%{public}@, teamID=%{private}@ applicationID=%{private}@ bundleID=%{private}@ accessAny=%{public,BOOL}d ", buf, 0x30u);
  }
  _Block_object_dispose(__str, 8);
  objc_destroyWeak(v112);
LABEL_45:

  return v10;
}

- (UAAuditToken)auditToken
{
  return (UAAuditToken *)objc_getProperty(self, a2, 88, 1);
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (NSString)applicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)teamID
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (UAUserActivityAdvertisableItem)currentAdvertisableActivity
{
  return (UAUserActivityAdvertisableItem *)objc_getProperty(self, a2, 136, 1);
}

- (BOOL)isEligibleToAdvertiseWithUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(UAUserActivityClientProcess *)self currentAdvertisableActivity];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [(UAUserActivityClientProcess *)self currentAdvertisableActivity];
      id v8 = [v7 uuid];
      unsigned int v9 = [v8 isEqual:v4];

      if (v9)
      {
        CFStringRef v10 = [(UAUserActivityClientProcess *)self userActivityAdvertisableItemByUUID:v4];
        v11 = v10;
        if (v10)
        {
          if (([v10 alwaysPick] & 1) != 0
            || ([(UAUserActivityClientProcess *)self controller],
                v12 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v13 = [v12 clientIsActive:self],
                v12,
                (v13 & 1) != 0)
            || ([v11 proxiedBundleIdentifier],
                CFStringRef v14 = objc_claimAutoreleasedReturnValue(),
                v14,
                v14)
            || [(UAUserActivityClientProcess *)self allowedToUseLSAlwaysEligible]
            && ([v11 alwaysEligible] & 1) != 0)
          {
            unsigned __int8 v15 = 1;
LABEL_16:

            goto LABEL_10;
          }
          if ([(UAUserActivityClientProcess *)self allowedToUseEligibleEvenWhenInBackground])
          {
            int v17 = [(UAUserActivityClientProcess *)self userActivityAdvertisableItemByUUID:v4];
            v18 = [v17 options];
            v19 = [v18 objectForKeyedSubscript:UAUserActivityEligibleEvenWhenInBackgroundKey];
            unsigned __int8 v15 = [v19 BOOLValue];

            goto LABEL_16;
          }
        }
        unsigned __int8 v15 = 0;
        goto LABEL_16;
      }
    }
  }
  unsigned __int8 v15 = 0;
LABEL_10:

  return v15;
}

- (UAUserActivityClientProcessesController)controller
{
  return (UAUserActivityClientProcessesController *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)isEligibleToAlwaysAdvertiseWithUUID:(id)a3
{
  id v4 = a3;
  if ([(UAUserActivityClientProcess *)self allowedToUseUAAlwaysAdvertise])
  {
    uint64_t v5 = [(UAUserActivityClientProcess *)self userActivityAdvertisableItemByUUID:v4];
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 options];
      id v8 = [v7 objectForKeyedSubscript:UAAlwaysAdvertise];
      unsigned __int8 v9 = [v8 BOOLValue];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)allowedToUseUAAlwaysAdvertise
{
  return self->_allowedToUseUAAlwaysAdvertise;
}

- (BOOL)allowedToUseLSAlwaysPick
{
  return self->_allowedToUseLSAlwaysPick;
}

- (void)doUpdateUserActivityInfo:(id)a3 makeCurrent:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v104 = a4;
  id v7 = a3;
  id v8 = (void (**)(id, void *))a5;
  unsigned __int8 v9 = +[UAUserActivityDefaults sharedDefaults];
  unsigned int v106 = [v9 debugCrossoverAllActivities];

  CFStringRef v10 = sub_10000BA18(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (v104) {
      CFStringRef v11 = @"YES";
    }
    else {
      CFStringRef v11 = @"NO";
    }
    v12 = [v7 uuid];
    unsigned __int8 v13 = [v12 UUIDString];
    *(_DWORD *)buf = 138543875;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2113;
    *(void *)&buf[24] = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "doUpdateUserActivityInfo: makeCurrent=%{public}@ newInfo = %{public}@/%{private}@", buf, 0x20u);
  }
  CFStringRef v14 = [v7 uuid];
  unsigned __int8 v15 = [(UAUserActivityClientProcess *)self userActivityAdvertisableItemByUUID:v14];

  unsigned int v16 = +[NSDate date];
  [v7 setWhen:v16];

  __int16 v105 = self;
  if (v15)
  {
    int v17 = 0;
    LOBYTE(v18) = 0;
    goto LABEL_33;
  }
  v19 = [v7 activityType];

  if (!v19)
  {
    v27 = sub_10000BA18(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v28 = [(UAUserActivityClientProcess *)self auditToken];
      uint64_t v29 = (int)[v28 pid];
      uint64_t v30 = [(UAUserActivityClientProcess *)self bundleIdentifier];
      *(_DWORD *)buf = 134218243;
      *(void *)&uint8_t buf[4] = v29;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = v30;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "The application with pid %ld/%{private}@ didn't provide a activityType.", buf, 0x16u);
    }
    uint64_t v31 = UAContinuityErrorDomain;
    uint64_t v32 = -102;
    goto LABEL_18;
  }
  id v20 = [(UAUserActivityClientProcess *)self teamID];
  if (!v20)
  {
    id v20 = [(UAUserActivityClientProcess *)self applicationIdentifier];
    if (([v20 hasPrefix:@"com.apple."] & 1) == 0)
    {
      unsigned int v33 = [(UAUserActivityClientProcess *)self clientIsSandboxed];

      if (!v33) {
        goto LABEL_12;
      }
      v34 = sub_10000BA18(0);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = [(UAUserActivityClientProcess *)self auditToken];
        uint64_t v36 = (int)[v35 pid];
        v37 = [(UAUserActivityClientProcess *)self bundleIdentifier];
        if (v37)
        {
          v38 = [(UAUserActivityClientProcess *)self bundleIdentifier];
        }
        else
        {
          v38 = @"NULL";
        }
        *(_DWORD *)buf = 134218243;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&buf[12] = 2113;
        *(void *)&buf[14] = v38;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "The application with pid %ld/%{private}@ doesn't have a team identifier in its application-identifier, or isn't from com.apple., and is sandboxed, so unable to proceed.", buf, 0x16u);
        if (v37) {
      }
        }
      uint64_t v31 = UAContinuityErrorDomain;
      uint64_t v32 = -101;
LABEL_18:
      int v17 = +[NSError errorWithDomain:v31 code:v32 userInfo:0];
      unsigned __int8 v15 = 0;
      goto LABEL_28;
    }
  }

LABEL_12:
  v21 = [(UAUserActivityClientProcess *)self teamID];
  id v22 = sub_10000BA18(0);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = v8;
    uint64_t v24 = [(UAUserActivityClientProcess *)self auditToken];
    uint64_t v25 = [(UAUserActivityClientProcess *)self bundleIdentifier];
    if (v25)
    {
      uint64_t v26 = [(UAUserActivityClientProcess *)self bundleIdentifier];
    }
    else
    {
      uint64_t v26 = @"NULL";
    }
    unsigned __int8 v39 = [v7 activityType];
    *(_DWORD *)buf = 138544131;
    *(void *)&uint8_t buf[4] = v24;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v21;
    *(_WORD *)&buf[22] = 2113;
    *(void *)&buf[24] = v26;
    __int16 v108 = 2113;
    uint64_t v109 = v39;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Application %{public}@ is registering an activity with teamID %{private}@ bundleID=%{private}@ activityType=%{private}@", buf, 0x2Au);

    if (v25) {
    id v8 = v23;
    }
  }

  unsigned __int8 v15 = [[UAUserActivityAdvertisableItem alloc] initWithUserActivityInfo:v7 client:self];
  [(UAUserActivityAdvertisableItem *)v15 setTeamIdentifier:v21];
  id v40 = [(UAUserActivityClientProcess *)self bundleIdentifier];
  [(UAUserActivityAdvertisableItem *)v15 setBundleIdentifier:v40];

  [(UAUserActivityClientProcess *)self addUserActivity:v15];
  int v17 = 0;
LABEL_28:
  unsigned int v41 = [v7 options];
  v42 = [v41 objectForKeyedSubscript:@"UAProxiedBundleIdentifier"];

  LODWORD(v18) = v42 != 0;
  if (v42)
  {
    v102 = v8;
    __int16 v43 = sub_10000BA18(0);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v44 = [(UAUserActivityAdvertisableItem *)v15 uuid];
      __int16 v45 = [v44 UUIDString];
      CFStringRef v46 = [(UAAdvertisableItem *)v15 logString];
      __int16 v47 = [v7 options];
      BOOL v48 = [v47 objectForKeyedSubscript:@"UAProxiedBundleIdentifier"];
      *(_DWORD *)buf = 138543875;
      *(void *)&uint8_t buf[4] = v45;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = v46;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = v48;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "Application item %{public}@/%{private}@ has a proxy %{public}@, so forcing an advertisement update.", buf, 0x20u);

      self = v105;
    }

    id v8 = v102;
  }
  if (!v15)
  {
    unsigned int v74 = [(UAUserActivityClientProcess *)self controller];
    BOOL v75 = [v7 uuid];
    CFStringRef v76 = [v74 userActivityInfoForUUID:v75];

    if (v76) {
      uint64_t v77 = -107;
    }
    else {
      uint64_t v77 = -108;
    }
    uint64_t v101 = +[NSError errorWithDomain:UAContinuityErrorDomain code:v77 userInfo:0];

    unsigned __int8 v15 = 0;
    int v17 = (void *)v101;
    if (!v101) {
      goto LABEL_74;
    }
    goto LABEL_71;
  }
LABEL_33:
  uint64_t v49 = [(UAUserActivityAdvertisableItem *)v15 webpageURL];
  CFStringRef v50 = [v7 webpageURL];
  v51 = v50;
  if (v49 && v50)
  {
    unsigned __int8 v52 = [v49 isEqual:v50];

    if (v52) {
      goto LABEL_41;
    }
  }
  else
  {

    if (v49 == v51) {
      goto LABEL_41;
    }
  }
  uint64_t v18 = sub_10000BA18(0);
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEBUG))
  {
    v53 = [(UAUserActivityAdvertisableItem *)v15 uuid];
    BOOL v54 = [v53 UUIDString];
    v55 = [(UAAdvertisableItem *)v15 logString];
    *(_DWORD *)buf = 138543619;
    *(void *)&uint8_t buf[4] = v54;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v55;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_DEBUG, "Application item %{public}@/%{private}@ has changed .webPageURL, forcing an advertisement update.", buf, 0x16u);
  }
  LOBYTE(v18) = 1;
LABEL_41:
  uint64_t v56 = [(UAUserActivityAdvertisableItem *)v15 proxiedBundleIdentifier];
  v57 = [v7 options];
  v58 = [v57 objectForKeyedSubscript:@"UAProxiedBundleIdentifier"];
  id v59 = v58;
  if (v56 && v58)
  {
    unsigned __int8 v60 = [v56 isEqual:v58];

    if (v60) {
      goto LABEL_44;
    }
  }
  else
  {

    if (v56 == v59)
    {
LABEL_44:
      self = v105;
      if (!v104)
      {
        if (v18)
        {
          LODWORD(v18) = 1;
          goto LABEL_70;
        }
        goto LABEL_64;
      }
LABEL_51:
      uint64_t v66 = [(UAUserActivityClientProcess *)self currentAdvertisableActivity];
      if (!v66) {
        goto LABEL_59;
      }
      v67 = (void *)v66;
      BOOL v68 = v8;
      v69 = [(UAUserActivityClientProcess *)self currentAdvertisableActivity];
      id v70 = [v69 uuid];
      uint64_t v71 = [(UAUserActivityAdvertisableItem *)v15 uuid];
      BOOL v72 = (void *)v71;
      if (!v70) {
        goto LABEL_57;
      }
      if (v71) {
        unsigned __int8 v73 = [v70 isEqual:v71];
      }
      else {
LABEL_57:
      }
        unsigned __int8 v73 = v70 == (void *)v71;

      id v8 = v68;
      self = v105;
      if ((v73 & 1) == 0)
      {
LABEL_59:
        uint64_t v18 = sub_10000BA18(0);
        if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
        {
          [(UAUserActivityAdvertisableItem *)v15 uuid];
          id v79 = v78 = v8;
          id v80 = [v79 UUIDString];
          v81 = [(UAAdvertisableItem *)v15 logString];
          id v82 = [(UAUserActivityClientProcess *)v105 bundleIdentifier];
          v83 = [(UAUserActivityClientProcess *)v105 auditToken];
          signed int v84 = [v83 pid];
          *(_DWORD *)buf = 138544131;
          *(void *)&uint8_t buf[4] = v80;
          *(_WORD *)&buf[12] = 2113;
          *(void *)&buf[14] = v81;
          *(_WORD *)&buf[22] = 2113;
          *(void *)&buf[24] = v82;
          __int16 v108 = 2048;
          uint64_t v109 = (void *)v84;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "- Making %{public}@/%{private}@ into the currentItem from process %{private}@/%ld", buf, 0x2Au);

          id v8 = v78;
          self = v105;
        }
        objc_storeStrong((id *)&self->_currentAdvertisableActivity, v15);
        LOBYTE(v18) = 1;
      }
      char v85 = v18;
      BOOL v86 = !sub_10000AA28((uint64_t)[(UAUserActivityAdvertisableItem *)v15 type]);
      v106 |= v86;
      LODWORD(v18) = 1;
      if ((v85 & 1) != 0 || v86)
      {
LABEL_68:
        auditToken = self->_auditToken;
        if (auditToken)
        {
          memset(buf, 0, sizeof(buf));
          [(UAAuditToken *)auditToken auditTokenValue];
          unsigned int v88 = +[UADiagnosticManager sharedManager];
          v89 = [v7 activityType];
          [v88 submitUserActivityBecameCurrent:v89 withToken:buf];
        }
        goto LABEL_70;
      }
LABEL_64:
      if ([(UAUserActivityAdvertisableItem *)v15 alwaysPick]) {
        LODWORD(v18) = 1;
      }
      else {
        LODWORD(v18) = [(UAUserActivityAdvertisableItem *)v15 alwaysEligible];
      }
      if (!v104) {
        goto LABEL_70;
      }
      goto LABEL_68;
    }
  }
  uint64_t v18 = sub_10000BA18(0);
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v61 = [(UAUserActivityAdvertisableItem *)v15 uuid];
    uint64_t v62 = [v61 UUIDString];
    uint64_t v63 = [(UAAdvertisableItem *)v15 logString];
    v64 = [v7 options];
    id v65 = [v64 objectForKeyedSubscript:@"UAProxiedBundleIdentifier"];
    *(_DWORD *)buf = 138543875;
    *(void *)&uint8_t buf[4] = v62;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v63;
    *(_WORD *)&buf[22] = 2114;
    *(void *)&buf[24] = v65;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_DEBUG, "Application item %{public}@/%{private}@ has changed proxy %{public}@, so forcing an advertisement update.", buf, 0x20u);
  }
  LODWORD(v18) = 1;
  self = v105;
  if (v104) {
    goto LABEL_51;
  }
LABEL_70:
  [(UAUserActivityAdvertisableItem *)v15 update:v7];
  if (!v17) {
    goto LABEL_74;
  }
LABEL_71:
  __int16 v90 = sub_10000BA18(0);
  if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
  {
    v91 = [v7 uuid];
    id v92 = [v7 activityType];
    *(_DWORD *)buf = 138543875;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v91;
    *(_WORD *)&buf[22] = 2113;
    *(void *)&buf[24] = v92;
    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "refusing to register user activity from client, and returning error %{public}@ for item %{public}@ %{private}@", buf, 0x20u);
  }
LABEL_74:
  if (v18)
  {
    CFStringRef v93 = sub_10000BA18(0);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
    {
      __int16 v94 = [(UAUserActivityAdvertisableItem *)v15 uuid];
      CFStringRef v95 = [v94 UUIDString];
      *(_DWORD *)buf = 138543619;
      *(void *)&uint8_t buf[4] = v95;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = v15;
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "BECOMECURRENT: updating advertisement for %{public}@/%{private}@ because the becomeCurrent item changed or a DNS item changed its URL", buf, 0x16u);
    }
    __int16 v96 = [(UAUserActivityClientProcess *)self manager];
    [v96 scheduleUpdatingAdvertisableItems];
  }
  if (v106)
  {
    id v97 = sub_10000BA18(0);
    if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
    {
      objc_super v98 = [(UAUserActivityAdvertisableItem *)v15 uuid];
      v99 = [v98 UUIDString];
      *(_DWORD *)buf = 138543619;
      *(void *)&uint8_t buf[4] = v99;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = v15;
      _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_INFO, "BECOMECURRENT: updating notifiers for %{public}@/%{private}@ because the becomeCurrent item changed", buf, 0x16u);
    }
    __int16 v100 = [(UAUserActivityClientProcess *)self manager];
    [v100 scheduleBestAppDetermination];
  }
  v8[2](v8, v17);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (id)userActivityAdvertisableItemByUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_userActivityAdvertisableItemsByUUID objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)setOs_transaction:(id)a3
{
}

- (void)setBundleIdentifier:(id)a3
{
}

- (unsigned)allowedToAccessAnyItem
{
  return self->_allowedToAccessAnyItem;
}

- (void)invalidate
{
  v2 = self;
  objc_sync_enter(v2);
  [(UAUserActivityClientProcess *)v2 setOs_transaction:0];
  v3 = [(UAUserActivityClientProcess *)v2 connection];

  if (v3)
  {
    id v4 = [(UAUserActivityClientProcess *)v2 connection];
    [v4 setExportedObject:0];

    uint64_t v5 = [(UAUserActivityClientProcess *)v2 connection];
    [v5 invalidate];

    objc_storeWeak((id *)&v2->_connection, 0);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(UAUserActivityClientProcess *)v2 uniqueIdentifiers];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        CFStringRef v11 = sub_10000BA18(0);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v18 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "removing %{public}@ userActivityInfoItem", buf, 0xCu);
        }

        [(UAUserActivityClientProcess *)v2 removeUserActivityAdvertiseableItemByUUID:v10];
      }
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }

  v12 = +[NSNotificationCenter defaultCenter];
  [v12 removeObserver:v2 name:@"UAUserActivityDebugStateChanged" object:0];

  objc_sync_exit(v2);
}

- (NSArray)uniqueIdentifiers
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NSMutableDictionary *)v2->_userActivityAdvertisableItemsByUUID allKeys];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)removeUserActivity:(id)a3
{
  if (a3)
  {
    id v4 = [a3 uuid];
    [(UAUserActivityClientProcess *)self removeUserActivityAdvertiseableItemByUUID:v4];
  }
}

- (BOOL)removeUserActivityAdvertiseableItemByUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v4 UUIDString];
    *(_DWORD *)buf = 138543362;
    unsigned int v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "uuid=%{public}@", buf, 0xCu);
  }
  id v7 = self;
  objc_sync_enter(v7);
  [(NSMutableSet *)v7->_dirtyUUIDs removeObject:v4];
  [(NSMutableSet *)v7->_pendingResumeActivityUUIDs removeObject:v4];
  uint64_t v8 = [(UAUserActivityClientProcess *)v7 userActivityAdvertisableItemByUUID:v4];
  if (!v8)
  {
    if ([(UAUserActivityClientProcess *)v7 allowedToAccessAnyItem])
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v14 = [(UAUserActivityClientProcess *)v7 controller];
      long long v15 = [v14 additionalUserActivityAdvertisableItems];

      id v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v29;
        while (2)
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v29 != v17) {
              objc_enumerationMutation(v15);
            }
            v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            id v20 = [v19 uuid];
            unsigned int v21 = [v20 isEqual:v4];

            if (v21)
            {
              id v22 = sub_10000BA18(0);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                id v23 = [0 uuid];
                uint64_t v24 = [v23 UUIDString];
                uint64_t v25 = [0 logString];
                *(_DWORD *)buf = 138543619;
                unsigned int v33 = v24;
                __int16 v34 = 2113;
                v35 = v25;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Removing item %{public}@/%{private}@ from additionalUserActivityAdvertisableItems", buf, 0x16u);
              }
              uint64_t v26 = [(UAUserActivityClientProcess *)v7 controller];
              [v26 removeAdditionalUserActivityAdvertisableItems:v19];

              goto LABEL_25;
            }
          }
          id v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
LABEL_25:
    }
    objc_sync_exit(v7);
    goto LABEL_27;
  }
  unsigned __int8 v9 = [(UAUserActivityClientProcess *)v7 currentAdvertisableActivity];
  if (v9)
  {
    uint64_t v10 = [(UAUserActivityClientProcess *)v7 currentAdvertisableActivity];
    CFStringRef v11 = [v10 uuid];
    unsigned int v12 = [v11 isEqual:v4];

    if (v12)
    {
      currentAdvertisableActivity = v7->_currentAdvertisableActivity;
      v7->_currentAdvertisableActivity = 0;

      if (sub_10000AA28((uint64_t)[v8 type])
        || ([v8 alwaysEligible] & 1) != 0)
      {
        LODWORD(v9) = 1;
      }
      else
      {
        LODWORD(v9) = [v8 alwaysEligible];
      }
    }
    else
    {
      LODWORD(v9) = 0;
    }
  }
  [v8 setClient:0];
  [(NSMutableDictionary *)v7->_userActivityAdvertisableItemsByUUID removeObjectForKey:v4];

  objc_sync_exit(v7);
  if (v9)
  {
    id v7 = [(UAUserActivityClientProcess *)v7 manager];
    [(UAUserActivityClientProcess *)v7 scheduleUpdatingAdvertisableItems];
LABEL_27:
  }
  return v8 != 0;
}

- (BOOL)isDirtyActivityWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  unsigned __int8 v6 = [(NSMutableSet *)v5->_dirtyUUIDs containsObject:v4];
  objc_sync_exit(v5);

  return v6;
}

- (BOOL)askSourceProcessToUpdateActivityWithUUID:(id)a3 evenIfClean:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  __int16 v47 = (void (**)(void))a5;
  unsigned __int8 v9 = sub_10000BA18(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = [v8 UUIDString];
    CFStringRef v11 = [(UAUserActivityClientProcess *)self auditToken];
    *(_DWORD *)buf = 138543618;
    id v62 = v10;
    __int16 v63 = 2048;
    v64 = (void *)(int)[v11 pid];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}@ from client %ld", buf, 0x16u);
  }
  unsigned int v12 = self;
  objc_sync_enter(v12);
  if (a4) {
    unsigned __int8 v13 = 1;
  }
  else {
    unsigned __int8 v13 = [(NSMutableSet *)v12->_dirtyUUIDs containsObject:v8];
  }
  unsigned int v14 = [(NSMutableSet *)v12->_pendingResumeActivityUUIDs containsObject:v8];
  objc_sync_exit(v12);

  if (v13)
  {
    if (!v14)
    {
      uint64_t v24 = [(UAUserActivityClientProcess *)v12 auditToken];
      CFStringRef v46 = +[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:", [v24 pid]);

      __int16 v45 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.coreservices.useractivityd" name:@"ActivityAdvertising"];
      id v25 = objc_alloc((Class)RBSAssertion);
      unsigned __int8 v60 = v45;
      uint64_t v26 = +[NSArray arrayWithObjects:&v60 count:1];
      id v27 = [v25 initWithExplanation:@"Allow process to update handoff payload" target:v46 attributes:v26];

      id v59 = 0;
      unsigned __int8 v28 = [v27 acquireWithError:&v59];
      id v43 = v59;
      if (v43) {
        unsigned __int8 v29 = 0;
      }
      else {
        unsigned __int8 v29 = v28;
      }
      if ((v29 & 1) == 0)
      {
        long long v30 = sub_10000BA18(0);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v62 = v43;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Error acquiring RBSAssertion: %@", buf, 0xCu);
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)&v12->_connection);
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_10005D290;
      v54[3] = &unk_1000C5EE8;
      id v32 = v8;
      id v55 = v32;
      uint64_t v56 = v12;
      unsigned int v33 = v47;
      v58 = v33;
      id v44 = v27;
      id v57 = v44;
      __int16 v34 = [WeakRetained remoteObjectProxyWithErrorHandler:v54];

      BOOL v23 = v34 != 0;
      if (v34)
      {
        v35 = v12;
        objc_sync_enter(v35);
        [(NSMutableSet *)v12->_pendingResumeActivityUUIDs addObject:v32];
        objc_sync_exit(v35);

        uint64_t v36 = [(UAUserActivityClientProcess *)v35 userActivityAdvertisableItemByUUID:v32];
        v37 = sub_10000BA18(0);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = [v32 UUIDString];
          *(_DWORD *)buf = 138543362;
          id v62 = v38;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Calling back to client to ask it to save activity %{public}@", buf, 0xCu);
        }
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_10005D3E0;
        v48[3] = &unk_1000C5F10;
        id v49 = v32;
        id v50 = v36;
        v51 = v35;
        v53 = v33;
        id v52 = v44;
        id v39 = v36;
        [v34 askClientUserActivityToSave:v49 completionHandler:v48];
      }
      else
      {
        id v40 = sub_10000BA18(0);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          unsigned int v41 = [(UAUserActivityClientProcess *)v12 bundleIdentifier];
          *(_DWORD *)buf = 138543619;
          id v62 = v32;
          __int16 v63 = 2113;
          v64 = v41;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Unable to call willSave for user activity %{public}@ for process %{private}@ because its owning process/connection seems to be gone.", buf, 0x16u);
        }
        [v44 invalidate];
      }

      goto LABEL_32;
    }
    long long v15 = sub_10000BA18(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v8 UUIDString];
      *(_DWORD *)buf = 138543362;
      id v62 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, " - A prepareToResume is already in progress for activity %{public}@, queuing callback for when fetch is complete", buf, 0xCu);
    }
    uint64_t v17 = objc_alloc_init(UAUserActivityClientPendingUpdateTask);
    [(UAUserActivityClientPendingUpdateTask *)v17 setUuid:v8];
    [(UAUserActivityClientPendingUpdateTask *)v17 setBlock:v47];
    uint64_t v18 = v12;
    objc_sync_enter(v18);
    v19 = [(UAUserActivityClientProcess *)v18 pendingUpdateTasks];
    [v19 addObject:v17];

    objc_sync_exit(v18);
LABEL_15:
    BOOL v23 = 1;
LABEL_32:
    id v22 = v47;
    goto LABEL_33;
  }
  id v20 = sub_10000BA18(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v21 = [v8 UUIDString];
    *(_DWORD *)buf = 138543362;
    id v62 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, " - no need to call back to get updated info for activity %{public}@, because it is not dirty", buf, 0xCu);
  }
  id v22 = v47;
  if (v47)
  {
    v47[2]();
    goto LABEL_15;
  }
  BOOL v23 = 1;
LABEL_33:

  return v23;
}

- (BOOL)didResumeUserActivityWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10005D7E4;
  v14[3] = &unk_1000C5658;
  id v9 = v7;
  id v15 = v9;
  uint64_t v10 = [WeakRetained remoteObjectProxyWithErrorHandler:v14];

  CFStringRef v11 = sub_10000BA18(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = [v6 UUIDString];
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Telling client that user activity %{public}@ was resumed (on another device).", buf, 0xCu);
  }
  [v10 tellClientUserActivityItWasResumed:v6];
  if (v9) {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }

  return 1;
}

- (void)dispatchPendingTasksForUUID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = objc_alloc_init((Class)NSMutableIndexSet);
  uint64_t v10 = [(UAUserActivityClientProcess *)v8 pendingUpdateTasks];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10005DB80;
  v20[3] = &unk_1000C5F38;
  id v11 = v6;
  id v21 = v11;
  id v12 = v7;
  id v22 = v12;
  id v13 = v9;
  id v23 = v13;
  [v10 enumerateObjectsUsingBlock:v20];

  if ([v13 count])
  {
    unsigned int v14 = sub_10000BA18(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v13 count];
      *(_DWORD *)buf = 134218242;
      id v25 = v15;
      __int16 v26 = 2114;
      id v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, " -- Called %lu pending fetch tasks for %{public}@, removing from queue", buf, 0x16u);
    }

    id v16 = [(UAUserActivityClientProcess *)v8 pendingUpdateTasks];
    [v16 removeObjectsAtIndexes:v13];
  }
  else
  {
    id v16 = sub_10000BA18(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, " -- No pending fetch tasks called for %{public}@", buf, 0xCu);
    }
  }

  uint64_t v17 = sub_10000BA18(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = [(UAUserActivityClientProcess *)v8 pendingUpdateTasks];
    id v19 = [v18 count];
    *(_DWORD *)buf = 134217984;
    id v25 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, " -- %lu remaining queued tasks total", buf, 0xCu);
  }
  objc_sync_exit(v8);
}

- (NSString)description
{
  v3 = [(UAUserActivityClientProcess *)self auditToken];
  id v4 = [v3 pid];
  uint64_t v5 = [(UAUserActivityClientProcess *)self bundleIdentifier];
  id v6 = [(UAUserActivityClientProcess *)self uniqueIdentifiers];
  id v7 = +[NSMutableString stringWithFormat:@"{"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) UUIDString];
        [v7 appendFormat:@"%@ ", v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  [v7 appendString:@"}"];
  unsigned int v14 = +[NSString stringWithFormat:@"UserActivityClient(pid=%d/%@ uuids=%@)", v4, v5, v7];

  return (NSString *)v14;
}

- (void)doInitializeWithClientVersion:(int64_t)a3 clientInfo:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v11 = sub_10000BA18(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(UAUserActivityClientProcess *)self auditToken];
    id v13 = [(UAUserActivityClientProcess *)self bundleIdentifier];
    if (self->_allowedToAccessAnyItem) {
      CFStringRef v14 = @"YES";
    }
    else {
      CFStringRef v14 = @"NO";
    }
    id v15 = v10;
    id v16 = v9;
    if (self->_clientIsSandboxed) {
      CFStringRef v17 = @"YES";
    }
    else {
      CFStringRef v17 = @"NO";
    }
    [v8 description];
    v18 = id v31 = v8;
    sub_100063FF0(v18);
    v19 = long long v30 = self;
    *(_DWORD *)buf = 134219267;
    int64_t v33 = a3;
    __int16 v34 = 2114;
    v35 = v12;
    __int16 v36 = 2113;
    v37 = v13;
    __int16 v38 = 2114;
    CFStringRef v39 = v14;
    __int16 v40 = 2114;
    CFStringRef v41 = v17;
    id v9 = v16;
    id v10 = v15;
    __int16 v42 = 2113;
    id v43 = v19;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CLIENT: version=%ld, %{public}@ %{private}@ any=%{public}@ sandbox=%{public}@ clientInfo=%{private}@", buf, 0x3Eu);

    id v8 = v31;
    self = v30;
  }

  if (v8)
  {
    if ([(UAUserActivityClientProcess *)self clientIsSandboxed])
    {
      id v20 = +[NSXPCConnection currentConnection];
      id v21 = [v20 valueForEntitlement:@"com.apple.private.useractivity.allowedtosetbundleidentifier"];
      unsigned int v22 = [v21 BOOLValue];

      if (v22)
      {
        id v23 = [(UAUserActivityClientProcess *)self bundleIdentifier];

        if (!v23)
        {
          uint64_t v24 = [v8 objectForKey:@"CFBundleIdentifier"];
          [(UAUserActivityClientProcess *)self setBundleIdentifier:v24];
        }
        id v25 = [(UAUserActivityClientProcess *)self applicationIdentifier];

        if (!v25)
        {
          __int16 v26 = [(UAUserActivityClientProcess *)self bundleIdentifier];
          [(UAUserActivityClientProcess *)self setApplicationIdentifier:v26];
LABEL_20:
        }
      }
    }
    else
    {
      id v27 = [(UAUserActivityClientProcess *)self applicationIdentifier];

      if (!v27)
      {
        unsigned __int8 v28 = [v8 objectForKey:@"application-identifier"];
        [(UAUserActivityClientProcess *)self setApplicationIdentifier:v28];
      }
      unsigned __int8 v29 = [(UAUserActivityClientProcess *)self bundleIdentifier];

      if (!v29)
      {
        __int16 v26 = [v8 objectForKey:@"CFBundleIdentifier"];
        [(UAUserActivityClientProcess *)self setBundleIdentifier:v26];
        goto LABEL_20;
      }
    }
  }
  (*((void (**)(id, uint64_t, void, void))v9 + 2))(v9, 1, 0, 0);
}

- (void)doDeleteUserActivityWithUUID:(id)a3
{
  id v4 = a3;
  id v6 = sub_10000BA18(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [v4 UUIDString];
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "deleteUserActivity %{public}@", (uint8_t *)&v8, 0xCu);
  }
  if (v4) {
    [(UAUserActivityClientProcess *)self removeUserActivityAdvertiseableItemByUUID:v4];
  }
}

- (void)doAddDynamicUserActivity:(id)a3 matching:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = sub_10000BA18(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478083;
    id v31 = v6;
    __int16 v32 = 2113;
    id v33 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "doAddDynamicUserActivity(%{private}@ %{private}@)", buf, 0x16u);
  }

  if (v6 && v7)
  {
    id v9 = [(UAUserActivityClientProcess *)self teamID];
    id v10 = +[NSString stringWithFormat:@"%@:%@:%@", v9, v7, v6];

    uint64_t v11 = (void *)_LSCreateHashedBytesForAdvertisingFromString();
    id v12 = (void *)_LSCreateDatabaseLookupStringFromHashedBytesForAdvertising();
    if (v12)
    {
      id v13 = [(UAUserActivityClientProcess *)self teamID];
      CFStringRef v14 = +[NSString stringWithFormat:@"%@:%@", v13, v7];

      unsigned __int8 v29 = (void *)_LSCreateHashedBytesForAdvertisingFromString();
      id v15 = (void *)_LSCreateDatabaseLookupStringFromHashedBytesForAdvertising();
      if (v15
        && ([(UAUserActivityClientProcess *)self teamID],
            id v16 = objc_claimAutoreleasedReturnValue(),
            v16,
            v16))
      {
        unsigned __int8 v28 = v11;
        id v17 = objc_alloc((Class)NSUserDefaults);
        long long v18 = [v17 initWithSuiteName:kUADynamicUserActivitesPreferences];
        uint64_t v27 = kUADynamicUserActivitiesKey;
        long long v19 = -[NSObject objectForKey:](v18, "objectForKey:");
        id v20 = [v19 mutableCopy];

        if (!v20) {
          id v20 = objc_alloc_init((Class)NSMutableDictionary);
        }
        v38[0] = kUADynamicUserActivityHashKey;
        v38[1] = kUADynamicUserActivityDynamicActivityKey;
        v39[0] = v15;
        v39[1] = v6;
        v38[2] = kUADynamicUserActivityTeamIDKey;
        id v21 = [(UAUserActivityClientProcess *)self teamID];
        v38[3] = kUADynamicUserActivityAppActivityKey;
        v39[2] = v21;
        v39[3] = v7;
        unsigned int v22 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];

        [v20 setValue:v22 forKey:v12];
        [v18 setValue:v20 forKey:v27];
        [v18 synchronize];

        uint64_t v11 = v28;
      }
      else
      {
        long long v18 = sub_10000BA18(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          [(UAUserActivityClientProcess *)self teamID];
          v24 = id v23 = v11;
          *(_DWORD *)buf = 138544130;
          id v31 = v6;
          __int16 v32 = 2114;
          id v33 = v7;
          __int16 v34 = 2114;
          v35 = v15;
          __int16 v36 = 2114;
          v37 = v24;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "doAddDynamicUserActivity(%{public}@, %{public}@) failed, nil for hash %{public}@ or teamID %{public}@.", buf, 0x2Au);

          uint64_t v11 = v23;
        }
      }
    }
    else
    {
      CFStringRef v14 = sub_10000BA18(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        [(UAUserActivityClientProcess *)self teamID];
        v26 = id v25 = v11;
        *(_DWORD *)buf = 138543874;
        id v31 = v6;
        __int16 v32 = 2114;
        id v33 = v7;
        __int16 v34 = 2114;
        v35 = v26;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "doAddDynamicUserActivity, nil dynamicHash from (%{public}@, %{public}@, %{public}@).", buf, 0x20u);

        uint64_t v11 = v25;
      }
    }
  }
  else
  {
    id v10 = sub_10000BA18(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v31 = v6;
      __int16 v32 = 2114;
      id v33 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "doAddDynamicUserActivity(%{public}@, %{public}@) failed, nil for one param.", buf, 0x16u);
    }
  }
}

- (void)doRemoveDynamicUserActivity:(id)a3 matching:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = sub_10000BA18(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478083;
    id v40 = v6;
    __int16 v41 = 2113;
    id v42 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "doRemoveDynamicUserActivity(%{private}@ %{private}@)", buf, 0x16u);
  }

  if (v7)
  {
    id v9 = objc_alloc((Class)NSUserDefaults);
    id v10 = [v9 initWithSuiteName:kUADynamicUserActivitesPreferences];
    uint64_t v11 = kUADynamicUserActivitiesKey;
    id v12 = [v10 objectForKey:kUADynamicUserActivitiesKey];
    id v13 = [v12 mutableCopy];

    if (v6)
    {
      CFStringRef v14 = [(UAUserActivityClientProcess *)self teamID];
      id v15 = +[NSString stringWithFormat:@"%@:%@:%@", v14, v7, v6];

      id v16 = (void *)_LSCreateHashedBytesForAdvertisingFromString();
      id v17 = (void *)_LSCreateDatabaseLookupStringFromHashedBytesForAdvertising();
      [v13 removeObjectForKey:v17];
      [v10 setValue:v13 forKey:v11];
      [v10 synchronize];
    }
    else
    {
      uint64_t v31 = v11;
      __int16 v32 = v10;
      id v15 = [v13 allKeys];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v18 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v35;
        uint64_t v21 = kUADynamicUserActivityAppActivityKey;
        do
        {
          unsigned int v22 = 0;
          id v33 = v19;
          do
          {
            if (*(void *)v35 != v20) {
              objc_enumerationMutation(v15);
            }
            id v23 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v22);
            uint64_t v24 = [v13 valueForKey:v23];
            id v25 = [v24 valueForKey:v21];
            if ([v7 isEqualToString:v25])
            {
              uint64_t v26 = v21;
              uint64_t v27 = v20;
              id v28 = v7;
              unsigned __int8 v29 = v15;
              long long v30 = sub_10000BA18(0);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                id v40 = v23;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, " - found %{public}@ activity, removing it.", buf, 0xCu);
              }

              [v13 removeObjectForKey:v23];
              id v15 = v29;
              id v7 = v28;
              uint64_t v20 = v27;
              uint64_t v21 = v26;
              id v19 = v33;
            }

            unsigned int v22 = (char *)v22 + 1;
          }
          while (v19 != v22);
          id v19 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v19);
      }
      id v10 = v32;
      [v32 setValue:v13 forKey:v31];
      [v32 synchronize];
      id v6 = 0;
    }
  }
  else
  {
    id v10 = sub_10000BA18(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v40 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "doRemoveDynamicUserActivity(%{public}@), nil appActivity", buf, 0xCu);
    }
  }
}

- (void)doPinUserActivityInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = (void (**)(id, void *, void))a4;
  int v8 = [(UAUserActivityClientProcess *)self connection];
  id v9 = [v8 valueForEntitlement:@"com.apple.private.coreservices.canopenactivity"];
  unsigned int v10 = [v9 BOOLValue];

  if (v10)
  {
    uint64_t v11 = +[NSUUID UUID];
    [(__CFString *)v6 setUuid:v11];
    id v12 = [(UAUserActivityClientProcess *)self manager];
    [v12 setPinnedUserActivityInfoItem:v6];

    id v13 = sub_10000BA18(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      CFStringRef v14 = [(__CFString *)v6 uuid];
      id v15 = [v14 UUIDString];
      *(_DWORD *)buf = 138543619;
      id v23 = v15;
      __int16 v24 = 2113;
      CFStringRef v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Pinned Activity Info: %{public}@/%{private}@", buf, 0x16u);
    }
    v7[2](v7, v11, 0);
  }
  else
  {
    id v16 = sub_10000BA18(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = [UAAuditToken alloc];
      id v18 = [(UAUserActivityClientProcess *)self connection];
      id v19 = v18;
      if (v18) {
        [v18 auditToken];
      }
      else {
        memset(v21, 0, sizeof(v21));
      }
      uint64_t v20 = [(UAAuditToken *)v17 initWithAuditToken:v21];
      *(_DWORD *)buf = 138543618;
      id v23 = v20;
      __int16 v24 = 2114;
      CFStringRef v25 = @"com.apple.private.coreservices.canopenactivity";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "*** Attempt to pin activity from process %{public}@, which doesn't have the %{public}@ entitlement.", buf, 0x16u);
    }
    uint64_t v11 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-112 userInfo:0];
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v11);
  }
}

- (void)doGetCurrentUserActivityInfo:(id)a3
{
  id v4 = (void (**)(id, void *, void *, void *, void *, void *))a3;
  if (![(UAUserActivityClientProcess *)self allowedToGetCurrentActivityInfo])
  {
    CFStringRef v14 = sub_10000BA18(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = [UAAuditToken alloc];
      id v16 = [(UAUserActivityClientProcess *)self connection];
      id v17 = v16;
      if (v16) {
        [v16 auditToken];
      }
      else {
        memset(v29, 0, sizeof(v29));
      }
      unsigned int v22 = [(UAAuditToken *)v15 initWithAuditToken:v29];
      *(_DWORD *)buf = 138543618;
      long long v35 = v22;
      __int16 v36 = 2114;
      CFStringRef v37 = @"com.apple.private.coreservices.cangetcurrentactivityinfo";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "*** Attempt to get current activity information from process %{public}@, which doesn't have the %{public}@ entitlement.", buf, 0x16u);
    }
    uint64_t v21 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-112 userInfo:0];
    id v13 = 0;
LABEL_22:
    uint64_t v20 = 0;
    goto LABEL_23;
  }
  uint64_t v5 = [(UAUserActivityClientProcess *)self manager];
  id v6 = [v5 uaAdvertisableItemsInOrder];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (!v8)
  {
LABEL_10:

    id v13 = 0;
LABEL_18:
    uint64_t v21 = 0;
    goto LABEL_22;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v31;
LABEL_4:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v31 != v10) {
      objc_enumerationMutation(v7);
    }
    id v12 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    if (v9 == (id)++v11)
    {
      id v9 = [v7 countByEnumeratingWithState:&v30 objects:v40 count:16];
      if (v9) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  id v13 = v12;

  if (!v13) {
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_18;
  }
  id v18 = [v13 client];
  id v19 = v18;
  if (v18)
  {
    uint64_t v20 = [v18 bundleIdentifier];
  }
  else
  {
    uint64_t v20 = 0;
  }

  uint64_t v21 = 0;
LABEL_23:
  id v23 = sub_10000BA18(0);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    __int16 v24 = [v13 uuid];
    CFStringRef v25 = [v24 UUIDString];
    *(_DWORD *)buf = 138543875;
    long long v35 = v25;
    __int16 v36 = 2113;
    CFStringRef v37 = v20;
    __int16 v38 = 2114;
    CFStringRef v39 = v21;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "result=%{public}@ %{private}@ error=%{public}@", buf, 0x20u);
  }
  uint64_t v26 = [v13 uuid];
  uint64_t v27 = [v13 activityType];
  id v28 = [v13 dynamicActivityType];
  v4[2](v4, v26, v27, v28, v20, v21);
}

- (void)doGetUserActivityProxiesWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void *))a4;
  __int16 v38 = objc_opt_new();
  id v8 = sub_10000BA18(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v6 description];
    sub_100063FF0(v9);
    uint64_t v10 = (UAAuditToken *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    __int16 v47 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "doGetUserActivityProxiesWithOptions:%{public}@", buf, 0xCu);
  }
  if ([(UAUserActivityClientProcess *)self allowedToMatchUserActivities])
  {
    __int16 v36 = v7;
    id v37 = v6;
    uint64_t v11 = [(UAUserActivityClientProcess *)self manager];
    id v12 = [v11 advertiseableItems];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v41;
      id v17 = v13;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(v13);
          }
          id v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v20 = [v19 client];
            uint64_t v21 = v20;
            if (v20)
            {
              unsigned int v22 = [v20 bundleIdentifier];
            }
            else
            {
              unsigned int v22 = 0;
            }
            id v23 = objc_alloc((Class)UAUserActivityProxy);
            __int16 v24 = [v19 uuid];
            CFStringRef v25 = [v19 activityType];
            uint64_t v26 = [v19 dynamicActivityType];
            id v27 = [v23 initWithUUID:v24 activityType:v25 dynamicActivityType:v26 bundleID:v22];

            [v38 addObject:v27];
            id v13 = v17;
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v40 objects:v50 count:16];
      }
      while (v15);
    }

    id v28 = 0;
    id v7 = v36;
    id v6 = v37;
  }
  else
  {
    unsigned __int8 v29 = sub_10000BA18(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      long long v30 = [UAAuditToken alloc];
      long long v31 = [(UAUserActivityClientProcess *)self connection];
      long long v32 = v31;
      if (v31) {
        [v31 auditToken];
      }
      else {
        memset(v39, 0, sizeof(v39));
      }
      long long v33 = [(UAAuditToken *)v30 initWithAuditToken:v39];
      *(_DWORD *)buf = 138543618;
      __int16 v47 = v33;
      __int16 v48 = 2114;
      CFStringRef v49 = @"com.apple.private.coreservices.allowedToMatchUserActivities";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "*** Attempt to get current activity information from process %{public}@, which doesn't have the %{public}@ entitlement.", buf, 0x16u);
    }
    uint64_t v34 = UAContinuityErrorDomain;
    CFStringRef v44 = @"entitlement";
    CFStringRef v45 = @"com.apple.private.coreservices.allowedToMatchUserActivities";
    id v13 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    id v28 = +[NSError errorWithDomain:v34 code:-135 userInfo:v13];
  }

  id v35 = [v38 copy];
  v7[2](v7, v35, v28);
}

- (void)doDetermineIfUserActivityIsCurrent:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000BA18(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = [v6 UUIDString];
    *(_DWORD *)buf = 138543362;
    CFStringRef v44 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "doDetermineIfUserActivityIsCurrent: uuid=%{public}@", buf, 0xCu);
  }
  if (![(UAUserActivityClientProcess *)self allowedToGetCurrentActivityInfo])
  {
    uint64_t v20 = sub_10000BA18(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = [UAAuditToken alloc];
      unsigned int v22 = [(UAUserActivityClientProcess *)self connection];
      id v23 = v22;
      if (v22)
      {
        [v22 auditToken];
      }
      else
      {
        long long v37 = 0u;
        long long v38 = 0u;
      }
      id v35 = [(UAAuditToken *)v21 initWithAuditToken:&v37];
      *(_DWORD *)buf = 138543618;
      CFStringRef v44 = v35;
      __int16 v45 = 2114;
      CFStringRef v46 = @"com.apple.private.coreservices.cangetcurrentactivityinfo";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "*** Attempt to determineIfUserActivityIsCurrent from process %{public}@, which doesn't have the %{public}@ entitlement.", buf, 0x16u);
    }
    uint64_t v18 = UAContinuityErrorDomain;
    uint64_t v19 = -112;
LABEL_26:
    __int16 v24 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v18, v19, 0, v37, v38);
    (*((void (**)(id, void, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, 0, v24);
    uint64_t v11 = v6;
LABEL_30:

    goto LABEL_31;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v10 = [(UAUserActivityClientProcess *)self manager];
  uint64_t v11 = [v10 clients];

  id v12 = [v11 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v40;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(__CFString **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v17 = [(__CFString *)v16 userActivityInfoForUUID:v6];
        if (v17)
        {
          __int16 v24 = (void *)v17;
          CFStringRef v25 = sub_10000BA18(0);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v26 = [v6 UUIDString];
            *(_DWORD *)buf = 138543875;
            CFStringRef v44 = v26;
            __int16 v45 = 2114;
            CFStringRef v46 = v16;
            __int16 v47 = 2113;
            __int16 v48 = v24;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "doDetermineIfUserActivityIsCurrent: Found uuid=%{public}@, in client %{public}@ as %{private}@", buf, 0x20u);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v27 = [(__CFString *)v16 userActivityClientForUUID:v6];
            id v28 = v27;
            if (v27)
            {
              unsigned __int8 v29 = [v27 currentAdvertisableActivity];
              long long v30 = [v29 uuid];
              uint64_t v31 = (uint64_t)[v30 isEqual:v6];

              long long v32 = [v28 bundleIdentifier];
              long long v33 = [v28 auditToken];
              id v34 = [v33 pid];
            }
            else
            {
              long long v32 = 0;
              id v34 = 0;
              uint64_t v31 = 1;
            }
          }
          else
          {
            long long v32 = 0;
            id v34 = 0;
            uint64_t v31 = 1;
          }
          __int16 v36 = [v24 activityType];
          (*((void (**)(id, uint64_t, void *, id, void *, void))v7 + 2))(v7, v31, v32, v34, v36, 0);

          goto LABEL_30;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v39 objects:v49 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  if (v6)
  {
    uint64_t v18 = UAContinuityErrorDomain;
    uint64_t v19 = -108;
    goto LABEL_26;
  }
LABEL_31:
}

- (void)doGetLoggingFileForClient:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  if (a5)
  {
    id v6 = a5;
    id v7 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
    (*((void (**)(id, void, id))a5 + 2))(v6, 0, v7);
  }
}

- (void)doFetchUserActivityInfoWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = sub_10000BA18(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = [v6 UUIDString];
    *(_DWORD *)buf = 138543362;
    CFStringRef v44 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "doFetchUserActivityInfoWithUUID:(%{public}@)", buf, 0xCu);
  }
  uint64_t v11 = [(UAUserActivityClientProcess *)self userActivityAdvertisableItemByUUID:v6];
  if (v11)
  {
    id v12 = v11;
    if ([v11 isDirty])
    {
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10005FF20;
      v40[3] = &unk_1000C5F60;
      id v13 = (void (**)(id, void, void *))v7;
      id v42 = v13;
      id v12 = v12;
      id v41 = v12;
      if (([v12 requestPayloadWithCompletionHandler:v40] & 1) == 0)
      {
        uint64_t v14 = sub_10000BA18(0);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, " -- Could not update activityInfo for fetch", buf, 2u);
        }

        id v15 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-133 userInfo:0];
        v13[2](v13, 0, v15);
      }
      uint64_t v16 = v42;
LABEL_21:

      goto LABEL_24;
    }
    id v25 = [v12 copy];
LABEL_23:
    uint64_t v26 = v25;
    (*((void (**)(id, id, void))v7 + 2))(v7, v25, 0);

    goto LABEL_24;
  }
  if ([(UAUserActivityClientProcess *)self allowedToAccessAnyItem]
    || [(UAUserActivityClientProcess *)self allowedToGetCurrentActivityInfo])
  {
    uint64_t v17 = [(UAUserActivityClientProcess *)self controller];
    uint64_t v18 = [v17 userActivityInfoForUUID:v6];

    if (v18) {
      goto LABEL_14;
    }
  }
  uint64_t v19 = [(UAUserActivityClientProcess *)self manager];
  uint64_t v18 = [v19 cornerActionItemForUUID:v6];

  if (v18)
  {
LABEL_14:
    uint64_t v20 = sub_10000BA18(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [v6 UUIDString];
      *(_DWORD *)buf = 138543362;
      CFStringRef v44 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "-- activity with uuid %{public}@, so fetching payload for it.", buf, 0xCu);
    }
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10005FFBC;
    v36[3] = &unk_1000C5F88;
    id v37 = v6;
    id v12 = v18;
    id v38 = v12;
    id v22 = v7;
    id v39 = v22;
    if (([v12 requestPayloadWithCompletionHandler:v36] & 1) == 0)
    {
      id v23 = sub_10000BA18(0);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, " -- Could not update activityInfo for fetch", buf, 2u);
      }

      __int16 v24 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-133 userInfo:0];
      (*((void (**)(id, void, void *))v22 + 2))(v22, 0, v24);
    }
    uint64_t v16 = v37;
    goto LABEL_21;
  }
  id v27 = [(UAUserActivityClientProcess *)self manager];
  id v28 = [v27 pinnedUserActivityInfoItem];
  unsigned __int8 v29 = [v28 uuid];
  unsigned int v30 = [v29 isEqual:v6];

  if (v30)
  {
    uint64_t v31 = sub_10000BA18(0);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      long long v32 = [(UAUserActivityClientProcess *)self manager];
      long long v33 = [v32 pinnedUserActivityInfoItem];
      *(_DWORD *)buf = 138477827;
      CFStringRef v44 = v33;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, " -- Sending Pinned userActivityInfo back to client: %{private}@", buf, 0xCu);
    }
    id v12 = [(UAUserActivityClientProcess *)self manager];
    id v25 = [v12 pinnedUserActivityInfoItem];
    goto LABEL_23;
  }
  id v12 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-106 userInfo:0];
  id v34 = sub_10000BA18(0);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    id v35 = [v6 UUIDString];
    *(_DWORD *)buf = 138543618;
    CFStringRef v44 = v35;
    __int16 v45 = 2114;
    id v46 = v12;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Activity with uuid %{public}@ fetch requested, but was neither a locally created item nor a corner action item, so returning error %{public}@", buf, 0x16u);
  }
  (*((void (**)(id, void, id))v7 + 2))(v7, 0, v12);
LABEL_24:
}

- (void)doRegisterAsProxyApplicationForPid:(int)a3 options:(id)a4 completionHandler:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  uint64_t v10 = sub_10000BA18(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12[0] = 67240450;
    v12[1] = v6;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "doRegisterAsProxyApplicationForPid, pid=%{public}d options=%{public}@", (uint8_t *)v12, 0x12u);
  }

  uint64_t v11 = [(UAUserActivityClientProcess *)self controller];
  [v11 registerAsProxyApplication:self forPid:v6];

  v9[2](v9, 0);
}

- (id)statusString
{
  uint64_t v3 = [(UAUserActivityClientProcess *)self bundleIdentifier];
  id v49 = (id)[(UAAuditToken *)self->_auditToken pid];
  id v4 = [(UAUserActivityClientProcess *)self currentAdvertisableActivity];
  if (v4)
  {
    long long v43 = [(UAUserActivityClientProcess *)self currentAdvertisableActivity];
    id v42 = [v43 uuid];
    CFStringRef v45 = [v42 UUIDString];
  }
  else
  {
    CFStringRef v45 = @"-";
  }
  uint64_t v5 = [(UAUserActivityClientProcess *)self currentAdvertisableActivity];
  CFStringRef v6 = &stru_1000C6800;
  id v46 = (void *)v3;
  if (v5)
  {
    id v7 = [(UAUserActivityClientProcess *)self dirtyUUIDs];
    id v39 = [(UAUserActivityClientProcess *)self currentAdvertisableActivity];
    [v39 uuid];
    v38 = long long v40 = v7;
    if (objc_msgSend(v7, "containsObject:")) {
      CFStringRef v6 = @"(dirty) ";
    }
  }
  CFStringRef v44 = [(UAUserActivityClientProcess *)self currentAdvertisableActivity];
  id v8 = [v44 proxiedBundleIdentifier];
  if (v8)
  {
    id v37 = [(UAUserActivityClientProcess *)self currentAdvertisableActivity];
    __int16 v36 = [v37 proxiedBundleIdentifier];
    +[NSString stringWithFormat:@"proxyAs=%@ ", v36];
    obj = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    obj = &stru_1000C6800;
  }
  id v9 = [(UAUserActivityClientProcess *)self lastFrontTime];
  if (v9)
  {
    [(UAUserActivityClientProcess *)self lastFrontTime];
    v10 = id v41 = v5;
    sub_10007C018(v10);
    v12 = uint64_t v11 = v4;
    __int16 v13 = +[NSString stringWithFormat:@" lastFront=%@", v12];
    id v14 = v46;
    CFStringRef v34 = v6;
    id v15 = (__CFString *)v45;
    +[NSMutableString stringWithFormat:@"%@ pid=%d currentActive=%@%@%@%@", v46, v49, v45, v34, obj, v13];
    id v50 = (id)objc_claimAutoreleasedReturnValue();

    id v4 = v11;
    uint64_t v5 = v41;
  }
  else
  {
    CFStringRef v35 = v6;
    id v15 = (__CFString *)v45;
    id v14 = v46;
    +[NSMutableString stringWithFormat:@"%@ pid=%d currentActive=%@%@%@%@", v46, v49, v45, v35, obj, &stru_1000C6800];
    id v50 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v8)
  {
  }
  if (v5)
  {
  }
  if (v4)
  {
  }
  uint64_t v16 = [(UAUserActivityClientProcess *)self uniqueIdentifiers];
  if ((unint64_t)[v16 count] >= 2)
  {
  }
  else
  {
    uint64_t v17 = [(UAUserActivityClientProcess *)self currentAdvertisableActivity];

    if (v17) {
      goto LABEL_36;
    }
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obja = [(UAUserActivityClientProcess *)self uniqueIdentifiers];
  id v18 = [obja countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v52;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v52 != v20) {
          objc_enumerationMutation(obja);
        }
        id v22 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v23 = [(UAUserActivityClientProcess *)self currentAdvertisableActivity];
        if (!v23) {
          goto LABEL_30;
        }
        __int16 v24 = (void *)v23;
        id v25 = self;
        uint64_t v26 = [v25 currentAdvertisableActivity];
        id v27 = [v26 uuid];
        unsigned __int8 v28 = [v22 isEqual:v27];

        if ((v28 & 1) == 0)
        {
LABEL_30:
          unsigned __int8 v29 = [v22 UUIDString];
          unsigned int v30 = [(UAUserActivityClientProcess *)self dirtyUUIDs];
          unsigned int v31 = [v30 containsObject:v22];
          long long v32 = "";
          if (v31) {
            long long v32 = " (dirty)";
          }
          [v50 appendFormat:@"%@%s ", v29, v32];
        }
      }
      id v19 = [obja countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v19);
  }

  [v50 appendString:@"}"];
LABEL_36:

  return v50;
}

- (void)setManager:(id)a3
{
}

- (BOOL)clientIsSandboxed
{
  return self->_clientIsSandboxed;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (void)setTeamID:(id)a3
{
}

- (void)setAllowedToAccessAnyItem:(unsigned __int8)a3
{
  self->_allowedToAccessAnyItem = a3;
}

- (NSMutableSet)dirtyUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)frontmost
{
  return self->_frontmost;
}

- (BOOL)allowedToUseLSAlwaysEligible
{
  return self->_allowedToUseLSAlwaysEligible;
}

- (BOOL)allowedToUseEligibleEvenWhenInBackground
{
  return self->_allowedToUseEligibleEvenWhenInBackground;
}

- (BOOL)allowedToGetCurrentActivityInfo
{
  return self->_allowedToGetCurrentActivityInfo;
}

- (BOOL)allowedToMatchUserActivities
{
  return self->_allowedToMatchUserActivities;
}

- (NSDate)lastFrontTime
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLastFrontTime:(id)a3
{
}

- (BOOL)clientIsSigned
{
  return self->_clientIsSigned;
}

- (NSString)teamIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSMutableDictionary)userActivityAdvertisableItemsByUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUserActivityAdvertisableItemsByUUID:(id)a3
{
}

- (OS_os_transaction)os_transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 168, 1);
}

- (NSMutableArray)pendingUpdateTasks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPendingUpdateTasks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingUpdateTasks, 0);
  objc_storeStrong((id *)&self->_os_transaction, 0);
  objc_storeStrong((id *)&self->_userActivityAdvertisableItemsByUUID, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_lastFrontTime, 0);
  objc_storeStrong((id *)&self->_currentAdvertisableActivity, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_dirtyUUIDs, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_destroyWeak((id *)&self->_connection);

  objc_storeStrong((id *)&self->_pendingResumeActivityUUIDs, 0);
}

@end