@interface KTFixupOperation
- (KTFixupOperation)initWithDependenics:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (KTOperationDependencies)deps;
- (KTStateString)errorState;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSOperation)finishedOp;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setErrorState:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setIntendedState:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation KTFixupOperation

- (KTFixupOperation)initWithDependenics:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)KTFixupOperation;
  v11 = [(KTGroupOperation *)&v15 init];
  v12 = v11;
  if (v11)
  {
    [(KTFixupOperation *)v11 setDeps:v8];
    [(KTFixupOperation *)v12 setErrorState:v10];
    [(KTFixupOperation *)v12 setIntendedState:v9];
    v13 = v12;
  }

  return v12;
}

- (void)groupStart
{
  v3 = [(KTFixupOperation *)self intendedState];
  [(KTFixupOperation *)self setNextState:v3];

  id v4 = objc_alloc_init((Class)NSOperation);
  [(KTFixupOperation *)self setFinishedOp:v4];

  v5 = [(KTFixupOperation *)self finishedOp];
  [(KTGroupOperation *)self dependOnBeforeGroupFinished:v5];

  v39[0] = objc_opt_class();
  v39[1] = objc_opt_class();
  +[NSArray arrayWithObjects:v39 count:2];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = (char *)[obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v34;
    while (2)
    {
      id v9 = 0;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = [(id)objc_opt_class() fixupName];
        v11 = [(KTFixupOperation *)self deps];
        v12 = [v11 smDataStore];
        unsigned int v13 = [v12 haveDoneFixup:v10];

        if (v13)
        {
          if (qword_100326660 != -1) {
            dispatch_once(&qword_100326660, &stru_1002B7148);
          }
          v14 = qword_100326668;
          if (os_log_type_enabled((os_log_t)qword_100326668, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v10;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Already performed fixup %@", buf, 0xCu);
          }
        }
        else
        {
          id v15 = objc_alloc((Class)objc_opt_class());
          v16 = [(KTFixupOperation *)self deps];
          id v17 = [v15 initWithDependencies:v16];

          if (!v17)
          {
            if (qword_100326660 != -1) {
              dispatch_once(&qword_100326660, &stru_1002B7168);
            }
            v26 = qword_100326668;
            if (os_log_type_enabled((os_log_t)qword_100326668, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v10;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to create fixup operation %@", buf, 0xCu);
            }
            v27 = obj;
            goto LABEL_33;
          }
          v18 = [v17 doFixupOperation];
          v19 = v18;
          if (v18)
          {
            if (v6) {
              [v18 addDependency:v6];
            }
            *(void *)buf = 0;
            objc_initWeak((id *)buf, self);
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472;
            v29[2] = sub_10000B7C8;
            v29[3] = &unk_1002B71D0;
            objc_copyWeak(&v32, (id *)buf);
            id v30 = v10;
            id v20 = v19;
            id v31 = v20;
            id v21 = +[NSBlockOperation blockOperationWithBlock:v29];

            [v21 addDependency:v20];
            v22 = [(KTGroupOperation *)self operationQueue];
            [v22 addOperation:v20];

            v23 = [(KTGroupOperation *)self operationQueue];
            [v23 addOperation:v21];

            objc_destroyWeak(&v32);
            objc_destroyWeak((id *)buf);

            v6 = v21;
          }
          else
          {
            if (qword_100326660 != -1) {
              dispatch_once(&qword_100326660, &stru_1002B7188);
            }
            v24 = qword_100326668;
            if (os_log_type_enabled((os_log_t)qword_100326668, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v10;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Fixup %@ can't run right now, skipping for now", buf, 0xCu);
            }
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = (char *)[obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v7) {
        continue;
      }
      break;
    }

    if (v6)
    {
      v25 = [(KTFixupOperation *)self finishedOp];
      [v25 addDependency:v6];
      goto LABEL_31;
    }
  }
  else
  {
    v25 = obj;
LABEL_31:
  }
  v27 = [(KTGroupOperation *)self operationQueue];
  id v10 = [(KTFixupOperation *)self finishedOp];
  [v27 addOperation:v10];
LABEL_33:
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

- (KTStateString)errorState
{
  return (KTStateString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setErrorState:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_errorState, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);

  objc_storeStrong((id *)&self->_nextState, 0);
}

@end