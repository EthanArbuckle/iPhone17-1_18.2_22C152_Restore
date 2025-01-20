@interface OTVouchWithCustodianRecoveryKeyOperation
- (BOOL)saveVoucher;
- (NSData)voucher;
- (NSData)voucherSig;
- (NSOperation)finishOp;
- (NSString)salt;
- (OTCustodianRecoveryKey)crk;
- (OTOperationDependencies)deps;
- (OTVouchWithCustodianRecoveryKeyOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 custodianRecoveryKey:(id)a6 saveVoucher:(BOOL)a7;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (TrustedPeersHelperCustodianRecoveryKey)tphcrk;
- (void)groupStart;
- (void)proceedWithFilteredTLKShares:(id)a3;
- (void)proceedWithRecoveryKeyID:(id)a3;
- (void)setCrk:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setSalt:(id)a3;
- (void)setTphcrk:(id)a3;
- (void)setVoucher:(id)a3;
- (void)setVoucherSig:(id)a3;
@end

@implementation OTVouchWithCustodianRecoveryKeyOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_finishOp + 6), 0);
  objc_storeStrong((id *)((char *)&self->_salt + 6), 0);
  objc_storeStrong((id *)((char *)&self->_crk + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_voucherSig + 6), 0);
  objc_storeStrong((id *)((char *)&self->_voucher + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);

  objc_storeStrong((id *)(&self->_saveVoucher + 6), 0);
}

- (void)setTphcrk:(id)a3
{
}

- (TrustedPeersHelperCustodianRecoveryKey)tphcrk
{
  return (TrustedPeersHelperCustodianRecoveryKey *)objc_getProperty(self, a2, 198, 1);
}

- (void)setFinishOp:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 190, 1);
}

- (void)setSalt:(id)a3
{
}

- (NSString)salt
{
  return (NSString *)objc_getProperty(self, a2, 182, 1);
}

- (void)setCrk:(id)a3
{
}

- (OTCustodianRecoveryKey)crk
{
  return (OTCustodianRecoveryKey *)objc_getProperty(self, a2, 174, 1);
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
  v5 = [(OTVouchWithCustodianRecoveryKeyOperation *)self deps];
  v6 = [v5 cuttlefishXPCWrapper];
  v7 = [(OTVouchWithCustodianRecoveryKeyOperation *)self deps];
  v8 = [v7 activeAccount];
  v9 = [(OTVouchWithCustodianRecoveryKeyOperation *)self tphcrk];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000F91A4;
  v11[3] = &unk_1002FA018;
  objc_copyWeak(&v13, &location);
  id v10 = v4;
  id v12 = v10;
  [v6 vouchWithCustodianRecoveryKeyWithSpecificUser:v8 crk:v9 tlkShares:v10 reply:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)proceedWithRecoveryKeyID:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [(OTVouchWithCustodianRecoveryKeyOperation *)self deps];
  v6 = [v5 cuttlefishXPCWrapper];
  v7 = [(OTVouchWithCustodianRecoveryKeyOperation *)self deps];
  v8 = [v7 activeAccount];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000F9754;
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
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "creating voucher using a custodian recovery key", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)NSOperation);
  [(OTVouchWithCustodianRecoveryKeyOperation *)self setFinishOp:v4];

  v5 = [(OTVouchWithCustodianRecoveryKeyOperation *)self finishOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v5];

  v6 = [(OTVouchWithCustodianRecoveryKeyOperation *)self deps];
  v7 = [v6 activeAccount];
  v8 = [v7 altDSID];

  if (v8)
  {
    [(OTVouchWithCustodianRecoveryKeyOperation *)self setSalt:v8];
    v9 = [TrustedPeersHelperCustodianRecoveryKey alloc];
    id v10 = [(OTVouchWithCustodianRecoveryKeyOperation *)self crk];
    v11 = [v10 uuid];
    id v12 = [v11 UUIDString];
    id v13 = [(OTVouchWithCustodianRecoveryKeyOperation *)self crk];
    v14 = [v13 recoveryString];
    v15 = [(OTVouchWithCustodianRecoveryKeyOperation *)self salt];
    v16 = [(TrustedPeersHelperCustodianRecoveryKey *)v9 initWithUUID:v12 encryptionKey:0 signingKey:0 recoveryString:v14 salt:v15 kind:1];
    [(OTVouchWithCustodianRecoveryKeyOperation *)self setTphcrk:v16];

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v17 = [(OTVouchWithCustodianRecoveryKeyOperation *)self deps];
    v18 = [v17 cuttlefishXPCWrapper];
    v19 = [(OTVouchWithCustodianRecoveryKeyOperation *)self deps];
    v20 = [v19 activeAccount];
    v21 = [(OTVouchWithCustodianRecoveryKeyOperation *)self tphcrk];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000F9DB0;
    v27[3] = &unk_1002F9FC8;
    objc_copyWeak(&v28, (id *)buf);
    [v18 preflightVouchWithCustodianRecoveryKeyWithSpecificUser:v20 crk:v21 reply:v27];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v22 = sub_10000B070("authkit");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [(OTVouchWithCustodianRecoveryKeyOperation *)self deps];
      v24 = [v23 activeAccount];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);
    }
    v25 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:59 description:@"No altDSID configured"];
    [(CKKSResultOperation *)self setError:v25];

    v26 = [(OTVouchWithCustodianRecoveryKeyOperation *)self finishOp];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v26];
  }
}

- (OTVouchWithCustodianRecoveryKeyOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 custodianRecoveryKey:(id)a6 saveVoucher:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)OTVouchWithCustodianRecoveryKeyOperation;
  v17 = [(CKKSGroupOperation *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 166), a3);
    objc_storeStrong((id *)(v18 + 134), a4);
    objc_storeStrong((id *)(v18 + 142), a5);
    objc_storeStrong((id *)(v18 + 174), a6);
    v18[128] = a7;
  }

  return (OTVouchWithCustodianRecoveryKeyOperation *)v18;
}

@end