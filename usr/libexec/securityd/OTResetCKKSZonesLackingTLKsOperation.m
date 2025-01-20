@interface OTResetCKKSZonesLackingTLKsOperation
- (NSOperation)finishedOp;
- (OTOperationDependencies)deps;
- (OTResetCKKSZonesLackingTLKsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)proceedWithKeys:(id)a3 incompleteKeySets:(id)a4;
- (void)resetViews:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation OTResetCKKSZonesLackingTLKsOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);

  objc_storeStrong((id *)&self->_nextState, 0);
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

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)resetViews:(id)a3
{
  id v4 = a3;
  v5 = sub_10000B070("octagon-ckks");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting CKKS view %@", buf, 0xCu);
  }

  v6 = [(OTResetCKKSZonesLackingTLKsOperation *)self deps];
  v7 = [v6 ckks];
  v8 = [v7 rpcResetCloudKit:v4 reply:&stru_1002F95D8];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000C7690;
  v17[3] = &unk_100308558;
  id v18 = v4;
  id v9 = v4;
  v10 = +[CKKSResultOperation named:@"wait-for-ckks-reset" withBlock:v17];
  id v11 = [v10 timeout:120000000000];
  [v10 addDependency:v8];
  v12 = [(CKKSGroupOperation *)self operationQueue];
  [v12 addOperation:v10];

  v13 = [(OTResetCKKSZonesLackingTLKsOperation *)self finishedOp];
  [v13 addDependency:v10];

  v14 = [(OTResetCKKSZonesLackingTLKsOperation *)self intendedState];
  [(OTResetCKKSZonesLackingTLKsOperation *)self setNextState:v14];

  v15 = [(CKKSGroupOperation *)self operationQueue];
  v16 = [(OTResetCKKSZonesLackingTLKsOperation *)self finishedOp];
  [v15 addOperation:v16];
}

- (void)proceedWithKeys:(id)a3 incompleteKeySets:(id)a4
{
  v21 = self;
  id v4 = a4;
  v22 = +[NSMutableSet set];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v11 = [v10 error:v21];

        if (v11)
        {
          v12 = sub_10000B070("octagon-ckks");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v10;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error loading key set %@; not attempting reset",
              buf,
              0xCu);
          }
LABEL_14:

          continue;
        }
        uint64_t v13 = [v10 currentTLKPointer];
        if (v13)
        {
          v14 = (void *)v13;
          v15 = [v10 tlk];

          if (!v15)
          {
            v16 = sub_10000B070("octagon-ckks");
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v28 = v10;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Key set %@ has no TLK; scheduling for reset",
                buf,
                0xCu);
            }

            v12 = [v10 zoneID];
            v17 = [v12 zoneName];
            [v22 addObject:v17];

            goto LABEL_14;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v7);
  }

  if ([v22 count])
  {
    [(OTResetCKKSZonesLackingTLKsOperation *)v21 resetViews:v22];
  }
  else
  {
    id v18 = sub_10000B070("octagon-ckks");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No CKKS views need resetting", buf, 2u);
    }

    v19 = [(OTResetCKKSZonesLackingTLKsOperation *)v21 intendedState];
    [(OTResetCKKSZonesLackingTLKsOperation *)v21 setNextState:v19];

    id v20 = [(OTResetCKKSZonesLackingTLKsOperation *)v21 finishedOp];
    [(CKKSGroupOperation *)v21 runBeforeGroupFinished:v20];
  }
}

- (void)groupStart
{
  v3 = sub_10000B070("octagon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking if any CKKS zones need resetting", buf, 2u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000C7D20;
  v14[3] = &unk_1003077A0;
  objc_copyWeak(&v15, (id *)buf);
  id v4 = +[NSBlockOperation blockOperationWithBlock:v14];
  [(OTResetCKKSZonesLackingTLKsOperation *)self setFinishedOp:v4];

  id v5 = [(OTResetCKKSZonesLackingTLKsOperation *)self finishedOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v5];

  id v6 = [OTFetchCKKSKeysOperation alloc];
  id v7 = [(OTResetCKKSZonesLackingTLKsOperation *)self deps];
  uint64_t v8 = [(OTFetchCKKSKeysOperation *)v6 initWithDependencies:v7 refetchNeeded:0];

  [(CKKSGroupOperation *)self runBeforeGroupFinished:v8];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C7E04;
  v11[3] = &unk_100306AD0;
  objc_copyWeak(&v13, (id *)buf);
  id v9 = v8;
  v12 = v9;
  v10 = +[CKKSResultOperation named:@"continue-ckks-resets" withBlock:v11];
  [v10 addDependency:v9];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (OTResetCKKSZonesLackingTLKsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OTResetCKKSZonesLackingTLKsOperation;
  v12 = [(CKKSGroupOperation *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deps, a3);
    objc_storeStrong((id *)&v13->_intendedState, a4);
    objc_storeStrong((id *)&v13->_nextState, a5);
  }

  return v13;
}

@end