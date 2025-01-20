@interface OTJoinWithVoucherOperation
- (NSData)voucherData;
- (NSData)voucherSig;
- (NSOperation)finishedOp;
- (NSString)peerID;
- (OTJoinWithVoucherOperation)initWithDependencies:(id)a3 intendedState:(id)a4 ckksConflictState:(id)a5 errorState:(id)a6;
- (OTOperationDependencies)deps;
- (OctagonStateString)ckksConflictState;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)proceedWithPendingTLKShares:(id)a3;
- (void)setCkksConflictState:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setVoucherData:(id)a3;
- (void)setVoucherSig:(id)a3;
@end

@implementation OTJoinWithVoucherOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_ckksConflictState, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_voucherSig, 0);
  objc_storeStrong((id *)&self->_voucherData, 0);
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
}

- (void)setFinishedOp:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCkksConflictState:(id)a3
{
}

- (OctagonStateString)ckksConflictState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 168, 1);
}

- (void)setPeerID:(id)a3
{
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setVoucherSig:(id)a3
{
}

- (NSData)voucherSig
{
  return (NSData *)objc_getProperty(self, a2, 152, 1);
}

- (void)setVoucherData:(id)a3
{
}

- (NSData)voucherData
{
  return (NSData *)objc_getProperty(self, a2, 144, 1);
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

- (void)proceedWithPendingTLKShares:(id)a3
{
  id v24 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4 = [(OTJoinWithVoucherOperation *)self deps];
  v5 = [v4 sosAdapter];
  unsigned int v6 = [v5 sosEnabled];

  if (v6)
  {
    v7 = [(OTJoinWithVoucherOperation *)self deps];
    v8 = [v7 sosAdapter];
    id v30 = 0;
    v27 = +[OTSOSAdapterHelpers peerPublicSigningKeySPKIsForCircle:v8 error:&v30];
    v9 = v30;

    v10 = sub_10000B070("octagon-sos");
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v27)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        v33 = v27;
        v12 = "SOS preapproved keys are %@";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
      }
    }
    else if (v11)
    {
      *(_DWORD *)buf = 138412290;
      v33 = v9;
      v12 = "Unable to fetch SOS preapproved keys: %@";
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  v9 = sub_10000B070("octagon-sos");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SOS not enabled; no preapproved keys", buf, 2u);
  }
  v27 = 0;
LABEL_12:

  v26 = [(OTJoinWithVoucherOperation *)self deps];
  v23 = [v26 cuttlefishXPCWrapper];
  v25 = [(OTJoinWithVoucherOperation *)self deps];
  v22 = [v25 activeAccount];
  v13 = [(OTJoinWithVoucherOperation *)self voucherData];
  v14 = [(OTJoinWithVoucherOperation *)self voucherSig];
  v15 = [(OTJoinWithVoucherOperation *)self deps];
  v16 = [v15 flowID];
  v17 = [(OTJoinWithVoucherOperation *)self deps];
  v18 = [v17 deviceSessionID];
  v19 = [(OTJoinWithVoucherOperation *)self deps];
  unsigned __int8 v20 = [v19 permittedToSendMetrics];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000BA4EC;
  v28[3] = &unk_1002FAF10;
  objc_copyWeak(&v29, &location);
  LOBYTE(v21) = v20;
  [v23 joinWithSpecificUser:v22 voucherData:v13 voucherSig:v14 ckksKeys:&__NSArray0__struct tlkShares:v24 preapprovedKeys:v27 flowID:v16 deviceSessionID:v18 canSendMetrics:v21 reply:v28];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)groupStart
{
  v3 = [(OTJoinWithVoucherOperation *)self deps];
  v4 = [v3 stateHolder];
  id v16 = 0;
  v5 = [v4 loadOrCreateAccountMetadata:&v16];
  id v6 = v16;

  uint64_t v7 = [v5 voucher];
  if (v7
    && (v8 = (void *)v7,
        [v5 voucherSignature],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9)
    && !v6)
  {
    v10 = [v5 voucher];
    [(OTJoinWithVoucherOperation *)self setVoucherData:v10];

    BOOL v11 = [v5 voucherSignature];
    [(OTJoinWithVoucherOperation *)self setVoucherSig:v11];

    v12 = sub_10000B070("octagon");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(OTJoinWithVoucherOperation *)self voucherData];
      *(_DWORD *)buf = 138412290;
      id v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "joining with a voucher: %@", buf, 0xCu);
    }
    v14 = [v5 getTLKSharesPairedWithVoucher];
    [(OTJoinWithVoucherOperation *)self proceedWithPendingTLKShares:v14];
  }
  else
  {
    v15 = sub_10000B070("octagon");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No voucher available: %@", buf, 0xCu);
    }

    [(CKKSResultOperation *)self setError:v6];
  }
}

- (OTJoinWithVoucherOperation)initWithDependencies:(id)a3 intendedState:(id)a4 ckksConflictState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)OTJoinWithVoucherOperation;
  v15 = [(CKKSGroupOperation *)&v21 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    objc_storeStrong((id *)&v16->_nextState, a6);
    objc_storeStrong((id *)&v16->_ckksConflictState, a5);
    peerID = v16->_peerID;
    v16->_peerID = 0;

    voucherData = v16->_voucherData;
    v16->_voucherData = 0;

    voucherSig = v16->_voucherSig;
    v16->_voucherSig = 0;
  }
  return v16;
}

@end