@interface MBAppManager
+ (MBAppManager)appManagerWithSettingsContext:(id)a3;
+ (id)_allPersistedDisabledDomainNamesForPersona:(id)a3;
+ (id)_volumesToBackUpForPersona:(id)a3;
+ (id)appManager;
+ (void)_persistDisabledDomainNames:(id)a3 forPersona:(id)a4;
- (BOOL)_isContainerizedAppDomain:(id)a3;
- (BOOL)isDomainNameEnabled:(id)a3 forPersona:(id)a4;
- (BOOL)loadAppsWithPersona:(id)a3 safeHarbors:(BOOL)a4 dataSeparatedBundleIDs:(id)a5 error:(id *)a6;
- (BOOL)loadAppsWithPersona:(id)a3 safeHarbors:(BOOL)a4 error:(id *)a5;
- (BOOL)moveAppDataToSafeHarborForContainer:(id)a3 withPersona:(id)a4 usingIntermediateRestoreDir:(BOOL)a5 withError:(id *)a6;
- (BOOL)moveAppDataToSafeHarborForContainer:(id)a3 withPersona:(id)a4 withError:(id *)a5;
- (MBAppManager)initWithMobileInstallation:(id)a3;
- (id)_allDisabledDomainNamesForPersona:(id)a3;
- (id)_copyAppsWithPlists:(id)a3 volumeMountPoints:(id)a4 safeHarbor:(BOOL)a5 error:(id *)a6;
- (id)_copySafeHarborsWithVolumeMountPoints:(id)a3 error:(id *)a4;
- (id)_copySystemContainersWithPlists:(id)a3 volumeMountPoints:(id)a4 error:(id *)a5;
- (id)_copySystemContainersWithVolumeMountPoints:(id)a3 error:(id *)a4;
- (id)_copySystemPluginsForPersona:(id)a3 volumeMountPoints:(id)a4 error:(id *)a5;
- (id)_copySystemPluginsWithPlists:(id)a3 volumeMountPoints:(id)a4 error:(id *)a5;
- (id)_copyUserAppsForPersona:(id)a3 dataSeparatedBundleIDs:(id)a4 volumeMountPoints:(id)a5 error:(id *)a6;
- (id)_placeholderFilesForBundleID:(id)a3;
- (id)_subdomainNamesForAppDomainNames:(id)a3;
- (id)allApps;
- (id)allContainers;
- (id)allDisabledDomainNames;
- (id)allDisabledDomainNamesForPersona:(id)a3;
- (id)allPlugins;
- (id)allRestrictedDomainNames;
- (id)allRestrictedDomainNamesForPersona:(id)a3;
- (id)allSystemContainers;
- (id)appWithIdentifier:(id)a3;
- (id)containerWithIdentifier:(id)a3;
- (id)createSafeHarborForContainer:(id)a3 withPersona:(id)a4 error:(id *)a5;
- (id)createSafeHarborForContainer:(id)a3 withPersona:(id)a4 usingIntermediateRestoreDir:(BOOL)a5 error:(id *)a6;
- (id)dependentDomainNamesForAppDomainName:(id)a3;
- (id)fetchAppWithIdentifier:(id)a3 persona:(id)a4 error:(id *)a5;
- (id)systemDataContainerWithIdentifier:(id)a3;
- (id)systemSharedContainerWithIdentifier:(id)a3;
- (void)_reconcileBooksAndHealthInDisabledDomainsList:(id)a3;
- (void)_syncDisabledDomainsWithAllInstalledAppDomains:(id)a3 persona:(id)a4;
- (void)removeAllDisabledDomainNamesForPersona:(id)a3;
- (void)removeOldSafeHarborsWithExpiration:(double)a3;
- (void)removeStaleStateForUninstalledAppsForPersona:(id)a3;
- (void)setEnabled:(BOOL)a3 forDomainName:(id)a4 persona:(id)a5;
@end

@implementation MBAppManager

+ (id)appManager
{
  v2 = [[MBAppManager alloc] initWithMobileInstallation:0];

  return v2;
}

+ (MBAppManager)appManagerWithSettingsContext:(id)a3
{
  id v3 = a3;
  v4 = [MBAppManager alloc];
  v5 = [v3 mobileInstallation];

  v6 = [(MBAppManager *)v4 initWithMobileInstallation:v5];

  return v6;
}

- (MBAppManager)initWithMobileInstallation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MBAppManager;
  v6 = [(MBAppManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mobileInstallation, a3);
  }

  return v7;
}

- (id)_subdomainNamesForAppDomainNames:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v46 = self;
  id obj = [(MBAppManager *)self allApps];
  id v6 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
  id v55 = v4;
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v71;
    uint64_t v47 = *(void *)v71;
    do
    {
      objc_super v9 = 0;
      id v49 = v7;
      do
      {
        if (*(void *)v71 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v70 + 1) + 8 * (void)v9);
        v12 = [v10 domain];
        v13 = [v12 name];
        unsigned int v14 = [v4 containsObject:v13];

        if (v14)
        {
          v53 = v11;
          context = v9;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          v15 = [v10 containers];
          id v16 = [v15 countByEnumeratingWithState:&v66 objects:v76 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v67;
            do
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v67 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = *(void **)(*((void *)&v66 + 1) + 8 * i);
                v21 = [v20 identifier];
                v22 = [v10 identifier];
                unsigned __int8 v23 = [v21 isEqualToString:v22];

                if ((v23 & 1) == 0)
                {
                  v24 = [v20 domain];
                  v25 = [v24 name];
                  [v5 addObject:v25];
                }
              }
              id v17 = [v15 countByEnumeratingWithState:&v66 objects:v76 count:16];
            }
            while (v17);
          }

          id v4 = v55;
          objc_super v9 = context;
          uint64_t v8 = v47;
          id v7 = v49;
          v11 = v53;
        }
        objc_super v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
    }
    while (v7);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obja = [(MBAppManager *)v46 allApps];
  id v26 = [obja countByEnumeratingWithState:&v62 objects:v75 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v63;
    uint64_t v48 = *(void *)v63;
    do
    {
      v29 = 0;
      id v50 = v27;
      do
      {
        if (*(void *)v63 != v28) {
          objc_enumerationMutation(obja);
        }
        v30 = *(void **)(*((void *)&v62 + 1) + 8 * (void)v29);
        v31 = [v30 domain];
        v32 = [v31 name];
        unsigned __int8 v33 = [v4 containsObject:v32];

        if ((v33 & 1) == 0)
        {
          v54 = v29;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          v34 = [v30 containers];
          id v35 = [v34 countByEnumeratingWithState:&v58 objects:v74 count:16];
          if (v35)
          {
            id v36 = v35;
            uint64_t v37 = *(void *)v59;
            do
            {
              for (j = 0; j != v36; j = (char *)j + 1)
              {
                if (*(void *)v59 != v37) {
                  objc_enumerationMutation(v34);
                }
                v39 = *(void **)(*((void *)&v58 + 1) + 8 * (void)j);
                v40 = [v39 identifier];
                v41 = [v30 identifier];
                unsigned __int8 v42 = [v40 isEqualToString:v41];

                if ((v42 & 1) == 0)
                {
                  v43 = [v39 domain];
                  v44 = [v43 name];
                  [v5 removeObject:v44];
                }
              }
              id v36 = [v34 countByEnumeratingWithState:&v58 objects:v74 count:16];
            }
            while (v36);
          }

          v29 = v54;
          id v4 = v55;
          uint64_t v28 = v48;
          id v27 = v50;
        }
        v29 = (char *)v29 + 1;
      }
      while (v29 != v27);
      id v27 = [obja countByEnumeratingWithState:&v62 objects:v75 count:16];
    }
    while (v27);
  }

  return v5;
}

+ (id)_allPersistedDisabledDomainNamesForPersona:(id)a3
{
  id v3 = a3;
  id v4 = sub_100066CB8();
  dispatch_assert_queue_V2(v4);

  id v5 = [v3 copyPreferencesValueForKey:@"DisabledDomains" class:objc_opt_class()];
  if (v5)
  {
    uint64_t v6 = +[NSMutableSet setWithArray:v5];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }
  id v7 = (void *)v6;

  return v7;
}

+ (void)_persistDisabledDomainNames:(id)a3 forPersona:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  uint64_t v6 = sub_100066CB8();
  dispatch_assert_queue_V2(v6);

  if (!v9) {
    sub_10009A368();
  }
  id v7 = [v9 allObjects];
  uint64_t v8 = [v7 sortedArrayUsingSelector:"compare:"];

  [v5 setPreferencesValue:v8 forKey:@"DisabledDomains"];
}

- (void)removeAllDisabledDomainNamesForPersona:(id)a3
{
  id v3 = a3;
  id v4 = sub_100066CB8();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066E68;
  block[3] = &unk_1000F1A78;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

- (id)_allDisabledDomainNamesForPersona:(id)a3
{
  id v4 = a3;
  id v5 = sub_100066CB8();
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(id)objc_opt_class() _allPersistedDisabledDomainNamesForPersona:v4];

  id v7 = [(MBAppManager *)self _subdomainNamesForAppDomainNames:v6];
  [v6 unionSet:v7];

  return v6;
}

- (id)allDisabledDomainNames
{
  return [(MBAppManager *)self allDisabledDomainNamesForPersona:0];
}

- (id)allDisabledDomainNamesForPersona:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100067044;
  id v16 = sub_100067054;
  id v17 = 0;
  id v5 = sub_100066CB8();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006705C;
  block[3] = &unk_1000F1FB0;
  id v10 = v4;
  v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_syncDisabledDomainsWithAllInstalledAppDomains:(id)a3 persona:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_100066CB8();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067180;
  block[3] = &unk_1000F1FD8;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

- (void)_reconcileBooksAndHealthInDisabledDomainsList:(id)a3
{
  id v3 = a3;
  if (([v3 containsObject:@"AppDomain-com.apple.iBooks"] & 1) == 0) {
    [v3 removeObject:@"BooksDomain"];
  }
  if (([v3 containsObject:@"AppDomain-com.apple.Health"] & 1) == 0) {
    [v3 removeObject:@"HealthDomain"];
  }
  if (([v3 containsObject:@"HealthDomain"] & 1) == 0) {
    [v3 removeObject:@"AppDomain-com.apple.Health"];
  }
}

- (BOOL)_isContainerizedAppDomain:(id)a3
{
  id v3 = a3;
  if ((+[MBDomain isAppName:v3] & 1) != 0
    || (+[MBDomain isAppPluginName:v3] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = +[MBDomain isAppGroupName:v3];
  }

  return v4;
}

- (BOOL)isDomainNameEnabled:(id)a3 forPersona:(id)a4
{
  id v6 = a3;
  id v7 = [(MBAppManager *)self allDisabledDomainNamesForPersona:a4];
  LOBYTE(self) = [v7 containsObject:v6];

  return self ^ 1;
}

- (void)setEnabled:(BOOL)a3 forDomainName:(id)a4 persona:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_100066CB8();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100067640;
  v13[3] = &unk_1000F2000;
  v13[4] = self;
  id v14 = v9;
  BOOL v16 = a3;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(v10, v13);
}

- (id)allRestrictedDomainNamesForPersona:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v3 = +[MBPersona personalPersonaWithError:0];
  }
  id v4 = [v3 copyPreferencesValueForKey:@"RestrictedDomains" class:objc_opt_class()];
  if ([v4 count])
  {
    uint64_t v5 = +[NSMutableSet setWithArray:v4];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  id v6 = (void *)v5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = +[MCProfileConnection sharedConnection];
  id v8 = [v7 doNotBackupAppIDs];

  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v14 = +[MBDomain nameWithAppID:v13];
        [v6 addObject:v14];

        id v15 = +[MBDomain placeholderNameWithAppID:v13];
        [v6 addObject:v15];
      }
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  BOOL v16 = [(MBAppManager *)self _subdomainNamesForAppDomainNames:v6];
  [v6 unionSet:v16];

  return v6;
}

- (id)allRestrictedDomainNames
{
  return [(MBAppManager *)self allRestrictedDomainNamesForPersona:0];
}

- (BOOL)loadAppsWithPersona:(id)a3 safeHarbors:(BOOL)a4 error:(id *)a5
{
  return [(MBAppManager *)self loadAppsWithPersona:a3 safeHarbors:a4 dataSeparatedBundleIDs:0 error:a5];
}

+ (id)_volumesToBackUpForPersona:(id)a3
{
  id v3 = [a3 volumesToBackUp];
  id v4 = [v3 allObjects];
  uint64_t v5 = [v4 sortedArrayUsingComparator:&stru_1000F2040];

  return v5;
}

- (BOOL)loadAppsWithPersona:(id)a3 safeHarbors:(BOOL)a4 dataSeparatedBundleIDs:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  id v8 = a3;
  id v75 = a5;
  v79 = v8;
  id v9 = [v8 user];
  if ([v9 isPrimaryUser]) {
    unsigned int v80 = [v8 isPersonalPersona];
  }
  else {
    unsigned int v80 = 0;
  }

  id v10 = +[UMUserManager sharedManager];
  uint64_t v11 = [v10 currentPersona];
  long long v70 = [v11 userPersonaUniqueString];

  id v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v119 = v79;
    __int16 v120 = 2112;
    v121 = v70;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Enumerating apps for persona %@ with current persona %@", buf, 0x16u);
    long long v63 = v79;
    long long v64 = v70;
    _MBLog();
  }

  v78 = [(id)objc_opt_class() _volumesToBackUpForPersona:v79];
  id v77 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
  id v114 = 0;
  id v72 = [(MBAppManager *)self _copyUserAppsForPersona:v79 dataSeparatedBundleIDs:v75 volumeMountPoints:v78 error:&v114];
  id v13 = v114;
  id v14 = v13;
  if (!v72)
  {
    id v73 = v13;
    BOOL v69 = 0;
    goto LABEL_70;
  }
  [v77 addObjectsFromArray:];
  if ((v80 & v7) == 1)
  {
    id v113 = v14;
    id v15 = v14;
    id v16 = [(MBAppManager *)self _copySafeHarborsWithVolumeMountPoints:v78 error:&v113];
    id v17 = v113;

    if (!v16)
    {
      BOOL v69 = 0;
      id v73 = v17;
      goto LABEL_70;
    }
    [v77 addObjectsFromArray:v16];

    id v14 = v17;
  }
  uint64_t v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v73 = v14;
  containersByID = self->_containersByID;
  self->_containersByID = v18;

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id obj = v77;
  id v86 = [obj countByEnumeratingWithState:&v109 objects:v125 count:16];
  if (v86)
  {
    context = *(void **)v110;
    do
    {
      for (i = 0; i != v86; i = (char *)i + 1)
      {
        if (*(void **)v110 != context) {
          objc_enumerationMutation(obj);
        }
        long long v20 = *(void **)(*((void *)&v109 + 1) + 8 * i);
        long long v105 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v21 = [v20 containers:v63, v64, v65];
        id v22 = [v21 countByEnumeratingWithState:&v105 objects:v124 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v106;
          do
          {
            for (j = 0; j != v22; j = (char *)j + 1)
            {
              if (*(void *)v106 != v23) {
                objc_enumerationMutation(v21);
              }
              v25 = *(void **)(*((void *)&v105 + 1) + 8 * (void)j);
              int v27 = [v25 containerType];
              uint64_t v28 = [v25 identifier];
              v29 = [v25 containerDir];
              v30 = sub_10003F500(v27);
              v31 = MBGetDefaultLog();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                v119 = v28;
                __int16 v120 = 2112;
                v121 = v30;
                __int16 v122 = 2112;
                v123 = v29;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "App: Found container %@ (%@) at %@", buf, 0x20u);
                long long v64 = v30;
                long long v65 = v29;
                long long v63 = v28;
                _MBLog();
              }

              [(NSMutableDictionary *)self->_containersByID setObject:v25 forKeyedSubscript:v28];
            }
            id v22 = [v21 countByEnumeratingWithState:&v105 objects:v124 count:16];
          }
          while (v22);
        }
      }
      id v86 = [obj countByEnumeratingWithState:&v109 objects:v125 count:16];
    }
    while (v86);
  }

  if (v80)
  {
    id v104 = v73;
    id v67 = [(MBAppManager *)self _copySystemContainersWithVolumeMountPoints:v78 error:&v104];
    id v32 = v104;

    if (v67)
    {
      id v103 = v32;
      id v66 = [(MBAppManager *)self _copySystemPluginsForPersona:v79 volumeMountPoints:v78 error:&v103];
      id v74 = v103;

      unsigned __int8 v33 = v66;
      BOOL v69 = v66 != 0;
      if (v66)
      {
        long long v101 = 0u;
        long long v102 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        id v76 = v66;
        id v34 = [v76 countByEnumeratingWithState:&v99 objects:v117 count:16];
        if (v34)
        {
          uint64_t v81 = *(void *)v100;
          do
          {
            uint64_t v35 = 0;
            id obja = v34;
            do
            {
              if (*(void *)v100 != v81) {
                objc_enumerationMutation(v76);
              }
              uint64_t v87 = v35;
              id v36 = *(void **)(*((void *)&v99 + 1) + 8 * v35);
              v89 = [v36 identifier];
              uint64_t v37 = MBGetDefaultLog();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                v38 = v37;
                if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                {
                  v39 = [v36 containerDir];
                  *(_DWORD *)buf = 138412546;
                  v119 = v89;
                  __int16 v120 = 2112;
                  v121 = v39;
                  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "System Plugin: Found container %@ %@", buf, 0x16u);
                }
                [v36 containerDir];
                v64 = long long v63 = v89;
                _MBLog();
              }
              [(NSMutableDictionary *)self->_containersByID setObject:v36 forKeyedSubscript:v89];
              long long v97 = 0u;
              long long v98 = 0u;
              long long v95 = 0u;
              long long v96 = 0u;
              v40 = [v36 allAppGroupContainers];
              id v41 = [v40 countByEnumeratingWithState:&v95 objects:v116 count:16];
              if (v41)
              {
                uint64_t v42 = *(void *)v96;
                do
                {
                  for (k = 0; k != v41; k = (char *)k + 1)
                  {
                    if (*(void *)v96 != v42) {
                      objc_enumerationMutation(v40);
                    }
                    v44 = *(void **)(*((void *)&v95 + 1) + 8 * (void)k);
                    v45 = [v44 identifier:v63, v64, v65];
                    v46 = [(NSMutableDictionary *)self->_containersByID objectForKeyedSubscript:v45];
                    BOOL v47 = v46 == 0;

                    if (v47)
                    {
                      uint64_t v48 = MBGetDefaultLog();
                      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
                      {
                        id v49 = v48;
                        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                        {
                          id v50 = [v44 containerDir];
                          *(_DWORD *)buf = 138412802;
                          v119 = v45;
                          __int16 v120 = 2112;
                          v121 = v50;
                          __int16 v122 = 2112;
                          v123 = v89;
                          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "System Plugin: Found app group container %@ at %@ for %@", buf, 0x20u);
                        }
                        long long v64 = [v44 containerDir];
                        long long v65 = v89;
                        long long v63 = v45;
                        _MBLog();
                      }
                      [(NSMutableDictionary *)self->_containersByID setObject:v44 forKeyedSubscript:v45];
                    }
                  }
                  id v41 = [v40 countByEnumeratingWithState:&v95 objects:v116 count:16];
                }
                while (v41);
              }

              uint64_t v35 = v87 + 1;
            }
            while ((id)(v87 + 1) != obja);
            id v34 = [v76 countByEnumeratingWithState:&v99 objects:v117 count:16];
          }
          while (v34);
        }

        v51 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        systemDataContainersByID = self->_systemDataContainersByID;
        self->_systemDataContainersByID = v51;

        v53 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        systemSharedContainersByID = self->_systemSharedContainersByID;
        self->_systemSharedContainersByID = v53;

        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v55 = v67;
        id v56 = [v55 countByEnumeratingWithState:&v91 objects:v115 count:16];
        if (v56)
        {
          uint64_t v57 = *(void *)v92;
          do
          {
            for (m = 0; m != v56; m = (char *)m + 1)
            {
              if (*(void *)v92 != v57) {
                objc_enumerationMutation(v55);
              }
              long long v59 = *(void **)(*((void *)&v91 + 1) + 8 * (void)m);
              if (objc_msgSend(v59, "isSystemSharedContainer", v63, v64)) {
                long long v60 = self->_systemSharedContainersByID;
              }
              else {
                long long v60 = self->_systemDataContainersByID;
              }
              long long v61 = [v59 identifier];
              [(NSMutableDictionary *)v60 setObject:v59 forKeyedSubscript:v61];
            }
            id v56 = [v55 countByEnumeratingWithState:&v91 objects:v115 count:16];
          }
          while (v56);
        }

        unsigned __int8 v33 = v66;
      }

      id v32 = v74;
    }
    else
    {
      BOOL v69 = 0;
    }

    id v73 = v32;
  }
  else
  {
    BOOL v69 = 1;
  }
LABEL_70:

  if (a6) {
    *a6 = v73;
  }

  return v69;
}

- (id)_copyUserAppsForPersona:(id)a3 dataSeparatedBundleIDs:(id)a4 volumeMountPoints:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Looking up user apps", buf, 2u);
    _MBLog();
  }

  mobileInstallation = self->_mobileInstallation;
  id v22 = 0;
  id v16 = [(MBMobileInstallation *)mobileInstallation userAppsForPersona:v10 dataSeparatedBundleIDs:v11 error:&v22];
  id v17 = v22;
  uint64_t v18 = [v16 allValues];

  if (v18)
  {

    id v21 = 0;
    id v19 = [(MBAppManager *)self _copyAppsWithPlists:v18 volumeMountPoints:v12 safeHarbor:0 error:&v21];
    id v17 = v21;
  }
  else
  {
    id v19 = 0;
  }

  if (a6) {
    *a6 = v17;
  }

  return v19;
}

- (id)_copySystemPluginsForPersona:(id)a3 volumeMountPoints:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Looking up system plugins", buf, 2u);
    _MBLog();
  }

  mobileInstallation = self->_mobileInstallation;
  id v19 = 0;
  id v13 = [(MBMobileInstallation *)mobileInstallation systemPluginsForPersona:v8 error:&v19];
  id v14 = v19;
  id v15 = [v13 allValues];

  if (v15)
  {

    id v18 = 0;
    id v16 = [(MBAppManager *)self _copySystemPluginsWithPlists:v15 volumeMountPoints:v9 error:&v18];
    id v14 = v18;
  }
  else
  {
    id v16 = 0;
  }

  if (a5) {
    *a5 = v14;
  }

  return v16;
}

- (id)_copySafeHarborsWithVolumeMountPoints:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Copying safe harbors", buf, 2u);
    _MBLog();
  }

  mobileInstallation = self->_mobileInstallation;
  id v16 = 0;
  id v10 = [(MBMobileInstallation *)mobileInstallation safeHarborsWithError:&v16];
  id v11 = v16;
  id v12 = [v10 allValues];

  if (v12)
  {

    id v15 = 0;
    id v13 = [(MBAppManager *)self _copyAppsWithPlists:v12 volumeMountPoints:v6 safeHarbor:1 error:&v15];
    id v11 = v15;
  }
  else
  {
    id v13 = 0;
  }

  if (a4) {
    *a4 = v11;
  }

  return v13;
}

- (id)_copyAppsWithPlists:(id)a3 volumeMountPoints:(id)a4 safeHarbor:(BOOL)a5 error:(id *)a6
{
  id v7 = a3;
  id v32 = a4;
  id v29 = [objc_alloc((Class)NSMutableArray) initWithCapacity:objc_msgSend(v7, "count")];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v11);
        id v14 = sub_100068D40(v12, v32);
        if (v14)
        {
          id v15 = [(MBContainer *)[MBApp alloc] initWithPropertyList:v12 volumeMountPoint:v14];
          if (!v15) {
            sub_10009A394();
          }
          id v16 = v15;
          id v17 = [(MBApp *)v15 bundleID];
          uint64_t v18 = [v16 bundleDir];
          id v19 = v18;
          if (a5)
          {
LABEL_11:
            long long v20 = [v16 containerDir:v25, v26, v27, v28];
            id v21 = MBGetDefaultLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              unsigned int v22 = [v16 isPlaceholder];
              *(_DWORD *)buf = 138413058;
              v38 = v17;
              __int16 v39 = 1024;
              *(_DWORD *)v40 = v22;
              *(_WORD *)&v40[4] = 2112;
              *(void *)&v40[6] = v19;
              __int16 v41 = 2112;
              uint64_t v42 = v20;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Found installed app, bundleID:%@, isPlaceholder:%d, bundleDir:%@, containerDir:%@", buf, 0x26u);
              int v27 = v19;
              uint64_t v28 = v20;
              v25 = v17;
              unint64_t v26 = [v16 isPlaceholder];
              _MBLog();
            }

            [v29 addObject:v16];
          }
          else if (v17)
          {
            if (v18) {
              goto LABEL_11;
            }
            long long v20 = MBGetDefaultLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v38 = v17;
              __int16 v39 = 2112;
              *(void *)v40 = v12;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Found nil bundleDir for %@: %@", buf, 0x16u);
              v25 = v17;
              unint64_t v26 = (unint64_t)v12;
LABEL_23:
              _MBLog();
            }
          }
          else
          {
            long long v20 = MBGetDefaultLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v12;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Found nil bundleID: %@", buf, 0xCu);
              v25 = v12;
              goto LABEL_23;
            }
          }

          goto LABEL_17;
        }
        id v16 = [v12 objectForKeyedSubscript:kCFBundleIdentifierKey];
        id v17 = [v12 objectForKeyedSubscript:@"Container"];
        id v19 = MBGetDefaultLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          v38 = v16;
          __int16 v39 = 2112;
          *(void *)v40 = v17;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Skipping app %@, because it's container path %@ is on the wrong volume", buf, 0x16u);
          v25 = v16;
          unint64_t v26 = (unint64_t)v17;
          _MBLog();
        }
LABEL_17:

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v23 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
      id v9 = v23;
    }
    while (v23);
  }

  return v29;
}

- (id)_copySystemPluginsWithPlists:(id)a3 volumeMountPoints:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v6 count]];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v32;
    id v13 = &OBJC_IVAR___MBBackupOperation__fileID;
    while (2)
    {
      id v14 = 0;
      id v30 = v11;
      do
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v14);
        uint64_t v16 = sub_100068D40(v15, v7);
        if (v16)
        {
          id v17 = (void *)v16;
          uint64_t v18 = [objc_alloc((Class)(v13 + 760)) initWithPropertyList:v15 volumeMountPoint:v16];
          if (!v18)
          {

            id v27 = 0;
            goto LABEL_17;
          }
          id v19 = v18;
          long long v20 = MBGetDefaultLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            [v19 identifier];
            uint64_t v21 = v12;
            id v22 = v7;
            id v23 = v8;
            id v24 = v9;
            unint64_t v26 = v25 = v13;
            *(_DWORD *)buf = 138412290;
            long long v36 = v26;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Installed system plugin: %@", buf, 0xCu);

            id v29 = [v19 identifier];
            _MBLog();

            id v13 = v25;
            id v9 = v24;
            id v8 = v23;
            id v7 = v22;
            uint64_t v12 = v21;
            id v11 = v30;
          }

          [v8 addObject:v19];
        }
        else
        {
          id v17 = [v15 objectForKeyedSubscript:kCFBundleIdentifierKey];
          id v19 = MBGetDefaultLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            long long v36 = v17;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Skipping system plugin %@, because it's container path is on the wrong volume", buf, 0xCu);
            _MBLog();
          }
        }

        id v14 = (char *)v14 + 1;
      }
      while (v11 != v14);
      id v11 = [v9 countByEnumeratingWithState:&v31 objects:v37 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v27 = v8;
LABEL_17:

  return v27;
}

- (id)_copySystemContainersWithVolumeMountPoints:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Looking up system containers", buf, 2u);
    _MBLog();
  }

  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v10 = [(MBMobileInstallation *)self->_mobileInstallation systemContainersWithError:0];
  id v11 = [v10 allValues];

  if (v11)
  {
    id v21 = 0;
    id v12 = [(MBAppManager *)self _copySystemContainersWithPlists:v11 volumeMountPoints:v6 error:&v21];
    id v13 = v21;
    if (!v12)
    {
      id v17 = MBGetDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to copy system containers from generated plists, error:%@", buf, 0xCu);
        _MBLog();
      }
      uint64_t v16 = v8;
      goto LABEL_16;
    }
    [v8 addObjectsFromArray:v12];

    id v14 = v13;
  }
  else
  {
    id v14 = 0;
  }
  id v15 = [(MBMobileInstallation *)self->_mobileInstallation systemSharedContainersWithError:0];
  uint64_t v16 = [v15 allValues];

  if (v16)
  {
    id v20 = v14;
    id v17 = [(MBAppManager *)self _copySystemContainersWithPlists:v16 volumeMountPoints:v6 error:&v20];
    id v13 = v20;

    if (v17)
    {
      [v8 addObjectsFromArray:v17];
LABEL_17:

      id v14 = v13;
      goto LABEL_18;
    }
    uint64_t v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to copy system shared containers from generated plists, error:%@", buf, 0xCu);
      _MBLog();
    }

LABEL_16:
    id v8 = 0;
    goto LABEL_17;
  }
LABEL_18:

  if (a4 && v14) {
    *a4 = v14;
  }

  return v8;
}

- (id)_copySystemContainersWithPlists:(id)a3 volumeMountPoints:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v6 count]];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v15 = sub_100068D40(v14, v7);
        if (v15)
        {
          uint64_t v16 = (void *)v15;
          id v17 = [(MBContainer *)[MBSystemContainer alloc] initWithPropertyList:v14 volumeMountPoint:v15];
          uint64_t v18 = MBGetDefaultLog();
          id v19 = v18;
          if (!v17)
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v30 = v14;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to parse system container plist: %@", buf, 0xCu);
              _MBLog();
            }

            if (a5)
            {
              *a5 = +[MBError errorWithCode:1 format:@"Failed to parse system container plist"];
            }

            id v21 = 0;
            goto LABEL_21;
          }
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            id v20 = [(MBContainer *)v17 identifier];
            *(_DWORD *)buf = 138412290;
            id v30 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "System container: %@", buf, 0xCu);

            id v23 = [(MBContainer *)v17 identifier];
            _MBLog();
          }
          [v8 addObject:v17];
        }
        else
        {
          uint64_t v16 = [v14 objectForKeyedSubscript:kCFBundleIdentifierKey];
          MBGetDefaultLog();
          id v17 = (MBSystemContainer *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v17->super.super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v30 = v16;
            _os_log_impl((void *)&_mh_execute_header, &v17->super.super, OS_LOG_TYPE_ERROR, "Skipping system container %@, because it's path is on the wrong volume", buf, 0xCu);
            _MBLog();
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v21 = v8;
LABEL_21:

  return v21;
}

- (id)allContainers
{
  id v3 = [(NSMutableDictionary *)self->_containersByID allValues];
  id v4 = [v3 mutableCopy];

  uint64_t v5 = [(NSMutableDictionary *)self->_systemDataContainersByID allValues];
  [v4 addObjectsFromArray:v5];

  id v6 = [(NSMutableDictionary *)self->_systemSharedContainersByID allValues];
  [v4 addObjectsFromArray:v6];

  return v4;
}

- (id)allApps
{
  v2 = [(NSMutableDictionary *)self->_containersByID allValues];
  id v3 = +[NSPredicate predicateWithBlock:&stru_1000F2080];
  id v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

- (id)allPlugins
{
  v2 = [(NSMutableDictionary *)self->_containersByID allValues];
  id v3 = +[NSPredicate predicateWithBlock:&stru_1000F20A0];
  id v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

- (id)allSystemContainers
{
  id v3 = [(NSMutableDictionary *)self->_systemDataContainersByID allValues];
  id v4 = [v3 mutableCopy];

  uint64_t v5 = [(NSMutableDictionary *)self->_systemSharedContainersByID allValues];
  [v4 addObjectsFromArray:v5];

  return v4;
}

- (id)containerWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_containersByID objectForKeyedSubscript:v4];
  if (!v5)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_systemDataContainersByID objectForKeyedSubscript:v4];
    if (!v5)
    {
      uint64_t v5 = [(NSMutableDictionary *)self->_systemSharedContainersByID objectForKeyedSubscript:v4];
    }
  }

  return v5;
}

- (id)systemDataContainerWithIdentifier:(id)a3
{
  return [(NSMutableDictionary *)self->_systemDataContainersByID objectForKeyedSubscript:a3];
}

- (id)systemSharedContainerWithIdentifier:(id)a3
{
  return [(NSMutableDictionary *)self->_systemSharedContainersByID objectForKeyedSubscript:a3];
}

- (id)appWithIdentifier:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_containersByID objectForKeyedSubscript:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)dependentDomainNamesForAppDomainName:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = +[MBDomain containerIDWithName:v4];
  id v7 = [(MBAppManager *)self appWithIdentifier:v6];
  id v8 = v7;
  if (v7)
  {
    id v19 = v6;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = [v7 containers];
    id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(*((void *)&v20 + 1) + 8 * i) domain];
          uint64_t v15 = [v14 name];
          unsigned __int8 v16 = [v15 isEqualToString:v4];

          if ((v16 & 1) == 0)
          {
            id v17 = [v14 name];
            [v5 addObject:v17];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    id v6 = v19;
  }

  return v5;
}

- (id)fetchAppWithIdentifier:(id)a3 persona:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  mobileInstallation = self->_mobileInstallation;
  id v42 = 0;
  uint64_t v37 = v8;
  id v11 = [(MBMobileInstallation *)mobileInstallation userAppWithBundleID:v8 placeholder:1 persona:v9 error:&v42];
  id v12 = v42;
  if (v11)
  {
    id v13 = [v11 objectForKeyedSubscript:@"Container"];
    if (v13)
    {
      id v14 = [(id)objc_opt_class() _volumesToBackUpForPersona:v9];
      uint64_t v15 = sub_100068D40(v11, v14);
      if (v15)
      {
        unsigned __int8 v16 = [(MBContainer *)[MBApp alloc] initWithPropertyList:v11 volumeMountPoint:v15];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v17 = [(MBApp *)v16 uniqueContainers];
        id v18 = [v17 countByEnumeratingWithState:&v38 objects:v51 count:16];
        if (v18)
        {
          id v19 = v18;
          long long v31 = v16;
          long long v32 = v15;
          long long v33 = v14;
          long long v34 = v13;
          id v35 = v12;
          id v36 = v9;
          uint64_t v20 = *(void *)v39;
          do
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v39 != v20) {
                objc_enumerationMutation(v17);
              }
              long long v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              int v24 = [v22 containerType];
              long long v25 = [v22 identifier];
              long long v26 = [v22 containerDir];
              long long v27 = sub_10003F500(v24);
              long long v28 = MBGetDefaultLog();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138413058;
                id v44 = v25;
                __int16 v45 = 2112;
                id v46 = v27;
                __int16 v47 = 2112;
                uint64_t v48 = v26;
                __int16 v49 = 2112;
                id v50 = v37;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Loaded container %@ (%@) at %@ for parent app %@", buf, 0x2Au);
                _MBLog();
              }
            }
            id v19 = [v17 countByEnumeratingWithState:&v38 objects:v51 count:16];
          }
          while (v19);
          id v9 = v36;
          id v13 = v34;
          id v12 = v35;
          uint64_t v15 = v32;
          id v14 = v33;
          unsigned __int8 v16 = v31;
        }
      }
      else
      {
        id v17 = [v14 componentsJoinedByString:@", "];
        if (a5)
        {
          +[MBError errorWithCode:3, @"%@ does not exist on expected volume(s) [%@]", v37, v17 format];
          unsigned __int8 v16 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          unsigned __int8 v16 = 0;
        }
      }
    }
    else if (a5)
    {
      +[MBError errorWithCode:4, @"App not installed: %@", v37 format];
      unsigned __int8 v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v16 = 0;
    }
  }
  else
  {
    id v29 = MBGetDefaultLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v44 = v8;
      __int16 v45 = 2112;
      id v46 = v12;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to load app with identifier %@: %@", buf, 0x16u);
      _MBLog();
    }

    unsigned __int8 v16 = 0;
    if (a5) {
      *a5 = v12;
    }
  }

  return v16;
}

- (void)removeOldSafeHarborsWithExpiration:(double)a3
{
  id v4 = +[NSDate dateWithTimeIntervalSinceNow:-a3];
  id v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing safe harbors created before %@", buf, 0xCu);
    long long v27 = v4;
    _MBLog();
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = [(MBAppManager *)self allContainers];
  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      id v10 = 0;
      id v30 = v8;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v10);
        if (objc_msgSend(v11, "isSafeHarbor", v27, v28))
        {
          id v12 = [v11 datePlacedInSafeHarbor];
          if (!v12)
          {
            long long v26 = +[NSAssertionHandler currentHandler];
            long long v27 = [v11 identifier];
            [v26 handleFailureInMethod:a2 object:self file:@"MBAppManager.m" lineNumber:609 description:@"Date missing from safe harbor: %@"];
          }
          if ([v12 compare:v4] == (id)-1)
          {
            uint64_t v20 = MBGetDefaultLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              long long v21 = [v11 identifier];
              *(_DWORD *)buf = 138412546;
              id v36 = v21;
              __int16 v37 = 2112;
              long long v38 = v12;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Removing safe harbor %@ created at %@", buf, 0x16u);

              long long v27 = [v11 identifier];
              long long v28 = v12;
              _MBLog();
            }
            mobileInstallation = self->_mobileInstallation;
            long long v23 = [v11 identifier];
            LODWORD(mobileInstallation) = -[MBMobileInstallation removeSafeHarborWithIdentifier:type:error:](mobileInstallation, "removeSafeHarborWithIdentifier:type:error:", v23, [v11 containerType], 0);

            if (mobileInstallation)
            {
              containersByID = self->_containersByID;
              id v13 = [v11 identifier];
              [(NSMutableDictionary *)containersByID removeObjectForKey:v13];
            }
            else
            {
              id v13 = MBGetDefaultLog();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                long long v25 = [v11 identifier];
                *(_DWORD *)buf = 138412290;
                id v36 = v25;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Error removing safe harbor: %@", buf, 0xCu);

                id v14 = [v11 identifier];
                long long v27 = v14;
                _MBLog();
                goto LABEL_20;
              }
            }
          }
          else
          {
            id v13 = [v11 datePlacedInSafeHarbor];
            id v14 = MBGetDefaultLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              [v11 identifier];
              uint64_t v15 = v9;
              unsigned __int8 v16 = v6;
              id v17 = v4;
              v19 = id v18 = self;
              *(_DWORD *)buf = 138412546;
              id v36 = v19;
              __int16 v37 = 2112;
              long long v38 = v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not removing safe harbor %@ created at %@", buf, 0x16u);

              self = v18;
              id v4 = v17;
              id v6 = v16;
              uint64_t v9 = v15;
              id v8 = v30;
              long long v27 = [v11 identifier];
              long long v28 = v13;
              _MBLog();
            }
LABEL_20:
          }
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v8);
  }
}

- (id)_placeholderFilesForBundleID:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [v3 stringByAppendingPathExtension:@"zip"];
    v8[0] = v4;
    id v5 = [v3 stringByAppendingPathExtension:@"ipa"];

    v8[1] = v5;
    id v6 = +[NSArray arrayWithObjects:v8 count:2];
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

- (void)removeStaleStateForUninstalledAppsForPersona:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  [v3 appPlaceholderArchiveDirectory];
  uint64_t v71 = 0;
  v52 = v51 = v4;
  uint64_t v5 = [v4 contentsOfDirectoryAtPath:x0 error:x1];
  id v53 = 0;
  id v44 = (void *)v5;
  if (v5)
  {
    uint64_t v6 = +[NSMutableSet setWithArray:v5];
  }
  else
  {
    id v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v77 = v52;
      __int16 v78 = 2112;
      id v79 = v53;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to fetch the contents of %@: %@", buf, 0x16u);
      id v42 = v52;
      id v43 = v53;
      _MBLog();
    }

    uint64_t v6 = objc_opt_new();
  }
  id v8 = (void *)v6;
  id v50 = objc_opt_new();
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v46 = v3;
  uint64_t v9 = [(MBAppManager *)self allRestrictedDomainNamesForPersona:v3];
  id v10 = [v9 countByEnumeratingWithState:&v67 objects:v75 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v68;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v68 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v67 + 1) + 8 * i);
        if (+[MBDomain isAppPlaceholderName:](MBDomain, "isAppPlaceholderName:", v14, v42, v43))
        {
          uint64_t v15 = +[MBDomain containerIDWithName:v14];
          [v50 addObject:v15];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v67 objects:v75 count:16];
    }
    while (v11);
  }

  unsigned __int8 v16 = +[NSMutableSet set];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v17 = [(MBAppManager *)self allApps];
  id v18 = [v17 countByEnumeratingWithState:&v63 objects:v74 count:16];
  __int16 v47 = v16;
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v64;
    __int16 v49 = v17;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v64 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = *(void **)(*((void *)&v63 + 1) + 8 * (void)j);
        long long v23 = [v22 domain];
        int v24 = [v23 name];

        if (v24) {
          [v16 addObject:v24];
        }
        if (([v22 isSystemApp] & 1) == 0)
        {
          long long v25 = [v22 bundleID];
          if (([v50 containsObject:v25] & 1) == 0)
          {
            long long v61 = 0u;
            long long v62 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v26 = [v22 bundleID];
            long long v27 = [(MBAppManager *)self _placeholderFilesForBundleID:v26];

            id v28 = [v27 countByEnumeratingWithState:&v59 objects:v73 count:16];
            if (v28)
            {
              id v29 = v28;
              uint64_t v30 = *(void *)v60;
              do
              {
                for (k = 0; k != v29; k = (char *)k + 1)
                {
                  if (*(void *)v60 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  [v8 removeObject:*(void *)(*((void *)&v59 + 1) + 8 * (void)k)];
                }
                id v29 = [v27 countByEnumeratingWithState:&v59 objects:v73 count:16];
              }
              while (v29);
            }

            unsigned __int8 v16 = v47;
            id v17 = v49;
          }
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v63 objects:v74 count:16];
    }
    while (v19);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v32 = v8;
  id v33 = [v32 countByEnumeratingWithState:&v55 objects:v72 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v56;
    do
    {
      id v36 = 0;
      __int16 v37 = v53;
      do
      {
        if (*(void *)v56 != v35) {
          objc_enumerationMutation(v32);
        }
        long long v38 = [v52 stringByAppendingPathComponent:*(void *)(*((void *)&v55 + 1) + 8 * (void)v36), v42, v43];
        long long v39 = MBGetDefaultLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v77 = v38;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Removing old placeholder archive at %@", buf, 0xCu);
          id v42 = v38;
          _MBLog();
        }

        id v54 = v37;
        unsigned __int8 v40 = [v51 removeItemAtPath:v38 error:&v54];
        id v53 = v54;

        if ((v40 & 1) == 0)
        {
          long long v41 = MBGetDefaultLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v77 = v38;
            __int16 v78 = 2112;
            id v79 = v53;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Failed to remove the placeholder archive at %@: %@", buf, 0x16u);
            id v42 = v38;
            id v43 = v53;
            _MBLog();
          }
        }
        id v36 = (char *)v36 + 1;
        __int16 v37 = v53;
      }
      while (v34 != v36);
      id v34 = [v32 countByEnumeratingWithState:&v55 objects:v72 count:16];
    }
    while (v34);
  }

  [(MBAppManager *)self _syncDisabledDomainsWithAllInstalledAppDomains:v47 persona:v46];
}

- (id)createSafeHarborForContainer:(id)a3 withPersona:(id)a4 usingIntermediateRestoreDir:(BOOL)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  if (qword_100112FD0 != -1) {
    dispatch_once(&qword_100112FD0, &stru_1000F20C0);
  }
  id v11 = +[NSFileManager defaultManager];
  uint64_t v12 = MBMobileFileAttributes();
  uint64_t v68 = 0;
  long long v69 = &v68;
  uint64_t v70 = 0x3032000000;
  uint64_t v71 = sub_100067044;
  id v72 = sub_100067054;
  id v73 = 0;
  uint64_t v62 = 0;
  long long v63 = &v62;
  uint64_t v64 = 0x3032000000;
  long long v65 = sub_100067044;
  long long v66 = sub_100067054;
  id v67 = 0;
  uint64_t v58 = 0;
  long long v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 0;
  uint64_t v52 = 0;
  id v53 = &v52;
  uint64_t v54 = 0x3032000000;
  long long v55 = sub_100067044;
  long long v56 = sub_100067054;
  id v57 = 0;
  id v13 = qword_100112FC8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006B4B4;
  block[3] = &unk_1000F20E8;
  id v14 = v10;
  id v42 = v14;
  id v43 = self;
  BOOL v51 = a5;
  __int16 v47 = &v68;
  uint64_t v48 = &v62;
  id v15 = v9;
  id v44 = v15;
  __int16 v49 = &v58;
  id v16 = v11;
  id v45 = v16;
  id v17 = v12;
  id v46 = v17;
  id v50 = &v52;
  dispatch_sync(v13, block);
  if (*((unsigned char *)v59 + 24))
  {
    uint64_t v18 = kMBSafeHarborDataDirName;
    id v19 = [(id)v63[5] stringByAppendingPathComponent:kMBSafeHarborDataDirName];
    uint64_t v20 = [(id)v63[5] stringByAppendingPathComponent:kMBSafeHarborInfoDirName];
    id v39 = [v20 stringByAppendingPathComponent:kMBSafeHarborInfoPlistFilename];
    long long v21 = [v14 volumeMountPoint];
    id v22 = [v15 copyWithVolumeMountPoint:v21];

    long long v23 = [(id)v69[5] stringByAppendingPathComponent:v18];
    [v22 setContainerDir:v23];

    int v24 = +[NSDate date];
    [v22 setDatePlacedInSafeHarbor:v24];

    long long v25 = MBGetDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v75 = v19;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Creating directory %@", buf, 0xCu);
      _MBLog();
    }

    if ([v16 createDirectoryAtPath:v19 withIntermediateDirectories:1 attributes:v17 error:a6])
    {
      long long v26 = MBGetDefaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v75 = v20;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Creating directory %@", buf, 0xCu);
        _MBLog();
      }

      if ([v16 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:v17 error:a6])
      {
        long long v27 = MBGetDefaultLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v75 = v39;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Writing %@", buf, 0xCu);
          _MBLog();
        }

        id v28 = [v22 propertyListForSafeHarborInfo];
        unsigned __int8 v29 = [v28 writeToFile:v39 atomically:1];

        if (v29)
        {
          id v30 = v39;
          long long v38 = (char *)[v30 fileSystemRepresentation];
          uid_t v31 = MBMobileUID();
          gid_t v32 = MBMobileUID();
          if (!lchown(v38, v31, v32))
          {
            containersByID = self->_containersByID;
            __int16 v37 = [v22 identifier];
            [(NSMutableDictionary *)containersByID setObject:v22 forKeyedSubscript:v37];

            id v34 = v22;
            goto LABEL_23;
          }
          if (a6)
          {
            id v33 = +[MBError posixErrorWithCode:100 path:v30 format:@"Error changing ownership of Safe Harbor Info.plist"];
LABEL_21:
            id v34 = 0;
            *a6 = v33;
LABEL_23:

            goto LABEL_24;
          }
        }
        else if (a6)
        {
          id v33 = +[MBError errorWithCode:100 path:v39 format:@"Error writing Safe Harbor Info.plist"];
          goto LABEL_21;
        }
      }
    }
    id v34 = 0;
    goto LABEL_23;
  }
  id v34 = 0;
  if (a6) {
    *a6 = (id) v53[5];
  }
LABEL_24:

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);

  return v34;
}

- (id)createSafeHarborForContainer:(id)a3 withPersona:(id)a4 error:(id *)a5
{
  return [(MBAppManager *)self createSafeHarborForContainer:a3 withPersona:a4 usingIntermediateRestoreDir:1 error:a5];
}

- (BOOL)moveAppDataToSafeHarborForContainer:(id)a3 withPersona:(id)a4 usingIntermediateRestoreDir:(BOOL)a5 withError:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if ([v10 isSafeHarbor])
  {
    BOOL v12 = 1;
  }
  else
  {
    id v78 = 0;
    id v13 = [(MBAppManager *)self createSafeHarborForContainer:v10 withPersona:v11 usingIntermediateRestoreDir:v7 error:&v78];
    id v14 = v78;

    if (v13)
    {
      mobileInstallation = self->_mobileInstallation;
      id v16 = [v10 identifier];
      id v77 = v14;
      id v17 = [(MBMobileInstallation *)mobileInstallation userAppWithBundleID:v16 placeholder:1 persona:v11 error:&v77];
      id v18 = v77;

      if (v17)
      {
        long long v65 = [v17 objectForKeyedSubscript:@"Container"];
        if (v65)
        {
          BOOL v67 = v7;
          containersByID = self->_containersByID;
          uint64_t v20 = [v10 identifier];
          long long v69 = [(NSMutableDictionary *)containersByID objectForKeyedSubscript:v20];

          long long v21 = +[NSFileManager defaultManager];
          id v76 = v18;
          uint64_t v22 = [v21 contentsOfDirectoryAtPath:v65 error:&v76];
          id v23 = v76;

          int v24 = (void *)v22;
          if (!v22 || v23)
          {
            id v50 = MBGetDefaultLog();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v81 = v65;
              __int16 v82 = 2112;
              id v83 = v23;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Failed to enumerate contents of path at %@: %@", buf, 0x16u);
              _MBLog();
            }

            BOOL v12 = 0;
            if (a6) {
              *a6 = v23;
            }
          }
          else
          {
            BOOL v12 = 1;
            uint64_t v71 = [(id)objc_opt_class() defaultSubdirectoriesForMBContainerType:1 withNestedSubdirectories:0];
            long long v72 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            id obj = v24;
            id v25 = [obj countByEnumeratingWithState:&v72 objects:v79 count:16];
            if (v25)
            {
              id v26 = v25;
              uint64_t v60 = v24;
              char v61 = v21;
              uint64_t v62 = v17;
              id v63 = v10;
              long long v59 = a6;
              uint64_t v64 = v11;
              uint64_t v27 = *(void *)v73;
              uint64_t v66 = kMBSafeHarborDataDirName;
              id v28 = v65;
              while (2)
              {
                for (i = 0; i != v26; i = (char *)i + 1)
                {
                  if (*(void *)v73 != v27) {
                    objc_enumerationMutation(obj);
                  }
                  id v30 = *(void **)(*((void *)&v72 + 1) + 8 * i);
                  uid_t v31 = [v30 pathComponents:v56];
                  gid_t v32 = [v31 objectAtIndexedSubscript:0];
                  unsigned __int8 v33 = [v71 containsObject:v32];

                  if (v33)
                  {
                    id v34 = [v28 stringByAppendingPathComponent:v30];
                    if (v67)
                    {
                      uint64_t v35 = [v64 userIncompleteRestoreDirectory];
                      id v36 = [v69 safeHarborDir];
                      __int16 v37 = [v36 stringByAppendingPathComponent:v66];
                      long long v38 = [v35 stringByAppendingPathComponent:v37];

                      id v28 = v65;
                    }
                    else
                    {
                      uint64_t v35 = [v69 safeHarborDir];
                      long long v38 = [v35 stringByAppendingPathComponent:v66];
                    }

                    unsigned __int8 v40 = [v38 stringByAppendingPathComponent:v30];
                    id v39 = v34;
                    long long v41 = (const std::__fs::filesystem::path *)[v39 fileSystemRepresentation];
                    id v42 = v40;
                    id v43 = (const std::__fs::filesystem::path *)[v42 fileSystemRepresentation];
                    rename(v41, v43, v44);
                    if (v45)
                    {
                      BOOL v51 = MBGetDefaultLog();
                      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                      {
                        uint64_t v52 = [v69 domain];
                        id v53 = [v52 name];
                        *(_DWORD *)buf = 138412290;
                        id v81 = v53;
                        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Failed to move file in %@ to safe harbor", buf, 0xCu);

                        uint64_t v54 = [v69 domain];
                        uint64_t v58 = [v54 name];
                        _MBLog();
                      }
                      int v24 = v60;
                      long long v21 = v61;
                      if (v59)
                      {
                        *long long v59 = +[MBError posixErrorWithCode:100 format:@"Failed to move file to safe harbor"];
                      }

                      BOOL v12 = 0;
                      id v17 = v62;
                      id v10 = v63;
                      id v11 = v64;
                      goto LABEL_47;
                    }
                  }
                  else
                  {
                    id v39 = MBGetDefaultLog();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v81 = v30;
                      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Not moving file %@ into the safe harbor because it lies outside the default directory hierarchy", buf, 0xCu);
                      long long v56 = v30;
                      _MBLog();
                    }
                  }
                }
                id v26 = [obj countByEnumeratingWithState:&v72 objects:v79 count:16];
                if (v26) {
                  continue;
                }
                break;
              }
              BOOL v12 = 1;
              id v17 = v62;
              id v10 = v63;
              id v11 = v64;
              int v24 = v60;
              long long v21 = v61;
            }
LABEL_47:
            id v23 = 0;
          }
          id v18 = v23;
        }
        else
        {
          uint64_t v48 = MBGetDefaultLog();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            __int16 v49 = [v10 identifier];
            *(_DWORD *)buf = 138412290;
            id v81 = v49;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "App %@ has no data container to move to safe harbor", buf, 0xCu);

            id v57 = [v10 identifier];
            _MBLog();
          }
          if (a6)
          {
            uint64_t v70 = [v10 identifier];
            +[MBError errorWithCode:1, @"App %@ has no data container to move to safe harbor", v70 format];
            BOOL v12 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            BOOL v12 = 0;
          }
        }
      }
      else
      {
        __int16 v47 = MBGetDefaultLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v81 = v18;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Failed to refresh app info before moving to safe harbor: %@", buf, 0xCu);
          _MBLog();
        }

        if (a6)
        {
          id v18 = v18;
          BOOL v12 = 0;
          *a6 = v18;
        }
        else
        {
          BOOL v12 = 0;
        }
      }

      id v14 = v18;
    }
    else
    {
      id v46 = MBGetDefaultLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v81 = v10;
        __int16 v82 = 2112;
        id v83 = v14;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Failed to create safe harbor for %@: %@", buf, 0x16u);
        _MBLog();
      }

      if (a6)
      {
        id v14 = v14;
        BOOL v12 = 0;
        *a6 = v14;
      }
      else
      {
        BOOL v12 = 0;
      }
    }
  }
  return v12;
}

- (BOOL)moveAppDataToSafeHarborForContainer:(id)a3 withPersona:(id)a4 withError:(id *)a5
{
  return [(MBAppManager *)self moveAppDataToSafeHarborForContainer:a3 withPersona:a4 usingIntermediateRestoreDir:1 withError:a5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemSharedContainersByID, 0);
  objc_storeStrong((id *)&self->_systemDataContainersByID, 0);
  objc_storeStrong((id *)&self->_containersByID, 0);

  objc_storeStrong((id *)&self->_mobileInstallation, 0);
}

@end