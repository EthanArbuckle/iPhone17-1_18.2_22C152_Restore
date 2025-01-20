@interface OTFetchViewsOperation
- (BOOL)isInheritedAccount;
- (OTFetchViewsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OTOperationDependencies)deps;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setIsInheritedAccount:(BOOL)a3;
- (void)setNextState:(id)a3;
@end

@implementation OTFetchViewsOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);

  objc_storeStrong((id *)(&self->_isInheritedAccount + 6), 0);
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 150, 1);
}

- (void)setIsInheritedAccount:(BOOL)a3
{
  self->_isInheritedAccount = a3;
}

- (BOOL)isInheritedAccount
{
  return self->_isInheritedAccount;
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

- (void)groupStart
{
  v3 = sub_10000B070("octagon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "fetching views", buf, 2u);
  }

  v4 = [(OTFetchViewsOperation *)self deps];
  v5 = [v4 stateHolder];
  id v16 = 0;
  v6 = [v5 loadOrCreateAccountMetadata:&v16];
  id v7 = v16;

  if (!v6 || v7)
  {
    v8 = sub_10000B070("octagon-ckks");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to load account metadata: %@", buf, 0xCu);
    }
  }
  else
  {
    -[OTFetchViewsOperation setIsInheritedAccount:](self, "setIsInheritedAccount:", [v6 isInheritedAccount]);
  }
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v9 = [(OTFetchViewsOperation *)self deps];
  v10 = [v9 cuttlefishXPCWrapper];
  v11 = [(OTFetchViewsOperation *)self deps];
  v12 = [v11 activeAccount];
  BOOL v13 = [(OTFetchViewsOperation *)self isInheritedAccount];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100113168;
  v14[3] = &unk_1002FA7B8;
  objc_copyWeak(&v15, (id *)buf);
  [v10 fetchCurrentPolicyWithSpecificUser:v12 modelIDOverride:0 isInheritedAccount:v13 reply:v14];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (OTFetchViewsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OTFetchViewsOperation;
  v12 = [(CKKSGroupOperation *)&v15 init];
  BOOL v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 150), a3);
    objc_storeStrong((id *)(v13 + 134), a4);
    objc_storeStrong((id *)(v13 + 142), a5);
  }

  return (OTFetchViewsOperation *)v13;
}

@end