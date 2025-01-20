@interface OTStoreInheritanceKeyOperation
- (NSOperation)finishOp;
- (OTInheritanceKey)ik;
- (OTOperationDependencies)deps;
- (OTStoreInheritanceKeyOperation)initWithIK:(id)a3 dependencies:(id)a4;
- (void)groupStart;
- (void)proceedWithKeys:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setIk:(id)a3;
@end

@implementation OTStoreInheritanceKeyOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);

  objc_storeStrong((id *)&self->_ik, 0);
}

- (void)setFinishOp:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 144, 1);
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

- (void)proceedWithKeys:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [(OTStoreInheritanceKeyOperation *)self ik];
  v6 = [v5 recoveryKeyData];
  v7 = [v6 base64EncodedStringWithOptions:0];

  v8 = [(OTStoreInheritanceKeyOperation *)self deps];
  v9 = [v8 cuttlefishXPCWrapper];
  v10 = [(OTStoreInheritanceKeyOperation *)self deps];
  v11 = [v10 activeAccount];
  v12 = [(OTStoreInheritanceKeyOperation *)self ik];
  v13 = [v12 uuid];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000AB0C0;
  v14[3] = &unk_1002F8E10;
  objc_copyWeak(&v15, &location);
  [v9 createCustodianRecoveryKeyWithSpecificUser:v11 recoveryKey:v7 salt:&stru_10030AA90 ckksKeys:v4 uuid:v13 kind:2 reply:v14];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)groupStart
{
  id v3 = objc_alloc_init((Class)NSOperation);
  [(OTStoreInheritanceKeyOperation *)self setFinishOp:v3];

  id v4 = [(OTStoreInheritanceKeyOperation *)self finishOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v4];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [OTFetchCKKSKeysOperation alloc];
  v6 = [(OTStoreInheritanceKeyOperation *)self deps];
  v7 = [(OTFetchCKKSKeysOperation *)v5 initWithDependencies:v6 refetchNeeded:0];

  [(CKKSGroupOperation *)self runBeforeGroupFinished:v7];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000AB4A4;
  v10[3] = &unk_100306AD0;
  objc_copyWeak(&v12, &location);
  v8 = v7;
  v11 = v8;
  v9 = +[CKKSResultOperation named:@"setting-recovery-tlks" withBlock:v10];
  [v9 addDependency:v8];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (OTStoreInheritanceKeyOperation)initWithIK:(id)a3 dependencies:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OTStoreInheritanceKeyOperation;
  v9 = [(CKKSGroupOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ik, a3);
    objc_storeStrong((id *)&v10->_deps, a4);
  }

  return v10;
}

@end