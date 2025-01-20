@interface EscrowRequestInformCloudServicesOperation
+ (id)triggerCloudServicesPasscodeRequest:(id)a3 serializedReason:(id)a4 error:(id *)a5;
- (CKKSLockStateTracker)lockStateTracker;
- (EscrowRequestInformCloudServicesOperation)initWithIntendedState:(id)a3 errorState:(id)a4 lockStateTracker:(id)a5;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)main;
- (void)setLockStateTracker:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation EscrowRequestInformCloudServicesOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);

  objc_storeStrong((id *)&self->_nextState, 0);
}

- (void)setLockStateTracker:(id)a3
{
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 96, 1);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 80, 1);
}

- (void)main
{
  v3 = sub_10000B070("escrowrequest");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Telling CloudServices about any pending requests", buf, 2u);
  }

  id v44 = 0;
  v4 = +[SecEscrowPendingRecord loadAllFromKeychain:&v44];
  id v5 = v44;
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 domain];
    if ([v7 isEqualToString:NSOSStatusErrorDomain])
    {
      id v8 = [v6 code];

      if (v8 == (id)-25300) {
        goto LABEL_6;
      }
    }
    else
    {
    }
    v28 = sub_10000B070("escrowrequest");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = v6;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "failed to fetch records from keychain: %@", buf, 0xCu);
    }

    v29 = [(EscrowRequestInformCloudServicesOperation *)self lockStateTracker];
    unsigned int v30 = [v29 isLockedError:v6];

    if (v30)
    {
      v31 = sub_10000B070("escrowrequest");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Trying again after unlock", buf, 2u);
      }

      v32 = &off_100307200;
    }
    else
    {
      v32 = &off_100307208;
    }
    [(EscrowRequestInformCloudServicesOperation *)self setNextState:*v32];
    [(CKKSResultOperation *)self setError:v6];
    goto LABEL_50;
  }
LABEL_6:

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v41;
LABEL_8:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v41 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v40 + 1) + 8 * v13);
      if (![v14 hasCertCached]) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v11) {
          goto LABEL_8;
        }
        goto LABEL_14;
      }
    }
    id v15 = v14;

    if (!v15) {
      goto LABEL_25;
    }
    v16 = [v15 uuid];
    v17 = [v15 serializedReason];
    id v39 = 0;
    v18 = +[EscrowRequestInformCloudServicesOperation triggerCloudServicesPasscodeRequest:v16 serializedReason:v17 error:&v39];
    id v6 = v39;

    v19 = +[NSDate date];
    [v19 timeIntervalSince1970];
    [v15 setLastCloudServicesTriggerTime:(unint64_t)(v20 * 1000.0)];

    if (!v18 || v6)
    {
      v33 = sub_10000B070("SecError");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v47 = v6;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "escrowrequest: cloudservices reports an issue caching the certificate, so we'll have to try again later: %@", buf, 0xCu);
      }

      [(CKKSResultOperation *)self setError:v6];
      [(EscrowRequestInformCloudServicesOperation *)self setNextState:@"nothing_to_do"];
      id v38 = 0;
      [v15 saveToKeychain:&v38];
      id v34 = v38;
      if (v34)
      {
        v35 = sub_10000B070("SecError");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v47 = v34;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "escrowrequest: unable to save the last attempt time: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      [v15 setCertCached:1];
      id v37 = 0;
      [v15 saveToKeychain:&v37];
      id v21 = v37;
      if (v21)
      {
        id v6 = v21;
        v22 = sub_10000B070("SecError");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v47 = v6;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "escrowrequest: unable to save escrow update request certificate status, so we'll have to try again later: %@", buf, 0xCu);
        }

        [(CKKSResultOperation *)self setError:v6];
        v23 = [(EscrowRequestInformCloudServicesOperation *)self lockStateTracker];
        unsigned int v24 = [v23 isLockedError:v6];

        if (v24)
        {
          v25 = sub_10000B070("escrowrequest");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Trying again after unlock", buf, 2u);
          }

          CFStringRef v26 = @"wait_for_unlock";
        }
        else
        {
          CFStringRef v26 = @"nothing_to_do";
        }
        [(EscrowRequestInformCloudServicesOperation *)self setNextState:v26];
      }
      else
      {
        v36 = sub_10000B070("escrowrequest");
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "CloudService successfully cached a certificate; request is ready for passcode",
            buf,
            2u);
        }

        [(EscrowRequestInformCloudServicesOperation *)self setNextState:@"nothing_to_do"];
        id v6 = 0;
      }
    }
  }
  else
  {
LABEL_14:

LABEL_25:
    v27 = sub_10000B070("escrowrequest");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No pending escrow request needs a certificate", buf, 2u);
    }

    [(EscrowRequestInformCloudServicesOperation *)self setNextState:@"nothing_to_do"];
    id v6 = 0;
  }
LABEL_50:
}

- (EscrowRequestInformCloudServicesOperation)initWithIntendedState:(id)a3 errorState:(id)a4 lockStateTracker:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EscrowRequestInformCloudServicesOperation;
  uint64_t v12 = [(CKKSResultOperation *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_intendedState, a3);
    objc_storeStrong((id *)&v13->_nextState, a4);
    objc_storeStrong((id *)&v13->_lockStateTracker, a5);
  }

  return v13;
}

+ (id)triggerCloudServicesPasscodeRequest:(id)a3 serializedReason:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [objc_alloc((Class)SecureBackup) initWithUserActivityLabel:@"passcodeRequest"];
  id v10 = [objc_alloc((Class)SecureBackupEscrowReason) initWithData:v7];

  id v20 = 0;
  id v11 = [v9 beginHSA2PasscodeRequest:1 uuid:v8 reason:v10 error:&v20];

  id v12 = v20;
  uint64_t v13 = v12;
  if (v11) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    v17 = [v11 cert];

    if (v17)
    {
      v16 = [v11 cert];
      goto LABEL_15;
    }
    v18 = sub_10000B070("SecError");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "escrowrequest: sbd failed to cache a certificate", buf, 2u);
    }
  }
  else
  {
    objc_super v15 = sub_10000B070("SecError");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "escrowrequest: unable to begin passcode request: %@", buf, 0xCu);
    }

    if (a5)
    {
      v16 = 0;
      *a5 = v13;
      goto LABEL_15;
    }
  }
  v16 = 0;
LABEL_15:

  return v16;
}

@end