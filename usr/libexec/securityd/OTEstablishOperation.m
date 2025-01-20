@interface OTEstablishOperation
- (NSOperation)finishedOp;
- (NSString)peerID;
- (OTEstablishOperation)initWithDependencies:(id)a3 intendedState:(id)a4 ckksConflictState:(id)a5 errorState:(id)a6;
- (OTOperationDependencies)operationDependencies;
- (OctagonStateString)ckksConflictState;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)proceedWithKeys:(id)a3 pendingTLKShares:(id)a4;
- (void)setCkksConflictState:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setOperationDependencies:(id)a3;
- (void)setPeerID:(id)a3;
@end

@implementation OTEstablishOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_ckksConflictState, 0);
  objc_storeStrong((id *)&self->_operationDependencies, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_peerID, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
}

- (void)setFinishedOp:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCkksConflictState:(id)a3
{
}

- (OctagonStateString)ckksConflictState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setOperationDependencies:(id)a3
{
}

- (OTOperationDependencies)operationDependencies
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 152, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPeerID:(id)a3
{
}

- (NSString)peerID
{
  return self->_peerID;
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)proceedWithKeys:(id)a3 pendingTLKShares:(id)a4
{
  v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = [(OTEstablishOperation *)self operationDependencies];
  v9 = [v8 sosAdapter];
  unsigned int v10 = [v9 sosEnabled];

  if (v10)
  {
    v11 = [(OTEstablishOperation *)self operationDependencies];
    v12 = [v11 sosAdapter];
    id v32 = 0;
    v13 = +[OTSOSAdapterHelpers peerPublicSigningKeySPKIsForCircle:v12 error:&v32];
    v14 = v32;

    v15 = sub_10000B070("octagon-sos");
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138412290;
        v35 = v13;
        v17 = "SOS preapproved keys are %@";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
      }
    }
    else if (v16)
    {
      *(_DWORD *)buf = 138412290;
      v35 = v14;
      v17 = "Unable to fetch SOS preapproved keys: %@";
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  v14 = sub_10000B070("octagon-sos");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SOS not enabled; no preapproved keys", buf, 2u);
  }
  v13 = 0;
LABEL_12:

  v18 = [(OTEstablishOperation *)self operationDependencies];
  v19 = [v18 stateHolder];
  id v31 = 0;
  unsigned __int8 v20 = [v19 persistOctagonJoinAttempt:2 error:&v31];
  v21 = v31;

  if (v21) {
    unsigned __int8 v22 = 0;
  }
  else {
    unsigned __int8 v22 = v20;
  }
  if ((v22 & 1) == 0)
  {
    v23 = sub_10000B070("SecError");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v21;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "octagon: failed to save 'attempted join' state: %@", buf, 0xCu);
    }
  }
  v24 = sub_10000B070("octagon-ckks");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Beginning establish with keys: %@", buf, 0xCu);
  }

  v25 = [(OTEstablishOperation *)self operationDependencies];
  v26 = [v25 cuttlefishXPCWrapper];
  v27 = [(OTEstablishOperation *)self operationDependencies];
  v28 = [v27 activeAccount];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100091040;
  v29[3] = &unk_1002FAF10;
  objc_copyWeak(&v30, &location);
  [v26 establishWithSpecificUser:v28 ckksKeys:v6 tlkShares:v7 preapprovedKeys:v13 reply:v29];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (void)groupStart
{
  v3 = sub_10000B070("octagon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Beginning an establish operation", buf, 2u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000916EC;
  v14[3] = &unk_1003077A0;
  objc_copyWeak(&v15, (id *)buf);
  v4 = +[NSBlockOperation blockOperationWithBlock:v14];
  [(OTEstablishOperation *)self setFinishedOp:v4];

  v5 = [(OTEstablishOperation *)self finishedOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v5];

  v6 = [OTFetchCKKSKeysOperation alloc];
  id v7 = [(OTEstablishOperation *)self operationDependencies];
  v8 = [(OTFetchCKKSKeysOperation *)v6 initWithDependencies:v7 refetchNeeded:0];

  [(CKKSGroupOperation *)self runBeforeGroupFinished:v8];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000917D0;
  v11[3] = &unk_100306AD0;
  objc_copyWeak(&v13, (id *)buf);
  v9 = v8;
  v12 = v9;
  unsigned int v10 = +[CKKSResultOperation named:@"establish-with-keys" withBlock:v11];
  [v10 addDependency:v9];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (OTEstablishOperation)initWithDependencies:(id)a3 intendedState:(id)a4 ckksConflictState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)OTEstablishOperation;
  id v15 = [(CKKSGroupOperation *)&v18 init];
  BOOL v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_operationDependencies, a3);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    objc_storeStrong((id *)&v16->_nextState, a6);
    objc_storeStrong((id *)&v16->_ckksConflictState, a5);
  }

  return v16;
}

@end