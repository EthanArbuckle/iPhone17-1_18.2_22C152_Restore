@interface OTFindCustodianRecoveryKeyOperation
- (NSOperation)finishOp;
- (NSUUID)uuid;
- (OTFindCustodianRecoveryKeyOperation)initWithUUID:(id)a3 dependencies:(id)a4;
- (OTOperationDependencies)deps;
- (TrustedPeersHelperCustodianRecoveryKey)crk;
- (void)groupStart;
- (void)setCrk:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation OTFindCustodianRecoveryKeyOperation

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

- (TrustedPeersHelperCustodianRecoveryKey)crk
{
  return self->_crk;
}

- (void)groupStart
{
  id v3 = objc_alloc_init((Class)NSOperation);
  [(OTFindCustodianRecoveryKeyOperation *)self setFinishOp:v3];

  v4 = [(OTFindCustodianRecoveryKeyOperation *)self finishOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v4];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [(OTFindCustodianRecoveryKeyOperation *)self deps];
  v6 = [v5 cuttlefishXPCWrapper];
  v7 = [(OTFindCustodianRecoveryKeyOperation *)self deps];
  v8 = [v7 activeAccount];
  v9 = [(OTFindCustodianRecoveryKeyOperation *)self uuid];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000C9C68;
  v10[3] = &unk_1002F9600;
  objc_copyWeak(&v11, &location);
  [v6 findCustodianRecoveryKeyWithSpecificUser:v8 uuid:v9 reply:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (OTFindCustodianRecoveryKeyOperation)initWithUUID:(id)a3 dependencies:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OTFindCustodianRecoveryKeyOperation;
  v9 = [(CKKSGroupOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeStrong((id *)&v10->_deps, a4);
  }

  return v10;
}

@end