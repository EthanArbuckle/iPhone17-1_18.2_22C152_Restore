@interface OTTriggerEscrowUpdateOperation
- (NSOperation)finishedOp;
- (OTOperationDependencies)deps;
- (OTTriggerEscrowUpdateOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation OTTriggerEscrowUpdateOperation

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

- (void)groupStart
{
  v3 = sub_10000B070("octagon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Triggering escrow update", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)NSOperation);
  [(OTTriggerEscrowUpdateOperation *)self setFinishedOp:v4];

  v5 = [(OTTriggerEscrowUpdateOperation *)self finishedOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v5];

  v6 = [(OTTriggerEscrowUpdateOperation *)self deps];
  id v17 = 0;
  v7 = [objc_msgSend(objc_msgSend(v6, "escrowRequestClass"), "request:", &v17];
  id v8 = v17;

  if (!v7 || v8)
  {
    v12 = sub_10000B070("octagon-sos");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to acquire a EscrowRequest object: %@", buf, 0xCu);
    }

    v13 = [(OTTriggerEscrowUpdateOperation *)self finishedOp];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v13];

    [(CKKSResultOperation *)self setError:v8];
  }
  else
  {
    id v16 = 0;
    [v7 triggerEscrowUpdate:@"octagon-sos" error:&v16];
    id v8 = v16;
    v9 = +[CKKSAnalytics logger];
    [v9 logResultForEvent:@"OctagonEventUpgradeSilentEscrow" hardFailure:1 result:v8];

    v10 = sub_10000B070("octagon-sos");
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unable to request silent escrow update: %@", buf, 0xCu);
      }

      [(CKKSResultOperation *)self setError:v8];
    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requested silent escrow update", buf, 2u);
      }

      v14 = [(OTTriggerEscrowUpdateOperation *)self intendedState];
      [(OTTriggerEscrowUpdateOperation *)self setNextState:v14];
    }
    v15 = [(OTTriggerEscrowUpdateOperation *)self finishedOp];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v15];
  }
}

- (OTTriggerEscrowUpdateOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OTTriggerEscrowUpdateOperation;
  v12 = [(CKKSGroupOperation *)&v15 init];
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