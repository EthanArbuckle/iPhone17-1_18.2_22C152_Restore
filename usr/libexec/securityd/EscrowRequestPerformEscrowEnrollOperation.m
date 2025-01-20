@interface EscrowRequestPerformEscrowEnrollOperation
+ (void)cdpUploadPrerecord:(id)a3 secretType:(unint64_t)a4 reply:(id)a5;
- (BOOL)checkFatalError:(id)a3;
- (BOOL)enforceRateLimiting;
- (CKKSLockStateTracker)lockStateTracker;
- (EscrowRequestPerformEscrowEnrollOperation)initWithIntendedState:(id)a3 errorState:(id)a4 enforceRateLimiting:(BOOL)a5 lockStateTracker:(id)a6;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (unint64_t)numberOfRecordsUploaded;
- (void)groupStart;
- (void)setEnforceRateLimiting:(BOOL)a3;
- (void)setLockStateTracker:(id)a3;
- (void)setNextState:(id)a3;
- (void)setNumberOfRecordsUploaded:(unint64_t)a3;
@end

@implementation EscrowRequestPerformEscrowEnrollOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_numberOfRecordsUploaded + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);

  objc_storeStrong((id *)(&self->_enforceRateLimiting + 6), 0);
}

- (void)setLockStateTracker:(id)a3
{
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 158, 1);
}

- (void)setEnforceRateLimiting:(BOOL)a3
{
  self->_enforceRateLimiting = a3;
}

- (BOOL)enforceRateLimiting
{
  return self->_enforceRateLimiting;
}

- (void)setNumberOfRecordsUploaded:(unint64_t)a3
{
  *(OctagonStateString **)((char *)&self->_intendedState + 6) = (OctagonStateString *)a3;
}

- (unint64_t)numberOfRecordsUploaded
{
  return *(unint64_t *)((char *)&self->_intendedState + 6);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 142, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134, 1);
}

- (void)groupStart
{
  v3 = sub_10000B070("escrowrequest");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Attempting to escrow any pending prerecords", buf, 2u);
  }

  id v45 = 0;
  v34 = +[SecEscrowPendingRecord loadAllFromKeychain:&v45];
  id v4 = v45;
  v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  v6 = [v4 domain];
  if (([v6 isEqualToString:NSOSStatusErrorDomain] & 1) == 0)
  {

    goto LABEL_25;
  }
  BOOL v7 = [v5 code] == (id)-25300;

  if (!v7)
  {
LABEL_25:
    v16 = sub_10000B070("escrowrequest");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "failed to fetch records from keychain: %@", buf, 0xCu);
    }

    [(CKKSResultOperation *)self setError:v5];
    v17 = [(EscrowRequestPerformEscrowEnrollOperation *)self lockStateTracker];
    unsigned int v18 = [v17 isLockedError:v5];

    if (v18)
    {
      v19 = sub_10000B070("escrowrequest");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Will retry after unlock", buf, 2u);
      }

      [(EscrowRequestPerformEscrowEnrollOperation *)self setNextState:@"wait_for_unlock"];
    }
    else
    {
      [(EscrowRequestPerformEscrowEnrollOperation *)self setNextState:@"nothing_to_do"];
    }
    goto LABEL_45;
  }
LABEL_6:

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v8 = v34;
  id v9 = [v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v42;
LABEL_8:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v42 != v10) {
        objc_enumerationMutation(v8);
      }
      v12 = *(void **)(*((void *)&v41 + 1) + 8 * v11);
      if ([v12 uploadCompleted]) {
        break;
      }
      if ([(EscrowRequestPerformEscrowEnrollOperation *)self enforceRateLimiting]
        && [v12 escrowAttemptedWithinLastSeconds:300.0])
      {
        v13 = sub_10000B070("escrowrequest");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v12;
          v14 = v13;
          v15 = "Skipping pending escrow request (%@); it's rate limited";
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
        }
LABEL_15:

        goto LABEL_21;
      }
      if ([v12 hasSerializedPrerecord])
      {
        id v20 = v12;

        if (v20) {
          goto LABEL_34;
        }
        goto LABEL_32;
      }
LABEL_21:
      if (v9 == (id)++v11)
      {
        id v9 = [v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
        if (v9) {
          goto LABEL_8;
        }
        goto LABEL_23;
      }
    }
    v13 = sub_10000B070("escrowrequest");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v12;
      v14 = v13;
      v15 = "Skipping completed escrow request (%@)";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
LABEL_23:

LABEL_32:
  v21 = [0 uuid];
  BOOL v22 = v21 == 0;

  if (v22)
  {
    v33 = sub_10000B070("escrowrequest");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "No pending escrow request has a prerecord", buf, 2u);
    }

    [(EscrowRequestPerformEscrowEnrollOperation *)self setNextState:@"nothing_to_do"];
  }
  else
  {
    id v20 = 0;
LABEL_34:
    v23 = sub_10000B070("escrowrequest");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [v20 uuid];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "escrow request have pre-record uploading: %@", buf, 0xCu);
    }
    v25 = +[CKKSResultOperation named:@"cdp-finish" withBlock:&stru_1002F9088];
    [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v25];
    v26 = +[NSDate date];
    [v26 timeIntervalSince1970];
    [v20 setLastEscrowAttemptTime:(unint64_t)(v27 * 1000.0)];

    [v20 setUploadRetries:[v20 uploadRetries] + 1];
    id v40 = 0;
    [v20 saveToKeychain:&v40];
    id v28 = v40;
    if (v28)
    {
      v29 = sub_10000B070("SecError");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "escrowrequest: unable to save last escrow time: %@", buf, 0xCu);
      }
    }
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000B46B8;
    v35[3] = &unk_1002F90B0;
    objc_copyWeak(&v39, (id *)buf);
    id v30 = v20;
    id v36 = v30;
    id v31 = v28;
    id v37 = v31;
    id v32 = v25;
    id v38 = v32;
    +[EscrowRequestPerformEscrowEnrollOperation cdpUploadPrerecord:v30 secretType:3 reply:v35];

    objc_destroyWeak(&v39);
    objc_destroyWeak((id *)buf);
  }
LABEL_45:
}

- (BOOL)checkFatalError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_14;
  }
  if ([v3 code] == (id)24)
  {
    v5 = [v4 domain];
    uint64_t v6 = kSecureBackupErrorDomain;
    unsigned __int8 v7 = [v5 isEqualToString:kSecureBackupErrorDomain];

    if (v7) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v6 = kSecureBackupErrorDomain;
  }
  id v8 = [v4 domain];
  if ([v8 isEqualToString:v6])
  {
    id v9 = [v4 code];

    if (v9 == (id)17) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v10 = [v4 domain];
  if (![v10 isEqualToString:CDPStateErrorDomain])
  {

    goto LABEL_14;
  }
  id v11 = [v4 code];

  if (v11 != (id)-5309)
  {
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_12:
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (EscrowRequestPerformEscrowEnrollOperation)initWithIntendedState:(id)a3 errorState:(id)a4 enforceRateLimiting:(BOOL)a5 lockStateTracker:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)EscrowRequestPerformEscrowEnrollOperation;
  v14 = [(CKKSGroupOperation *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 142), a3);
    objc_storeStrong((id *)(v15 + 134), a4);
    v15[128] = a5;
    objc_storeStrong((id *)(v15 + 158), a6);
  }

  return (EscrowRequestPerformEscrowEnrollOperation *)v15;
}

+ (void)cdpUploadPrerecord:(id)a3 secretType:(unint64_t)a4 reply:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = objc_alloc((Class)CDPStateController);
  uint64_t v10 = +[CDPContext contextForPrimaryAccount];
  id v11 = [v9 initWithContext:v10];

  id v12 = [v8 uuid];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B4DA4;
  v14[3] = &unk_1002FB288;
  id v15 = v7;
  id v13 = v7;
  [v11 attemptToEscrowPreRecord:@"unknown-local-passcode" preRecordUUID:v12 secretType:a4 completion:v14];
}

@end