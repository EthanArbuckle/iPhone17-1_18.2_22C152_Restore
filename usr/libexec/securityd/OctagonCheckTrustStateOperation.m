@interface OctagonCheckTrustStateOperation
- (NSOperation)finishedOp;
- (OTOperationDependencies)deps;
- (OctagonCheckTrustStateOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)afterTPHTrustState:(id)a3 trustedPeers:(id)a4;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation OctagonCheckTrustStateOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
}

- (void)setFinishedOp:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 152, 1);
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

- (void)afterTPHTrustState:(id)a3 trustedPeers:(id)a4
{
  id v5 = a3;
  if ([v5 memberChanges])
  {
    v6 = sub_10000B070("octagon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Member list changed", buf, 2u);
    }

    v7 = [(OctagonCheckTrustStateOperation *)self deps];
    v8 = [v7 octagonAdapter];
    [v8 sendTrustedPeerSetChangedUpdate];
  }
  v9 = [(OctagonCheckTrustStateOperation *)self deps];
  v10 = [v9 stateHolder];
  id v86 = 0;
  v11 = [v10 loadOrCreateAccountMetadata:&v86];
  id v12 = v86;

  if (v12)
  {
    v13 = [(OctagonCheckTrustStateOperation *)self deps];
    v14 = [v13 lockStateTracker];
    unsigned int v15 = [v14 isLockedError:v12];

    v16 = sub_10000B070("SecError");
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (!v15)
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        id v88 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "octagon-consistency: Unable to fetch current account state. Can't ensure consistency: %@", buf, 0xCu);
      }

      goto LABEL_93;
    }
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      id v88 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "octagon-consistency: Unable to fetch current account state due to lock state: %@", buf, 0xCu);
    }

    CFStringRef v18 = @"WaitForClassCUnlock";
LABEL_92:
    [(OctagonCheckTrustStateOperation *)self setNextState:v18];
LABEL_93:
    id v49 = [(OctagonCheckTrustStateOperation *)self finishedOp];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v49];
    goto LABEL_94;
  }
  if (([v5 peerStatus] & 4) != 0
    || ([v5 peerStatus] & 0x20) != 0)
  {
    char v19 = 1;
    uint64_t v20 = 1;
  }
  else if (([v5 peerStatus] & 0x40) != 0 {
         || ([v5 peerStatus] & 2) != 0
  }
         || ([v5 peerStatus] & 1) != 0)
  {
    char v19 = 0;
    uint64_t v20 = 2;
  }
  else
  {
    char v19 = 0;
    uint64_t v20 = 0;
  }
  v21 = sub_10000B070("octagon-consistency");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    [v5 peerStatus];
    TPPeerStatusToString();
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = *(&off_100305550 + v20);
    *(_DWORD *)buf = 138412546;
    id v88 = v22;
    __int16 v89 = 2112;
    v90 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "TPH's trust state (%@) is considered %@", buf, 0x16u);
  }
  unsigned int v24 = [v11 trustState];
  if (v20 == v24)
  {
    v25 = sub_10000B070("octagon-consistency");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      [v5 peerStatus];
      v26 = TPPeerStatusToString();
      *(_DWORD *)buf = 138412290;
      id v88 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "TPH peer status matches cache: (%@)", buf, 0xCu);
    }
    v27 = +[CKKSAnalytics logger];
    [v27 logSuccessForEventNamed:@"OctagonEventCheckTrustState"];
  }
  else
  {
    v28 = sub_10000B070("SecError");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = [v11 trustState];
      if (v29 >= 3)
      {
        v30 = +[NSString stringWithFormat:@"(unknown: %i)", v29];
      }
      else
      {
        v30 = *(&off_100305550 + v29);
      }
      id v31 = v30;
      v32 = *(&off_100305550 + v20);
      *(_DWORD *)buf = 138412546;
      id v88 = v31;
      __int16 v89 = 2112;
      v90 = v32;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "octagon-consistency: Locally cached status (%@) does not match TPH's current peer status (%@)", buf, 0x16u);
    }
    unsigned int v33 = [v11 trustState];
    char v34 = v19 ^ 1;
    if (v33 != 2) {
      char v34 = 1;
    }
    if ((v34 & 1) == 0)
    {
      v35 = +[CKKSAnalytics logger];
      [v35 logHardFailureForEventNamed:@"OctagonEventCheckTrustState" withAttributes:0];
    }
    [v11 setTrustState:v20];
  }
  v36 = [v5 peerID];
  v37 = [v11 peerID];
  if ([v36 isEqualToString:v37])
  {

    goto LABEL_39;
  }
  v40 = [v5 peerID];
  if (v40)
  {

LABEL_46:
    v42 = sub_10000B070("SecError");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = [v11 peerID];
      v44 = [v5 peerID];
      *(_DWORD *)buf = 138412546;
      id v88 = v43;
      __int16 v89 = 2112;
      v90 = v44;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "octagon-consistency: Locally cached peer ID (%@) does not match TPH's current peer ID (%@)", buf, 0x16u);
    }
    v45 = [v5 peerID];
    [v11 setPeerID:v45];

    goto LABEL_49;
  }
  v41 = [v11 peerID];

  if (v41) {
    goto LABEL_46;
  }
LABEL_39:
  v38 = sub_10000B070("octagon-consistency");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    v39 = [v5 peerID];
    *(_DWORD *)buf = 138412290;
    id v88 = v39;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "TPH peer ID matches cache: (%@)", buf, 0xCu);
  }
  if (v20 == v24)
  {
LABEL_54:
    v51 = [v5 osVersion];

    if (v51)
    {
      v52 = [(OctagonCheckTrustStateOperation *)self deps];
      v53 = [v52 deviceInformationAdapter];
      v54 = [v53 osVersion];

      if (v54)
      {
        v55 = [v5 osVersion];
        unsigned __int8 v56 = [v54 isEqualToString:v55];

        if ((v56 & 1) == 0)
        {
          v57 = [[OctagonPendingFlag alloc] initWithFlag:@"recd_push" conditions:1];
          v58 = [(OctagonCheckTrustStateOperation *)self deps];
          v59 = [v58 flagHandler];
          [v59 handlePendingFlag:v57];
        }
      }
    }
    uint64_t v60 = [v11 peerID];
    if (v60)
    {
      v61 = (void *)v60;
      unsigned int v62 = [v11 trustState];

      if (v62 == 2)
      {
        v63 = sub_10000B070("octagon");
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          v64 = [v11 peerID];
          *(_DWORD *)buf = 138412290;
          id v88 = v64;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Appear to be trusted for peer %@; ensuring correct state",
            buf,
            0xCu);
        }
        v65 = &off_100305538;
        goto LABEL_91;
      }
    }
    v66 = [(OctagonCheckTrustStateOperation *)self deps];
    v67 = [v66 sosAdapter];
    if ([v67 sosEnabled])
    {
      unsigned int v68 = [v11 trustState];

      if (v68 != 2)
      {
        v63 = sub_10000B070("octagon");
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          v69 = [v11 trustStateAsString:[v11 trustState]];
          *(_DWORD *)buf = 138412290;
          id v88 = v69;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Have iCloud account but not trusted in Octagon yet: %@; attempting SOS upgrade",
            buf,
            0xCu);
        }
        v65 = &off_100305540;
        goto LABEL_91;
      }
    }
    else
    {
    }
    unsigned int v76 = [v11 trustState];
    v63 = sub_10000B070("octagon");
    BOOL v77 = os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT);
    if (v76 == 2)
    {
      if (v77)
      {
        id v78 = [v11 trustState];
        if (v78 >= 3)
        {
          v79 = +[NSString stringWithFormat:@"(unknown: %i)", v78];
        }
        else
        {
          v79 = *(&off_100305550 + v78);
        }
        *(_DWORD *)buf = 138412290;
        id v88 = v79;
        v82 = "Unknown trust state (%@). Assuming untrusted...";
LABEL_89:
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, v82, buf, 0xCu);
      }
    }
    else if (v77)
    {
      id v81 = [v11 trustState];
      if (v81 >= 3)
      {
        v79 = +[NSString stringWithFormat:@"(unknown: %i)", v81];
      }
      else
      {
        v79 = *(&off_100305550 + v81);
      }
      *(_DWORD *)buf = 138412290;
      id v88 = v79;
      v82 = "Have iCloud account but not trusted in Octagon (%@)";
      goto LABEL_89;
    }
    v65 = &off_100305548;
LABEL_91:

    CFStringRef v18 = *v65;
    goto LABEL_92;
  }
LABEL_49:
  v46 = [(OctagonCheckTrustStateOperation *)self deps];
  v47 = [v46 stateHolder];
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_10016D8EC;
  v84[3] = &unk_100307118;
  id v85 = v11;
  id v83 = 0;
  unsigned int v48 = [v47 persistAccountChanges:v84 error:&v83];
  id v49 = v83;

  if (v48 && !v49)
  {
    v50 = sub_10000B070("octagon-consistency");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Saved new account metadata", buf, 2u);
    }

    goto LABEL_54;
  }
  v70 = [(OctagonCheckTrustStateOperation *)self deps];
  v71 = [v70 lockStateTracker];
  unsigned int v72 = [v71 isLockedError:v49];

  v73 = sub_10000B070("SecError");
  BOOL v74 = os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT);
  if (v72)
  {
    if (v74)
    {
      *(_DWORD *)buf = 138412290;
      id v88 = v49;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "octagon-consistency: Unable to save new account state due to lock state: %@", buf, 0xCu);
    }

    v75 = &off_100305530;
  }
  else
  {
    if (v74)
    {
      *(_DWORD *)buf = 138412290;
      id v88 = v49;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "octagon-consistency: Unable to save new account state. Erroring: %@", buf, 0xCu);
    }

    [(CKKSResultOperation *)self setError:v49];
    v75 = &off_100305500;
  }
  [(OctagonCheckTrustStateOperation *)self setNextState:*v75];
  v80 = [(OctagonCheckTrustStateOperation *)self finishedOp];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v80];

LABEL_94:
}

- (void)groupStart
{
  id v3 = objc_alloc_init((Class)NSOperation);
  [(OctagonCheckTrustStateOperation *)self setFinishedOp:v3];

  v4 = [(OctagonCheckTrustStateOperation *)self finishedOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v4];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = [(OctagonCheckTrustStateOperation *)self deps];
  v6 = [v5 cuttlefishXPCWrapper];
  v7 = [(OctagonCheckTrustStateOperation *)self deps];
  v8 = [v7 activeAccount];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10016DAC8;
  v9[3] = &unk_100305510;
  objc_copyWeak(&v10, &location);
  [v6 fetchTrustStateWithSpecificUser:v8 reply:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (OctagonCheckTrustStateOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OctagonCheckTrustStateOperation;
  id v12 = [(CKKSGroupOperation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deps, a3);
    objc_storeStrong((id *)&v13->_intendedState, a4);
    objc_storeStrong((id *)&v13->_nextState, a5);
  }

  return v13;
}

@end