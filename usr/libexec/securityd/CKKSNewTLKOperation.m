@interface CKKSNewTLKOperation
- (BOOL)rollTLKIfPresent;
- (CKKSNewTLKOperation)init;
- (CKKSNewTLKOperation)initWithDependencies:(id)a3 rollTLKIfPresent:(BOOL)a4 preexistingPendingKeySets:(id)a5 intendedState:(id)a6 errorState:(id)a7;
- (CKKSOperationDependencies)deps;
- (NSDictionary)keysets;
- (NSDictionary)previousPendingKeySets;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)cancel;
- (void)groupStart;
- (void)setKeysets:(id)a3;
- (void)setNextState:(id)a3;
- (void)setPreviousPendingKeySets:(id)a3;
- (void)setRollTLKIfPresent:(BOOL)a3;
@end

@implementation CKKSNewTLKOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_keysets + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);

  objc_storeStrong((id *)(&self->_rollTLKIfPresent + 6), 0);
}

- (void)setPreviousPendingKeySets:(id)a3
{
}

- (NSDictionary)previousPendingKeySets
{
  return (NSDictionary *)objc_getProperty(self, a2, 166, 1);
}

- (void)setRollTLKIfPresent:(BOOL)a3
{
  self->_rollTLKIfPresent = a3;
}

- (BOOL)rollTLKIfPresent
{
  return self->_rollTLKIfPresent;
}

- (void)setKeysets:(id)a3
{
}

- (NSDictionary)keysets
{
  return (NSDictionary *)objc_getProperty(self, a2, 158, 1);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 150, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 142, 1);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134, 1);
}

- (void)cancel
{
  v2.receiver = self;
  v2.super_class = (Class)CKKSNewTLKOperation;
  [(CKKSGroupOperation *)&v2 cancel];
}

- (void)groupStart
{
  v3 = [(CKKSNewTLKOperation *)self deps];
  v21 = [v3 databaseProvider];

  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  v4 = +[NSMutableDictionary dictionary];
  v5 = +[NSMutableSet set];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10016A9A0;
  v31[3] = &unk_100305720;
  v31[4] = self;
  id v22 = v4;
  id v32 = v22;
  id v6 = v5;
  id v33 = v6;
  [v21 dispatchSyncWithReadOnlySQLTransaction:v31];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v6;
  id v7 = 0;
  id v8 = [obj countByEnumeratingWithState:&v27 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        if (!v7)
        {
          v12 = [(CKKSNewTLKOperation *)self deps];
          id v7 = [v12 currentTrustStates];
        }
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10016AC9C;
        v23[3] = &unk_100305498;
        v23[4] = v11;
        v23[5] = self;
        v26 = &v34;
        id v7 = v7;
        id v24 = v7;
        id v25 = v22;
        [v21 dispatchSyncWithSQLTransaction:v23];
      }
      id v8 = [obj countByEnumeratingWithState:&v27 objects:v38 count:16];
    }
    while (v8);
  }

  if ([v22 count])
  {
    v13 = [(CKKSNewTLKOperation *)self deps];
    [v13 provideKeySets:v22];
  }
  v14 = [(CKKSResultOperation *)self error];
  BOOL v15 = v14 == 0;

  if (v15) {
    [(CKKSNewTLKOperation *)self setKeysets:v22];
  }
  if (*((unsigned char *)v35 + 24))
  {
    v16 = [[OctagonPendingFlag alloc] initWithFlag:@"key_set" conditions:1];
    v17 = [(CKKSNewTLKOperation *)self deps];
    v18 = [v17 flagHandler];
    [v18 handlePendingFlag:v16];
  }
  v19 = [(CKKSNewTLKOperation *)self intendedState];
  [(CKKSNewTLKOperation *)self setNextState:v19];

  _Block_object_dispose(&v34, 8);
}

- (CKKSNewTLKOperation)initWithDependencies:(id)a3 rollTLKIfPresent:(BOOL)a4 preexistingPendingKeySets:(id)a5 intendedState:(id)a6 errorState:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v37.receiver = self;
  v37.super_class = (Class)CKKSNewTLKOperation;
  v17 = [(CKKSGroupOperation *)&v37 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 150), a3);
    v18[128] = a4;
    if (v14)
    {
      id v29 = v16;
      id v30 = v15;
      id v31 = a7;
      id v32 = v13;
      v19 = +[NSMutableDictionary dictionary];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v20 = [v14 allKeys];
      id v21 = [v20 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v34;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v34 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            v26 = [v14 objectForKeyedSubscript:v25];
            if ([v26 proposed]) {
              [v19 setObject:v26 forKeyedSubscript:v25];
            }
          }
          id v22 = [v20 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v22);
      }

      long long v27 = *(void **)(v18 + 166);
      *(void *)(v18 + 166) = v19;
      a7 = v31;
      id v13 = v32;
      id v16 = v29;
      id v15 = v30;
    }
    else
    {
      long long v27 = *(void **)(v18 + 166);
      *(void *)(v18 + 166) = 0;
    }

    objc_storeStrong((id *)(v18 + 134), a6);
    objc_storeStrong((id *)(v18 + 142), a7);
  }

  return (CKKSNewTLKOperation *)v18;
}

- (CKKSNewTLKOperation)init
{
  return 0;
}

@end