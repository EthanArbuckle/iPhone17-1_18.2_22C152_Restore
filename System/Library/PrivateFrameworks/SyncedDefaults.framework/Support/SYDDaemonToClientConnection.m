@interface SYDDaemonToClientConnection
+ (BOOL)isXPCConnection:(id)a3 entitledForStoreConfiguration:(id)a4;
+ (id)changeDictionaryWithChangedKeys:(id)a3 reason:(int64_t)a4 changeToken:(id)a5;
+ (id)changedKeysForStoreIdentifier:(id)a3 sinceChangeTokenIfValid:(id)a4 inCoreDataStore:(id)a5 error:(id *)a6;
+ (id)errorForUnknownStore:(id)a3;
+ (id)errorNotEntitledForStoreConfiguration:(id)a3;
+ (id)valueForEntitlement:(id)a3 xpcConnection:(id)a4 storeConfiguration:(id)a5;
- (BOOL)didRefreshBundleMap;
- (BOOL)isCloudSyncEnablementEntitledForStoreIdentifier:(id)a3;
- (BOOL)isEntitledForStoreConfiguration:(id)a3;
- (BOOL)isKnownStore:(id)a3;
- (BOOL)isPerformingManualSync;
- (BOOL)shouldEnforceQuotaForStoreConfiguration:(id)a3;
- (NSMutableSet)entitledStoreIDs;
- (NSMutableSet)notEntitledStoreIDs;
- (NSMutableSet)registeredStoreIDs;
- (NSNumber)ignoreQuotaEntitlementValue;
- (NSString)applicationIdentifier;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)queue;
- (SYDDaemonToClientConnection)initWithXPCConnection:(id)a3 delegate:(id)a4;
- (SYDDaemonToClientConnectionDelegate)delegate;
- (id)changeTokenURLForStoreConfiguration:(id)a3 xpcConnection:(id)a4 error:(id *)a5;
- (id)client;
- (id)description;
- (unint64_t)manualSyncCount;
- (void)allStoreIdentifiersWithCompletionHandler:(id)a3;
- (void)changeDictionarySinceChangeToken:(id)a3 inStoreWithConfiguration:(id)a4 reply:(id)a5;
- (void)changeTokenForStoreWithConfiguration:(id)a3 reply:(id)a4;
- (void)daemonToClientConnectionDidChangeValues:(id)a3;
- (void)dealloc;
- (void)decrementManualSyncCount;
- (void)dictionaryRepresentationForStoreWithConfiguration:(id)a3 reply:(id)a4;
- (void)incrementManualSyncCount;
- (void)isCloudSyncUserDefaultEnabledForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)notifyAccountDidChangeFromAccountID:(id)a3 toAccountID:(id)a4 completionHandler:(id)a5;
- (void)notifyAccountDidChangeWithCompletionHandler:(id)a3;
- (void)objectForKey:(id)a3 inStoreWithConfiguration:(id)a4 reply:(id)a5;
- (void)processAccountChangesWithCompletionHandler:(id)a3;
- (void)registerForChangeNotificationsForStoreWithConfiguration:(id)a3 reply:(id)a4;
- (void)removeObjectForKey:(id)a3 inStoreWithConfiguration:(id)a4 reply:(id)a5;
- (void)resume;
- (void)saveChangeToken:(id)a3 forStoreWithConfiguration:(id)a4 reply:(id)a5;
- (void)setApplicationIdentifier:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setCloudSyncUserDefaultEnabled:(BOOL)a3 storeIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDidRefreshBundleMap:(BOOL)a3;
- (void)setEntitledStoreIDs:(id)a3;
- (void)setIgnoreQuotaEntitlementValue:(id)a3;
- (void)setManualSyncCount:(unint64_t)a3;
- (void)setNotEntitledStoreIDs:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4 inStoreWithConfiguration:(id)a5 reply:(id)a6;
- (void)setQueue:(id)a3;
- (void)setRegisteredStoreIDs:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)syncManagerDidChangeNotification:(id)a3;
- (void)synchronizeStoreWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)synchronizeStoresWithIdentifiers:(id)a3 type:(int64_t)a4 testConfiguration:(id)a5 completionHandler:(id)a6;
@end

@implementation SYDDaemonToClientConnection

- (void)registerForChangeNotificationsForStoreWithConfiguration:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if ([(SYDDaemonToClientConnection *)self isEntitledForStoreConfiguration:v6])
  {
    v8 = [(SYDDaemonToClientConnection *)self queue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000DF44;
    v10[3] = &unk_100050AA0;
    id v11 = v6;
    v12 = self;
    dispatch_sync(v8, v10);

    v7[2](v7, 0);
  }
  else
  {
    v9 = [(id)objc_opt_class() errorNotEntitledForStoreConfiguration:v6];
    ((void (**)(id, void *))v7)[2](v7, v9);
  }
}

- (void)dictionaryRepresentationForStoreWithConfiguration:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  if ([(SYDDaemonToClientConnection *)self isEntitledForStoreConfiguration:v6])
  {
    v8 = SYDGetConnectionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100004900();
    }

    v9 = [(SYDDaemonToClientConnection *)self delegate];
    v10 = [v6 storeID];
    id v20 = 0;
    id v11 = [v9 connection:self syncManagerForStoreID:v10 error:&v20];
    id v12 = v20;

    v13 = 0;
    if (v11 && !v12)
    {
      v14 = [v11 coreDataStore];
      v15 = [v6 storeID];
      v16 = [v15 identifier];
      id v19 = 0;
      v13 = [v14 dictionaryRepresentationForStoreWithIdentifier:v16 error:&v19];
      id v12 = v19;
    }
    v17 = sub_1000084BC(v12);
    v7[2](v7, v13, v17);
  }
  else
  {
    v18 = [(id)objc_opt_class() errorNotEntitledForStoreConfiguration:v6];
    v7[2](v7, 0, v18);
  }
}

- (void)decrementManualSyncCount
{
  v2 = self;
  objc_sync_enter(v2);
  [(SYDDaemonToClientConnection *)v2 setManualSyncCount:(char *)[(SYDDaemonToClientConnection *)v2 manualSyncCount] - 1];
  v3 = SYDGetConnectionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100005BE0((uint64_t)v2, (uint64_t)&v4, [(SYDDaemonToClientConnection *)v2 manualSyncCount]);
  }

  objc_sync_exit(v2);
}

- (void)incrementManualSyncCount
{
  v2 = self;
  objc_sync_enter(v2);
  [(SYDDaemonToClientConnection *)v2 setManualSyncCount:(char *)[(SYDDaemonToClientConnection *)v2 manualSyncCount] + 1];
  v3 = SYDGetConnectionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100005B98((uint64_t)v2, (uint64_t)&v4, [(SYDDaemonToClientConnection *)v2 manualSyncCount]);
  }

  objc_sync_exit(v2);
}

- (unint64_t)manualSyncCount
{
  return self->_manualSyncCount;
}

- (void)setManualSyncCount:(unint64_t)a3
{
  self->_manualSyncCount = a3;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)synchronizeStoreWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (![(SYDDaemonToClientConnection *)self isEntitledForStoreConfiguration:v6])
  {
    uint64_t v15 = [(id)objc_opt_class() errorNotEntitledForStoreConfiguration:v6];
LABEL_9:
    v16 = (void *)v15;
    v7[2](v7, v15);

    goto LABEL_16;
  }
  if (![(SYDDaemonToClientConnection *)self isKnownStore:v6])
  {
    uint64_t v15 = [(id)objc_opt_class() errorForUnknownStore:v6];
    goto LABEL_9;
  }
  v8 = SYDGetConnectionLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000F0B0();
  }

  v9 = [(SYDDaemonToClientConnection *)self delegate];
  v10 = [v6 storeID];
  id v26 = 0;
  id v11 = [v9 connection:self syncManagerForStoreID:v10 error:&v26];
  id v12 = v26;

  if (v11)
  {
    [(SYDDaemonToClientConnection *)self incrementManualSyncCount];
    v13 = [v6 storeID];
    v14 = [v13 identifier];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000058F4;
    v23[3] = &unk_100051378;
    v23[4] = self;
    id v24 = v6;
    v25 = v7;
    [v11 synchronizeStoreWithIdentifier:v14 completionHandler:v23];
  }
  else
  {
    v17 = SYDGetConnectionLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100034160();
    }

    v18 = [v6 storeID];
    id v19 = [v18 identifier];
    id v20 = +[NSString stringWithFormat:@"No sync manager trying to sync store %@", v19];

    if (!v12)
    {
      NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
      v28 = v20;
      v21 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      id v12 = +[NSError errorWithDomain:@"SyncedDefaults" code:1234 userInfo:v21];
    }
    v22 = sub_1000084BC(v12);
    v7[2](v7, (uint64_t)v22);
  }
LABEL_16:
}

- (void)objectForKey:(id)a3 inStoreWithConfiguration:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, uint64_t))a5;
  if (![(SYDDaemonToClientConnection *)self isEntitledForStoreConfiguration:v9])
  {
    uint64_t v20 = [(id)objc_opt_class() errorNotEntitledForStoreConfiguration:v9];
LABEL_11:
    v21 = (void *)v20;
    v10[2](v10, 0, v20);

    goto LABEL_12;
  }
  if (![(SYDDaemonToClientConnection *)self isKnownStore:v9])
  {
    uint64_t v20 = [(id)objc_opt_class() errorForUnknownStore:v9];
    goto LABEL_11;
  }
  id v11 = SYDGetConnectionLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10000759C();
  }

  id v12 = [(SYDDaemonToClientConnection *)self delegate];
  v13 = [v9 storeID];
  id v23 = 0;
  v14 = [v12 connection:self syncManagerForStoreID:v13 error:&v23];
  id v15 = v23;

  v16 = 0;
  if (v14 && !v15)
  {
    v17 = [v9 storeID];
    v18 = [v17 identifier];
    id v22 = 0;
    v16 = [v14 objectForKey:v8 inStoreWithIdentifier:v18 error:&v22];
    id v15 = v22;
  }
  id v19 = sub_1000084BC(v15);
  ((void (**)(id, void *, uint64_t))v10)[2](v10, v16, (uint64_t)v19);

LABEL_12:
}

- (BOOL)isKnownStore:(id)a3
{
  uint64_t v4 = [a3 storeID];
  v5 = [v4 identifier];

  id v6 = +[SYDStoreBundleMap sharedInstance];
  if ([v6 isStoreIdentifierUsedOnThisDevice:v5])
  {
    BOOL v7 = 1;
  }
  else
  {
    if ([(SYDDaemonToClientConnection *)self didRefreshBundleMap]) {
      goto LABEL_7;
    }
    id v8 = SYDGetConnectionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100034D9C();
    }

    [v6 clearCachedStoreBundleMap];
    BOOL v7 = 1;
    [(SYDDaemonToClientConnection *)self setDidRefreshBundleMap:1];
    if (([v6 isStoreIdentifierUsedOnThisDevice:v5] & 1) == 0)
    {
LABEL_7:
      id v9 = SYDGetConnectionLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_100034D34();
      }

      BOOL v7 = 0;
    }
  }

  return v7;
}

- (void)changeDictionarySinceChangeToken:(id)a3 inStoreWithConfiguration:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *, void *))a5;
  if ([(SYDDaemonToClientConnection *)self isEntitledForStoreConfiguration:v9])
  {
    id v11 = SYDGetConnectionLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v31 = v8;
      __int16 v32 = 2112;
      id v33 = v9;
      __int16 v34 = 2112;
      v35 = self;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Generating change dictionary for token %@ in store (%@) for %@", buf, 0x20u);
    }

    id v12 = [(SYDDaemonToClientConnection *)self delegate];
    v13 = [v9 storeID];
    id v29 = 0;
    v14 = [v12 connection:self syncManagerForStoreID:v13 error:&v29];
    id v15 = v29;

    v16 = 0;
    if (v14 && !v15)
    {
      v17 = [v9 storeID];
      v18 = [v17 identifier];

      id v19 = [v14 coreDataStore];
      id v28 = 0;
      uint64_t v20 = [v19 currentChangeTokenForStoreIdentifier:v18 error:&v28];
      id v15 = v28;

      if (v15)
      {
        v21 = SYDGetConnectionLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_10003444C();
        }
        v16 = 0;
      }
      else
      {
        id v23 = objc_opt_class();
        id v24 = [v14 coreDataStore];
        id v27 = 0;
        v21 = [v23 changedKeysForStoreIdentifier:v18 sinceChangeTokenIfValid:v8 inCoreDataStore:v24 error:&v27];
        id v15 = v27;

        if (v15)
        {
          v25 = SYDGetConnectionLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_1000343E4();
          }
          v16 = 0;
        }
        else
        {
          v16 = [(id)objc_opt_class() changeDictionaryWithChangedKeys:v21 reason:0 changeToken:v20];
          v25 = SYDGetConnectionLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            sub_1000079C0(v21);
          }
        }
      }
    }
    id v26 = sub_1000084BC(v15);
    v10[2](v10, v16, v26);
  }
  else
  {
    id v22 = [(id)objc_opt_class() errorNotEntitledForStoreConfiguration:v9];
    v10[2](v10, 0, v22);
  }
}

- (SYDDaemonToClientConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SYDDaemonToClientConnectionDelegate *)WeakRetained;
}

- (void)saveChangeToken:(id)a3 forStoreWithConfiguration:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if ([(SYDDaemonToClientConnection *)self isEntitledForStoreConfiguration:v9])
  {
    id v11 = [(SYDDaemonToClientConnection *)self xpcConnection];
    id v41 = 0;
    id v12 = [(SYDDaemonToClientConnection *)self changeTokenURLForStoreConfiguration:v9 xpcConnection:v11 error:&v41];
    v13 = v41;

    if (!v12)
    {
      v17 = SYDGetConnectionLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100034670();
      }
      goto LABEL_46;
    }
    v14 = SYDGetConnectionLog();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
    if (!v8)
    {
      if (v15) {
        sub_100034740();
      }

      uint64_t v20 = +[NSFileManager defaultManager];
      v40 = v13;
      unsigned __int8 v21 = [v20 removeItemAtURL:v12 error:&v40];
      id v22 = v40;

      if (v21) {
        goto LABEL_47;
      }
      if (sub_100017C38(v22))
      {
        v13 = 0;
        v17 = v22;
      }
      else
      {
        v17 = SYDGetConnectionLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1000346D8();
        }
        v13 = v22;
      }
LABEL_46:

      id v22 = v13;
LABEL_47:
      id v31 = sub_1000084BC(v22);
      v10[2](v10, v31);

      goto LABEL_48;
    }
    if (v15) {
      sub_10000B2AC();
    }

    v16 = [v9 storeID];
    v17 = sub_10000B284((unint64_t)[v16 type]);

    if ([v17 isEqualToString:NSFileProtectionNone])
    {
      uint64_t v18 = 268435457;
    }
    else if ([v17 isEqualToString:NSFileProtectionCompleteUntilFirstUserAuthentication])
    {
      uint64_t v18 = 1073741825;
    }
    else if ([v17 isEqualToString:NSFileProtectionCompleteUnlessOpen])
    {
      uint64_t v18 = 805306369;
    }
    else if ([v17 isEqualToString:NSFileProtectionComplete])
    {
      uint64_t v18 = 536870913;
    }
    else
    {
      uint64_t v18 = 1;
    }
    v39 = v13;
    unsigned __int8 v23 = [v8 writeToURL:v12 options:v18 error:&v39];
    id v24 = v39;

    if (v23)
    {
      v13 = v24;
      goto LABEL_46;
    }
    if (sub_100017C38(v24))
    {
      v25 = +[NSFileManager defaultManager];
      id v26 = [v12 URLByDeletingLastPathComponent];
      v38 = v24;
      unsigned __int8 v27 = [v25 createDirectoryAtURL:v26 withIntermediateDirectories:1 attributes:0 error:&v38];
      __int16 v32 = v38;

      if (v27)
      {

        id v35 = 0;
        [v8 writeToURL:v12 options:v18 error:&v35];
        v13 = v35;
        if (!v13) {
          goto LABEL_46;
        }
      }
      else
      {
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_100023390;
        v36[3] = &unk_100050A50;
        v13 = v32;
        v37 = v13;
        if (qword_10005BBA0 != -1) {
          dispatch_once(&qword_10005BBA0, v36);
        }

        if (!v13) {
          goto LABEL_46;
        }
      }
    }
    else
    {
      v13 = v24;
      if (!v24) {
        goto LABEL_46;
      }
    }
    id v28 = [v13 domain];
    if ([v28 isEqual:NSCocoaErrorDomain])
    {
      id v29 = [v13 code];

      if (v29 == (id)640)
      {
        v30 = SYDGetConnectionLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_1000347A8();
        }
LABEL_45:

        goto LABEL_46;
      }
    }
    else
    {
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000233DC;
    block[3] = &unk_100050A50;
    __int16 v34 = v13;
    if (qword_10005BBA8 != -1) {
      dispatch_once(&qword_10005BBA8, block);
    }
    v30 = v34;
    goto LABEL_45;
  }
  id v19 = [(id)objc_opt_class() errorNotEntitledForStoreConfiguration:v9];
  v10[2](v10, v19);

LABEL_48:
}

- (BOOL)isEntitledForStoreConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v5 = [(SYDDaemonToClientConnection *)self queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000AEEC;
  v9[3] = &unk_100051328;
  p_queue = &self->_queue;
  id v11 = &v12;
  v9[4] = self;
  id v7 = v4;
  id v10 = v7;
  sub_100009D70(v5, p_queue, v9);

  LOBYTE(v5) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v5;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSMutableString stringWithFormat:@"<%@: %p;", v4, self];

  id v6 = [(SYDDaemonToClientConnection *)self registeredStoreIDs];
  id v7 = [v6 count];

  if (v7)
  {
    id v8 = [(SYDDaemonToClientConnection *)self registeredStoreIDs];
    id v9 = [v8 allObjects];
    id v10 = [v9 componentsJoinedByString:@", "];
    [v5 appendFormat:@" registeredStoreIDs=[%@]", v10];
  }
  xpcConnection = self->_xpcConnection;
  if (xpcConnection && [(NSXPCConnection *)xpcConnection processIdentifier]) {
    objc_msgSend(v5, "appendFormat:", @" clientPID=%d", -[NSXPCConnection processIdentifier](self->_xpcConnection, "processIdentifier"));
  }
  [v5 appendString:@">"];
  return v5;
}

- (NSMutableSet)registeredStoreIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableSet)entitledStoreIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)changeTokenForStoreWithConfiguration:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  if ([(SYDDaemonToClientConnection *)self isEntitledForStoreConfiguration:v6])
  {
    id v8 = [(SYDDaemonToClientConnection *)self xpcConnection];
    id v30 = 0;
    id v9 = [(SYDDaemonToClientConnection *)self changeTokenURLForStoreConfiguration:v6 xpcConnection:v8 error:&v30];
    id v10 = v30;

    if (v9)
    {
      id v29 = 0;
      id v28 = 0;
      unsigned __int8 v11 = [v9 getResourceValue:&v29 forKey:NSURLFileResourceTypeKey error:&v28];
      id v12 = v29;
      id v13 = v28;

      if (v11)
      {
        if ([v12 isEqual:NSURLFileResourceTypeSymbolicLink])
        {
          uint64_t v14 = SYDGetConnectionLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
            sub_1000344F4(v6, v14);
          }

          NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
          CFStringRef v32 = @"Change token should not be a symbolic link";
          char v15 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
          uint64_t v16 = +[NSError errorWithDomain:@"SyncedDefaults" code:1040 userInfo:v15];

          v17 = 0;
          id v13 = (id)v16;
          goto LABEL_32;
        }
        id v27 = v13;
        v17 = +[NSData dataWithContentsOfURL:v9 options:0 error:&v27];
        id v10 = v27;

        if (!v10) {
          goto LABEL_20;
        }
        id v22 = [v10 domain];
        if ([v22 isEqualToString:NSCocoaErrorDomain])
        {
          id v23 = [v10 code];

          if (v23 == (id)260)
          {

            goto LABEL_20;
          }
        }
        else
        {
        }
        v25 = SYDGetConnectionLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_1000345A0();
        }

LABEL_31:
        id v13 = v10;
        goto LABEL_32;
      }
      uint64_t v20 = [v13 domain];
      if ([v20 isEqualToString:NSCocoaErrorDomain])
      {
        id v21 = [v13 code];

        if (v21 == (id)260)
        {

          v17 = 0;
LABEL_20:
          id v13 = 0;
LABEL_32:
          id v26 = sub_1000084BC(v13);
          v7[2](v7, v17, v26);

          goto LABEL_33;
        }
      }
      else
      {
      }
      id v24 = SYDGetConnectionLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100034608();
      }
    }
    else
    {
      id v19 = SYDGetConnectionLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000344B4();
      }

      if (v10)
      {
        id v12 = 0;
        v17 = 0;
        goto LABEL_31;
      }
      id v13 = +[NSError errorWithDomain:NSCocoaErrorDomain code:260 userInfo:0];
      id v12 = 0;
    }
    v17 = 0;
    goto LABEL_32;
  }
  uint64_t v18 = [(id)objc_opt_class() errorNotEntitledForStoreConfiguration:v6];
  v7[2](v7, 0, v18);

LABEL_33:
}

- (id)changeTokenURLForStoreConfiguration:(id)a3 xpcConnection:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v8) {
    [v8 auditToken];
  }
  if (!sandbox_container_path_for_audit_token())
  {
    if (v17[0])
    {
      id v10 = +[NSString stringWithUTF8String:v17];
      unsigned __int8 v11 = +[NSURL fileURLWithPath:v10 isDirectory:1];
      id v12 = [v11 URLByAppendingPathComponent:@"Library" isDirectory:1];

      id v13 = [v12 URLByAppendingPathComponent:@"SyncedPreferences" isDirectory:1];

      uint64_t v14 = [v13 URLByAppendingPathComponent:@"com.apple.kvs" isDirectory:1];

      if (v14) {
        goto LABEL_7;
      }
    }
  }
  uint64_t v14 = sub_10000E25C(a5);
  if (v14)
  {
LABEL_7:
    char v15 = sub_100009DE8(v7, v14);
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

+ (id)changedKeysForStoreIdentifier:(id)a3 sinceChangeTokenIfValid:(id)a4 inCoreDataStore:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  id v18 = 0;
  unsigned __int8 v11 = [v10 changedKeysForStoreIdentifier:v9 sinceChangeToken:a4 error:&v18];
  id v12 = v18;
  if (v12 && +[SYDCoreDataStore isInvalidTokenError:v12])
  {
    id v13 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Received error about a bad persistent history token. Throwing it away and trying again.", buf, 2u);
    }

    id v16 = 0;
    uint64_t v14 = [v10 changedKeysForStoreIdentifier:v9 sinceChangeToken:0 error:&v16];
    id v12 = v16;

    unsigned __int8 v11 = (void *)v14;
  }
  if (a6) {
    *a6 = v12;
  }

  return v11;
}

+ (id)changeDictionaryWithChangedKeys:(id)a3 reason:(int64_t)a4 changeToken:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[NSMutableDictionary dictionaryWithCapacity:2];
  if ([v7 count])
  {
    v13[0] = NSUbiquitousKeyValueStoreChangeReasonKey;
    id v10 = +[NSNumber numberWithInteger:a4];
    v13[1] = NSUbiquitousKeyValueStoreChangedKeysKey;
    v14[0] = v10;
    v14[1] = v7;
    unsigned __int8 v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

    [v9 setObject:v11 forKeyedSubscript:@"NSUbiquitousKeyValueStoreDidChangeExternallyNotificationUserInfo"];
  }
  if (v8) {
    [v9 setObject:v8 forKeyedSubscript:@"ChangeToken"];
  }

  return v9;
}

- (void)resume
{
  v3 = SYDGetConnectionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000F340(self);
  }

  id v4 = +[SYDClientToDaemonConnection daemonProtocolInterface];
  v5 = [(SYDDaemonToClientConnection *)self xpcConnection];
  [v5 setExportedInterface:v4];

  id v6 = [(SYDDaemonToClientConnection *)self xpcConnection];
  [v6 setExportedObject:self];

  id v7 = +[SYDClientToDaemonConnection clientProtocolInterface];
  id v8 = [(SYDDaemonToClientConnection *)self xpcConnection];
  [v8 setRemoteObjectInterface:v7];

  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_100022218;
  v14[3] = &unk_100051300;
  objc_copyWeak(&v15, &location);
  id v9 = [(SYDDaemonToClientConnection *)self xpcConnection];
  [v9 setInterruptionHandler:v14];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000222E8;
  v12[3] = &unk_100051300;
  objc_copyWeak(&v13, &location);
  id v10 = [(SYDDaemonToClientConnection *)self xpcConnection];
  [v10 setInvalidationHandler:v12];

  unsigned __int8 v11 = [(SYDDaemonToClientConnection *)self xpcConnection];
  [v11 resume];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (SYDDaemonToClientConnection)initWithXPCConnection:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)SYDDaemonToClientConnection;
  id v9 = [(SYDDaemonToClientConnection *)&v29 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xpcConnection, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.kvs.daemon-to-client.%d", [v7 processIdentifier]);
    id v11 = objc_claimAutoreleasedReturnValue();
    id v12 = (const char *)[v11 UTF8String];
    id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v14;

    id v16 = [v11 stringByAppendingString:@".callback"];

    id v17 = v16;
    id v18 = (const char *)[v17 UTF8String];
    id v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    callbackQueue = v10->_callbackQueue;
    v10->_callbackQueue = (OS_dispatch_queue *)v20;

    dispatch_queue_set_specific((dispatch_queue_t)v10->_queue, &v10->_queue, (void *)1, 0);
    uint64_t v22 = +[NSMutableSet set];
    registeredStoreIDs = v10->_registeredStoreIDs;
    v10->_registeredStoreIDs = (NSMutableSet *)v22;

    uint64_t v24 = +[NSMutableSet set];
    entitledStoreIDs = v10->_entitledStoreIDs;
    v10->_entitledStoreIDs = (NSMutableSet *)v24;

    v10->_manualSyncCount = 0;
    id v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v10 selector:"syncManagerDidChangeNotification:" name:@"SYDSyncManagerNotificationValuesDidChange" object:0];

    id v27 = +[NSNotificationCenter defaultCenter];
    [v27 addObserver:v10 selector:"daemonToClientConnectionDidChangeValues:" name:@"SYDDaemonToClientConnectionNotificationChangedValues" object:0];

    [(SYDDaemonToClientConnection *)v10 resume];
  }

  return v10;
}

+ (BOOL)isXPCConnection:(id)a3 entitledForStoreConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = SYDGetConnectionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000103F4();
  }

  id v8 = [v6 storeID];
  id v9 = [v8 identifier];
  id v10 = [(id)objc_opt_class() valueForEntitlement:@"com.apple.developer.ubiquity-kvstore-identifier" xpcConnection:v5 storeConfiguration:v6];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v10 isEqualToString:v9])
  {
    id v11 = [(id)objc_opt_class() valueForEntitlement:@"com.apple.private.ubiquity-additional-kvstore-identifiers" xpcConnection:v5 storeConfiguration:v6];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 containsObject:v9])
    {
      id v13 = SYDGetConnectionLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_100010990();
      }
      BOOL v12 = 1;
      goto LABEL_44;
    }
    uint64_t v22 = v8;
    id v13 = [(id)objc_opt_class() valueForEntitlement:@"com.apple.private.ubiquity-kvstore-identifier-prefix" xpcConnection:v5 storeConfiguration:v6];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 hasPrefix:v13])
    {
      dispatch_queue_t v14 = SYDGetConnectionLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_100033DFC();
      }
      BOOL v12 = 1;
      goto LABEL_43;
    }
    dispatch_queue_t v14 = [(id)objc_opt_class() valueForEntitlement:@"com.apple.private.ubiquity-kvstore-manage" xpcConnection:v5 storeConfiguration:v6];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v14 BOOLValue])
    {
      id v15 = SYDGetConnectionLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_100033E80();
      }
      BOOL v12 = 1;
      goto LABEL_42;
    }
    id v15 = [v5 valueForEntitlement:@"com.apple.private.trust-ubiquity-kvstore-identifier"];
    objc_opt_class();
    id v21 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v15 BOOLValue])
    {
      dispatch_queue_t v20 = SYDGetConnectionLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_100033F04();
      }
      BOOL v12 = 1;
      goto LABEL_41;
    }
    uint64_t v16 = [(id)objc_opt_class() valueForEntitlement:@"com.apple.private.ubiquity-kvstore-access" xpcConnection:v5 storeConfiguration:v6];
    objc_opt_class();
    dispatch_queue_t v20 = v16;
    if (objc_opt_isKindOfClass())
    {
      id v17 = SYDGetConnectionLog();
      id v15 = v21;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_100033F88();
      }
    }
    else
    {
      id v17 = [(id)objc_opt_class() valueForEntitlement:@"com.apple.private.kvs.test" xpcConnection:v5 storeConfiguration:v6];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v12 = 0;
        id v15 = v21;
        goto LABEL_40;
      }
      id v15 = v21;
      if (![v17 BOOLValue]
        || ![v9 hasPrefix:@"com.apple.kvs.test"])
      {
        BOOL v12 = 0;
        goto LABEL_40;
      }
      id v18 = SYDGetConnectionLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_10003400C();
      }
    }
    BOOL v12 = 1;
LABEL_40:

LABEL_41:
LABEL_42:

LABEL_43:
    id v8 = v22;
LABEL_44:

    goto LABEL_45;
  }
  id v11 = SYDGetConnectionLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100010A54();
  }
  BOOL v12 = 1;
LABEL_45:

  return v12;
}

+ (id)valueForEntitlement:(id)a3 xpcConnection:(id)a4 storeConfiguration:(id)a5
{
  return [a4 valueForEntitlement:a3];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SYDDaemonToClientConnection;
  [(SYDDaemonToClientConnection *)&v4 dealloc];
}

- (NSString)applicationIdentifier
{
  if (!self->_applicationIdentifier)
  {
    v3 = [(SYDDaemonToClientConnection *)self xpcConnection];

    if (!v3)
    {
      objc_super v4 = SYDGetConnectionLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        sub_100033CF4();
      }
    }
    id v5 = SYDGetConnectionLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Looking up application identifier for %@", buf, 0xCu);
    }

    id v6 = [(SYDDaemonToClientConnection *)self xpcConnection];
    id v7 = v6;
    if (v6) {
      [v6 auditToken];
    }
    else {
      memset(&token, 0, sizeof(token));
    }
    id v8 = SecTaskCreateWithAuditToken(0, &token);

    if (v8)
    {
      CFErrorRef error = 0;
      CFStringRef v9 = SecTaskCopySigningIdentifier(v8, &error);
      id v10 = (SYDDaemonToClientConnection *)v9;
      CFErrorRef v11 = error;
      if (error)
      {
        applicationIdentifier = SYDGetConnectionLog();
        if (os_log_type_enabled(applicationIdentifier, OS_LOG_TYPE_ERROR)) {
          sub_100033C8C();
        }
      }
      else
      {
        if (!v9)
        {
LABEL_23:
          CFRelease(v8);

          goto LABEL_24;
        }
        dispatch_queue_t v14 = SYDGetConnectionLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v21 = v10;
          __int16 v22 = 2112;
          id v23 = self;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Found application identifier %@ for %@", buf, 0x16u);
        }

        id v15 = v10;
        applicationIdentifier = self->_applicationIdentifier;
        self->_applicationIdentifier = v15;
      }

      goto LABEL_23;
    }
    id v13 = SYDGetConnectionLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100033C4C();
    }
  }
LABEL_24:
  uint64_t v16 = self->_applicationIdentifier;
  return v16;
}

+ (id)errorNotEntitledForStoreConfiguration:(id)a3
{
  v3 = [a3 storeID];
  objc_super v4 = [v3 identifier];
  id v5 = +[NSString stringWithFormat:@"Not entitled to access store %@", v4];

  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  id v10 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v7 = +[NSError errorWithDomain:@"SyncedDefaults" code:3333 userInfo:v6];

  return v7;
}

- (BOOL)shouldEnforceQuotaForStoreConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(SYDDaemonToClientConnection *)self ignoreQuotaEntitlementValue];

  if (!v5)
  {
    id v6 = objc_opt_class();
    id v7 = [(SYDDaemonToClientConnection *)self xpcConnection];
    id v8 = [v6 valueForEntitlement:@"com.apple.private.kvs.ignore-quota" xpcConnection:v7 storeConfiguration:v4];
    [(SYDDaemonToClientConnection *)self setIgnoreQuotaEntitlementValue:v8];
  }
  NSErrorUserInfoKey v9 = [(SYDDaemonToClientConnection *)self ignoreQuotaEntitlementValue];
  char v10 = [v9 BOOLValue] ^ 1;

  return v10;
}

- (void)setObject:(id)a3 forKey:(id)a4 inStoreWithConfiguration:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, uint64_t))a6;
  if (![(SYDDaemonToClientConnection *)self isEntitledForStoreConfiguration:v12])
  {
    uint64_t v27 = [(id)objc_opt_class() errorNotEntitledForStoreConfiguration:v12];
LABEL_13:
    id v28 = (void *)v27;
    v13[2](v13, v27);

    goto LABEL_14;
  }
  if (![(SYDDaemonToClientConnection *)self isKnownStore:v12])
  {
    uint64_t v27 = [(id)objc_opt_class() errorForUnknownStore:v12];
    goto LABEL_13;
  }
  dispatch_queue_t v14 = SYDGetConnectionLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100034090();
  }

  char v31 = 0;
  id v15 = [(SYDDaemonToClientConnection *)self delegate];
  uint64_t v16 = [v12 storeID];
  id v30 = 0;
  id v17 = [v15 connection:self syncManagerForStoreID:v16 error:&v30];
  id v18 = v30;

  if (v17)
  {
    if (!v18)
    {
      BOOL v19 = [(SYDDaemonToClientConnection *)self shouldEnforceQuotaForStoreConfiguration:v12];
      dispatch_queue_t v20 = [v12 storeID];
      id v21 = [v20 identifier];
      id v29 = 0;
      [v17 setObject:v10 forKey:v11 inStoreWithIdentifier:v21 excludeFromChangeTracking:1 enforceQuota:v19 didChangeValue:&v31 error:&v29];
      id v18 = v29;

      if (!v18)
      {
        if (v31)
        {
          __int16 v22 = +[NSNotificationCenter defaultCenter];
          id v32 = v11;
          v33[0] = @"changedKeys";
          id v23 = +[NSArray arrayWithObjects:&v32 count:1];
          v33[1] = @"storeID";
          v34[0] = v23;
          uint64_t v24 = [v12 storeID];
          v34[1] = v24;
          v25 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
          [v22 postNotificationName:@"SYDDaemonToClientConnectionNotificationChangedValues" object:self userInfo:v25];

          id v18 = 0;
        }
      }
    }
  }
  id v26 = sub_1000084BC(v18);
  v13[2](v13, (uint64_t)v26);

LABEL_14:
}

- (void)removeObjectForKey:(id)a3 inStoreWithConfiguration:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  if (![(SYDDaemonToClientConnection *)self isEntitledForStoreConfiguration:v9])
  {
    uint64_t v19 = [(id)objc_opt_class() errorNotEntitledForStoreConfiguration:v9];
LABEL_11:
    dispatch_queue_t v20 = (void *)v19;
    v10[2](v10, v19);

    goto LABEL_12;
  }
  if (![(SYDDaemonToClientConnection *)self isKnownStore:v9])
  {
    uint64_t v19 = [(id)objc_opt_class() errorForUnknownStore:v9];
    goto LABEL_11;
  }
  id v11 = SYDGetConnectionLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1000340F8();
  }

  id v12 = [(SYDDaemonToClientConnection *)self delegate];
  id v13 = [v9 storeID];
  id v22 = 0;
  dispatch_queue_t v14 = [v12 connection:self syncManagerForStoreID:v13 error:&v22];
  id v15 = v22;

  if (v14 && !v15)
  {
    uint64_t v16 = [v9 storeID];
    id v17 = [v16 identifier];
    id v21 = 0;
    [v14 removeObjectForKey:v8 inStoreWithIdentifier:v17 excludeFromChangeTracking:1 error:&v21];
    id v15 = v21;
  }
  id v18 = sub_1000084BC(v15);
  v10[2](v10, (uint64_t)v18);

LABEL_12:
}

- (void)synchronizeStoresWithIdentifiers:(id)a3 type:(int64_t)a4 testConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v35 = a5;
  id v34 = a6;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v41;
    while (2)
    {
      id v15 = 0;
      do
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [objc_alloc((Class)SYDStoreID) initWithIdentifier:*(void *)(*((void *)&v40 + 1) + 8 * (void)v15) type:a4];
        [v16 setTestConfiguration:v35];
        id v17 = [objc_alloc((Class)SYDStoreConfiguration) initWithStoreID:v16];
        if (![(SYDDaemonToClientConnection *)self isEntitledForStoreConfiguration:v17])
        {
          id v28 = [(id)objc_opt_class() errorNotEntitledForStoreConfiguration:v17];
          uint64_t v27 = v34;
          (*((void (**)(id, void *))v34 + 2))(v34, v28);

          goto LABEL_24;
        }

        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  id v18 = [v11 count];
  uint64_t v19 = SYDGetConnectionLog();
  dispatch_queue_t v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_10003425C();
    }

    id v21 = objc_alloc((Class)SYDStoreID);
    id v22 = [v11 firstObject];
    id v23 = [v21 initWithIdentifier:v22 type:a4];

    [v23 setTestConfiguration:v35];
    uint64_t v24 = [(SYDDaemonToClientConnection *)self delegate];
    id v38 = 0;
    v25 = [v24 connection:self syncManagerForStoreID:v23 error:&v38];
    id v26 = v38;

    if (v25)
    {
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100022EC8;
      v36[3] = &unk_100051198;
      void v36[4] = self;
      uint64_t v27 = v34;
      id v37 = v34;
      [v25 synchronizeStoresWithIdentifiers:v11 completionHandler:v36];
    }
    else
    {
      id v29 = SYDGetConnectionLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_1000341C8(a4, v29);
      }

      id v30 = sub_10000AC60(a4);
      char v31 = +[NSString stringWithFormat:@"No sync manager trying to sync stores with type %@", v30];

      if (!v26)
      {
        NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
        v45 = v31;
        id v32 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        id v26 = +[NSError errorWithDomain:@"SyncedDefaults" code:1234 userInfo:v32];
      }
      id v33 = sub_1000084BC(v26);
      uint64_t v27 = v34;
      (*((void (**)(id, void *))v34 + 2))(v34, v33);
    }
  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Asked to sync zero stores", buf, 2u);
    }

    uint64_t v27 = v34;
    (*((void (**)(id, void))v34 + 2))(v34, 0);
  }
LABEL_24:
}

- (void)allStoreIdentifiersWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  id v5 = SYDGetConnectionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100034308();
  }

  id v6 = [(SYDDaemonToClientConnection *)self xpcConnection];
  id v7 = [v6 valueForEntitlement:@"com.apple.private.ubiquity-kvsutil-access"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 BOOLValue])
  {
    id v8 = [(SYDDaemonToClientConnection *)self delegate];
    id v12 = 0;
    id v9 = [v8 allStoreIdentifiersWithError:&v12];
    id v10 = v12;

    if (!v4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (qword_10005BB98 != -1)
  {
    dispatch_once(&qword_10005BB98, &stru_1000513C0);
    id v10 = 0;
    id v9 = 0;
    if (!v4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v10 = 0;
  id v9 = 0;
  if (v4)
  {
LABEL_9:
    id v11 = sub_1000084BC(v10);
    v4[2](v4, v9, v11);
  }
LABEL_10:
}

- (BOOL)isCloudSyncEnablementEntitledForStoreIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SYDDaemonToClientConnection *)self xpcConnection];
  id v6 = [v5 valueForEntitlement:@"com.apple.private.kvs.allow-sync-enablement-modifications"];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v6 BOOLValue])
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = SYDGetConnectionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_10003437C();
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (void)isCloudSyncUserDefaultEnabledForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  if ([(SYDDaemonToClientConnection *)self isCloudSyncEnablementEntitledForStoreIdentifier:v9])
  {
    BOOL v7 = +[SYDStoreBundleMap sharedInstance];
    uint64_t v8 = (uint64_t)[v7 isCloudSyncUserDefaultEnabledForStoreIdentifier:v9];
  }
  else
  {
    uint64_t v8 = 1;
  }
  v6[2](v6, v8);
}

- (void)setCloudSyncUserDefaultEnabled:(BOOL)a3 storeIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (-[SYDDaemonToClientConnection isCloudSyncEnablementEntitledForStoreIdentifier:](self, "isCloudSyncEnablementEntitledForStoreIdentifier:"))
  {
    id v6 = +[SYDStoreBundleMap sharedInstance];
    [v6 setCloudSyncUserDefaultEnabled:v4 storeIdentifier:v7];
  }
}

- (void)processAccountChangesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SYDDaemonToClientConnection *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000234DC;
  v7[3] = &unk_1000513A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)syncManagerDidChangeNotification:(id)a3
{
  id v4 = a3;
  if (![(SYDDaemonToClientConnection *)self isPerformingManualSync])
  {
    id v5 = [(SYDDaemonToClientConnection *)self queue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100023694;
    v6[3] = &unk_100050AA0;
    id v7 = v4;
    id v8 = self;
    dispatch_async(v5, v6);
  }
}

- (void)notifyAccountDidChangeWithCompletionHandler:(id)a3
{
}

- (void)notifyAccountDidChangeFromAccountID:(id)a3 toAccountID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create((void *)&_mh_execute_header, "kvs/notify-account-change", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  id v12 = [(SYDDaemonToClientConnection *)self queue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100023CF8;
  v16[3] = &unk_100051438;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);

  os_activity_scope_leave(&state);
}

- (void)daemonToClientConnectionDidChangeValues:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];

  if (v5 != self)
  {
    id v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"storeID"];

    id v8 = [v4 userInfo];
    id v9 = [v8 objectForKeyedSubscript:@"changedKeys"];

    if (v7 && [v9 count])
    {
      uint64_t v34 = 0;
      id v35 = &v34;
      uint64_t v36 = 0x2020000000;
      char v37 = 0;
      id v10 = [(SYDDaemonToClientConnection *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000245EC;
      block[3] = &unk_100051328;
      id v33 = &v34;
      void block[4] = self;
      id v11 = v7;
      id v32 = v11;
      dispatch_sync(v10, block);

      if (*((unsigned char *)v35 + 24))
      {
        id v12 = [(SYDDaemonToClientConnection *)self delegate];
        id v30 = 0;
        id v13 = [v12 connection:self syncManagerForStoreID:v11 error:&v30];
        id v14 = v30;

        if (!v13 || v14)
        {
          id v17 = SYDGetConnectionLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_100034C64();
          }
        }
        else
        {
          id v15 = [v13 coreDataStore];
          id v16 = [v11 identifier];
          id v29 = 0;
          id v17 = [v15 currentChangeTokenForStoreIdentifier:v16 error:&v29];
          id v14 = v29;

          if (v14)
          {
            id v18 = SYDGetConnectionLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_100034CCC();
            }
          }
          else
          {
            dispatch_queue_t v20 = [(id)objc_opt_class() changeDictionaryWithChangedKeys:v9 reason:0 changeToken:v17];
            id v21 = SYDGetConnectionLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              v25 = v20;
              unsigned int v24 = [v9 count];
              id v22 = [v11 identifier];
              *(_DWORD *)buf = 67109378;
              unsigned int v39 = v24;
              __int16 v40 = 2112;
              long long v41 = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Sending notification about %d changed keys for store <(%@)>", buf, 0x12u);

              dispatch_queue_t v20 = v25;
            }

            id v23 = [v11 personaUniqueString];
            v26[0] = _NSConcreteStackBlock;
            v26[1] = 3221225472;
            v26[2] = sub_10002464C;
            v26[3] = &unk_100050B90;
            v26[4] = self;
            id v27 = v11;
            id v18 = v20;
            id v28 = v18;
            sub_100018CC4(v23, v26);
          }
        }
      }
      _Block_object_dispose(&v34, 8);
    }
    else
    {
      id v19 = SYDGetConnectionLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_100034BFC();
      }
    }
  }
}

- (id)client
{
  v2 = [(SYDDaemonToClientConnection *)self xpcConnection];
  v3 = [v2 _unboostingRemoteObjectProxy];

  return v3;
}

+ (id)errorForUnknownStore:(id)a3
{
  v3 = [a3 storeID];
  id v4 = [v3 identifier];
  id v5 = +[NSString stringWithFormat:@"Tried to access unknown store %@", v4];

  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  id v10 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v7 = +[NSError errorWithDomain:@"SyncedDefaults" code:101010 userInfo:v6];

  return v7;
}

- (BOOL)isPerformingManualSync
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(SYDDaemonToClientConnection *)v2 manualSyncCount] != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (void)setXpcConnection:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setCallbackQueue:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void)setRegisteredStoreIDs:(id)a3
{
}

- (void)setEntitledStoreIDs:(id)a3
{
}

- (NSMutableSet)notEntitledStoreIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNotEntitledStoreIDs:(id)a3
{
}

- (NSNumber)ignoreQuotaEntitlementValue
{
  return self->_ignoreQuotaEntitlementValue;
}

- (void)setIgnoreQuotaEntitlementValue:(id)a3
{
}

- (BOOL)didRefreshBundleMap
{
  return self->_didRefreshBundleMap;
}

- (void)setDidRefreshBundleMap:(BOOL)a3
{
  self->_didRefreshBundleMap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreQuotaEntitlementValue, 0);
  objc_storeStrong((id *)&self->_notEntitledStoreIDs, 0);
  objc_storeStrong((id *)&self->_entitledStoreIDs, 0);
  objc_storeStrong((id *)&self->_registeredStoreIDs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end