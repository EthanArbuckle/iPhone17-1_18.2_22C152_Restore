@interface OTPreflightVouchWithCustodianRecoveryKeyOperation
- (NSOperation)finishOp;
- (NSString)salt;
- (OTOperationDependencies)deps;
- (OTPreflightVouchWithCustodianRecoveryKeyOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 tphcrk:(id)a6;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (TrustedPeersHelperCustodianRecoveryKey)tphcrk;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setSalt:(id)a3;
- (void)setTphcrk:(id)a3;
@end

@implementation OTPreflightVouchWithCustodianRecoveryKeyOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tphcrk, 0);
  objc_storeStrong((id *)&self->_finishOp, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
}

- (void)setTphcrk:(id)a3
{
}

- (TrustedPeersHelperCustodianRecoveryKey)tphcrk
{
  return (TrustedPeersHelperCustodianRecoveryKey *)objc_getProperty(self, a2, 168, 1);
}

- (void)setFinishOp:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSalt:(id)a3
{
}

- (NSString)salt
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 144, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136, 1);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
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
  [(OTPreflightVouchWithCustodianRecoveryKeyOperation *)self setFinishOp:v4];

  v5 = [(OTPreflightVouchWithCustodianRecoveryKeyOperation *)self finishOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v5];

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v6 = [(OTPreflightVouchWithCustodianRecoveryKeyOperation *)self deps];
  v7 = [v6 cuttlefishXPCWrapper];
  v8 = [(OTPreflightVouchWithCustodianRecoveryKeyOperation *)self deps];
  v9 = [v8 activeAccount];
  v10 = [(OTPreflightVouchWithCustodianRecoveryKeyOperation *)self tphcrk];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000F8624;
  v11[3] = &unk_1002F9FC8;
  objc_copyWeak(&v12, (id *)buf);
  [v7 preflightVouchWithCustodianRecoveryKeyWithSpecificUser:v9 crk:v10 reply:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (OTPreflightVouchWithCustodianRecoveryKeyOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 tphcrk:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)OTPreflightVouchWithCustodianRecoveryKeyOperation;
  v15 = [(CKKSGroupOperation *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    objc_storeStrong((id *)&v16->_nextState, a5);
    objc_storeStrong((id *)&v16->_tphcrk, a6);
  }

  return v16;
}

@end