@interface _ManifestSizer
+ (id)_getDomainInfoForDomainName:(id)a3 cache:(id)a4 restrictedDomains:(id)a5 disabledDomains:(id)a6 dependentDomains:(id)a7 appManager:(id)a8;
+ (id)sizeDomainWithName:(id)a3 manager:(id)a4 account:(id)a5 error:(id *)a6;
+ (id)sizeDomainsWithManager:(id)a3 account:(id)a4 error:(id *)a5;
@end

@implementation _ManifestSizer

+ (id)_getDomainInfoForDomainName:(id)a3 cache:(id)a4 restrictedDomains:(id)a5 disabledDomains:(id)a6 dependentDomains:(id)a7 appManager:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v60 = a8;
  if (!v16) {
    __assert_rtn("+[_ManifestSizer _getDomainInfoForDomainName:cache:restrictedDomains:disabledDomains:dependentDomains:appManager:]", "MBCalculateQuota.m", 381, "disabledDomains");
  }
  id v74 = 0;
  id v18 = [v14 sizeOfDomain:v13 error:&v74];
  id v19 = v74;
  if (v19)
  {
    id v20 = v19;
    v21 = MBGetDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v77 = v13;
      __int16 v78 = 2112;
      id v79 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "=quota-calculation= Error fetching size of domain %@: %@", buf, 0x16u);
LABEL_8:
      _MBLog();
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  id v73 = 0;
  id v22 = [v14 sizeOfScannedDomain:v13 error:&v73];
  id v23 = v73;
  if (v23)
  {
    id v20 = v23;
    v21 = MBGetDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v77 = v13;
      __int16 v78 = 2112;
      id v79 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "=quota-calculation= Error fetching local size of domain: %@: %@", buf, 0x16u);
      goto LABEL_8;
    }
LABEL_9:
    v24 = 0;
    goto LABEL_10;
  }
  v62 = v14;
  id v58 = v16;
  id v59 = v15;
  v21 = +[MBDomainInfo domainInfoWithName:systemApp:remoteSize:localSize:enabled:restricted:](MBDomainInfo, "domainInfoWithName:systemApp:remoteSize:localSize:enabled:restricted:", v13, 0, v18, v22, [v16 containsObject:v13] ^ 1, objc_msgSend(v15, "containsObject:", v13));
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v57 = v17;
  id obj = v17;
  id v26 = [obj countByEnumeratingWithState:&v69 objects:v84 count:16];
  if (!v26) {
    goto LABEL_26;
  }
  id v27 = v26;
  uint64_t v28 = *(void *)v70;
  while (2)
  {
    for (i = 0; i != v27; i = (char *)i + 1)
    {
      if (*(void *)v70 != v28) {
        objc_enumerationMutation(obj);
      }
      v30 = *(void **)(*((void *)&v69 + 1) + 8 * i);
      if ((objc_msgSend(v13, "isEqualToString:", v30, v49, v51, v53, v55) & 1) == 0)
      {
        id v68 = 0;
        v31 = (char *)[v62 sizeOfDomain:v30 error:&v68];
        id v32 = v68;
        if (v32)
        {
          id v20 = v32;
          v35 = MBGetDefaultLog();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v77 = v30;
            __int16 v78 = 2112;
            id v79 = v20;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "=quota-calculation= Error fetching size of domain %@: %@", buf, 0x16u);
LABEL_54:
            _MBLog();
          }
        }
        else
        {
          id v67 = 0;
          v33 = (char *)[v62 sizeOfScannedDomain:v30 error:&v67];
          id v20 = v67;
          v34 = MBGetDefaultLog();
          v35 = v34;
          if (!v20)
          {
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413058;
              id v77 = v13;
              __int16 v78 = 2112;
              id v79 = v30;
              __int16 v80 = 2048;
              v81 = v31;
              __int16 v82 = 2048;
              v83 = v33;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "=quota-calculation= %@ adding dependentDomain %@ (%llu %llu)", buf, 0x2Au);
              v53 = v31;
              v55 = v33;
              id v49 = v13;
              v51 = v30;
              _MBLog();
            }

            [v21 setRemoteSize:&v31[(void)[v21 remoteSize]]];
            [v21 setLocalSize:&v33[(void)[v21 localSize]]];
            continue;
          }
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v77 = v30;
            __int16 v78 = 2112;
            id v79 = v20;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "=quota-calculation= Error fetching local size of domain: %@: %@", buf, 0x16u);
            goto LABEL_54;
          }
        }
        id v14 = v62;
        id v16 = v58;
        id v15 = v59;
        id v17 = v57;

        goto LABEL_9;
      }
    }
    id v27 = [obj countByEnumeratingWithState:&v69 objects:v84 count:16];
    if (v27) {
      continue;
    }
    break;
  }
LABEL_26:

  id v14 = v62;
  if ([v13 isEqualToString:@"AppDomain-com.apple.iBooks"]) {
    -[NSObject setRemoteSize:](v21, "setRemoteSize:", (char *)[v62 sizeOfDomain:@"BooksDomain" error:0]+ (void)-[NSObject remoteSize](v21, "remoteSize"));
  }
  if (objc_msgSend(v13, "isEqualToString:", @"HealthDomain", v49, v51, v53, v55))
  {
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v36 = MBGetHealthRelatedDomains();
    id v37 = [v36 countByEnumeratingWithState:&v63 objects:v75 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v64;
      do
      {
        for (j = 0; j != v38; j = (char *)j + 1)
        {
          if (*(void *)v64 != v39) {
            objc_enumerationMutation(v36);
          }
          v41 = *(void **)(*((void *)&v63 + 1) + 8 * (void)j);
          if (([v41 isEqualToString:v13] & 1) == 0)
          {
            v42 = (char *)[v14 sizeOfDomain:v41 error:0];
            if (v42)
            {
              v43 = MBGetDefaultLog();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
              {
                id v44 = [v21 remoteSize];
                id v45 = [v21 remoteSize];
                *(_DWORD *)buf = 138413058;
                id v77 = v41;
                __int16 v78 = 2048;
                id v79 = v44;
                __int16 v80 = 2048;
                v81 = v42;
                __int16 v82 = 2048;
                v83 = &v42[(void)v45];
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "=quota-calculation= Adding health-related domain %@ to HealthDomain size %llu + %llu = %llu", buf, 0x2Au);
                id v46 = [v21 remoteSize];
                v54 = v42;
                v56 = &v42[(void)[v21 remoteSize]];
                v50 = v41;
                id v52 = v46;
                id v14 = v62;
                _MBLog();
              }
            }
            [v21 setRemoteSize:&v42[(void)[v21 remoteSize]]];
          }
        }
        id v38 = [v36 countByEnumeratingWithState:&v63 objects:v75 count:16];
      }
      while (v38);
    }
  }
  id v17 = v57;
  id v16 = v58;
  if (+[MBDomain isAppName:v13]
    && (+[MBDomain isAppPlaceholderName:v13] & 1) == 0)
  {
    v47 = +[MBDomain containerIDWithName:v13];
    v48 = [v60 appWithIdentifier:v47];

    if (v48 && [v48 isSystemApp]) {
      [v21 setSystemApp:1];
    }
  }
  v21 = v21;
  id v20 = 0;
  v24 = v21;
  id v15 = v59;
LABEL_10:

  return v24;
}

+ (id)sizeDomainsWithManager:(id)a3 account:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v87 = [v7 openCacheWithAccount:v8 accessType:1 error:a5];
  if (v87)
  {
    id v9 = objc_alloc((Class)MBDomainManager);
    uint64_t v10 = [v8 persona];
    id v11 = [v9 initWithPersona:v10];

    v12 = [MBMobileInstallation alloc];
    id v13 = [(MBMobileInstallation *)v12 initWithSafeHarborDir:kMBSafeHarborDir];
    id v14 = [[MBAppManager alloc] initWithMobileInstallation:v13];
    id v15 = [v8 persona];
    id v108 = 0;
    LOBYTE(v10) = [(MBAppManager *)v14 loadAppsWithPersona:v15 safeHarbors:0 error:&v108];
    id v79 = v108;

    if (v10)
    {
      v85 = [v7 allRestrictedDomainNames:v14 account:v8];
      id v16 = [v8 persona];
      uint64_t v17 = [(MBAppManager *)v14 allDisabledDomainNamesForPersona:v16];

      v89 = (void *)v17;
      if (!v17) {
        __assert_rtn("+[_ManifestSizer sizeDomainsWithManager:account:error:]", "MBCalculateQuota.m", 470, "disabledDomains");
      }
      v106[0] = _NSConcreteStackBlock;
      v106[1] = 3221225472;
      v106[2] = sub_1000AA834;
      v106[3] = &unk_1004114C8;
      id v18 = (id)objc_opt_new();
      id v107 = v18;
      uint64_t v19 = [v87 enumerateDomainNames:v106];
      id v20 = MBGetDefaultLog();
      v21 = v20;
      __int16 v78 = (void *)v19;
      if (v19)
      {
        id v22 = v79;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v114 = v19;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "=quota-calculation= Failed to enumerate domain names: %{public}@", buf, 0xCu);
          _MBLog();
        }
        id v23 = 0;
      }
      else
      {
        id v76 = v7;
        id v77 = v11;
        v81 = v8;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = [v18 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v114 = (uint64_t)v25;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "=quota-calculation= Fetched %lu domain names from the cache", buf, 0xCu);
          id v74 = [v18 count];
          _MBLog();
        }
        v75 = v13;

        v21 = objc_opt_new();
        long long v102 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        id obj = v18;
        v88 = v21;
        id v83 = [obj countByEnumeratingWithState:&v102 objects:v112 count:16];
        if (v83)
        {
          uint64_t v82 = *(void *)v103;
          do
          {
            for (i = 0; i != v83; i = (char *)i + 1)
            {
              if (*(void *)v103 != v82) {
                objc_enumerationMutation(obj);
              }
              uint64_t v27 = *(void *)(*((void *)&v102 + 1) + 8 * i);
              v29 = +[MBDomain containerIDWithName:v27];
              v30 = [(MBAppManager *)v14 appWithIdentifier:v29];

              if (v30)
              {
                v84 = v28;
                v31 = v14;
                id v32 = objc_alloc_init((Class)NSMutableSet);
                long long v98 = 0u;
                long long v99 = 0u;
                long long v100 = 0u;
                long long v101 = 0u;
                v33 = [v81 persona];
                v34 = +[MBCKSizingEngine domainsForApp:v30 persona:v33];

                id v35 = [v34 countByEnumeratingWithState:&v98 objects:v111 count:16];
                if (v35)
                {
                  id v36 = v35;
                  uint64_t v37 = *(void *)v99;
                  do
                  {
                    for (j = 0; j != v36; j = (char *)j + 1)
                    {
                      if (*(void *)v99 != v37) {
                        objc_enumerationMutation(v34);
                      }
                      uint64_t v39 = objc_msgSend(*(id *)(*((void *)&v98 + 1) + 8 * (void)j), "name", v74);
                      [v32 addObject:v39];
                    }
                    id v36 = [v34 countByEnumeratingWithState:&v98 objects:v111 count:16];
                  }
                  while (v36);
                }

                id v14 = v31;
                uint64_t v28 = v84;
              }
              else
              {
                id v32 = 0;
              }
              v40 = objc_msgSend(a1, "_getDomainInfoForDomainName:cache:restrictedDomains:disabledDomains:dependentDomains:appManager:", v27, v87, v85, v89, v32, v14, v74);
              v41 = v40;
              if (v40)
              {
                if ([v40 size]
                  || (+[MBDomain containerIDWithName:v27],
                      v42 = objc_claimAutoreleasedReturnValue(),
                      [(MBAppManager *)v14 appWithIdentifier:v42],
                      v43 = objc_claimAutoreleasedReturnValue(),
                      v43,
                      v42,
                      v43))
                {
                  objc_msgSend(v41, "setEnabled:", objc_msgSend(v89, "containsObject:", v27) ^ 1);
                  [v88 setObject:v41 forKeyedSubscript:v27];
                }
              }

              v21 = v88;
            }
            id v83 = [obj countByEnumeratingWithState:&v102 objects:v112 count:16];
          }
          while (v83);
        }

        id v44 = [v77 systemDomainsByName];
        id v45 = [v44 allValues];

        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        id v46 = v45;
        id v47 = [v46 countByEnumeratingWithState:&v94 objects:v110 count:16];
        if (v47)
        {
          id v48 = v47;
          uint64_t v49 = *(void *)v95;
          do
          {
            for (k = 0; k != v48; k = (char *)k + 1)
            {
              if (*(void *)v95 != v49) {
                objc_enumerationMutation(v46);
              }
              v51 = *(void **)(*((void *)&v94 + 1) + 8 * (void)k);
              id v52 = objc_msgSend(v51, "name", v74);
              char v53 = sub_1000A8ED0(v52);

              if ((v53 & 1) == 0)
              {
                v54 = [v51 name];
                v55 = [v21 objectForKeyedSubscript:v54];

                if (!v55)
                {
                  v56 = [v51 name];
                  v55 = [a1 _getDomainInfoForDomainName:v56 cache:v87 restrictedDomains:v85 disabledDomains:v89 dependentDomains:0 appManager:v14];

                  id v57 = [v51 name];
                  objc_msgSend(v55, "setEnabled:", objc_msgSend(v89, "containsObject:", v57) ^ 1);

                  id v58 = [v51 name];
                  [v21 setObject:v55 forKeyedSubscript:v58];
                }
              }
            }
            id v48 = [v46 countByEnumeratingWithState:&v94 objects:v110 count:16];
          }
          while (v48);
        }

        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        id v59 = [(MBAppManager *)v14 allContainers];
        id v60 = [v59 countByEnumeratingWithState:&v90 objects:v109 count:16];
        if (v60)
        {
          id v61 = v60;
          uint64_t v62 = *(void *)v91;
          do
          {
            for (m = 0; m != v61; m = (char *)m + 1)
            {
              if (*(void *)v91 != v62) {
                objc_enumerationMutation(v59);
              }
              long long v64 = objc_msgSend(*(id *)(*((void *)&v90 + 1) + 8 * (void)m), "domain", v74);
              long long v65 = [v64 name];
              char v66 = sub_1000A8ED0(v65);

              if ((v66 & 1) == 0)
              {
                id v67 = [v64 name];
                id v68 = [v21 objectForKeyedSubscript:v67];

                if (!v68)
                {
                  long long v69 = [v64 name];
                  id v68 = [a1 _getDomainInfoForDomainName:v69 cache:v87 restrictedDomains:v85 disabledDomains:v89 dependentDomains:0 appManager:v14];

                  long long v70 = [v64 name];
                  v21 = v88;
                  objc_msgSend(v68, "setEnabled:", objc_msgSend(v89, "containsObject:", v70) ^ 1);

                  long long v71 = [v64 name];
                  [v88 setObject:v68 forKeyedSubscript:v71];
                }
              }
            }
            id v61 = [v59 countByEnumeratingWithState:&v90 objects:v109 count:16];
          }
          while (v61);
        }

        long long v72 = [v21 allValues];
        id v23 = [v72 mutableCopy];

        [v23 sortUsingComparator:&stru_100411F78];
        id v18 = 0;
        id v7 = v76;
        id v11 = v77;
        id v8 = v81;
        id v13 = v75;
        id v22 = v79;
      }
    }
    else
    {
      v24 = MBGetDefaultLog();
      id v22 = v79;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v114 = (uint64_t)v79;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "=quota-calculation= Failed to load apps: %@", buf, 0xCu);
        _MBLog();
      }

      id v23 = 0;
      if (a5) {
        *a5 = v79;
      }
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

+ (id)sizeDomainWithName:(id)a3 manager:(id)a4 account:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v11 openCacheWithAccount:v12 accessType:1 error:a6];
  if (v13)
  {
    id v26 = v10;
    id v14 = [MBMobileInstallation alloc];
    id v15 = [(MBMobileInstallation *)v14 initWithSafeHarborDir:kMBSafeHarborDir];
    id v16 = [[MBAppManager alloc] initWithMobileInstallation:v15];
    uint64_t v17 = [v12 persona];
    id v27 = 0;
    unsigned __int8 v18 = [(MBAppManager *)v16 loadAppsWithPersona:v17 safeHarbors:0 error:&v27];
    id v19 = v27;

    if (v18)
    {
      id v20 = [v11 allRestrictedDomainNames:v16 account:v12];
      v21 = [v12 persona];
      id v22 = [(MBAppManager *)v16 allDisabledDomainNamesForPersona:v21];

      id v23 = [a1 _getDomainInfoForDomainName:v26 cache:v13 restrictedDomains:v20 disabledDomains:v22 dependentDomains:0 appManager:v16];

      id v10 = v26;
    }
    else
    {
      v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v19;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "=quota-calculation= Failed to load apps: %@", buf, 0xCu);
        _MBLog();
      }

      id v10 = v26;
      id v23 = 0;
      if (a6) {
        *a6 = v19;
      }
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

@end