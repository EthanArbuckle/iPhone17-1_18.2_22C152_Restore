@interface OTCreateCustodianRecoveryKeyOperation
- (NSOperation)finishOp;
- (NSUUID)uuid;
- (OTCreateCustodianRecoveryKeyOperation)initWithUUID:(id)a3 dependencies:(id)a4;
- (OTCustodianRecoveryKey)crk;
- (OTOperationDependencies)deps;
- (void)groupStart;
- (void)proceedWithKeys:(id)a3 salt:(id)a4;
- (void)setCrk:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation OTCreateCustodianRecoveryKeyOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishOp, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_deps, 0);

  objc_storeStrong((id *)&self->_crk, 0);
}

- (void)setFinishOp:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCrk:(id)a3
{
}

- (OTCustodianRecoveryKey)crk
{
  return (OTCustodianRecoveryKey *)objc_getProperty(self, a2, 128, 1);
}

- (void)proceedWithKeys:(id)a3 salt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v19 = 0;
  v8 = (void *)SecPasswordGenerate();
  if (v8)
  {
    v9 = [(OTCreateCustodianRecoveryKeyOperation *)self deps];
    v10 = [v9 cuttlefishXPCWrapper];
    v11 = [(OTCreateCustodianRecoveryKeyOperation *)self deps];
    v12 = [v11 activeAccount];
    v13 = [(OTCreateCustodianRecoveryKeyOperation *)self uuid];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000A9C98;
    v16[3] = &unk_1002F8DE8;
    objc_copyWeak(&v18, &location);
    id v17 = v8;
    [v10 createCustodianRecoveryKeyWithSpecificUser:v12 recoveryKey:v17 salt:v7 ckksKeys:v6 uuid:v13 kind:1 reply:v16];

    objc_destroyWeak(&v18);
  }
  else
  {
    v14 = sub_10000B070("SecError");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "octagon: failed to create string: %@", buf, 0xCu);
    }

    [(CKKSResultOperation *)self setError:v19];
    v15 = [(OTCreateCustodianRecoveryKeyOperation *)self finishOp];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v15];
  }
  objc_destroyWeak(&location);
}

- (void)groupStart
{
  id v3 = objc_alloc_init((Class)NSOperation);
  [(OTCreateCustodianRecoveryKeyOperation *)self setFinishOp:v3];

  v4 = [(OTCreateCustodianRecoveryKeyOperation *)self finishOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v4];

  v5 = [(OTCreateCustodianRecoveryKeyOperation *)self deps];
  id v6 = [v5 activeAccount];
  id v7 = [v6 altDSID];

  if (v7)
  {
    id v8 = v7;
    *(void *)id location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    v9 = [OTFetchCKKSKeysOperation alloc];
    v10 = [(OTCreateCustodianRecoveryKeyOperation *)self deps];
    v11 = [(OTFetchCKKSKeysOperation *)v9 initWithDependencies:v10 refetchNeeded:0];

    [(CKKSGroupOperation *)self runBeforeGroupFinished:v11];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000AA418;
    v19[3] = &unk_1003077C8;
    objc_copyWeak(&v22, (id *)location);
    v12 = v11;
    v20 = v12;
    id v13 = v8;
    id v21 = v13;
    v14 = +[CKKSResultOperation named:@"setting-recovery-tlks" withBlock:v19];
    [v14 addDependency:v12];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v14];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v15 = sub_10000B070("authkit");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(OTCreateCustodianRecoveryKeyOperation *)self deps];
      id v17 = [v16 activeAccount];
      *(_DWORD *)id location = 138412290;
      *(void *)&location[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", location, 0xCu);
    }
    id v18 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:59 description:@"No altDSID configured"];
    [(CKKSResultOperation *)self setError:v18];

    id v13 = [(OTCreateCustodianRecoveryKeyOperation *)self finishOp];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v13];
  }
}

- (OTCreateCustodianRecoveryKeyOperation)initWithUUID:(id)a3 dependencies:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)OTCreateCustodianRecoveryKeyOperation;
  id v8 = [(CKKSGroupOperation *)&v11 init];
  if (v8)
  {
    id v9 = v6;
    if (!v6) {
      id v9 = objc_alloc_init((Class)NSUUID);
    }
    objc_storeStrong((id *)&v8->_uuid, v9);
    if (!v6) {

    }
    objc_storeStrong((id *)&v8->_deps, a4);
  }

  return v8;
}

@end