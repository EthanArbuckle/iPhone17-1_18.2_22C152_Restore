@interface _DomainSizer
+ (id)sizeDomain:(id)a3 manager:(id)a4 operationTracker:(id)a5 account:(id)a6 device:(id)a7 error:(id *)a8;
+ (id)sizeDomainsWithManager:(id)a3 operationTracker:(id)a4 account:(id)a5 device:(id)a6 error:(id *)a7;
- (BOOL)_addDependentDomainsWithError:(id *)a3;
- (BOOL)_addDomainSizesWithError:(id *)a3;
- (BOOL)_addPlaceholdersSizesWithError:(id *)a3;
- (BOOL)_addZeroBytesForDisabledAndRestrictedDomainNames;
- (MBAppManager)appManager;
- (MBCKCache)cache;
- (MBPersona)persona;
- (MBPlaceholderFileListDB)placeholderDB;
- (NSMutableDictionary)domainSizeByDomainName;
- (NSSet)disabledDomains;
- (NSSet)restrictedDomains;
- (NSString)domainToSize;
- (_DomainSizer)initWithPlaceholderFileList:(id)a3 persona:(id)a4 cache:(id)a5 appManager:(id)a6 domainQuotasByDomainHMAC:(id)a7 restrictedDomains:(id)a8 disabledDomains:(id)a9 domainToSize:(id)a10;
- (id)_convertDomainSizesToDomainInfos;
- (id)_sizeOfDomain:(id)a3;
- (id)_sizeWithError:(id *)a3;
- (void)_addCloudSize:(int64_t)a3 localSize:(int64_t)a4 forDomain:(id)a5;
@end

@implementation _DomainSizer

- (_DomainSizer)initWithPlaceholderFileList:(id)a3 persona:(id)a4 cache:(id)a5 appManager:(id)a6 domainQuotasByDomainHMAC:(id)a7 restrictedDomains:(id)a8 disabledDomains:(id)a9 domainToSize:(id)a10
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v27 = a7;
  id v26 = a8;
  id v25 = a9;
  id v17 = a10;
  v32.receiver = self;
  v32.super_class = (Class)_DomainSizer;
  v18 = [(_DomainSizer *)&v32 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_placeholderDB, a3);
    objc_storeStrong((id *)&v19->_persona, a4);
    objc_storeStrong((id *)&v19->_cache, a5);
    objc_storeStrong((id *)&v19->_appManager, a6);
    objc_storeStrong((id *)&v19->_domainQuotasByDomainHMAC, a7);
    objc_storeStrong((id *)&v19->_restrictedDomains, a8);
    objc_storeStrong((id *)&v19->_disabledDomains, a9);
    objc_storeStrong((id *)&v19->_domainToSize, a10);
    uint64_t v20 = objc_opt_new();
    systemAppsInBackup = v19->_systemAppsInBackup;
    v19->_systemAppsInBackup = (NSMutableSet *)v20;

    uint64_t v22 = objc_opt_new();
    domainSizeByDomainName = v19->_domainSizeByDomainName;
    v19->_domainSizeByDomainName = (NSMutableDictionary *)v22;
  }
  return v19;
}

- (void)_addCloudSize:(int64_t)a3 localSize:(int64_t)a4 forDomain:(id)a5
{
  domainSizeByDomainName = self->_domainSizeByDomainName;
  id v9 = a5;
  v10 = [(NSMutableDictionary *)domainSizeByDomainName objectForKeyedSubscript:v9];
  if (!v10) {
    v10 = objc_opt_new();
  }
  id v11 = v10;
  objc_msgSend(v10, "setLocalSize:", (char *)objc_msgSend(v10, "localSize") + a4);
  objc_msgSend(v11, "setCloudSize:", (char *)objc_msgSend(v11, "cloudSize") + a3);
  [(NSMutableDictionary *)self->_domainSizeByDomainName setObject:v11 forKeyedSubscript:v9];
}

- (id)_sizeOfDomain:(id)a3
{
  return [(NSMutableDictionary *)self->_domainSizeByDomainName objectForKeyedSubscript:a3];
}

- (BOOL)_addDomainSizesWithError:(id *)a3
{
  placeholderDB = self->_placeholderDB;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A7FDC;
  v5[3] = &unk_100411E60;
  v5[4] = self;
  return [(MBPlaceholderFileListDB *)placeholderDB enumerateDomainList:a3 block:v5];
}

- (BOOL)_addPlaceholdersSizesWithError:(id *)a3
{
  placeholderDB = self->_placeholderDB;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A833C;
  v5[3] = &unk_100411E88;
  v5[4] = self;
  return [(MBPlaceholderFileListDB *)placeholderDB enumerateAppPlaceholderDomains:a3 block:v5];
}

- (BOOL)_addZeroBytesForDisabledAndRestrictedDomainNames
{
  v3 = [(NSSet *)self->_disabledDomains setByAddingObjectsFromSet:self->_restrictedDomains];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v4)
  {
    id v5 = v4;
    v6 = ATClientController_ptr;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_domainSizeByDomainName, "objectForKeyedSubscript:", v9, v20, v21);

        if (!v10)
        {
          if ([v6[69] isContainerizedName:v9])
          {
            if ([v6[69] isAppName:v9])
            {
              id v11 = [v6[69] containerIDWithName:v9];
              appManager = self->_appManager;
              v13 = [(_DomainSizer *)self persona];
              id v22 = 0;
              v14 = [(MBAppManager *)appManager fetchAppWithIdentifier:v11 persona:v13 error:&v22];
              id v15 = v22;

              if (v14)
              {
                v16 = MBGetDefaultLog();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v28 = v9;
                  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "=quota-calculation= Adding 0-byte quota usage for disabled app domain: %@", buf, 0xCu);
                  uint64_t v20 = v9;
                  _MBLog();
                }

                [(_DomainSizer *)self _addCloudSize:0 localSize:0 forDomain:v9];
              }
              else if ((+[MBError isError:v15 withCode:4] & 1) == 0)
              {
                v18 = MBGetDefaultLog();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v28 = v9;
                  __int16 v29 = 2112;
                  id v30 = v15;
                  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "=quota-calculation= Failed to fetch fetch app for disabled domain %@: %@", buf, 0x16u);
                  uint64_t v20 = v9;
                  id v21 = v15;
                  _MBLog();
                }
              }
              v6 = ATClientController_ptr;
            }
          }
          else
          {
            id v17 = MBGetDefaultLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v28 = v9;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "=quota-calculation= Adding 0-byte quota usage for disabled static domain: %@", buf, 0xCu);
              uint64_t v20 = v9;
              _MBLog();
            }

            [(_DomainSizer *)self _addCloudSize:0 localSize:0 forDomain:v9];
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v5);
  }

  return 1;
}

- (BOOL)_addDependentDomainsWithError:(id *)a3
{
  placeholderDB = self->_placeholderDB;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000A8B7C;
  v30[3] = &unk_100411EB0;
  v30[4] = self;
  unsigned int v5 = [(MBPlaceholderFileListDB *)placeholderDB enumerateDomainDependencies:a3 block:v30];
  if (v5)
  {
    domainToSize = self->_domainToSize;
    if (!domainToSize || [(NSString *)domainToSize isEqualToString:@"BooksDomain"])
    {
      uint64_t v7 = [(_DomainSizer *)self _sizeOfDomain:@"AppDomain-com.apple.iBooks"];
      v8 = v7;
      if (v7)
      {
        -[_DomainSizer _addCloudSize:localSize:forDomain:](self, "_addCloudSize:localSize:forDomain:", [v7 cloudSize], objc_msgSend(v7, "localSize"), @"BooksDomain");
        uint64_t v9 = MBGetDefaultLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = [(_DomainSizer *)self _sizeOfDomain:@"BooksDomain"];
          *(_DWORD *)buf = 138412546;
          v33 = v8;
          __int16 v34 = 2112;
          v35 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "=quota-calculation= Adding iBooksDomain size %@ to BooksDomain (total: %@)", buf, 0x16u);

          [(_DomainSizer *)self _sizeOfDomain:@"BooksDomain"];
          v24 = long long v23 = v8;
          _MBLog();
        }
      }
    }
    id v11 = self->_domainToSize;
    if (!v11 || [(NSString *)v11 isEqualToString:@"HealthDomain"])
    {
      char v25 = v5;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v12 = MBGetHealthRelatedDomains();
      id v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v27;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v27 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if ((objc_msgSend(v17, "isEqualToString:", @"HealthDomain", v23, v24) & 1) == 0)
            {
              v18 = [(_DomainSizer *)self _sizeOfDomain:v17];
              v19 = v18;
              if (v18)
              {
                -[_DomainSizer _addCloudSize:localSize:forDomain:](self, "_addCloudSize:localSize:forDomain:", [v18 cloudSize], objc_msgSend(v18, "localSize"), @"HealthDomain");
                uint64_t v20 = MBGetDefaultLog();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  id v21 = [(_DomainSizer *)self _sizeOfDomain:@"HealthDomain"];
                  *(_DWORD *)buf = 138412546;
                  v33 = v19;
                  __int16 v34 = 2112;
                  v35 = v21;
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "=quota-calculation= Adding health-related domain size %@ to HealthDomain (total: %@)", buf, 0x16u);

                  [(_DomainSizer *)self _sizeOfDomain:@"HealthDomain"];
                  v24 = long long v23 = v19;
                  _MBLog();
                }
              }
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v14);
      }

      LOBYTE(v5) = v25;
    }
  }
  return v5;
}

- (id)_convertDomainSizesToDomainInfos
{
  v3 = objc_opt_new();
  domainSizeByDomainName = self->_domainSizeByDomainName;
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_1000A8DC4;
  v12 = &unk_100411ED8;
  id v13 = self;
  id v5 = v3;
  id v14 = v5;
  [(NSMutableDictionary *)domainSizeByDomainName enumerateKeysAndObjectsUsingBlock:&v9];
  objc_msgSend(v5, "sortUsingComparator:", &stru_100411F18, v9, v10, v11, v12, v13);
  v6 = v14;
  id v7 = v5;

  return v7;
}

- (id)_sizeWithError:(id *)a3
{
  if (-[_DomainSizer _addDomainSizesWithError:](self, "_addDomainSizesWithError:")
    && [(_DomainSizer *)self _addPlaceholdersSizesWithError:a3]
    && [(_DomainSizer *)self _addZeroBytesForDisabledAndRestrictedDomainNames]&& [(_DomainSizer *)self _addDependentDomainsWithError:a3])
  {
    id v5 = [(_DomainSizer *)self _convertDomainSizesToDomainInfos];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)sizeDomainsWithManager:(id)a3 operationTracker:(id)a4 account:(id)a5 device:(id)a6 error:(id *)a7
{
  return [a1 sizeDomain:0 manager:a3 operationTracker:a4 account:a5 device:a6 error:a7];
}

+ (id)sizeDomain:(id)a3 manager:(id)a4 operationTracker:(id)a5 account:(id)a6 device:(id)a7 error:(id *)a8
{
  id v34 = a3;
  id v37 = a4;
  id v36 = a5;
  id v41 = a6;
  id v38 = a7;
  v12 = [v38 snapshots];
  id v42 = 0;
  v40 = MBGetAllDomainQuotasByDomainHMAC(v12, &v42);
  id v35 = v42;

  if (v40
    || (+[MBError isError:v35 withCode:4] & 1) != 0)
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [v40 count];
      *(_DWORD *)buf = 134217984;
      id v44 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "=quota-calculation= Fetched %llu domain quotas by domainHMAC", buf, 0xCu);
      [v40 count];
      _MBLog();
    }

    uint64_t v15 = [v41 persona];
    v16 = [v15 snapshotDatabaseDirectory];

    id v17 = [v38 snapshots];
    v18 = [v17 lastObject];
    v19 = [v18 commitID];

    id v20 = [v38 synchronizeFileListsWithOperationTracker:v36 snapshotDirectory:v16 commitID:v19 error:a8 fetchedFileListBlock:&stru_100411F58];
    id v21 = +[MBPlaceholderFileListDB openOrCreatePlaceholderFileListIn:v16 commitID:v19 error:a8];
    if (!v21) {
      goto LABEL_10;
    }
    id v22 = [MBMobileInstallation alloc];
    long long v23 = [(MBMobileInstallation *)v22 initWithSafeHarborDir:kMBSafeHarborDir];
    long long v24 = [[MBAppManager alloc] initWithMobileInstallation:v23];
    char v25 = [v37 allRestrictedDomainNames:v24 account:v41];
    long long v26 = [v41 persona];
    long long v27 = [(MBAppManager *)v24 allDisabledDomainNamesForPersona:v26];

    long long v28 = [v37 openCacheWithAccount:v41 accessType:2 error:a8];
    if (v28)
    {
      long long v29 = [_DomainSizer alloc];
      id v30 = [v41 persona];
      id v31 = [(_DomainSizer *)v29 initWithPlaceholderFileList:v21 persona:v30 cache:v28 appManager:v24 domainQuotasByDomainHMAC:v40 restrictedDomains:v25 disabledDomains:v27 domainToSize:v34];

      objc_super v32 = [(_DomainSizer *)v31 _sizeWithError:a8];
    }
    else
    {
      objc_super v32 = 0;
    }

    if (([v21 close:a8] & 1) == 0) {
LABEL_10:
    }
      objc_super v32 = 0;
  }
  else
  {
    v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v35;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "=quota-calculation= Failed to get domain quotas by domain hmac: %@", buf, 0xCu);
      _MBLog();
    }
    objc_super v32 = 0;
  }

  return v32;
}

- (MBPlaceholderFileListDB)placeholderDB
{
  return self->_placeholderDB;
}

- (MBPersona)persona
{
  return self->_persona;
}

- (MBCKCache)cache
{
  return self->_cache;
}

- (NSMutableDictionary)domainSizeByDomainName
{
  return self->_domainSizeByDomainName;
}

- (NSString)domainToSize
{
  return self->_domainToSize;
}

- (MBAppManager)appManager
{
  return self->_appManager;
}

- (NSSet)restrictedDomains
{
  return self->_restrictedDomains;
}

- (NSSet)disabledDomains
{
  return self->_disabledDomains;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledDomains, 0);
  objc_storeStrong((id *)&self->_restrictedDomains, 0);
  objc_storeStrong((id *)&self->_appManager, 0);
  objc_storeStrong((id *)&self->_domainToSize, 0);
  objc_storeStrong((id *)&self->_domainSizeByDomainName, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_persona, 0);
  objc_storeStrong((id *)&self->_placeholderDB, 0);
  objc_storeStrong((id *)&self->_systemAppsInBackup, 0);
  objc_storeStrong((id *)&self->_domainQuotasByDomainHMAC, 0);
}

@end