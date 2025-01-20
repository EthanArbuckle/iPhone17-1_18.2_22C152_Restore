@interface STPersistLocalAppsOperation
+ (BOOL)_shouldSkipApplicationWithParentURLResourceValues:(id)a3;
- (NSBackgroundActivityScheduler)backgroundActivity;
- (NSSet)predeterminedInstalledAppIdentifiers;
- (STPersistLocalAppsOperation)initWithPersistenceController:(id)a3;
- (STPersistLocalAppsOperation)initWithPersistenceController:(id)a3 installedApps:(id)a4;
- (STPersistLocalAppsOperation)initWithPersistenceController:(id)a3 installedApps:(id)a4 backgroundActivity:(id)a5;
- (id)_collectInstalledApps:(id)a3;
- (void)_collectAppMetadata:(id)a3;
- (void)main;
- (void)setBackgroundActivity:(id)a3;
- (void)setPredeterminedInstalledAppIdentifiers:(id)a3;
@end

@implementation STPersistLocalAppsOperation

- (STPersistLocalAppsOperation)initWithPersistenceController:(id)a3
{
  return [(STPersistLocalAppsOperation *)self initWithPersistenceController:a3 installedApps:0];
}

- (STPersistLocalAppsOperation)initWithPersistenceController:(id)a3 installedApps:(id)a4
{
  return [(STPersistLocalAppsOperation *)self initWithPersistenceController:a3 installedApps:a4 backgroundActivity:0];
}

- (STPersistLocalAppsOperation)initWithPersistenceController:(id)a3 installedApps:(id)a4 backgroundActivity:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)STPersistLocalAppsOperation;
  v11 = [(STPersistenceOperation *)&v14 initWithPersistenceController:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_predeterminedInstalledAppIdentifiers, a4);
    objc_storeStrong((id *)&v12->_backgroundActivity, a5);
  }

  return v12;
}

- (id)_collectInstalledApps:(id)a3
{
  id v33 = a3;
  v35 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v3 = +[LSApplicationRecord enumeratorWithOptions:0];
  id v4 = [v3 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v4)
  {
    id v5 = v4;
    v6 = (void **)SFRestrictionsPasscodeController_ptr;
    v7 = (mach_header_64 *)&_mh_execute_header;
    uint64_t v38 = LSInternalApplicationType;
    uint64_t v39 = *(void *)v41;
    uint64_t v37 = LSHiddenAppType;
    do
    {
      v8 = 0;
      id v36 = v5;
      do
      {
        if (*(void *)v41 != v39) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(NSObject **)(*((void *)&v40 + 1) + 8 * (void)v8);
        v11 = objc_msgSend(v6[57], "appMonitor", v33);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v9;
          _os_log_impl(v7, v11, OS_LOG_TYPE_INFO, "Found applicationRecord %@", buf, 0xCu);
        }

        v12 = [v9 compatibilityObject];
        v13 = [v12 applicationType];

        if (([v13 isEqualToString:v38] & 1) == 0
          && ![v13 isEqualToString:v37])
        {
          v15 = v7;
          v16 = v6;
          v17 = v3;
          objc_super v14 = [v9 bundleIdentifier];
          v18 = [v9 appTags];
          unsigned int v19 = [v18 containsObject:@"hidden"];

          if (v19)
          {
            v6 = v16;
            v20 = [v16[57] appMonitor];
            v3 = v17;
            v7 = v15;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v45 = v14;
              v21 = v15;
              v22 = v20;
              v23 = "Ignoring app %@ (hidden by SBAppTags)";
              goto LABEL_21;
            }
LABEL_22:

LABEL_23:
            id v5 = v36;
            goto LABEL_24;
          }
          v6 = v16;
          if ([v9 isLaunchProhibited])
          {
            v20 = [v16[57] appMonitor];
            v3 = v17;
            v7 = v15;
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_22;
            }
            *(_DWORD *)buf = 138412290;
            v45 = v14;
            v21 = v15;
            v22 = v20;
            v23 = "Ignoring app %@ (is an iMessage app)";
          }
          else if ([v14 hasPrefix:@"com.apple.webapp"])
          {
            v20 = [v16[57] appMonitor];
            v3 = v17;
            v7 = v15;
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_22;
            }
            *(_DWORD *)buf = 138412290;
            v45 = v14;
            v21 = v15;
            v22 = v20;
            v23 = "Ignoring app %@ (is a web clip)";
          }
          else
          {
            v24 = [v9 appClipMetadata];

            if (v24)
            {
              v25 = [v16[57] appMonitor];
              v7 = v15;
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v45 = v14;
                _os_log_impl(v15, v25, OS_LOG_TYPE_DEFAULT, "Ignoring app %@ (is an app clip)", buf, 0xCu);
              }

              v3 = v17;
              goto LABEL_23;
            }
            v26 = [v9 applicationState];
            unsigned int v27 = [v26 isRestricted];

            if (!v27)
            {
              v3 = v17;
              if (v14)
              {
                [v35 addObject:v14];
                v6 = v16;
              }
              else
              {
                v6 = v16;
                log = [v16[57] appMonitor];
                if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                {
                  v28 = [v9 URL];
                  v29 = [v28 absoluteString];
                  *(_DWORD *)buf = 138412290;
                  v45 = v29;
                  _os_log_impl(v15, log, OS_LOG_TYPE_DEFAULT, "Ignoring app %@ (no bundle identifier)", buf, 0xCu);

                  v6 = v16;
                  v3 = v17;
                }
              }
              v7 = v15;
              goto LABEL_23;
            }
            v6 = v16;
            v20 = [v16[57] appMonitor];
            v3 = v17;
            v7 = v15;
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_22;
            }
            *(_DWORD *)buf = 138412290;
            v45 = v14;
            v21 = v15;
            v22 = v20;
            v23 = "Ignoring app %@ (hidden by restrictions)";
          }
LABEL_21:
          _os_log_impl(v21, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
          goto LABEL_22;
        }
        objc_super v14 = [v6[57] appMonitor];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v45 = v9;
          __int16 v46 = 2112;
          v47 = v13;
          _os_log_impl(v7, v14, OS_LOG_TYPE_DEFAULT, "Ignoring application record %@ with type %@ (is internal or hidden)", buf, 0x16u);
        }
LABEL_24:

        v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v30 = [v3 countByEnumeratingWithState:&v40 objects:v48 count:16];
      id v5 = v30;
    }
    while (v30);
  }

  id v31 = [v35 copy];
  return v31;
}

+ (BOOL)_shouldSkipApplicationWithParentURLResourceValues:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:NSURLContentTypeKey];
  id v4 = v3;
  if (v3) {
    unsigned int v5 = [v3 conformsToType:UTTypeFolder] ^ 1;
  }
  else {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (void)_collectAppMetadata:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bundleIdentifier];
  id v26 = 0;
  id v5 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v26];
  id v6 = v26;
  if (v5)
  {
    v7 = [v5 URL];
    v8 = [v5 compatibilityObject];
    id v9 = [v8 applicationType];
    unsigned __int8 v10 = [v9 isEqualToString:@"User"];

    if ((v10 & 1) == 0)
    {
      v23 = +[STLog appMonitor];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v4;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Not saving icon for %@ because it's a system app", buf, 0xCu);
      }
      goto LABEL_15;
    }
    if (_os_feature_enabled_impl())
    {
      v11 = [v5 iTunesMetadata];
      v12 = [v11 distributorInfo];
      v13 = [v12 distributorID];
      [v3 setDistributorID:v13];

      objc_super v14 = [v5 iTunesMetadata];
      v15 = [v14 distributorInfo];
      objc_msgSend(v3, "setDistributorIsThirdParty:", objc_msgSend(v15, "distributorIsThirdParty"));

      v16 = [v5 iTunesMetadata];
      v17 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v16 storeItemIdentifier]);
      [v3 setAdamID:v17];

      v18 = [v5 iTunesMetadata];
      unsigned int v19 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v18 versionIdentifier]);
      [v3 setVersionIdentifier:v19];

      v20 = [v5 iTunesMetadata];
      v21 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v20 betaVersionIdentifier]);
      [v3 setBetaVersionIdentifier:v21];
    }
    if ([v5 isProfileValidated])
    {
      v22 = [v5 localizedName];
      [v3 setDisplayName:v22];

      [v3 updateIconDataWithURL:v7];
      v23 = +[STLog appMonitor];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = [v3 displayName];
        v25 = [v3 bundleIdentifier];
        *(_DWORD *)buf = 138412546;
        v28 = v24;
        __int16 v29 = 2112;
        id v30 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Saving name/icon for app %@ (%@) since it isn't in the store", buf, 0x16u);

LABEL_14:
      }
    }
    else
    {
      v23 = +[STLog appMonitor];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [v5 bundleIdentifier];
        *(_DWORD *)buf = 138412290;
        v28 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Not saving icon for %@ because it's a store app", buf, 0xCu);
        goto LABEL_14;
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  v7 = +[STLog appMonitor];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100262CBC();
  }
LABEL_16:
}

- (void)main
{
  os_activity_t v4 = _os_activity_create((void *)&_mh_execute_header, "STPersistLocalAppsOperation start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  [(STOperation *)self setActivity:v4];

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = [(STOperation *)self activity];
  os_activity_scope_enter(v5, &state);

  id v6 = [(STPersistenceOperation *)self persistenceController];
  id v7 = [v6 newBackgroundContext];

  [v7 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  [v7 setName:@"STPersistLocalAppsOperation"];
  v8 = +[STLog appMonitor];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Beginning new app save activity", buf, 2u);
  }

  id v9 = [(STPersistLocalAppsOperation *)self predeterminedInstalledAppIdentifiers];

  if (v9) {
    [(STPersistLocalAppsOperation *)self predeterminedInstalledAppIdentifiers];
  }
  else {
  unsigned __int8 v10 = [(STPersistLocalAppsOperation *)self _collectInstalledApps:v7];
  }
  if ([v10 count])
  {
    v11 = [(STPersistLocalAppsOperation *)self backgroundActivity];
    v12 = v11;
    if (v11 && [v11 shouldDefer])
    {
      [(STPersistLocalAppsOperation *)self endOperationWithResultObject:&off_10030FD18];
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100054B9C;
      v14[3] = &unk_1002FC698;
      id v15 = v7;
      v16 = self;
      id v17 = v10;
      id v18 = v12;
      [v15 performBlockAndWait:v14];
    }
  }
  else
  {
    v13 = +[STLog appMonitor];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No installed apps found, will try again later", buf, 2u);
    }

    [(STPersistLocalAppsOperation *)self endOperationWithResultObject:&off_10030FD00];
  }

  os_activity_scope_leave(&state);
}

- (NSSet)predeterminedInstalledAppIdentifiers
{
  return self->_predeterminedInstalledAppIdentifiers;
}

- (void)setPredeterminedInstalledAppIdentifiers:(id)a3
{
}

- (NSBackgroundActivityScheduler)backgroundActivity
{
  return (NSBackgroundActivityScheduler *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBackgroundActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivity, 0);
  objc_storeStrong((id *)&self->_predeterminedInstalledAppIdentifiers, 0);
}

@end