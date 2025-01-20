@interface MBFollowUpManager
+ (id)connection;
+ (id)sharedManager;
- (BOOL)_foundPendingFollowUpItemWithIdentifiers:(id)a3;
- (BOOL)_shouldInformUserWithPersona:(id)a3 identifiers:(id)a4 withInterval:(double)a5;
- (BOOL)clearAllPendingFollowUps;
- (BOOL)clearPendingFollowUpsNotBelongingToAccounts:(id)a3 excluding:(id)a4;
- (BOOL)clearPendingFollowUpsWithAccount:(id)a3 identifiers:(id)a4;
- (BOOL)clearPendingFollowUpsWithAccountIdentifier:(id)a3 identifiers:(id)a4;
- (FLFollowUpController)followUpController;
- (FLFollowUpController)legacyController;
- (MBFollowUpManager)init;
- (MBHelperServiceProtocol)proxy;
- (OS_dispatch_queue)backgroundRestoreProgressQueue;
- (double)_recurringBackupWarningPeriodForAccount:(id)a3;
- (double)recurringBackupWarningPeriod;
- (id)_restoreFinishedFollowUpItemForAccount:(id)a3;
- (id)postFollowUpForBackgroundRestoreProgress:(id)a3 account:(id)a4;
- (id)postFollowUpForDrySpellForAccount:(id)a3 duration:(double)a4 firstBackup:(BOOL)a5;
- (id)postFollowUpForRestoreFailedForAccount:(id)a3 failedDomainDisplayNames:(id)a4;
- (id)postFollowUpForRestoreFinishedForAccount:(id)a3 skipiCloudQuotaOffer:(BOOL)a4;
- (id)postFollowUpForRestoreTimeoutForAccount:(id)a3;
- (void)_finishXPCWithError:(id)a3;
- (void)_postFollowUpItem:(id)a3;
- (void)_refreshBackgroundRestoreFollowUps;
- (void)_updateDidInformUserWithPersona:(id)a3 identifier:(id)a4 oldIdentifier:(id)a5;
- (void)setProxy:(id)a3;
- (void)setRecurringBackupWarningPeriod:(double)a3;
@end

@implementation MBFollowUpManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D404;
  block[3] = &unk_100411038;
  block[4] = a1;
  if (qword_100482320 != -1) {
    dispatch_once(&qword_100482320, block);
  }
  v2 = (void *)qword_100482328;
  return v2;
}

- (MBFollowUpManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)MBFollowUpManager;
  v2 = [(MBFollowUpManager *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [(id)objc_opt_class() connection];
    if (!v4) {
      __assert_rtn("-[MBFollowUpManager init]", "MBFollowUpManager.m", 66, "connection != nil");
    }
    v5 = (void *)v4;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10005D570;
    v10[3] = &unk_100411060;
    v6 = v3;
    v11 = v6;
    uint64_t v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
    proxy = v6->_proxy;
    v6->_proxy = (MBHelperServiceProtocol *)v7;

    if (!v6->_proxy) {
      __assert_rtn("-[MBFollowUpManager init]", "MBFollowUpManager.m", 71, "_proxy != nil");
    }
  }
  return v3;
}

- (FLFollowUpController)followUpController
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_followUpController)
  {
    uint64_t v4 = (FLFollowUpController *)[objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.backupd"];
    followUpController = self->_followUpController;
    self->_followUpController = v4;
  }
  os_unfair_lock_unlock(p_lock);
  v6 = self->_followUpController;
  return v6;
}

- (FLFollowUpController)legacyController
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_legacyController)
  {
    uint64_t v4 = (FLFollowUpController *)[objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.MobileBackup"];
    legacyController = self->_legacyController;
    self->_legacyController = v4;
  }
  os_unfair_lock_unlock(p_lock);
  v6 = self->_legacyController;
  return v6;
}

- (OS_dispatch_queue)backgroundRestoreProgressQueue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_backgroundRestoreProgressQueue)
  {
    uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (OS_dispatch_queue *)dispatch_queue_create("MBFollowUpManager.backgroundRestoreProgressQueue", v4);
    backgroundRestoreProgressQueue = self->_backgroundRestoreProgressQueue;
    self->_backgroundRestoreProgressQueue = v5;
  }
  os_unfair_lock_unlock(p_lock);
  uint64_t v7 = self->_backgroundRestoreProgressQueue;
  return v7;
}

- (double)_recurringBackupWarningPeriodForAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 persona];
  id v5 = [v4 copyPreferencesValueForKey:@"RecurringBackupWarningPeriod" class:objc_opt_class()];

  if (v5)
  {
    [v5 doubleValue];
    double v7 = v6;
    v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v18 = @"RecurringBackupWarningPeriod";
      __int16 v19 = 2048;
      uint64_t v20 = *(void *)&v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Period: %@ -> %f (prefs)", buf, 0x16u);
      _MBLog();
    }
  }
  else
  {
    v9 = +[MBCKRemoteConfiguration sharedInstance];
    v8 = [v9 valueForKey:@"RecurringBackupWarningPeriod" account:v3];

    if (v8)
    {
      v10 = MBGetDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        [v8 doubleValue];
        *(_DWORD *)buf = 138412546;
        CFStringRef v18 = @"RecurringBackupWarningPeriod";
        __int16 v19 = 2048;
        uint64_t v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Period: %@ -> %f (remote)", buf, 0x16u);
        [v8 doubleValue];
        _MBLog();
      }

      [v8 doubleValue];
      double v7 = v12;
    }
    else
    {
      int v13 = MBIsInternalInstall();
      v14 = MBGetDefaultLog();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
      if (v13)
      {
        if (v15)
        {
          *(_DWORD *)buf = 138412546;
          CFStringRef v18 = @"RecurringBackupWarningPeriod";
          __int16 v19 = 2048;
          uint64_t v20 = 0x410FA40000000000;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Period: %@ -> %f (internal)", buf, 0x16u);
          _MBLog();
        }

        v8 = 0;
        double v7 = 259200.0;
      }
      else
      {
        if (v15)
        {
          *(_DWORD *)buf = 138412546;
          CFStringRef v18 = @"RecurringBackupWarningPeriod";
          __int16 v19 = 2048;
          uint64_t v20 = 0x4122750000000000;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Period: %@ -> %f (external)", buf, 0x16u);
          _MBLog();
        }

        v8 = 0;
        double v7 = 604800.0;
      }
    }
  }

  return v7;
}

- (BOOL)_foundPendingFollowUpItemWithIdentifiers:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBFollowUpManager _foundPendingFollowUpItemWithIdentifiers:]", "MBFollowUpManager.m", 110, "identifiers");
  }
  id v5 = v4;
  double v6 = [(MBFollowUpManager *)self followUpController];
  id v43 = 0;
  double v7 = [v6 pendingFollowUpItems:&v43];
  id v8 = v43;

  if (v7)
  {
    id v34 = v8;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v40;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          BOOL v15 = [v14 uniqueIdentifier];
          unsigned int v16 = [v5 containsObject:v15];

          if (v16)
          {
            v27 = MBGetDefaultLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              v28 = [v14 uniqueIdentifier];
              *(_DWORD *)buf = 138543362;
              id v47 = v28;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "There's already a pending follow-up item for %{public}@ - skipping", buf, 0xCu);

              v32 = [v14 uniqueIdentifier];
              _MBLog();
            }
            BOOL v26 = 1;
            id v8 = v34;
            goto LABEL_30;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    v17 = [(MBFollowUpManager *)self legacyController];
    CFStringRef v18 = [v17 pendingFollowUpItems:0];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v9 = v18;
    id v19 = [v9 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v36;
      while (2)
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(v9);
          }
          v23 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
          v24 = [v23 uniqueIdentifier];
          unsigned int v25 = [v5 containsObject:v24];

          if (v25)
          {
            v29 = MBGetDefaultLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              v30 = [v23 uniqueIdentifier];
              *(_DWORD *)buf = 138543362;
              id v47 = v30;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "There's a legacy pending follow-up item for %{public}@ - skipping", buf, 0xCu);

              v33 = [v23 uniqueIdentifier];
              _MBLog();
            }
            BOOL v26 = 1;
            goto LABEL_29;
          }
        }
        id v20 = [v9 countByEnumeratingWithState:&v35 objects:v44 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
    BOOL v26 = 0;
LABEL_29:
    id v8 = v34;
  }
  else
  {
    v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to fetch all pending follow-up items: %@", buf, 0xCu);
      _MBLog();
    }
    BOOL v26 = 0;
  }
LABEL_30:

  return v26;
}

- (void)_postFollowUpItem:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBFollowUpManager _postFollowUpItem:]", "MBFollowUpManager.m", 136, "item");
  }
  id v5 = v4;
  uint64_t v6 = [(MBFollowUpManager *)self followUpController];
  if (!v6) {
    __assert_rtn("-[MBFollowUpManager _postFollowUpItem:]", "MBFollowUpManager.m", 138, "followUpController");
  }
  double v7 = (void *)v6;
  id v8 = [v5 uniqueIdentifier];
  unsigned int v9 = [v8 hasPrefix:@"RestoreInProgress"];
  id v10 = MBGetDefaultLog();
  id v11 = v10;
  if (v9)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138543362;
    CFStringRef v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Posting follow-up item %{public}@", buf, 0xCu);
  }
  else
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138543362;
    CFStringRef v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Posting follow-up item %{public}@", buf, 0xCu);
  }
  _MBLog();
LABEL_9:

  id v16 = 0;
  unsigned __int8 v12 = [v7 postFollowUpItem:v5 error:&v16];
  id v13 = v16;
  v14 = MBGetDefaultLog();
  BOOL v15 = v14;
  if (v12)
  {
    if (v9)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Posted follow-up item %{public}@", buf, 0xCu);
LABEL_17:
        _MBLog();
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Posted follow-up item %{public}@", buf, 0xCu);
      goto LABEL_17;
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    CFStringRef v18 = v8;
    __int16 v19 = 2112;
    id v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to post follow-up item %{public}@: %@", buf, 0x16u);
    goto LABEL_17;
  }
}

- (id)postFollowUpForRestoreTimeoutForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [v4 accountIdentifier];
  uint64_t v6 = [@"DrySpellFollowUpItem" stringByAppendingFormat:@".%@", v5];

  v50[0] = @"DrySpellFollowUpItem";
  v50[1] = v6;
  double v7 = +[NSArray arrayWithObjects:v50 count:2];
  id v8 = +[ACAccountStore defaultStore];
  unsigned int v9 = [v4 accountIdentifier];
  id v10 = [v8 accountWithIdentifier:v9];

  if (v10)
  {
    if ([(MBFollowUpManager *)self _foundPendingFollowUpItemWithIdentifiers:v7])
    {
      id v11 = 0;
      goto LABEL_16;
    }
    id v13 = [v4 persona];
    [(MBFollowUpManager *)self _recurringBackupWarningPeriodForAccount:v4];
    unsigned __int8 v14 = -[MBFollowUpManager _shouldInformUserWithPersona:identifiers:withInterval:](self, "_shouldInformUserWithPersona:identifiers:withInterval:", v13, v7);

    if (v14)
    {
      BOOL v15 = [v4 persona];
      [(MBFollowUpManager *)self _updateDidInformUserWithPersona:v15 identifier:v6 oldIdentifier:@"DrySpellFollowUpItem"];

      uint64_t v16 = MBLocalizedStringFromTable();
      uint64_t v17 = MBLocalizedStringFromTable();
      id v18 = objc_alloc_init((Class)NSMutableArray);
      long long v38 = v16;
      __int16 v19 = +[FLFollowUpAction actionWithLabel:v16 url:0];
      CFStringRef v46 = @"ActionType";
      id v20 = +[NSNumber numberWithInt:1];
      id v47 = v20;
      uint64_t v21 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      [v19 setUserInfo:v21];

      long long v40 = v19;
      [v18 addObject:v19];
      long long v41 = (void *)v17;
      v22 = +[FLFollowUpAction actionWithLabel:v17 url:0];
      CFStringRef v44 = @"ActionType";
      v23 = +[NSNumber numberWithInt:4];
      v45 = v23;
      v24 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      [v22 setUserInfo:v24];

      long long v39 = v22;
      [v18 addObject:v22];
      id v25 = objc_alloc_init((Class)FLFollowUpNotification);
      BOOL v26 = MBLocalizedStringFromTable();
      [v25 setTitle:v26];

      v27 = [v10 username];
      v28 = MBLocalizedStringWithFormat();
      objc_msgSend(v25, "setInformativeText:", v28, v27);

      [v25 setUnlockActionLabel:@"Please unlock the phone"];
      id v29 = objc_alloc_init((Class)FLFollowUpItem);
      [v29 setUniqueIdentifier:v6];
      v30 = MBLocalizedStringFromTable();
      [v29 setTitle:v30];

      v31 = [v10 username];
      v32 = MBLocalizedStringWithFormat();
      objc_msgSend(v29, "setInformativeText:", v32, v31);

      [v29 setExtensionIdentifier:@"com.apple.MobileBackup.framework.FollowUpUIExtension"];
      [v29 setActions:v18];
      [v29 setNotification:v25];
      CFStringRef v42 = @"FollowUpType";
      v33 = +[NSNumber numberWithInt:1];
      id v43 = v33;
      id v34 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      [v29 setUserInfo:v34];

      [v29 setGroupIdentifier:FLGroupIdentifierAccount];
      long long v35 = [v10 objectForKeyedSubscript:ACAccountPropertyRemoteManagingAccountIdentifier];
      if ([v4 isPrimaryAccount])
      {
        long long v36 = [v4 accountIdentifier];
        [v29 setAccountIdentifier:v36];
      }
      else
      {
        [v29 setAccountIdentifier:v35];
      }
      [v29 setTypeIdentifier:@"DrySpellFollowUpItem"];
      [(MBFollowUpManager *)self _postFollowUpItem:v29];
      id v11 = [v29 uniqueIdentifier];

      unsigned __int8 v12 = v38;
      goto LABEL_15;
    }
    unsigned __int8 v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v49 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Suppressing alert for %{public}@ (restore)", buf, 0xCu);
      goto LABEL_11;
    }
  }
  else
  {
    unsigned __int8 v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Nil ACAccount. Not posting a followup for %@", buf, 0xCu);
LABEL_11:
      _MBLog();
    }
  }
  id v11 = 0;
LABEL_15:

LABEL_16:
  return v11;
}

- (id)postFollowUpForRestoreFailedForAccount:(id)a3 failedDomainDisplayNames:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountIdentifier];
  unsigned int v9 = [@"RestoreFailureFollowUpItem" stringByAppendingFormat:@".%@", v8];

  v58[0] = @"RestoreFailureFollowUpItem";
  v58[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v58 count:2];
  if (v7 && [v7 count])
  {
    id v43 = v10;
    v45 = v9;
    id v41 = v6;
    MBLocalizedStringFromTable();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v47 = v7;
    id obj = v7;
    id v12 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v52;
      do
      {
        BOOL v15 = 0;
        uint64_t v16 = v11;
        do
        {
          if (*(void *)v52 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v51 + 1) + 8 * (void)v15);
          id v19 = objc_alloc((Class)NSString);
          id v20 = MBLocalizedStringFromTable();
          id v21 = [v19 initWithFormat:@"\t%@%@", v20, v17];

          id v11 = [objc_alloc((Class)NSString) initWithFormat:@"%@\n%@", v16, v21];
          BOOL v15 = (char *)v15 + 1;
          uint64_t v16 = v11;
        }
        while (v13 != v15);
        id v13 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v13);
    }

    id v6 = v41;
    unsigned int v9 = v45;
    id v7 = v47;
    id v10 = v43;
  }
  else
  {
    MBLocalizedStringFromTable();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(MBFollowUpManager *)self _foundPendingFollowUpItemWithIdentifiers:v10])
  {
    v22 = 0;
  }
  else
  {
    v23 = [v6 persona];
    [(MBFollowUpManager *)self _recurringBackupWarningPeriodForAccount:v6];
    unsigned __int8 v24 = -[MBFollowUpManager _shouldInformUserWithPersona:identifiers:withInterval:](self, "_shouldInformUserWithPersona:identifiers:withInterval:", v23, v10);

    if (v24)
    {
      CFStringRef v44 = v10;
      id v48 = v7;
      id v25 = [v6 persona];
      CFStringRef v42 = self;
      [(MBFollowUpManager *)self _updateDidInformUserWithPersona:v25 identifier:v9 oldIdentifier:@"RestoreFailureFollowUpItem"];

      BOOL v26 = MBLocalizedStringFromTable();
      id v27 = objc_alloc_init((Class)NSMutableArray);
      v28 = +[FLFollowUpAction actionWithLabel:v26 url:0];
      [v28 setUserInfo:&off_10043AF18];
      id obja = v28;
      [v27 addObject:v28];
      id v29 = objc_alloc_init((Class)FLFollowUpNotification);
      v30 = MBLocalizedStringFromTable();
      [v29 setTitle:v30];

      v31 = MBLocalizedStringFromTable();
      [v29 setInformativeText:v31];

      [v29 setUnlockActionLabel:@"Please unlock the phone"];
      id v32 = objc_alloc_init((Class)FLFollowUpItem);
      CFStringRef v46 = v9;
      [v32 setUniqueIdentifier:v9];
      [v32 setGroupIdentifier:FLGroupIdentifierAccount];
      v33 = MBLocalizedStringFromTable();
      [v32 setTitle:v33];

      [v32 setInformativeText:v11];
      [v32 setExtensionIdentifier:@"com.apple.MobileBackup.framework.FollowUpUIExtension"];
      id v34 = v27;
      [v32 setActions:v27];
      [v32 setNotification:v29];
      [v32 setUserInfo:&off_10043AF40];
      long long v35 = +[ACAccountStore defaultStore];
      long long v36 = [v6 accountIdentifier];
      long long v37 = [v35 accountWithIdentifier:v36];
      long long v38 = [v37 objectForKeyedSubscript:ACAccountPropertyRemoteManagingAccountIdentifier];

      if ([v6 isPrimaryAccount])
      {
        long long v39 = [v6 accountIdentifier];
        [v32 setAccountIdentifier:v39];
      }
      else
      {
        [v32 setAccountIdentifier:v38];
      }
      [v32 setTypeIdentifier:@"RestoreFailureFollowUpItem"];
      [(MBFollowUpManager *)v42 _postFollowUpItem:v32];
      v22 = [v32 uniqueIdentifier];

      unsigned int v9 = v46;
      id v7 = v48;
      id v10 = v44;
    }
    else
    {
      BOOL v26 = MBGetDefaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v56 = v9;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Suppressing alert for %{public}@", buf, 0xCu);
        _MBLog();
      }
      v22 = 0;
    }
  }
  return v22;
}

- (id)postFollowUpForDrySpellForAccount:(id)a3 duration:(double)a4 firstBackup:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  unsigned int v9 = [v8 accountIdentifier];
  id v10 = [@"DrySpellFollowUpItem" stringByAppendingFormat:@".%@", v9];

  v75[0] = @"DrySpellFollowUpItem";
  v75[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v75 count:2];
  id v12 = +[ACAccountStore defaultStore];
  id v13 = [v8 accountIdentifier];
  uint64_t v14 = [v12 accountWithIdentifier:v13];

  if (v14)
  {
    if ([(MBFollowUpManager *)self _foundPendingFollowUpItemWithIdentifiers:v11])
    {
      BOOL v15 = 0;
      goto LABEL_31;
    }
    uint64_t v17 = [v8 persona];
    [(MBFollowUpManager *)self _recurringBackupWarningPeriodForAccount:v8];
    unsigned __int8 v18 = -[MBFollowUpManager _shouldInformUserWithPersona:identifiers:withInterval:](self, "_shouldInformUserWithPersona:identifiers:withInterval:", v17, v11);

    if (v18)
    {
      v60 = v11;
      id v19 = [v8 persona];
      v55 = self;
      [(MBFollowUpManager *)self _updateDidInformUserWithPersona:v19 identifier:v10 oldIdentifier:@"DrySpellFollowUpItem"];

      uint64_t v16 = objc_alloc_init((Class)NSDateComponentsFormatter);
      [v16 setUnitsStyle:3];
      [v16 setMaximumUnitCount:1];
      [v16 setFormattingContext:5];
      id v20 = +[NSCalendar currentCalendar];
      id v21 = MBLocale();
      [v20 setLocale:v21];

      v59 = v20;
      [v16 setCalendar:v20];
      id v22 = objc_alloc_init((Class)NSDateComponents);
      unint64_t v65 = (unint64_t)(a4 / 604800.0);
      [v22 setWeekOfMonth:v65];
      [v16 setAllowedUnits:4096];
      v58 = v22;
      v62 = [v16 stringFromDateComponents:v22];
      id v23 = objc_alloc_init((Class)NSDateComponents);
      [v23 setDay:(unint64_t)(a4 / 86400.0)];
      [v16 setAllowedUnits:16];
      v57 = v23;
      v61 = [v16 stringFromDateComponents:v23];
      unsigned __int8 v24 = objc_opt_new();
      id v25 = +[ACAccountStore defaultStore];
      BOOL v26 = [v8 accountIdentifier];
      id v27 = [v25 accountWithIdentifier:v26];
      v56 = v24;
      unsigned int v28 = [v24 isBackupOnCellularAllowedWithAccount:v27 error:0];

      if (v28)
      {
        if (!v5)
        {
          id v29 = [v14 username];
          if (v65 < 2) {
            v30 = v61;
          }
          else {
            v30 = v62;
          }
          long long v52 = v30;
          goto LABEL_24;
        }
      }
      else if (!v5)
      {
        id v29 = [v14 username];
        if (v65 < 2) {
          v31 = v61;
        }
        else {
          v31 = v62;
        }
        long long v52 = v31;
        goto LABEL_24;
      }
      id v29 = [v14 username];
      long long v52 = v29;
LABEL_24:
      v66 = MBLocalizedStringWithGreenTeaSuffix();

      uint64_t v32 = MBLocalizedStringFromTable();
      v64 = MBLocalizedStringFromTable();
      id v33 = objc_alloc_init((Class)NSMutableArray);
      id v34 = objc_msgSend(v8, "persona", v52);
      unsigned int v35 = [v34 isPersonalPersona];

      v63 = v33;
      if (v35)
      {
        long long v36 = +[FLFollowUpAction actionWithLabel:v32 url:0];
        CFStringRef v71 = @"ActionType";
        long long v37 = +[NSNumber numberWithInt:1];
        v72 = v37;
        long long v38 = +[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
        [v36 setUserInfo:v38];

        id v33 = v63;
        [v63 addObject:v36];
      }
      long long v54 = (void *)v32;
      long long v39 = +[FLFollowUpAction actionWithLabel:v64 url:0];
      CFStringRef v69 = @"ActionType";
      long long v40 = +[NSNumber numberWithInt:4];
      v70 = v40;
      id v41 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      [v39 setUserInfo:v41];

      long long v53 = v39;
      [v33 addObject:v39];
      id v42 = v33;
      id v43 = objc_alloc_init((Class)FLFollowUpNotification);
      CFStringRef v44 = MBLocalizedStringFromTable();
      [v43 setTitle:v44];

      [v43 setInformativeText:v66];
      [v43 setUnlockActionLabel:@"Please unlock the phone"];
      id v45 = objc_alloc_init((Class)FLFollowUpItem);
      [v45 setUniqueIdentifier:v10];
      CFStringRef v46 = MBLocalizedStringFromTable();
      [v45 setTitle:v46];

      [v45 setInformativeText:v66];
      [v45 setExtensionIdentifier:@"com.apple.MobileBackup.framework.FollowUpUIExtension"];
      [v45 setActions:v42];
      [v45 setNotification:v43];
      CFStringRef v67 = @"FollowUpType";
      id v47 = +[NSNumber numberWithInt:1];
      v68 = v47;
      id v48 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      [v45 setUserInfo:v48];

      [v45 setGroupIdentifier:FLGroupIdentifierAccount];
      v49 = [v14 objectForKeyedSubscript:ACAccountPropertyRemoteManagingAccountIdentifier];
      if ([v8 isPrimaryAccount])
      {
        v50 = [v8 accountIdentifier];
        [v45 setAccountIdentifier:v50];
      }
      else
      {
        [v45 setAccountIdentifier:v49];
      }
      [v45 setTypeIdentifier:@"DrySpellFollowUpItem"];
      [(MBFollowUpManager *)v55 _postFollowUpItem:v45];
      BOOL v15 = [v45 uniqueIdentifier];

      id v11 = v60;
      goto LABEL_30;
    }
    uint64_t v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v74 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Suppressing alert for %{public}@", buf, 0xCu);
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v74 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Nil ACAccount. Not posting a followup for %@", buf, 0xCu);
LABEL_12:
      _MBLog();
    }
  }
  BOOL v15 = 0;
LABEL_30:

LABEL_31:
  return v15;
}

- (id)postFollowUpForBackgroundRestoreProgress:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    __assert_rtn("-[MBFollowUpManager postFollowUpForBackgroundRestoreProgress:account:]", "MBFollowUpManager.m", 377, "account");
  }
  id v8 = v7;
  unsigned int v9 = sub_10005FB8C(@"RestoreInProgress", v7);
  v43[0] = @"FollowUpType";
  v43[1] = @"AccountType";
  v44[0] = &off_100439E40;
  id v10 = [v8 persona];
  id v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 accountType]);
  v44[1] = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
  [v9 setUserInfo:v12];

  unsigned int v13 = [v6 isThermallyThrottled];
  unsigned int v14 = [v6 hasCellularPolicy];
  unsigned int v15 = [v6 isOnWiFi];
  unsigned int v16 = [v6 isOnInexpensiveCellular];
  id v17 = [v6 estimatedSize];
  v31 = MBLocalizedStringFromTable();
  [v9 setTitle:v31];
  uint64_t v35 = 0;
  long long v36 = &v35;
  uint64_t v37 = 0x3032000000;
  long long v38 = sub_10005FCEC;
  long long v39 = sub_10005FCFC;
  long long v40 = &stru_100418BA8;
  proxy = self->_proxy;
  if (!proxy) {
    __assert_rtn("-[MBFollowUpManager postFollowUpForBackgroundRestoreProgress:account:]", "MBFollowUpManager.m", 401, "_proxy != nil");
  }
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10005FD04;
  v34[3] = &unk_100411088;
  v34[4] = &v35;
  [(MBHelperServiceProtocol *)proxy localizedStringFromByteCount:v17 countStyle:0 reply:v34];
  if (v17)
  {
    uint64_t v30 = v36[5];
    if ((v13 | v15 | v14 & v16) == 1) {
      MBLocalizedStringWithSubstitutions();
    }
    else {
    uint64_t v19 = MBLocalizedStringWithGreenTeaSuffixAndSubstitutions();
    }
  }
  else
  {
    uint64_t v19 = MBLocalizedStringFromTable();
  }
  id v20 = (void *)v19;
  objc_msgSend(v9, "setInformativeText:", v19, v30);
  if ((v16 & ~(v14 | v15 | v13)) == 1 && v17)
  {
    id v21 = MBLocalizedStringFromTable();
    id v22 = +[FLFollowUpAction actionWithLabel:v21 url:0];

    [v22 setUserInfo:&off_10043AF68];
    id v42 = v22;
    id v23 = +[NSArray arrayWithObjects:&v42 count:1];
    [v9 setActions:v23];
  }
  else
  {
    if (!v13) {
      goto LABEL_15;
    }
    unsigned __int8 v24 = MBLocalizedStringFromTable();
    id v22 = +[FLFollowUpAction actionWithLabel:v24 url:0];

    [v22 setUserInfo:&off_10043AF90];
    id v41 = v22;
    id v23 = +[NSArray arrayWithObjects:&v41 count:1];
    [v9 setActions:v23];
  }

LABEL_15:
  if ([v8 isPrimaryAccount])
  {
    [v9 setGroupIdentifier:FLGroupIdentifierNoGroup];
    uint64_t v25 = 18;
  }
  else
  {
    [v9 setGroupIdentifier:FLGroupIdentifierAccount];
    uint64_t v25 = 16;
  }
  [v9 setDisplayStyle:v25];
  BOOL v26 = [(MBFollowUpManager *)self backgroundRestoreProgressQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005FDF8;
  block[3] = &unk_1004110B0;
  block[4] = self;
  id v27 = v9;
  id v33 = v27;
  dispatch_sync(v26, block);

  unsigned int v28 = [v27 uniqueIdentifier];

  _Block_object_dispose(&v35, 8);
  return v28;
}

- (id)postFollowUpForRestoreFinishedForAccount:(id)a3 skipiCloudQuotaOffer:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBFollowUpManager postFollowUpForRestoreFinishedForAccount:skipiCloudQuotaOffer:]", "MBFollowUpManager.m", 451, "account");
  }
  id v7 = v6;
  if ([v6 isPrimaryAccount])
  {
    *(void *)buf = 0;
    id v22 = buf;
    uint64_t v23 = 0x3032000000;
    unsigned __int8 v24 = sub_10005FCEC;
    uint64_t v25 = sub_10005FCFC;
    id v26 = 0;
    if (v4)
    {
      uint64_t v8 = [(MBFollowUpManager *)self _restoreFinishedFollowUpItemForAccount:v7];
      unsigned int v9 = (void *)*((void *)v22 + 5);
      *((void *)v22 + 5) = v8;
    }
    else
    {
      unsigned int v9 = objc_opt_new();
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000600E4;
      v16[3] = &unk_1004110D8;
      id v12 = dispatch_semaphore_create(0);
      id v20 = buf;
      id v17 = v12;
      unsigned __int8 v18 = self;
      id v19 = v7;
      [v9 postBackupRestoredOffer:v16];
      MBSemaphoreWaitForever();
    }
    if (*((void *)v22 + 5))
    {
      unsigned int v13 = [(MBFollowUpManager *)self backgroundRestoreProgressQueue];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000601B4;
      v15[3] = &unk_100411100;
      v15[4] = self;
      v15[5] = buf;
      dispatch_sync(v13, v15);

      id v11 = [*((id *)v22 + 5) uniqueIdentifier];
    }
    else
    {
      id v11 = 0;
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Not posting restore finished follow up for secondary account", buf, 2u);
      _MBLog();
    }

    id v11 = 0;
  }

  return v11;
}

- (id)_restoreFinishedFollowUpItemForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = sub_10005FB8C(@"RestoreFinished", v3);
  v20[0] = @"FollowUpType";
  v20[1] = FLFollowUpNotifyingAppIdKey;
  v21[0] = &off_100439E58;
  v21[1] = FLFollowUpiCloudBundleIdentifier;
  v20[2] = @"AccountType";
  BOOL v5 = [v3 persona];

  id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 accountType]);
  v21[2] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
  [v4 setUserInfo:v7];

  [v4 setGroupIdentifier:FLGroupIdentifierNoGroup];
  [v4 setDisplayStyle:18];
  uint64_t v8 = MBLocalizedStringFromTable();
  [v4 setTitle:v8];

  unsigned int v9 = MBLocalizedString();
  [v4 setInformativeText:v9];

  id v10 = MBLocalizedString();
  id v11 = +[FLFollowUpAction actionWithLabel:v10 url:0];

  [v11 setUserInfo:&off_10043AFB8];
  id v12 = MBLocalizedString();
  unsigned int v13 = +[FLFollowUpAction actionWithLabel:v12 url:0];

  [v13 setUserInfo:&off_10043AFE0];
  v19[0] = v11;
  v19[1] = v13;
  unsigned int v14 = +[NSArray arrayWithObjects:v19 count:2];
  [v4 setActions:v14];

  id v15 = objc_alloc_init((Class)FLFollowUpNotification);
  unsigned int v16 = MBLocalizedStringFromTable();
  [v15 setTitle:v16];

  id v17 = MBLocalizedStringFromTable();
  [v15 setInformativeText:v17];

  [v15 setUnlockActionLabel:@"Please unlock the phone"];
  [v4 setNotification:v15];

  return v4;
}

- (void)_refreshBackgroundRestoreFollowUps
{
  v2 = self;
  id v3 = [(MBFollowUpManager *)self backgroundRestoreProgressQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(MBFollowUpManager *)v2 followUpController];
  id v42 = 0;
  BOOL v5 = [v4 pendingFollowUpItems:&v42];
  id v6 = v42;

  if (!v5)
  {
    id v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to refresh pending follow ups:%@", buf, 0xCu);
      id v30 = v6;
      _MBLog();
    }
  }
  uint64_t v32 = v6;
  id v33 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (!v9)
  {

    goto LABEL_22;
  }
  id v10 = v9;
  v31 = v2;
  int v11 = 0;
  uint64_t v12 = *(void *)v39;
  do
  {
    unsigned int v13 = v8;
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v39 != v12) {
        objc_enumerationMutation(v13);
      }
      id v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      unsigned int v16 = objc_msgSend(v15, "uniqueIdentifier", v30);
      if ([v16 hasPrefix:@"RestoreInProgress"])
      {
      }
      else
      {
        id v17 = [v15 uniqueIdentifier];
        unsigned int v18 = [v17 hasPrefix:@"RestoreFinished"];

        if (!v18) {
          continue;
        }
      }
      id v19 = [v15 userInfo];
      id v20 = [v19 objectForKeyedSubscript:@"AccountType"];
      id v21 = [v20 integerValue];

      if (v21 == (id)2) {
        [v33 addObject:v15];
      }
      ++v11;
    }
    id v8 = v13;
    id v10 = [v13 countByEnumeratingWithState:&v38 objects:v44 count:16];
  }
  while (v10);

  v2 = v31;
  if (v11 == 1 && [v33 count])
  {
    id v22 = [v33 objectAtIndexedSubscript:0];
    [v22 setGroupIdentifier:FLGroupIdentifierNoGroup];
    [v22 setDisplayStyle:18];
    [(MBFollowUpManager *)v31 _postFollowUpItem:v22];
    goto LABEL_30;
  }
LABEL_22:
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v22 = v33;
  id v23 = [v22 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v23)
  {
    id v24 = v23;
    id v25 = v8;
    uint64_t v26 = *(void *)v35;
    uint64_t v27 = FLGroupIdentifierAccount;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(v22);
        }
        id v29 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
        objc_msgSend(v29, "setGroupIdentifier:", v27, v30);
        [v29 setDisplayStyle:16];
        [(MBFollowUpManager *)v2 _postFollowUpItem:v29];
      }
      id v24 = [v22 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v24);
    id v8 = v25;
  }
LABEL_30:
}

- (BOOL)clearAllPendingFollowUps
{
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing all pending follow-ups", buf, 2u);
    _MBLog();
  }

  BOOL v4 = [(MBFollowUpManager *)self followUpController];
  id v9 = 0;
  unsigned __int8 v5 = [v4 clearPendingFollowUpItems:&v9];
  id v6 = v9;

  if (v5)
  {
    id v7 = [(MBFollowUpManager *)self legacyController];
    [v7 clearPendingFollowUpItems:0];
  }
  else
  {
    id v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to clear all pending follow-ups: %{public}@", buf, 0xCu);
      _MBLog();
    }
  }

  return v5;
}

- (BOOL)clearPendingFollowUpsWithAccountIdentifier:(id)a3 identifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2 * (void)[v7 count]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        unsigned int v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [v8 addObject:v14];
        id v15 = [v14 stringByAppendingFormat:@".%@", v6];
        [v8 addObject:v15];
      }
      id v11 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v11);
  }

  unsigned int v16 = MBGetDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = v8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Clearing pending follow-ups: %{public}@", buf, 0xCu);
    _MBLog();
  }

  id v17 = [(MBFollowUpManager *)self followUpController];
  id v25 = 0;
  unsigned __int8 v18 = [v17 clearPendingFollowUpItemsWithUniqueIdentifiers:v8 error:&v25];
  id v19 = v25;

  if (v18)
  {
    id v20 = [(MBFollowUpManager *)self legacyController];
    [v20 clearPendingFollowUpItemsWithUniqueIdentifiers:v8 error:0];

    id v21 = [(MBFollowUpManager *)self backgroundRestoreProgressQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100060D1C;
    block[3] = &unk_100411128;
    block[4] = self;
    dispatch_async(v21, block);
  }
  else
  {
    id v22 = MBGetDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v31 = v19;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to clear pending follow-ups: %{public}@", buf, 0xCu);
      _MBLog();
    }
  }
  return v18;
}

- (BOOL)clearPendingFollowUpsWithAccount:(id)a3 identifiers:(id)a4
{
  id v6 = a4;
  id v7 = [a3 accountIdentifier];
  LOBYTE(self) = [(MBFollowUpManager *)self clearPendingFollowUpsWithAccountIdentifier:v7 identifiers:v6];

  return (char)self;
}

- (BOOL)clearPendingFollowUpsNotBelongingToAccounts:(id)a3 excluding:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MBFollowUpManager *)self followUpController];
  id v47 = 0;
  id v9 = [v8 pendingFollowUpItems:&v47];
  id v10 = v47;

  if (v10)
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v50 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to fetch pending follow-ups: %@", buf, 0xCu);
      _MBLog();
    }
LABEL_31:

    goto LABEL_32;
  }
  if ([v9 count])
  {
    long long v37 = self;
    id v11 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v36 = v6;
    id v12 = v6;
    id v13 = [v12 countByEnumeratingWithState:&v43 objects:v54 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v44;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v44 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [*(id *)(*((void *)&v43 + 1) + 8 * i) accountIdentifier];
          [v11 addObject:v17];
        }
        id v14 = [v12 countByEnumeratingWithState:&v43 objects:v54 count:16];
      }
      while (v14);
    }

    id v35 = v7;
    unsigned __int8 v18 = +[NSSet setWithArray:v7];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v34 = v9;
    id obj = v9;
    id v19 = [obj countByEnumeratingWithState:&v39 objects:v53 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v40;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v40 != v21) {
            objc_enumerationMutation(obj);
          }
          id v23 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
          id v24 = objc_msgSend(v23, "uniqueIdentifier", v32, v33);
          if ([v18 containsObject:v24])
          {
            id v25 = MBGetDefaultLog();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v50 = v24;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Not clearing follow up with identifier %@", buf, 0xCu);
              uint64_t v32 = v24;
              _MBLog();
            }
          }
          else
          {
            long long v26 = [v23 uniqueIdentifier];
            long long v27 = [v26 componentsSeparatedByString:@"."];
            if ((unint64_t)[v27 count] < 2)
            {
              id v25 = 0;
            }
            else
            {
              id v25 = [v27 objectAtIndexedSubscript:1];
            }

            if (v25 && ([v11 containsObject:v25] & 1) == 0)
            {
              long long v28 = MBGetDefaultLog();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v50 = v23;
                __int16 v51 = 2112;
                long long v52 = v25;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Found follow-up item %@ with account identifier %@ to remove", buf, 0x16u);
                uint64_t v32 = v23;
                id v33 = v25;
                _MBLog();
              }

              long long v29 = [v23 uniqueIdentifier];
              id v48 = v29;
              id v30 = +[NSArray arrayWithObjects:&v48 count:1];
              [(MBFollowUpManager *)v37 clearPendingFollowUpsWithAccountIdentifier:v25 identifiers:v30];
            }
          }
        }
        id v20 = [obj countByEnumeratingWithState:&v39 objects:v53 count:16];
      }
      while (v20);
    }

    id v7 = v35;
    id v6 = v36;
    id v10 = 0;
    id v9 = v34;
    goto LABEL_31;
  }
LABEL_32:

  return v10 == 0;
}

- (BOOL)_shouldInformUserWithPersona:(id)a3 identifiers:(id)a4 withInterval:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 copyPreferencesValueForKey:@"UserNotificationEvents" class:objc_opt_class()];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(v9, "objectForKeyedSubscript:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
        if (v15)
        {
          id v17 = (void *)v15;

          unsigned __int8 v18 = +[NSDate date];
          [v18 timeIntervalSinceDate:v17];
          BOOL v16 = v19 > a5;

          goto LABEL_11;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
  id v17 = v10;
LABEL_11:

  return v16;
}

- (void)_updateDidInformUserWithPersona:(id)a3 identifier:(id)a4 oldIdentifier:(id)a5
{
  id v12 = a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = [v12 copyPreferencesValueForKey:@"UserNotificationEvents" class:objc_opt_class()];
  id v10 = [v9 mutableCopy];
  if (v10)
  {
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v10 = +[NSMutableDictionary dictionary];
  if (v7) {
LABEL_3:
  }
    [v10 removeObjectForKey:v7];
LABEL_4:
  id v11 = +[NSDate date];
  [v10 setObject:v11 forKeyedSubscript:v8];

  [v12 setPreferencesValue:v10 forKey:@"UserNotificationEvents"];
}

+ (id)connection
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (qword_100482330)
  {
    id v3 = (id)qword_100482330;
  }
  else
  {
    if (qword_100482340 != -1) {
      dispatch_once(&qword_100482340, &stru_100411168);
    }
    id v4 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.MobileBackup.MBHelperService"];
    [v4 setRemoteObjectInterface:qword_100482338];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100061654;
    v6[3] = &unk_100411038;
    v6[4] = v2;
    [v4 setInvalidationHandler:v6];
    objc_storeStrong((id *)&qword_100482330, v4);
    [v4 resume];
    id v3 = (id)qword_100482330;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)_finishXPCWithError:(id)a3
{
  id v3 = a3;
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "MBPrebuddyFollowUpController finish XPC with error: %{public}@", buf, 0xCu);
    _MBLog();
  }
}

- (double)recurringBackupWarningPeriod
{
  return self->_recurringBackupWarningPeriod;
}

- (void)setRecurringBackupWarningPeriod:(double)a3
{
  self->_recurringBackupWarningPeriod = a3;
}

- (MBHelperServiceProtocol)proxy
{
  return self->_proxy;
}

- (void)setProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_backgroundRestoreProgressQueue, 0);
  objc_storeStrong((id *)&self->_legacyController, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
}

@end