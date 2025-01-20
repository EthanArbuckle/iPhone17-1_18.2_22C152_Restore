@interface OTSetRecoveryKeyOperation
- (NSData)voucher;
- (NSData)voucherSig;
- (NSOperation)finishOp;
- (NSString)recoveryKey;
- (NSString)salt;
- (OTOperationDependencies)deps;
- (OTSetRecoveryKeyOperation)initWithDependencies:(id)a3 recoveryKey:(id)a4;
- (void)groupStart;
- (void)proceedWithKeys:(id)a3 salt:(id)a4;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setRecoveryKey:(id)a3;
- (void)setSalt:(id)a3;
- (void)setVoucher:(id)a3;
- (void)setVoucherSig:(id)a3;
@end

@implementation OTSetRecoveryKeyOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_voucherSig, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_recoveryKey, 0);

  objc_storeStrong((id *)&self->_salt, 0);
}

- (void)setFinishOp:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 168, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 160, 1);
}

- (void)setVoucherSig:(id)a3
{
}

- (NSData)voucherSig
{
  return self->_voucherSig;
}

- (void)setVoucher:(id)a3
{
}

- (NSData)voucher
{
  return self->_voucher;
}

- (void)setRecoveryKey:(id)a3
{
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setSalt:(id)a3
{
}

- (NSString)salt
{
  return self->_salt;
}

- (void)proceedWithKeys:(id)a3 salt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = [(OTSetRecoveryKeyOperation *)self deps];
  v9 = [v8 cuttlefishXPCWrapper];
  v10 = [(OTSetRecoveryKeyOperation *)self deps];
  v11 = [v10 activeAccount];
  v12 = [(OTSetRecoveryKeyOperation *)self recoveryKey];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A92C8;
  v13[3] = &unk_100304E40;
  objc_copyWeak(&v14, &location);
  [v9 setRecoveryKeyWithSpecificUser:v11 recoveryKey:v12 salt:v7 ckksKeys:v6 reply:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)groupStart
{
  id v3 = objc_alloc_init((Class)NSOperation);
  [(OTSetRecoveryKeyOperation *)self setFinishOp:v3];

  v4 = [(OTSetRecoveryKeyOperation *)self finishOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v4];

  v5 = [(OTSetRecoveryKeyOperation *)self deps];
  id v6 = [v5 activeAccount];
  id v7 = [v6 altDSID];

  if (v7)
  {
    id v8 = v7;
    *(void *)id location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    v9 = [OTFetchCKKSKeysOperation alloc];
    v10 = [(OTSetRecoveryKeyOperation *)self deps];
    v11 = [(OTFetchCKKSKeysOperation *)v9 initWithDependencies:v10 refetchNeeded:0];

    [(CKKSGroupOperation *)self runBeforeGroupFinished:v11];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000A9820;
    v19[3] = &unk_1003077C8;
    objc_copyWeak(&v22, (id *)location);
    v12 = v11;
    v20 = v12;
    id v13 = v8;
    id v21 = v13;
    id v14 = +[CKKSResultOperation named:@"setting-recovery-tlks" withBlock:v19];
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
      v16 = [(OTSetRecoveryKeyOperation *)self deps];
      v17 = [v16 activeAccount];
      *(_DWORD *)id location = 138412290;
      *(void *)&location[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", location, 0xCu);
    }
    v18 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:59 description:@"No altDSID configured"];
    [(CKKSResultOperation *)self setError:v18];

    id v13 = [(OTSetRecoveryKeyOperation *)self finishOp];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v13];
  }
}

- (OTSetRecoveryKeyOperation)initWithDependencies:(id)a3 recoveryKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OTSetRecoveryKeyOperation;
  v9 = [(CKKSGroupOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deps, a3);
    objc_storeStrong((id *)&v10->_recoveryKey, a4);
  }

  return v10;
}

@end