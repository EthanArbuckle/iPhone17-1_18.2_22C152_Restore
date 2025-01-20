@interface MBCKJournal
+ (id)cancellationError;
+ (id)journalForDevice:(id)a3 cache:(id)a4 engine:(id)a5;
- (BOOL)_clearSnapshotActionsWithOperationTracker:(id)a3 error:(id *)a4;
- (BOOL)_handleMergeAction:(id)a3 outputSnapshotID:(id)a4 serverSnapshot:(id)a5 shouldMergeDeletions:(BOOL)a6 operationTracker:(id)a7 error:(id *)a8;
- (BOOL)_handleRemoveDomain:(id)a3 domainHmacs:(id)a4 outputSnapshotID:(id)a5 serverSnapshot:(id)a6 operationTracker:(id)a7 error:(id *)a8;
- (BOOL)_handleSnapshotAction:(id)a3 operationTracker:(id)a4 error:(id *)a5;
- (BOOL)fetchFromServerWithOperationTracker:(id)a3 error:(id *)a4;
- (BOOL)replayJournalResetOrDisableWithOperationTracker:(id)a3 serviceManager:(id)a4 disable:(BOOL *)a5 error:(id *)a6;
- (BOOL)replayWithOperationTracker:(id)a3 actionCount:(unint64_t *)a4 error:(id *)a5;
- (MBCKDevice)device;
- (MBCKEngine)engine;
- (MBCKJournal)initWithDevice:(id)a3 cache:(id)a4 engine:(id)a5;
- (NSArray)processedSnapshotActions;
- (NSArray)snapshotActions;
- (NSMutableDictionary)cachedSnapshotsByID;
- (NSMutableDictionary)snapshotsByID;
- (NSSet)cachedSnapshotIDs;
- (NSString)recordPrefix;
- (id)_getRecordIDString;
- (id)recordRepresentation;
- (id)recordType;
- (unint64_t)recordZone;
- (void)refreshWithRecord:(id)a3;
- (void)setCachedSnapshotIDs:(id)a3;
- (void)setCachedSnapshotsByID:(id)a3;
- (void)setDevice:(id)a3;
- (void)setEngine:(id)a3;
- (void)setRecordPrefix:(id)a3;
- (void)setSnapshotsByID:(id)a3;
@end

@implementation MBCKJournal

+ (id)journalForDevice:(id)a3 cache:(id)a4 engine:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[MBCKJournal alloc] initWithDevice:v9 cache:v8 engine:v7];

  return v10;
}

- (MBCKJournal)initWithDevice:(id)a3 cache:(id)a4 engine:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MBCKJournal;
  v10 = [(MBCKModel *)&v13 initWithRecord:0 cache:a4];
  v11 = v10;
  if (v10)
  {
    [(MBCKJournal *)v10 setDevice:v8];
    [(MBCKJournal *)v11 setEngine:v9];
  }

  return v11;
}

+ (id)cancellationError
{
  return +[MBError errorWithCode:202 format:@"Journal replay cancelled"];
}

- (id)_getRecordIDString
{
  v4 = [(MBCKJournal *)self device];
  v5 = [v4 deviceUUID];

  if (!v5)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MBCKJournal.m" lineNumber:56 description:@"Journal is missing a device deviceUUID"];
  }
  v6 = [(MBCKJournal *)self recordPrefix];

  id v7 = objc_alloc((Class)NSString);
  if (v6)
  {
    id v8 = [(MBCKJournal *)self recordPrefix];
    id v9 = [v4 deviceUUID];
    id v10 = [v7 initWithFormat:@"%@:%@:%@", v8, v9, @"Journal"];
  }
  else
  {
    id v8 = [v4 deviceUUID];
    id v10 = [v7 initWithFormat:@"%@:%@", v8, @"Journal"];
  }

  return v10;
}

- (id)recordType
{
  return @"Journal";
}

- (unint64_t)recordZone
{
  return 2;
}

- (void)refreshWithRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"snapshotActions"];
  snapshotActions = self->_snapshotActions;
  self->_snapshotActions = v5;

  id v7 = [v4 objectForKeyedSubscript:@"processedSnapshotActions"];
  processedSnapshotActions = self->_processedSnapshotActions;
  self->_processedSnapshotActions = v7;

  v9.receiver = self;
  v9.super_class = (Class)MBCKJournal;
  [(MBCKModel *)&v9 refreshWithRecord:v4];
}

- (id)recordRepresentation
{
  v5.receiver = self;
  v5.super_class = (Class)MBCKJournal;
  v3 = [(MBCKModel *)&v5 recordRepresentation];
  [v3 setObject:self->_snapshotActions forKeyedSubscript:@"snapshotActions"];
  [v3 setObject:self->_processedSnapshotActions forKeyedSubscript:@"processedSnapshotActions"];
  return v3;
}

- (BOOL)_clearSnapshotActionsWithOperationTracker:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBCKJournal _clearSnapshotActionsWithOperationTracker:error:]", "MBCKJournal.m", 84, "tracker");
  }
  id v7 = v6;
  if (self->_snapshotActions)
  {
    id v8 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithArray:self->_processedSnapshotActions];
    [(NSArray *)v8 addObjectsFromArray:self->_snapshotActions];
    snapshotActions = self->_snapshotActions;
    self->_snapshotActions = 0;

    processedSnapshotActions = self->_processedSnapshotActions;
    self->_processedSnapshotActions = v8;

    BOOL v11 = [(MBCKModel *)self saveWithOperationTracker:v7 error:a4];
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)fetchFromServerWithOperationTracker:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MBCKJournal;
  id v16 = 0;
  unsigned __int8 v7 = [(MBCKModel *)&v15 fetchFromServerWithOperationTracker:v6 error:&v16];
  id v8 = v16;
  if (v7)
  {
LABEL_2:
    BOOL v9 = 1;
    goto LABEL_11;
  }
  if (+[MBError isCKNotFoundError:v8])
  {

    id v14 = 0;
    unsigned int v10 = [(MBCKModel *)self saveWithOperationTracker:v6 error:&v14];
    id v8 = v14;
    if (v10)
    {
      BOOL v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)objc_super v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Recreated empty journal record", v13, 2u);
        _MBLog();
      }

      goto LABEL_2;
    }
  }
  if (a4)
  {
    id v8 = v8;
    BOOL v9 = 0;
    *a4 = v8;
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_11:

  return v9;
}

- (BOOL)replayJournalResetOrDisableWithOperationTracker:(id)a3 serviceManager:(id)a4 disable:(BOOL *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (!v10) {
    __assert_rtn("-[MBCKJournal replayJournalResetOrDisableWithOperationTracker:serviceManager:disable:error:]", "MBCKJournal.m", 112, "tracker");
  }
  v12 = v11;
  if (!v11) {
    __assert_rtn("-[MBCKJournal replayJournalResetOrDisableWithOperationTracker:serviceManager:disable:error:]", "MBCKJournal.m", 113, "serviceManager");
  }
  if (!a5) {
    __assert_rtn("-[MBCKJournal replayJournalResetOrDisableWithOperationTracker:serviceManager:disable:error:]", "MBCKJournal.m", 114, "disable");
  }
  uint64_t v13 = [v10 account];
  if (!v13) {
    __assert_rtn("-[MBCKJournal replayJournalResetOrDisableWithOperationTracker:serviceManager:disable:error:]", "MBCKJournal.m", 116, "serviceAccount");
  }
  id v14 = (void *)v13;
  if (![(MBCKJournal *)self fetchFromServerWithOperationTracker:v10 error:a6])
  {
    BOOL v24 = 0;
    goto LABEL_43;
  }
  v40 = v14;
  v41 = v12;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obj = self->_snapshotActions;
  id v15 = [(NSArray *)obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (!v15)
  {
    BOOL v24 = 0;
    goto LABEL_42;
  }
  id v16 = v15;
  v37 = a5;
  v38 = self;
  id v39 = v10;
  uint64_t v17 = *(void *)v46;
  while (2)
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v46 != v17) {
        objc_enumerationMutation(obj);
      }
      id v19 = [objc_alloc((Class)NSString) initWithString:*(void *)(*((void *)&v45 + 1) + 8 * i)];
      v20 = [v19 stringByReplacingOccurrencesOfString:@"S:" withString:&stru_100418BA8];

      v21 = [v20 stringByReplacingOccurrencesOfString:@":" withString:@"|"];

      v22 = [v21 componentsSeparatedByString:@"|"];
      v23 = [v22 firstObject];
      if ([v23 containsString:@"reset"])
      {
        v25 = MBGetDefaultLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Replaying journal - journal contains server reset", buf, 2u);
          _MBLog();
        }

        v26 = [(MBCKJournal *)v38 engine];
        id v27 = [v26 backupPolicy];

        if (v27 == (id)1) {
          [v41 clearPrebuddyWithAccount:v40 accountSignOut:0];
        }
        unsigned int v28 = [v41 resetCacheWithAccount:v40 error:a6];
        id v44 = 0;
        v29 = [v41 openCacheWithAccount:v40 accessType:1 error:&v44];
        id v30 = v44;
        [(MBCKModel *)v38 setCache:v29];
        if (v28
          && [(MBCKJournal *)v38 _clearSnapshotActionsWithOperationTracker:v39 error:a6])
        {
          goto LABEL_41;
        }
        v31 = MBGetDefaultLog();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
          goto LABEL_40;
        }
        if (a6)
        {
          CFStringRef v32 = (const __CFString *)*a6;
          *(_DWORD *)buf = 138412290;
          CFStringRef v50 = v32;
        }
        else
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v50 = @"unknown error";
        }
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Replaying journal - unable to complete reset: %@", buf, 0xCu);
        goto LABEL_39;
      }
      if ([v23 containsString:@"disable"])
      {
        v33 = MBGetDefaultLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Replaying journal - journal contains server disable", buf, 2u);
          _MBLog();
        }

        unsigned int v34 = [v41 resetCacheWithAccount:v14 error:a6];
        id v43 = 0;
        v29 = [v41 openCacheWithAccount:v14 accessType:1 error:&v43];
        id v30 = v43;
        [(MBCKModel *)v38 setCache:v29];
        if (v34
          && [(MBCKJournal *)v38 _clearSnapshotActionsWithOperationTracker:v39 error:a6])
        {
          BOOL *v37 = 1;
LABEL_41:

          BOOL v24 = 1;
          id v10 = v39;
          goto LABEL_42;
        }
        v31 = MBGetDefaultLog();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
LABEL_40:

          goto LABEL_41;
        }
        if (a6)
        {
          CFStringRef v35 = (const __CFString *)*a6;
          *(_DWORD *)buf = 138412290;
          CFStringRef v50 = v35;
        }
        else
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v50 = @"unknown error";
        }
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Replaying journal - unable to complete disable: %@", buf, 0xCu);
LABEL_39:
        _MBLog();
        goto LABEL_40;
      }
    }
    id v16 = [(NSArray *)obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    BOOL v24 = 0;
    id v10 = v39;
    if (v16) {
      continue;
    }
    break;
  }
LABEL_42:

  id v14 = v40;
  v12 = v41;
LABEL_43:

  return v24;
}

- (BOOL)replayWithOperationTracker:(id)a3 actionCount:(unint64_t *)a4 error:(id *)a5
{
  id v8 = a3;
  if (!v8) {
    __assert_rtn("-[MBCKJournal replayWithOperationTracker:actionCount:error:]", "MBCKJournal.m", 167, "tracker");
  }
  BOOL v9 = v8;
  id v10 = [(MBCKJournal *)self device];
  id v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v10 recordIDString];
    *(_DWORD *)buf = 138543362;
    v74 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Replaying journal for device: %{public}@", buf, 0xCu);

    long long v48 = [v10 recordIDString];
    _MBLog();
  }
  if (([v10 hasFetchedSnapshots] & 1) == 0
    && ![v10 fetchSnapshotsWithOperationTracker:v9 error:a5]
    || !-[MBCKJournal fetchFromServerWithOperationTracker:error:](self, "fetchFromServerWithOperationTracker:error:", v9, a5, v48))
  {
    LOBYTE(v21) = 0;
    goto LABEL_62;
  }
  if (MBIsInternalInstall())
  {
    uint64_t v13 = +[MBBehaviorOptions sharedOptions];
    unsigned int v14 = [v13 cancelBackupDuringJournalReplay];

    if (v14)
    {
      id v15 = [(MBCKJournal *)self engine];
      id v16 = [(id)objc_opt_class() cancellationError];
      [v15 cancelWithError:v16];
    }
  }
  unint64_t v17 = [(NSArray *)self->_snapshotActions count];
  v18 = MBGetDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    snapshotActions = self->_snapshotActions;
    *(_DWORD *)buf = 138543362;
    v74 = snapshotActions;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Journal actions: %{public}@", buf, 0xCu);
    v49 = self->_snapshotActions;
    _MBLog();
  }

  if (a4) {
    *a4 = v17;
  }
  if (!v17)
  {
    LOBYTE(v21) = 1;
    goto LABEL_62;
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  obj = self->_snapshotActions;
  id v56 = [(NSArray *)obj countByEnumeratingWithState:&v67 objects:v72 count:16];
  v20 = 0;
  if (!v56)
  {
    LOBYTE(v21) = 1;
    goto LABEL_45;
  }
  uint64_t v55 = *(void *)v68;
  int v21 = 1;
  v51 = a5;
  v52 = v9;
  CFStringRef v50 = v10;
LABEL_17:
  v22 = 0;
  while (1)
  {
    if (*(void *)v68 != v55) {
      objc_enumerationMutation(obj);
    }
    uint64_t v57 = *(void *)(*((void *)&v67 + 1) + 8 * (void)v22);
    v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cachedSnapshotsByID = self->_cachedSnapshotsByID;
    self->_cachedSnapshotsByID = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    snapshotsByID = self->_snapshotsByID;
    self->_snapshotsByID = v25;

    id v27 = objc_opt_new();
    unsigned int v28 = [(MBCKModel *)self cache];
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_1000A1CEC;
    v65[3] = &unk_1004114C8;
    id v59 = v27;
    id v66 = v59;
    v29 = [v28 enumerateSnapshotIDs:v65];

    if (v29)
    {
      if (a5) {
        *a5 = v29;
      }
      id v44 = MBGetDefaultLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v74 = v29;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Error enumerating snapshot IDs: %@", buf, 0xCu);
        _MBLog();
      }

      LOBYTE(v21) = 0;
      goto LABEL_59;
    }
    objc_storeStrong((id *)&self->_cachedSnapshotIDs, v27);
    id v30 = [(MBCKModel *)self cache];
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_1000A1D10;
    v64[3] = &unk_100411D90;
    v64[4] = self;
    v31 = [v30 enumerateSnapshots:v64];

    v58 = v31;
    if (v31)
    {
      if (a5) {
        *a5 = v31;
      }
      CFStringRef v32 = MBGetDefaultLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v74 = v31;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Error enumerating snapshots: %@", buf, 0xCu);
        v49 = v31;
        _MBLog();
      }

      int v33 = 1;
    }
    else
    {
      int v53 = v21;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
      CFStringRef v35 = [WeakRetained snapshots];

      id v36 = [v35 countByEnumeratingWithState:&v60 objects:v71 count:16];
      if (v36)
      {
        id v37 = v36;
        uint64_t v38 = *(void *)v61;
        do
        {
          for (i = 0; i != v37; i = (char *)i + 1)
          {
            if (*(void *)v61 != v38) {
              objc_enumerationMutation(v35);
            }
            v40 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            v41 = self->_snapshotsByID;
            v42 = objc_msgSend(v40, "snapshotID", v49);
            [(NSMutableDictionary *)v41 setValue:v40 forKey:v42];
          }
          id v37 = [v35 countByEnumeratingWithState:&v60 objects:v71 count:16];
        }
        while (v37);
      }

      a5 = v51;
      BOOL v9 = v52;
      unsigned int v43 = [(MBCKJournal *)self _handleSnapshotAction:v57 operationTracker:v52 error:v51];
      int v33 = v43 ? 0 : 10;
      int v21 = v43 & v53;
    }

    if (v33) {
      break;
    }
    v22 = (char *)v22 + 1;
    v20 = v58;
    if (v22 == v56)
    {
      id v10 = v50;
      id v56 = [(NSArray *)obj countByEnumeratingWithState:&v67 objects:v72 count:16];
      if (v56) {
        goto LABEL_17;
      }
LABEL_45:

      v29 = v20;
      if (a5) {
        goto LABEL_54;
      }
      goto LABEL_61;
    }
  }

  if (v33 != 10)
  {
    LOBYTE(v21) = 0;
    v29 = v58;
LABEL_59:
    id v10 = v50;
    goto LABEL_61;
  }
  v29 = v58;
  id v10 = v50;
  if (!a5) {
    goto LABEL_61;
  }
LABEL_54:
  if (*a5)
  {
    long long v45 = MBGetDefaultLog();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      long long v46 = (NSArray *)*a5;
      *(_DWORD *)buf = 138412290;
      v74 = v46;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Not marking journal action as processed %@", buf, 0xCu);
      _MBLog();
    }
  }
  else
  {
    [(MBCKJournal *)self _clearSnapshotActionsWithOperationTracker:v9 error:0];
  }
LABEL_61:

LABEL_62:
  return v21 & 1;
}

- (BOOL)_handleMergeAction:(id)a3 outputSnapshotID:(id)a4 serverSnapshot:(id)a5 shouldMergeDeletions:(BOOL)a6 operationTracker:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v39 = a4;
  id v38 = a5;
  id v15 = a7;
  if (!v15) {
    __assert_rtn("-[MBCKJournal _handleMergeAction:outputSnapshotID:serverSnapshot:shouldMergeDeletions:operationTracker:error:]", "MBCKJournal.m", 247, "tracker");
  }
  id v16 = v15;
  uint64_t v49 = 0;
  CFStringRef v50 = (id *)&v49;
  uint64_t v51 = 0x3032000000;
  v52 = sub_1000A23D8;
  int v53 = sub_1000A23E8;
  id v54 = 0;
  if ([v14 count] != (id)2)
  {
    id v19 = MBGetDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v19 = v19;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v26 = [v14 count];
        *(_DWORD *)buf = 134218242;
        id v56 = v26;
        __int16 v57 = 2112;
        id v58 = v14;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Client side merge only supports two snapshots. (%lu specified %@)", buf, 0x16u);
      }

      [v14 count];
      _MBLog();
    }
LABEL_15:
    BOOL v27 = 0;
    goto LABEL_28;
  }
  if (!v39)
  {
    id v19 = MBGetDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Merge output snapshotID not specified.", buf, 2u);
      _MBLog();
      BOOL v27 = 0;
      goto LABEL_28;
    }
    goto LABEL_15;
  }
  cachedSnapshotsByID = self->_cachedSnapshotsByID;
  v18 = [v14 firstObject];
  id v19 = [(NSMutableDictionary *)cachedSnapshotsByID valueForKey:v18];

  v20 = self->_cachedSnapshotsByID;
  int v21 = [v14 lastObject];
  id v36 = [(NSMutableDictionary *)v20 valueForKey:v21];

  if (v19 && v36)
  {
    v22 = [(MBCKJournal *)self device];
    [v19 setDevice:v22];
    [v36 setDevice:v22];
    if (!v38)
    {
      +[MBCKSnapshot snapshotForDevice:reason:type:snapshotFormat:snapshotID:](MBCKSnapshot, "snapshotForDevice:reason:type:snapshotFormat:snapshotID:", v22, [v36 backupReason], objc_msgSend(v36, "type"), objc_msgSend(v36, "snapshotFormat"), v39);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      v31 = [v36 created];
      [v25 setCreated:v31];

LABEL_22:
      [(MBCKJournal *)self _clearSnapshotActionsWithOperationTracker:v16 error:0];
      CFStringRef v32 = [(MBCKModel *)self cache];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_1000A23F0;
      v40[3] = &unk_100411DB8;
      v40[4] = self;
      id v30 = v25;
      id v41 = v30;
      long long v46 = &v49;
      v42 = v19;
      id v43 = v36;
      id v44 = v39;
      BOOL v47 = a6;
      id v45 = v38;
      int v33 = [v32 performInTransaction:v40];

      BOOL v27 = v33 == 0;
      if (v33 && !v50[5]) {
        objc_storeStrong(v50 + 5, v33);
      }

LABEL_26:
      goto LABEL_27;
    }
    v23 = v50 + 5;
    id obj = v50[5];
    unsigned __int8 v24 = [v38 fetchManifestsWithOperationTracker:v16 error:&obj];
    objc_storeStrong(v23, obj);
    if (v24)
    {
      id v25 = v38;
      goto LABEL_22;
    }
  }
  else
  {
    v22 = MBGetDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v22 = v22;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v28 = [v14 firstObject];
        v29 = [v14 lastObject];
        *(_DWORD *)buf = 138412546;
        id v56 = v28;
        __int16 v57 = 2112;
        id v58 = v29;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Input snapshots do not exist: %@ %@", buf, 0x16u);
      }
      id v30 = [v14 firstObject];
      CFStringRef v35 = [v14 lastObject];
      _MBLog();

      BOOL v27 = 0;
      goto LABEL_26;
    }
  }
  BOOL v27 = 0;
LABEL_27:

LABEL_28:
  if (a8) {
    *a8 = v50[5];
  }
  _Block_object_dispose(&v49, 8);

  return v27;
}

- (BOOL)_handleRemoveDomain:(id)a3 domainHmacs:(id)a4 outputSnapshotID:(id)a5 serverSnapshot:(id)a6 operationTracker:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v27 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v17) {
    __assert_rtn("-[MBCKJournal _handleRemoveDomain:domainHmacs:outputSnapshotID:serverSnapshot:operationTracker:error:]", "MBCKJournal.m", 479, "tracker");
  }
  v18 = v17;
  if (!v14)
  {
    id v19 = MBGetDefaultLog();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Input removeDomain snapshot does not exist.", buf, 2u);
LABEL_11:
    _MBLog();
    goto LABEL_12;
  }
  if (!v15)
  {
    id v19 = MBGetDefaultLog();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Merge output snapshotID not specified.", buf, 2u);
    goto LABEL_11;
  }
  id v19 = [(MBCKJournal *)self device];
  [v14 setDevice:v19];
  if (!v16)
  {
    +[MBCKSnapshot snapshotForDevice:reason:type:snapshotFormat:snapshotID:](MBCKSnapshot, "snapshotForDevice:reason:type:snapshotFormat:snapshotID:", v19, objc_msgSend(v14, "backupReason", v27), objc_msgSend(v14, "type"), objc_msgSend(v14, "snapshotFormat"), v15);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    v22 = [v14 created];
    [v20 setCreated:v22];

    goto LABEL_14;
  }
  if (!objc_msgSend(v16, "fetchManifestsWithOperationTracker:error:", v18, a8, v27))
  {
LABEL_12:
    BOOL v21 = 0;
    goto LABEL_20;
  }
  id v20 = v16;
LABEL_14:
  *(void *)buf = 0;
  id v36 = buf;
  uint64_t v37 = 0x3032000000;
  id v38 = sub_1000A23D8;
  id v39 = sub_1000A23E8;
  id v40 = 0;
  [(MBCKJournal *)self _clearSnapshotActionsWithOperationTracker:v18 error:0];
  v23 = [(MBCKModel *)self cache];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000A4038;
  v28[3] = &unk_100411DE0;
  v28[4] = self;
  id v24 = v20;
  id v29 = v24;
  id v30 = v27;
  unsigned int v34 = buf;
  id v31 = v14;
  id v32 = v15;
  id v33 = v16;
  id v25 = [v23 performInTransaction:v28];

  BOOL v21 = v25 == 0;
  if (v25)
  {
    if (!*((void *)v36 + 5)) {
      objc_storeStrong((id *)v36 + 5, v25);
    }
    if (a8) {
      *a8 = *((id *)v36 + 5);
    }
  }

  _Block_object_dispose(buf, 8);
LABEL_20:

  return v21;
}

- (BOOL)_handleSnapshotAction:(id)a3 operationTracker:(id)a4 error:(id *)a5
{
  id v8 = a4;
  BOOL v9 = [a3 stringByReplacingOccurrencesOfString:@"S:" withString:&stru_100418BA8];
  id v10 = [v9 stringByReplacingOccurrencesOfString:@":" withString:@"|"];

  id v11 = [v10 componentsSeparatedByString:@"|"];
  v12 = [v11 firstObject];
  uint64_t v13 = [v11 lastObject];
  id v14 = [(NSMutableDictionary *)self->_snapshotsByID valueForKey:v13];
  id v15 = MBGetDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v32 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Journal snapshot action: %{public}@", buf, 0xCu);
    id v26 = v10;
    _MBLog();
  }

  if (v12 && v13)
  {
    if (v14)
    {
      cachedSnapshotIDs = self->_cachedSnapshotIDs;
      id v17 = [v14 snapshotID];
      LODWORD(cachedSnapshotIDs) = [(NSSet *)cachedSnapshotIDs containsObject:v17];

      if (cachedSnapshotIDs)
      {
        v18 = MBGetDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = [v14 snapshotID];
          *(_DWORD *)buf = 138543618;
          id v32 = v19;
          __int16 v33 = 2114;
          unsigned int v34 = v12;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Output snapshot already exists: %{public}@ skipping %{public}@ request", buf, 0x16u);

          id v27 = [v14 snapshotID];
          _MBLog();
        }
        BOOL v20 = 1;
        goto LABEL_17;
      }
    }
    if ((objc_msgSend(v12, "isEqualToString:", @"merge", v26) & 1) != 0
      || [v12 isEqualToString:@"mergeBase"])
    {
      v18 = [v11 objectAtIndexedSubscript:1];
      BOOL v21 = [v18 componentsSeparatedByString:@","];
      BOOL v20 = -[MBCKJournal _handleMergeAction:outputSnapshotID:serverSnapshot:shouldMergeDeletions:operationTracker:error:](self, "_handleMergeAction:outputSnapshotID:serverSnapshot:shouldMergeDeletions:operationTracker:error:", v21, v13, v14, [v12 isEqualToString:@"merge"], v8, a5);

      goto LABEL_17;
    }
    if ([v12 isEqualToString:@"removeDomain"])
    {
      v18 = [v11 objectAtIndexedSubscript:1];
      v23 = [v18 componentsSeparatedByString:@","];
      cachedSnapshotsByID = self->_cachedSnapshotsByID;
      id v30 = v23;
      id v24 = [v23 firstObject];
      id v29 = [(NSMutableDictionary *)cachedSnapshotsByID valueForKey:v24];

      id v25 = objc_msgSend(v30, "subarrayWithRange:", 1, (char *)objc_msgSend(v30, "count") - 1);
      BOOL v20 = [(MBCKJournal *)self _handleRemoveDomain:v29 domainHmacs:v25 outputSnapshotID:v13 serverSnapshot:v14 operationTracker:v8 error:a5];

      goto LABEL_17;
    }
    if ([v12 isEqualToString:@"repair"])
    {
      BOOL v20 = 0;
      goto LABEL_18;
    }
    v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Unrecognized journal entry: %@", buf, 0xCu);
      goto LABEL_12;
    }
  }
  else
  {
    v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "No action or outputSnapshot specified: %{public}@", buf, 0xCu);
LABEL_12:
      _MBLog();
    }
  }
  BOOL v20 = 0;
LABEL_17:

LABEL_18:
  return v20;
}

- (NSArray)snapshotActions
{
  return self->_snapshotActions;
}

- (NSArray)processedSnapshotActions
{
  return self->_processedSnapshotActions;
}

- (MBCKDevice)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  return (MBCKDevice *)WeakRetained;
}

- (void)setDevice:(id)a3
{
}

- (MBCKEngine)engine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  return (MBCKEngine *)WeakRetained;
}

- (void)setEngine:(id)a3
{
}

- (NSSet)cachedSnapshotIDs
{
  return self->_cachedSnapshotIDs;
}

- (void)setCachedSnapshotIDs:(id)a3
{
}

- (NSString)recordPrefix
{
  return self->_recordPrefix;
}

- (void)setRecordPrefix:(id)a3
{
}

- (NSMutableDictionary)cachedSnapshotsByID
{
  return self->_cachedSnapshotsByID;
}

- (void)setCachedSnapshotsByID:(id)a3
{
}

- (NSMutableDictionary)snapshotsByID
{
  return self->_snapshotsByID;
}

- (void)setSnapshotsByID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotsByID, 0);
  objc_storeStrong((id *)&self->_cachedSnapshotsByID, 0);
  objc_storeStrong((id *)&self->_recordPrefix, 0);
  objc_storeStrong((id *)&self->_cachedSnapshotIDs, 0);
  objc_destroyWeak((id *)&self->_engine);
  objc_destroyWeak((id *)&self->_device);
  objc_storeStrong((id *)&self->_processedSnapshotActions, 0);
  objc_storeStrong((id *)&self->_snapshotActions, 0);
}

@end