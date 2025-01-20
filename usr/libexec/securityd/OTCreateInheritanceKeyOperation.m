@interface OTCreateInheritanceKeyOperation
- (NSOperation)finishOp;
- (NSUUID)uuid;
- (OTCreateInheritanceKeyOperation)initWithUUID:(id)a3 dependencies:(id)a4;
- (OTInheritanceKey)ik;
- (OTOperationDependencies)deps;
- (void)groupStart;
- (void)proceedWithKeys:(id)a3 salt:(id)a4;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setIk:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation OTCreateInheritanceKeyOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishOp, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_deps, 0);

  objc_storeStrong((id *)&self->_ik, 0);
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

- (void)setIk:(id)a3
{
}

- (OTInheritanceKey)ik
{
  return (OTInheritanceKey *)objc_getProperty(self, a2, 128, 1);
}

- (void)proceedWithKeys:(id)a3 salt:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v7 = objc_alloc((Class)OTInheritanceKey);
  v8 = [(OTCreateInheritanceKeyOperation *)self uuid];
  id v25 = 0;
  id v9 = [v7 initWithUUID:v8 error:&v25];
  id v10 = v25;
  [(OTCreateInheritanceKeyOperation *)self setIk:v9];

  v11 = [(OTCreateInheritanceKeyOperation *)self ik];
  BOOL v12 = v11 == 0;

  if (v12)
  {
    v21 = sub_10000B070("SecError");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "octagon: failed to create inheritance key: %@", buf, 0xCu);
    }

    [(CKKSResultOperation *)self setError:v10];
    v15 = [(OTCreateInheritanceKeyOperation *)self finishOp];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v15];
  }
  else
  {
    v13 = [(OTCreateInheritanceKeyOperation *)self ik];
    v14 = [v13 recoveryKeyData];
    v15 = [v14 base64EncodedStringWithOptions:0];

    v16 = [(OTCreateInheritanceKeyOperation *)self deps];
    v17 = [v16 cuttlefishXPCWrapper];
    v18 = [(OTCreateInheritanceKeyOperation *)self deps];
    v19 = [v18 activeAccount];
    v20 = [(OTCreateInheritanceKeyOperation *)self uuid];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000AA924;
    v23[3] = &unk_1002F8E10;
    objc_copyWeak(&v24, &location);
    [v17 createCustodianRecoveryKeyWithSpecificUser:v19 recoveryKey:v15 salt:v6 ckksKeys:v22 uuid:v20 kind:2 reply:v23];

    objc_destroyWeak(&v24);
  }

  objc_destroyWeak(&location);
}

- (void)groupStart
{
  id v3 = objc_alloc_init((Class)NSOperation);
  [(OTCreateInheritanceKeyOperation *)self setFinishOp:v3];

  v4 = [(OTCreateInheritanceKeyOperation *)self finishOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v4];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [OTFetchCKKSKeysOperation alloc];
  id v6 = [(OTCreateInheritanceKeyOperation *)self deps];
  id v7 = [(OTFetchCKKSKeysOperation *)v5 initWithDependencies:v6 refetchNeeded:0];

  [(CKKSGroupOperation *)self runBeforeGroupFinished:v7];
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  BOOL v12 = sub_1000AAD18;
  v13 = &unk_1003077C8;
  objc_copyWeak(&v16, &location);
  v8 = v7;
  v14 = v8;
  v15 = &stru_10030AA90;
  id v9 = +[CKKSResultOperation named:@"setting-recovery-tlks" withBlock:&v10];
  [v9 addDependency:v8, v10, v11, v12, v13];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v9];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (OTCreateInheritanceKeyOperation)initWithUUID:(id)a3 dependencies:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)OTCreateInheritanceKeyOperation;
  v8 = [(CKKSGroupOperation *)&v11 init];
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