@interface CKKSOperationDependencies
- (BOOL)considerSelfTrusted:(id)a3 error:(id *)a4;
- (BOOL)intransactionCKRecordChanged:(id)a3 resync:(BOOL)a4;
- (BOOL)intransactionCKRecordDeleted:(id)a3 recordType:(id)a4 resync:(BOOL)a5;
- (BOOL)intransactionCKWriteFailed:(id)a3 attemptedRecordsChanged:(id)a4;
- (BOOL)limitOperationToPriorityViewsSet;
- (BOOL)sendMetric;
- (BOOL)zoneModifierHalted;
- (CKDatabase)ckdatabase;
- (CKKSAccountStateTracker)accountStateTracker;
- (CKKSCloudKitClassDependencies)cloudKitClassDependencies;
- (CKKSDatabaseProviderProtocol)databaseProvider;
- (CKKSLockStateTracker)lockStateTracker;
- (CKKSNearFutureScheduler)cloudkitRetryAfter;
- (CKKSNearFutureScheduler)requestPolicyCheck;
- (CKKSNearFutureScheduler)savedTLKNotifier;
- (CKKSOperationDependencies)initWithViewStates:(id)a3 contextID:(id)a4 activeAccount:(id)a5 ckdatabase:(id)a6 cloudKitClassDependencies:(id)a7 ckoperationGroup:(id)a8 flagHandler:(id)a9 overallLaunch:(id)a10 accountStateTracker:(id)a11 lockStateTracker:(id)a12 reachabilityTracker:(id)a13 peerProviders:(id)a14 databaseProvider:(id)a15 savedTLKNotifier:(id)a16 personaAdapter:(id)a17 sendMetric:(BOOL)a18;
- (CKKSReachabilityTracker)reachabilityTracker;
- (CKOperationGroup)ckoperationGroup;
- (CKOperationGroup)currentOutgoingQueueOperationGroup;
- (NSArray)peerProviders;
- (NSHashTable)keysetProviderOperations;
- (NSMutableSet)currentFetchReasons;
- (NSSet)activeManagedViews;
- (NSSet)allCKKSManagedViews;
- (NSSet)allExternalManagedViews;
- (NSSet)allPriorityViews;
- (NSSet)allViews;
- (NSSet)views;
- (NSSet)viewsOverride;
- (NSString)contextID;
- (OTPersonaAdapter)personaAdapter;
- (OctagonStateFlagHandler)flagHandler;
- (SecLaunchSequence)overallLaunch;
- (TPSpecificUser)activeAccount;
- (TPSyncingPolicy)syncingPolicy;
- (id)currentTrustStates;
- (id)keychainMusrForCurrentAccount;
- (id)readyAndSyncingViews;
- (id)viewNameForItem:(SecDbItem *)a3;
- (id)viewStateForName:(id)a3;
- (id)viewStatesByNames:(id)a3;
- (id)viewsInState:(id)a3;
- (void)applyNewSyncingPolicy:(id)a3 viewStates:(id)a4;
- (void)inspectErrorForRetryAfter:(id)a3;
- (void)limitOperationToPriorityViews;
- (void)operateOnAllViews;
- (void)operateOnSelectViews:(id)a3;
- (void)provideKeySets:(id)a3;
- (void)setActiveAccount:(id)a3;
- (void)setAllPriorityViews:(id)a3;
- (void)setAllViews:(id)a3;
- (void)setCkdatabase:(id)a3;
- (void)setCkoperationGroup:(id)a3;
- (void)setCloudKitClassDependencies:(id)a3;
- (void)setCurrentOutgoingQueueOperationGroup:(id)a3;
- (void)setKeysetProviderOperations:(id)a3;
- (void)setLimitOperationToPriorityViewsSet:(BOOL)a3;
- (void)setPeerProviders:(id)a3;
- (void)setPersonaAdapter:(id)a3;
- (void)setRequestPolicyCheck:(id)a3;
- (void)setSendMetric:(BOOL)a3;
- (void)setStateForActiveCKKSManagedViews:(id)a3;
- (void)setStateForActiveExternallyManagedViews:(id)a3;
- (void)setStateForActiveZones:(id)a3;
- (void)setStateForAllViews:(id)a3;
- (void)setSyncingPolicy:(id)a3;
- (void)setViewsOverride:(id)a3;
- (void)setZoneModifierHalted:(BOOL)a3;
@end

@implementation CKKSOperationDependencies

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewsOverride, 0);
  objc_storeStrong((id *)&self->_cloudkitRetryAfter, 0);
  objc_storeStrong((id *)&self->_keysetProviderOperations, 0);
  objc_storeStrong((id *)&self->_requestPolicyCheck, 0);
  objc_storeStrong((id *)&self->_savedTLKNotifier, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_syncingPolicy, 0);
  objc_storeStrong((id *)&self->_peerProviders, 0);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_accountStateTracker, 0);
  objc_storeStrong((id *)&self->_overallLaunch, 0);
  objc_storeStrong((id *)&self->_flagHandler, 0);
  objc_storeStrong((id *)&self->_currentOutgoingQueueOperationGroup, 0);
  objc_storeStrong((id *)&self->_cloudKitClassDependencies, 0);
  objc_storeStrong((id *)&self->_ckdatabase, 0);
  objc_storeStrong((id *)&self->_ckoperationGroup, 0);
  objc_storeStrong((id *)&self->_currentFetchReasons, 0);
  objc_storeStrong((id *)&self->_personaAdapter, 0);
  objc_storeStrong((id *)&self->_activeAccount, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_allViews, 0);

  objc_storeStrong((id *)&self->_allPriorityViews, 0);
}

- (void)setZoneModifierHalted:(BOOL)a3
{
  self->_zoneModifierHalted = a3;
}

- (BOOL)zoneModifierHalted
{
  return self->_zoneModifierHalted;
}

- (void)setLimitOperationToPriorityViewsSet:(BOOL)a3
{
  self->_limitOperationToPriorityViewsSet = a3;
}

- (BOOL)limitOperationToPriorityViewsSet
{
  return self->_limitOperationToPriorityViewsSet;
}

- (void)setViewsOverride:(id)a3
{
}

- (NSSet)viewsOverride
{
  return (NSSet *)objc_getProperty(self, a2, 192, 1);
}

- (CKKSNearFutureScheduler)cloudkitRetryAfter
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 184, 1);
}

- (void)setSendMetric:(BOOL)a3
{
  self->_sendMetric = a3;
}

- (BOOL)sendMetric
{
  return self->_sendMetric;
}

- (void)setKeysetProviderOperations:(id)a3
{
}

- (NSHashTable)keysetProviderOperations
{
  return (NSHashTable *)objc_getProperty(self, a2, 176, 1);
}

- (void)setRequestPolicyCheck:(id)a3
{
}

- (CKKSNearFutureScheduler)requestPolicyCheck
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 168, 1);
}

- (CKKSNearFutureScheduler)savedTLKNotifier
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 160, 1);
}

- (CKKSDatabaseProviderProtocol)databaseProvider
{
  return (CKKSDatabaseProviderProtocol *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSyncingPolicy:(id)a3
{
}

- (TPSyncingPolicy)syncingPolicy
{
  return (TPSyncingPolicy *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPeerProviders:(id)a3
{
}

- (NSArray)peerProviders
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 128, 1);
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 120, 1);
}

- (CKKSAccountStateTracker)accountStateTracker
{
  return (CKKSAccountStateTracker *)objc_getProperty(self, a2, 112, 1);
}

- (SecLaunchSequence)overallLaunch
{
  return (SecLaunchSequence *)objc_getProperty(self, a2, 104, 1);
}

- (OctagonStateFlagHandler)flagHandler
{
  return (OctagonStateFlagHandler *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCurrentOutgoingQueueOperationGroup:(id)a3
{
}

- (CKOperationGroup)currentOutgoingQueueOperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCloudKitClassDependencies:(id)a3
{
}

- (CKKSCloudKitClassDependencies)cloudKitClassDependencies
{
  return (CKKSCloudKitClassDependencies *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCkdatabase:(id)a3
{
}

- (CKDatabase)ckdatabase
{
  return (CKDatabase *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCkoperationGroup:(id)a3
{
}

- (CKOperationGroup)ckoperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 64, 1);
}

- (NSMutableSet)currentFetchReasons
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPersonaAdapter:(id)a3
{
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setActiveAccount:(id)a3
{
}

- (TPSpecificUser)activeAccount
{
  return (TPSpecificUser *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAllViews:(id)a3
{
}

- (NSSet)allViews
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAllPriorityViews:(id)a3
{
}

- (NSSet)allPriorityViews
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)inspectErrorForRetryAfter:(id)a3
{
  id v4 = a3;
  CKRetryAfterSecondsForError();
  if (v5 != 0.0)
  {
    double v6 = v5;
    unint64_t v7 = 1000000000 * (unint64_t)v5;
    v8 = sub_1000CD884(@"ckkszonemodifier", 0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218242;
      double v11 = v6;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CK operation failed with rate-limit, scheduling delay for %.1f seconds: %@", (uint8_t *)&v10, 0x16u);
    }

    v9 = [(CKKSOperationDependencies *)self cloudkitRetryAfter];
    [v9 waitUntil:v7];
  }
}

- (id)keychainMusrForCurrentAccount
{
  v2 = [(CKKSOperationDependencies *)self activeAccount];
  v3 = [v2 personaUniqueString];

  if (v3)
  {
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:v3];
    double v5 = v4;
    if (v4)
    {
      v9[0] = 0xAAAAAAAAAAAAAAAALL;
      v9[1] = 0xAAAAAAAAAAAAAAAALL;
      [v4 getUUIDBytes:v9];
      uint64_t v6 = +[NSData dataWithBytes:v9 length:16];
    }
    else
    {
      uint64_t v6 = [v3 dataUsingEncoding:4];
    }
    unint64_t v7 = (void *)v6;
  }
  else
  {
    if (qword_10035CF58 != -1) {
      dispatch_once(&qword_10035CF58, &stru_1002FAF90);
    }
    unint64_t v7 = (void *)CFRetain((CFTypeRef)qword_10035CF60);
  }

  return v7;
}

- (id)viewNameForItem:(SecDbItem *)a3
{
  CFTypeRef cf = 0;
  double v5 = sub_100118B3C(a3, 0x10000, 0, (__CFString **)&cf);
  uint64_t v6 = v5;
  if (cf)
  {
    unint64_t v7 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v17 = cf;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Couldn't fetch attributes from item: %@", buf, 0xCu);
    }

    CFTypeRef v8 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v8);
    }
    v9 = 0;
  }
  else
  {
    [(__CFDictionary *)v5 setObject:a3->var1->var0 forKeyedSubscript:kSecClass];
    int v10 = [(CKKSOperationDependencies *)self syncingPolicy];
    v9 = [v10 mapDictionaryToView:v6];

    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      __int16 v12 = sub_1000CD884(@"ckks", 0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = [(CKKSOperationDependencies *)self syncingPolicy];
        *(_DWORD *)buf = 138412547;
        CFTypeRef v17 = v13;
        __int16 v18 = 2113;
        v19 = a3;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "No view returned from policy (%@): %{private}@", buf, 0x16u);
      }
    }
  }

  return v9;
}

- (BOOL)intransactionCKWriteFailed:(id)a3 attemptedRecordsChanged:(id)a4
{
  id v5 = a3;
  id v66 = a4;
  uint64_t v6 = [v5 userInfo];
  unint64_t v7 = [v6 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

  CFTypeRef v8 = [v5 domain];
  if (![v8 isEqual:CKErrorDomain] || objc_msgSend(v5, "code") != (id)2)
  {

    goto LABEL_23;
  }

  if (!v7)
  {
LABEL_23:
    BOOL v19 = 0;
    goto LABEL_24;
  }
  id v63 = v5;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  v9 = [v7 allValues];
  id v10 = [v9 countByEnumeratingWithState:&v83 objects:v95 count:16];
  v74 = v7;
  if (!v10)
  {

    goto LABEL_26;
  }
  id v11 = v10;
  uint64_t v12 = *(void *)v84;
  char v13 = 1;
  do
  {
    v14 = 0;
    do
    {
      if (*(void *)v84 != v12) {
        objc_enumerationMutation(v9);
      }
      v15 = *(void **)(*((void *)&v83 + 1) + 8 * (void)v14);
      v16 = [v15 domain];
      if (![v16 isEqual:CKErrorDomain])
      {

LABEL_14:
        char v13 = 0;
        goto LABEL_15;
      }
      if ([v15 code] == (id)22 || objc_msgSend(v15, "code") == (id)14)
      {

        goto LABEL_15;
      }
      id v17 = [v15 code];

      if (v17 != (id)11) {
        goto LABEL_14;
      }
LABEL_15:
      v14 = (char *)v14 + 1;
    }
    while (v11 != v14);
    id v18 = [v9 countByEnumeratingWithState:&v83 objects:v95 count:16];
    id v11 = v18;
  }
  while (v18);

  if ((v13 & 1) == 0) {
    goto LABEL_50;
  }
LABEL_26:
  v21 = sub_1000CD884(@"ckks", 0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received a ServerRecordChanged error, attempting to update new records and delete unknown ones", buf, 2u);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v22 = [v7 allKeys];
  id v72 = [v22 countByEnumeratingWithState:&v79 objects:v94 count:16];
  if (!v72)
  {

    goto LABEL_50;
  }
  int v23 = 0;
  id v24 = *(id *)v80;
  id obj = *(id *)v80;
  while (2)
  {
    v25 = 0;
    while (2)
    {
      if (*(id *)v80 != v24) {
        objc_enumerationMutation(v22);
      }
      v26 = *(void **)(*((void *)&v79 + 1) + 8 * (void)v25);
      v27 = [v7 objectForKeyedSubscript:v26];
      v28 = [v27 domain];
      if ([v28 isEqual:CKErrorDomain])
      {
        id v29 = [v27 code];

        if (v29 == (id)14)
        {
          v30 = [v27 userInfo];
          v31 = [v30 objectForKeyedSubscript:CKRecordChangedErrorServerRecordKey];

          v32 = [v26 zoneID];
          v33 = [v32 zoneName];
          v34 = sub_1000CD884(@"ckks", v33);

          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v88 = v31;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "On error: updating our idea of: %@", buf, 0xCu);
          }

          v23 |= [(CKKSOperationDependencies *)self intransactionCKRecordChanged:v31 resync:1];
          goto LABEL_44;
        }
      }
      else
      {
      }
      v31 = [v27 domain];
      if (![v31 isEqual:CKErrorDomain]) {
        goto LABEL_44;
      }
      id v35 = [v27 code];

      if (v35 == (id)11)
      {
        v36 = v22;
        v31 = [v66 objectForKeyedSubscript:v26];
        v37 = [v26 zoneID];
        v38 = [v37 zoneName];
        v39 = sub_1000CD884(@"ckks", v38);

        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v88 = v26;
          __int16 v89 = 2112;
          v90 = v31;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "On error: handling an unexpected delete of: %@ %@", buf, 0x16u);
        }

        v40 = [v31 recordType];
        v23 |= [(CKKSOperationDependencies *)self intransactionCKRecordDeleted:v26 recordType:v40 resync:1];

        v22 = v36;
        id v24 = obj;
LABEL_44:
      }
      v25 = (char *)v25 + 1;
      unint64_t v7 = v74;
      if (v72 != v25) {
        continue;
      }
      break;
    }
    id v72 = [v22 countByEnumeratingWithState:&v79 objects:v94 count:16];
    if (v72) {
      continue;
    }
    break;
  }

  if (v23)
  {
    v41 = [(CKKSOperationDependencies *)self flagHandler];
    [v41 _onqueueHandleFlag:@"process_incoming_queue"];

    BOOL v19 = 1;
    goto LABEL_79;
  }
LABEL_50:
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obja = [v7 allKeys];
  id v73 = [obja countByEnumeratingWithState:&v75 objects:v93 count:16];
  if (!v73) {
    goto LABEL_78;
  }
  uint64_t v71 = *(void *)v76;
  uint64_t v67 = CKUnderlyingErrorDomain;
  while (2)
  {
    v42 = 0;
    while (2)
    {
      if (*(void *)v76 != v71) {
        objc_enumerationMutation(obja);
      }
      v43 = *(void **)(*((void *)&v75 + 1) + 8 * (void)v42);
      v44 = [v7 objectForKeyedSubscript:v43];
      v45 = [v44 userInfo];
      v46 = [v45 objectForKeyedSubscript:NSUnderlyingErrorKey];

      v47 = [v46 userInfo];
      v48 = [v47 objectForKeyedSubscript:NSUnderlyingErrorKey];

      v49 = [v43 zoneID];
      v50 = [v49 zoneName];
      v51 = sub_1000CD884(@"ckks", v50);

      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v88 = v44;
        __int16 v89 = 2112;
        v90 = v46;
        __int16 v91 = 2112;
        v92 = v48;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Examining 'write failed' error: %@ %@ %@", buf, 0x20u);
      }

      v52 = [v44 domain];
      if (![v52 isEqualToString:CKErrorDomain]
        || [v44 code] != (id)15
        || !v46)
      {
        goto LABEL_68;
      }
      v53 = [v46 domain];
      if (![v53 isEqualToString:v67] || objc_msgSend(v46, "code") != (id)6000 || !v48)
      {

        goto LABEL_68;
      }
      v54 = [v48 domain];
      unsigned int v64 = [v54 isEqualToString:@"CloudkitKeychainService"];

      if (v64)
      {
        if ([v48 code] == (id)9)
        {
          v55 = [v43 zoneID];
          v56 = [v55 zoneName];
          v52 = sub_1000CD884(@"ckks", v56);

          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
LABEL_73:
            *(_DWORD *)buf = 138412546;
            v88 = v48;
            __int16 v89 = 2112;
            v90 = v43;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "CKKS Server extension has told us about %@ for record %@; requesting refetch and reprocess of key hierarchy",
              buf,
              0x16u);
          }
LABEL_74:

          v60 = [(CKKSOperationDependencies *)self currentFetchReasons];
          [v60 addObject:@"keyhierarchy"];

          v61 = [(CKKSOperationDependencies *)self currentFetchReasons];
          [v61 addObject:@"conflict"];

          v52 = [(CKKSOperationDependencies *)self flagHandler];
          [v52 _onqueueHandleFlag:@"fetch_requested"];
        }
        else
        {
          id v65 = [v48 code];
          v57 = [v43 zoneID];
          v58 = [v57 zoneName];
          v52 = sub_1000CD884(@"ckks", v58);

          BOOL v59 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
          if (v65 == (id)2)
          {
            if (v59) {
              goto LABEL_73;
            }
            goto LABEL_74;
          }
          if (v59)
          {
            *(_DWORD *)buf = 138412546;
            v88 = v48;
            __int16 v89 = 2112;
            v90 = v43;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "CKKS Server extension has told us about %@ for record %@, but we don't currently handle this error", buf, 0x16u);
          }
        }
LABEL_68:
      }
      v42 = (char *)v42 + 1;
      unint64_t v7 = v74;
      if (v73 != v42) {
        continue;
      }
      break;
    }
    id v62 = [obja countByEnumeratingWithState:&v75 objects:v93 count:16];
    id v73 = v62;
    if (v62) {
      continue;
    }
    break;
  }
LABEL_78:

  BOOL v19 = 0;
LABEL_79:
  id v5 = v63;
LABEL_24:

  return v19;
}

- (BOOL)intransactionCKRecordDeleted:(id)a3 recordType:(id)a4 resync:(BOOL)a5
{
  BOOL v5 = a5;
  CFTypeRef v8 = a3;
  v9 = a4;
  id v10 = [v8 zoneID];
  id v11 = [v10 zoneName];
  uint64_t v12 = sub_1000CD884(@"ckksfetch", v11);

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    char v13 = [v8 recordName];
    *(_DWORD *)buf = 138412546;
    v31 = v9;
    __int16 v32 = 2112;
    v33 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Processing record deletion(%@): %@", buf, 0x16u);
  }
  if ([v9 isEqual:@"item"])
  {
    v14 = CKKSItem;
    v15 = [(CKKSOperationDependencies *)self contextID];
    uint64_t v29 = 0;
    v16 = (id *)&v29;
    id v17 = &v29;
    goto LABEL_13;
  }
  if ([v9 isEqual:@"currentitem"])
  {
    v14 = CKKSCurrentItemPointer;
    v15 = [(CKKSOperationDependencies *)self contextID];
    uint64_t v28 = 0;
    v16 = (id *)&v28;
    id v17 = &v28;
    goto LABEL_13;
  }
  if ([v9 isEqual:@"synckey"]) {
    goto LABEL_19;
  }
  if ([v9 isEqual:@"tlkshare"])
  {
    v14 = CKKSTLKShareRecord;
    v15 = [(CKKSOperationDependencies *)self contextID];
    uint64_t v27 = 0;
    v16 = (id *)&v27;
    id v17 = &v27;
    goto LABEL_13;
  }
  if ([v9 isEqualToString:@"currentkey"])
  {
LABEL_19:
    BOOL v22 = 1;
    goto LABEL_20;
  }
  if (![v9 isEqual:@"devicestate"])
  {
    if (([v9 isEqualToString:@"manifest"] & 1) == 0)
    {
      id v24 = [v8 zoneID];
      v25 = [v24 zoneName];
      id v18 = sub_1000CD884(@"ckksfetch", v25);

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v31 = v9;
        __int16 v32 = 2112;
        v33 = v8;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "unknown record type: %@ %@", buf, 0x16u);
      }
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  v14 = CKKSDeviceStateEntry;
  v15 = [(CKKSOperationDependencies *)self contextID];
  uint64_t v26 = 0;
  v16 = (id *)&v26;
  id v17 = &v26;
LABEL_13:
  -[__objc2_class intransactionRecordDeleted:contextID:resync:error:](v14, "intransactionRecordDeleted:contextID:resync:error:", v8, v15, v5, v17, v26, v27, v28, v29);
  id v18 = *v16;

  if (!v18) {
    goto LABEL_19;
  }
  BOOL v19 = [v8 zoneID];
  v20 = [v19 zoneName];
  v21 = sub_1000CD884(@"ckksfetch", v20);

  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v31 = v8;
    __int16 v32 = 2112;
    v33 = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Record deletion(%@) failed:: %@", buf, 0x16u);
  }

LABEL_17:
  BOOL v22 = 0;
LABEL_20:

  return v22;
}

- (BOOL)intransactionCKRecordChanged:(id)a3 resync:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = a3;
  CFTypeRef v8 = [v6 objectForKeyedSubscript:@"parentkeyref"];
  v9 = [v6 recordID];
  id v10 = [v9 zoneID];
  id v11 = [v10 zoneName];
  uint64_t v12 = sub_1000CD884(@"ckksfetch", v11);

  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (!v13) {
      goto LABEL_7;
    }
    v14 = [v6 recordType];
    v15 = [v6 recordID];
    v16 = [v6 recordChangeTag];
    *(_DWORD *)buf = 138413058;
    BOOL v59 = v14;
    __int16 v60 = 2112;
    v61 = v15;
    __int16 v62 = 2112;
    id v63 = v16;
    __int16 v64 = 2112;
    id v65 = v8;
    id v17 = "Processing record modification(%@): %@ changeTag: %@ parentKeyRef: %@";
    id v18 = v12;
    uint32_t v19 = 42;
  }
  else
  {
    if (!v13) {
      goto LABEL_7;
    }
    v14 = [v6 recordType];
    v15 = [v6 recordID];
    v16 = [v6 recordChangeTag];
    *(_DWORD *)buf = 138412802;
    BOOL v59 = v14;
    __int16 v60 = 2112;
    v61 = v15;
    __int16 v62 = 2112;
    id v63 = v16;
    id v17 = "Processing record modification(%@): %@ changeTag: %@";
    id v18 = v12;
    uint32_t v19 = 32;
  }
  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);

LABEL_7:
  v20 = [v6 recordType];
  unsigned int v21 = [v20 isEqual:@"item"];

  if (v21)
  {
    BOOL v22 = [(CKKSOperationDependencies *)self contextID];
    v57 = 0;
    +[CKKSItem intransactionRecordChanged:v6 contextID:v22 resync:v4 error:&v57];
    int v23 = v57;
LABEL_11:
    uint64_t v26 = v23;
    goto LABEL_12;
  }
  id v24 = [v6 recordType];
  unsigned int v25 = [v24 isEqual:@"currentitem"];

  if (v25)
  {
    BOOL v22 = [(CKKSOperationDependencies *)self contextID];
    v56 = 0;
    +[CKKSCurrentItemPointer intransactionRecordChanged:v6 contextID:v22 resync:v4 error:&v56];
    int v23 = v56;
    goto LABEL_11;
  }
  v33 = [v6 recordType];
  unsigned int v34 = [v33 isEqual:@"synckey"];

  if (v34)
  {
    BOOL v22 = [(CKKSOperationDependencies *)self contextID];
    id v35 = [(CKKSOperationDependencies *)self flagHandler];
    v55 = 0;
    +[CKKSKey intransactionRecordChanged:v6 contextID:v22 resync:v4 flagHandler:v35 error:&v55];
    v36 = v55;
LABEL_23:
    uint64_t v26 = v36;

LABEL_12:
    if (v26)
    {
      uint64_t v27 = [v6 recordID];
      uint64_t v28 = [v27 zoneID];
      uint64_t v29 = [v28 zoneName];
      v30 = sub_1000CD884(@"ckksfetch", v29);

      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = [v6 recordType];
        *(_DWORD *)buf = 138412546;
        BOOL v59 = v31;
        __int16 v60 = 2112;
        v61 = v26;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Record modification(%@) failed:: %@", buf, 0x16u);
      }
      goto LABEL_15;
    }
LABEL_26:
    BOOL v32 = 1;
    goto LABEL_27;
  }
  v37 = [v6 recordType];
  unsigned int v38 = [v37 isEqual:@"tlkshare"];

  if (v38)
  {
    v39 = [(CKKSOperationDependencies *)self contextID];
    id v54 = 0;
    +[CKKSTLKShareRecord intransactionRecordChanged:v6 contextID:v39 resync:v4 error:&v54];
    uint64_t v26 = v54;

    BOOL v22 = [(CKKSOperationDependencies *)self flagHandler];
    [v22 _onqueueHandleFlag:@"key_process_requested"];
    goto LABEL_12;
  }
  v40 = [v6 recordType];
  unsigned int v41 = [v40 isEqualToString:@"currentkey"];

  if (v41)
  {
    BOOL v22 = [(CKKSOperationDependencies *)self contextID];
    id v35 = [(CKKSOperationDependencies *)self flagHandler];
    v53 = 0;
    +[CKKSCurrentKeyPointer intransactionRecordChanged:v6 contextID:v22 resync:v4 flagHandler:v35 error:&v53];
    v36 = v53;
    goto LABEL_23;
  }
  v42 = [v6 recordType];
  int v43 = [v42 isEqualToString:@"manifest"];

  if (v43) {
    goto LABEL_26;
  }
  v44 = [v6 recordType];
  unsigned __int8 v45 = [v44 isEqualToString:@"manifest_leaf"];

  if (v45) {
    goto LABEL_26;
  }
  v47 = [v6 recordType];
  unsigned int v48 = [v47 isEqualToString:@"devicestate"];

  if (v48)
  {
    BOOL v22 = [(CKKSOperationDependencies *)self contextID];
    v52 = 0;
    +[CKKSDeviceStateEntry intransactionRecordChanged:v6 contextID:v22 resync:v4 error:&v52];
    int v23 = v52;
    goto LABEL_11;
  }
  v49 = [v6 recordID];
  v50 = [v49 zoneID];
  v51 = [v50 zoneName];
  uint64_t v26 = sub_1000CD884(@"ckksfetch", v51);

  if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    goto LABEL_16;
  }
  v30 = [v6 recordType];
  *(_DWORD *)buf = 138412546;
  BOOL v59 = v30;
  __int16 v60 = 2112;
  v61 = v6;
  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "unknown record type: %@ %@", buf, 0x16u);
LABEL_15:

LABEL_16:
  BOOL v32 = 0;
LABEL_27:

  return v32;
}

- (void)provideKeySets:(id)a3
{
  id v3 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  BOOL v4 = [v3 allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v10 = [v3 objectForKeyedSubscript:v9];
        id v11 = [v9 zoneName];
        uint64_t v12 = sub_1000CD884(@"ckkskey", v11);

        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v29 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Providing keyset (%@) to listeners", buf, 0xCu);
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v6);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v13 = [(CKKSOperationDependencies *)self keysetProviderOperations];
  id v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)j) provideKeySets:v3];
      }
      id v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }
}

- (BOOL)considerSelfTrusted:(id)a3 error:(id *)a4
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = a3;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      v9 = 0;
      id v10 = v7;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v9);
        if (objc_msgSend(v11, "essential", (void)v18))
        {
          uint64_t v12 = [v11 currentSelfPeersError];
          BOOL v13 = v12;
          if (v12)
          {
            id v14 = v12;
          }
          else
          {
            id v14 = [v11 currentTrustedPeersError];
          }
          uint64_t v7 = v14;

          if ([v11 essential])
          {
            id v15 = [v11 currentSelfPeersError];
            if (v15)
            {
            }
            else
            {
              uint64_t v16 = [v11 currentTrustedPeersError];

              if (!v16)
              {

                LOBYTE(v6) = 1;
                goto LABEL_23;
              }
            }
          }

          id v10 = v7;
        }
        else
        {
          uint64_t v7 = v10;
        }
        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }

    if (a4 && v7)
    {
      id v10 = v7;
      LOBYTE(v6) = 0;
      *a4 = v10;
    }
    else
    {
      id v10 = v7;
    }
  }
  else
  {

    id v10 = 0;
  }
LABEL_23:

  return (char)v6;
}

- (id)currentTrustStates
{
  v2 = [(CKKSOperationDependencies *)self peerProviders];
  id v3 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = sub_1000CD884(@"ckks", 0);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v18 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Fetching account keys for provider %@", buf, 0xCu);
        }

        id v11 = [v9 currentState];
        [v3 addObject:v11];
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)applyNewSyncingPolicy:(id)a3 viewStates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v18 = self;
  [(CKKSOperationDependencies *)self setSyncingPolicy:v6];
  uint64_t v8 = +[NSMutableSet set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v13);
        long long v15 = [v6 priorityViews];
        long long v16 = [v14 zoneName];
        unsigned int v17 = [v15 containsObject:v16];

        if (v17) {
          [v8 addObject:v14];
        }
        long long v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  [(CKKSOperationDependencies *)v18 setAllPriorityViews:v8];
  [(CKKSOperationDependencies *)v18 setAllViews:v9];
  [(CKKSOperationDependencies *)v18 setViewsOverride:0];
}

- (id)readyAndSyncingViews
{
  id v17 = +[NSMutableSet set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = [(CKKSOperationDependencies *)self views];
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v8 ckksManagedView])
        {
          id v9 = [(CKKSOperationDependencies *)self syncingPolicy];
          id v10 = [v8 zoneID];
          id v11 = [v10 zoneName];
          if ([v9 isSyncingEnabledForView:v11])
          {
            [v8 viewKeyHierarchyState];
            uint64_t v12 = v6;
            long long v13 = v3;
            v15 = long long v14 = self;
            unsigned int v18 = [v15 isEqualToString:@"ready"];

            self = v14;
            id v3 = v13;
            uint64_t v6 = v12;

            if (v18) {
              [v17 addObject:v8];
            }
          }
          else
          {
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  return v17;
}

- (id)viewStateForName:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(CKKSOperationDependencies *)self allViews];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 zoneID];
        id v11 = [v10 zoneName];
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)viewStatesByNames:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(CKKSOperationDependencies *)self views];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unsigned __int8 v12 = [v11 zoneID];
        long long v13 = [v12 zoneName];
        unsigned int v14 = [v4 containsObject:v13];

        if (v14) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)viewsInState:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(CKKSOperationDependencies *)self views];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unsigned __int8 v12 = [v11 viewKeyHierarchyState];
        unsigned int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)limitOperationToPriorityViews
{
  [(CKKSOperationDependencies *)self setLimitOperationToPriorityViewsSet:1];
  id v3 = sub_1000CD884(@"ckksviews", 0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CKKSOperationDependencies *)self views];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Limited view operation to priority views %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)operateOnAllViews
{
  [(CKKSOperationDependencies *)self setViewsOverride:0];
  [(CKKSOperationDependencies *)self setLimitOperationToPriorityViewsSet:0];
  id v3 = sub_1000CD884(@"ckksviews", 0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CKKSOperationDependencies *)self views];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Expanded view operation to %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)operateOnSelectViews:(id)a3
{
  id v4 = a3;
  [(CKKSOperationDependencies *)self setViewsOverride:v4];
  int v5 = sub_1000CD884(@"ckksviews", 0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CKKSOperationDependencies *)self views];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Limited view operation to %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)setStateForAllViews:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v5 = [(CKKSOperationDependencies *)self allViews];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setViewKeyHierarchyState:v4];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setStateForActiveExternallyManagedViews:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v5 = [(CKKSOperationDependencies *)self views];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v10 ckksManagedView] & 1) == 0) {
          [v10 setViewKeyHierarchyState:v4];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setStateForActiveCKKSManagedViews:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v5 = [(CKKSOperationDependencies *)self views];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v10 ckksManagedView]) {
          [v10 setViewKeyHierarchyState:v4];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setStateForActiveZones:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v5 = [(CKKSOperationDependencies *)self views];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setViewKeyHierarchyState:v4];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSSet)allExternalManagedViews
{
  id v3 = +[NSMutableSet set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(CKKSOperationDependencies *)self allViews];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v9 ckksManagedView] & 1) == 0) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (NSSet)allCKKSManagedViews
{
  id v3 = +[NSMutableSet set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(CKKSOperationDependencies *)self allViews];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 ckksManagedView]) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (NSSet)activeManagedViews
{
  id v3 = +[NSMutableSet set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(CKKSOperationDependencies *)self views];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 ckksManagedView]) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (NSSet)views
{
  id v3 = [(CKKSOperationDependencies *)self viewsOverride];

  if (v3)
  {
    id v4 = [(CKKSOperationDependencies *)self viewsOverride];
  }
  else
  {
    if ([(CKKSOperationDependencies *)self limitOperationToPriorityViewsSet]) {
      [(CKKSOperationDependencies *)self allPriorityViews];
    }
    else {
    id v4 = [(CKKSOperationDependencies *)self allViews];
    }
  }

  return (NSSet *)v4;
}

- (CKKSOperationDependencies)initWithViewStates:(id)a3 contextID:(id)a4 activeAccount:(id)a5 ckdatabase:(id)a6 cloudKitClassDependencies:(id)a7 ckoperationGroup:(id)a8 flagHandler:(id)a9 overallLaunch:(id)a10 accountStateTracker:(id)a11 lockStateTracker:(id)a12 reachabilityTracker:(id)a13 peerProviders:(id)a14 databaseProvider:(id)a15 savedTLKNotifier:(id)a16 personaAdapter:(id)a17 sendMetric:(BOOL)a18
{
  id v50 = a3;
  id v49 = a4;
  id v48 = a5;
  id v47 = a6;
  id v36 = a7;
  id v46 = a7;
  id v45 = a8;
  id v44 = a9;
  id v43 = a10;
  id v42 = a11;
  id v41 = a12;
  id v40 = a13;
  id v39 = a14;
  id v38 = a15;
  id v22 = a16;
  id v23 = a17;
  v52.receiver = self;
  v52.super_class = (Class)CKKSOperationDependencies;
  long long v24 = [(CKKSOperationDependencies *)&v52 init];
  long long v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_allViews, a3);
    objc_storeStrong((id *)&v25->_ckdatabase, a6);
    objc_storeStrong((id *)&v25->_cloudKitClassDependencies, v36);
    objc_storeStrong((id *)&v25->_ckoperationGroup, a8);
    objc_storeStrong((id *)&v25->_flagHandler, a9);
    objc_storeStrong((id *)&v25->_overallLaunch, a10);
    objc_storeStrong((id *)&v25->_accountStateTracker, a11);
    objc_storeStrong((id *)&v25->_lockStateTracker, a12);
    objc_storeStrong((id *)&v25->_reachabilityTracker, a13);
    objc_storeStrong((id *)&v25->_peerProviders, a14);
    objc_storeStrong((id *)&v25->_databaseProvider, a15);
    objc_storeStrong((id *)&v25->_savedTLKNotifier, a16);
    objc_storeStrong((id *)&v25->_contextID, a4);
    objc_storeStrong((id *)&v25->_activeAccount, a5);
    currentOutgoingQueueOperationGroup = v25->_currentOutgoingQueueOperationGroup;
    v25->_currentOutgoingQueueOperationGroup = 0;

    requestPolicyCheck = v25->_requestPolicyCheck;
    v25->_requestPolicyCheck = 0;

    uint64_t v28 = +[NSHashTable weakObjectsHashTable];
    keysetProviderOperations = v25->_keysetProviderOperations;
    v25->_keysetProviderOperations = (NSHashTable *)v28;

    uint64_t v30 = +[NSMutableSet set];
    currentFetchReasons = v25->_currentFetchReasons;
    v25->_currentFetchReasons = (NSMutableSet *)v30;

    v25->_limitOperationToPriorityViewsSet = 0;
    objc_storeStrong((id *)&v25->_personaAdapter, a17);
    v25->_sendMetric = a18;
    BOOL v32 = [[CKKSNearFutureScheduler alloc] initWithName:@"zonemodifier-ckretryafter" initialDelay:100000000 exponentialBackoff:100000000 maximumDelay:0 keepProcessAlive:1005 dependencyDescriptionCode:25 qosClass:1.0 block:&stru_1002F8B60];
    cloudkitRetryAfter = v25->_cloudkitRetryAfter;
    v25->_cloudkitRetryAfter = v32;
  }
  return v25;
}

@end