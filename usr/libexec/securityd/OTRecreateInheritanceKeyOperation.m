@interface OTRecreateInheritanceKeyOperation
- (NSOperation)finishOp;
- (NSUUID)uuid;
- (OTInheritanceKey)ik;
- (OTInheritanceKey)oldIK;
- (OTOperationDependencies)deps;
- (OTRecreateInheritanceKeyOperation)initWithUUID:(id)a3 oldIK:(id)a4 dependencies:(id)a5;
- (void)groupStart;
- (void)proceedWithKeys:(id)a3 salt:(id)a4;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setIk:(id)a3;
- (void)setOldIK:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation OTRecreateInheritanceKeyOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishOp, 0);
  objc_storeStrong((id *)&self->_oldIK, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_deps, 0);

  objc_storeStrong((id *)&self->_ik, 0);
}

- (void)setFinishOp:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 160, 1);
}

- (void)setOldIK:(id)a3
{
}

- (OTInheritanceKey)oldIK
{
  return (OTInheritanceKey *)objc_getProperty(self, a2, 152, 1);
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

- (void)setIk:(id)a3
{
}

- (OTInheritanceKey)ik
{
  return (OTInheritanceKey *)objc_getProperty(self, a2, 128, 1);
}

- (void)proceedWithKeys:(id)a3 salt:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v7 = objc_alloc((Class)OTInheritanceKey);
  v8 = [(OTRecreateInheritanceKeyOperation *)self uuid];
  v9 = [(OTRecreateInheritanceKeyOperation *)self oldIK];
  id v26 = 0;
  id v10 = [v7 initWithUUID:v8 oldIK:v9 error:&v26];
  id v11 = v26;
  [(OTRecreateInheritanceKeyOperation *)self setIk:v10];

  v12 = [(OTRecreateInheritanceKeyOperation *)self ik];
  BOOL v13 = v12 == 0;

  if (v13)
  {
    v22 = sub_10000B070("SecError");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "octagon: failed to recreate inheritance key: %@", buf, 0xCu);
    }

    [(CKKSResultOperation *)self setError:v11];
    v16 = [(OTRecreateInheritanceKeyOperation *)self finishOp];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v16];
  }
  else
  {
    v14 = [(OTRecreateInheritanceKeyOperation *)self ik];
    v15 = [v14 recoveryKeyData];
    v16 = [v15 base64EncodedStringWithOptions:0];

    v17 = [(OTRecreateInheritanceKeyOperation *)self deps];
    v18 = [v17 cuttlefishXPCWrapper];
    v19 = [(OTRecreateInheritanceKeyOperation *)self deps];
    v20 = [v19 activeAccount];
    v21 = [(OTRecreateInheritanceKeyOperation *)self uuid];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000AB9D8;
    v24[3] = &unk_1002F8E10;
    objc_copyWeak(&v25, &location);
    [v18 createCustodianRecoveryKeyWithSpecificUser:v20 recoveryKey:v16 salt:v6 ckksKeys:v23 uuid:v21 kind:2 reply:v24];

    objc_destroyWeak(&v25);
  }

  objc_destroyWeak(&location);
}

- (void)groupStart
{
  id v3 = objc_alloc_init((Class)NSOperation);
  [(OTRecreateInheritanceKeyOperation *)self setFinishOp:v3];

  v4 = [(OTRecreateInheritanceKeyOperation *)self finishOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v4];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [OTFetchCKKSKeysOperation alloc];
  id v6 = [(OTRecreateInheritanceKeyOperation *)self deps];
  id v7 = [(OTFetchCKKSKeysOperation *)v5 initWithDependencies:v6 refetchNeeded:0];

  [(CKKSGroupOperation *)self runBeforeGroupFinished:v7];
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_1000ABDCC;
  BOOL v13 = &unk_1003077C8;
  objc_copyWeak(&v16, &location);
  v8 = v7;
  v14 = v8;
  v15 = &stru_10030AA90;
  v9 = +[CKKSResultOperation named:@"setting-recovery-tlks" withBlock:&v10];
  [v9 addDependency:v8, v10, v11, v12, v13];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v9];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (OTRecreateInheritanceKeyOperation)initWithUUID:(id)a3 oldIK:(id)a4 dependencies:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)OTRecreateInheritanceKeyOperation;
  uint64_t v11 = [(CKKSGroupOperation *)&v14 init];
  if (v11)
  {
    id v12 = v8;
    if (!v8) {
      id v12 = objc_alloc_init((Class)NSUUID);
    }
    objc_storeStrong((id *)&v11->_uuid, v12);
    if (!v8) {

    }
    objc_storeStrong((id *)&v11->_oldIK, a4);
    objc_storeStrong((id *)&v11->_deps, a5);
  }

  return v11;
}

@end