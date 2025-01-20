@interface OTVouchWithRecoveryKeyOperation
- (BOOL)saveVoucher;
- (NSData)voucher;
- (NSData)voucherSig;
- (NSOperation)finishOp;
- (NSString)recoveryKey;
- (NSString)salt;
- (OTOperationDependencies)deps;
- (OTVouchWithRecoveryKeyOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 recoveryKey:(id)a6 saveVoucher:(BOOL)a7;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)proceedWithFilteredTLKShares:(id)a3;
- (void)proceedWithRecoveryKeyID:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setRecoveryKey:(id)a3;
- (void)setSalt:(id)a3;
- (void)setVoucher:(id)a3;
- (void)setVoucherSig:(id)a3;
@end

@implementation OTVouchWithRecoveryKeyOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_recoveryKey + 6), 0);
  objc_storeStrong((id *)((char *)&self->_salt + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_voucherSig + 6), 0);
  objc_storeStrong((id *)((char *)&self->_voucher + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);

  objc_storeStrong((id *)(&self->_saveVoucher + 6), 0);
}

- (void)setFinishOp:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 190, 1);
}

- (void)setRecoveryKey:(id)a3
{
}

- (NSString)recoveryKey
{
  return (NSString *)objc_getProperty(self, a2, 182, 1);
}

- (void)setSalt:(id)a3
{
}

- (NSString)salt
{
  return (NSString *)objc_getProperty(self, a2, 174, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 166, 1);
}

- (BOOL)saveVoucher
{
  return self->_saveVoucher;
}

- (void)setVoucherSig:(id)a3
{
}

- (NSData)voucherSig
{
  return *(NSData **)((char *)&self->_voucher + 6);
}

- (void)setVoucher:(id)a3
{
}

- (NSData)voucher
{
  return *(NSData **)((char *)&self->_nextState + 6);
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

- (void)proceedWithFilteredTLKShares:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [(OTVouchWithRecoveryKeyOperation *)self deps];
  v6 = [v5 cuttlefishXPCWrapper];
  v7 = [(OTVouchWithRecoveryKeyOperation *)self deps];
  v8 = [v7 activeAccount];
  v9 = [(OTVouchWithRecoveryKeyOperation *)self recoveryKey];
  v10 = [(OTVouchWithRecoveryKeyOperation *)self salt];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000CDEE0;
  v12[3] = &unk_1002FA018;
  objc_copyWeak(&v14, &location);
  id v11 = v4;
  id v13 = v11;
  [v6 vouchWithRecoveryKeyWithSpecificUser:v8 recoveryKey:v9 salt:v10 tlkShares:v11 reply:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)proceedWithRecoveryKeyID:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [(OTVouchWithRecoveryKeyOperation *)self deps];
  v6 = [v5 cuttlefishXPCWrapper];
  v7 = [(OTVouchWithRecoveryKeyOperation *)self deps];
  v8 = [v7 activeAccount];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000CE490;
  v9[3] = &unk_100304E40;
  objc_copyWeak(&v10, &location);
  [v6 fetchRecoverableTLKSharesWithSpecificUser:v8 peerID:v4 reply:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)groupStart
{
  v3 = sub_10000B070("octagon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "creating voucher using a recovery key", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)NSOperation);
  [(OTVouchWithRecoveryKeyOperation *)self setFinishOp:v4];

  v5 = [(OTVouchWithRecoveryKeyOperation *)self finishOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v5];

  v6 = [(OTVouchWithRecoveryKeyOperation *)self deps];
  v7 = [v6 activeAccount];
  v8 = [v7 altDSID];

  if (v8)
  {
    [(OTVouchWithRecoveryKeyOperation *)self setSalt:v8];
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v9 = [(OTVouchWithRecoveryKeyOperation *)self deps];
    id v10 = [v9 cuttlefishXPCWrapper];
    id v11 = [(OTVouchWithRecoveryKeyOperation *)self deps];
    v12 = [v11 activeAccount];
    id v13 = [(OTVouchWithRecoveryKeyOperation *)self recoveryKey];
    id v14 = [(OTVouchWithRecoveryKeyOperation *)self salt];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000CEA4C;
    v20[3] = &unk_1002F9FC8;
    objc_copyWeak(&v21, (id *)buf);
    [v10 preflightVouchWithRecoveryKeyWithSpecificUser:v12 recoveryKey:v13 salt:v14 reply:v20];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v15 = sub_10000B070("authkit");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(OTVouchWithRecoveryKeyOperation *)self deps];
      v17 = [v16 activeAccount];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);
    }
    v18 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:59 description:@"No altDSID configured"];
    [(CKKSResultOperation *)self setError:v18];

    v19 = [(OTVouchWithRecoveryKeyOperation *)self finishOp];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v19];
  }
}

- (OTVouchWithRecoveryKeyOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 recoveryKey:(id)a6 saveVoucher:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)OTVouchWithRecoveryKeyOperation;
  v17 = [(CKKSGroupOperation *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 166), a3);
    objc_storeStrong((id *)(v18 + 134), a4);
    objc_storeStrong((id *)(v18 + 142), a5);
    objc_storeStrong((id *)(v18 + 182), a6);
    v18[128] = a7;
  }

  return (OTVouchWithRecoveryKeyOperation *)v18;
}

@end