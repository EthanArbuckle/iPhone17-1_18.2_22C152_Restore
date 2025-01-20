@interface KTPublicKeyStoreRefresh
- (BOOL)isInitialFetch;
- (KTOperationDependencies)deps;
- (KTPublicKeyStoreRefresh)initWithDependencies:(id)a3 initialFetch:(BOOL)a4 intendedState:(id)a5 errorState:(id)a6;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSOperation)finishedOp;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setIsInitialFetch:(BOOL)a3;
- (void)setNextState:(id)a3;
@end

@implementation KTPublicKeyStoreRefresh

- (KTPublicKeyStoreRefresh)initWithDependencies:(id)a3 initialFetch:(BOOL)a4 intendedState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)KTPublicKeyStoreRefresh;
  v14 = [(KTGroupOperation *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 142), a3);
    v15[120] = a4;
    objc_storeStrong((id *)(v15 + 126), a6);
    objc_storeStrong((id *)(v15 + 134), a5);
    v16 = v15;
  }

  return (KTPublicKeyStoreRefresh *)v15;
}

- (void)groupStart
{
  if ([(KTPublicKeyStoreRefresh *)self isInitialFetch]
    && ([(KTPublicKeyStoreRefresh *)self deps],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 publicKeyStore],
        v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 initiallyFetched],
        v4,
        v3,
        v5))
  {
    id v21 = [(KTPublicKeyStoreRefresh *)self intendedState];
    [(KTPublicKeyStoreRefresh *)self setNextState:v21];
  }
  else
  {
    if (qword_10032EE28 != -1) {
      dispatch_once(&qword_10032EE28, &stru_1002C3890);
    }
    v6 = (void *)qword_10032EE30;
    if (os_log_type_enabled((os_log_t)qword_10032EE30, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      v8 = [(KTPublicKeyStoreRefresh *)self deps];
      v9 = [v8 publicKeyStore];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Fetching public key store because disk key store (%@) not ready", buf, 0xCu);
    }
    id v10 = objc_alloc_init((Class)NSOperation);
    [(KTPublicKeyStoreRefresh *)self setFinishedOp:v10];

    id v11 = [(KTPublicKeyStoreRefresh *)self finishedOp];
    [v11 setName:@"KTPublicKeyStoreFetch"];

    id v12 = [(KTPublicKeyStoreRefresh *)self finishedOp];
    [(KTGroupOperation *)self dependOnBeforeGroupFinished:v12];

    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    id v13 = [(KTPublicKeyStoreRefresh *)self deps];
    v14 = [v13 publicKeyStore];
    v15 = [(KTPublicKeyStoreRefresh *)self deps];
    v16 = [v15 logClient];
    v17 = [(KTPublicKeyStoreRefresh *)self deps];
    objc_super v18 = [v17 dataStore];
    v19 = [(KTPublicKeyStoreRefresh *)self deps];
    v20 = [v19 contextStore];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10017CCD4;
    v22[3] = &unk_1002C3160;
    objc_copyWeak(&v23, (id *)buf);
    [v14 updatePublicKeyStores:v16 diskStore:v18 contextStore:v20 complete:v22];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 126, 1);
}

- (void)setNextState:(id)a3
{
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 134, 1);
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 142, 1);
}

- (void)setDeps:(id)a3
{
}

- (BOOL)isInitialFetch
{
  return self->_isInitialFetch;
}

- (void)setIsInitialFetch:(BOOL)a3
{
  self->_isInitialFetch = a3;
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 150, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);

  objc_storeStrong((id *)(&self->_isInitialFetch + 6), 0);
}

@end