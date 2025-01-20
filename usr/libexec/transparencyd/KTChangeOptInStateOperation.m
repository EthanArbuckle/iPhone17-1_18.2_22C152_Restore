@interface KTChangeOptInStateOperation
- (KTChangeOptInStateOperation)initWithDependenics:(id)a3 intendedState:(id)a4 errorState:(id)a5 optinStates:(id)a6;
- (KTOperationDependencies)deps;
- (KTOptInStateHolder)optInStates;
- (KTStateString)errorState;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSOperation)finishedOp;
- (void)evalCurrentOptInState:(BOOL)a3 optInStateError:(id)a4;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setErrorState:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setIntendedState:(id)a3;
- (void)setNextState:(id)a3;
- (void)setOptInStates:(id)a3;
@end

@implementation KTChangeOptInStateOperation

- (KTChangeOptInStateOperation)initWithDependenics:(id)a3 intendedState:(id)a4 errorState:(id)a5 optinStates:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)KTChangeOptInStateOperation;
  v14 = [(KTGroupOperation *)&v18 init];
  v15 = v14;
  if (v14)
  {
    [(KTChangeOptInStateOperation *)v14 setDeps:v10];
    [(KTChangeOptInStateOperation *)v15 setOptInStates:v13];
    [(KTChangeOptInStateOperation *)v15 setIntendedState:v11];
    [(KTChangeOptInStateOperation *)v15 setErrorState:v12];
    v16 = v15;
  }

  return v15;
}

- (void)groupStart
{
  if (qword_10032F358 != -1) {
    dispatch_once(&qword_10032F358, &stru_1002C9A38);
  }
  v3 = (void *)qword_10032F360;
  if (os_log_type_enabled((os_log_t)qword_10032F360, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    v5 = [(KTChangeOptInStateOperation *)self optInStates];
    v6 = [v5 targetOptInStates];
    unsigned int v7 = [v6 count];
    v8 = [(KTChangeOptInStateOperation *)self optInStates];
    v9 = [v8 currentTarget];
    *(_DWORD *)buf = 67109378;
    unsigned int v41 = v7;
    __int16 v42 = 2112;
    v43 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "KTChangeOptInStateOperation: start %d/%@", buf, 0x12u);
  }
  id v10 = [(KTChangeOptInStateOperation *)self optInStates];
  id v11 = [v10 targetOptInStates];
  id v12 = [v11 count];

  if (v12)
  {
    id v13 = [(KTChangeOptInStateOperation *)self optInStates];
    v14 = [v13 currentTarget];

    if (v14)
    {
      if (qword_10032F358 != -1) {
        dispatch_once(&qword_10032F358, &stru_1002C9A58);
      }
      v15 = qword_10032F360;
      if (os_log_type_enabled((os_log_t)qword_10032F360, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "KTChangeOptInStateOperation: already have a target pending", buf, 2u);
      }
    }
    v16 = [(KTChangeOptInStateOperation *)self optInStates];
    v17 = [v16 targetOptInStates];
    objc_super v18 = [v17 allKeys];
    v19 = [v18 firstObject];
    v20 = [(KTChangeOptInStateOperation *)self optInStates];
    [v20 setCurrentTarget:v19];

    id v21 = objc_alloc_init((Class)NSOperation);
    [(KTChangeOptInStateOperation *)self setFinishedOp:v21];

    v22 = [(KTChangeOptInStateOperation *)self finishedOp];
    [(KTGroupOperation *)self dependOnBeforeGroupFinished:v22];

    v23 = [(KTChangeOptInStateOperation *)self deps];
    v24 = [v23 cloudRecords];
    LODWORD(v18) = [v24 enforceCKOptInRecords];

    if (v18)
    {
      v25 = [(KTChangeOptInStateOperation *)self deps];
      v26 = [v25 cloudRecords];
      v27 = [(KTChangeOptInStateOperation *)self optInStates];
      v28 = [v27 currentTarget];
      id v39 = 0;
      v29 = [v26 getAggregateOptInStateForApplication:v28 error:&v39];
      id v30 = v39;

      if (v30)
      {
        if ([v30 code] == (id)9)
        {
          v31 = [v30 domain];
          unsigned int v32 = [v31 isEqual:@"com.apple.Transparency"];

          if (v32)
          {

            id v30 = 0;
          }
        }
        BOOL v33 = 0;
      }
      else
      {
        BOOL v33 = [v29 state] == (id)1;
      }
      [(KTChangeOptInStateOperation *)self evalCurrentOptInState:v33 optInStateError:v30];
    }
    else
    {
      v34 = [(KTChangeOptInStateOperation *)self optInStates];
      v35 = [v34 currentTarget];
      v36 = [(KTChangeOptInStateOperation *)self deps];
      v37 = [v36 kvs];
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_1002048A0;
      v38[3] = &unk_1002BB238;
      v38[4] = self;
      +[KTOptInManagerServer optInManagerOptInState:v35 sync:1 store:v37 complete:v38];
    }
  }
}

- (void)evalCurrentOptInState:(BOOL)a3 optInStateError:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  unsigned int v7 = [(KTChangeOptInStateOperation *)self optInStates];
  v8 = [v7 currentTarget];

  v9 = [(KTChangeOptInStateOperation *)self optInStates];
  id v10 = [v9 targetOptInStates];
  id v11 = [v10 objectForKeyedSubscript:v8];

  if (!v11)
  {
    if (qword_10032F358 != -1) {
      dispatch_once(&qword_10032F358, &stru_1002C9A78);
    }
    v17 = qword_10032F360;
    if (os_log_type_enabled((os_log_t)qword_10032F360, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v50 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Warning: no target application available: %@", buf, 0xCu);
    }
    objc_super v18 = [(KTChangeOptInStateOperation *)self optInStates];
    [v18 setCurrentTarget:0];

    v16 = [(KTChangeOptInStateOperation *)self errorState];
    [(KTChangeOptInStateOperation *)self setNextState:v16];
    goto LABEL_18;
  }
  if (qword_10032F358 != -1) {
    dispatch_once(&qword_10032F358, &stru_1002C9A98);
  }
  id v12 = (void *)qword_10032F360;
  if (os_log_type_enabled((os_log_t)qword_10032F360, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v50 = [v11 targetState];
    *(_WORD *)&v50[4] = 2112;
    *(void *)&v50[6] = v8;
    __int16 v51 = 1024;
    BOOL v52 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Changing state %d for application: %@ (current state: %d)", buf, 0x18u);
  }
  if (v6)
  {
    if (qword_10032F358 != -1) {
      dispatch_once(&qword_10032F358, &stru_1002C9AB8);
    }
    v14 = qword_10032F360;
    if (os_log_type_enabled((os_log_t)qword_10032F360, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v50 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Warning: changing state despite error in getOptInState: %@", buf, 0xCu);
    }
    v15 = [(KTChangeOptInStateOperation *)self errorState];
    [(KTChangeOptInStateOperation *)self setNextState:v15];

    [v11 setError:v6];
LABEL_12:
    v16 = [(KTChangeOptInStateOperation *)self optInStates];
    [v16 completedCurrentTarget];
LABEL_18:

LABEL_19:
    id v19 = [(KTGroupOperation *)self operationQueue];
    v20 = [(KTChangeOptInStateOperation *)self finishedOp];
    [v19 addOperation:v20];
    goto LABEL_20;
  }
  id v21 = [v11 targetState];
  if (v21 == (id)1)
  {
    if (!v4) {
      goto LABEL_24;
    }
LABEL_29:
    if (qword_10032F358 != -1) {
      dispatch_once(&qword_10032F358, &stru_1002C9AD8);
    }
    id v30 = (void *)qword_10032F360;
    if (os_log_type_enabled((os_log_t)qword_10032F360, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v30;
      unsigned int v32 = [(KTChangeOptInStateOperation *)self optInStates];
      BOOL v33 = [v32 currentTarget];
      *(_DWORD *)buf = 138543362;
      *(void *)v50 = v33;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "State target accomplished state, change for %{public}@", buf, 0xCu);
    }
    v34 = [(KTChangeOptInStateOperation *)self deps];
    v35 = [v34 stateMonitor];
    [v35 setOptInState:v4 everOptIn:1];

    v36 = [(KTChangeOptInStateOperation *)self intendedState];
    [(KTChangeOptInStateOperation *)self setNextState:v36];

    goto LABEL_12;
  }
  if (!v21 && !v4) {
    goto LABEL_29;
  }
LABEL_24:
  if (![v11 targetState])
  {
    [(KTChangeOptInStateOperation *)self setNextState:@"SetOptIO"];
    goto LABEL_19;
  }
  v22 = [(KTChangeOptInStateOperation *)self deps];
  v23 = [v22 accountOperations];
  id v48 = 0;
  v20 = [v23 primaryAccount:&v48];
  id v19 = v48;

  if (v20)
  {
    v24 = [(KTChangeOptInStateOperation *)self deps];
    v25 = [v24 accountOperations];
    unsigned __int8 v26 = [v25 eligibleForOptIn:v20];

    if (v26)
    {
      v27 = [(KTChangeOptInStateOperation *)self deps];
      v28 = [v27 idsOperations];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10020504C;
      v44[3] = &unk_1002C9B80;
      id v45 = v8;
      id v46 = v11;
      v47 = self;
      [v28 getKeyTransparencyOptInEligiblityForApplication:v45 withCompletion:v44];

      v29 = v45;
    }
    else
    {
      v29 = +[TransparencyError errorWithDomain:kTransparencyErrorAccount code:-160 description:@"Account is not eligble to opt-in"];
      [(KTResultOperation *)self setError:v29];
      [v11 setError:v29];
      v40 = [(KTChangeOptInStateOperation *)self errorState];
      [(KTChangeOptInStateOperation *)self setNextState:v40];

      unsigned int v41 = [(KTChangeOptInStateOperation *)self optInStates];
      [v41 completedCurrentTarget];

      __int16 v42 = [(KTGroupOperation *)self operationQueue];
      v43 = [(KTChangeOptInStateOperation *)self finishedOp];
      [v42 addOperation:v43];
    }
  }
  else
  {
    [(KTResultOperation *)self setError:v19];
    [v11 setError:v19];
    v37 = [(KTChangeOptInStateOperation *)self errorState];
    [(KTChangeOptInStateOperation *)self setNextState:v37];

    v38 = [(KTChangeOptInStateOperation *)self optInStates];
    [v38 completedCurrentTarget];

    v29 = [(KTGroupOperation *)self operationQueue];
    id v39 = [(KTChangeOptInStateOperation *)self finishedOp];
    [v29 addOperation:v39];
  }
LABEL_20:
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setNextState:(id)a3
{
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setIntendedState:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (KTStateString)errorState
{
  return (KTStateString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setErrorState:(id)a3
{
}

- (KTOptInStateHolder)optInStates
{
  return (KTOptInStateHolder *)objc_getProperty(self, a2, 160, 1);
}

- (void)setOptInStates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optInStates, 0);
  objc_storeStrong((id *)&self->_errorState, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);

  objc_storeStrong((id *)&self->_nextState, 0);
}

@end