@interface REMDAChangeTrackingHelper
+ (BOOL)shouldIgnoreChangeOfModelClassProperties:(Class)a3 withChangeObject:(id)a4;
- (BOOL)compareCurrentChangeTokenToLastConsumedWithResult:(int64_t *)a3 error:(id *)a4;
- (NSArray)entityNames;
- (NSMutableDictionary)cached_insertedModelObjectResultsByModelClassName;
- (NSMutableDictionary)cached_updatedModelObjectResultsByModelClassName;
- (NSString)clientName;
- (REMChangeSet)_debug_mockChangeSet;
- (REMChangeSet)changeSet;
- (REMChangeToken)cached_currentChangeToken;
- (REMChangeToken)sinceToken;
- (REMChangeToken)upToToken;
- (REMChangeTracking)changeTracking;
- (REMChangeTrackingState)cached_currentTrackingState;
- (REMDAAccountProviding)account;
- (REMDAChangeTrackingHelper)initWithREMDAAccount:(id)a3 clientName:(id)a4 withREMStore:(id)a5;
- (REMDAChangeTrackingHelper)initWithREMDAAccount:(id)a3 clientName:(id)a4 withREMStore:(id)a5 entityNames:(id)a6;
- (REMObjectID)cached_remAccountObjectID;
- (REMStore)remStore;
- (id)_cachedModeObjectResultsForModelClass:(Class)a3 changeType:(int64_t)a4;
- (id)_changedModelObjectsOfClass:(Class)a3 ofChangeTypes:(int64_t)a4 shouldOutputFetchedModels:(BOOL)a5;
- (id)_debug_currentChangeTokenWithError:(id *)a3;
- (id)_fetchModelObjectOfClass:(Class)a3 withObjectID:(id)a4 includeConcealedObjects:(BOOL)a5;
- (id)_fetchModelObjectsOfClass:(Class)a3 withObjectIDs:(id)a4;
- (id)_rem_accountObjectID;
- (id)_rem_changeTracking:(id)a3;
- (id)changedIdentifiersOfModelClass:(Class)a3 ofChangeType:(int64_t)a4;
- (id)changedModelObjectsOfModelClass:(Class)a3 ofChangeType:(int64_t)a4;
- (id)currentChangeTokenWithError:(id *)a3;
- (id)fetchAndInitializeChangeTrackingStateIfNeeded;
- (id)fetchChangesSinceLastConsumed;
- (int64_t)_changeTypeMaskFromChangeType:(int64_t)a3;
- (void)_debug_resetCaches;
- (void)_handleIsConcealedUpdatesInChange:(id)a3 ofModelClass:(Class)a4 forClientID:(id)a5 concealedHandler:(id)a6 unconcealedHandler:(id)a7;
- (void)_setCachedModeObjectResults:(id)a3 forModelClass:(Class)a4 changeType:(int64_t)a5;
- (void)clearCachedModelObjectResultsForModelClass:(Class)a3;
- (void)fetchAndInitializeChangeTrackingStateIfNeeded;
- (void)fetchChangesSinceLastConsumed;
- (void)markChangesConsumed;
- (void)markChangesConsumed:(BOOL)a3;
- (void)setCached_currentChangeToken:(id)a3;
- (void)setCached_currentTrackingState:(id)a3;
- (void)setCached_insertedModelObjectResultsByModelClassName:(id)a3;
- (void)setCached_remAccountObjectID:(id)a3;
- (void)setCached_updatedModelObjectResultsByModelClassName:(id)a3;
- (void)setChangeSet:(id)a3;
- (void)setChangeTracking:(id)a3;
- (void)setClientName:(id)a3;
- (void)setEntityNames:(id)a3;
- (void)setRemStore:(id)a3;
- (void)setSinceToken:(id)a3;
- (void)setUpToToken:(id)a3;
- (void)set_debug_mockChangeSet:(id)a3;
@end

@implementation REMDAChangeTrackingHelper

- (REMDAChangeTrackingHelper)initWithREMDAAccount:(id)a3 clientName:(id)a4 withREMStore:(id)a5
{
  return [(REMDAChangeTrackingHelper *)self initWithREMDAAccount:a3 clientName:a4 withREMStore:a5 entityNames:0];
}

- (REMDAChangeTrackingHelper)initWithREMDAAccount:(id)a3 clientName:(id)a4 withREMStore:(id)a5 entityNames:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v19 = +[REMLog changeTracking];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[REMDAChangeTrackingHelper initWithREMDAAccount:clientName:withREMStore:entityNames:]();
    }
    goto LABEL_12;
  }
  if (!v13)
  {
    v19 = +[REMLog changeTracking];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[REMDAChangeTrackingHelper initWithREMDAAccount:clientName:withREMStore:entityNames:](self);
    }
    goto LABEL_12;
  }
  v21.receiver = self;
  v21.super_class = (Class)REMDAChangeTrackingHelper;
  v15 = [(REMDAChangeTrackingHelper *)&v21 init];
  self = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a3);
    objc_storeStrong((id *)&self->_remStore, a5);
    objc_storeStrong((id *)&self->_clientName, a4);
    objc_storeStrong((id *)&self->_entityNames, a6);
    v16 = [(REMDAChangeTrackingHelper *)self _rem_changeTracking:v12];
    changeTracking = self->_changeTracking;
    self->_changeTracking = v16;

    [(REMChangeTracking *)self->_changeTracking setEntityNames:v14];
    if (!self->_changeTracking)
    {
      v19 = +[REMLog changeTracking];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[REMDAChangeTrackingHelper initWithREMDAAccount:clientName:withREMStore:entityNames:](self);
      }
LABEL_12:

      v18 = 0;
      goto LABEL_13;
    }
  }
  self = self;
  v18 = self;
LABEL_13:

  return v18;
}

- (id)currentChangeTokenWithError:(id *)a3
{
  uint64_t v5 = [(REMDAChangeTrackingHelper *)self cached_currentChangeToken];
  if (v5)
  {
    v6 = (void *)v5;
    id v7 = 0;
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v9 = [(REMDAChangeTrackingHelper *)self changeTracking];
  id v10 = 0;
  v6 = [v9 currentChangeTokenWithError:&v10];
  id v7 = v10;

  [(REMDAChangeTrackingHelper *)self setCached_currentChangeToken:v6];
  if (a3) {
LABEL_3:
  }
    *a3 = v7;
LABEL_4:

  return v6;
}

- (id)fetchAndInitializeChangeTrackingStateIfNeeded
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(REMDAChangeTrackingHelper *)self changeTracking];
  v4 = [v3 changeTrackingClientID];

  uint64_t v5 = [(REMDAChangeTrackingHelper *)self cached_currentTrackingState];
  if (v5)
  {
LABEL_2:
    v6 = +[REMLog changeTracking];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(REMChangeTrackingState *)v5 lastConsumedChangeToken];
      v8 = [(REMChangeTrackingState *)v5 lastConsumedDate];
      *(_DWORD *)buf = 138543874;
      v22 = v4;
      __int16 v23 = 2114;
      v24 = v7;
      __int16 v25 = 2114;
      v26 = v8;
      _os_log_impl(&dword_1B9AA2000, v6, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: Found and fetched change tracking state for {clientID: %{public}@, lastSyncToken: %{public}@, lastSyncDate: %{public}@}", buf, 0x20u);
    }
    goto LABEL_4;
  }
  id v10 = [(REMDAChangeTrackingHelper *)self changeTracking];
  id v20 = 0;
  uint64_t v5 = [v10 getTrackingStateWithError:&v20];
  id v11 = v20;

  if (v11)
  {
    v6 = +[REMLog changeTracking];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[REMDAChangeTrackingHelper fetchAndInitializeChangeTrackingStateIfNeeded]();
    }
    goto LABEL_11;
  }
  if (v5) {
    goto LABEL_2;
  }
  uint64_t v5 = objc_alloc_init(REMChangeTrackingState);
  id v19 = 0;
  v6 = [(REMDAChangeTrackingHelper *)self currentChangeTokenWithError:&v19];
  id v13 = v19;
  id v11 = v13;
  if (!v6 || v13)
  {
    v17 = +[REMLog changeTracking];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[REMDAChangeTrackingHelper fetchAndInitializeChangeTrackingStateIfNeeded]();
    }
    goto LABEL_26;
  }
  [(REMChangeTrackingState *)v5 setLastConsumedChangeToken:v6];
  id v14 = +[REMLog changeTracking];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [(REMChangeTrackingState *)v5 lastConsumedChangeToken];
    *(_DWORD *)buf = 138543618;
    v22 = v4;
    __int16 v23 = 2114;
    v24 = v15;
    _os_log_impl(&dword_1B9AA2000, v14, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: Initializing a change tracking state for {clientID: %{public}@, nowToken: %{public}@}", buf, 0x16u);
  }
  v16 = [(REMDAChangeTrackingHelper *)self changeTracking];
  id v18 = 0;
  [v16 saveTrackingState:v5 error:&v18];
  id v11 = v18;

  if (v11)
  {
    v17 = +[REMLog changeTracking];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[REMDAChangeTrackingHelper fetchAndInitializeChangeTrackingStateIfNeeded]();
    }
LABEL_26:

LABEL_11:
LABEL_12:
    uint64_t v5 = objc_alloc_init(REMChangeTrackingState);
    goto LABEL_13;
  }
LABEL_4:

  v9 = [(REMDAChangeTrackingHelper *)self cached_currentTrackingState];

  if (v9 != v5) {
    [(REMDAChangeTrackingHelper *)self setCached_currentTrackingState:v5];
  }

  if (!v5) {
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (BOOL)compareCurrentChangeTokenToLastConsumedWithResult:(int64_t *)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = [(REMDAChangeTrackingHelper *)self changeTracking];
  v8 = [v7 changeTrackingClientID];

  v9 = [(REMDAChangeTrackingHelper *)self upToToken];
  if (v9
    || (-[REMDAChangeTrackingHelper fetchAndInitializeChangeTrackingStateIfNeeded](self, "fetchAndInitializeChangeTrackingStateIfNeeded"), id v10 = objc_claimAutoreleasedReturnValue(), [v10 lastConsumedChangeToken], v9 = objc_claimAutoreleasedReturnValue(), v10, v9))
  {
    id v20 = 0;
    id v11 = [(REMDAChangeTrackingHelper *)self currentChangeTokenWithError:&v20];
    id v12 = v20;
    id v13 = v12;
    if (!v11 || v12)
    {
      v16 = +[REMLog changeTracking];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[REMDAChangeTrackingHelper compareCurrentChangeTokenToLastConsumedWithResult:error:]();
      }
      int64_t v14 = 0;
    }
    else
    {
      id v19 = 0;
      int64_t v14 = [v11 compareToken:v9 error:&v19];
      id v13 = v19;
      v15 = +[REMLog changeTracking];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        v22 = v8;
        __int16 v23 = 2114;
        v24 = v11;
        __int16 v25 = 2114;
        v26 = v9;
        _os_log_impl(&dword_1B9AA2000, v15, OS_LOG_TYPE_INFO, "REMDAChangeTrackingHelper: compareCurrentChangeTokenToLastConsumedWithError: comparing current token vs last consumed: {clientID: %{public}@, current: %{public}@, lastConsumed: %{public}@}", buf, 0x20u);
      }

      if (v14 && !v13) {
        goto LABEL_15;
      }
      v16 = +[REMLog changeTracking];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[REMDAChangeTrackingHelper compareCurrentChangeTokenToLastConsumedWithResult:error:]();
      }
    }

LABEL_15:
    goto LABEL_16;
  }
  id v18 = +[REMLog changeTracking];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[REMDAChangeTrackingHelper compareCurrentChangeTokenToLastConsumedWithResult:error:]();
  }

  id v13 = +[REMError internalErrorWithDebugDescription:@"REMDAChangeTrackingHelper: Cannot get last consumed token when trying to peekHasChangesSinceLastConsumed"];
  int64_t v14 = 0;
LABEL_16:

  if (a3) {
    *a3 = v14;
  }
  if (a4) {
    *a4 = v13;
  }

  return v13 == 0;
}

- (id)fetchChangesSinceLastConsumed
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v3 = [(REMDAChangeTrackingHelper *)self changeSet];

  if (!v3)
  {
    v4 = [(REMDAChangeTrackingHelper *)self changeTracking];

    if (!v4)
    {
      v6 = +[REMLog changeTracking];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[REMDAChangeTrackingHelper fetchChangesSinceLastConsumed](self);
      }
      goto LABEL_23;
    }
    uint64_t v5 = [(REMDAChangeTrackingHelper *)self changeTracking];
    v6 = [v5 changeTrackingClientID];

    id v7 = [(REMDAChangeTrackingHelper *)self fetchAndInitializeChangeTrackingStateIfNeeded];
    v8 = [v7 lastConsumedChangeToken];
    uint64_t v9 = [(REMDAChangeTrackingHelper *)self _debug_mockChangeSet];
    if (v9)
    {
      id v10 = (void *)v9;
      id v11 = 0;
    }
    else
    {
      id v12 = [(REMDAChangeTrackingHelper *)self changeTracking];
      id v34 = 0;
      id v10 = [v12 fetchHistoryAfterToken:v8 error:&v34];
      id v11 = v34;
    }
    id v13 = +[REMLog changeTracking];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v14 = [v7 lastConsumedChangeToken];
      v15 = [v7 lastConsumedDate];
      *(_DWORD *)buf = 138544130;
      v36 = v6;
      __int16 v37 = 2114;
      v38 = v14;
      __int16 v39 = 2114;
      v40 = v15;
      __int16 v41 = 2114;
      v42 = v10;
      _os_log_impl(&dword_1B9AA2000, v13, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: fetched history since {clientID: %{public}@, lastSyncToken: %{public}@, lastSyncDate: %{public}@, changeSet: %{public}@}", buf, 0x2Au);
    }
    [(REMDAChangeTrackingHelper *)self setChangeSet:v10];
    [(REMDAChangeTrackingHelper *)self setSinceToken:v8];
    v16 = [MEMORY[0x1E4F1CA60] dictionary];
    [(REMDAChangeTrackingHelper *)self setCached_insertedModelObjectResultsByModelClassName:v16];

    v17 = [MEMORY[0x1E4F1CA60] dictionary];
    [(REMDAChangeTrackingHelper *)self setCached_updatedModelObjectResultsByModelClassName:v17];

    id v18 = [v10 error];
    if (v18)
    {
    }
    else if (([v10 isTruncated] & 1) == 0)
    {
      v26 = [(REMDAChangeTrackingHelper *)self account];
      uint64_t v27 = objc_msgSend(v26, "rem_accountObjectID");
      v28 = [v10 lastChangeTokenForAccountID:v27];
      [(REMDAChangeTrackingHelper *)self setUpToToken:v28];

      id v20 = +[REMLog changeTracking];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v29 = [(REMDAChangeTrackingHelper *)self upToToken];
        *(_DWORD *)buf = 138543874;
        v36 = v6;
        __int16 v37 = 2114;
        v38 = v8;
        __int16 v39 = 2114;
        v40 = v29;
        _os_log_impl(&dword_1B9AA2000, v20, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: fetchChangesSinceLastConsumed done {clientID: %{public}@, lastSyncToken: %{public}@, upToToken: %{public}@}", buf, 0x20u);
      }
      goto LABEL_18;
    }
    id v19 = +[REMLog changeTracking];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "isTruncated"));
      v31 = [v10 error];
      v32 = [v31 localizedDescription];
      *(_DWORD *)buf = 138544130;
      v36 = v6;
      __int16 v37 = 2114;
      v38 = v8;
      __int16 v39 = 2114;
      v40 = v30;
      __int16 v41 = 2112;
      v42 = v32;
      _os_log_error_impl(&dword_1B9AA2000, v19, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper: ERROR: Fetched truncated or error change history {clientID: %{public}@, lastSyncToken: %{public}@, isTruncated: %{public}@, changeSet.error: %@}", buf, 0x2Au);
    }
    id v33 = v11;
    id v20 = [(REMDAChangeTrackingHelper *)self currentChangeTokenWithError:&v33];
    id v21 = v33;

    v22 = +[REMLog changeTracking];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = v6;
      __int16 v37 = 2114;
      v38 = v20;
      _os_log_impl(&dword_1B9AA2000, v22, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: Will try to reset tracking state to current token because we had a truncated or error change-set {clientID: %{public}@, nowToken: %{public}@}", buf, 0x16u);
    }

    [(REMDAChangeTrackingHelper *)self setUpToToken:v20];
    id v11 = v21;
LABEL_18:

    [(REMDAChangeTrackingHelper *)self setCached_currentChangeToken:0];
    if (v11)
    {
      __int16 v23 = +[REMLog changeTracking];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[REMDAChangeTrackingHelper fetchChangesSinceLastConsumed](self);
      }
    }
LABEL_23:
  }
  v24 = [(REMDAChangeTrackingHelper *)self changeSet];

  return v24;
}

- (void)markChangesConsumed
{
}

- (void)markChangesConsumed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(REMDAChangeTrackingHelper *)self changeTracking];

  if (v5)
  {
    v6 = [(REMDAChangeTrackingHelper *)self changeTracking];
    id v7 = [v6 changeTrackingClientID];

    v8 = [(REMDAChangeTrackingHelper *)self changeSet];
    if (v8)
    {
      uint64_t v9 = [(REMDAChangeTrackingHelper *)self changeSet];
      int v10 = [v9 isTruncated];
    }
    else
    {
      int v10 = 0;
    }

    if (v3 || v10)
    {
      id v19 = [(REMDAChangeTrackingHelper *)self changeTracking];
      id v38 = 0;
      id v18 = [v19 currentChangeTokenWithError:&v38];
      id v14 = v38;

      if (v14)
      {
        id v20 = +[REMLog changeTracking];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          id v34 = [(REMDAChangeTrackingHelper *)self account];
          v35 = [v34 loggingDescription];
          *(_DWORD *)buf = 138543874;
          v40 = v7;
          __int16 v41 = 2114;
          v42 = v35;
          __int16 v43 = 2112;
          id v44 = v14;
          _os_log_error_impl(&dword_1B9AA2000, v20, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper: ERROR: Cannot get current token to mark to {clientID: %{public}@, account: %{public}@, error: %@}", buf, 0x20u);
        }
      }
      [(REMDAChangeTrackingHelper *)self setUpToToken:v18];
LABEL_25:

      if (!v18)
      {
LABEL_34:
        [(REMDAChangeTrackingHelper *)self setChangeSet:0];
        [(REMDAChangeTrackingHelper *)self setCached_insertedModelObjectResultsByModelClassName:0];
        [(REMDAChangeTrackingHelper *)self setCached_updatedModelObjectResultsByModelClassName:0];
        [(REMDAChangeTrackingHelper *)self setCached_currentChangeToken:0];
        [(REMDAChangeTrackingHelper *)self setCached_currentTrackingState:0];

        return;
      }
      v26 = objc_alloc_init(REMChangeTrackingState);
      [(REMChangeTrackingState *)v26 setLastConsumedChangeToken:v18];
      uint64_t v27 = [(REMDAChangeTrackingHelper *)self changeTracking];
      id v36 = 0;
      [v27 saveTrackingState:v26 error:&v36];
      id v28 = v36;

      v29 = +[REMLog changeTracking];
      v30 = v29;
      if (v28)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v31 = [v28 localizedDescription];
          v32 = [(REMDAChangeTrackingHelper *)self account];
          id v33 = [v32 loggingDescription];
          *(_DWORD *)buf = 138544386;
          v40 = v18;
          __int16 v41 = 2114;
          v42 = v7;
          __int16 v43 = 2112;
          id v44 = v31;
          __int16 v45 = 2114;
          id v46 = v33;
          __int16 v47 = 1024;
          BOOL v48 = v3;
          _os_log_error_impl(&dword_1B9AA2000, v30, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper: ERROR: Failed to save tracking state with error {tokenToSave: %{public}@, clientID: %{public}@, error: %@, account: %{public}@, forcedToCurrent: %d}", buf, 0x30u);

LABEL_31:
        }
      }
      else if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v31 = [(REMDAChangeTrackingHelper *)self account];
        v32 = [v31 loggingDescription];
        *(_DWORD *)buf = 138544130;
        v40 = v18;
        __int16 v41 = 2114;
        v42 = v7;
        __int16 v43 = 2114;
        id v44 = v32;
        __int16 v45 = 1024;
        LODWORD(v46) = v3;
        _os_log_impl(&dword_1B9AA2000, v30, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: markChangesConsumed done {tokenToSave: %{public}@, clientID: %{public}@, account: %{public}@, forcedToCurrent: %d}", buf, 0x26u);
        goto LABEL_31;
      }

LABEL_33:
      goto LABEL_34;
    }
    uint64_t v11 = [(REMDAChangeTrackingHelper *)self sinceToken];
    if (!v11
      || (id v12 = (void *)v11,
          [(REMDAChangeTrackingHelper *)self upToToken],
          id v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          !v13))
    {
      id v18 = +[REMLog changeTracking];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [(REMDAChangeTrackingHelper *)self account];
        v22 = [v21 loggingDescription];
        *(_DWORD *)buf = 138543618;
        v40 = v7;
        __int16 v41 = 2114;
        v42 = v22;
        _os_log_impl(&dword_1B9AA2000, v18, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: No newer change token in this history {clientID: %{public}@, account: %{public}@}", buf, 0x16u);
      }
      goto LABEL_33;
    }
    id v14 = [(REMDAChangeTrackingHelper *)self sinceToken];
    v15 = [(REMDAChangeTrackingHelper *)self upToToken];
    id v37 = 0;
    uint64_t v16 = [v15 compareToken:v14 error:&v37];
    id v17 = v37;
    if (v16 == 3)
    {
      __int16 v23 = +[REMLog changeTracking];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      v24 = [(REMDAChangeTrackingHelper *)self account];
      __int16 v25 = [v24 loggingDescription];
      *(_DWORD *)buf = 138543874;
      v40 = v15;
      __int16 v41 = 2114;
      v42 = v7;
      __int16 v43 = 2114;
      id v44 = v25;
      _os_log_impl(&dword_1B9AA2000, v23, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: No newer change token in this history {token: %{public}@, clientID: %{public}@, account: %{public}@}", buf, 0x20u);
    }
    else
    {
      if (v16 == 4)
      {
        id v18 = v15;
LABEL_24:

        goto LABEL_25;
      }
      __int16 v23 = +[REMLog changeTracking];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
LABEL_23:

        id v18 = 0;
        goto LABEL_24;
      }
      v24 = [(REMDAChangeTrackingHelper *)self account];
      __int16 v25 = [v24 loggingDescription];
      *(_DWORD *)buf = 138544130;
      v40 = v15;
      __int16 v41 = 2114;
      v42 = v7;
      __int16 v43 = 2114;
      id v44 = v25;
      __int16 v45 = 2112;
      id v46 = v17;
      _os_log_error_impl(&dword_1B9AA2000, v23, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper: ERROR: Unexpected change token {token: %{public}@, clientID: %{public}@, account: %{public}@, error: %@}", buf, 0x2Au);
    }

    goto LABEL_23;
  }
}

- (id)changedModelObjectsOfModelClass:(Class)a3 ofChangeType:(int64_t)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ![(objc_class *)a3 performSelector:sel_isChangeTrackableFetchableModel])
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3B8];
    uint64_t v9 = NSStringFromClass(a3);
    [v7 raise:v8, @"The given model class is not a known trackable-fetchable type for this API, you shouldn't call this with {modelClass: %@}.", v9 format];
  }
  int v10 = [(REMDAChangeTrackingHelper *)self _cachedModeObjectResultsForModelClass:a3 changeType:a4];
  if (!v10)
  {
    int v10 = [(REMDAChangeTrackingHelper *)self _changedModelObjectsOfClass:a3 ofChangeTypes:[(REMDAChangeTrackingHelper *)self _changeTypeMaskFromChangeType:a4] shouldOutputFetchedModels:1];
    [(REMDAChangeTrackingHelper *)self _setCachedModeObjectResults:v10 forModelClass:a3 changeType:a4];
  }

  return v10;
}

- (id)changedIdentifiersOfModelClass:(Class)a3 ofChangeType:(int64_t)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ![(objc_class *)a3 performSelector:sel_isChangeTrackableModel])
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3B8];
    uint64_t v9 = NSStringFromClass(a3);
    [v7 raise:v8, @"The given model class is not a known trackable type for this API, you shouldn't call this with {modelClass: %@}.", v9 format];
  }
  int64_t v10 = [(REMDAChangeTrackingHelper *)self _changeTypeMaskFromChangeType:a4];

  return [(REMDAChangeTrackingHelper *)self _changedModelObjectsOfClass:a3 ofChangeTypes:v10 shouldOutputFetchedModels:0];
}

- (id)_changedModelObjectsOfClass:(Class)a3 ofChangeTypes:(int64_t)a4 shouldOutputFetchedModels:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [(REMDAChangeTrackingHelper *)self changeTracking];

  if (v9)
  {
    int64_t v10 = [(REMDAChangeTrackingHelper *)self changeTracking];
    uint64_t v11 = [v10 changeTrackingClientID];

    if (!v11)
    {
      id v12 = +[REMLog changeTracking];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[REMDAChangeTrackingHelper _changedModelObjectsOfClass:ofChangeTypes:shouldOutputFetchedModels:]();
      }
      uint64_t v16 = 0;
      goto LABEL_23;
    }
    id v12 = [(REMDAChangeTrackingHelper *)self _rem_accountObjectID];
    if (!v12)
    {
      id v17 = +[REMLog changeTracking];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[REMDAChangeTrackingHelper _changedModelObjectsOfClass:ofChangeTypes:shouldOutputFetchedModels:]();
      }
      uint64_t v16 = 0;
      goto LABEL_22;
    }
    id v13 = [MEMORY[0x1E4F1CA48] array];
    id v14 = [(REMDAChangeTrackingHelper *)self changeSet];

    if (!v14)
    {
      id v18 = +[REMLog changeTracking];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v83 = v11;
        _os_log_impl(&dword_1B9AA2000, v18, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: Change set is nil and we have nothing to enumerate for %{public}@.", buf, 0xCu);
      }
      goto LABEL_21;
    }
    v15 = [(REMDAChangeTrackingHelper *)self changeSet];
    if ([v15 isTruncated])
    {

      goto LABEL_19;
    }
    id v19 = [(REMDAChangeTrackingHelper *)self changeSet];
    id v20 = [v19 error];

    if (v20)
    {
LABEL_19:
      id v18 = +[REMLog changeTracking];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = NSNumber;
        v22 = [(REMDAChangeTrackingHelper *)self changeSet];
        __int16 v23 = objc_msgSend(v21, "numberWithBool:", objc_msgSend(v22, "isTruncated"));
        v24 = [(REMDAChangeTrackingHelper *)self changeSet];
        __int16 v25 = [v24 error];
        *(_DWORD *)buf = 138543874;
        v83 = v11;
        __int16 v84 = 2114;
        int64_t v85 = (int64_t)v23;
        __int16 v86 = 2112;
        int64_t v87 = (int64_t)v25;
        _os_log_impl(&dword_1B9AA2000, v18, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: Change set was truncated or had error and we are not going to enumerate it for %{public}@ {isTruncated: %{public}@, changeSet.error: %@}.", buf, 0x20u);
      }
LABEL_21:

      id v17 = v13;
      uint64_t v16 = v17;
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
    uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
    v70 = [MEMORY[0x1E4F1CA48] array];
    id v28 = [MEMORY[0x1E4F1CA48] array];
    int64_t v29 = 2 * (a4 & 1);
    if ((a4 & 4) != 0) {
      int64_t v29 = 2;
    }
    int64_t v68 = v29 | a4;
    v30 = [(REMDAChangeTrackingHelper *)self changeSet];
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke;
    v76[3] = &unk_1E61DD550;
    v76[4] = self;
    Class v81 = a3;
    v67 = v11;
    v77 = v67;
    id v64 = v27;
    id v78 = v64;
    id v63 = v28;
    id v79 = v63;
    id v65 = v70;
    id v80 = v65;
    [v30 enumerateChanges:v68 forModelsOfClass:a3 withBlock:v76];

    if (a4 == 1)
    {
      v31 = v64;
      if (!v5
        || (char v34 = [(objc_class *)a3 rem_DA_supportsFetching], v35 = v64, (v34 & 1) == 0))
      {
        id v36 = v64;

        id v13 = v36;
        goto LABEL_57;
      }
    }
    else
    {
      if (a4 != 2)
      {
        v31 = v64;
        if (a4 == 4)
        {
          v32 = v63;
          id v33 = v63;

          id v13 = v33;
LABEL_58:
          v55 = v65;
LABEL_64:
          id v17 = v13;

          uint64_t v16 = v17;
          goto LABEL_22;
        }
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Mixed change types is not supported."];
LABEL_57:
        v32 = v63;
        goto LABEL_58;
      }
      v31 = v64;
      if (!v5
        || (char v37 = [(objc_class *)a3 rem_DA_supportsFetching], v35 = v65, (v37 & 1) == 0))
      {
        v55 = v65;
        id v58 = v65;

        id v13 = v58;
        v32 = v63;
        goto LABEL_64;
      }
    }
    id v38 = v35;
    if (v38)
    {
      __int16 v39 = v38;
      v40 = [(REMDAChangeTrackingHelper *)self _fetchModelObjectsOfClass:a3 withObjectIDs:v38];
      v62 = v40;
      if (v40)
      {
        v61 = v39;
        __int16 v41 = [v40 allValues];
        v69 = [MEMORY[0x1E4F1CA48] array];

        v71 = [MEMORY[0x1E4F1CA48] array];
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        v42 = v41;
        uint64_t v43 = [v42 countByEnumeratingWithState:&v72 objects:v92 count:16];
        log = v42;
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v73;
          do
          {
            for (uint64_t i = 0; i != v44; ++i)
            {
              if (*(void *)v73 != v45) {
                objc_enumerationMutation(v42);
              }
              __int16 v47 = *(void **)(*((void *)&v72 + 1) + 8 * i);
              BOOL v48 = [v47 accountID];
              char v49 = [v48 isEqual:v12];

              if (v49)
              {
                [v69 addObject:v47];
                v50 = [v47 objectID];
                [v71 addObject:v50];
              }
              else
              {
                v50 = +[REMLog changeTracking];
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                {
                  v51 = [v47 objectID];
                  v52 = [v47 accountID];
                  v53 = [v67 description];
                  *(_DWORD *)buf = 138544386;
                  v83 = v51;
                  __int16 v84 = 2114;
                  int64_t v85 = (int64_t)v52;
                  __int16 v86 = 2114;
                  int64_t v87 = (int64_t)v12;
                  __int16 v88 = 2114;
                  v89 = v53;
                  __int16 v90 = 2048;
                  int64_t v91 = a4;
                  _os_log_impl(&dword_1B9AA2000, v50, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: Unexpectedly got a changed model object from a different account {modelObject: %{public}@, modelObject.account: %{public}@, daREMAccount: %{public}@, clientID: %{public}@, changeType: %lu}", buf, 0x34u);

                  v42 = log;
                }
              }
            }
            uint64_t v44 = [v42 countByEnumeratingWithState:&v72 objects:v92 count:16];
          }
          while (v44);
        }

        v54 = [MEMORY[0x1E4F1CA48] arrayWithArray:v61];
        [v54 removeObjectsInArray:v71];
        v32 = v63;
        v55 = v65;
        id v13 = v69;
        if ([v54 count])
        {
          v56 = +[REMLog changeTracking];
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            v57 = [v67 description];
            *(_DWORD *)buf = 138543874;
            v83 = v57;
            __int16 v84 = 2048;
            int64_t v85 = a4;
            __int16 v86 = 2114;
            int64_t v87 = (int64_t)v54;
            _os_log_impl(&dword_1B9AA2000, v56, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: Could not find changed model object(s) in the ReminderKit with {clientID: %{public}@, changeType: %lu, missingIDs: %{public}@}", buf, 0x20u);
          }
        }

        v31 = v64;
        __int16 v39 = v61;
      }
      else
      {
        log = +[REMLog changeTracking];
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          [v67 description];
          v60 = v59 = v39;
          *(_DWORD *)buf = 138543874;
          v83 = v12;
          __int16 v84 = 2114;
          int64_t v85 = (int64_t)v60;
          __int16 v86 = 2048;
          int64_t v87 = a4;
          _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper: ERROR: Failed to fetch changed model objects for account: {remAccount: %{public}@, clientID: %{public}@, changeType: %lu}", buf, 0x20u);

          __int16 v39 = v59;
        }
        v32 = v63;
        v55 = v65;
      }

      goto LABEL_64;
    }
    goto LABEL_57;
  }
  uint64_t v11 = +[REMLog changeTracking];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[REMDAChangeTrackingHelper _changedModelObjectsOfClass:ofChangeTypes:shouldOutputFetchedModels:]();
  }
  uint64_t v16 = 0;
LABEL_24:

  return v16;
}

void __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = [v5 changedObjectID];
  id v7 = v6;
  if (v6)
  {
    switch(a3)
    {
      case 2:
        id v12 = [v5 tombstone];
        objc_msgSend(*(id *)(a1 + 72), "rem_DA_deletedKeyFromTombstoneBlock");
        id v13 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        id v14 = ((void (**)(void, void *))v13)[2](v13, v12);

        if (v14)
        {
          [*(id *)(a1 + 56) addObject:v14];
        }
        else
        {
          id v18 = +[REMLog changeTracking];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = [*(id *)(a1 + 40) description];
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v7;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v19;
            _os_log_impl(&dword_1B9AA2000, v18, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: (NOTICE)(May be legit) Had a (real-)deleted model object without a deletion key (e.g. external id) {objectID: %{public}@, clientID: %{public}@}", buf, 0x16u);
          }
        }

        break;
      case 1:
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        char v35 = 0;
        uint64_t v15 = *(void *)(a1 + 72);
        uint64_t v16 = *(void **)(a1 + 32);
        uint64_t v17 = *(void *)(a1 + 40);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_2_21;
        v26[3] = &unk_1E61DD500;
        id v27 = *(id *)(a1 + 56);
        id v28 = buf;
        uint64_t v20 = MEMORY[0x1E4F143A8];
        uint64_t v21 = 3221225472;
        v22 = __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_3;
        __int16 v23 = &unk_1E61DD528;
        id v24 = *(id *)(a1 + 48);
        __int16 v25 = buf;
        [v16 _handleIsConcealedUpdatesInChange:v5 ofModelClass:v15 forClientID:v17 concealedHandler:v26 unconcealedHandler:&v20];
        if (!*(unsigned char *)(*(void *)&buf[8] + 24)
          && (objc_msgSend((id)objc_opt_class(), "shouldIgnoreChangeOfModelClassProperties:withChangeObject:", *(void *)(a1 + 72), v5, v20, v21, v22, v23) & 1) == 0)
        {
          [*(id *)(a1 + 64) addObject:v7];
        }

        goto LABEL_14;
      case 0:
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        char v35 = 0;
        uint64_t v8 = *(void *)(a1 + 72);
        uint64_t v9 = *(void **)(a1 + 32);
        uint64_t v10 = *(void *)(a1 + 40);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_2;
        v30[3] = &unk_1E61DD4B0;
        id v11 = v6;
        id v31 = v11;
        id v32 = *(id *)(a1 + 40);
        id v33 = buf;
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_19;
        v29[3] = &unk_1E61DD4D8;
        v29[4] = buf;
        [v9 _handleIsConcealedUpdatesInChange:v5 ofModelClass:v8 forClientID:v10 concealedHandler:v30 unconcealedHandler:v29];
        if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
          [*(id *)(a1 + 48) addObject:v11];
        }

LABEL_14:
        _Block_object_dispose(buf, 8);
        break;
    }
  }
}

void __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = +[REMLog changeTracking];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

uint64_t __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_19(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_2_21(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;

  return MEMORY[0x1F41817F8]();
}

uint64_t __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) addObject:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (void)_handleIsConcealedUpdatesInChange:(id)a3 ofModelClass:(Class)a4 forClientID:(id)a5 concealedHandler:(id)a6 unconcealedHandler:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = (void (**)(id, void *))a6;
  uint64_t v15 = (void (**)(id, void *))a7;
  if ([(objc_class *)a4 rem_DA_supportsConcealedObjects])
  {
    uint64_t v35 = 0;
    uint64_t v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    uint64_t v16 = [(objc_class *)a4 rem_DA_propertiesAffectingIsConcealed];
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    id v31 = __124__REMDAChangeTrackingHelper__handleIsConcealedUpdatesInChange_ofModelClass_forClientID_concealedHandler_unconcealedHandler___block_invoke;
    id v32 = &unk_1E61DD578;
    id v17 = v12;
    id v33 = v17;
    char v34 = &v35;
    [v16 enumerateObjectsUsingBlock:&v29];

    if (!*((unsigned char *)v36 + 24))
    {
LABEL_17:

      _Block_object_dispose(&v35, 8);
      goto LABEL_18;
    }
    id v18 = objc_msgSend(v17, "changedObjectID", v29, v30, v31, v32);
    if (!v18)
    {
      id v19 = +[REMLog changeTracking];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass(a4);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v21 = [v13 description];
        uint64_t v22 = [v17 changeID];
        *(_DWORD *)buf = 138543874;
        id v40 = v20;
        __int16 v41 = 2114;
        v42 = v21;
        __int16 v43 = 2048;
        uint64_t v44 = v22;
        _os_log_error_impl(&dword_1B9AA2000, v19, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper: Cannot handleIsConcealedUpdatesInChange as given change has nil changedObjectID {modelClass: %{public}@, clientID: %{public}@, changeID: %lld}", buf, 0x20u);
      }
      goto LABEL_16;
    }
    id v19 = [(REMDAChangeTrackingHelper *)self _fetchModelObjectOfClass:a4 withObjectID:v18 includeConcealedObjects:0];
    if (v19)
    {
      v15[2](v15, v18);
LABEL_16:

      goto LABEL_17;
    }
    __int16 v23 = [(REMDAChangeTrackingHelper *)self _fetchModelObjectOfClass:a4 withObjectID:v18 includeConcealedObjects:1];
    if (v23)
    {
      id v24 = [(objc_class *)a4 rem_DA_deletedKeyFromConcealedModelObjectBlock];
      __int16 v25 = ((void (**)(void, void *))v24)[2](v24, v23);

      if (v25)
      {
LABEL_15:
        v14[2](v14, v25);

        goto LABEL_16;
      }
      v26 = +[REMLog changeTracking];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = [v13 description];
        *(_DWORD *)buf = 138543874;
        id v40 = v18;
        __int16 v41 = 2114;
        v42 = v23;
        __int16 v43 = 2114;
        uint64_t v44 = (uint64_t)v27;
        _os_log_impl(&dword_1B9AA2000, v26, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: (NOTICE)(Can be legit) Had a concealed (e.g. lazy deleted) model object without a deletion key (e.g. externalIdentifier) {objectID: %{public}@, modelObject: %{public}@, clientID: %{public}@}", buf, 0x20u);
      }
    }
    else
    {
      v26 = +[REMLog changeTracking];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v28 = [v13 description];
        -[REMDAChangeTrackingHelper _handleIsConcealedUpdatesInChange:ofModelClass:forClientID:concealedHandler:unconcealedHandler:]((uint64_t)v18, v28, buf, v26);
      }
    }

    __int16 v25 = 0;
    goto LABEL_15;
  }
LABEL_18:
}

void __124__REMDAChangeTrackingHelper__handleIsConcealedUpdatesInChange_ofModelClass_forClientID_concealedHandler_unconcealedHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 updatedProperties];
  int v6 = [v5 containsObject:v4];

  if (v6) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

+ (BOOL)shouldIgnoreChangeOfModelClassProperties:(Class)a3 withChangeObject:(id)a4
{
  uint64_t v4 = shouldIgnoreChangeOfModelClassProperties_withChangeObject__onceToken;
  id v5 = a4;
  if (v4 != -1) {
    dispatch_once(&shouldIgnoreChangeOfModelClassProperties_withChangeObject__onceToken, &__block_literal_global_17);
  }
  int v6 = [v5 updatedProperties];

  id v7 = (void *)[v6 mutableCopy];
  [v7 minusSet:shouldIgnoreChangeOfModelClassProperties_withChangeObject__propertiesToAvoid];
  LOBYTE(v6) = [v7 count] == 0;

  return (char)v6;
}

uint64_t __87__REMDAChangeTrackingHelper_shouldIgnoreChangeOfModelClassProperties_withChangeObject___block_invoke()
{
  shouldIgnoreChangeOfModelClassProperties_withChangeObject__propertiesToAvoid = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"externalIdentifier", @"externalModificationTag", @"daSyncToken", @"daPushKey", @"lastModifiedDate", @"resolutionTokenMap", @"resolutionTokenMap_v2_JSON", @"resolutionTokenMap_v3_JSONData", 0);

  return MEMORY[0x1F41817F8]();
}

- (id)_fetchModelObjectOfClass:(Class)a3 withObjectID:(id)a4 includeConcealedObjects:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  if (([(objc_class *)a3 rem_DA_supportsFetching] & 1) == 0)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3B8];
    id v11 = NSStringFromClass(a3);
    [v9 raise:v10, @"The given model class does not support fetching, shouldn't enter this function call {%@}.", v11 format];
  }
  if (v5 && ([(objc_class *)a3 rem_DA_supportsConcealedObjects] & 1) == 0)
  {
    id v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3B8];
    id v14 = NSStringFromClass(a3);
    [v12 raise:v13, @"The given model class does not support concealed objects, shouldn't enter this function call with includeConcealedObjects=YES {%@}.", v14 format];
  }
  uint64_t v15 = [(REMDAChangeTrackingHelper *)self changeTracking];
  uint64_t v16 = [v15 changeTrackingClientID];

  if (v8)
  {
    id v17 = [(REMDAChangeTrackingHelper *)self remStore];
    if (!v17)
    {
      __int16 v23 = +[REMLog changeTracking];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        -[REMDAChangeTrackingHelper _fetchModelObjectOfClass:withObjectID:includeConcealedObjects:]();
      }
    }
    id v18 = [(objc_class *)a3 rem_DA_fetchByObjectIDBlock];
    id v24 = 0;
    id v19 = ((void (**)(void, id, BOOL, NSObject *, id *))v18)[2](v18, v8, v5, v17, &v24);
    id v20 = v24;

    if (v20 && [v20 code] != -3000)
    {
      uint64_t v21 = +[REMLog changeTracking];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[REMDAChangeTrackingHelper _fetchModelObjectOfClass:withObjectID:includeConcealedObjects:]();
      }
    }
  }
  else
  {
    id v17 = +[REMLog changeTracking];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[REMDAChangeTrackingHelper _fetchModelObjectOfClass:withObjectID:includeConcealedObjects:]();
    }
    id v19 = 0;
  }

  return v19;
}

- (id)_fetchModelObjectsOfClass:(Class)a3 withObjectIDs:(id)a4
{
  id v6 = a4;
  if (([(objc_class *)a3 rem_DA_supportsFetching] & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3B8];
    uint64_t v9 = NSStringFromClass(a3);
    [v7 raise:v8, @"The given model class does not support fetching, shouldn't enter this function call {%@}.", v9 format];
  }
  uint64_t v10 = [(REMDAChangeTrackingHelper *)self changeTracking];
  id v11 = [v10 changeTrackingClientID];

  id v12 = [(REMDAChangeTrackingHelper *)self remStore];
  if (!v12)
  {
    uint64_t v16 = +[REMLog changeTracking];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[REMDAChangeTrackingHelper _fetchModelObjectsOfClass:withObjectIDs:]();
    }
  }
  uint64_t v13 = [(objc_class *)a3 rem_DA_fetchByObjectIDsBlock];
  id v14 = ((void (**)(void, id, void *, void))v13)[2](v13, v6, v12, 0);

  return v14;
}

- (int64_t)_changeTypeMaskFromChangeType:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return qword_1B9BF2168[a3];
  }
}

- (id)_cachedModeObjectResultsForModelClass:(Class)a3 changeType:(int64_t)a4
{
  if (a4 == 1)
  {
    uint64_t v5 = [(REMDAChangeTrackingHelper *)self cached_updatedModelObjectResultsByModelClassName];
    goto LABEL_5;
  }
  if (!a4)
  {
    uint64_t v5 = [(REMDAChangeTrackingHelper *)self cached_insertedModelObjectResultsByModelClassName];
LABEL_5:
    id v6 = (void *)v5;
    id v7 = NSStringFromClass(a3);
    uint64_t v8 = [v6 valueForKey:v7];

    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

- (void)_setCachedModeObjectResults:(id)a3 forModelClass:(Class)a4 changeType:(int64_t)a5
{
  id v8 = a3;
  if (a5 == 1)
  {
    id v12 = v8;
    uint64_t v9 = [(REMDAChangeTrackingHelper *)self cached_updatedModelObjectResultsByModelClassName];
  }
  else
  {
    if (a5) {
      goto LABEL_6;
    }
    id v12 = v8;
    uint64_t v9 = [(REMDAChangeTrackingHelper *)self cached_insertedModelObjectResultsByModelClassName];
  }
  uint64_t v10 = (void *)v9;
  id v11 = NSStringFromClass(a4);
  [v10 setObject:v12 forKey:v11];

  id v8 = v12;
LABEL_6:
}

- (void)clearCachedModelObjectResultsForModelClass:(Class)a3
{
  uint64_t v5 = [(REMDAChangeTrackingHelper *)self cached_insertedModelObjectResultsByModelClassName];
  id v6 = NSStringFromClass(a3);
  [v5 removeObjectForKey:v6];

  id v8 = [(REMDAChangeTrackingHelper *)self cached_updatedModelObjectResultsByModelClassName];
  id v7 = NSStringFromClass(a3);
  [v8 removeObjectForKey:v7];
}

- (id)_rem_changeTracking:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(REMDAChangeTrackingHelper *)self account];
  id v6 = objc_msgSend(v5, "rem_accountObjectID");

  if (v6)
  {
    id v7 = [(REMDAChangeTrackingHelper *)self remStore];
    id v8 = [v7 provideChangeTrackingForAccountID:v6 clientName:v4];
  }
  else
  {
    uint64_t v9 = +[REMLog changeTracking];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[REMDAChangeTrackingHelper _rem_changeTracking:](self);
    }

    id v8 = 0;
  }

  return v8;
}

- (id)_rem_accountObjectID
{
  id v3 = [(REMDAChangeTrackingHelper *)self cached_remAccountObjectID];

  if (!v3)
  {
    id v4 = [(REMDAChangeTrackingHelper *)self account];
    uint64_t v5 = objc_msgSend(v4, "rem_accountObjectID");
    [(REMDAChangeTrackingHelper *)self setCached_remAccountObjectID:v5];
  }

  return [(REMDAChangeTrackingHelper *)self cached_remAccountObjectID];
}

- (NSArray)entityNames
{
  return self->_entityNames;
}

- (void)setEntityNames:(id)a3
{
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (REMDAAccountProviding)account
{
  return self->_account;
}

- (REMChangeSet)changeSet
{
  return self->_changeSet;
}

- (void)setChangeSet:(id)a3
{
}

- (REMChangeToken)sinceToken
{
  return self->_sinceToken;
}

- (void)setSinceToken:(id)a3
{
}

- (REMChangeToken)upToToken
{
  return self->_upToToken;
}

- (void)setUpToToken:(id)a3
{
}

- (REMStore)remStore
{
  return self->_remStore;
}

- (void)setRemStore:(id)a3
{
}

- (REMChangeTracking)changeTracking
{
  return self->_changeTracking;
}

- (void)setChangeTracking:(id)a3
{
}

- (REMObjectID)cached_remAccountObjectID
{
  return self->_cached_remAccountObjectID;
}

- (void)setCached_remAccountObjectID:(id)a3
{
}

- (NSMutableDictionary)cached_insertedModelObjectResultsByModelClassName
{
  return self->_cached_insertedModelObjectResultsByModelClassName;
}

- (void)setCached_insertedModelObjectResultsByModelClassName:(id)a3
{
}

- (NSMutableDictionary)cached_updatedModelObjectResultsByModelClassName
{
  return self->_cached_updatedModelObjectResultsByModelClassName;
}

- (void)setCached_updatedModelObjectResultsByModelClassName:(id)a3
{
}

- (REMChangeToken)cached_currentChangeToken
{
  return self->_cached_currentChangeToken;
}

- (void)setCached_currentChangeToken:(id)a3
{
}

- (REMChangeTrackingState)cached_currentTrackingState
{
  return self->_cached_currentTrackingState;
}

- (void)setCached_currentTrackingState:(id)a3
{
}

- (REMChangeSet)_debug_mockChangeSet
{
  return self->__debug_mockChangeSet;
}

- (void)set_debug_mockChangeSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__debug_mockChangeSet, 0);
  objc_storeStrong((id *)&self->_cached_currentTrackingState, 0);
  objc_storeStrong((id *)&self->_cached_currentChangeToken, 0);
  objc_storeStrong((id *)&self->_cached_updatedModelObjectResultsByModelClassName, 0);
  objc_storeStrong((id *)&self->_cached_insertedModelObjectResultsByModelClassName, 0);
  objc_storeStrong((id *)&self->_cached_remAccountObjectID, 0);
  objc_storeStrong((id *)&self->_changeTracking, 0);
  objc_storeStrong((id *)&self->_remStore, 0);
  objc_storeStrong((id *)&self->_upToToken, 0);
  objc_storeStrong((id *)&self->_sinceToken, 0);
  objc_storeStrong((id *)&self->_changeSet, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_clientName, 0);

  objc_storeStrong((id *)&self->_entityNames, 0);
}

- (void)_debug_resetCaches
{
  [(REMDAChangeTrackingHelper *)self setChangeSet:0];
  [(REMDAChangeTrackingHelper *)self setCached_insertedModelObjectResultsByModelClassName:0];
  [(REMDAChangeTrackingHelper *)self setCached_updatedModelObjectResultsByModelClassName:0];
  [(REMDAChangeTrackingHelper *)self setCached_currentChangeToken:0];
  [(REMDAChangeTrackingHelper *)self setCached_currentTrackingState:0];

  [(REMDAChangeTrackingHelper *)self setCached_remAccountObjectID:0];
}

- (id)_debug_currentChangeTokenWithError:(id *)a3
{
  id v4 = [(REMDAChangeTrackingHelper *)self changeTracking];
  uint64_t v5 = [v4 currentChangeTokenWithError:a3];

  return v5;
}

- (void)initWithREMDAAccount:clientName:withREMStore:entityNames:.cold.1()
{
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper: ERROR: Couldn't initialize REMDAChangeTrackingHelper without an account.", v1, 2u);
}

- (void)initWithREMDAAccount:(void *)a1 clientName:withREMStore:entityNames:.cold.2(void *a1)
{
  v1 = [a1 account];
  v2 = [v1 loggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B9AA2000, v3, v4, "REMDAChangeTrackingHelper: ERROR: Couldn't initialize REMDAChangeTrackingHelper without an REM store {account: %{public}@}.", v5, v6, v7, v8, v9);
}

- (void)initWithREMDAAccount:(void *)a1 clientName:withREMStore:entityNames:.cold.3(void *a1)
{
  v1 = [a1 account];
  v2 = [v1 loggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B9AA2000, v3, v4, "REMDAChangeTrackingHelper: ERROR: Couldn't initialize REMDAChangeTrackingHelper because we failed to obtain a change tracking API handle {account: %{public}@}.", v5, v6, v7, v8, v9);
}

- (void)fetchAndInitializeChangeTrackingStateIfNeeded
{
  OUTLINED_FUNCTION_6_1();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_1(v0, v1), "localizedDescription");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v3, v4, "REMDAChangeTrackingHelper: ERROR: Failed to get change tracking state with error {clientID: %{public}@, error: %@}", v5, v6, v7, v8, v9);
}

- (void)compareCurrentChangeTokenToLastConsumedWithResult:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_2(&dword_1B9AA2000, v0, v1, "REMDAChangeTrackingHelper: Cannot get last consumed token when compareCurrentChangeTokenToLastConsumedWithError {clientID: %{public}@}", v2);
}

- (void)compareCurrentChangeTokenToLastConsumedWithResult:error:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_2(&dword_1B9AA2000, v0, v1, "REMDAChangeTrackingHelper: Cannot get last current change token when compareCurrentChangeTokenToLastConsumedWithError {clientID: %{public}@}", v2);
}

- (void)compareCurrentChangeTokenToLastConsumedWithResult:error:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_2(&dword_1B9AA2000, v0, v1, "REMDAChangeTrackingHelper: Fails to compare current token with last consumed when compareCurrentChangeTokenToLastConsumedWithError {clientID: %{public}@}", v2);
}

- (void)fetchChangesSinceLastConsumed
{
  uint64_t v1 = [a1 account];
  v2 = [v1 loggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B9AA2000, v3, v4, "REMDAChangeTrackingHelper: Had problem getting change history for account \"%{public}@\"", v5, v6, v7, v8, v9);
}

- (void)_changedModelObjectsOfClass:ofChangeTypes:shouldOutputFetchedModels:.cold.1()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B9AA2000, v2, v3, "REMDAChangeTrackingHelper: ERROR: We didn't get a change tracking client so we have no change set to enumerate from %{public}@.", v4, v5, v6, v7, v8);
}

- (void)_changedModelObjectsOfClass:ofChangeTypes:shouldOutputFetchedModels:.cold.2()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B9AA2000, v2, v3, "REMDAChangeTrackingHelper: ERROR: Couldn't change tracking client ID to enumerate changed objects from %{public}@.", v4, v5, v6, v7, v8);
}

- (void)_changedModelObjectsOfClass:ofChangeTypes:shouldOutputFetchedModels:.cold.3()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v2, v3, "REMDAChangeTrackingHelper: ERROR: Couldn't get REM account objectID to enumerate changed objects from %{public}@ for %{public}@.", v4, v5, v6, v7, v8);
}

void __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) description];
  int v7 = 138543874;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  __int16 v11 = 2114;
  id v12 = v6;
  _os_log_error_impl(&dword_1B9AA2000, a3, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper: Why does the just inserted object got a deletionKey? {objectID: %{public}@, deletionKey: %{public}@, clientID: %{public}@}", (uint8_t *)&v7, 0x20u);
}

- (void)_handleIsConcealedUpdatesInChange:(uint8_t *)buf ofModelClass:(os_log_t)log forClientID:concealedHandler:unconcealedHandler:.cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543874;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = 0;
  *((_WORD *)buf + 11) = 2114;
  *((void *)buf + 3) = a2;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper: (Can be legit) Couldn't even fetch the concealed object with includeConcealedObjects=YES and we can only return nil deletion key {objectID: %{public}@, modelObject: %{public}@, clientID: %{public}@}", buf, 0x20u);
}

- (void)_fetchModelObjectOfClass:withObjectID:includeConcealedObjects:.cold.1()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5_1(v0, v1);
  __int16 v9 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v3, v4, "REMDAChangeTrackingHelper: _fetchModelObjectOfClass:withObjectID:includeConcealedObjects: Cannot proceed to fetch because the change objectID is nil {clientID: %{public}@, model: %{public}@}.", v5, v6, v7, v8, 2u);
}

- (void)_fetchModelObjectOfClass:withObjectID:includeConcealedObjects:.cold.2()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_1(v0, v1), "localizedDescription");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v3, v4, "REMDAChangeTrackingHelper: _fetchModelObjectOfClass:withObjectID:includeConcealedObjects: failed {clientID: %{public}@, error: %@}", v5, v6, v7, v8, v9);
}

- (void)_fetchModelObjectOfClass:withObjectID:includeConcealedObjects:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1B9AA2000, v0, v1, "rem_log_fault_if (!remStore) -- REMDAChangeTrackingHelper: remStore is nil when trying to _fetchModelObjectOfClass:withObjectID:includeConcealedObjects:", v2, v3, v4, v5, v6);
}

- (void)_fetchModelObjectsOfClass:withObjectIDs:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1B9AA2000, v0, v1, "rem_log_fault_if (!remStore) -- REMDAChangeTrackingHelper: remStore is nil when trying to _fetchModelObjectsOfClass:withObjectIDs:", v2, v3, v4, v5, v6);
}

- (void)_rem_changeTracking:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 account];
  uint64_t v2 = [v1 loggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B9AA2000, v3, v4, "REMDAChangeTrackingHelper: ERROR: Couldn't get a change tracking client from store for DataAccess from {account %{public}@}.", v5, v6, v7, v8, v9);
}

@end