@interface RestoreDemotedApplicationsOperation
- (RestoreDemotedApplicationsOperation)initWithBundleIdentifiers:(id)a3 options:(id)a4;
- (id)_accountIdForAppleID:(id)a3;
- (id)_appleIDForApp:(id)a3;
- (void)_notifyCompletion;
- (void)restoreDownloadItemsOperation:(id)a3 didReceiveResponse:(id)a4;
- (void)run;
@end

@implementation RestoreDemotedApplicationsOperation

- (RestoreDemotedApplicationsOperation)initWithBundleIdentifiers:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RestoreDemotedApplicationsOperation;
  v8 = [(RestoreDemotedApplicationsOperation *)&v14 init];
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    bundleIDs = v8->_bundleIDs;
    v8->_bundleIDs = v9;

    v11 = (NSDictionary *)[v7 copy];
    options = v8->_options;
    v8->_options = v11;
  }
  return v8;
}

- (void)run
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v74 = self;
  if ([(NSArray *)self->_bundleIDs count])
  {
    long long v89 = 0u;
    long long v90 = 0u;
    long long v88 = 0u;
    long long v87 = 0u;
    v4 = self->_bundleIDs;
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v87 objects:v100 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v88;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v88 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = +[LSApplicationProxy applicationProxyForIdentifier:*(void *)(*((void *)&v87 + 1) + 8 * i)];
          v10 = v9;
          if (v9
            && (([v9 isPlaceholder] & 1) != 0 || objc_msgSend(v10, "installType") == (id)7))
          {
            [v3 addObject:v10];
          }
        }
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v87 objects:v100 count:16];
      }
      while (v6);
    }
  }
  else
  {
    v11 = +[LSApplicationWorkspace defaultWorkspace];
    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472;
    v91[2] = sub_10007EEB4;
    v91[3] = &unk_1003A4DC8;
    v92 = (NSArray *)v3;
    [v11 enumerateBundlesOfType:0 block:v91];

    v4 = v92;
  }

  v12 = +[SSLogConfig sharedDaemonConfig];
  if (!v12)
  {
    v12 = +[SSLogConfig sharedConfig];
  }
  unsigned int v13 = [v12 shouldLog];
  if ([v12 shouldLogToDisk]) {
    v13 |= 2u;
  }
  objc_super v14 = [v12 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    int v15 = v13;
  }
  else {
    int v15 = v13 & 2;
  }
  if (!v15) {
    goto LABEL_25;
  }
  v16 = objc_opt_class();
  id v17 = v16;
  id v18 = [v3 count];
  int v93 = 138412546;
  v94 = v16;
  __int16 v95 = 2048;
  uint64_t v96 = (uint64_t)v18;
  LODWORD(v69) = 22;
  v67 = &v93;
  v19 = (void *)_os_log_send_and_compose_impl();

  if (v19)
  {
    objc_super v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v93, v69);
    free(v19);
    v67 = (int *)v14;
    SSFileLog();
LABEL_25:
  }
  v73 = +[SSAccountStore defaultStore];
  id v71 = objc_alloc_init((Class)NSMutableDictionary);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obj = v3;
  id v76 = [obj countByEnumeratingWithState:&v83 objects:v99 count:16];
  if (!v76)
  {
    uint64_t v70 = 0;
    char v20 = 1;
    v21 = v74;
    v22 = &syslog_ptr;
    goto LABEL_78;
  }
  uint64_t v70 = 0;
  uint64_t v75 = *(void *)v84;
  char v20 = 1;
  v21 = v74;
  v22 = &syslog_ptr;
  do
  {
    for (j = 0; j != v76; j = (char *)j + 1)
    {
      if (*(void *)v84 != v75) {
        objc_enumerationMutation(obj);
      }
      v24 = *(void **)(*((void *)&v83 + 1) + 8 * (void)j);
      v77 = [[DemotedApplication alloc] initWithApplication:v24];
      v25 = [(DemotedApplication *)v77 restoreDownloadItem];
      v26 = [v24 bundleIdentifier];
      [v25 setBundleID:v26];

      v27 = [v25 storeAccountID];
      v28 = +[NSNumber numberWithLongLong:0];

      if (v27 != v28)
      {
        if (!v27) {
          goto LABEL_34;
        }
LABEL_33:
        v29 = objc_msgSend(v73, "accountWithUniqueIdentifier:", v27, v67);
        v30 = [v29 accountName];
        [v25 setStoreAccountAppleID:v30];

        goto LABEL_34;
      }
      v43 = [(RestoreDemotedApplicationsOperation *)v21 _appleIDForApp:v24];
      v44 = [v22[405] sharedDaemonConfig];
      if (!v44)
      {
        v44 = [v22[405] sharedConfig];
      }
      unsigned int v45 = objc_msgSend(v44, "shouldLog", v67, v69);
      if ([v44 shouldLogToDisk]) {
        v45 |= 2u;
      }
      v46 = [v44 OSLogObject];
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
        v45 &= 2u;
      }
      if (v45)
      {
        v47 = objc_opt_class();
        int v93 = 138412546;
        v94 = v47;
        __int16 v95 = 2112;
        uint64_t v96 = (uint64_t)v43;
        id v48 = v47;
        LODWORD(v69) = 22;
        v67 = &v93;
        v49 = (void *)_os_log_send_and_compose_impl();

        if (!v49) {
          goto LABEL_57;
        }
        v46 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v49, 4, &v93, v69);
        free(v49);
        v67 = (int *)v46;
        SSFileLog();
      }

LABEL_57:
      if (!v43) {
        goto LABEL_69;
      }
      uint64_t v50 = [(RestoreDemotedApplicationsOperation *)v74 _accountIdForAppleID:v43];

      v51 = +[SSLogConfig sharedDaemonConfig];
      if (!v51)
      {
        v51 = +[SSLogConfig sharedConfig];
      }
      unsigned int v52 = objc_msgSend(v51, "shouldLog", v67);
      if ([v51 shouldLogToDisk]) {
        v52 |= 2u;
      }
      v53 = [v51 OSLogObject];
      if (!os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT)) {
        v52 &= 2u;
      }
      if (!v52) {
        goto LABEL_67;
      }
      v54 = objc_opt_class();
      int v93 = 138412546;
      v94 = v54;
      __int16 v95 = 2112;
      uint64_t v96 = v50;
      id v55 = v54;
      LODWORD(v69) = 22;
      v67 = &v93;
      v56 = (void *)_os_log_send_and_compose_impl();

      if (v56)
      {
        v53 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v56, 4, &v93, v69);
        free(v56);
        v67 = (int *)v53;
        SSFileLog();
LABEL_67:
      }
      v27 = (void *)v50;
LABEL_69:
      v21 = v74;
      v22 = &syslog_ptr;

      if (v27) {
        goto LABEL_33;
      }
LABEL_34:
      id v82 = 0;
      unsigned __int8 v31 = objc_msgSend(v25, "isEligibleForRestore:", &v82, v67);
      id v32 = v82;
      if (v31)
      {
        v33 = [v71 objectForKey:v27];
        if (v33)
        {
          id v34 = v33;
          [v33 addObject:v25];
        }
        else
        {
          v67 = 0;
          id v34 = [objc_alloc((Class)NSMutableArray) initWithObjects:v25];
          [v71 setObject:v34 forKey:v27];
          ++v70;
        }
      }
      else
      {
        id v34 = [v22[405] sharedDaemonConfig];
        if (!v34)
        {
          id v34 = [v22[405] sharedConfig];
        }
        unsigned int v35 = [v34 shouldLog];
        if ([v34 shouldLogToDisk]) {
          v35 |= 2u;
        }
        v36 = [v34 OSLogObject];
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
          v35 &= 2u;
        }
        if (!v35) {
          goto LABEL_46;
        }
        v37 = objc_opt_class();
        id v38 = v37;
        v39 = [v24 bundleIdentifier];
        int v93 = 138412802;
        v94 = v37;
        __int16 v95 = 2112;
        uint64_t v96 = (uint64_t)v39;
        __int16 v97 = 2112;
        id v98 = v32;
        LODWORD(v69) = 32;
        v67 = &v93;
        v40 = (void *)_os_log_send_and_compose_impl();

        if (v40)
        {
          v36 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v40, 4, &v93, v69);
          free(v40);
          v67 = (int *)v36;
          SSFileLog();
          v21 = v74;
LABEL_46:
          v42 = v77;
          v41 = v78;

          char v20 = 0;
          v22 = &syslog_ptr;
          goto LABEL_74;
        }
        char v20 = 0;
        v21 = v74;
        v22 = &syslog_ptr;
      }
      v42 = v77;
      v41 = v78;
LABEL_74:
    }
    id v76 = [obj countByEnumeratingWithState:&v83 objects:v99 count:16];
  }
  while (v76);
LABEL_78:

  v57 = [v22[405] sharedDaemonConfig];
  if (!v57)
  {
    v57 = [v22[405] sharedConfig];
  }
  unsigned int v58 = objc_msgSend(v57, "shouldLog", v67);
  if ([v57 shouldLogToDisk]) {
    v58 |= 2u;
  }
  v59 = [v57 OSLogObject];
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
    int v60 = v58;
  }
  else {
    int v60 = v58 & 2;
  }
  if (v60)
  {
    v61 = objc_opt_class();
    id v62 = v61;
    id v63 = [v71 count];
    int v93 = 138412802;
    v94 = v61;
    __int16 v95 = 2048;
    uint64_t v96 = v70;
    __int16 v97 = 2048;
    id v98 = v63;
    LODWORD(v69) = 32;
    v68 = &v93;
    v64 = (void *)_os_log_send_and_compose_impl();

    v21 = v74;
    v65 = &off_10031F000;
    v66 = v73;
    if (v64)
    {
      v59 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v64, 4, &v93, v69);
      free(v64);
      v68 = (int *)v59;
      SSFileLog();
      goto LABEL_89;
    }
  }
  else
  {
    v65 = &off_10031F000;
    v66 = v73;
LABEL_89:
  }
  if (v70 >= 1)
  {
    v79[0] = _NSConcreteStackBlock;
    v79[1] = *((void *)v65 + 230);
    v79[2] = sub_10007EF3C;
    v79[3] = &unk_1003A4DF0;
    id v80 = v66;
    v81 = v21;
    [v71 enumerateKeysAndObjectsUsingBlock:v79];
  }
  -[RestoreDemotedApplicationsOperation setError:](v21, "setError:", 0, v68);
  [(RestoreDemotedApplicationsOperation *)v21 setSuccess:v20 & 1];
  [(RestoreDemotedApplicationsOperation *)v21 _notifyCompletion];
}

- (void)restoreDownloadItemsOperation:(id)a3 didReceiveResponse:(id)a4
{
  id v5 = a4;
  id v6 = [v5 requestItems];
  uint64_t v7 = [v5 serverResponse];

  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = [v7 downloads];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10007F610;
  v27[3] = &unk_1003A4E18;
  id v10 = v8;
  id v28 = v10;
  [v9 enumerateObjectsUsingBlock:v27];

  if (![v10 count])
  {
    v12 = [v6 valueForKey:@"bundleID"];
    unsigned int v13 = +[SSLogConfig sharedDaemonConfig];
    if (!v13)
    {
      unsigned int v13 = +[SSLogConfig sharedConfig];
    }
    unsigned int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    v16 = [v13 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      v15 &= 2u;
    }
    if (v15)
    {
      id v17 = objc_opt_class();
      id v18 = v17;
      v19 = [v7 error];
      int v29 = 138412802;
      v30 = v17;
      __int16 v31 = 2112;
      id v32 = v19;
      __int16 v33 = 2112;
      id v34 = v12;
      LODWORD(v21) = 32;
      char v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_14:

        goto LABEL_15;
      }
      v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v29, v21);
      free(v20);
      SSFileLog();
    }

    goto LABEL_14;
  }
  v11 = +[DownloadsDatabase downloadsDatabase];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10007F69C;
  v22[3] = &unk_1003A4E40;
  id v23 = v6;
  id v24 = v10;
  v25 = self;
  id v26 = v7;
  [v11 modifyAsyncUsingTransactionBlock:v22];

  v12 = v23;
LABEL_15:
}

- (id)_appleIDForApp:(id)a3
{
  id v3 = [a3 bundleContainerURL];
  v4 = [v3 path];
  id v5 = [v4 stringByAppendingPathComponent:@"iTunesMetadata.plist"];

  id v6 = [objc_alloc((Class)NSMutableDictionary) initWithContentsOfFile:v5];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKey:@"appleId"];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_accountIdForAppleID:(id)a3
{
  id v4 = a3;
  accountsCacheDB = self->_accountsCacheDB;
  if (!accountsCacheDB)
  {
    id v6 = objc_alloc_init(AccountCacheDBClient);
    uint64_t v7 = self->_accountsCacheDB;
    self->_accountsCacheDB = v6;

    accountsCacheDB = self->_accountsCacheDB;
  }
  id v8 = [(AccountCacheDBClient *)accountsCacheDB dSIDForAppleID:v4];

  return v8;
}

- (void)_notifyCompletion
{
  v2 = dispatch_get_global_queue(0, 0);
  dispatch_async(v2, &stru_1003A4E60);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsCacheDB, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_bundleIDs, 0);
}

@end