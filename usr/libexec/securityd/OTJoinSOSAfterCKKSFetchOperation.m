@interface OTJoinSOSAfterCKKSFetchOperation
- (NSOperation)finishedOp;
- (OTJoinSOSAfterCKKSFetchOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OTOperationDependencies)operationDependencies;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)proceedAfterFetch;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setOperationDependencies:(id)a3;
@end

@implementation OTJoinSOSAfterCKKSFetchOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_operationDependencies, 0);
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

- (void)setOperationDependencies:(id)a3
{
}

- (OTOperationDependencies)operationDependencies
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

- (void)proceedAfterFetch
{
  v3 = [(OTJoinSOSAfterCKKSFetchOperation *)self operationDependencies];
  v4 = [v3 sosAdapter];
  id v25 = 0;
  unsigned int v5 = [v4 joinAfterRestore:&v25];
  id v6 = v25;

  if (!v6
    || [v6 code] != (id)1
    || ([v6 domain],
        v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 isEqualToString:kSOSErrorDomain],
        v7,
        !v8))
  {
    v10 = [(OTJoinSOSAfterCKKSFetchOperation *)self operationDependencies];
    v11 = [v10 sosAdapter];
    id v24 = 0;
    unsigned int v12 = [v11 circleStatus:&v24];
    id v9 = v24;

    if (v9 && [v9 code] == (id)1)
    {
      v13 = [v9 domain];
      if ([v13 isEqualToString:kSOSErrorDomain])
      {

        goto LABEL_22;
      }
    }
    if (v12 != -1)
    {
      if (v6 || ((v5 ^ 1) & 1) != 0 || v12 == 2 || v12 == 1)
      {
        v14 = [(OTJoinSOSAfterCKKSFetchOperation *)self operationDependencies];
        v15 = [v14 sosAdapter];
        id v23 = 0;
        unsigned int v16 = [v15 resetToOffering:&v23];
        id v17 = v23;

        v18 = sub_10000B070("octagon-sos");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          unsigned int v27 = v16;
          __int16 v28 = 2112;
          id v29 = v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "SOSCCResetToOffering complete: %d %@", buf, 0x12u);
        }

        char v19 = v17 ? 0 : v16;
        if ((v19 & 1) == 0)
        {
          [(CKKSResultOperation *)self setError:v17];
          v22 = [(OTJoinSOSAfterCKKSFetchOperation *)self finishedOp];
          [(CKKSGroupOperation *)self runBeforeGroupFinished:v22];

          goto LABEL_26;
        }
      }
      v20 = [(OTJoinSOSAfterCKKSFetchOperation *)self intendedState];
      [(OTJoinSOSAfterCKKSFetchOperation *)self setNextState:v20];

LABEL_25:
      id v17 = [(OTJoinSOSAfterCKKSFetchOperation *)self finishedOp];
      [(CKKSGroupOperation *)self runBeforeGroupFinished:v17];
LABEL_26:

      goto LABEL_27;
    }
LABEL_22:
    v21 = sub_10000B070("octagon-sos");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      unsigned int v27 = v12;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Error fetching circle status: %d, error:%@", buf, 0x12u);
    }

    [(CKKSResultOperation *)self setError:v9];
    goto LABEL_25;
  }
  [(CKKSResultOperation *)self setError:v6];
  id v9 = [(OTJoinSOSAfterCKKSFetchOperation *)self finishedOp];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v9];
LABEL_27:
}

- (void)groupStart
{
  v3 = [(OTJoinSOSAfterCKKSFetchOperation *)self operationDependencies];
  v4 = [v3 sosAdapter];
  unsigned __int8 v5 = [v4 sosEnabled];

  id v6 = sub_10000B070("octagon-sos");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "joining SOS", buf, 2u);
    }

    id v8 = objc_alloc_init((Class)NSOperation);
    [(OTJoinSOSAfterCKKSFetchOperation *)self setFinishedOp:v8];

    id v9 = [(OTJoinSOSAfterCKKSFetchOperation *)self finishedOp];
    [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v9];

    v10 = [OTWaitOnPriorityViews alloc];
    v11 = [(OTJoinSOSAfterCKKSFetchOperation *)self operationDependencies];
    unsigned int v12 = [(OTWaitOnPriorityViews *)v10 initWithDependencies:v11];

    id v13 = [(CKKSResultOperation *)v12 timeout:10000000000];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v12];
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100082B64;
    v15[3] = &unk_1003077A0;
    objc_copyWeak(&v16, (id *)buf);
    v14 = +[CKKSResultOperation named:@"join-sos-after-fetch" withBlock:v15];
    [v14 addDependency:v12];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SOS not enabled on this platform?", buf, 2u);
    }

    unsigned int v12 = [(OTJoinSOSAfterCKKSFetchOperation *)self intendedState];
    [(OTJoinSOSAfterCKKSFetchOperation *)self setNextState:v12];
  }
}

- (OTJoinSOSAfterCKKSFetchOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OTJoinSOSAfterCKKSFetchOperation;
  unsigned int v12 = [(CKKSGroupOperation *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_intendedState, a4);
    objc_storeStrong((id *)&v13->_nextState, a5);
    objc_storeStrong((id *)&v13->_operationDependencies, a3);
  }

  return v13;
}

@end