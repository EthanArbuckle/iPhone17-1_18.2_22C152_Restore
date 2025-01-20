@interface OTVouchWithBottleOperation
- (BOOL)saveVoucher;
- (NSData)entropy;
- (NSData)voucher;
- (NSData)voucherSig;
- (NSOperation)finishedOp;
- (NSString)bottleID;
- (NSString)bottleSalt;
- (OTOperationDependencies)deps;
- (OTVouchWithBottleOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 bottleID:(id)a6 entropy:(id)a7 bottleSalt:(id)a8 saveVoucher:(BOOL)a9;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)proceedWithFilteredTLKShares:(id)a3;
- (void)proceedWithPeerID:(id)a3 refetchWasNeeded:(BOOL)a4;
- (void)setBottleID:(id)a3;
- (void)setBottleSalt:(id)a3;
- (void)setDeps:(id)a3;
- (void)setEntropy:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setVoucher:(id)a3;
- (void)setVoucherSig:(id)a3;
@end

@implementation OTVouchWithBottleOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_voucherSig + 6), 0);
  objc_storeStrong((id *)((char *)&self->_voucher + 6), 0);
  objc_storeStrong((id *)((char *)&self->_bottleSalt + 6), 0);
  objc_storeStrong((id *)((char *)&self->_entropy + 6), 0);
  objc_storeStrong((id *)((char *)&self->_bottleID + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);

  objc_storeStrong((id *)(&self->_saveVoucher + 6), 0);
}

- (void)setFinishedOp:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 198, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 190, 1);
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
  return *(NSData **)((char *)&self->_bottleSalt + 6);
}

- (void)setBottleSalt:(id)a3
{
}

- (NSString)bottleSalt
{
  return *(NSString **)((char *)&self->_entropy + 6);
}

- (void)setEntropy:(id)a3
{
}

- (NSData)entropy
{
  return *(NSData **)((char *)&self->_bottleID + 6);
}

- (void)setBottleID:(id)a3
{
}

- (NSString)bottleID
{
  return *(NSString **)((char *)&self->_nextState + 6);
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
  v5 = [(OTVouchWithBottleOperation *)self deps];
  v6 = [v5 cuttlefishXPCWrapper];
  v7 = [(OTVouchWithBottleOperation *)self deps];
  v8 = [v7 activeAccount];
  v9 = [(OTVouchWithBottleOperation *)self bottleID];
  v10 = [(OTVouchWithBottleOperation *)self entropy];
  v11 = [(OTVouchWithBottleOperation *)self bottleSalt];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100081544;
  v13[3] = &unk_1002FA018;
  objc_copyWeak(&v15, &location);
  id v12 = v4;
  id v14 = v12;
  [v6 vouchWithBottleWithSpecificUser:v8 bottleID:v9 entropy:v10 bottleSalt:v11 tlkShares:v12 reply:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)proceedWithPeerID:(id)a3 refetchWasNeeded:(BOOL)a4
{
  id v5 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6 = [(OTVouchWithBottleOperation *)self deps];
  v7 = [v6 cuttlefishXPCWrapper];
  v8 = [(OTVouchWithBottleOperation *)self deps];
  v9 = [v8 activeAccount];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100081AF4;
  v10[3] = &unk_100304E40;
  objc_copyWeak(&v11, &location);
  [v7 fetchRecoverableTLKSharesWithSpecificUser:v9 peerID:v5 reply:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)groupStart
{
  v3 = sub_10000B070("octagon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(OTVouchWithBottleOperation *)self bottleID];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "creating voucher using a bottle with escrow record id: %@", buf, 0xCu);
  }
  id v5 = objc_alloc_init((Class)NSOperation);
  [(OTVouchWithBottleOperation *)self setFinishedOp:v5];

  uint64_t v6 = [(OTVouchWithBottleOperation *)self finishedOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v6];

  v7 = [(OTVouchWithBottleOperation *)self bottleSalt];
  LOBYTE(v6) = v7 == 0;

  if ((v6 & 1) == 0)
  {
    v8 = sub_10000B070("octagon");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(OTVouchWithBottleOperation *)self bottleSalt];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "using passed in altdsid, altdsid is: %@", buf, 0xCu);
    }
    goto LABEL_8;
  }
  v10 = [(OTVouchWithBottleOperation *)self deps];
  id v11 = [v10 activeAccount];
  v8 = [v11 altDSID];

  if (v8)
  {
    [(OTVouchWithBottleOperation *)self setBottleSalt:v8];
LABEL_8:

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    id v12 = [(OTVouchWithBottleOperation *)self deps];
    v13 = [v12 cuttlefishXPCWrapper];
    id v14 = [(OTVouchWithBottleOperation *)self deps];
    id v15 = [v14 activeAccount];
    v16 = [(OTVouchWithBottleOperation *)self bottleID];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100082138;
    v22[3] = &unk_1002F8890;
    objc_copyWeak(&v23, (id *)buf);
    [v13 preflightVouchWithBottleWithSpecificUser:v15 bottleID:v16 reply:v22];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
    return;
  }
  v17 = sub_10000B070("authkit");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [(OTVouchWithBottleOperation *)self deps];
    v19 = [v18 activeAccount];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);
  }
  v20 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:59 description:@"No altDSID configured"];
  [(CKKSResultOperation *)self setError:v20];

  v21 = [(OTVouchWithBottleOperation *)self finishedOp];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v21];
}

- (OTVouchWithBottleOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 bottleID:(id)a6 entropy:(id)a7 bottleSalt:(id)a8 saveVoucher:(BOOL)a9
{
  id v16 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v17 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)OTVouchWithBottleOperation;
  v19 = [(CKKSGroupOperation *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)(v19 + 190), a3);
    objc_storeStrong((id *)(v20 + 134), a4);
    objc_storeStrong((id *)(v20 + 142), a5);
    objc_storeStrong((id *)(v20 + 150), a6);
    objc_storeStrong((id *)(v20 + 158), a7);
    objc_storeStrong((id *)(v20 + 166), a8);
    v20[128] = a9;
  }

  return (OTVouchWithBottleOperation *)v20;
}

@end