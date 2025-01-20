@interface OTVouchWithRerollOperation
- (BOOL)saveVoucher;
- (NSData)voucher;
- (NSData)voucherSig;
- (NSOperation)finishOp;
- (NSString)oldPeerID;
- (NSString)peerID;
- (OTOperationDependencies)deps;
- (OTVouchWithRerollOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 saveVoucher:(BOOL)a6;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (TPSyncingPolicy)syncingPolicy;
- (void)groupStart;
- (void)proceedWithFilteredTLKShares:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setOldPeerID:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setSyncingPolicy:(id)a3;
- (void)setVoucher:(id)a3;
- (void)setVoucherSig:(id)a3;
@end

@implementation OTVouchWithRerollOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_oldPeerID + 6), 0);
  objc_storeStrong((id *)((char *)&self->_peerID + 6), 0);
  objc_storeStrong((id *)((char *)&self->_finishOp + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_voucherSig + 6), 0);
  objc_storeStrong((id *)((char *)&self->_voucher + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);

  objc_storeStrong((id *)(&self->_saveVoucher + 6), 0);
}

- (void)setSyncingPolicy:(id)a3
{
}

- (TPSyncingPolicy)syncingPolicy
{
  return (TPSyncingPolicy *)objc_getProperty(self, a2, 198, 1);
}

- (void)setOldPeerID:(id)a3
{
}

- (NSString)oldPeerID
{
  return (NSString *)objc_getProperty(self, a2, 190, 1);
}

- (void)setPeerID:(id)a3
{
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 182, 1);
}

- (void)setFinishOp:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 174, 1);
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
  v5 = [(OTVouchWithRerollOperation *)self deps];
  v6 = [v5 cuttlefishXPCWrapper];
  v7 = [(OTVouchWithRerollOperation *)self deps];
  v8 = [v7 activeAccount];
  v9 = [(OTVouchWithRerollOperation *)self oldPeerID];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000CF0AC;
  v11[3] = &unk_1002FA018;
  objc_copyWeak(&v13, &location);
  id v10 = v4;
  id v12 = v10;
  [v6 vouchWithRerollWithSpecificUser:v8 oldPeerID:v9 tlkShares:v10 reply:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)groupStart
{
  v3 = sub_10000B070("octagon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "creating voucher for reroll", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)NSOperation);
  [(OTVouchWithRerollOperation *)self setFinishOp:v4];

  v5 = [(OTVouchWithRerollOperation *)self finishOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v5];

  v6 = [(OTVouchWithRerollOperation *)self deps];
  v7 = [v6 stateHolder];
  id v22 = 0;
  v8 = [v7 loadOrCreateAccountMetadata:&v22];
  id v9 = v22;

  if (v9)
  {
    id v10 = sub_10000B070("SecError");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "octagon: Error loading account metadata: %@", buf, 0xCu);
    }

    [(CKKSResultOperation *)self setError:v9];
    v11 = [(OTVouchWithRerollOperation *)self finishOp];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v11];
  }
  else
  {
    id v12 = [v8 peerID];
    [(OTVouchWithRerollOperation *)self setPeerID:v12];

    id v13 = [v8 oldPeerID];
    [(OTVouchWithRerollOperation *)self setOldPeerID:v13];

    v14 = [v8 getTPSyncingPolicy];
    [(OTVouchWithRerollOperation *)self setSyncingPolicy:v14];

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v15 = [(OTVouchWithRerollOperation *)self deps];
    v16 = [v15 cuttlefishXPCWrapper];
    v17 = [(OTVouchWithRerollOperation *)self deps];
    v18 = [v17 activeAccount];
    v19 = [(OTVouchWithRerollOperation *)self peerID];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000CF864;
    v20[3] = &unk_100304E40;
    objc_copyWeak(&v21, (id *)buf);
    [v16 fetchRecoverableTLKSharesWithSpecificUser:v18 peerID:v19 reply:v20];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
}

- (OTVouchWithRerollOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 saveVoucher:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)OTVouchWithRerollOperation;
  v14 = [(CKKSGroupOperation *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 166), a3);
    objc_storeStrong((id *)(v15 + 134), a4);
    objc_storeStrong((id *)(v15 + 142), a5);
    v15[128] = a6;
  }

  return (OTVouchWithRerollOperation *)v15;
}

@end