@interface CKKSViewManager
+ (id)manager;
+ (void)callSyncCallbackWithErrorNoAccount:(id)a3;
- (BOOL)allowClientRPC:(id *)a3;
- (BOOL)peekCallbackForUUID:(id)a3;
- (BOOL)waitForTrustReady;
- (CKContainer)container;
- (CKKSAccountStateTracker)accountTracker;
- (CKKSCloudKitClassDependencies)cloudKitClassDependencies;
- (CKKSCondition)completedSecCKKSInitialize;
- (CKKSLockStateTracker)lockStateTracker;
- (CKKSRateLimiter)globalRateLimiter;
- (CKKSReachabilityTracker)reachabilityTracker;
- (CKKSViewManager)initWithContainer:(id)a3 sosAdapter:(id)a4 accountStateTracker:(id)a5 lockStateTracker:(id)a6 reachabilityTracker:(id)a7 personaAdapter:(id)a8 cloudKitClassDependencies:(id)a9 accountsAdapter:(id)a10;
- (NSMutableDictionary)pendingSyncCallbacks;
- (NSOperationQueue)operationQueue;
- (NSSet)viewAllowList;
- (NSXPCListener)listener;
- (OTAccountsAdapter)accountsAdapter;
- (OTPersonaAdapter)personaAdapter;
- (OTSOSAdapter)sosPeerAdapter;
- (id)ckksAccountSyncForContainer:(id)a3 contextID:(id)a4;
- (id)claimCallbackForUUID:(id)a3;
- (id)currentTLKsFilteredByPolicy:(BOOL)a3 error:(id *)a4;
- (id)defaultViewError;
- (id)getGlobalRateLimiter;
- (id)pendingCallbackUUIDs;
- (id)restartCKKSAccountSync:(id)a3;
- (id)restartCKKSAccountSyncWithoutSettingPolicy:(id)a3;
- (id)sanitizeErrorDomain:(id)a3;
- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4;
- (void)deleteSEView:(id)a3 reply:(id)a4;
- (void)dropAllActors;
- (void)fetchPCSIdentityOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5;
- (void)fetchSEViewKeyHierarchy:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5;
- (void)getCurrentItemForAccessGroup:(id)a3 identifier:(id)a4 viewHint:(id)a5 fetchCloudValue:(BOOL)a6 complete:(id)a7;
- (void)getCurrentItemOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5;
- (void)haltAll;
- (void)handleKeychainEventDbConnection:(__OpaqueSecDbConnection *)a3 source:(unint64_t)a4 added:(SecDbItem *)a5 deleted:(SecDbItem *)a6;
- (void)lockStateChangeNotification:(BOOL)a3;
- (void)modifyTLKSharesForSEView:(id)a3 adding:(id)a4 deleting:(id)a5 reply:(id)a6;
- (void)notifyNewTLKsInKeychain;
- (void)pcsMirrorKeysForServices:(id)a3 reply:(id)a4;
- (void)performanceCounters:(id)a3;
- (void)proposeTLKForSEView:(id)a3 proposedTLK:(id)a4 wrappedOldTLK:(id)a5 tlkShares:(id)a6 reply:(id)a7;
- (void)registerSyncStatusCallback:(id)a3 callback:(id)a4;
- (void)rpcCKMetric:(id)a3 attributes:(id)a4 reply:(id)a5;
- (void)rpcFetchAndProcessChanges:(id)a3 classA:(BOOL)a4 onlyIfNoRecentFetch:(BOOL)a5 reply:(id)a6;
- (void)rpcGetCKDeviceIDWithReply:(id)a3;
- (void)rpcPushOutgoingChanges:(id)a3 reply:(id)a4;
- (void)rpcResetCloudKit:(id)a3 reason:(id)a4 reply:(id)a5;
- (void)rpcResetLocal:(id)a3 reply:(id)a4;
- (void)rpcResync:(id)a3 reply:(id)a4;
- (void)rpcResyncLocal:(id)a3 reply:(id)a4;
- (void)rpcStatus:(id)a3 fast:(BOOL)a4 waitForNonTransientState:(unint64_t)a5 reply:(id)a6;
- (void)setAccountTracker:(id)a3;
- (void)setAccountsAdapter:(id)a3;
- (void)setCloudKitClassDependencies:(id)a3;
- (void)setCompletedSecCKKSInitialize:(id)a3;
- (void)setContainer:(id)a3;
- (void)setCurrentItemForAccessGroup:(id)a3 hash:(id)a4 accessGroup:(id)a5 identifier:(id)a6 viewHint:(id)a7 replacing:(id)a8 hash:(id)a9 complete:(id)a10;
- (void)setGlobalRateLimiter:(id)a3;
- (void)setListener:(id)a3;
- (void)setLockStateTracker:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPendingSyncCallbacks:(id)a3;
- (void)setPersonaAdapter:(id)a3;
- (void)setReachabilityTracker:(id)a3;
- (void)setSosPeerAdapter:(id)a3;
- (void)setViewAllowList:(id)a3;
- (void)setupAnalytics;
- (void)syncBackupAndNotifyAboutSync;
- (void)toggleHavoc:(id)a3;
- (void)unsetCurrentItemsForAccessGroup:(id)a3 identifiers:(id)a4 viewHint:(id)a5 complete:(id)a6;
- (void)xpc24HrNotification;
@end

@implementation CKKSViewManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_pendingSyncCallbacks, 0);
  objc_storeStrong((id *)&self->_cloudKitClassDependencies, 0);
  objc_storeStrong((id *)&self->_viewAllowList, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_accountsAdapter, 0);
  objc_storeStrong((id *)&self->_sosPeerAdapter, 0);
  objc_storeStrong((id *)&self->_globalRateLimiter, 0);
  objc_storeStrong((id *)&self->_completedSecCKKSInitialize, 0);
  objc_storeStrong((id *)&self->_personaAdapter, 0);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_accountTracker, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPendingSyncCallbacks:(id)a3
{
}

- (NSMutableDictionary)pendingSyncCallbacks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCloudKitClassDependencies:(id)a3
{
}

- (CKKSCloudKitClassDependencies)cloudKitClassDependencies
{
  return (CKKSCloudKitClassDependencies *)objc_getProperty(self, a2, 96, 1);
}

- (void)setViewAllowList:(id)a3
{
}

- (NSSet)viewAllowList
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setListener:(id)a3
{
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAccountsAdapter:(id)a3
{
}

- (OTAccountsAdapter)accountsAdapter
{
  return (OTAccountsAdapter *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSosPeerAdapter:(id)a3
{
}

- (OTSOSAdapter)sosPeerAdapter
{
  return (OTSOSAdapter *)objc_getProperty(self, a2, 64, 1);
}

- (void)setGlobalRateLimiter:(id)a3
{
}

- (CKKSRateLimiter)globalRateLimiter
{
  return (CKKSRateLimiter *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCompletedSecCKKSInitialize:(id)a3
{
}

- (CKKSCondition)completedSecCKKSInitialize
{
  return (CKKSCondition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPersonaAdapter:(id)a3
{
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 40, 1);
}

- (void)setReachabilityTracker:(id)a3
{
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLockStateTracker:(id)a3
{
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccountTracker:(id)a3
{
}

- (CKKSAccountStateTracker)accountTracker
{
  return (CKKSAccountStateTracker *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContainer:(id)a3
{
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 8, 1);
}

- (void)dropAllActors
{
  id v2 = +[OTManager manager];
  [v2 dropAllActors];
}

- (void)haltAll
{
  id v2 = +[OTManager manager];
  [v2 haltAll];
}

- (void)xpc24HrNotification
{
  v3 = sub_1000CD884(@"ckks", 0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received a 24hr notification from XPC", buf, 2u);
  }

  if (![(CKKSViewManager *)self waitForTrustReady])
  {
    v4 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Trust not ready, still going ahead", v8, 2u);
    }
  }
  v5 = [(CKKSViewManager *)self ckksAccountSyncForContainer:@"com.apple.security.keychain" contextID:@"defaultContext"];
  v6 = +[CKOperationGroup CKKSGroupWithName:@"periodic-device-state-update"];
  id v7 = [v5 updateDeviceState:1 waitForKeyHierarchyInitialization:30000000000 ckoperationGroup:v6];
  [v5 xpc24HrNotification];
}

- (void)pcsMirrorKeysForServices:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  v8 = +[OTManager manager];
  id v9 = objc_alloc_init((Class)OTControlArguments);
  id v15 = 0;
  v10 = [v8 ckksForClientRPC:v9 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v15];
  id v11 = v15;

  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    [v10 pcsMirrorKeysForServices:v6 reply:v7];
  }
  else
  {
    v13 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v17 = @"com.apple.security.keychain";
      __int16 v18 = 2112;
      CFStringRef v19 = @"defaultContext";
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
    }

    if (v11)
    {
      v7[2](v7, 0, v11);
    }
    else
    {
      v14 = [(CKKSViewManager *)self defaultViewError];
      v7[2](v7, 0, v14);
    }
  }
}

- (void)toggleHavoc:(id)a3
{
  v4 = (void (**)(id, void, id))a3;
  id v15 = 0;
  unsigned __int8 v5 = [(CKKSViewManager *)self allowClientRPC:&v15];
  id v6 = (__CFString *)v15;
  if (v5)
  {
    id v7 = +[OTManager manager];
    id v8 = objc_alloc_init((Class)OTControlArguments);
    id v14 = 0;
    id v9 = [v7 ckksForClientRPC:v8 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v14];
    id v10 = v14;

    if (!v9 || v10)
    {
      BOOL v12 = sub_1000CD884(@"ckks", 0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        CFStringRef v17 = @"com.apple.security.keychain";
        __int16 v18 = 2112;
        CFStringRef v19 = @"defaultContext";
        __int16 v20 = 2112;
        id v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v10)
      {
        v4[2](v4, 0, v10);
      }
      else
      {
        v13 = [(CKKSViewManager *)self defaultViewError];
        v4[2](v4, 0, v13);
      }
    }
    else
    {
      [v9 toggleHavoc:v4];
    }
  }
  else
  {
    id v11 = sub_10000B070("ckks");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Rejecting a toggleHavoc RPC: %@", buf, 0xCu);
    }

    v4[2](v4, 0, v6);
  }
}

- (void)deleteSEView:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v22 = 0;
  unsigned __int8 v8 = [(CKKSViewManager *)self allowClientRPC:&v22];
  id v9 = (__CFString *)v22;
  if (v8)
  {
    id v10 = +[OTManager manager];
    id v11 = objc_alloc_init((Class)OTControlArguments);
    id v21 = 0;
    BOOL v12 = [v10 ckksForClientRPC:v11 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v21];
    id v13 = v21;

    if (!v12 || v13)
    {
      id v15 = sub_1000CD884(@"ckks", 0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        CFStringRef v26 = @"com.apple.security.keychain";
        __int16 v27 = 2112;
        CFStringRef v28 = @"defaultContext";
        __int16 v29 = 2112;
        id v30 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v13)
      {
        v7[2](v7, v13);
      }
      else
      {
        NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
        v16 = +[NSString stringWithFormat:@"No CKKS for %@, %@", @"com.apple.security.keychain", @"defaultContext"];
        v24 = v16;
        CFStringRef v17 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        __int16 v18 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:11 userInfo:v17];
        v7[2](v7, v18);
      }
    }
    else
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10010C3DC;
      v19[3] = &unk_1002FA768;
      v19[4] = self;
      __int16 v20 = v7;
      [v12 resetExternallyManagedCloudKitView:v6 reply:v19];
    }
  }
  else
  {
    id v14 = sub_10000B070("ckks");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rejecting a deleteSEView RPC: %@", buf, 0xCu);
    }

    v7[2](v7, v9);
  }
}

- (void)modifyTLKSharesForSEView:(id)a3 adding:(id)a4 deleting:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, id))a6;
  id v29 = 0;
  unsigned __int8 v14 = [(CKKSViewManager *)self allowClientRPC:&v29];
  id v15 = (__CFString *)v29;
  if (v14)
  {
    v16 = +[OTManager manager];
    id v17 = objc_alloc_init((Class)OTControlArguments);
    id v28 = 0;
    __int16 v18 = [v16 ckksForClientRPC:v17 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v28];
    id v19 = v28;

    if (!v18 || v19)
    {
      id v22 = sub_1000CD884(@"ckks", 0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        CFStringRef v33 = @"com.apple.security.keychain";
        __int16 v34 = 2112;
        CFStringRef v35 = @"defaultContext";
        __int16 v36 = 2112;
        id v37 = v19;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v19)
      {
        v13[2](v13, v19);
LABEL_14:

        goto LABEL_15;
      }
      NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
      uint64_t v25 = +[NSString stringWithFormat:@"No CKKS for %@, %@", @"com.apple.security.keychain", @"defaultContext"];
      uint64_t v31 = v25;
      NSErrorUserInfoKey v23 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      v24 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:11 userInfo:v23];
      v13[2](v13, v24);

      __int16 v20 = (void *)v25;
    }
    else
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10010C7A4;
      v26[3] = &unk_1002FA768;
      v26[4] = self;
      __int16 v27 = v13;
      [v18 modifyTLKSharesForExternallyManagedView:v10 adding:v11 deleting:v12 reply:v26];
      __int16 v20 = v27;
    }

    goto LABEL_14;
  }
  id v21 = sub_10000B070("ckks");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v33 = v15;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Rejecting a modifyTLKShares RPC: %@", buf, 0xCu);
  }

  v13[2](v13, v15);
LABEL_15:
}

- (void)fetchSEViewKeyHierarchy:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v24 = 0;
  unsigned __int8 v10 = [(CKKSViewManager *)self allowClientRPC:&v24];
  id v11 = (__CFString *)v24;
  if (v10)
  {
    id v12 = +[OTManager manager];
    id v13 = objc_alloc_init((Class)OTControlArguments);
    id v23 = 0;
    unsigned __int8 v14 = [v12 ckksForClientRPC:v13 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v23];
    id v15 = v23;

    if (!v14 || v15)
    {
      id v17 = sub_1000CD884(@"ckks", 0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        CFStringRef v28 = @"com.apple.security.keychain";
        __int16 v29 = 2112;
        CFStringRef v30 = @"defaultContext";
        __int16 v31 = 2112;
        id v32 = v15;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v15)
      {
        (*((void (**)(id, void, void, void, id))v9 + 2))(v9, 0, 0, 0, v15);
      }
      else
      {
        NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
        __int16 v18 = +[NSString stringWithFormat:@"No CKKS for %@, %@", @"com.apple.security.keychain", @"defaultContext"];
        CFStringRef v26 = v18;
        id v19 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        __int16 v20 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:11 userInfo:v19];
        (*((void (**)(id, void, void, void, void *))v9 + 2))(v9, 0, 0, 0, v20);
      }
    }
    else
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10010CB70;
      v21[3] = &unk_1002FA790;
      v21[4] = self;
      id v22 = v9;
      [v14 fetchExternallyManagedViewKeyHierarchy:v8 forceFetch:v6 reply:v21];
    }
  }
  else
  {
    v16 = sub_10000B070("ckks");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Rejecting a fetchSEViewHierarchy RPC: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, void, void, __CFString *))v9 + 2))(v9, 0, 0, 0, v11);
  }
}

- (void)proposeTLKForSEView:(id)a3 proposedTLK:(id)a4 wrappedOldTLK:(id)a5 tlkShares:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, id))a7;
  id v33 = 0;
  unsigned __int8 v17 = [(CKKSViewManager *)self allowClientRPC:&v33];
  __int16 v18 = (__CFString *)v33;
  if (v17)
  {
    id v29 = v12;
    id v19 = +[OTManager manager];
    id v20 = objc_alloc_init((Class)OTControlArguments);
    id v32 = 0;
    id v21 = [v19 ckksForClientRPC:v20 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v32];
    id v22 = v32;

    if (!v21 || v22)
    {
      NSErrorUserInfoKey v25 = sub_1000CD884(@"ckks", 0);
      id v12 = v29;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        CFStringRef v37 = @"com.apple.security.keychain";
        __int16 v38 = 2112;
        CFStringRef v39 = @"defaultContext";
        __int16 v40 = 2112;
        id v41 = v22;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v22)
      {
        v16[2](v16, v22);
LABEL_14:

        goto LABEL_15;
      }
      NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
      uint64_t v28 = +[NSString stringWithFormat:@"No CKKS for %@, %@", @"com.apple.security.keychain", @"defaultContext"];
      uint64_t v35 = v28;
      CFStringRef v26 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      __int16 v27 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:11 userInfo:v26];
      v16[2](v16, v27);

      id v12 = v29;
      id v23 = (void *)v28;
    }
    else
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10010CFAC;
      v30[3] = &unk_1002FA768;
      v30[4] = self;
      __int16 v31 = v16;
      id v12 = v29;
      [v21 proposeTLKForExternallyManagedView:v29 proposedTLK:v13 wrappedOldTLK:v14 tlkShares:v15 reply:v30];
      id v23 = v31;
    }

    goto LABEL_14;
  }
  id v24 = sub_10000B070("ckks");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v37 = v18;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Rejecting a proposeTLK RPC: %@", buf, 0xCu);
  }

  v16[2](v16, v18);
LABEL_15:
}

- (id)sanitizeErrorDomain:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    unsigned __int8 v5 = [v3 domain];
    unsigned int v6 = [v5 isEqualToString:@"securityd"];

    if (v6)
    {
      id v7 = [v4 code];
      id v8 = [v4 userInfo];
      id v9 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v7 userInfo:v8];
      unsigned __int8 v10 = CKXPCSuitableError();
    }
    else
    {
      unsigned __int8 v10 = CKXPCSuitableError();
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (void)rpcCKMetric:(id)a3 attributes:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, void))a5;
  id v21 = 0;
  unsigned __int8 v11 = [(CKKSViewManager *)self allowClientRPC:&v21];
  id v12 = v21;
  if (v11)
  {
    if (v8)
    {
      v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      __int16 v18 = sub_10010D31C;
      id v19 = &unk_1002FA740;
      id v20 = [[SecEventMetric alloc] initWithEventName:v8];
      id v13 = v20;
      [v9 enumerateKeysAndObjectsUsingBlock:&v16];
      id v14 = +[SecMetrics managerObject];
      [v14 submitEvent:v13];

      v10[2](v10, 0);
    }
    else
    {
      id v13 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:51 description:@"No metric name"];
      ((void (**)(id, SecEventMetric *))v10)[2](v10, v13);
    }
  }
  else
  {
    id v15 = sub_10000B070("ckks");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rejecting a ckmetric RPC: %@", buf, 0xCu);
    }

    ((void (**)(id, id))v10)[2](v10, v12);
  }
}

- (void)rpcGetCKDeviceIDWithReply:(id)a3
{
  id v10 = 0;
  v4 = (void (**)(id, void *))a3;
  unsigned __int8 v5 = [(CKKSViewManager *)self allowClientRPC:&v10];
  id v6 = v10;
  if (v5)
  {
    id v7 = [(CKKSViewManager *)self accountTracker];
    id v8 = [v7 ckdeviceID];
    v4[2](v4, v8);

    v4 = (void (**)(id, void *))v7;
  }
  else
  {
    id v9 = sub_10000B070("ckks");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Rejecting a push RPC: %@", buf, 0xCu);
    }

    v4[2](v4, @"error");
  }
}

- (void)rpcPushOutgoingChanges:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v30 = 0;
  unsigned __int8 v8 = [(CKKSViewManager *)self allowClientRPC:&v30];
  id v9 = (__CFString *)v30;
  if (v8)
  {
    id v10 = +[OTManager manager];
    id v11 = objc_alloc_init((Class)OTControlArguments);
    id v29 = 0;
    id v12 = [v10 ckksForClientRPC:v11 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v29];
    id v24 = v29;

    if (!v12 || v24)
    {
      __int16 v18 = sub_1000CD884(@"ckks", 0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        CFStringRef v32 = @"com.apple.security.keychain";
        __int16 v33 = 2112;
        CFStringRef v34 = @"defaultContext";
        __int16 v35 = 2112;
        id v36 = v24;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v24)
      {
        v7[2](v7, v24);
      }
      else
      {
        id v19 = [(CKKSViewManager *)self defaultViewError];
        v7[2](v7, v19);
      }
    }
    else
    {
      id v13 = objc_alloc_init(CKKSResultOperation);
      [(CKKSResultOperation *)v13 setName:@"rpc-push"];
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v13);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10010D8E8;
      v25[3] = &unk_100306A38;
      objc_copyWeak(&v27, &location);
      CFStringRef v26 = v7;
      [(CKKSResultOperation *)v13 setCompletionBlock:v25];
      id v14 = [(__CFString *)v12 zoneName];
      id v15 = sub_1000CD884(@"ckks-rpc", v14);

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v32 = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Beginning push for %@", buf, 0xCu);
      }

      if (v6)
      {
        v16 = +[NSSet setWithObject:v6];
      }
      else
      {
        v16 = 0;
      }
      id v20 = +[CKOperationGroup CKKSGroupWithName:@"rpc-push"];
      id v21 = [(__CFString *)v12 rpcProcessOutgoingQueue:v16 operationGroup:v20];

      if (v6) {
      [(CKKSResultOperation *)v13 addSuccessDependency:v21];
      }
      id v22 = [(CKKSViewManager *)self operationQueue];
      id v23 = [(CKKSResultOperation *)v13 timeout:300000000000];
      [v22 addOperation:v23];

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v17 = sub_10000B070("ckks");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Rejecting a push RPC: %@", buf, 0xCu);
    }

    v7[2](v7, v9);
  }
}

- (void)rpcFetchAndProcessChanges:(id)a3 classA:(BOOL)a4 onlyIfNoRecentFetch:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (void (**)(id, id))a6;
  if (sub_1000B14D4())
  {
    id v37 = 0;
    unsigned __int8 v12 = [(CKKSViewManager *)self allowClientRPC:&v37];
    id v13 = (__CFString *)v37;
    if (v12)
    {
      id v14 = +[OTManager manager];
      id v15 = objc_alloc_init((Class)OTControlArguments);
      id v36 = 0;
      v16 = [v14 ckksForClientRPC:v15 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v36];
      id v17 = v36;

      if (!v16 || v17)
      {
        id v23 = sub_1000CD884(@"ckks", 0);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          CFStringRef v39 = @"com.apple.security.keychain";
          __int16 v40 = 2112;
          CFStringRef v41 = @"defaultContext";
          __int16 v42 = 2112;
          id v43 = v17;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
        }

        if (v17)
        {
          v11[2](v11, v17);
        }
        else
        {
          id v30 = [(CKKSViewManager *)self defaultViewError];
          v11[2](v11, v30);
        }
      }
      else
      {
        if (v7)
        {
          __int16 v18 = [(__CFString *)v16 earliestFetchTime];
          [v18 timeIntervalSinceNow];
          BOOL v31 = v19 > -600.0;
          if (v19 > -600.0)
          {
            id v20 = sub_1000CD884(@"ckks", 0);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Skipping fetch because a recent fetch was performed", buf, 2u);
            }
          }
        }
        else
        {
          BOOL v31 = 0;
        }
        id v24 = +[CKKSResultOperation named:@"rpc-fetch-and-process-result" withBlock:&stru_1002FA718];
        id location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, v24);
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10010DEF4;
        v32[3] = &unk_100306A38;
        objc_copyWeak(&v34, &location);
        __int16 v33 = v11;
        [v24 setCompletionBlock:v32];
        NSErrorUserInfoKey v25 = [(__CFString *)v16 zoneName];
        CFStringRef v26 = sub_1000CD884(@"ckks", v25);

        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v39 = v16;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Beginning fetch for %@", buf, 0xCu);
        }

        if (v31) {
          [(__CFString *)v16 rpcProcessIncomingQueue:0 errorOnClassAFailure:v8];
        }
        else {
        id v27 = [(__CFString *)v16 rpcFetchAndProcessIncomingQueue:0 because:@"api" errorOnClassAFailure:v8];
        }
        [v24 addSuccessDependency:v27];
        uint64_t v28 = [(CKKSViewManager *)self operationQueue];
        id v29 = [v24 timeout:300000000000];
        [v28 addOperation:v29];

        objc_destroyWeak(&v34);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      id v22 = sub_10000B070("ckks");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v39 = v13;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Rejecting a fetch-and-process RPC: %@", buf, 0xCu);
      }

      v11[2](v11, v13);
    }
  }
  else
  {
    id v21 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Skipping fetchAndProcessCKChanges due to disabled CKKS", buf, 2u);
    }

    id v13 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:9 description:@"CKKS disabled"];
    v11[2](v11, v13);
  }
}

- (void)rpcStatus:(id)a3 fast:(BOOL)a4 waitForNonTransientState:(unint64_t)a5 reply:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (void (**)(id, void, id))a6;
  id v22 = 0;
  unsigned __int8 v12 = [(CKKSViewManager *)self allowClientRPC:&v22];
  id v13 = (__CFString *)v22;
  if (v12)
  {
    id v14 = +[OTManager manager];
    id v15 = objc_alloc_init((Class)OTControlArguments);
    id v21 = 0;
    v16 = [v14 ckksForClientRPC:v15 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v21];
    id v17 = v21;

    if (!v16 || v17)
    {
      double v19 = sub_1000CD884(@"ckks", 0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        CFStringRef v24 = @"com.apple.security.keychain";
        __int16 v25 = 2112;
        CFStringRef v26 = @"defaultContext";
        __int16 v27 = 2112;
        id v28 = v17;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v17)
      {
        v11[2](v11, 0, v17);
      }
      else
      {
        id v20 = [(CKKSViewManager *)self defaultViewError];
        v11[2](v11, 0, v20);
      }
    }
    else
    {
      [v16 rpcStatus:v10 fast:v8 waitForNonTransientState:a5 reply:v11];
    }
  }
  else
  {
    __int16 v18 = sub_10000B070("ckks");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Rejecting a status RPC: %@", buf, 0xCu);
    }

    v11[2](v11, 0, v13);
  }
}

- (void)rpcResyncLocal:(id)a3 reply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, id))a4;
  id v27 = 0;
  unsigned __int8 v8 = [(CKKSViewManager *)self allowClientRPC:&v27];
  id v9 = (__CFString *)v27;
  if (v8)
  {
    id v10 = +[OTManager manager];
    id v11 = objc_alloc_init((Class)OTControlArguments);
    id v26 = 0;
    unsigned __int8 v12 = [v10 ckksForClientRPC:v11 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v26];
    id v13 = v26;

    if (!v12 || v13)
    {
      id v20 = sub_1000CD884(@"ckks", 0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        CFStringRef v29 = @"com.apple.security.keychain";
        __int16 v30 = 2112;
        CFStringRef v31 = @"defaultContext";
        __int16 v32 = 2112;
        id v33 = v13;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v13)
      {
        v7[2](v7, v13);
      }
      else
      {
        id v21 = [(CKKSViewManager *)self defaultViewError];
        v7[2](v7, v21);
      }
    }
    else
    {
      id v14 = objc_alloc_init(CKKSResultOperation);
      [(CKKSResultOperation *)v14 setName:@"rpc-resync-local"];
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v14);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10010E5FC;
      v22[3] = &unk_100306A38;
      objc_copyWeak(&v24, &location);
      id v23 = v7;
      [(CKKSResultOperation *)v14 setCompletionBlock:v22];
      id v15 = [(__CFString *)v12 zoneName];
      v16 = sub_1000CD884(@"ckksresync", v15);

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v29 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Beginning resync (local) for %@", buf, 0xCu);
      }

      id v17 = [(__CFString *)v12 resyncLocal];
      [(CKKSResultOperation *)v14 addSuccessDependency:v17];
      id v18 = [(CKKSResultOperation *)v14 timeout:240000000000];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    double v19 = sub_10000B070("ckks");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Rejecting a resync-local RPC: %@", buf, 0xCu);
    }

    v7[2](v7, v9);
  }
}

- (void)rpcResync:(id)a3 reply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, id))a4;
  id v28 = 0;
  unsigned __int8 v8 = [(CKKSViewManager *)self allowClientRPC:&v28];
  id v9 = (__CFString *)v28;
  if (v8)
  {
    id v10 = +[OTManager manager];
    id v11 = objc_alloc_init((Class)OTControlArguments);
    id v27 = 0;
    unsigned __int8 v12 = [v10 ckksForClientRPC:v11 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v27];
    id v13 = v27;

    if (!v12 || v13)
    {
      id v21 = sub_1000CD884(@"ckks", 0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        CFStringRef v30 = @"com.apple.security.keychain";
        __int16 v31 = 2112;
        CFStringRef v32 = @"defaultContext";
        __int16 v33 = 2112;
        id v34 = v13;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v13)
      {
        v7[2](v7, v13);
      }
      else
      {
        id v22 = [(CKKSViewManager *)self defaultViewError];
        v7[2](v7, v22);
      }
    }
    else
    {
      id v14 = objc_alloc_init(CKKSResultOperation);
      [(CKKSResultOperation *)v14 setName:@"rpc-resync-cloudkit"];
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v14);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10010EB20;
      v23[3] = &unk_100306A38;
      objc_copyWeak(&v25, &location);
      id v24 = v7;
      [(CKKSResultOperation *)v14 setCompletionBlock:v23];
      id v15 = [(__CFString *)v12 zoneName];
      v16 = sub_1000CD884(@"ckksresync", v15);

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v30 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Beginning resync (CloudKit) for %@", buf, 0xCu);
      }

      id v17 = [(__CFString *)v12 resyncWithCloud];
      [(CKKSResultOperation *)v14 addSuccessDependency:v17];
      id v18 = [(CKKSResultOperation *)v14 timeout:240000000000];
      double v19 = [(CKKSViewManager *)self operationQueue];
      [v19 addOperation:v14];

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v20 = sub_10000B070("ckks");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Rejecting a resync RPC: %@", buf, 0xCu);
    }

    v7[2](v7, v9);
  }
}

- (void)rpcResetCloudKit:(id)a3 reason:(id)a4 reply:(id)a5
{
  id v7 = a3;
  unsigned __int8 v8 = (void (**)(id, id))a5;
  id v20 = 0;
  unsigned __int8 v9 = [(CKKSViewManager *)self allowClientRPC:&v20];
  id v10 = (__CFString *)v20;
  if (v9)
  {
    id v11 = +[OTManager manager];
    id v12 = objc_alloc_init((Class)OTControlArguments);
    id v19 = 0;
    id v13 = [v11 ckksForClientRPC:v12 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v19];
    id v14 = v19;

    if (!v13 || v14)
    {
      id v17 = sub_1000CD884(@"ckks", 0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        CFStringRef v22 = @"com.apple.security.keychain";
        __int16 v23 = 2112;
        CFStringRef v24 = @"defaultContext";
        __int16 v25 = 2112;
        id v26 = v14;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v14)
      {
        v8[2](v8, v14);
LABEL_17:

        goto LABEL_18;
      }
      id v15 = [(CKKSViewManager *)self defaultViewError];
      v8[2](v8, v15);
    }
    else
    {
      if (v7)
      {
        id v15 = +[NSSet setWithObject:v7];
      }
      else
      {
        id v15 = 0;
      }
      id v18 = [v13 rpcResetCloudKit:v15 reply:v8];
    }

    goto LABEL_17;
  }
  v16 = sub_10000B070("ckks");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Rejecting a resetCloudKit RPC: %@", buf, 0xCu);
  }

  v8[2](v8, v10);
LABEL_18:
}

- (void)rpcResetLocal:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v19 = 0;
  unsigned __int8 v8 = [(CKKSViewManager *)self allowClientRPC:&v19];
  unsigned __int8 v9 = (__CFString *)v19;
  if (v8)
  {
    id v10 = +[OTManager manager];
    id v11 = objc_alloc_init((Class)OTControlArguments);
    id v18 = 0;
    id v12 = [v10 ckksForClientRPC:v11 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v18];
    id v13 = v18;

    if (!v12 || v13)
    {
      v16 = sub_1000CD884(@"ckks", 0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        CFStringRef v21 = @"com.apple.security.keychain";
        __int16 v22 = 2112;
        CFStringRef v23 = @"defaultContext";
        __int16 v24 = 2112;
        id v25 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
      }

      if (v13)
      {
        v7[2](v7, v13);
LABEL_17:

        goto LABEL_18;
      }
      id v14 = [(CKKSViewManager *)self defaultViewError];
      v7[2](v7, v14);
    }
    else
    {
      if (v6)
      {
        id v14 = +[NSSet setWithObject:v6];
      }
      else
      {
        id v14 = 0;
      }
      id v17 = [v12 rpcResetLocal:v14 reply:v7];
    }

    goto LABEL_17;
  }
  id v15 = sub_10000B070("ckks");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rejecting a resetLocal RPC: %@", buf, 0xCu);
  }

  v7[2](v7, v9);
LABEL_18:
}

- (void)performanceCounters:(id)a3
{
}

- (id)currentTLKsFilteredByPolicy:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  id v7 = +[OTManager manager];
  id v8 = objc_alloc_init((Class)OTControlArguments);
  id v50 = 0;
  unsigned __int8 v9 = [v7 ckksForClientRPC:v8 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v50];
  id v10 = v50;

  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    id v12 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v53 = @"com.apple.security.keychain";
      __int16 v54 = 2112;
      CFStringRef v55 = @"defaultContext";
      __int16 v56 = 2112;
      id v57 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
    }

    if (a4)
    {
      if (v10)
      {
        id v13 = v10;
      }
      else
      {
        id v13 = [(CKKSViewManager *)self defaultViewError];
      }
      id v41 = 0;
      *a4 = v13;
    }
    else
    {
      id v41 = 0;
    }
    goto LABEL_48;
  }
  id v14 = [v9 findKeySets:0];
  id v15 = [v14 timeout:10000000000];
  [v14 waitUntilFinished];
  v16 = [v14 error];

  if (!v16)
  {
    __int16 v42 = a4;
    id v40 = v10;
    id v43 = v9;
    id v41 = +[NSMutableArray array];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = [v14 intendedZoneIDs];
    id v19 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (!v19) {
      goto LABEL_43;
    }
    id v20 = v19;
    uint64_t v21 = *(void *)v47;
    while (1)
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v47 != v21) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v23 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        if (!v5) {
          goto LABEL_23;
        }
        __int16 v24 = [v43 syncingPolicy];
        id v25 = [v24 viewsToPiggybackTLKs];
        id v26 = [v23 zoneName];
        unsigned int v27 = [v25 containsObject:v26];

        if (v27)
        {
LABEL_23:
          id v28 = [v14 keysets];
          CFStringRef v29 = [v28 objectForKeyedSubscript:v23];

          if (v29)
          {
            CFStringRef v30 = [(__CFString *)v29 tlk];

            if (v30)
            {
              __int16 v31 = [(__CFString *)v29 tlk];
              id v45 = 0;
              CFStringRef v32 = [v31 ensureKeyLoadedForContextID:&stru_10030AA90 cache:0 error:&v45];
              __int16 v33 = v45;

              if (v32) {
                BOOL v34 = v33 == 0;
              }
              else {
                BOOL v34 = 0;
              }
              if (v34)
              {
                id v38 = [v32 copy];
                [v41 addObject:v38];
              }
              else
              {
                __int16 v35 = sub_1000CD884(@"ckks", 0);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  CFStringRef v53 = (const __CFString *)v33;
                  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Error loading key: %@", buf, 0xCu);
                }

                if (v42) {
                  *__int16 v42 = v33;
                }
              }

              goto LABEL_40;
            }
            __int16 v33 = sub_1000CD884(@"ckks", 0);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v53 = v29;
              id v36 = v33;
              id v37 = "Do not have TLK: %@";
LABEL_37:
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, v37, buf, 0xCu);
            }
          }
          else
          {
            __int16 v33 = sub_1000CD884(@"ckks", 0);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v53 = 0;
              id v36 = v33;
              id v37 = "Do not have keyset: %@";
              goto LABEL_37;
            }
          }
LABEL_40:

          continue;
        }
      }
      id v20 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (!v20)
      {
LABEL_43:

        unsigned __int8 v9 = v43;
        id v10 = v40;
        goto LABEL_47;
      }
    }
  }
  id v17 = sub_1000CD884(@"ckks", 0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    id v18 = [v14 error];
    *(_DWORD *)buf = 138412290;
    CFStringRef v53 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Error getting keyset: %@", buf, 0xCu);
  }
  if (a4)
  {
    [v14 error];
    id v41 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v41 = 0;
  }
LABEL_47:

LABEL_48:

  return v41;
}

- (void)syncBackupAndNotifyAboutSync
{
  id v2 = sub_10021C7D8();
  id v3 = v2;
  if (v2)
  {
    [v2 performTransaction:&stru_1002FA6F8];
  }
  else
  {
    v4 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Failed to get account object", v5, 2u);
    }
  }
}

- (void)notifyNewTLKsInKeychain
{
  id v3 = sub_1000CD884(@"ckksbackup", 0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "New TLKs have arrived", v4, 2u);
  }

  [(CKKSViewManager *)self syncBackupAndNotifyAboutSync];
}

- (void)fetchPCSIdentityOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  unsigned __int8 v9 = (void (**)(id, void, id))a5;
  id v10 = +[OTManager manager];
  id v11 = objc_alloc_init((Class)OTControlArguments);
  id v17 = 0;
  id v12 = [v10 ckksForClientRPC:v11 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v17];
  id v13 = v17;

  if (v12) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    [v12 fetchPCSIdentityOutOfBand:v8 forceFetch:v6 complete:v9];
  }
  else
  {
    id v15 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v19 = @"com.apple.security.keychain";
      __int16 v20 = 2112;
      CFStringRef v21 = @"defaultContext";
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
    }

    if (v13)
    {
      v9[2](v9, 0, v13);
    }
    else
    {
      v16 = [(CKKSViewManager *)self defaultViewError];
      v9[2](v9, 0, v16);
    }
  }
}

- (void)getCurrentItemOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  unsigned __int8 v9 = (void (**)(id, void, id))a5;
  id v10 = +[OTManager manager];
  id v11 = objc_alloc_init((Class)OTControlArguments);
  id v17 = 0;
  id v12 = [v10 ckksForClientRPC:v11 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v17];
  id v13 = v17;

  if (v12) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    [v12 getCurrentItemOutOfBand:v8 forceFetch:v6 complete:v9];
  }
  else
  {
    id v15 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v19 = @"com.apple.security.keychain";
      __int16 v20 = 2112;
      CFStringRef v21 = @"defaultContext";
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
    }

    if (v13)
    {
      v9[2](v9, 0, v13);
    }
    else
    {
      v16 = [(CKKSViewManager *)self defaultViewError];
      v9[2](v9, 0, v16);
    }
  }
}

- (void)getCurrentItemForAccessGroup:(id)a3 identifier:(id)a4 viewHint:(id)a5 fetchCloudValue:(BOOL)a6 complete:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, void, id))a7;
  v16 = +[OTManager manager];
  id v17 = objc_alloc_init((Class)OTControlArguments);
  id v23 = 0;
  id v18 = [v16 ckksForClientRPC:v17 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v23];
  id v19 = v23;

  if (v18) {
    BOOL v20 = v19 == 0;
  }
  else {
    BOOL v20 = 0;
  }
  if (v20)
  {
    [v18 getCurrentItemForAccessGroup:v12 identifier:v13 viewHint:v14 fetchCloudValue:v8 complete:v15];
  }
  else
  {
    CFStringRef v21 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v25 = @"com.apple.security.keychain";
      __int16 v26 = 2112;
      CFStringRef v27 = @"defaultContext";
      __int16 v28 = 2112;
      id v29 = v19;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
    }

    if (v19)
    {
      v15[2](v15, 0, v19);
    }
    else
    {
      __int16 v22 = [(CKKSViewManager *)self defaultViewError];
      v15[2](v15, 0, v22);
    }
  }
}

- (void)unsetCurrentItemsForAccessGroup:(id)a3 identifiers:(id)a4 viewHint:(id)a5 complete:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, id))a6;
  id v14 = +[OTManager manager];
  id v15 = objc_alloc_init((Class)OTControlArguments);
  id v21 = 0;
  v16 = [v14 ckksForClientRPC:v15 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v21];
  id v17 = v21;

  if (v16) {
    BOOL v18 = v17 == 0;
  }
  else {
    BOOL v18 = 0;
  }
  if (v18)
  {
    [v16 unsetCurrentItemsForAccessGroup:v10 identifiers:v11 viewHint:v12 complete:v13];
  }
  else
  {
    id v19 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v23 = @"com.apple.security.keychain";
      __int16 v24 = 2112;
      CFStringRef v25 = @"defaultContext";
      __int16 v26 = 2112;
      id v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
    }

    if (v17)
    {
      v13[2](v13, v17);
    }
    else
    {
      BOOL v20 = [(CKKSViewManager *)self defaultViewError];
      v13[2](v13, v20);
    }
  }
}

- (void)setCurrentItemForAccessGroup:(id)a3 hash:(id)a4 accessGroup:(id)a5 identifier:(id)a6 viewHint:(id)a7 replacing:(id)a8 hash:(id)a9 complete:(id)a10
{
  id v31 = a3;
  id v30 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  BOOL v20 = (void (**)(id, id))a10;
  id v21 = +[OTManager manager];
  id v22 = objc_alloc_init((Class)OTControlArguments);
  id v32 = 0;
  CFStringRef v23 = [v21 ckksForClientRPC:v22 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v32];
  id v24 = v32;

  if (!v23 || v24)
  {
    id v27 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v34 = @"com.apple.security.keychain";
      __int16 v35 = 2112;
      CFStringRef v36 = @"defaultContext";
      __int16 v37 = 2112;
      id v38 = v24;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, %@, error: %@", buf, 0x20u);
    }

    if (v24)
    {
      v20[2](v20, v24);
    }
    else
    {
      __int16 v28 = [(CKKSViewManager *)self defaultViewError];
      v20[2](v20, v28);
    }
    __int16 v26 = v30;
    CFStringRef v25 = v31;
  }
  else
  {
    __int16 v26 = v30;
    CFStringRef v25 = v31;
    [v23 setCurrentItemForAccessGroup:v31 hash:v30 accessGroup:v15 identifier:v16 viewHint:v17 replacing:v18 hash:v19 complete:v20];
  }
}

- (id)defaultViewError
{
  NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
  id v2 = +[NSString stringWithFormat:@"No syncing view for %@, %@", @"com.apple.security.keychain", @"defaultContext"];
  id v7 = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v4 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:11 userInfo:v3];

  return v4;
}

- (void)handleKeychainEventDbConnection:(__OpaqueSecDbConnection *)a3 source:(unint64_t)a4 added:(SecDbItem *)a5 deleted:(SecDbItem *)a6
{
  if ((unint64_t)a5 | (unint64_t)a6)
  {
    if (a5)
    {
      id v11 = sub_100118CF8(a5, (uint64_t)&off_100303FD0, 0);
      if ([v11 length])
      {
        if (v11) {
          id v12 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:[v11 bytes]];
        }
        else {
          id v12 = 0;
        }
        unsigned int v13 = 0;
      }
      else
      {
        if (qword_10035CF58 != -1) {
          dispatch_once(&qword_10035CF58, &stru_1002FAF90);
        }
        unsigned int v13 = [v11 isEqualToData:qword_10035CF60];
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
      unsigned int v13 = 0;
    }
    if (a6)
    {
      id v14 = sub_100118CF8(a6, (uint64_t)&off_100303FD0, 0);
      if ([v14 length])
      {
        if (v14)
        {
          id v15 = objc_alloc((Class)NSUUID);
          id v16 = v14;
          id v17 = [v15 initWithUUIDBytes:[v16 bytes]];

          unsigned int v18 = 0;
          BOOL v19 = v12 != 0;
          BOOL v20 = v17 != 0;
          if (v12 && v17)
          {
            CFStringRef v53 = self;
            id v21 = [v12 UUIDString];
            id v22 = [v17 UUIDString];
            unsigned __int8 v23 = [v21 isEqualToString:v22];

            if ((v23 & 1) == 0)
            {
              id v38 = sub_1000CD884(@"handleKeychainEventDbConnection", 0);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)v61 = v12;
                *(_WORD *)&v61[8] = 2112;
                v62 = v17;
                CFStringRef v39 = "musr for added and deleted are different. added's musr:%@, deleted's musr: %@";
                id v40 = v38;
                uint32_t v41 = 22;
                goto LABEL_66;
              }
LABEL_67:

              goto LABEL_68;
            }
            unsigned int v18 = 0;
            BOOL v20 = 1;
            BOOL v19 = 1;
            self = v53;
          }
          if (!a5) {
            goto LABEL_31;
          }
LABEL_30:
          if (v18 == v13) {
            goto LABEL_31;
          }
          id v38 = sub_1000CD884(@"handleKeychainEventDbConnection", 0);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v61 = v13;
            *(_WORD *)&v61[4] = 1024;
            *(_DWORD *)&v61[6] = v18;
            CFStringRef v39 = "added's SingleUserKeychainUUID is different from deleted's. added's musr:%d, deleted's musr: %d";
            id v40 = v38;
            uint32_t v41 = 14;
LABEL_66:
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, v39, buf, v41);
            goto LABEL_67;
          }
          goto LABEL_67;
        }
        unsigned int v18 = 0;
      }
      else
      {
        if (qword_10035CF58 != -1) {
          dispatch_once(&qword_10035CF58, &stru_1002FAF90);
        }
        unsigned int v18 = [v14 isEqualToData:qword_10035CF60];
      }

      BOOL v20 = 0;
      id v17 = 0;
      BOOL v19 = v12 != 0;
      if (a5) {
        goto LABEL_30;
      }
    }
    else
    {
      id v17 = 0;
      BOOL v20 = 0;
      BOOL v19 = v12 != 0;
    }
LABEL_31:
    if (v19 || v20)
    {
      if (v19) {
        CFStringRef v25 = v12;
      }
      else {
        CFStringRef v25 = v17;
      }
      id v24 = [v25 UUIDString];
      if (((v24 != 0) & ~v13) != 0)
      {
        if (qword_10035D098 != -1) {
          dispatch_once(&qword_10035D098, &stru_100303AB8);
        }
        if (byte_10035D090)
        {
          long long v49 = a3;
          unint64_t v50 = a4;
          v51 = v17;
          v52 = v12;
          __int16 v54 = self;
          id v29 = [(CKKSViewManager *)self accountsAdapter];
          id v30 = [v29 inflateAllTPSpecificUsers:@"com.apple.security.keychain" octagonContextID:@"defaultContext"];

          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id v27 = v30;
          id v31 = [v27 countByEnumeratingWithState:&v55 objects:v59 count:16];
          if (!v31)
          {
LABEL_51:

LABEL_60:
            long long v48 = sub_1000CD884(@"handleKeychainEventDbConnection", 0);
            id v17 = v51;
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "did not find an active account for the persona", buf, 2u);
            }

            id v12 = v52;
            goto LABEL_63;
          }
          id v32 = v31;
          uint64_t v33 = *(void *)v56;
LABEL_45:
          uint64_t v34 = 0;
          while (1)
          {
            if (*(void *)v56 != v33) {
              objc_enumerationMutation(v27);
            }
            __int16 v35 = *(void **)(*((void *)&v55 + 1) + 8 * v34);
            CFStringRef v36 = [v35 personaUniqueString];
            unsigned __int8 v37 = [v36 isEqualToString:v24];

            if (v37) {
              break;
            }
            if (v32 == (id)++v34)
            {
              id v32 = [v27 countByEnumeratingWithState:&v55 objects:v59 count:16];
              if (v32) {
                goto LABEL_45;
              }
              goto LABEL_51;
            }
          }
          id v42 = v35;

          if (!v42) {
            goto LABEL_60;
          }
          id v43 = sub_1000CD884(@"handleKeychainEventDbConnection", 0);
          id v17 = v51;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v61 = v42;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "using tpspecific user: %@", buf, 0xCu);
          }

          v44 = +[OTManager manager];
          id v45 = [v42 cloudkitContainerName];
          long long v46 = [v42 octagonContextID];
          uint64_t v47 = [v44 ckksAccountSyncForContainer:v45 contextID:v46 possibleAccount:v42];

          id v27 = v47;
          id v12 = v52;
          self = v54;
          a3 = v49;
          a4 = v50;
          if (v27) {
            goto LABEL_39;
          }
        }
        goto LABEL_58;
      }
    }
    else
    {
      id v24 = 0;
    }
    __int16 v26 = +[OTManager manager];
    id v27 = [v26 ckksAccountSyncForContainer:@"com.apple.security.keychain" contextID:@"defaultContext" possibleAccount:0];

    if (v27)
    {
LABEL_39:
      __int16 v28 = [(CKKSViewManager *)self globalRateLimiter];
      [v27 handleKeychainEventDbConnection:a3 source:a4 added:a5 deleted:a6 rateLimiter:v28];

LABEL_63:
LABEL_68:

      goto LABEL_69;
    }
LABEL_58:
    id v27 = sub_1000CD884(@"handleKeychainEventDbConnection", 0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "ckks view is nil! returning.", buf, 2u);
    }
    goto LABEL_63;
  }
  id v12 = sub_1000CD884(@"handleKeychainEventDbConnection", 0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "both added and deleted SecDbItemRefs are nil, returning", buf, 2u);
  }
LABEL_69:
}

- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if ([v6 accountStatus] != (id)1
    || (objc_msgSend(v6, "hasValidCredentials", v19) & 1) == 0)
  {
    id obj = [(CKKSViewManager *)self pendingSyncCallbacks];
    objc_sync_enter(obj);
    id v7 = [(CKKSViewManager *)self pendingSyncCallbacks];
    id v8 = [v7 count];

    if (v8)
    {
      unsigned __int8 v9 = sub_1000CD884(@"ckkscallback", 0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No CK account; failing all pending sync callbacks",
          buf,
          2u);
      }

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v10 = [(CKKSViewManager *)self pendingSyncCallbacks];
      id v11 = [v10 allKeys];

      id v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v22;
        do
        {
          id v14 = 0;
          do
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v14);
            id v16 = [(CKKSViewManager *)self pendingSyncCallbacks];
            id v17 = [v16 objectForKeyedSubscript:v15];
            +[CKKSViewManager callSyncCallbackWithErrorNoAccount:v17];

            id v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v12);
      }

      unsigned int v18 = [(CKKSViewManager *)self pendingSyncCallbacks];
      [v18 removeAllObjects];
    }
    objc_sync_exit(obj);
  }
}

- (id)pendingCallbackUUIDs
{
  id v3 = [(CKKSViewManager *)self pendingSyncCallbacks];
  objc_sync_enter(v3);
  v4 = [(CKKSViewManager *)self pendingSyncCallbacks];
  BOOL v5 = [v4 allKeys];
  id v6 = [v5 copy];

  objc_sync_exit(v3);

  return v6;
}

- (BOOL)peekCallbackForUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(CKKSViewManager *)self pendingSyncCallbacks];
    objc_sync_enter(v5);
    id v6 = [(CKKSViewManager *)self pendingSyncCallbacks];
    id v7 = [v6 allKeys];
    unsigned __int8 v8 = [v7 containsObject:v4];

    objc_sync_exit(v5);
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)claimCallbackForUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(CKKSViewManager *)self pendingSyncCallbacks];
    objc_sync_enter(v5);
    id v6 = [(CKKSViewManager *)self pendingSyncCallbacks];
    id v7 = [v6 objectForKeyedSubscript:v4];

    if (v7)
    {
      unsigned __int8 v8 = sub_1000CD884(@"ckkscallback", 0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "fetched UUID: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    unsigned __int8 v9 = [(CKKSViewManager *)self pendingSyncCallbacks];
    [v9 setObject:0 forKeyedSubscript:v4];

    id v10 = objc_retainBlock(v7);
    objc_sync_exit(v5);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)registerSyncStatusCallback:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(CKKSViewManager *)self pendingSyncCallbacks];
  objc_sync_enter(v8);
  unsigned __int8 v9 = sub_1000CD884(@"ckkscallback", 0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "registered callback for UUID: %@", (uint8_t *)&v12, 0xCu);
  }

  id v10 = objc_retainBlock(v7);
  id v11 = [(CKKSViewManager *)self pendingSyncCallbacks];
  [v11 setObject:v10 forKeyedSubscript:v6];

  objc_sync_exit(v8);
}

- (id)restartCKKSAccountSyncWithoutSettingPolicy:(id)a3
{
  id v3 = a3;
  id v4 = +[OTManager manager];
  BOOL v5 = [v4 restartCKKSAccountSyncWithoutSettingPolicy:v3];

  return v5;
}

- (id)ckksAccountSyncForContainer:(id)a3 contextID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[OTManager manager];
  unsigned __int8 v8 = [v7 ckksAccountSyncForContainer:v6 contextID:v5 possibleAccount:0];

  if (!v8)
  {
    unsigned __int8 v9 = sub_1000CD884(@"ckksAccountSyncForContainer", 0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "failed to get CKKSKeychainView", v11, 2u);
    }
  }

  return v8;
}

- (id)restartCKKSAccountSync:(id)a3
{
  id v4 = a3;
  id v5 = [v4 syncingPolicy];
  id v6 = [(CKKSViewManager *)self restartCKKSAccountSyncWithoutSettingPolicy:v4];

  [v6 setCurrentSyncingPolicy:v5 policyIsFresh:0];

  return v6;
}

- (void)lockStateChangeNotification:(BOOL)a3
{
  if (a3)
  {
    id v4 = +[CKKSAnalytics logger];
    id v3 = +[NSDate date];
    [v4 setDateProperty:v3 forKey:@"lastUnlock"];
  }
}

- (id)getGlobalRateLimiter
{
  if (qword_10035CEC8 != -1) {
    dispatch_once(&qword_10035CEC8, &stru_1002FA6D8);
  }
  globalRateLimiter = self->_globalRateLimiter;
  p_globalRateLimiter = &self->_globalRateLimiter;
  id v3 = globalRateLimiter;
  if (globalRateLimiter)
  {
    id v6 = v3;
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    int v12 = sub_100111580;
    id v13 = sub_100111590;
    id v14 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100111598;
    block[3] = &unk_100308068;
    block[4] = &v9;
    dispatch_sync((dispatch_queue_t)qword_10035CEC0, block);
    objc_storeStrong((id *)p_globalRateLimiter, (id)v10[5]);
    id v6 = *p_globalRateLimiter;
    _Block_object_dispose(&v9, 8);
  }

  return v6;
}

- (void)setupAnalytics
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = +[CKKSAnalytics logger];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100111A44;
  v24[3] = &unk_1002FA690;
  objc_copyWeak(&v25, &location);
  double v4 = SFAnalyticsSamplerIntervalOncePerReport;
  id v5 = [v3 AddMultiSamplerForName:@"CKKS-healthSummary" withTimeInterval:v24 block:SFAnalyticsSamplerIntervalOncePerReport];

  id v6 = [(CKKSViewManager *)self ckksAccountSyncForContainer:@"com.apple.security.keychain" contextID:@"defaultContext"];
  id v7 = v6;
  if (v6)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    unsigned __int8 v8 = [v6 viewList];
    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v21;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          id v13 = +[CKKSAnalytics logger];
          id v14 = +[NSString stringWithFormat:@"CKKS-%@-healthSummary", v12];
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_100111D88;
          v16[3] = &unk_1002FA6B8;
          objc_copyWeak(&v19, &location);
          id v17 = v7;
          uint64_t v18 = v12;
          id v15 = [v13 AddMultiSamplerForName:v14 withTimeInterval:v16 block:v4];

          objc_destroyWeak(&v19);
        }
        id v9 = [v8 countByEnumeratingWithState:&v20 objects:v27 count:16];
      }
      while (v9);
    }
  }
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (BOOL)waitForTrustReady
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100112938;
  block[3] = &unk_100308068;
  block[4] = &v5;
  if (qword_10035CEB8 != -1) {
    dispatch_once(&qword_10035CEB8, block);
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)allowClientRPC:(id *)a3
{
  if (qword_10035D098 != -1) {
    dispatch_once(&qword_10035D098, &stru_100303AB8);
  }
  if (byte_10035D090) {
    return 1;
  }
  uint64_t v5 = [(CKKSViewManager *)self personaAdapter];
  unsigned __int8 v6 = [v5 currentThreadIsForPrimaryiCloudAccount];

  if (v6) {
    return 1;
  }
  char v8 = sub_10000B070("ckks");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Rejecting client RPC for non-primary persona", v10, 2u);
  }

  if (!a3) {
    return 0;
  }
  id v9 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:65 description:@"CKKS APIs do not support non-primary users"];
  BOOL result = 0;
  *a3 = v9;
  return result;
}

- (CKKSViewManager)initWithContainer:(id)a3 sosAdapter:(id)a4 accountStateTracker:(id)a5 lockStateTracker:(id)a6 reachabilityTracker:(id)a7 personaAdapter:(id)a8 cloudKitClassDependencies:(id)a9 accountsAdapter:(id)a10
{
  id v38 = a3;
  id v37 = a4;
  id v36 = a5;
  id v35 = a6;
  id v34 = a7;
  id v33 = a8;
  id v17 = a9;
  id v32 = a10;
  v39.receiver = self;
  v39.super_class = (Class)CKKSViewManager;
  uint64_t v18 = [(CKKSViewManager *)&v39 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_cloudKitClassDependencies, a9);
    objc_storeStrong((id *)&v19->_sosPeerAdapter, a4);
    viewAllowList = v19->_viewAllowList;
    v19->_viewAllowList = 0;

    objc_storeStrong((id *)&v19->_container, a3);
    objc_storeStrong((id *)&v19->_accountTracker, a5);
    objc_storeStrong((id *)&v19->_lockStateTracker, a6);
    [(CKKSLockStateTracker *)v19->_lockStateTracker addLockStateObserver:v19];
    objc_storeStrong((id *)&v19->_reachabilityTracker, a7);
    objc_storeStrong((id *)&v19->_personaAdapter, a8);
    objc_storeStrong((id *)&v19->_accountsAdapter, a10);
    id v21 = +[OctagonAPSReceiver receiverForNamedDelegatePort:apsConnectionClass:](OctagonAPSReceiver, "receiverForNamedDelegatePort:apsConnectionClass:", @"com.apple.securityd.aps", [v17 apsConnectionClass]);
    long long v22 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v19->_operationQueue;
    v19->_operationQueue = v22;

    long long v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingSyncCallbacks = v19->_pendingSyncCallbacks;
    v19->_pendingSyncCallbacks = v24;

    __int16 v26 = objc_alloc_init(CKKSCondition);
    completedSecCKKSInitialize = v19->_completedSecCKKSInitialize;
    v19->_completedSecCKKSInitialize = v26;

    uint64_t v28 = +[NSXPCListener anonymousListener];
    listener = v19->_listener;
    v19->_listener = (NSXPCListener *)v28;

    [(NSXPCListener *)v19->_listener setDelegate:v19];
    [(NSXPCListener *)v19->_listener resume];
    id v30 = [(CKKSAccountStateTracker *)v19->_accountTracker registerForNotificationsOfCloudKitAccountStatusChange:v19];
  }

  return v19;
}

+ (id)manager
{
  char v2 = +[OTManager manager];
  id v3 = [v2 viewManager];

  return v3;
}

+ (void)callSyncCallbackWithErrorNoAccount:(id)a3
{
  id v4 = a3;
  id v5 = +[NSError errorWithDomain:@"securityd" code:-67729 description:@"No iCloud account available; item is not expected to sync"];
  (*((void (**)(id, void, id))a3 + 2))(v4, 0, v5);
}

@end