@interface STManagementStateServer
- (NSTimer)notificationTimer;
- (STManagementStateServer)initWithScreenTimeStateManager:(id)a3;
- (STScreenTimeStateManager)screenTimeManager;
- (id)_observedManagerKeyPaths;
- (void)applyDefaultUserPoliciesWithCompletionHandler:(id)a3;
- (void)applyIntroductionModel:(id)a3 forDSID:(id)a4 completionHandler:(id)a5;
- (void)authenticateRestrictionsPasscode:(id)a3 replyHandler:(id)a4;
- (void)clearRestrictionsPasscodeWithCompletionHandler:(id)a3;
- (void)communicationPoliciesForDSID:(id)a3 withCompletionHandler:(id)a4;
- (void)communicationPoliciesWithCompletionHandler:(id)a3;
- (void)contactManagementStateForDSID:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)deleteAllWebApplicationHistory:(id)a3 clientBundleURLWrapper:(id)a4 replyHandler:(id)a5;
- (void)deleteAllWebApplicationHistory:(id)a3 profileIdentifier:(id)a4 replyHandler:(id)a5;
- (void)deleteAllWebApplicationHistory:(id)a3 replyHandler:(id)a4;
- (void)deleteWebHistoryDuringInterval:(id)a3 webApplication:(id)a4 clientBundleURLWrapper:(id)a5 replyHandler:(id)a6;
- (void)deleteWebHistoryDuringInterval:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 replyHandler:(id)a6;
- (void)deleteWebHistoryDuringInterval:(id)a3 webApplication:(id)a4 replyHandler:(id)a5;
- (void)deleteWebHistoryForDomain:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 replyHandler:(id)a6;
- (void)deleteWebHistoryForDomain:(id)a3 webApplication:(id)a4 replyHandler:(id)a5;
- (void)deleteWebHistoryForURL:(id)a3 webApplication:(id)a4 clientBundleURLWrapper:(id)a5 replyHandler:(id)a6;
- (void)deleteWebHistoryForURL:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 replyHandler:(id)a6;
- (void)deleteWebHistoryForURL:(id)a3 webApplication:(id)a4 replyHandler:(id)a5;
- (void)deleteWebHistoryForURLs:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 replyHandler:(id)a6;
- (void)deleteWebHistoryForURLs:(id)a3 webApplication:(id)a4 replyHandler:(id)a5;
- (void)enableRemoteManagementForDSID:(id)a3 completionHandler:(id)a4;
- (void)enableScreenTimeForDSID:(id)a3 completionHandler:(id)a4;
- (void)enableWebContentFilterWithCompletionHandler:(id)a3;
- (void)isContentPrivacyEnabledForDSID:(id)a3 completionHandler:(id)a4;
- (void)isExplicitContentRestrictedWithCompletionHandler:(id)a3;
- (void)isLocationSharingModificationAllowedForDSID:(id)a3 completionHandler:(id)a4;
- (void)isRestrictionsPasscodeSetWithCompletionHandler:(id)a3;
- (void)isWebContentRestrictedWithCompletionHandler:(id)a3;
- (void)lastCommunicationLimitsModifcationDateForDSID:(id)a3 completionHandler:(id)a4;
- (void)lastModifcationDateForDSID:(id)a3 completionHandler:(id)a4;
- (void)needsToSetRestrictionsPasscodeWithReplyHandler:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performMigrationFromMCXSettings:(id)a3 completionHandler:(id)a4;
- (void)permitWebFilterURL:(id)a3 pageTitle:(id)a4 completionHandler:(id)a5;
- (void)postNotificationForContext:(id)a3;
- (void)primaryiCloudCardDAVAccountIdentifierWithCompletionHandler:(id)a3;
- (void)restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:(id)a3;
- (void)scheduleManagementStateUpdateNotification;
- (void)screenTimeStateWithCompletionHandler:(id)a3;
- (void)screenTimeSyncStateWithCompletionHandler:(id)a3;
- (void)setContactManagementState:(int64_t)a3 forDSID:(id)a4 completionHandler:(id)a5;
- (void)setLocationSharingModificationAllowed:(BOOL)a3 forDSID:(id)a4 completionHandler:(id)a5;
- (void)setNotificationTimer:(id)a3;
- (void)setRestrictionsPasscode:(id)a3 completionHandler:(id)a4;
- (void)setScreenTimeEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setScreenTimeManager:(id)a3;
- (void)setScreenTimeSyncingEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)shouldAllowOneMoreMinuteForBundleIdentifier:(id)a3 replyHandler:(id)a4;
- (void)shouldAllowOneMoreMinuteForCategoryIdentifier:(id)a3 replyHandler:(id)a4;
- (void)shouldAllowOneMoreMinuteForWebDomain:(id)a3 replyHandler:(id)a4;
- (void)shouldRequestMoreTimeWithCompletionHandler:(id)a3;
- (void)triggerDowngradeMigrationWithCompletionHandler:(id)a3;
@end

@implementation STManagementStateServer

- (void)communicationPoliciesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STManagementStateServer *)self screenTimeManager];
  [v5 communicationPoliciesWithCompletionHandler:v4];
}

- (void)isRestrictionsPasscodeSetWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id, id))a3;
  id v5 = [(STManagementStateServer *)self screenTimeManager];
  id v12 = 0;
  v6 = [v5 getIsRestrictionsPasscodeSetAndReturnError:&v12];
  id v7 = v12;

  id v8 = [v6 BOOLValue];
  v9 = +[STLog screentime];
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      CFStringRef v11 = @"is not";
      if (v8) {
        CFStringRef v11 = @"is";
      }
      *(_DWORD *)buf = 138543362;
      CFStringRef v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Restrictions passcode %{public}@ set", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    sub_100261414();
  }

  v4[2](v4, v8, v7);
}

- (STScreenTimeStateManager)screenTimeManager
{
  return self->_screenTimeManager;
}

- (STManagementStateServer)initWithScreenTimeStateManager:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STManagementStateServer;
  v6 = [(STManagementStateServer *)&v18 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_screenTimeManager, a3);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = [(STManagementStateServer *)v7 _observedManagerKeyPaths];
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          [v5 addObserver:v7 forKeyPath:*(void *)(*((void *)&v14 + 1) + 8 * (void)v12) options:0 context:"STManagementStateServerObservationContext"];
          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v10);
    }
  }
  return v7;
}

- (void)dealloc
{
  v3 = [(STManagementStateServer *)self screenTimeManager];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(STManagementStateServer *)self _observedManagerKeyPaths];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 removeObserver:self forKeyPath:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8) context:"STManagementStateServerObservationContext"];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)STManagementStateServer;
  [(STManagementStateServer *)&v9 dealloc];
}

- (id)_observedManagerKeyPaths
{
  v4[0] = @"screenTimeEnabled";
  v4[1] = @"screenTimeSyncingEnabled";
  v4[2] = @"shouldRequestMoreTime";
  v2 = +[NSArray arrayWithObjects:v4 count:3];
  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == "STManagementStateServerObservationContext")
  {
    [(STManagementStateServer *)self performSelectorOnMainThread:"scheduleManagementStateUpdateNotification" withObject:0 waitUntilDone:0];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)STManagementStateServer;
    -[STManagementStateServer observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)scheduleManagementStateUpdateNotification
{
  v3 = [(STManagementStateServer *)self notificationTimer];

  if (!v3)
  {
    objc_initWeak(&location, self);
    id v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    uint64_t v7 = sub_100047478;
    id v8 = &unk_1002FCBD8;
    objc_copyWeak(&v9, &location);
    id v4 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v5 block:0.5];
    -[STManagementStateServer setNotificationTimer:](self, "setNotificationTimer:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)screenTimeStateWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v7 = [(STManagementStateServer *)self screenTimeManager];
  if ([v7 isScreenTimeEnabled]) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  (*((void (**)(id, uint64_t, void))a3 + 2))(v5, v6, 0);
}

- (void)setScreenTimeEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(STManagementStateServer *)self screenTimeManager];
  [v7 setScreenTimeEnabled:v4 completionHandler:v6];
}

- (void)enableScreenTimeForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STManagementStateServer *)self screenTimeManager];
  [v8 enableScreenTimeForDSID:v7 completionHandler:v6];
}

- (void)enableRemoteManagementForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STManagementStateServer *)self screenTimeManager];
  [v8 enableRemoteManagementForDSID:v7 completionHandler:v6];
}

- (void)screenTimeSyncStateWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v7 = [(STManagementStateServer *)self screenTimeManager];
  if ([v7 isScreenTimeSyncingEnabled]) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  (*((void (**)(id, uint64_t, void))a3 + 2))(v5, v6, 0);
}

- (void)setScreenTimeSyncingEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(STManagementStateServer *)self screenTimeManager];
  [v7 setScreenTimeSyncingEnabled:v4 completionHandler:v6];
}

- (void)isContentPrivacyEnabledForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STManagementStateServer *)self screenTimeManager];
  [v8 isContentPrivacyEnabledForDSID:v7 completionHandler:v6];
}

- (void)clearRestrictionsPasscodeWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  id v5 = [(STManagementStateServer *)self screenTimeManager];
  id v9 = 0;
  unsigned int v6 = [v5 clearRestrictionsPasscodeWithError:&v9];
  id v7 = v9;

  if (v6) {
    id v8 = 0;
  }
  else {
    id v8 = v7;
  }
  ((void (**)(id, id))v4)[2](v4, v8);
}

- (void)needsToSetRestrictionsPasscodeWithReplyHandler:(id)a3
{
  BOOL v4 = (void (**)(id, id, id))a3;
  id v5 = [(STManagementStateServer *)self screenTimeManager];
  id v8 = 0;
  unsigned int v6 = [v5 getNeedsToSetRestrictionsPasscodeAndReturnError:&v8];
  id v7 = v8;

  v4[2](v4, [v6 BOOLValue], v7);
}

- (void)setRestrictionsPasscode:(id)a3 completionHandler:(id)a4
{
  unsigned int v6 = (void (**)(id, id))a4;
  id v7 = a3;
  id v8 = [(STManagementStateServer *)self screenTimeManager];
  id v10 = 0;
  [v8 setRestrictionsPasscode:v7 error:&v10];

  id v9 = v10;
  v6[2](v6, v9);
}

- (void)restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STManagementStateServer *)self screenTimeManager];
  [v5 restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:v4];
}

- (void)authenticateRestrictionsPasscode:(id)a3 replyHandler:(id)a4
{
  unsigned int v6 = (void (**)(id, id))a4;
  id v7 = a3;
  id v8 = [(STManagementStateServer *)self screenTimeManager];
  id v12 = 0;
  unsigned __int8 v9 = [v8 authenticateRestrictionsPasscode:v7 error:&v12];

  id v10 = v12;
  if ((v9 & 1) == 0)
  {
    long long v11 = +[STLog screentime];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10026147C();
    }
  }
  v6[2](v6, v10);
}

- (void)shouldRequestMoreTimeWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  id v5 = +[STLog screentime];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1002614E4(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  long long v13 = [(STManagementStateServer *)self screenTimeManager];
  v4[2](v4, [v13 shouldRequestMoreTime], 0);
}

- (void)communicationPoliciesForDSID:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STManagementStateServer *)self screenTimeManager];
  [v8 communicationPoliciesForDSID:v7 withCompletionHandler:v6];
}

- (void)primaryiCloudCardDAVAccountIdentifierWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *, id))a3;
  id v5 = [(STManagementStateServer *)self screenTimeManager];
  id v9 = 0;
  id v6 = [v5 getPrimaryiCloudCardDAVAccountIdentifierWithError:&v9];
  id v7 = v9;

  if (!v6)
  {
    id v8 = +[STLog screentime];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10026151C();
    }
  }
  v4[2](v4, v6, v7);
}

- (void)setContactManagementState:(int64_t)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(STManagementStateServer *)self screenTimeManager];
  [v10 setContactManagementState:a3 forDSID:v9 completionHandler:v8];
}

- (void)contactManagementStateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STManagementStateServer *)self screenTimeManager];
  [v8 contactManagementStateForDSID:v7 completionHandler:v6];
}

- (void)isExplicitContentRestrictedWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id, id))a3;
  id v5 = [(STManagementStateServer *)self screenTimeManager];
  id v12 = 0;
  id v6 = [v5 getIsExplicitContentRestrictedAndReturnError:&v12];
  id v7 = v12;

  id v8 = [v6 BOOLValue];
  id v9 = +[STLog screentime];
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      CFStringRef v11 = @"is not";
      if (v8) {
        CFStringRef v11 = @"is";
      }
      *(_DWORD *)buf = 138543362;
      CFStringRef v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Explicit content %{public}@ restricted", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    sub_100261584();
  }

  v4[2](v4, v8, v7);
}

- (void)isWebContentRestrictedWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id, id))a3;
  id v5 = [(STManagementStateServer *)self screenTimeManager];
  id v12 = 0;
  id v6 = [v5 getIsWebContentRestrictedAndReturnError:&v12];
  id v7 = v12;

  id v8 = [v6 BOOLValue];
  id v9 = +[STLog screentime];
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      CFStringRef v11 = @"is not";
      if (v8) {
        CFStringRef v11 = @"is";
      }
      *(_DWORD *)buf = 138543362;
      CFStringRef v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Web content %{public}@ restricted", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    sub_1002615EC();
  }

  v4[2](v4, v8, v7);
}

- (void)enableWebContentFilterWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STManagementStateServer *)self screenTimeManager];
  [v5 enableWebContentFilterWithCompletionHandler:v4];
}

- (void)deleteWebHistoryForURL:(id)a3 webApplication:(id)a4 replyHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = +[STLog usage];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100261654();
  }

  CFStringRef v11 = objc_opt_new();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10004827C;
  v14[3] = &unk_1002FCC00;
  id v15 = v7;
  id v16 = v8;
  id v12 = v8;
  id v13 = v7;
  [v11 deleteHistoryForURL:v13 webApplication:v9 completionHandler:v14];
}

- (void)deleteWebHistoryForURLs:(id)a3 webApplication:(id)a4 replyHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = +[STLog usage];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100261724(v7);
  }

  CFStringRef v11 = objc_opt_new();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100048424;
  v14[3] = &unk_1002FCC00;
  id v15 = v7;
  id v16 = v8;
  id v12 = v8;
  id v13 = v7;
  [v11 deleteHistoryForURLs:v13 webApplication:v9 completionHandler:v14];
}

- (void)deleteWebHistoryForDomain:(id)a3 webApplication:(id)a4 replyHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = +[STLog usage];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100261654();
  }

  CFStringRef v11 = objc_opt_new();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000485CC;
  v14[3] = &unk_1002FCC00;
  id v15 = v7;
  id v16 = v8;
  id v12 = v8;
  id v13 = v7;
  [v11 deleteHistoryForDomain:v13 webApplication:v9 completionHandler:v14];
}

- (void)deleteWebHistoryDuringInterval:(id)a3 webApplication:(id)a4 replyHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = +[STLog usage];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100261654();
  }

  CFStringRef v11 = objc_opt_new();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100048774;
  v14[3] = &unk_1002FCC00;
  id v15 = v7;
  id v16 = v8;
  id v12 = v8;
  id v13 = v7;
  [v11 deleteHistoryDuringInterval:v13 webApplication:v9 completionHandler:v14];
}

- (void)deleteAllWebApplicationHistory:(id)a3 replyHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[STLog usage];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100261818(v7, v8, v9, v10, v11, v12, v13, v14);
  }

  id v15 = objc_opt_new();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000488EC;
  v17[3] = &unk_1002FC288;
  id v18 = v5;
  id v16 = v5;
  [v15 deleteAllHistoryForApplication:v6 completionHandler:v17];
}

- (void)deleteWebHistoryForURL:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 replyHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = +[STLog usage];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100261654();
  }

  uint64_t v14 = objc_opt_new();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100048AA4;
  v17[3] = &unk_1002FCC00;
  id v18 = v9;
  id v19 = v10;
  id v15 = v10;
  id v16 = v9;
  [v14 deleteHistoryForURL:v16 webApplication:v12 profileIdentifier:v11 completionHandler:v17];
}

- (void)deleteWebHistoryForURLs:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 replyHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = +[STLog usage];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100261654();
  }

  uint64_t v14 = objc_opt_new();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100048C60;
  v17[3] = &unk_1002FCC00;
  id v18 = v9;
  id v19 = v10;
  id v15 = v10;
  id v16 = v9;
  [v14 deleteHistoryForURLs:v16 webApplication:v12 profileIdentifier:v11 completionHandler:v17];
}

- (void)deleteWebHistoryForDomain:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 replyHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = +[STLog usage];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100261654();
  }

  uint64_t v14 = objc_opt_new();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100048E1C;
  v17[3] = &unk_1002FCC00;
  id v18 = v9;
  id v19 = v10;
  id v15 = v10;
  id v16 = v9;
  [v14 deleteHistoryForDomain:v16 webApplication:v12 profileIdentifier:v11 completionHandler:v17];
}

- (void)deleteWebHistoryDuringInterval:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 replyHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = +[STLog usage];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100261888();
  }

  uint64_t v14 = objc_opt_new();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100048FD8;
  v17[3] = &unk_1002FCC00;
  id v18 = v9;
  id v19 = v10;
  id v15 = v10;
  id v16 = v9;
  [v14 deleteHistoryDuringInterval:v16 webApplication:v12 profileIdentifier:v11 completionHandler:v17];
}

- (void)deleteAllWebApplicationHistory:(id)a3 profileIdentifier:(id)a4 replyHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = +[STLog usage];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100261654();
  }

  id v11 = objc_opt_new();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100049180;
  v14[3] = &unk_1002FCC00;
  id v15 = v7;
  id v16 = v8;
  id v12 = v8;
  id v13 = v7;
  [v11 deleteAllHistoryForApplication:v13 profileIdentifier:v9 completionHandler:v14];
}

- (void)deleteWebHistoryForURL:(id)a3 webApplication:(id)a4 clientBundleURLWrapper:(id)a5 replyHandler:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)USWebHistory);
  id v12 = +[NSXPCConnection currentConnection];
  id v13 = v12;
  if (v12) {
    [v12 auditToken];
  }
  else {
    memset(v15, 0, sizeof(v15));
  }
  id v14 = [v11 initWithAuditToken:v15];

  [v14 deleteHistoryForURL:v10 webApplication:v9 completionHandler:v8];
}

- (void)deleteWebHistoryDuringInterval:(id)a3 webApplication:(id)a4 clientBundleURLWrapper:(id)a5 replyHandler:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)USWebHistory);
  id v12 = +[NSXPCConnection currentConnection];
  id v13 = v12;
  if (v12) {
    [v12 auditToken];
  }
  else {
    memset(v15, 0, sizeof(v15));
  }
  id v14 = [v11 initWithAuditToken:v15];

  [v14 deleteHistoryDuringInterval:v10 webApplication:v9 completionHandler:v8];
}

- (void)deleteAllWebApplicationHistory:(id)a3 clientBundleURLWrapper:(id)a4 replyHandler:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  id v8 = objc_alloc((Class)USWebHistory);
  id v9 = +[NSXPCConnection currentConnection];
  id v10 = v9;
  if (v9) {
    [v9 auditToken];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  id v11 = [v8 initWithAuditToken:v12];

  [v11 deleteAllHistoryForApplication:v7 completionHandler:v6];
}

- (void)performMigrationFromMCXSettings:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STManagementStateServer *)self screenTimeManager];
  [v8 performMigrationFromMCXSettings:v7 completionHandler:v6];
}

- (void)applyDefaultUserPoliciesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STManagementStateServer *)self screenTimeManager];
  [v5 applyDefaultUserPoliciesWithCompletionHandler:v4];
}

- (void)permitWebFilterURL:(id)a3 pageTitle:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(STManagementStateServer *)self screenTimeManager];
  [v11 permitWebFilterURL:v10 pageTitle:v9 completionHandler:v8];
}

- (void)shouldAllowOneMoreMinuteForBundleIdentifier:(id)a3 replyHandler:(id)a4
{
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  id v8 = [(STManagementStateServer *)self screenTimeManager];
  id v11 = 0;
  id v9 = [v8 shouldAllowOneMoreMinuteForBundleIdentifier:v7 error:&v11];

  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (void)shouldAllowOneMoreMinuteForWebDomain:(id)a3 replyHandler:(id)a4
{
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  id v8 = [(STManagementStateServer *)self screenTimeManager];
  id v11 = 0;
  id v9 = [v8 shouldAllowOneMoreMinuteForWebDomain:v7 error:&v11];

  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (void)shouldAllowOneMoreMinuteForCategoryIdentifier:(id)a3 replyHandler:(id)a4
{
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  id v8 = [(STManagementStateServer *)self screenTimeManager];
  id v11 = 0;
  id v9 = [v8 shouldAllowOneMoreMinuteForCategoryIdentifier:v7 error:&v11];

  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (void)applyIntroductionModel:(id)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(STManagementStateServer *)self screenTimeManager];
  [v11 applyIntroductionModel:v10 forDSID:v9 completionHandler:v8];
}

- (void)isLocationSharingModificationAllowedForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STManagementStateServer *)self screenTimeManager];
  [v8 isLocationSharingModificationAllowedForDSID:v7 completionHandler:v6];
}

- (void)setLocationSharingModificationAllowed:(BOOL)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(STManagementStateServer *)self screenTimeManager];
  [v10 setLocationSharingModificationAllowed:v6 forDSID:v9 completionHandler:v8];
}

- (void)lastCommunicationLimitsModifcationDateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STManagementStateServer *)self screenTimeManager];
  [v8 lastCommunicationLimitsModifcationDateForDSID:v7 completionHandler:v6];
}

- (void)lastModifcationDateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STManagementStateServer *)self screenTimeManager];
  [v8 lastModifcationDateForDSID:v7 completionHandler:v6];
}

- (void)postNotificationForContext:(id)a3
{
  id v3 = a3;
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"STUserNotificationManagerShouldPostNotification" object:v3];
}

- (void)triggerDowngradeMigrationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STManagementStateServer *)self screenTimeManager];
  [v5 triggerDowngradeMigrationWithCompletionHandler:v4];
}

- (void)setScreenTimeManager:(id)a3
{
}

- (NSTimer)notificationTimer
{
  return self->_notificationTimer;
}

- (void)setNotificationTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationTimer, 0);
  objc_storeStrong((id *)&self->_screenTimeManager, 0);
}

@end