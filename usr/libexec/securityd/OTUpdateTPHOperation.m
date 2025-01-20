@interface OTUpdateTPHOperation
- (BOOL)forceRefetch;
- (NSOperation)finishedOp;
- (OTOperationDependencies)deps;
- (OTUpdateTPHOperation)initWithDependencies:(id)a3 intendedState:(id)a4 peerUnknownState:(id)a5 determineCDPState:(id)a6 errorState:(id)a7 forceRefetch:(BOOL)a8 retryFlag:(id)a9;
- (OctagonFlagString)retryFlag;
- (OctagonStateString)determineCDPState;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (OctagonStateString)peerUnknownState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setDetermineCDPState:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setForceRefetch:(BOOL)a3;
- (void)setNextState:(id)a3;
- (void)setPeerUnknownState:(id)a3;
- (void)setRetryFlag:(id)a3;
@end

@implementation OTUpdateTPHOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_finishedOp + 6), 0);
  objc_storeStrong((id *)((char *)&self->_determineCDPState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_peerUnknownState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);

  objc_storeStrong((id *)(&self->_forceRefetch + 6), 0);
}

- (void)setRetryFlag:(id)a3
{
}

- (OctagonFlagString)retryFlag
{
  return (OctagonFlagString *)objc_getProperty(self, a2, 182, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 174, 1);
}

- (void)setDetermineCDPState:(id)a3
{
}

- (OctagonStateString)determineCDPState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 166, 1);
}

- (void)setPeerUnknownState:(id)a3
{
}

- (OctagonStateString)peerUnknownState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 158, 1);
}

- (void)setForceRefetch:(BOOL)a3
{
  self->_forceRefetch = a3;
}

- (BOOL)forceRefetch
{
  return self->_forceRefetch;
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 150, 1);
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
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000CA4F8;
  v32[3] = &unk_1003077A0;
  objc_copyWeak(&v33, &location);
  v3 = +[NSBlockOperation blockOperationWithBlock:v32];
  [(OTUpdateTPHOperation *)self setFinishedOp:v3];

  v4 = [(OTUpdateTPHOperation *)self finishedOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v4];

  v5 = [(OTUpdateTPHOperation *)self deps];
  v6 = [v5 stateHolder];
  id v31 = 0;
  v27 = [v6 loadOrCreateAccountMetadata:&v31];
  id v26 = v31;

  if (!v27 || v26)
  {
    v8 = sub_10000B070("SecError");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v26;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "octagon: Unable to load current metadata: %@", buf, 0xCu);
    }
    v23 = 0;
  }
  else
  {
    v7 = [TrustedPeersHelperIntendedTPPBSecureElementIdentity alloc];
    v8 = [v27 parsedSecureElementIdentity];
    v23 = [(TrustedPeersHelperIntendedTPPBSecureElementIdentity *)v7 initWithSecureElementIdentity:v8];
  }

  if ([v27 hasAttemptedJoin]) {
    BOOL v20 = [v27 attemptedJoin] == 2;
  }
  else {
    BOOL v20 = 0;
  }
  if ([(OTUpdateTPHOperation *)self forceRefetch])
  {
    v9 = sub_10000B070("octagon");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Forcing a full refetch", buf, 2u);
    }
  }
  v10 = [(OTUpdateTPHOperation *)self deps];
  v22 = [v10 cuttlefishXPCWrapper];
  v25 = [(OTUpdateTPHOperation *)self deps];
  v21 = [v25 activeAccount];
  unsigned int v19 = [(OTUpdateTPHOperation *)self forceRefetch];
  v24 = [(OTUpdateTPHOperation *)self deps];
  v11 = [v24 deviceInformationAdapter];
  v12 = [v11 deviceName];
  v13 = [(OTUpdateTPHOperation *)self deps];
  v14 = [v13 deviceInformationAdapter];
  v15 = [v14 serialNumber];
  v16 = [(OTUpdateTPHOperation *)self deps];
  v17 = [v16 deviceInformationAdapter];
  v18 = [v17 osVersion];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000CA810;
  v28[3] = &unk_1002F9628;
  objc_copyWeak(&v29, &location);
  BOOL v30 = v20;
  [v22 updateWithSpecificUser:v21 forceRefetch:v19 deviceName:v12 serialNumber:v15 osVersion:v18 policyVersion:0 policySecrets:0 syncUserControllableViews:0 secureElementIdentity:v23 walrusSetting:0 webAccess:0 reply:v28];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

- (OTUpdateTPHOperation)initWithDependencies:(id)a3 intendedState:(id)a4 peerUnknownState:(id)a5 determineCDPState:(id)a6 errorState:(id)a7 forceRefetch:(BOOL)a8 retryFlag:(id)a9
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)OTUpdateTPHOperation;
  v18 = [(CKKSGroupOperation *)&v25 init];
  unsigned int v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)(v18 + 150), a3);
    objc_storeStrong((id *)(v19 + 142), a4);
    objc_storeStrong((id *)(v19 + 134), a7);
    objc_storeStrong((id *)(v19 + 158), a5);
    objc_storeStrong((id *)(v19 + 166), a6);
    v19[128] = a8;
    objc_storeStrong((id *)(v19 + 182), a9);
  }

  return (OTUpdateTPHOperation *)v19;
}

@end