@interface SWCManager
+ (id)beginListening;
+ (id)new;
- (BOOL)_addJSONDataInDictionary:(id)a3 toStagingDirectoryAtURL:(id)a4 error:(id *)a5;
- (BOOL)_connectionIsEntitled:(id)a3 forMutation:(BOOL)a4;
- (BOOL)_connectionMayConnect:(id)a3;
- (BOOL)_copyStagingDirectoryAtURL:(id)a3 toAdditionalServiceDetailsDirectoriesForApplicationIdentifiers:(id)a4 error:(id *)a5;
- (BOOL)_isDeveloperModeEnabled;
- (BOOL)_setDeveloperModeEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SWCDatabase)database;
- (SWCDownloadScheduler)downloadScheduler;
- (SWCDownloader)downloader;
- (SWCManager)init;
- (SWCManager)initWithDatabase:(id)a3;
- (id).cxx_construct;
- (id)_createStagingDirectoryForAdditionalServiceDetailsReturningError:(id *)a3;
- (id)_developerModeSemaphoreURL;
- (id)_eligibleSystemPlaceholderRecords;
- (id)_entriesWithServiceSpecifier:(id)a3 URL:(id)a4 limit:(unint64_t)a5 auditToken:(id *)a6;
- (id)_filterApplicationIdentifiers:(id)a3 toMatchEntitlementOfXPCConnection:(id)a4;
- (id)_serviceDetailsWithEntry:(id)a3;
- (void)_addEntriesForAllBundlesWithEnumerator:(id)a3 toWorkingSet:(id)a4 enterpriseContext:(id)a5 developerModeEnabled:(BOOL)a6;
- (void)_authorizeDeveloperModeChangeWithCompletionHandler:(id)a3;
- (void)_updateAllEntries:(id)a3;
- (void)_waitForSiteApprovalWithServiceSpecifier:(id)a3 completionHandler:(id)a4;
- (void)addAllAppsWithCompletionHandler:(id)a3;
- (void)addServiceWithServiceSpecifier:(id)a3 completionHandler:(id)a4;
- (void)commitServiceSettings:(id)a3 completionHandler:(id)a4;
- (void)downloader:(id)a3 didDownloadAASAFileContainingJSONObject:(id)a4 fromDomain:(id)a5 downloadRoute:(unsigned __int8)a6;
- (void)downloader:(id)a3 failedToDownloadAASAFileFromDomain:(id)a4 error:(id)a5;
- (void)downloader:(id)a3 willDownloadAASAFileFromDomain:(id)a4;
- (void)getDetailsWithServiceSpecifier:(id)a3 URL:(id)a4 limit:(unint64_t)a5 callerAuditToken:(id)a6 completionHandler:(id)a7;
- (void)getDeveloperModeEnabledWithCompletionHandler:(id)a3;
- (void)getServiceSettingsWithServiceSpecifier:(id)a3 completionHandler:(id)a4;
- (void)getTrackingDomains:(id)a3 sources:(unint64_t)a4 completionHandler:(id)a5;
- (void)receiveSIGTERMSignal;
- (void)removeServiceWithServiceSpecifier:(id)a3 completionHandler:(id)a4;
- (void)removeSettingsForKeys:(id)a3 serviceSpecifier:(id)a4 completionHandler:(id)a5;
- (void)removeSettingsForKeys:(id)a3 serviceType:(id)a4 completionHandler:(id)a5;
- (void)resetWithCompletionHandler:(id)a3;
- (void)setAdditionalServiceDetailsForApplicationIdentifiers:(id)a3 usingContentsOfDictionary:(id)a4 completionHandler:(id)a5;
- (void)setDetails:(id)a3 forServiceWithServiceSpecifier:(id)a4 completionHandler:(id)a5;
- (void)setDeveloperModeEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setUserApprovalState:(unsigned __int8)a3 forServiceWithServiceSpecifier:(id)a4 completionHandler:(id)a5;
- (void)showWithVerbosity:(unsigned __int8)a3 isTTY:(BOOL)a4 fileDescriptor:(id)a5 completionHandler:(id)a6;
- (void)updateEntriesForAllBundlesIgnoringCurrentState:(BOOL)a3;
- (void)waitForSiteApprovalWithServiceSpecifier:(id)a3 completionHandler:(id)a4;
@end

@implementation SWCManager

- (BOOL)_connectionIsEntitled:(id)a3 forMutation:(BOOL)a4
{
  id v4 = a3;
  v5 = v4;
  if (v4) {
    [v4 auditToken];
  }
  char v6 = _SWCIsAuditTokenEntitled();

  return v6;
}

- (void)getTrackingDomains:(id)a3 sources:(unint64_t)a4 completionHandler:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(id, void *))a5;
  if (v7 && !_NSIsNSSet())
  {
LABEL_13:
    v8[2](v8, &__NSDictionary0__struct);
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v7;
    v10 = (char *)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v9);
          }
          if ((_NSIsNSString() & 1) == 0)
          {

            goto LABEL_13;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = (char *)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000506C;
    v14[3] = &unk_1000350B0;
    id v15 = (id)os_transaction_create();
    v16 = v8;
    id v13 = v15;
    +[_SWCTrackingDomainInfo _getTrackingDomainInfoWithDomains:v9 sources:a4 completionHandler:v14];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(SWCManager *)self _connectionMayConnect:v5];
  if (v6)
  {
    if (qword_10003B290 != -1) {
      dispatch_once(&qword_10003B290, &stru_1000351C0);
    }
    id v7 = (id)qword_10003B288;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)(int)[v5 processIdentifier];
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Accepted connection: %llu", (uint8_t *)location, 0xCu);
    }

    v8 = _SWCGetServerInterface();
    [v5 setExportedInterface:v8];

    [v5 setExportedObject:self];
    objc_initWeak(location, v5);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100018050;
    v17[3] = &unk_100034D58;
    objc_copyWeak(&v18, location);
    [v5 setInterruptionHandler:v17];
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_100018160;
    id v15 = &unk_100034D58;
    objc_copyWeak(&v16, location);
    [v5 setInvalidationHandler:&v12];
    id v9 = +[SWCDatabase queue];
    [v5 _setQueue:v9];

    [v5 resume];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(location);
  }
  else
  {
    if (qword_10003B290 != -1) {
      dispatch_once(&qword_10003B290, &stru_1000351C0);
    }
    v10 = (id)qword_10003B288;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)(int)[v5 processIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "### Unentitled process %llu attempted to connect", (uint8_t *)location, 0xCu);
    }
  }
  return v6;
}

- (BOOL)_connectionMayConnect:(id)a3
{
  return [(SWCManager *)self _connectionIsEntitled:a3 forMutation:0];
}

- (SWCManager)initWithDatabase:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SWCManager;
  BOOL v6 = [(SWCManager *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    v8 = objc_alloc_init(SWCDownloader);
    downloader = v7->_downloader;
    v7->_downloader = v8;

    [(SWCDownloader *)v7->_downloader setDelegate:v7];
    v10 = [[SWCDownloadScheduler alloc] initWithDownloader:v7->_downloader database:v7->_database];
    downloadScheduler = v7->_downloadScheduler;
    v7->_downloadScheduler = v10;
  }
  return v7;
}

+ (id)new
{
}

- (SWCManager)init
{
}

+ (id)beginListening
{
  if (qword_10003B280 != -1) {
    dispatch_once(&qword_10003B280, &stru_100034E48);
  }
  v2 = (void *)qword_10003B278;

  return v2;
}

- (void)receiveSIGTERMSignal
{
  [(SWCDownloader *)self->_downloader receiveSIGTERMSignal];
  database = self->_database;

  [(SWCDatabase *)database receiveSIGTERMSignal];
}

- (void)updateEntriesForAllBundlesIgnoringCurrentState:(BOOL)a3
{
  BOOL v3 = a3;
  v34 = (void *)os_transaction_create();
  BOOL v6 = +[LSApplicationWorkspace defaultWorkspace];
  id v35 = 0;
  [v6 getKnowledgeUUID:0 andSequenceNumber:&v35];
  id v7 = v35;

  uint64_t v8 = [(SWCDatabase *)self->_database launchServicesDatabaseGeneration];
  id v9 = (void *)v8;
  if (v7 && v8 && (objc_msgSend(v7, "isEqual:", v8, v34) & 1) != 0)
  {
    if (qword_10003B290 != -1) {
      dispatch_once(&qword_10003B290, &stru_1000351C0);
    }
    v10 = qword_10003B288;
    if (os_log_type_enabled((os_log_t)qword_10003B288, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = (uint64_t)v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "LS database generation is still %{public}@. No need to synchronize the SWC database to it.", buf, 0xCu);
    }
    int v11 = 0;
  }
  else
  {
    if (qword_10003B290 != -1) {
      dispatch_once(&qword_10003B290, &stru_1000351C0);
    }
    v12 = qword_10003B288;
    if (os_log_type_enabled((os_log_t)qword_10003B288, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = (uint64_t)v9;
      __int16 v38 = 2114;
      uint64_t v39 = (uint64_t)v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "LS database generation has changed %{public}@ to %{public}@. Synchronizing SWC database to it.", buf, 0x16u);
    }
    int v11 = 1;
  }

  objc_super v13 = objc_alloc_init(SWCEnterpriseContext);
  uint64_t v14 = [(SWCEnterpriseContext *)v13 state];
  uint64_t v15 = [(SWCDatabase *)self->_database enterpriseState];
  id v16 = (void *)v15;
  if (!(v14 | v15))
  {
    if (qword_10003B290 != -1) {
      dispatch_once(&qword_10003B290, &stru_1000351C0);
    }
    uint64_t v21 = qword_10003B288;
    if (!os_log_type_enabled((os_log_t)qword_10003B288, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    id v18 = "Enterprise state is still nil. No need to synchronize the SWC database to it.";
    long long v19 = v21;
    uint32_t v20 = 2;
    goto LABEL_46;
  }
  if (v14 && v15 && ([(id)v14 isEqual:v15] & 1) != 0)
  {
    if (qword_10003B290 != -1) {
      dispatch_once(&qword_10003B290, &stru_1000351C0);
    }
    uint64_t v17 = qword_10003B288;
    if (!os_log_type_enabled((os_log_t)qword_10003B288, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v37 = v14;
    id v18 = "Enterprise state is still %{public}@. No need to synchronize the SWC database to it.";
    long long v19 = v17;
    uint32_t v20 = 12;
LABEL_46:
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, v18, buf, v20);
LABEL_25:
    int v22 = 0;
    goto LABEL_31;
  }
  if (qword_10003B290 != -1) {
    dispatch_once(&qword_10003B290, &stru_1000351C0);
  }
  v23 = qword_10003B288;
  if (os_log_type_enabled((os_log_t)qword_10003B288, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v37 = (uint64_t)v16;
    __int16 v38 = 2114;
    uint64_t v39 = v14;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Enterprise state has changed %{public}@ to %{public}@. Synchronizing SWC database to it.", buf, 0x16u);
  }
  int v22 = 1;
LABEL_31:

  if (v3)
  {
    if (qword_10003B290 != -1) {
      dispatch_once(&qword_10003B290, &stru_1000351C0);
    }
    v24 = qword_10003B288;
    if (os_log_type_enabled((os_log_t)qword_10003B288, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Was asked to resynchronize the entire SWC database regardless of current state.", buf, 2u);
    }
  }
  else if ((v11 | v22) != 1)
  {
    goto LABEL_44;
  }
  id v25 = objc_alloc_init((Class)NSMutableOrderedSet);
  BOOL v26 = [(SWCManager *)self _isDeveloperModeEnabled];
  if (qword_10003B290 != -1) {
    dispatch_once(&qword_10003B290, &stru_1000351C0);
  }
  v27 = qword_10003B288;
  if (os_log_type_enabled((os_log_t)qword_10003B288, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v37) = v26;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Developer mode enabled: %{BOOL}i", buf, 8u);
  }
  v29 = +[LSApplicationRecord enumeratorWithOptions:0];
  [v29 setErrorHandler:&stru_100034E88];
  [(SWCManager *)self _addEntriesForAllBundlesWithEnumerator:v29 toWorkingSet:v25 enterpriseContext:v13 developerModeEnabled:v26];

  v31 = [(SWCManager *)self _eligibleSystemPlaceholderRecords];
  if ([v31 count])
  {
    v32 = [v31 objectEnumerator];
    [(SWCManager *)self _addEntriesForAllBundlesWithEnumerator:v32 toWorkingSet:v25 enterpriseContext:v13 developerModeEnabled:v26];
  }
  v33 = +[LSApplicationWorkspace defaultWorkspace];
  [v33 _LSClearSchemaCaches];

  [(SWCManager *)self _updateAllEntries:v25];
  [(SWCDatabase *)self->_database setLaunchServicesDatabaseGeneration:v7];
  [(SWCDatabase *)self->_database setEnterpriseState:v14];

LABEL_44:
}

- (void)downloader:(id)a3 willDownloadAASAFileFromDomain:(id)a4
{
  id v5 = a4;
  BOOL v6 = +[SWCDatabase queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100018338;
  v8[3] = &unk_1000347C0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)downloader:(id)a3 didDownloadAASAFileContainingJSONObject:(id)a4 fromDomain:(id)a5 downloadRoute:(unsigned __int8)a6
{
  id v8 = a4;
  id v9 = a5;
  v10 = +[SWCDatabase queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018470;
  block[3] = &unk_100034DC8;
  block[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, block);
}

- (void)downloader:(id)a3 failedToDownloadAASAFileFromDomain:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[SWCDatabase queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018620;
  block[3] = &unk_100034DC8;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)waitForSiteApprovalWithServiceSpecifier:(id)a3 completionHandler:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000188E4;
  v6[3] = &unk_100034F10;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  [(SWCManager *)v7 _waitForSiteApprovalWithServiceSpecifier:a3 completionHandler:v6];
}

- (void)getDetailsWithServiceSpecifier:(id)a3 URL:(id)a4 limit:(unint64_t)a5 callerAuditToken:(id)a6 completionHandler:(id)a7
{
  id v25 = a3;
  id v27 = a4;
  id v12 = a6;
  id v13 = (void (**)(id, id, void))a7;
  if (v12 && (id v14 = objc_retainAutorelease(v12), !strcmp((const char *)[v14 objCType], "{?=[8I]}")))
  {
    [v14 getValue:&v35 size:32];
  }
  else
  {
    id v15 = +[NSXPCConnection currentConnection];
    id v16 = v15;
    if (v15)
    {
      [v15 auditToken];
    }
    else
    {
      long long v33 = 0u;
      long long v34 = 0u;
    }
    long long v35 = v33;
    long long v36 = v34;
  }
  v32[0] = v35;
  v32[1] = v36;
  uint64_t v17 = -[SWCManager _entriesWithServiceSpecifier:URL:limit:auditToken:](self, "_entriesWithServiceSpecifier:URL:limit:auditToken:", v25, v27, a5, v32, v25);
  id v18 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v17 count]];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = v17;
  id v20 = [v19 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = [(SWCManager *)self _serviceDetailsWithEntry:*(void *)(*((void *)&v28 + 1) + 8 * i)];
        if (v23) {
          [v18 addObject:v23];
        }
      }
      id v20 = [v19 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v20);
  }

  id v24 = [v18 copy];
  v13[2](v13, v24, 0);
}

- (void)addServiceWithServiceSpecifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = +[NSXPCConnection currentConnection];
  unsigned __int8 v9 = [(SWCManager *)self _connectionIsEntitled:v8 forMutation:1];

  if (v9)
  {
    if (v6
      && ([v6 SWCApplicationIdentifier],
          id v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v10))
    {
      id v11 = objc_alloc((Class)LSApplicationRecord);
      id v12 = [v6 bundleIdentifier];
      id v13 = [v11 initWithBundleIdentifier:v12 allowPlaceholder:0 error:0];

      if ((v13
         || (id v14 = objc_alloc((Class)LSApplicationExtensionRecord),
             [v6 bundleIdentifier],
             id v15 = objc_claimAutoreleasedReturnValue(),
             id v13 = [v14 initWithBundleIdentifier:v15 error:0],
             v15,
             v13))
        && ([v6 isFullySpecified] & 1) == 0)
      {
        [(SWCManager *)self updateEntriesForAllBundlesIgnoringCurrentState:0];
        v7[2](v7, 1, 0);
      }
      else if ([v6 isFullySpecified])
      {
        id v16 = [(SWCDatabase *)self->_database entryMatchingServiceSpecifier:v6];
        if (!v16)
        {
          id v16 = [[SWCEntry alloc] initWithServiceSpecifier:v6];
          uint64_t v17 = [(SWCEntry *)v16 fields];
          *(_WORD *)uint64_t v17 = *(_WORD *)v17 & 0xE3FF | 0x800;
          database = self->_database;
          id v19 = [objc_alloc((Class)NSOrderedSet) initWithObject:v16];
          [(SWCDatabase *)database addEntries:v19];
        }
        v7[2](v7, 1, 0);
      }
      else
      {
        id v26 = objc_alloc((Class)NSError);
        v32[0] = @"Line";
        v32[1] = @"Function";
        v33[0] = &off_1000368B8;
        id v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager addServiceWithServiceSpecifier:completionHandler:]");
        v33[1] = v27;
        long long v28 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
        id v29 = [v26 initWithDomain:_SWCErrorDomain code:3 userInfo:v28];
        ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v29);
      }
    }
    else
    {
      id v23 = objc_alloc((Class)NSError);
      v30[0] = @"Line";
      v30[1] = @"Function";
      v31[0] = &off_1000368D0;
      +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager addServiceWithServiceSpecifier:completionHandler:]");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      v31[1] = v13;
      id v24 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
      id v25 = [v23 initWithDomain:_SWCErrorDomain code:2 userInfo:v24];
      ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v25);
    }
  }
  else
  {
    id v20 = objc_alloc((Class)NSError);
    v35[0] = &off_1000368A0;
    v34[0] = @"Line";
    v34[1] = @"Function";
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager addServiceWithServiceSpecifier:completionHandler:]");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v34[2] = NSDebugDescriptionErrorKey;
    v35[1] = v13;
    v35[2] = @"Entitlement required to mutate SWC database";
    uint64_t v21 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
    id v22 = [v20 initWithDomain:_SWCErrorDomain code:1 userInfo:v21];
    ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v22);
  }
}

- (void)removeServiceWithServiceSpecifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = +[NSXPCConnection currentConnection];
  unsigned __int8 v9 = [(SWCManager *)self _connectionIsEntitled:v8 forMutation:1];

  if (v9)
  {
    if (v6)
    {
      id v10 = objc_alloc_init((Class)NSMutableOrderedSet);
      database = self->_database;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000196C8;
      v26[3] = &unk_100034F38;
      id v12 = v10;
      id v27 = v12;
      [(SWCDatabase *)database enumerateEntriesMatchingServiceSpecifier:v6 block:v26];
      if ([v12 count])
      {
        [(SWCDatabase *)self->_database removeEntries:v12];
LABEL_5:
        v7[2](v7, 1, 0);
LABEL_16:
        id v14 = v27;
        goto LABEL_17;
      }
      id v18 = [v6 serviceType];
      if (v18
        || ([v6 SWCApplicationIdentifier], (id v18 = objc_claimAutoreleasedReturnValue()) != 0))
      {
      }
      else
      {
        id v24 = [v6 SWCDomain];
        BOOL v25 = v24 == 0;

        if (v25) {
          goto LABEL_5;
        }
      }
      if (qword_10003B290 != -1) {
        dispatch_once(&qword_10003B290, &stru_1000351C0);
      }
      id v19 = qword_10003B288;
      if (os_log_type_enabled((os_log_t)qword_10003B288, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v6;
        _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Service '%@' not found to remove", buf, 0xCu);
      }
      id v20 = objc_alloc((Class)NSError);
      v30[0] = @"Line";
      v30[1] = @"Function";
      v31[0] = &off_100036900;
      uint64_t v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager removeServiceWithServiceSpecifier:completionHandler:]");
      v31[1] = v21;
      id v22 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
      id v23 = [v20 initWithDomain:_SWCErrorDomain code:3 userInfo:v22];
      ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v23);

      goto LABEL_16;
    }
    id v16 = objc_alloc((Class)NSError);
    v28[0] = @"Line";
    v28[1] = @"Function";
    v29[0] = &off_100036918;
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager removeServiceWithServiceSpecifier:completionHandler:]");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v29[1] = v12;
    id v14 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
    id v17 = [v16 initWithDomain:_SWCErrorDomain code:2 userInfo:v14];
    ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v17);
  }
  else
  {
    id v13 = objc_alloc((Class)NSError);
    v35[0] = &off_1000368E8;
    v34[0] = @"Line";
    v34[1] = @"Function";
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager removeServiceWithServiceSpecifier:completionHandler:]");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v34[2] = NSDebugDescriptionErrorKey;
    v35[1] = v12;
    v35[2] = @"Entitlement required to mutate SWC database";
    id v14 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
    id v15 = [v13 initWithDomain:_SWCErrorDomain code:1 userInfo:v14];
    ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v15);
  }
LABEL_17:
}

- (void)setDetails:(id)a3 forServiceWithServiceSpecifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  id v11 = +[NSXPCConnection currentConnection];
  unsigned __int8 v12 = [(SWCManager *)self _connectionIsEntitled:v11 forMutation:1];

  if ((v12 & 1) == 0)
  {
    id v17 = objc_alloc((Class)NSError);
    v34[0] = &off_100036930;
    v33[0] = @"Line";
    v33[1] = @"Function";
    id v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager setDetails:forServiceWithServiceSpecifier:completionHandler:]");
    void v33[2] = NSDebugDescriptionErrorKey;
    v34[1] = v18;
    v34[2] = @"Entitlement required to mutate SWC database";
    id v19 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
    id v20 = [v17 initWithDomain:_SWCErrorDomain code:1 userInfo:v19];
    v10[2](v10, 0, v20);
LABEL_11:

    goto LABEL_20;
  }
  if (![v9 isFullySpecified])
  {
    id v21 = objc_alloc((Class)NSError);
    id v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager setDetails:forServiceWithServiceSpecifier:completionHandler:]", @"Line", @"Function", &off_100036948);
    v28[1] = v18;
    id v19 = +[NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:2];
    id v20 = [v21 initWithDomain:_SWCErrorDomain code:2 userInfo:v19];
    v10[2](v10, 0, v20);
    goto LABEL_11;
  }
  id v13 = [(SWCDatabase *)self->_database entryMatchingServiceSpecifier:v9];
  if (v13)
  {
    id v14 = +[_SWCPatternList patternListWithDetailsDictionary:v8];
    [(SWCEntry *)v13 setPatterns:v14];

    id v15 = +[_SWCSubstitutionVariableList substitutionVariableListWithDictionary:v8];
    [(SWCEntry *)v13 setSubstitutionVariables:v15];

    if (qword_10003B290 != -1) {
      dispatch_once(&qword_10003B290, &stru_1000351C0);
    }
    id v16 = qword_10003B288;
    if (os_log_type_enabled((os_log_t)qword_10003B288, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      long long v30 = v13;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Set details on %@: %@", buf, 0x16u);
    }
    [(SWCDatabase *)self->_database scheduleNextSave];
  }
  else
  {
    id v13 = [[SWCEntry alloc] initWithServiceSpecifier:v9];
    if (v8)
    {
      id v22 = +[_SWCPatternList patternListWithDetailsDictionary:v8];
      [(SWCEntry *)v13 setPatterns:v22];

      id v23 = +[_SWCSubstitutionVariableList substitutionVariableListWithDictionary:v8];
      [(SWCEntry *)v13 setSubstitutionVariables:v23];
    }
    if (qword_10003B290 != -1) {
      dispatch_once(&qword_10003B290, &stru_1000351C0);
    }
    id v24 = qword_10003B288;
    if (os_log_type_enabled((os_log_t)qword_10003B288, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      long long v30 = v13;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Added %@ with details: %@", buf, 0x16u);
    }
    database = self->_database;
    id v26 = [objc_alloc((Class)NSOrderedSet) initWithObject:v13];
    [(SWCDatabase *)database addEntries:v26];
  }
  v10[2](v10, 1, 0);
LABEL_20:
}

- (void)setUserApprovalState:(unsigned __int8)a3 forServiceWithServiceSpecifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t, id))a5;
  id v10 = +[NSXPCConnection currentConnection];
  unsigned __int8 v11 = [(SWCManager *)self _connectionIsEntitled:v10 forMutation:1];

  if ((v11 & 1) == 0)
  {
    id v17 = objc_alloc((Class)NSError);
    v31[0] = &off_100036960;
    v30[0] = @"Line";
    v30[1] = @"Function";
    id v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager setUserApprovalState:forServiceWithServiceSpecifier:completionHandler:]");
    void v30[2] = NSDebugDescriptionErrorKey;
    v31[1] = v18;
    void v31[2] = @"Entitlement required to mutate SWC database";
    id v19 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
    id v16 = [v17 initWithDomain:_SWCErrorDomain code:1 userInfo:v19];

    goto LABEL_5;
  }
  if (v6 >= 3)
  {
    id v12 = objc_alloc((Class)NSError);
    v29[0] = &off_100036978;
    v28[0] = @"Line";
    v28[1] = @"Function";
    id v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager setUserApprovalState:forServiceWithServiceSpecifier:completionHandler:]");
    v29[1] = v13;
    void v29[2] = @"Unknown approval state specified by caller";
    void v28[2] = NSDebugDescriptionErrorKey;
    v28[3] = @"ApprovalState";
    id v14 = +[NSNumber numberWithUnsignedChar:v6];
    v29[3] = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:4];
    id v16 = [v12 initWithDomain:_SWCErrorDomain code:2 userInfo:v15];

LABEL_5:
    uint64_t v20 = 0;
    goto LABEL_9;
  }
  uint64_t v24 = 0;
  BOOL v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  database = self->_database;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100019F98;
  v22[3] = &unk_100034F60;
  v22[4] = &v24;
  char v23 = v6;
  [(SWCDatabase *)database enumerateEntriesMatchingServiceSpecifier:v8 block:v22];
  if (*((unsigned char *)v25 + 24)) {
    [(SWCDatabase *)self->_database scheduleNextSave];
  }
  _Block_object_dispose(&v24, 8);
  id v16 = 0;
  uint64_t v20 = 1;
LABEL_9:
  v9[2](v9, v20, v16);
}

- (void)addAllAppsWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, BOOL, id))a3;
  id v5 = +[NSXPCConnection currentConnection];
  BOOL v6 = [(SWCManager *)self _connectionIsEntitled:v5 forMutation:1];

  if (v6)
  {
    if (qword_10003B290 != -1) {
      dispatch_once(&qword_10003B290, &stru_1000351C0);
    }
    id v7 = qword_10003B288;
    if (os_log_type_enabled((os_log_t)qword_10003B288, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v12 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Add all apps", v12, 2u);
    }
    id v8 = 0;
    [(SWCManager *)self updateEntriesForAllBundlesIgnoringCurrentState:1];
  }
  else
  {
    id v9 = objc_alloc((Class)NSError);
    v14[0] = &off_100036990;
    v13[0] = @"Line";
    v13[1] = @"Function";
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager addAllAppsWithCompletionHandler:]");
    v13[2] = NSDebugDescriptionErrorKey;
    v14[1] = v10;
    v14[2] = @"Entitlement required to mutate SWC database";
    unsigned __int8 v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
    id v8 = [v9 initWithDomain:_SWCErrorDomain code:1 userInfo:v11];
  }
  v4[2](v4, v6, v8);
}

- (void)showWithVerbosity:(unsigned __int8)a3 isTTY:(BOOL)a4 fileDescriptor:(id)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  unsigned int v8 = a3;
  id v10 = a5;
  unsigned __int8 v11 = (void (**)(void))a6;
  if (v10)
  {
    if (xpc_get_type(v10) == (xpc_type_t)&_xpc_type_fd)
    {
      int v12 = xpc_fd_dup(v10);
      if ((v12 & 0x80000000) == 0)
      {
        if (v7) {
          _SWCForceTTY();
        }
        id v13 = fdopen(v12, "w");
        if (v13)
        {
          id v14 = +[NSNumber numberWithInt:getpid()];
          _SWCLogValueForKey();

          id v15 = [(SWCDatabase *)self->_database storageURL];
          id v16 = [v15 path];
          _SWCLogValueForKey();

          if (v8)
          {
            id v17 = [(SWCDatabase *)self->_database settingsGeneration];
            _SWCLogValueForKey();

            id v18 = [(SWCDatabase *)self->_database launchServicesDatabaseGeneration];
            _SWCLogValueForKey();

            id v19 = [(SWCDatabase *)self->_database enterpriseState];
            uint64_t v20 = v19;
            if (v19)
            {
              id v21 = [v19 base64EncodedStringWithOptions:0];
            }
            else
            {
              id v21 = 0;
            }

            _SWCLogValueForKey();
            id v22 = +[NSNumber numberWithBool:[(SWCManager *)self _isDeveloperModeEnabled]];
            _SWCLogValueForKey();
          }
          _SWCLogHeader();
          uint64_t v74 = 0;
          v75 = &v74;
          uint64_t v76 = 0x2020000000;
          char v77 = 0;
          database = self->_database;
          v72[0] = _NSConcreteStackBlock;
          v72[1] = 3221225472;
          v72[2] = sub_10001ABE4;
          v72[3] = &unk_100034F88;
          v72[4] = &v74;
          v72[5] = v13;
          char v73 = v8;
          [(SWCDatabase *)database enumerateEntriesWithBlock:v72];
          if (!*((unsigned char *)v75 + 24)) {
            _SWCLogLine();
          }
          _SWCLogHeader();
          if (v8 < 2)
          {
            id v29 = objc_alloc_init((Class)NSMutableArray);
            downloader = self->_downloader;
            v66[0] = _NSConcreteStackBlock;
            v66[1] = 3221225472;
            v66[2] = sub_10001AE00;
            v66[3] = &unk_100034FD8;
            char v68 = v8;
            id v31 = v29;
            id v67 = v31;
            [(SWCDownloader *)downloader enumerateActiveAASAFileDownloadsWithBlock:v66];
            id v32 = [v31 componentsJoinedByString:@", "];
            _SWCLogLine();

            if (!v8)
            {
LABEL_35:
              _Block_object_dispose(&v74, 8);
              fclose(v13);
              goto LABEL_3;
            }
          }
          else
          {
            id v24 = objc_alloc_init((Class)NSByteCountFormatter);
            BOOL v25 = self->_downloader;
            v69[0] = _NSConcreteStackBlock;
            v69[1] = 3221225472;
            v69[2] = sub_10001AC74;
            v69[3] = &unk_100034FB0;
            id v70 = v24;
            v71 = v13;
            id v26 = v24;
            [(SWCDownloader *)v25 enumerateActiveAASAFileDownloadsWithBlock:v69];

            _SWCLogHeader();
            char v27 = +[_SWCPrefs sharedPrefs];
            long long v28 = [v27 descriptionOfAllPrefs];
            v65[0] = _NSConcreteStackBlock;
            v65[1] = 3221225472;
            v65[2] = sub_10001AF24;
            v65[3] = &unk_100034FF8;
            v65[4] = v13;
            [v28 enumerateKeysAndObjectsUsingBlock:v65];
          }
          _SWCLogHeader();
          uint64_t v55 = 0;
          v56 = &v55;
          uint64_t v57 = 0x2020000000;
          LOBYTE(v58) = 0;
          id v33 = self->_database;
          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472;
          v64[2] = sub_10001AF34;
          v64[3] = &unk_100035020;
          v64[4] = &v55;
          v64[5] = v13;
          [(SWCDatabase *)v33 enumerateSettingsDictionariesWithBlock:v64];
          if (!*((unsigned char *)v56 + 24)) {
            _SWCLogLine();
          }
          _Block_object_dispose(&v55, 8);
          _SWCLogHeader();
          id v34 = objc_alloc_init((Class)NSMutableDictionary);
          long long v35 = self->_database;
          v62[0] = _NSConcreteStackBlock;
          v62[1] = 3221225472;
          v62[2] = sub_10001B00C;
          v62[3] = &unk_100034F38;
          id v36 = v34;
          id v63 = v36;
          id v53 = v36;
          [(SWCDatabase *)v35 enumerateEntriesWithBlock:v62];
          uint64_t v55 = 0;
          v56 = &v55;
          uint64_t v57 = 0x4812000000;
          v58 = sub_10001B170;
          v59 = sub_10001B194;
          v60 = &unk_100031D96;
          memset(v61, 0, sizeof(v61));
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = sub_10001B1C0;
          v54[3] = &unk_100035048;
          v54[4] = &v55;
          [v36 enumerateKeysAndObjectsUsingBlock:v54];
          uint64_t v37 = (void **)v56[6];
          __int16 v38 = (void **)v56[7];
          unint64_t v39 = 126 - 2 * __clz(((char *)v38 - (char *)v37) >> 4);
          v78 = &stru_100035088;
          if (v38 == v37) {
            uint64_t v40 = 0;
          }
          else {
            uint64_t v40 = v39;
          }
          sub_10001F998(v37, v38, (uint64_t)&v78, v40, 1);

          if (v56[6] == v56[7])
          {
            _SWCLogLine();
          }
          else
          {
            v49 = v11;
            id v50 = v10;
            v41 = v13;
            unsigned int v42 = v8;
            id v52 = objc_alloc_init((Class)NSByteCountFormatter);
            uint64_t v43 = v56[6];
            uint64_t v44 = v56[7];
            while (v43 != v44)
            {
              if (*(void *)(v43 + 8))
              {
                id v45 = *(id *)v43;
                v46 = +[NSNumber numberWithUnsignedLongLong:*(void *)(v43 + 8)];
                v47 = [v45 description];
                if (v42 <= 1)
                {
                  v48 = [v52 stringForObjectValue:v46];
                  _SWCLogValueForKey();
                }
                else
                {
                  _SWCLogValueForKey();
                }

                id v36 = v53;
              }
              v43 += 16;
            }

            id v13 = v41;
            unsigned __int8 v11 = v49;
            id v10 = v50;
          }
          _Block_object_dispose(&v55, 8);
          v79 = (void **)v61;
          sub_10001F918(&v79);

          goto LABEL_35;
        }
      }
    }
  }
LABEL_3:
  _SWCForceTTY();
  v11[2](v11);
}

- (void)resetWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id, id))a3;
  id v5 = +[NSXPCConnection currentConnection];
  unsigned __int8 v6 = [(SWCManager *)self _connectionIsEntitled:v5 forMutation:1];

  if (v6)
  {
    [(SWCDatabase *)self->_database removeAllEntries];
    [(SWCManager *)self updateEntriesForAllBundlesIgnoringCurrentState:1];
    database = self->_database;
    id v13 = 0;
    BOOL v8 = [(SWCDatabase *)database saveReturningError:&v13];
    id v9 = v13;
    v4[2](v4, (id)v8, v9);
    xpc_transaction_exit_clean();
  }
  else
  {
    id v10 = objc_alloc((Class)NSError);
    v15[0] = &off_1000369A8;
    v14[0] = @"Line";
    v14[1] = @"Function";
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager resetWithCompletionHandler:]");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v14[2] = NSDebugDescriptionErrorKey;
    v15[1] = v9;
    v15[2] = @"Entitlement required to mutate SWC database";
    unsigned __int8 v11 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
    id v12 = [v10 initWithDomain:_SWCErrorDomain code:1 userInfo:v11];
    v4[2](v4, 0, v12);
  }
}

- (void)getServiceSettingsWithServiceSpecifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, id, id))a4;
  BOOL v8 = [(SWCDatabase *)self->_database settingsDictionaryForServiceSpecifier:v6];
  if (!v8)
  {
    id v9 = [(SWCDatabase *)self->_database entryMatchingServiceSpecifier:v6];

    if (!v9)
    {
      id v14 = objc_alloc((Class)NSError);
      v18[0] = &off_1000369C0;
      v17[0] = @"Line";
      v17[1] = @"Function";
      id v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager getServiceSettingsWithServiceSpecifier:completionHandler:]");
      v17[2] = NSDebugDescriptionErrorKey;
      v18[1] = v15;
      v18[2] = @"No services match the service specifier, so settings cannot be saved for it.";
      id v16 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
      id v13 = [v14 initWithDomain:_SWCErrorDomain code:3 userInfo:v16];

      BOOL v8 = 0;
      id v12 = 0;
      goto LABEL_5;
    }
    BOOL v8 = &__NSDictionary0__struct;
  }
  id v10 = objc_alloc((Class)_SWCServiceSettings);
  unsigned __int8 v11 = [(SWCDatabase *)self->_database settingsGeneration];
  id v12 = [v10 _initWithServiceSpecifier:v6 dictionary:v8 generation:v11];

  id v13 = 0;
LABEL_5:
  v7[2](v7, v12, v13);
}

- (void)commitServiceSettings:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *, id))a4;
  BOOL v8 = [(SWCDatabase *)self->_database settingsGeneration];
  id v9 = +[NSXPCConnection currentConnection];
  unsigned __int8 v10 = [(SWCManager *)self _connectionIsEntitled:v9 forMutation:1];

  if ((v10 & 1) == 0)
  {
    id v17 = objc_alloc((Class)NSError);
    v30[0] = &off_1000369D8;
    v29[0] = @"Line";
    v29[1] = @"Function";
    id v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager commitServiceSettings:completionHandler:]");
    void v29[2] = NSDebugDescriptionErrorKey;
    v30[1] = v18;
    void v30[2] = @"Entitlement required to mutate SWC database";
    id v19 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
    id v20 = [v17 initWithDomain:_SWCErrorDomain code:1 userInfo:v19];

LABEL_7:
    id v16 = 0;
    goto LABEL_10;
  }
  unsigned __int8 v11 = [v6 generation];
  unsigned __int8 v12 = [v11 isEqual:v8];

  if ((v12 & 1) == 0)
  {
    id v21 = objc_alloc((Class)NSError);
    v28[0] = &off_1000369F0;
    v27[0] = @"Line";
    v27[1] = @"Function";
    id v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager commitServiceSettings:completionHandler:]");
    v28[1] = v22;
    void v28[2] = @"Settings conflict detected. Try again.";
    v27[2] = NSDebugDescriptionErrorKey;
    v27[3] = @"Generation";
    char v23 = [v6 generation];
    id v24 = [v23 description];
    v28[3] = v24;
    v27[4] = @"ExpectedGeneration";
    BOOL v25 = [v8 description];
    void v28[4] = v25;
    id v26 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:5];
    id v20 = [v21 initWithDomain:_SWCErrorDomain code:1000 userInfo:v26];

    goto LABEL_7;
  }
  id v13 = [v6 serviceSpecifier];
  if (v13)
  {
    database = self->_database;
    id v15 = [v6 dictionaryRepresentation];
    [(SWCDatabase *)database setSettingsDictionary:v15 forServiceSpecifier:v13];

    id v16 = [(SWCDatabase *)self->_database settingsGeneration];
  }
  else
  {
    id v16 = 0;
  }

  id v20 = 0;
LABEL_10:
  v7[2](v7, v16, v20);
}

- (void)removeSettingsForKeys:(id)a3 serviceType:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, uint64_t, void *))a5;
  unsigned __int8 v11 = +[NSXPCConnection currentConnection];
  unsigned __int8 v12 = [(SWCManager *)self _connectionIsEntitled:v11 forMutation:1];

  if ((v12 & 1) == 0)
  {
    id v15 = objc_alloc((Class)NSError);
    v23[0] = &off_100036A08;
    v22[0] = @"Line";
    v22[1] = @"Function";
    id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager removeSettingsForKeys:serviceType:completionHandler:]");
    v22[2] = NSDebugDescriptionErrorKey;
    v23[1] = v16;
    v23[2] = @"Entitlement required to mutate SWC database";
    id v17 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
    id v18 = [v15 initWithDomain:_SWCErrorDomain code:1 userInfo:v17];
LABEL_8:
    id v13 = v18;

    uint64_t v14 = 0;
    goto LABEL_9;
  }
  if (!v9 || v8 && (_NSIsNSSet() & 1) == 0)
  {
    id v19 = objc_alloc((Class)NSError);
    v20[0] = @"Line";
    v20[1] = @"Function";
    v21[0] = &off_100036A20;
    id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager removeSettingsForKeys:serviceType:completionHandler:]");
    v21[1] = v16;
    id v17 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    id v18 = [v19 initWithDomain:_SWCErrorDomain code:2 userInfo:v17];
    goto LABEL_8;
  }
  id v13 = 0;
  [(SWCDatabase *)self->_database removeSettingsForKeys:v8 serviceType:v9];
  uint64_t v14 = 1;
LABEL_9:
  v10[2](v10, v14, v13);
}

- (void)removeSettingsForKeys:(id)a3 serviceSpecifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, uint64_t, void *))a5;
  unsigned __int8 v11 = +[NSXPCConnection currentConnection];
  unsigned __int8 v12 = [(SWCManager *)self _connectionIsEntitled:v11 forMutation:1];

  if ((v12 & 1) == 0)
  {
    id v20 = objc_alloc((Class)NSError);
    v26[0] = &off_100036A38;
    v25[0] = @"Line";
    v25[1] = @"Function";
    id v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager removeSettingsForKeys:serviceSpecifier:completionHandler:]");
    v25[2] = NSDebugDescriptionErrorKey;
    v26[1] = v17;
    v26[2] = @"Entitlement required to mutate SWC database";
    id v18 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
    id v19 = [v20 initWithDomain:_SWCErrorDomain code:1 userInfo:v18];
    goto LABEL_8;
  }
  if (v9)
  {
    id v13 = [v9 serviceType];
    uint64_t v14 = v13;
    if (v13)
    {
      if (v8)
      {
        char v15 = _NSIsNSSet();

        if ((v15 & 1) == 0) {
          goto LABEL_6;
        }
      }
      else
      {
      }
      id v21 = 0;
      [(SWCDatabase *)self->_database removeSettingsForKeys:v8 serviceSpecifier:v9];
      uint64_t v22 = 1;
      goto LABEL_9;
    }
  }
LABEL_6:
  id v16 = objc_alloc((Class)NSError);
  v23[0] = @"Line";
  v23[1] = @"Function";
  v24[0] = &off_100036A50;
  id v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager removeSettingsForKeys:serviceSpecifier:completionHandler:]");
  v24[1] = v17;
  id v18 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  id v19 = [v16 initWithDomain:_SWCErrorDomain code:2 userInfo:v18];
LABEL_8:
  id v21 = v19;

  uint64_t v22 = 0;
LABEL_9:
  v10[2](v10, v22, v21);
}

- (void)getDeveloperModeEnabledWithCompletionHandler:(id)a3
{
  id v5 = (void (**)(id, void *, void))a3;
  id v4 = +[NSNumber numberWithBool:[(SWCManager *)self _isDeveloperModeEnabled]];
  v5[2](v5, v4, 0);
}

- (void)setDeveloperModeEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  BOOL v7 = +[NSXPCConnection currentConnection];
  unsigned __int8 v8 = [(SWCManager *)self _connectionIsEntitled:v7 forMutation:1];

  if (v8)
  {
    if ([(SWCManager *)self _isDeveloperModeEnabled] == v4)
    {
      v6[2](v6, 1, 0);
    }
    else if (v4)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10001C620;
      v16[3] = &unk_1000350D8;
      v16[4] = self;
      id v17 = v6;
      [(SWCManager *)self _authorizeDeveloperModeChangeWithCompletionHandler:v16];
    }
    else
    {
      id v15 = 0;
      BOOL v13 = [(SWCManager *)self _setDeveloperModeEnabled:0 error:&v15];
      id v14 = v15;
      ((void (**)(id, uint64_t, id))v6)[2](v6, v13, v14);
    }
  }
  else
  {
    id v9 = objc_alloc((Class)NSError);
    v19[0] = &off_100036A68;
    v18[0] = @"Line";
    v18[1] = @"Function";
    unsigned __int8 v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager setDeveloperModeEnabled:completionHandler:]");
    v18[2] = NSDebugDescriptionErrorKey;
    v19[1] = v10;
    v19[2] = @"Entitlement required to enable Associated Domains developer mode.";
    unsigned __int8 v11 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
    id v12 = [v9 initWithDomain:_SWCErrorDomain code:1 userInfo:v11];

    ((void (**)(id, uint64_t, id))v6)[2](v6, 0, v12);
  }
}

- (void)setAdditionalServiceDetailsForApplicationIdentifiers:(id)a3 usingContentsOfDictionary:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, BOOL, id))a5;
  unsigned __int8 v11 = +[NSXPCConnection currentConnection];
  if (![(SWCManager *)self _connectionIsEntitled:v11 forMutation:1])
  {
    id v18 = objc_alloc((Class)NSError);
    v34[0] = &off_100036A80;
    v33[0] = @"Line";
    v33[1] = @"Function";
    id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager setAdditionalServiceDetailsForApplicationIdentifiers:usingContentsOfDictionary:completionHandler:]");
    void v33[2] = NSDebugDescriptionErrorKey;
    v34[1] = v12;
    v34[2] = @"Entitlement required to mutate SWC database";
    BOOL v13 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
    id v19 = [v18 initWithDomain:_SWCErrorDomain code:1 userInfo:v13];
LABEL_12:
    id v15 = v19;
    goto LABEL_13;
  }
  if (!v8 || !_NSIsNSSet() || ![v8 count])
  {
    id v20 = objc_alloc((Class)NSError);
    v32[0] = &off_100036A98;
    v31[0] = @"Line";
    v31[1] = @"Function";
    id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager setAdditionalServiceDetailsForApplicationIdentifiers:usingContentsOfDictionary:completionHandler:]");
    void v31[2] = NSDebugDescriptionErrorKey;
    v32[1] = v12;
    void v32[2] = @"Invalid app ID list.";
    BOOL v13 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
    id v19 = [v20 initWithDomain:_SWCErrorDomain code:2 userInfo:v13];
    goto LABEL_12;
  }
  if (!v9 || (_NSIsNSDictionary() & 1) == 0)
  {
    id v21 = objc_alloc((Class)NSError);
    v30[0] = &off_100036AB0;
    v29[0] = @"Line";
    v29[1] = @"Function";
    id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager setAdditionalServiceDetailsForApplicationIdentifiers:usingContentsOfDictionary:completionHandler:]");
    void v29[2] = NSDebugDescriptionErrorKey;
    v30[1] = v12;
    void v30[2] = @"Invalid domain-to-JSON dictionary.";
    BOOL v13 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
    id v19 = [v21 initWithDomain:_SWCErrorDomain code:2 userInfo:v13];
    goto LABEL_12;
  }
  id v12 = [(SWCManager *)self _filterApplicationIdentifiers:v8 toMatchEntitlementOfXPCConnection:v11];
  id v26 = 0;
  BOOL v13 = [(SWCManager *)self _createStagingDirectoryForAdditionalServiceDetailsReturningError:&v26];
  id v14 = v26;
  id v15 = v14;
  if (!v13)
  {
LABEL_13:
    BOOL v16 = 0;
    goto LABEL_14;
  }
  id v25 = v14;
  BOOL v16 = [(SWCManager *)self _addJSONDataInDictionary:v9 toStagingDirectoryAtURL:v13 error:&v25];
  id v17 = v25;

  if (v16)
  {
    id v24 = v17;
    BOOL v16 = [(SWCManager *)self _copyStagingDirectoryAtURL:v13 toAdditionalServiceDetailsDirectoriesForApplicationIdentifiers:v12 error:&v24];
    id v15 = v24;
  }
  else
  {
    id v15 = v17;
  }
  uint64_t v22 = +[NSFileManager defaultManager];
  [v22 removeItemAtURL:v13 error:0];

  if (v16)
  {
    char v23 = sub_100017F24();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Updating all apps after updating additional service details for %@", buf, 0xCu);
    }

    BOOL v16 = 1;
    [(SWCManager *)self updateEntriesForAllBundlesIgnoringCurrentState:1];
  }
LABEL_14:

  v10[2](v10, v16, v15);
}

- (SWCDatabase)database
{
  return (SWCDatabase *)objc_getProperty(self, a2, 24, 1);
}

- (SWCDownloader)downloader
{
  return (SWCDownloader *)objc_getProperty(self, a2, 32, 1);
}

- (SWCDownloadScheduler)downloadScheduler
{
  return (SWCDownloadScheduler *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadScheduler, 0);
  objc_storeStrong((id *)&self->_downloader, 0);
  objc_storeStrong((id *)&self->_database, 0);

  objc_storeStrong((id *)&self->_xpcListener, 0);
}

- (id).cxx_construct
{
  *((_WORD *)self + 8) = 0;
  return self;
}

- (void)_addEntriesForAllBundlesWithEnumerator:(id)a3 toWorkingSet:(id)a4 enterpriseContext:(id)a5 developerModeEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v15);
        id v18 = +[SWCEntry entriesForBundleRecord:v16 enterpriseContext:v11 developerModeEnabled:v6];
        if ([v18 count]) {
          [v10 unionOrderedSet:v18];
        }

        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }
}

- (id)_eligibleSystemPlaceholderRecords
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [&off_100036BE0 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(&off_100036BE0);
        }
        uint64_t v6 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v7 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v6 allowPlaceholder:1 error:0];
        if (!v7)
        {
          id v8 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifierOfSystemPlaceholder:v6 error:0];
          if (v8) {
            [v2 addObject:v8];
          }
        }
      }
      id v3 = [&off_100036BE0 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }

  return v2;
}

- (void)_updateAllEntries:(id)a3
{
  id v33 = a3;
  id v34 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v37 = objc_alloc_init((Class)NSMutableOrderedSet);
  database = self->_database;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10001D8E0;
  v43[3] = &unk_100034CE0;
  id v5 = v33;
  id v44 = v5;
  id v36 = v34;
  id v45 = v36;
  [(SWCDatabase *)database enumerateEntriesWithBlock:v43];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v40;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v8);
        long long v10 = [(SWCDatabase *)self->_database entry:v9];
        if (!v10)
        {
          [v37 addObject:v9];
          goto LABEL_14;
        }
        id v11 = v9;
        int v12 = *(unsigned __int16 *)[v11 fields];
        id v13 = v10;
        if (((*(unsigned __int16 *)[v13 fields] ^ v12) & 0x1C00) != 0)
        {
          [v36 addObject:v13];
          [v37 addObject:v11];
          if ((*(_WORD *)[v11 fields] & 0x1C00) != 0) {
            goto LABEL_19;
          }
          if (qword_10003B290 != -1) {
            dispatch_once(&qword_10003B290, &stru_1000351C0);
          }
          uint64_t v14 = qword_10003B288;
          if (os_log_type_enabled((os_log_t)qword_10003B288, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v47 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Entry %@ needs its JSON updated because it moved from on-disk to network", buf, 0xCu);
          }
          goto LABEL_14;
        }
        id v18 = v11;
        if ((*(_WORD *)[v18 fields] & 0x1C00) == 0xC00)
        {
          [v36 addObject:v13];
          [v37 addObject:v18];
        }
        else
        {
          id v19 = [v18 applicationPersistentIdentifier];
          uint64_t v20 = [v13 applicationPersistentIdentifier];
          long long v21 = (void *)v20;
          if (!v19 || !v20) {
            goto LABEL_37;
          }
          uint64_t v22 = _LSPersistentIdentifierCompare();

          if (!v22)
          {
            id v19 = [v18 applicationVersion];
            long long v21 = [v13 applicationVersion];
            if ([v18 isDownloadable] && objc_msgSend(v19, "isEqual:", v21))
            {
              if (qword_10003B290 != -1) {
                dispatch_once(&qword_10003B290, &stru_1000351C0);
              }
              long long v23 = qword_10003B288;
              if (os_log_type_enabled((os_log_t)qword_10003B288, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v47 = v13;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Entry %@ has moved databases but hasn't changed versions; we won't download new JSON right now",
                  buf,
                  0xCu);
              }

              uint64_t v16 = [v18 applicationPersistentIdentifier];
              [v13 setApplicationPersistentIdentifier:v16];
LABEL_16:

              goto LABEL_19;
            }
            if (qword_10003B290 != -1) {
              dispatch_once(&qword_10003B290, &stru_1000351C0);
            }
            id v24 = qword_10003B288;
            if (os_log_type_enabled((os_log_t)qword_10003B288, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v47 = v13;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Entry %@ has moved databases, and it has changed versions or it is from on-disk, will update JSON", buf, 0xCu);
            }
LABEL_37:

LABEL_38:
            if (qword_10003B290 != -1) {
              dispatch_once(&qword_10003B290, &stru_1000351C0);
            }
            id v25 = qword_10003B288;
            if (os_log_type_enabled((os_log_t)qword_10003B288, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v47 = v13;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Entry %@ needs its JSON updated because the app PI changed", buf, 0xCu);
            }
            [v36 addObject:v13];
            [v37 addObject:v18];
LABEL_14:
            if (![v9 isDownloadable]) {
              goto LABEL_19;
            }
            downloader = self->_downloader;
            uint64_t v16 = [v9 domain];
            id v17 = [v9 applicationIdentifier];
            [(SWCDownloader *)downloader downloadAASAFileForDomain:v16 applicationIdentifier:v17 completionHandler:0];

            goto LABEL_16;
          }
          if (v22 != 100) {
            goto LABEL_38;
          }
        }
LABEL_19:

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v26 = [obj countByEnumeratingWithState:&v39 objects:v50 count:16];
      id v6 = v26;
    }
    while (v26);
  }

  if ([v36 count])
  {
    if (qword_10003B290 != -1) {
      dispatch_once(&qword_10003B290, &stru_1000351C0);
    }
    id v28 = (id)qword_10003B288;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      id v30 = [v36 count];
      *(_DWORD *)buf = 134218242;
      id v47 = v30;
      __int16 v48 = 2112;
      id v49 = v36;
      _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Removing %llu entries: %@", buf, 0x16u);
    }

    [(SWCDatabase *)self->_database removeEntries:v36];
  }
  if ([v37 count])
  {
    if (qword_10003B290 != -1) {
      dispatch_once(&qword_10003B290, &stru_1000351C0);
    }
    id v29 = (id)qword_10003B288;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      id v31 = [v37 count];
      *(_DWORD *)buf = 134218242;
      id v47 = v31;
      __int16 v48 = 2112;
      id v49 = v37;
      _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Adding %llu entries: %@", buf, 0x16u);
    }

    [(SWCDatabase *)self->_database addEntries:v37];
  }
  if ([v36 count]) {
    [(SWCDatabase *)self->_database cleanOldSettings];
  }
  [(SWCDatabase *)self->_database scheduleNextSave];
  [(SWCDownloadScheduler *)self->_downloadScheduler update];
}

- (id)_entriesWithServiceSpecifier:(id)a3 URL:(id)a4 limit:(unint64_t)a5 auditToken:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  if (v10) {
    id v11 = [objc_alloc((Class)NSURLComponents) initWithURL:v10 resolvingAgainstBaseURL:1];
  }
  else {
    id v11 = 0;
  }
  id v13 = objc_alloc_init((Class)NSMutableArray);
  database = self->_database;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10001DBA0;
  v27[3] = &unk_100035100;
  id v15 = v9;
  id v28 = v15;
  id v16 = v11;
  id v29 = v16;
  long long v17 = *(_OWORD *)&a6->var0[4];
  long long v31 = *(_OWORD *)a6->var0;
  long long v32 = v17;
  id v18 = v13;
  id v30 = v18;
  [(SWCDatabase *)database enumerateEntriesMatchingServiceSpecifier:v15 block:v27];

  uint64_t v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  id v24 = sub_10001DEEC;
  id v25 = &unk_100035128;
  id v19 = v16;
  id v26 = v19;
  [v18 sortWithOptions:16 usingComparator:&v22];
  id v20 = [v18 copy:v22, v23, v24, v25];

  return v20;
}

- (id)_serviceDetailsWithEntry:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)_SWCServiceDetails);
  id v5 = [v3 serviceSpecifier];
  id v6 = v3;
  id v7 = [v4 _initWithServiceSpecifier:v5 fields:[v6 fields]];

  return v7;
}

- (void)_waitForSiteApprovalWithServiceSpecifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (![v6 isFullySpecified])
  {
    id v11 = objc_alloc((Class)NSError);
    v36[0] = @"Line";
    v36[1] = @"Function";
    v37[0] = &off_100036AF8;
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager(Private) _waitForSiteApprovalWithServiceSpecifier:completionHandler:]");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v37[1] = v9;
    id v12 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
    id v13 = [v11 initWithDomain:_SWCErrorDomain code:2 userInfo:v12];
    v7[2](v7, 0, v13);
    goto LABEL_20;
  }
  id v8 = [(SWCDatabase *)self->_database entryMatchingServiceSpecifier:v6];
  if (!v8)
  {
    id v14 = objc_alloc((Class)NSError);
    v39[0] = &off_100036AE0;
    v38[0] = @"Line";
    v38[1] = @"Function";
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager(Private) _waitForSiteApprovalWithServiceSpecifier:completionHandler:]");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v38[2] = NSDebugDescriptionErrorKey;
    v39[1] = v12;
    v39[2] = @"The specified service was not found in the SWC database.";
    id v13 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
    id v15 = [v14 initWithDomain:_SWCErrorDomain code:3 userInfo:v13];
    v7[2](v7, 0, v15);

    id v9 = 0;
    goto LABEL_20;
  }
  id v9 = v8;
  if ((*(_WORD *)[v9 fields] & 0xC) == 0)
  {
    id v16 = [v9 retryCount];
    if (v16)
    {
      long long v17 = [v9 retryCount];
      id v18 = [v17 unsignedIntegerValue];
      id v19 = +[_SWCPrefs sharedPrefs];
      id v20 = [v19 maximumRetryCount];

      if (v18 > v20)
      {
        if (qword_10003B290 != -1) {
          dispatch_once(&qword_10003B290, &stru_1000351C0);
        }
        long long v21 = (id)qword_10003B288;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = [v9 retryCount];
          uint64_t v23 = +[NSXPCConnection currentConnection];
          *(_DWORD *)buf = 138543874;
          id v43 = v22;
          __int16 v44 = 2112;
          id v45 = v9;
          __int16 v46 = 2048;
          uint64_t v47 = (int)[v23 processIdentifier];
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Exhausted retry attempts (%{public}@) for entry %@; will not attempt to download it on behalf of an interested caller %llu",
            buf,
            0x20u);
        }
        id v24 = [v9 lastError];
        id v25 = v24;
        if (v24)
        {
          id v12 = v24;
        }
        else
        {
          id v28 = objc_alloc((Class)NSError);
          v40[0] = @"Line";
          v40[1] = @"Function";
          v41[0] = &off_100036AC8;
          id v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager(Private) _waitForSiteApprovalWithServiceSpecifier:completionHandler:]");
          v41[1] = v29;
          id v30 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
          id v12 = [v28 initWithDomain:_SWCErrorDomain code:-1 userInfo:v30];
        }
        v7[2](v7, 0, v12);
        goto LABEL_21;
      }
    }
    id v12 = [v6 SWCDomain];
    downloader = self->_downloader;
    char v27 = [v6 SWCApplicationIdentifier];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    void v33[2] = sub_10001E894;
    void v33[3] = &unk_100035178;
    long long v35 = v7;
    id v9 = v9;
    id v34 = v9;
    [(SWCDownloader *)downloader downloadAASAFileForDomain:v12 applicationIdentifier:v27 completionHandler:v33];

    id v13 = v35;
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  if (qword_10003B290 != -1) {
    dispatch_once(&qword_10003B290, &stru_1000351C0);
  }
  id v10 = (id)qword_10003B288;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    [v9 fields];
    _SWCServiceApprovalStateGetDebugDescription();
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    long long v32 = +[NSXPCConnection currentConnection];
    *(_DWORD *)buf = 138412802;
    id v43 = v9;
    __int16 v44 = 2114;
    id v45 = v31;
    __int16 v46 = 2048;
    uint64_t v47 = (int)[v32 processIdentifier];
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Entry %@ already has approval state %{public}@, skipping download for interested caller %llu", buf, 0x20u);
  }
  ((void (**)(id, id, id))v7)[2](v7, v9, 0);
LABEL_22:
}

- (id)_developerModeSemaphoreURL
{
  id v2 = +[_SWCPrefs sharedPrefs];
  id v3 = [v2 containerURLReturningError:0];

  id v4 = [v3 URLByAppendingPathComponent:@".developerMode" isDirectory:0];

  return v4;
}

- (void)_authorizeDeveloperModeChangeWithCompletionHandler:(id)a3
{
}

- (BOOL)_setDeveloperModeEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  id v7 = [(SWCManager *)self _developerModeSemaphoreURL];
  if (!v7)
  {
    if (a4)
    {
      id v11 = objc_alloc((Class)NSError);
      v20[0] = &off_100036B10;
      v19[0] = @"Line";
      v19[1] = @"Function";
      id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager(Private) _setDeveloperModeEnabled:error:]");
      v19[2] = NSDebugDescriptionErrorKey;
      v20[1] = v12;
      void v20[2] = @"Unable to find path to developer mode semaphore file.";
      id v13 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
      *a4 = [v11 initWithDomain:_SWCErrorDomain code:-1 userInfo:v13];
    }
    return 0;
  }
  if (!v5)
  {
    if (qword_10003B290 != -1) {
      dispatch_once(&qword_10003B290, &stru_1000351C0);
    }
    id v14 = qword_10003B288;
    if (os_log_type_enabled((os_log_t)qword_10003B288, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v18 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Disabling developer mode.", v18, 2u);
    }
    id v15 = +[NSFileManager defaultManager];
    unsigned int v16 = [v15 removeItemAtURL:v7 error:a4];

    if (!v16) {
      return 0;
    }
LABEL_16:
    self->_developerModeEnabled = (optional<BOOL>)(v5 | 0x100);
    [(SWCManager *)self updateEntriesForAllBundlesIgnoringCurrentState:1];
    return 1;
  }
  if (qword_10003B290 != -1) {
    dispatch_once(&qword_10003B290, &stru_1000351C0);
  }
  id v8 = qword_10003B288;
  if (os_log_type_enabled((os_log_t)qword_10003B288, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v18 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Enabling developer mode.", v18, 2u);
  }
  id v9 = +[NSData data];
  unsigned __int8 v10 = [v9 writeToURL:v7 options:1 error:a4];

  if (v10) {
    goto LABEL_16;
  }
  return 0;
}

- (BOOL)_isDeveloperModeEnabled
{
  if (self->_developerModeEnabled.__engaged_)
  {
    unsigned int null_state = self->_developerModeEnabled.var0.__null_state_;
  }
  else
  {
    id v4 = [(SWCManager *)self _developerModeSemaphoreURL];
    BOOL v5 = v4;
    if (v4) {
      unsigned int null_state = [v4 checkResourceIsReachableAndReturnError:0];
    }
    else {
      unsigned int null_state = 0;
    }

    self->_developerModeEnabled = (optional<BOOL>)(null_state | 0x100);
  }
  return null_state != 0;
}

- (id)_filterApplicationIdentifiers:(id)a3 toMatchEntitlementOfXPCConnection:(id)a4
{
  id v18 = a3;
  id v17 = a4;
  unsigned int v5 = [v17 processIdentifier];
  if (v5 == getpid())
  {
    if (qword_10003B290 != -1) {
      dispatch_once(&qword_10003B290, &stru_1000351C0);
    }
    id v6 = qword_10003B288;
    if (os_log_type_enabled((os_log_t)qword_10003B288, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Treating connection from self as entitled (additional service details check)", buf, 2u);
    }
    id v7 = v18;
    goto LABEL_24;
  }
  id v8 = [v17 valueForEntitlement:@"com.apple.private.swc.additional-service-details-provider"];
  if ([v8 isEqual:@"*"])
  {
    id v7 = v18;
LABEL_23:

    goto LABEL_24;
  }
  if (!v8)
  {
    id v7 = 0;
    goto LABEL_24;
  }
  if ((_NSIsNSArray() & 1) != 0
    || (id v25 = v8,
        +[NSArray arrayWithObjects:&v25 count:1],
        id v7 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        (id v8 = v7) != 0))
  {
    id v7 = objc_alloc_init((Class)NSMutableSet);
    objc_opt_class();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v18;
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v20;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (objc_opt_isKindOfClass())
          {
            id v14 = [v13 rawValue];
            unsigned int v15 = [v8 containsObject:v14];

            if (v15) {
              [v7 addObject:v13];
            }
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v10);
    }

    goto LABEL_23;
  }
LABEL_24:

  return v7;
}

- (id)_createStagingDirectoryForAdditionalServiceDetailsReturningError:(id *)a3
{
  id v5 = objc_alloc((Class)NSString);
  id v6 = +[NSUUID UUID];
  id v7 = [v6 UUIDString];
  id v8 = [v5 initWithFormat:@"AdditionalServiceDetails/staged-%@", v7];

  id v9 = +[_SWCPrefs sharedPrefs];
  id v19 = 0;
  id v10 = [v9 containerURLReturningError:&v19];
  id v11 = v19;
  id v12 = [v10 URLByAppendingPathComponent:v8 isDirectory:1];

  if (v12)
  {
    id v13 = +[NSFileManager defaultManager];
    id v18 = v11;
    unsigned int v14 = [v13 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v18];
    id v15 = v18;

    if (v14) {
      id v16 = v12;
    }
    else {
      id v16 = 0;
    }
    id v11 = v15;
  }
  else
  {
    id v16 = 0;
  }

  if (a3 && !v16) {
    *a3 = v11;
  }

  return v16;
}

- (BOOL)_addJSONDataInDictionary:(id)a3 toStagingDirectoryAtURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_10001F498;
  id v26 = sub_10001F4A8;
  id v27 = 0;
  id v9 = [v7 count];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001F4B0;
  void v13[3] = &unk_1000351A0;
  uint64_t v17 = objc_opt_class();
  id v10 = v8;
  id v14 = v10;
  id v15 = &v22;
  id v16 = &v18;
  [v7 enumerateKeysAndObjectsUsingBlock:v13];
  id v11 = (id)v19[3];
  if (a5 && v11 != v9) {
    *a5 = (id) v23[5];
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v11 == v9;
}

- (BOOL)_copyStagingDirectoryAtURL:(id)a3 toAdditionalServiceDetailsDirectoriesForApplicationIdentifiers:(id)a4 error:(id *)a5
{
  id v23 = a3;
  id v6 = a4;
  uint64_t v21 = (char *)[v6 count];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    id v8 = 0;
    id v9 = 0;
    uint64_t v10 = *(void *)v27;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v27 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * v11);
      id v25 = v9;
      id v14 = +[SWCEntry additionalServiceDetailsDirectoryURLForApplicationIdentifier:v12 createParentIfNeeded:1 error:&v25];
      id v15 = v25;

      if (v14)
      {
        id v16 = +[NSFileManager defaultManager];
        [v16 removeItemAtURL:v14 error:0];

        uint64_t v17 = +[NSFileManager defaultManager];
        id v24 = v15;
        unsigned int v18 = [v17 copyItemAtURL:v23 toURL:v14 error:&v24];
        id v9 = v24;

        v8 += v18;
      }
      else
      {
        unsigned int v18 = 0;
        id v9 = v15;
      }

      if (!v18) {
        break;
      }
      if (v7 == (id)++v11)
      {
        id v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v8 = 0;
    id v9 = 0;
  }

  if (a5 && v8 != v21) {
    *a5 = v9;
  }

  return v8 == v21;
}

@end