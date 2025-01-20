@interface MBATCBundlesPlugin
- (BOOL)shouldBackgroundRestoreContentWithPolicy:(id)a3 fileInfo:(id)a4;
- (BOOL)shouldRestoreContentWithPolicy:(id)a3 fileInfo:(id)a4;
- (id)_standardizePath:(id)a3 fromDomain:(id)a4;
- (id)endingBackupWithEngine:(id)a3;
- (id)startingBackupWithEngine:(id)a3;
- (id)startingRestoreWithPolicy:(id)a3 engine:(id)a4;
- (void)_populateAccountsAndAssetsForEngine:(id)a3 accountsTracker:(id)a4;
- (void)_populateAccountsForEngine:(id)a3 dataClasses:(id)a4 accountsTracker:(id)a5;
- (void)_populateBuddyStashForEngine:(id)a3;
- (void)_populatePathsForEngine:(id)a3 domain:(id)a4 dataclass:(id)a5;
- (void)_populatePathsForEngine:(id)a3 domain:(id)a4 dataclass:(id)a5 allBackupPaths:(id)a6;
- (void)_updatePathsForCameraRollDomainWithEngine:(id)a3;
@end

@implementation MBATCBundlesPlugin

- (id)_standardizePath:(id)a3 fromDomain:(id)a4
{
  id v7 = [a3 stringByStandardizingPath];
  if (![v7 isAbsolutePath]) {
    return v7;
  }
  if ((objc_msgSend(v7, "hasPrefix:", objc_msgSend(a4, "rootPath")) & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MBATCBundlesPlugin.m", 46, @"Absolute path doesn't have domain root %@ as prefix: %@", [a4 rootPath], v7);
  }
  v8 = (char *)objc_msgSend(objc_msgSend(a4, "rootPath"), "length") + 1;
  return [v7 substringFromIndex:v8];
}

- (void)_populatePathsForEngine:(id)a3 domain:(id)a4 dataclass:(id)a5 allBackupPaths:(id)a6
{
  id v10 = [+[ATClientController sharedInstance] clientForDataclass:a5];
  id v11 = objc_msgSend(objc_msgSend(a3, "domainManager"), "domainForName:", a4);
  id v12 = objc_alloc_init((Class)NSMutableSet);
  id v13 = objc_alloc_init((Class)NSMutableSet);
  if (objc_opt_respondsToSelector())
  {
    if ([a3 isDeviceTransferEngine])
    {
      int v15 = 3;
    }
    else if ([a3 isDriveEngine])
    {
      int v15 = 2;
    }
    else
    {
      if (([a3 isServiceEngine] & 1) == 0) {
        __assert_rtn("-[MBATCBundlesPlugin _populatePathsForEngine:domain:dataclass:allBackupPaths:]", "MBATCBundlesPlugin.m", 71, "restoreType != ATRestoreTypeNone");
      }
      int v15 = 1;
    }
    v56[1] = _NSConcreteStackBlock;
    v56[2] = (id)3221225472;
    v56[3] = sub_10023DE80;
    v56[4] = &unk_100416F10;
    int v57 = v15;
    v56[5] = v10;
    v56[6] = self;
    v56[7] = v11;
    v56[8] = a6;
    v56[9] = v12;
    v56[10] = v13;
    objc_msgSend(v10, "enumeratePathsForBackupType:usingBlock:");
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_36;
    }
    v46 = v13;
    id v55 = 0;
    v56[0] = 0;
    [v10 pathsToBackup:v56 pathsNotToBackup:&v55];
    v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v56[0] count];
      id v18 = [v55 count];
      *(_DWORD *)buf = 138412802;
      id v61 = v10;
      __int16 v62 = 2048;
      id v63 = v17;
      __int16 v64 = 2048;
      id v65 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "=atc-bundles= %@: pathsToBackup.count:%lu, pathsNotToBackup.count:%lu", buf, 0x20u);
      id v39 = [v56[0] count];
      id v42 = [v55 count];
      id v36 = v10;
      _MBLog();
    }
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v44 = v12;
    id obj = v56[0];
    id v19 = objc_msgSend(v56[0], "countByEnumeratingWithState:objects:count:", &v51, v59, 16, v36, v39, v42);
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v52;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v52 != v21) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          v25 = MBGetDefaultLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v61 = v10;
            __int16 v62 = 2112;
            id v63 = v23;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "=atc-bundles= %@: pathToBackup:%@", buf, 0x16u);
            id v37 = v10;
            v40 = v23;
            _MBLog();
          }
          id v26 = -[MBATCBundlesPlugin _standardizePath:fromDomain:](self, "_standardizePath:fromDomain:", v23, v11, v37, v40);
          if ([a6 containsObject:v26])
          {
            v27 = MBGetDefaultLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v61 = v10;
              __int16 v62 = 2112;
              id v63 = v23;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "=atc-bundles= %@: Skipping duplicate path: %@", buf, 0x16u);
              id v37 = v10;
              v40 = v23;
              _MBLog();
            }
          }
          else
          {
            [a6 addObject:v26];
            [v44 addObject:v26];
          }
        }
        id v20 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
      }
      while (v20);
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v28 = v55;
    id v29 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v47, v58, 16, v37, v40);
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v48;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v48 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = *(void **)(*((void *)&v47 + 1) + 8 * (void)j);
          v35 = MBGetDefaultLog();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v61 = v10;
            __int16 v62 = 2112;
            id v63 = v33;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "=atc-bundles= %@: pathNotToBackup:%@", buf, 0x16u);
            id v38 = v10;
            v41 = v33;
            _MBLog();
          }
          objc_msgSend(v46, "addObject:", -[MBATCBundlesPlugin _standardizePath:fromDomain:](self, "_standardizePath:fromDomain:", v33, v11, v38, v41));
        }
        id v30 = [v28 countByEnumeratingWithState:&v47 objects:v58 count:16];
      }
      while (v30);
    }
    id v13 = v46;
    v14 = v43;
    id v12 = v44;
  }
LABEL_36:
  if ([v12 count])
  {
    if ([v11 relativePathsToBackupAndRestore]) {
      objc_msgSend(v12, "unionSet:", objc_msgSend(v11, "relativePathsToBackupAndRestore"));
    }
    [v11 setRelativePathsToBackupAndRestore:v12];
  }

  if ([v13 count])
  {
    if ([v11 relativePathsNotToBackup]) {
      objc_msgSend(v13, "unionSet:", objc_msgSend(v11, "relativePathsNotToBackup"));
    }
    [v11 setRelativePathsNotToBackup:v13];
  }
}

- (void)_populatePathsForEngine:(id)a3 domain:(id)a4 dataclass:(id)a5
{
}

- (void)_populateAccountsForEngine:(id)a3 dataClasses:(id)a4 accountsTracker:(id)a5
{
  if (!a5) {
    __assert_rtn("-[MBATCBundlesPlugin _populateAccountsForEngine:dataClasses:accountsTracker:]", "MBATCBundlesPlugin.m", 149, "accountsTracker");
  }
  if ([a3 isDeviceTransferEngine]) {
    id v7 = [a3 preflightProperties];
  }
  else {
    id v7 = [a3 properties];
  }
  long long v52 = v7;
  long long v47 = +[ATClientController sharedInstance];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v48 = [a4 countByEnumeratingWithState:&v62 objects:v74 count:16];
  if (v48)
  {
    uint64_t v46 = *(void *)v63;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v63 != v46) {
          objc_enumerationMutation(a4);
        }
        v9 = *(void **)(*((void *)&v62 + 1) + 8 * v8);
        long long v53 = v9;
        id v11 = [(ATClientController *)v47 clientForDataclass:v9];
        context = v10;
        uint64_t v51 = v8;
        long long v49 = v11;
        if (objc_opt_respondsToSelector())
        {
          id v12 = [v11 accountsForAssets];
          id v13 = MBGetDefaultLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            id v69 = v11;
            __int16 v70 = 2112;
            id v71 = v53;
            __int16 v72 = 2112;
            id v73 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "=atc-bundles= %@: dataClass:\"%@\", -accountsForAssets returned: %@", buf, 0x20u);
            id v43 = v53;
            id v44 = v12;
            id v38 = v11;
            _MBLog();
          }
        }
        else
        {
          if (v11)
          {
            v14 = MBGetDefaultLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v69 = v11;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "=atc-bundles= %@ doesn't implement -accountsForAssets", buf, 0xCu);
              id v38 = v11;
              _MBLog();
            }
          }
          id v12 = 0;
        }
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v58, v67, 16, v38, v43, v44);
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v59;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v59 != v17) {
                objc_enumerationMutation(v12);
              }
              id v19 = *(void **)(*((void *)&v58 + 1) + 8 * i);
              id v20 = objc_msgSend(v19, "appleID", v38);
              if (!v20)
              {
                uint64_t v21 = MBGetDefaultLog();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v69 = v19;
                  _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "=atc-bundles= Found nil appleID for %@", buf, 0xCu);
                  id v39 = v19;
                  _MBLog();
                }
              }
              id v22 = objc_msgSend(v19, "DSID", v39);
              if (!v22)
              {
                v23 = MBGetDefaultLog();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v69 = v19;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "=atc-bundles= Found nil DSID for %@", buf, 0xCu);
                  v40 = v19;
                  _MBLog();
                }
              }
              id v24 = objc_msgSend(v19, "altDSID", v40);
              if (!v24)
              {
                v25 = MBGetDefaultLog();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v69 = v19;
                  _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "=atc-bundles= Found nil altDSID for %@", buf, 0xCu);
                  v41 = v19;
                  _MBLog();
                }
              }
              if (objc_msgSend(a5, "addAccountWithDSID:", v22, v41))
              {
                objc_msgSend(v52, "addAppleID:DSID:altDSID:dataClass:", v20, objc_msgSend(v22, "stringValue"), v24, v53);
              }
              else
              {
                id v26 = MBGetDefaultLog();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  id v69 = v20;
                  __int16 v70 = 2112;
                  id v71 = v22;
                  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "=atc-bundles= Skipping account: %@/%@", buf, 0x16u);
                  id v38 = v20;
                  id v43 = v22;
                  _MBLog();
                }
              }
            }
            id v16 = [v12 countByEnumeratingWithState:&v58 objects:v67 count:16];
          }
          while (v16);
        }
        if (objc_opt_respondsToSelector())
        {
          id v27 = [v49 appleIDsForAssets];
          id v28 = MBGetDefaultLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            id v69 = v49;
            __int16 v70 = 2112;
            id v71 = v53;
            __int16 v72 = 2112;
            id v73 = v27;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "=atc-bundles= %@: dataClass:\"%@\", -appleIDsForAssets returned: %@", buf, 0x20u);
            id v43 = v53;
            id v44 = v27;
            id v38 = v49;
            _MBLog();
          }
          id v29 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v27, "count"));
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v30 = [v27 countByEnumeratingWithState:&v54 objects:v66 count:16];
          if (v30)
          {
            id v31 = v30;
            uint64_t v32 = *(void *)v55;
            do
            {
              for (j = 0; j != v31; j = (char *)j + 1)
              {
                if (*(void *)v55 != v32) {
                  objc_enumerationMutation(v27);
                }
                uint64_t v34 = *(void *)(*((void *)&v54 + 1) + 8 * (void)j);
                if ((objc_msgSend(a5, "isIgnoredAppleID:", v34, v38) & 1) == 0) {
                  [v29 addObject:v34];
                }
              }
              id v31 = [v27 countByEnumeratingWithState:&v54 objects:v66 count:16];
            }
            while (v31);
          }
          if (objc_msgSend(v29, "count", v38)) {
            [v52 addAppleIDsFromSet:v29 dataClass:v53];
          }
        }
        uint64_t v8 = v51 + 1;
      }
      while ((id)(v51 + 1) != v48);
      id v48 = [a4 countByEnumeratingWithState:&v62 objects:v74 count:16];
    }
    while (v48);
  }
  id v35 = objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore", v38), "activeAccount");
  if (v35)
  {
    id v36 = [v35 accountName];
    if (([a5 isIgnoredAppleID:v36] & 1) == 0)
    {
      id v37 = MBGetDefaultLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v69 = v36;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "=atc-bundles= Found active store account: %@", buf, 0xCu);
        id v42 = v36;
        _MBLog();
      }
      objc_msgSend(v52, "setActiveAppleID:", v36, v42);
    }
  }
}

- (void)_populateAccountsAndAssetsForEngine:(id)a3 accountsTracker:(id)a4
{
  if (!a4) {
    __assert_rtn("-[MBATCBundlesPlugin _populateAccountsAndAssetsForEngine:accountsTracker:]", "MBATCBundlesPlugin.m", 217, "accountsTracker");
  }
  unsigned int v6 = [a3 isDeviceTransferEngine];
  char v7 = v6;
  if (v6) {
    id v8 = [a3 preflightProperties];
  }
  else {
    id v8 = [a3 properties];
  }
  id v9 = v8;
  id v10 = +[ACAccountStore defaultStore];
  if (!v10) {
    __assert_rtn("-[MBATCBundlesPlugin _populateAccountsAndAssetsForEngine:accountsTracker:]", "MBATCBundlesPlugin.m", 228, "acAccountStore");
  }
  id v11 = v10;
  id v12 = +[SSAccountStore defaultStore];
  id v13 = objc_alloc_init((Class)NSMutableSet);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10023EA8C;
  v15[3] = &unk_100416F38;
  v15[4] = v13;
  v15[5] = a4;
  v15[6] = v12;
  v15[7] = v9;
  char v16 = v7;
  v15[8] = v11;
  objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "enumerateBundlesOfType:block:", 0, v15);
  v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "=atc-bundles= Found accounts: %@", buf, 0xCu);
    _MBLog();
  }
}

- (void)_populateBuddyStashForEngine:(id)a3
{
  id v3 = [a3 properties];
  v4 = (void *)BYDataStashCreate();
  if (v4)
  {
    v5 = v4;
    if ((unint64_t)[v4 length] > 0x8000)
    {
      unsigned int v6 = MBGetDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v9 = [v5 length];
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "=atc-bundles= buddyStash exceeds 32k (%ld)", buf, 0xCu);
        id v7 = [v5 length];
        _MBLog();
      }
    }
    objc_msgSend(v3, "setBuddyStashData:", v5, v7);
  }
}

- (id)startingBackupWithEngine:(id)a3
{
  id v3 = a3;
  if (![a3 backsUpPrimaryAccount]) {
    return 0;
  }
  v33 = self;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v5 = [+[ATClientController sharedInstance] allClients];
  id v6 = [v5 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v10 prepareForBackup];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v7);
  }
  if ([v3 backupPolicy] == (id)1)
  {
    id v11 = v33;
    if (![v3 isCloudKitEngine]) {
      __assert_rtn("-[MBATCBundlesPlugin startingBackupWithEngine:]", "MBATCBundlesPlugin.m", 311, "!isMegaBackupPolicy || engine.isCloudKitEngine");
    }
    [v3 isDeviceTransferEngine];
    goto LABEL_15;
  }
  id v11 = v33;
  if ([v3 isDeviceTransferEngine])
  {
LABEL_15:
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v12 = [&off_10043B5B0 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v35;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(&off_10043B5B0);
          }
          uint64_t v16 = *(void *)(*((void *)&v34 + 1) + 8 * (void)j);
          id v17 = objc_msgSend(objc_msgSend(v3, "domainManager"), "domainForName:", v16);
          if (!v17) {
            __assert_rtn("-[MBATCBundlesPlugin startingBackupWithEngine:]", "MBATCBundlesPlugin.m", 317, "domain");
          }
          id v18 = v17;
          CFStringRef v19 = [(MBATCBundlesPlugin *)v11 _standardizePath:@"Media/iTunes_Control/iTunes" fromDomain:v17];
          if (objc_msgSend(objc_msgSend(v18, "relativePathsNotToBackupToDrive"), "containsObject:", v19))
          {
            id v20 = v3;
            id v21 = objc_msgSend(objc_msgSend(v18, "relativePathsNotToBackupToDrive"), "mutableCopy");
            id v22 = MBGetDefaultLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v43 = v16;
              __int16 v44 = 2114;
              CFStringRef v45 = v19;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "=atc-bundles= %{public}@: Removing \"%{public}@\" from relativePathsNotToBackupToDrive", buf, 0x16u);
              uint64_t v31 = v16;
              CFStringRef v32 = v19;
              _MBLog();
            }
            objc_msgSend(v21, "removeObject:", v19, v31, v32);
            [v18 setRelativePathsNotToBackupToDrive:v21];

            id v3 = v20;
            id v11 = v33;
          }
          if (objc_msgSend(objc_msgSend(v18, "relativePathsNotToBackupToDrive"), "containsObject:", &stru_100418BA8))
          {
            id v23 = objc_msgSend(objc_msgSend(v18, "relativePathsNotToBackupToDrive"), "mutableCopy");
            id v24 = MBGetDefaultLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v43 = v16;
              __int16 v44 = 2114;
              CFStringRef v45 = &stru_100418BA8;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "=atc-bundles= %{public}@: Removing \"%{public}@\" from relativePathsNotToBackupToDrive", buf, 0x16u);
              uint64_t v31 = v16;
              CFStringRef v32 = &stru_100418BA8;
              _MBLog();
            }
            objc_msgSend(v23, "removeObject:", &stru_100418BA8, v31, v32);
            [v18 setRelativePathsNotToBackupToDrive:v23];
          }
        }
        id v13 = [&off_10043B5B0 countByEnumeratingWithState:&v34 objects:v46 count:16];
      }
      while (v13);
    }
  }
  if ([v3 isDeviceTransferEngine])
  {
    [(MBATCBundlesPlugin *)v11 _populatePathsForEngine:v3 domain:@"BooksDomain" dataclass:@"Book" allBackupPaths:0];
    v25 = v11;
    id v26 = objc_alloc_init((Class)NSMutableSet);
    [(MBATCBundlesPlugin *)v25 _populatePathsForEngine:v3 domain:@"TonesDomain" dataclass:@"Ringtone" allBackupPaths:v26];
    [(MBATCBundlesPlugin *)v25 _populatePathsForEngine:v3 domain:@"MediaDomain" dataclass:@"Media" allBackupPaths:v26];

    [(MBATCBundlesPlugin *)v25 _updatePathsForCameraRollDomainWithEngine:v3];
    id v27 = objc_alloc_init(MBIgnoredAccountsTracker);
    [(MBATCBundlesPlugin *)v25 _populateAccountsForEngine:v3 dataClasses:&off_10043B5C8 accountsTracker:v27];
    [(MBATCBundlesPlugin *)v25 _populateAccountsAndAssetsForEngine:v3 accountsTracker:v27];
  }
  else if ([v3 isCloudKitEngine])
  {
    [(MBATCBundlesPlugin *)v11 _populatePathsForEngine:v3 domain:@"CameraRollDomain" dataclass:@"Photo"];
    [(MBATCBundlesPlugin *)v11 _populatePathsForEngine:v3 domain:@"BooksDomain" dataclass:@"Book"];
    [(MBATCBundlesPlugin *)v11 _populatePathsForEngine:v3 domain:@"TonesDomain" dataclass:@"Ringtone"];
    [(MBATCBundlesPlugin *)v11 _populatePathsForEngine:v3 domain:@"MediaDomain" dataclass:@"Media"];
    id v28 = v11;
    id v29 = objc_alloc_init(MBIgnoredAccountsTracker);
    [(MBATCBundlesPlugin *)v28 _populateAccountsForEngine:v3 dataClasses:&off_10043B5E0 accountsTracker:v29];
    [(MBATCBundlesPlugin *)v28 _populateAccountsAndAssetsForEngine:v3 accountsTracker:v29];

    [(MBATCBundlesPlugin *)v28 _populateBuddyStashForEngine:v3];
  }
  return 0;
}

- (id)endingBackupWithEngine:(id)a3
{
  if ([a3 backsUpPrimaryAccount])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = [+[ATClientController sharedInstance] allClients];
    id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v7);
          if (objc_opt_respondsToSelector()) {
            [v8 backupEnded];
          }
          id v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
  return 0;
}

- (BOOL)shouldRestoreContentWithPolicy:(id)a3 fileInfo:(id)a4
{
  unsigned int v5 = [a3 isRestoringPrimaryAccount];
  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [+[ATClientController sharedInstance] allClients];
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector())
        {
          unsigned int v5 = objc_msgSend(v11, "shouldRestoreFile:backupManager:", a4, +[MBCKManager sharedInstance](MBCKManager, "sharedInstance"));
          if (!v5) {
            break;
          }
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
          LOBYTE(v5) = 1;
          if (v8) {
            goto LABEL_4;
          }
          return v5;
        }
      }
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)shouldBackgroundRestoreContentWithPolicy:(id)a3 fileInfo:(id)a4
{
  if (![a3 isRestoringPrimaryAccount]) {
    return 0;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [+[ATClientController sharedInstance] allClients];
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v21;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      if (objc_opt_respondsToSelector())
      {
        unsigned int v12 = objc_msgSend(v10, "shouldBackgroundRestorePath:backupManager:", objc_msgSend(a4, "path"), +[MBCKManager sharedInstance](MBCKManager, "sharedInstance"));
        long long v13 = MBGetDefaultLog();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
        if (v12)
        {
          if (v14) {
            goto LABEL_17;
          }
          return 1;
        }
        if (!v14) {
          return 0;
        }
LABEL_22:
        id v18 = [a4 path];
        *(_DWORD *)buf = 138412546;
        v25 = v10;
        __int16 v26 = 2112;
        id v27 = v18;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "=atc-bundles= %@ requesting FG restore: %@", buf, 0x16u);
        BOOL v11 = 0;
        goto LABEL_23;
      }
      if (objc_opt_respondsToSelector())
      {
        unsigned int v15 = objc_msgSend(v10, "shouldBackgroundRestoreFile:backupManager:", a4, +[MBCKManager sharedInstance](MBCKManager, "sharedInstance"));
        long long v13 = MBGetDefaultLog();
        BOOL v16 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
        if (v15)
        {
          if (v16)
          {
LABEL_17:
            id v17 = [a4 path];
            *(_DWORD *)buf = 138412546;
            v25 = v10;
            __int16 v26 = 2112;
            id v27 = v17;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "=atc-bundles= %@ requesting BG restore: %@", buf, 0x16u);
            BOOL v11 = 1;
LABEL_23:
            [a4 path];
            _MBLog();
            return v11;
          }
          return 1;
        }
        if (v16) {
          goto LABEL_22;
        }
        return 0;
      }
    }
    id v7 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    BOOL v11 = 0;
    if (v7) {
      continue;
    }
    return v11;
  }
}

- (id)startingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  if (!objc_msgSend(a4, "restoresPrimaryAccount", a3)) {
    return 0;
  }
  id v26 = [a4 domainManager];
  if ([a4 backupPolicy] == (id)1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      __assert_rtn("-[MBATCBundlesPlugin startingRestoreWithPolicy:engine:]", "MBATCBundlesPlugin.m", 448, "[engine isKindOfClass:MBCKRestoreEngine.class]");
    }
    [a4 isDeviceTransferEngine];
    goto LABEL_6;
  }
  if ([a4 isDeviceTransferEngine])
  {
LABEL_6:
    if (!v26) {
      __assert_rtn("-[MBATCBundlesPlugin startingRestoreWithPolicy:engine:]", "MBATCBundlesPlugin.m", 452, "domainManager");
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v5 = [&off_10043B5F8 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v25 = *(void *)v29;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v29 != v25) {
            objc_enumerationMutation(&off_10043B5F8);
          }
          uint64_t v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v9 = [v26 domainForName:v8];
          if (!v9) {
            __assert_rtn("-[MBATCBundlesPlugin startingRestoreWithPolicy:engine:]", "MBATCBundlesPlugin.m", 456, "domain");
          }
          uint64_t v10 = v9;
          if ([v9 relativePathsToBackupAndRestore]) {
            id v11 = objc_msgSend(objc_msgSend(v10, "relativePathsToBackupAndRestore"), "mutableCopy");
          }
          else {
            id v11 = (id)objc_opt_new();
          }
          unsigned int v12 = v11;
          long long v13 = MBGetDefaultLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v33 = v10;
            __int16 v34 = 2114;
            CFStringRef v35 = @"Media";
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "=atc-bundles= %{public}@: Adding \"%{public}@\" to relativePathsToBackupAndRestore", buf, 0x16u);
            long long v21 = v10;
            CFStringRef v23 = @"Media";
            _MBLog();
          }
          objc_msgSend(v12, "addObject:", @"Media", v21, v23);
          BOOL v14 = MBGetDefaultLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v33 = v10;
            __int16 v34 = 2114;
            CFStringRef v35 = @"Media/iTunes_Control/iTunes";
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "=atc-bundles= %{public}@: Adding \"%{public}@\" to relativePathsToBackupAndRestore", buf, 0x16u);
            long long v22 = v10;
            CFStringRef v24 = @"Media/iTunes_Control/iTunes";
            _MBLog();
          }
          objc_msgSend(v12, "addObject:", @"Media/iTunes_Control/iTunes", v22, v24);
          [v10 setRelativePathsToBackupAndRestore:v12];

          CFStringRef v15 = [(MBATCBundlesPlugin *)self _standardizePath:@"Media/iTunes_Control/iTunes" fromDomain:v10];
          if (objc_msgSend(objc_msgSend(v10, "relativePathsNotToBackupToDrive"), "containsObject:", v15))
          {
            id v16 = objc_msgSend(objc_msgSend(v10, "relativePathsNotToBackupToDrive"), "mutableCopy");
            id v17 = MBGetDefaultLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v33 = v8;
              __int16 v34 = 2114;
              CFStringRef v35 = v15;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "=atc-bundles= %{public}@: Removing \"%{public}@\" from relativePathsNotToBackupToDrive", buf, 0x16u);
              long long v21 = v8;
              CFStringRef v23 = v15;
              _MBLog();
            }
            objc_msgSend(v16, "removeObject:", v15, v21, v23);
            [v10 setRelativePathsNotToBackupToDrive:v16];
          }
          if (objc_msgSend(objc_msgSend(v10, "relativePathsNotToBackupToDrive"), "containsObject:", &stru_100418BA8))
          {
            id v18 = objc_msgSend(objc_msgSend(v10, "relativePathsNotToBackupToDrive"), "mutableCopy");
            CFStringRef v19 = MBGetDefaultLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v33 = v8;
              __int16 v34 = 2114;
              CFStringRef v35 = &stru_100418BA8;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "=atc-bundles= %{public}@: Removing \"%{public}@\" from relativePathsNotToBackupToDrive", buf, 0x16u);
              long long v21 = v8;
              CFStringRef v23 = &stru_100418BA8;
              _MBLog();
            }
            objc_msgSend(v18, "removeObject:", &stru_100418BA8, v21, v23);
            [v10 setRelativePathsNotToBackupToDrive:v18];
          }
        }
        id v6 = [&off_10043B5F8 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v6);
    }
  }
  if ([a4 isDeviceTransferEngine]) {
    [(MBATCBundlesPlugin *)self _updatePathsForCameraRollDomainWithEngine:a4];
  }
  return 0;
}

- (void)_updatePathsForCameraRollDomainWithEngine:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(a3, "domainManager"), "domainForName:", @"CameraRollDomain");
  if (!v4) {
    __assert_rtn("-[MBATCBundlesPlugin _updatePathsForCameraRollDomainWithEngine:]", "MBATCBundlesPlugin.m", 507, "domain");
  }
  id v5 = v4;
  id v6 = [(MBATCBundlesPlugin *)self _standardizePath:@"Media/PhotoData/Sync" fromDomain:v4];
  if (objc_msgSend(objc_msgSend(v5, "relativePathsToRemoveOnRestore"), "containsObject:", v6))
  {
    id v7 = objc_msgSend(objc_msgSend(v5, "relativePathsToRemoveOnRestore"), "mutableCopy");
    uint64_t v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v19 = @"CameraRollDomain";
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "=atc-bundles= %{public}@: Removing \"%{public}@\" from relativePathsToRemoveOnRestore", buf, 0x16u);
      CFStringRef v16 = @"CameraRollDomain";
      id v17 = v6;
      _MBLog();
    }
    objc_msgSend(v7, "removeObject:", v6, v16, v17);
    [v5 setRelativePathsToRemoveOnRestore:v7];
  }
  if (objc_msgSend(objc_msgSend(v5, "relativePathsNotToBackup"), "containsObject:", v6))
  {
    id v9 = objc_msgSend(objc_msgSend(v5, "relativePathsNotToBackup"), "mutableCopy");
    uint64_t v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v19 = @"CameraRollDomain";
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "=atc-bundles= %{public}@: Removing \"%{public}@\" from relativePathsNotToBackup", buf, 0x16u);
      CFStringRef v16 = @"CameraRollDomain";
      id v17 = v6;
      _MBLog();
    }
    objc_msgSend(v9, "removeObject:", v6, v16, v17);
    [v5 setRelativePathsNotToBackup:v9];
  }
  id v11 = [(MBATCBundlesPlugin *)self _standardizePath:@"Media/PhotoData/Metadata/PhotoData/Sync" fromDomain:v5];
  if (objc_msgSend(objc_msgSend(v5, "relativePathsToRemoveOnRestore"), "containsObject:", v11))
  {
    id v12 = objc_msgSend(objc_msgSend(v5, "relativePathsToRemoveOnRestore"), "mutableCopy");
    long long v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v19 = @"CameraRollDomain";
      __int16 v20 = 2114;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "=atc-bundles= %{public}@: Removing \"%{public}@\" from relativePathsToRemoveOnRestore", buf, 0x16u);
      CFStringRef v16 = @"CameraRollDomain";
      id v17 = v11;
      _MBLog();
    }
    objc_msgSend(v12, "removeObject:", v11, v16, v17);
    [v5 setRelativePathsToRemoveOnRestore:v12];
  }
  if (objc_msgSend(objc_msgSend(v5, "relativePathsNotToBackup"), "containsObject:", v11))
  {
    id v14 = objc_msgSend(objc_msgSend(v5, "relativePathsNotToBackup"), "mutableCopy");
    CFStringRef v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v19 = @"CameraRollDomain";
      __int16 v20 = 2114;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=atc-bundles= %{public}@: Removing \"%{public}@\" from relativePathsNotToBackup", buf, 0x16u);
      CFStringRef v16 = @"CameraRollDomain";
      id v17 = v11;
      _MBLog();
    }
    objc_msgSend(v14, "removeObject:", v11, v16, v17);
    [v5 setRelativePathsNotToBackup:v14];
  }
}

@end