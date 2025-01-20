@interface OTDetermineCDPCapableAccountStatusOperation
- (NSOperation)finishedOp;
- (OTDetermineCDPCapableAccountStatusOperation)initWithDependencies:(id)a3 stateIfCDPCapable:(id)a4 stateIfNotCDPCapable:(id)a5 stateIfNoAccount:(id)a6 errorState:(id)a7;
- (OTOperationDependencies)deps;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (OctagonStateString)stateIfNoAccount;
- (OctagonStateString)stateIfNotCDPCapable;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setStateIfNoAccount:(id)a3;
- (void)setStateIfNotCDPCapable:(id)a3;
@end

@implementation OTDetermineCDPCapableAccountStatusOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_stateIfNoAccount, 0);
  objc_storeStrong((id *)&self->_stateIfNotCDPCapable, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
}

- (void)setFinishedOp:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 168, 1);
}

- (void)setStateIfNoAccount:(id)a3
{
}

- (OctagonStateString)stateIfNoAccount
{
  return (OctagonStateString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setStateIfNotCDPCapable:(id)a3
{
}

- (OctagonStateString)stateIfNotCDPCapable
{
  return (OctagonStateString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 144, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136, 1);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)groupStart
{
  id v3 = objc_alloc_init((Class)NSOperation);
  [(OTDetermineCDPCapableAccountStatusOperation *)self setFinishedOp:v3];

  v4 = [(OTDetermineCDPCapableAccountStatusOperation *)self finishedOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v4];

  v5 = [(OTDetermineCDPCapableAccountStatusOperation *)self deps];
  v6 = [v5 activeAccount];
  v7 = [v6 altDSID];

  if (v7) {
    goto LABEL_2;
  }
  v18 = sub_10000B070("octagon");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [(OTDetermineCDPCapableAccountStatusOperation *)self deps];
    v20 = [v19 activeAccount];
    *(_DWORD *)buf = 138412290;
    CFStringRef v49 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "iCloud account is not present or not configured: %@", buf, 0xCu);
  }
  v41 = [(OTDetermineCDPCapableAccountStatusOperation *)self deps];
  v21 = [v41 accountsAdapter];
  v22 = [(OTDetermineCDPCapableAccountStatusOperation *)self deps];
  v23 = [v22 personaAdapter];
  v24 = [(OTDetermineCDPCapableAccountStatusOperation *)self deps];
  v25 = [v24 containerName];
  v26 = [(OTDetermineCDPCapableAccountStatusOperation *)self deps];
  v27 = [v26 contextID];
  id v47 = 0;
  v17 = [v21 findAccountForCurrentThread:v23 optionalAltDSID:0 cloudkitContainerName:v25 octagonContextID:v27 error:&v47];
  v16 = (__CFString *)v47;

  if (v17)
  {
    v28 = [(__CFString *)v17 altDSID];

    if (v28)
    {
      if (!v16)
      {
        v7 = [(__CFString *)v17 altDSID];

LABEL_2:
        v8 = sub_10000B070("octagon");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v49 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "iCloud account(altDSID %@) is configured; checking if account is CDP capable",
            buf,
            0xCu);
        }

        v9 = [(OTDetermineCDPCapableAccountStatusOperation *)self deps];
        v10 = [v9 authKitAdapter];
        unsigned int v11 = [v10 accountIsCDPCapableByAltDSID:v7];

        v12 = sub_10000B070("octagon");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v13 = @"not capable";
          if (v11) {
            CFStringRef v13 = @"capable";
          }
          *(_DWORD *)buf = 138412290;
          CFStringRef v49 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Account is %@", buf, 0xCu);
        }

        v14 = [(OTDetermineCDPCapableAccountStatusOperation *)self deps];
        v15 = [v14 stateHolder];
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_10016CA44;
        v43[3] = &unk_1003054E0;
        char v45 = v11;
        v16 = v7;
        v44 = v16;
        id v42 = 0;
        [v15 persistAccountChanges:v43 error:&v42];
        v17 = (__CFString *)v42;

        if (v11) {
          [(OTDetermineCDPCapableAccountStatusOperation *)self intendedState];
        }
        else {
        v29 = [(OTDetermineCDPCapableAccountStatusOperation *)self stateIfNotCDPCapable];
        }
        [(OTDetermineCDPCapableAccountStatusOperation *)self setNextState:v29];

        if (v17)
        {
          v30 = sub_10000B070("SecError");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v49 = v17;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "octagon: unable to save new account state: %@", buf, 0xCu);
          }
        }
        v31 = [(OTDetermineCDPCapableAccountStatusOperation *)self finishedOp];
        [(CKKSGroupOperation *)self runBeforeGroupFinished:v31];

        v32 = v44;
        goto LABEL_29;
      }
    }
  }
  v33 = sub_10000B070("SecError");
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = [(OTDetermineCDPCapableAccountStatusOperation *)self deps];
    v35 = [v34 contextID];
    *(_DWORD *)buf = 138412546;
    CFStringRef v49 = v35;
    __int16 v50 = 2112;
    v51 = v16;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "octagon-account: unable to determine active account(%@); assuming no account is present: %@",
      buf,
      0x16u);
  }
  v36 = [(OTDetermineCDPCapableAccountStatusOperation *)self deps];
  v37 = [v36 stateHolder];
  id v46 = 0;
  [v37 persistAccountChanges:&stru_1003054B8 error:&v46];
  v32 = (__CFString *)v46;

  if (v32)
  {
    v38 = sub_10000B070("SecError");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v49 = v32;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "octagon: unable to save new account state: %@", buf, 0xCu);
    }
  }
  v39 = [(OTDetermineCDPCapableAccountStatusOperation *)self stateIfNoAccount];
  [(OTDetermineCDPCapableAccountStatusOperation *)self setNextState:v39];

  v40 = [(OTDetermineCDPCapableAccountStatusOperation *)self finishedOp];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v40];

LABEL_29:
}

- (OTDetermineCDPCapableAccountStatusOperation)initWithDependencies:(id)a3 stateIfCDPCapable:(id)a4 stateIfNotCDPCapable:(id)a5 stateIfNoAccount:(id)a6 errorState:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)OTDetermineCDPCapableAccountStatusOperation;
  v17 = [(CKKSGroupOperation *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_deps, a3);
    objc_storeStrong((id *)&v18->_intendedState, a4);
    objc_storeStrong((id *)&v18->_stateIfNotCDPCapable, a5);
    objc_storeStrong((id *)&v18->_stateIfNoAccount, a6);
    objc_storeStrong((id *)&v18->_nextState, a7);
  }

  return v18;
}

@end