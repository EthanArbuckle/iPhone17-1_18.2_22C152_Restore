@interface OTStashAccountSettingsOperation
+ (void)performWithAccountWide:(BOOL)a3 forceFetch:(BOOL)a4 cuttlefishXPCWrapper:(id)a5 activeAccount:(id)a6 containerName:(id)a7 contextID:(id)a8 reply:(id)a9;
- (BOOL)accountWide;
- (BOOL)forceFetch;
- (NSOperation)finishedOp;
- (OTAccountSettingsContainer)accountSettings;
- (OTOperationDependencies)deps;
- (OTStashAccountSettingsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 accountSettings:(id)a6 accountWide:(BOOL)a7 forceFetch:(BOOL)a8;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setAccountSettings:(id)a3;
- (void)setAccountWide:(BOOL)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setForceFetch:(BOOL)a3;
- (void)setNextState:(id)a3;
@end

@implementation OTStashAccountSettingsOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_finishedOp + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);

  objc_storeStrong((id *)(&self->_forceFetch + 5), 0);
}

- (void)setForceFetch:(BOOL)a3
{
  self->_forceFetch = a3;
}

- (BOOL)forceFetch
{
  return self->_forceFetch;
}

- (void)setAccountWide:(BOOL)a3
{
  self->_accountWide = a3;
}

- (BOOL)accountWide
{
  return self->_accountWide;
}

- (void)setAccountSettings:(id)a3
{
}

- (OTAccountSettingsContainer)accountSettings
{
  return (OTAccountSettingsContainer *)objc_getProperty(self, a2, 166, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 158, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 150, 1);
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
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "stashing account settings", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)NSOperation);
  [(OTStashAccountSettingsOperation *)self setFinishedOp:v4];

  v5 = [(OTStashAccountSettingsOperation *)self finishedOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v5];

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  unsigned int v15 = [(OTStashAccountSettingsOperation *)self accountWide];
  unsigned int v14 = [(OTStashAccountSettingsOperation *)self forceFetch];
  v6 = [(OTStashAccountSettingsOperation *)self deps];
  v7 = [v6 cuttlefishXPCWrapper];
  v8 = [(OTStashAccountSettingsOperation *)self deps];
  v9 = [v8 activeAccount];
  v10 = [(OTStashAccountSettingsOperation *)self deps];
  v11 = [v10 containerName];
  v12 = [(OTStashAccountSettingsOperation *)self deps];
  v13 = [v12 contextID];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10009E0AC;
  v16[3] = &unk_1002F8C48;
  objc_copyWeak(&v17, (id *)buf);
  +[OTStashAccountSettingsOperation performWithAccountWide:v15 forceFetch:v14 cuttlefishXPCWrapper:v7 activeAccount:v9 containerName:v11 contextID:v13 reply:v16];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (OTStashAccountSettingsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 accountSettings:(id)a6 accountWide:(BOOL)a7 forceFetch:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)OTStashAccountSettingsOperation;
  v18 = [(CKKSGroupOperation *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)(v18 + 150), a3);
    objc_storeStrong((id *)(v19 + 134), a4);
    objc_storeStrong((id *)(v19 + 142), a5);
    objc_storeStrong((id *)(v19 + 166), a6);
    v19[128] = a7;
    v19[129] = a8;
  }

  return (OTStashAccountSettingsOperation *)v19;
}

+ (void)performWithAccountWide:(BOOL)a3 forceFetch:(BOOL)a4 cuttlefishXPCWrapper:(id)a5 activeAccount:(id)a6 containerName:(id)a7 contextID:(id)a8 reply:(id)a9
{
  BOOL v12 = a4;
  BOOL v13 = a3;
  id v14 = a7;
  id v15 = a8;
  id v16 = a9;
  if (v13)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10009E4EC;
    v24[3] = &unk_1002F8BD8;
    id v17 = &v25;
    id v25 = v14;
    v18 = &v26;
    id v26 = v15;
    v19 = &v27;
    id v27 = v16;
    [a5 fetchAccountSettingsWithSpecificUser:a6 forceFetch:v12 reply:v24];
  }
  else
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10009E7A0;
    v20[3] = &unk_1002F8C00;
    id v17 = &v21;
    id v21 = v14;
    v18 = &v22;
    id v22 = v15;
    v19 = &v23;
    id v23 = v16;
    [a5 fetchTrustStateWithSpecificUser:a6 reply:v20];
  }
}

@end