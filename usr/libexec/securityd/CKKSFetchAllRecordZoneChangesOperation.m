@interface CKKSFetchAllRecordZoneChangesOperation
- (BOOL)forceResync;
- (BOOL)moreComing;
- (BOOL)resync;
- (BOOL)sendMetric;
- (CKContainer)container;
- (CKKSFetchAllRecordZoneChangesOperation)init;
- (CKKSFetchAllRecordZoneChangesOperation)initWithContainer:(id)a3 fetchClass:(Class)a4 clientMap:(id)a5 fetchReasons:(id)a6 apnsPushes:(id)a7 forceResync:(BOOL)a8 ckoperationGroup:(id)a9 altDSID:(id)a10 sendMetric:(BOOL)a11;
- (CKKSFetchRecordZoneChangesOperation)fetchRecordZoneChangesOperation;
- (CKKSResultOperation)fetchCompletedOperation;
- (CKOperationGroup)ckoperationGroup;
- (Class)fetchRecordZoneChangesOperationClass;
- (NSDictionary)clientMap;
- (NSMutableArray)fetchedZoneIDs;
- (NSMutableDictionary)allClientOptions;
- (NSMutableDictionary)changeTokens;
- (NSMutableDictionary)deletions;
- (NSMutableDictionary)modifications;
- (NSMutableSet)resyncingZones;
- (NSSet)apnsPushes;
- (NSSet)fetchReasons;
- (NSString)altDSID;
- (unint64_t)fetchedItems;
- (unint64_t)totalDeletions;
- (unint64_t)totalModifications;
- (void)cancel;
- (void)groupStart;
- (void)performFetch;
- (void)queryClientsForChangeTokens;
- (void)sendChangesToClient:(id)a3 moreComing:(BOOL)a4;
- (void)setAllClientOptions:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setApnsPushes:(id)a3;
- (void)setChangeTokens:(id)a3;
- (void)setCkoperationGroup:(id)a3;
- (void)setClientMap:(id)a3;
- (void)setDeletions:(id)a3;
- (void)setFetchCompletedOperation:(id)a3;
- (void)setFetchReasons:(id)a3;
- (void)setFetchRecordZoneChangesOperation:(id)a3;
- (void)setFetchedItems:(unint64_t)a3;
- (void)setFetchedZoneIDs:(id)a3;
- (void)setForceResync:(BOOL)a3;
- (void)setModifications:(id)a3;
- (void)setMoreComing:(BOOL)a3;
- (void)setResync:(BOOL)a3;
- (void)setResyncingZones:(id)a3;
- (void)setSendMetric:(BOOL)a3;
- (void)setTotalDeletions:(unint64_t)a3;
- (void)setTotalModifications:(unint64_t)a3;
@end

@implementation CKKSFetchAllRecordZoneChangesOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_resyncingZones + 6), 0);
  objc_storeStrong((id *)((char *)&self->_totalDeletions + 6), 0);
  objc_storeStrong((id *)((char *)&self->_fetchedItems + 6), 0);
  objc_storeStrong((id *)((char *)&self->_clientMap + 6), 0);
  objc_storeStrong((id *)((char *)&self->_allClientOptions + 6), 0);
  objc_storeStrong((id *)((char *)&self->_fetchRecordZoneChangesOperation + 6), 0);
  objc_storeStrong((id *)((char *)&self->_changeTokens + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deletions + 6), 0);
  objc_storeStrong((id *)((char *)&self->_modifications + 6), 0);
  objc_storeStrong((id *)((char *)&self->_apnsPushes + 6), 0);
  objc_storeStrong((id *)((char *)&self->_fetchReasons + 6), 0);
  objc_storeStrong((id *)((char *)&self->_fetchedZoneIDs + 6), 0);
  objc_storeStrong((id *)((char *)&self->_container + 6), 0);
  objc_storeStrong((id *)((char *)&self->_fetchRecordZoneChangesOperationClass + 6), 0);

  objc_storeStrong((id *)(&self->_sendMetric + 3), 0);
}

- (void)setFetchCompletedOperation:(id)a3
{
}

- (CKKSResultOperation)fetchCompletedOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 270, 1);
}

- (void)setResyncingZones:(id)a3
{
}

- (NSMutableSet)resyncingZones
{
  return (NSMutableSet *)objc_getProperty(self, a2, 262, 1);
}

- (void)setTotalDeletions:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_totalModifications + 6) = a3;
}

- (unint64_t)totalDeletions
{
  return *(unint64_t *)((char *)&self->_totalModifications + 6);
}

- (void)setTotalModifications:(unint64_t)a3
{
  *(NSString **)((char *)&self->_altDSID + 6) = (NSString *)a3;
}

- (unint64_t)totalModifications
{
  return *(unint64_t *)((char *)&self->_altDSID + 6);
}

- (void)setSendMetric:(BOOL)a3
{
  self->_sendMetric = a3;
}

- (BOOL)sendMetric
{
  return self->_sendMetric;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 238, 1);
}

- (void)setMoreComing:(BOOL)a3
{
  self->_moreComing = a3;
}

- (BOOL)moreComing
{
  return self->_moreComing;
}

- (void)setForceResync:(BOOL)a3
{
  self->_forceResync = a3;
}

- (BOOL)forceResync
{
  return self->_forceResync;
}

- (void)setFetchedItems:(unint64_t)a3
{
  *(CKOperationGroup **)((char *)&self->_ckoperationGroup + 6) = (CKOperationGroup *)a3;
}

- (unint64_t)fetchedItems
{
  return *(unint64_t *)((char *)&self->_ckoperationGroup + 6);
}

- (void)setCkoperationGroup:(id)a3
{
}

- (CKOperationGroup)ckoperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 222, 1);
}

- (void)setClientMap:(id)a3
{
}

- (NSDictionary)clientMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 214, 1);
}

- (void)setAllClientOptions:(id)a3
{
}

- (NSMutableDictionary)allClientOptions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 206, 1);
}

- (void)setFetchRecordZoneChangesOperation:(id)a3
{
}

- (CKKSFetchRecordZoneChangesOperation)fetchRecordZoneChangesOperation
{
  return (CKKSFetchRecordZoneChangesOperation *)objc_getProperty(self, a2, 198, 1);
}

- (void)setChangeTokens:(id)a3
{
}

- (NSMutableDictionary)changeTokens
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 190, 1);
}

- (void)setDeletions:(id)a3
{
}

- (NSMutableDictionary)deletions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 182, 1);
}

- (void)setModifications:(id)a3
{
}

- (NSMutableDictionary)modifications
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 174, 1);
}

- (void)setApnsPushes:(id)a3
{
}

- (NSSet)apnsPushes
{
  return (NSSet *)objc_getProperty(self, a2, 166, 1);
}

- (void)setFetchReasons:(id)a3
{
}

- (NSSet)fetchReasons
{
  return (NSSet *)objc_getProperty(self, a2, 158, 1);
}

- (void)setFetchedZoneIDs:(id)a3
{
}

- (NSMutableArray)fetchedZoneIDs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 150, 1);
}

- (void)setResync:(BOOL)a3
{
  self->_resync = a3;
}

- (BOOL)resync
{
  return self->_resync;
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 142, 1);
}

- (Class)fetchRecordZoneChangesOperationClass
{
  return (Class)objc_getProperty(self, a2, 134, 1);
}

- (void)cancel
{
  v3 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchRecordZoneChangesOperation];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)CKKSFetchAllRecordZoneChangesOperation;
  [(CKKSGroupOperation *)&v4 cancel];
}

- (void)sendChangesToClient:(id)a3 moreComing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(CKKSFetchAllRecordZoneChangesOperation *)self clientMap];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    v9 = +[NSMutableArray array];
    v10 = +[NSMutableArray array];
    v11 = [(CKKSFetchAllRecordZoneChangesOperation *)self modifications];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000BC66C;
    v30[3] = &unk_1002F9300;
    id v12 = v6;
    id v31 = v12;
    v13 = v9;
    v32 = v13;
    [v11 enumerateKeysAndObjectsUsingBlock:v30];

    v14 = [(CKKSFetchAllRecordZoneChangesOperation *)self deletions];
    v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    v26 = sub_1000BC7A0;
    v27 = &unk_1002F9328;
    id v15 = v12;
    id v28 = v15;
    id v16 = v10;
    id v29 = v16;
    [v14 enumerateKeysAndObjectsUsingBlock:&v24];

    v17 = [(CKKSFetchAllRecordZoneChangesOperation *)self resyncingZones];
    id v18 = [v17 containsObject:v15];

    v19 = [(CKKSFetchAllRecordZoneChangesOperation *)self changeTokens];
    v20 = [v19 objectForKeyedSubscript:v15];
    [v8 changesFetched:v13 deletedRecordIDs:v16 zoneID:v15 newChangeToken:v20 moreComing:v4 resync:v18];

    if (v18 && !v4)
    {
      v21 = [v15 zoneName];
      v22 = sub_1000CD884(@"ckksfetch", v21);

      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "No more changes for zone; turning off resync bit",
          buf,
          2u);
      }

      v23 = [(CKKSFetchAllRecordZoneChangesOperation *)self resyncingZones];
      [v23 removeObject:v15];
    }
  }
  else
  {
    v13 = sub_1000CD884(@"ckksfetch", 0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "no client registered for %@, so why did we get any data?", buf, 0xCu);
    }
  }
}

- (void)performFetch
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = +[NSMutableArray array];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  BOOL v4 = [(CKKSFetchAllRecordZoneChangesOperation *)self allClientOptions];
  v5 = [v4 allKeys];

  id v6 = [v5 countByEnumeratingWithState:&v82 objects:v98 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v83;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v83 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v82 + 1) + 8 * (void)v8);
        v10 = [(CKKSFetchAllRecordZoneChangesOperation *)self clientMap];
        v11 = [v10 objectForKeyedSubscript:v9];
        unsigned __int8 v12 = [v11 zoneIsReadyForFetching:v9];

        if ((v12 & 1) == 0) {
          [v3 addObject:v9];
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v82 objects:v98 count:16];
    }
    while (v6);
  }

  id v13 = objc_alloc((Class)AAFAnalyticsEventSecurity);
  uint64_t v14 = kSecurityRTCFieldIsPrioritized;
  uint64_t v96 = kSecurityRTCFieldIsPrioritized;
  v97 = &__kCFBooleanFalse;
  id v15 = +[NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
  id v16 = [(CKKSFetchAllRecordZoneChangesOperation *)self altDSID];
  BOOL v17 = [(CKKSFetchAllRecordZoneChangesOperation *)self sendMetric];
  id v18 = [v13 initWithCKKSMetrics:v15 altDSID:v16 eventName:kSecurityRTCEventNameZoneChangeFetch testsAreEnabled:0 category:kSecurityRTCEventCategoryAccountDataAccessRecovery sendMetric:v17];

  if ([v3 count])
  {
    v19 = sub_1000CD884(@"ckksfetch", 0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v90 = v3;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Dropping the following zones from this fetch cycle: %@", buf, 0xCu);
    }

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v20 = v3;
    id v21 = [v20 countByEnumeratingWithState:&v78 objects:v95 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v79;
      do
      {
        v23 = 0;
        do
        {
          if (*(void *)v79 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v24 = *(void *)(*((void *)&v78 + 1) + 8 * (void)v23);
          uint64_t v25 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchedZoneIDs];
          [v25 removeObject:v24];

          v26 = [(CKKSFetchAllRecordZoneChangesOperation *)self allClientOptions];
          [v26 setObject:0 forKeyedSubscript:v24];

          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        id v21 = [v20 countByEnumeratingWithState:&v78 objects:v95 count:16];
      }
      while (v21);
    }
  }
  v27 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchedZoneIDs];
  BOOL v28 = [v27 count] == 0;

  if (!v28)
  {
    uint64_t v93 = kSecurityRTCFieldNumViews;
    id v29 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchedZoneIDs];
    v30 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v29 count]);
    v94 = v30;
    id v31 = +[NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
    [v18 addMetrics:v31];

    v32 = sub_1000CD884(@"ckksfetch", 0);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchedZoneIDs];
      id v34 = [(CKKSFetchAllRecordZoneChangesOperation *)self allClientOptions];
      *(_DWORD *)buf = 138412546;
      v90 = v33;
      __int16 v91 = 2112;
      v92 = v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Beginning fetch: %@ options: %@", buf, 0x16u);
    }
    v35 = [(objc_class *)[(CKKSFetchAllRecordZoneChangesOperation *)self fetchRecordZoneChangesOperationClass] alloc];
    v36 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchedZoneIDs];
    v37 = [(CKKSFetchAllRecordZoneChangesOperation *)self allClientOptions];
    v38 = [(objc_class *)v35 initWithRecordZoneIDs:v36 configurationsByRecordZoneID:v37];
    [(CKKSFetchAllRecordZoneChangesOperation *)self setFetchRecordZoneChangesOperation:v38];

    v39 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchRecordZoneChangesOperation];
    [v39 setFetchAllChanges:0];

    v40 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchRecordZoneChangesOperation];
    v41 = [v40 configuration];
    [v41 setIsCloudKitSupportOperation:1];

    v42 = [(CKKSFetchAllRecordZoneChangesOperation *)self ckoperationGroup];
    v43 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchRecordZoneChangesOperation];
    [v43 setGroup:v42];

    v44 = sub_1000CD884(@"ckksfetch", 0);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = [(CKKSFetchAllRecordZoneChangesOperation *)self ckoperationGroup];
      *(_DWORD *)buf = 138412290;
      v90 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Operation group is %@", buf, 0xCu);
    }
    v46 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchReasons];
    if (([v46 containsObject:@"api"] & 1) == 0)
    {
      v47 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchReasons];
      if (([v47 containsObject:@"initialfetch"] & 1) == 0)
      {
        v48 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchReasons];
        if (![v48 containsObject:@"more-coming"])
        {
          v64 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchReasons];
          unsigned __int8 v65 = [v64 containsObject:@"keyhierarchy"];

          if ((v65 & 1) == 0) {
            goto LABEL_33;
          }
          goto LABEL_32;
        }
      }
    }

LABEL_32:
    v49 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchRecordZoneChangesOperation];
    [v49 setQualityOfService:25];

    uint64_t v87 = v14;
    v88 = &__kCFBooleanTrue;
    v50 = +[NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
    [v18 addMetrics:v50];

LABEL_33:
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_1000BD3B0;
    v76[3] = &unk_1002F9238;
    objc_copyWeak(&v77, &location);
    v51 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchRecordZoneChangesOperation];
    [v51 setRecordChangedBlock:v76];

    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_1000BD528;
    v74[3] = &unk_1002F9260;
    objc_copyWeak(&v75, &location);
    v52 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchRecordZoneChangesOperation];
    [v52 setRecordWithIDWasDeletedBlock:v74];

    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_1000BD694;
    v72[3] = &unk_1002F9288;
    objc_copyWeak(&v73, &location);
    v53 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchRecordZoneChangesOperation];
    [v53 setRecordZoneChangeTokensUpdatedBlock:v72];

    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_1000BD7C8;
    v69[3] = &unk_1002F92B0;
    objc_copyWeak(&v71, &location);
    id v54 = v18;
    id v70 = v54;
    v55 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchRecordZoneChangesOperation];
    [v55 setRecordZoneFetchCompletionBlock:v69];

    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_1000BDB10;
    v66[3] = &unk_1002F92D8;
    objc_copyWeak(&v68, &location);
    id v67 = v54;
    v56 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchRecordZoneChangesOperation];
    [v56 setFetchRecordZoneChangesCompletionBlock:v66];

    v57 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchCompletedOperation];
    [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v57];

    v58 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchRecordZoneChangesOperation];
    [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v58];

    v59 = [(CKKSFetchAllRecordZoneChangesOperation *)self container];
    v60 = [v59 privateCloudDatabase];
    v61 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchRecordZoneChangesOperation];
    [v60 addOperation:v61];

    objc_destroyWeak(&v68);
    objc_destroyWeak(&v71);
    objc_destroyWeak(&v73);
    objc_destroyWeak(&v75);
    objc_destroyWeak(&v77);
    goto LABEL_37;
  }
  v62 = sub_1000CD884(@"ckksfetch", 0);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "No zones to fetch. Skipping operation.", buf, 2u);
  }

  v63 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchCompletedOperation];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v63];

LABEL_37:
  objc_destroyWeak(&location);
}

- (void)groupStart
{
  v3 = +[NSMutableDictionary dictionary];
  [(CKKSFetchAllRecordZoneChangesOperation *)self setAllClientOptions:v3];

  BOOL v4 = +[NSMutableArray array];
  [(CKKSFetchAllRecordZoneChangesOperation *)self setFetchedZoneIDs:v4];

  [(CKKSFetchAllRecordZoneChangesOperation *)self queryClientsForChangeTokens];
  v5 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchedZoneIDs];
  id v6 = [v5 count];

  if (v6)
  {
    [(CKKSFetchAllRecordZoneChangesOperation *)self performFetch];
  }
  else
  {
    uint64_t v7 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:50 description:@"No clients want a fetch right now"];
    [(CKKSResultOperation *)self setError:v7];

    v8 = sub_1000CD884(@"ckksfetch", 0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(CKKSResultOperation *)self error];
      int v10 = 138412290;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cancelling fetch: %@", (uint8_t *)&v10, 0xCu);
    }
    [(CKKSFetchAllRecordZoneChangesOperation *)self setClientMap:&__NSDictionary0__struct];
  }
}

- (void)queryClientsForChangeTokens
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v3 = [(CKKSFetchAllRecordZoneChangesOperation *)self clientMap];
  id v4 = [v3 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v29;
    *(void *)&long long v5 = 138412546;
    long long v25 = v5;
    uint64_t v26 = *(void *)v29;
    do
    {
      v8 = 0;
      id v27 = v6;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v8);
        int v10 = [(CKKSFetchAllRecordZoneChangesOperation *)self clientMap];
        v11 = [v10 objectForKeyedSubscript:v9];

        unsigned __int8 v12 = [v11 participateInFetch:v9];
        if ([v12 participateInFetch])
        {
          id v13 = [(CKKSFetchAllRecordZoneChangesOperation *)self fetchedZoneIDs];
          [v13 addObject:v9];

          id v14 = objc_alloc_init((Class)CKFetchRecordZoneChangesConfiguration);
          if (![(CKKSFetchAllRecordZoneChangesOperation *)self forceResync])
          {
            id v15 = v3;
            id v16 = [(CKKSFetchAllRecordZoneChangesOperation *)self changeTokens];
            BOOL v17 = [v16 objectForKeyedSubscript:v9];

            if (v17)
            {
              id v18 = [(CKKSFetchAllRecordZoneChangesOperation *)self changeTokens];
              v19 = [v18 objectForKeyedSubscript:v9];
              [v14 setPreviousServerChangeToken:v19];

              id v20 = sub_1000CD884(@"ckksfetch", 0);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                id v21 = [(CKKSFetchAllRecordZoneChangesOperation *)self changeTokens];
                uint64_t v22 = [v21 objectForKeyedSubscript:v9];
                *(_DWORD *)buf = v25;
                uint64_t v33 = v9;
                __int16 v34 = 2112;
                v35 = v22;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Using cached change token for %@: %@", buf, 0x16u);
              }
            }
            else
            {
              id v20 = [v12 changeToken];
              [v14 setPreviousServerChangeToken:v20];
            }
            v3 = v15;

            uint64_t v7 = v26;
          }
          if (([v12 resync] & 1) != 0
            || [(CKKSFetchAllRecordZoneChangesOperation *)self forceResync])
          {
            v23 = [(CKKSFetchAllRecordZoneChangesOperation *)self resyncingZones];
            [v23 addObject:v9];
          }
          uint64_t v24 = [(CKKSFetchAllRecordZoneChangesOperation *)self allClientOptions];
          [v24 setObject:v14 forKeyedSubscript:v9];

          id v6 = v27;
        }

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v6);
  }
}

- (CKKSFetchAllRecordZoneChangesOperation)initWithContainer:(id)a3 fetchClass:(Class)a4 clientMap:(id)a5 fetchReasons:(id)a6 apnsPushes:(id)a7 forceResync:(BOOL)a8 ckoperationGroup:(id)a9 altDSID:(id)a10 sendMetric:(BOOL)a11
{
  id v36 = a3;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v32 = a9;
  id v18 = a10;
  v37.receiver = self;
  v37.super_class = (Class)CKKSFetchAllRecordZoneChangesOperation;
  v19 = [(CKKSGroupOperation *)&v37 init];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)(v19 + 142), a3);
    objc_storeStrong((id *)(v20 + 134), a4);
    objc_storeStrong((id *)(v20 + 214), a5);
    objc_storeStrong((id *)(v20 + 222), a9);
    v20[129] = a8;
    objc_storeStrong((id *)(v20 + 158), a6);
    objc_storeStrong((id *)(v20 + 166), a7);
    id v21 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v22 = *(void **)(v20 + 174);
    *(void *)(v20 + 174) = v21;

    id v23 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v24 = *(void **)(v20 + 182);
    *(void *)(v20 + 182) = v23;

    id v25 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v26 = *(void **)(v20 + 190);
    *(void *)(v20 + 190) = v25;

    uint64_t v27 = +[NSMutableSet set];
    long long v28 = *(void **)(v20 + 262);
    *(void *)(v20 + 262) = v27;

    *(void *)(v20 + 246) = 0;
    *(void *)(v20 + 254) = 0;
    uint64_t v29 = +[CKKSResultOperation named:@"record-zone-changes-completed" withBlock:&stru_1002F9210];
    long long v30 = *(void **)(v20 + 270);
    *(void *)(v20 + 270) = v29;

    v20[130] = 0;
    objc_storeStrong((id *)(v20 + 238), a10);
    v20[131] = a11;
    [v20 setQualityOfService:25];
  }

  return (CKKSFetchAllRecordZoneChangesOperation *)v20;
}

- (CKKSFetchAllRecordZoneChangesOperation)init
{
  return 0;
}

@end