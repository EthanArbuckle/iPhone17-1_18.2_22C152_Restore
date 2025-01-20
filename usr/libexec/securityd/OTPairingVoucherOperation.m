@interface OTPairingVoucherOperation
- (NSData)permanentInfo;
- (NSData)permanentInfoSig;
- (NSData)stableInfo;
- (NSData)stableInfoSig;
- (NSData)voucher;
- (NSData)voucherSig;
- (NSOperation)finishedOp;
- (NSString)peerID;
- (OTDeviceInformation)deviceInfo;
- (OTOperationDependencies)operationDependencies;
- (OTPairingVoucherOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 deviceInfo:(id)a6 peerID:(id)a7 permanentInfo:(id)a8 permanentInfoSig:(id)a9 stableInfo:(id)a10 stableInfoSig:(id)a11;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)proceedWithKeys:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setOperationDependencies:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPermanentInfo:(id)a3;
- (void)setPermanentInfoSig:(id)a3;
- (void)setStableInfo:(id)a3;
- (void)setStableInfoSig:(id)a3;
- (void)setVoucher:(id)a3;
- (void)setVoucherSig:(id)a3;
@end

@implementation OTPairingVoucherOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_operationDependencies, 0);
  objc_storeStrong((id *)&self->_voucherSig, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_stableInfoSig, 0);
  objc_storeStrong((id *)&self->_stableInfo, 0);
  objc_storeStrong((id *)&self->_permanentInfoSig, 0);
  objc_storeStrong((id *)&self->_permanentInfo, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
}

- (void)setFinishedOp:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 216, 1);
}

- (void)setOperationDependencies:(id)a3
{
}

- (OTOperationDependencies)operationDependencies
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 208, 1);
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

- (void)setDeviceInfo:(id)a3
{
}

- (OTDeviceInformation)deviceInfo
{
  return (OTDeviceInformation *)objc_getProperty(self, a2, 184, 1);
}

- (void)setStableInfoSig:(id)a3
{
}

- (NSData)stableInfoSig
{
  return self->_stableInfoSig;
}

- (void)setStableInfo:(id)a3
{
}

- (NSData)stableInfo
{
  return self->_stableInfo;
}

- (void)setPermanentInfoSig:(id)a3
{
}

- (NSData)permanentInfoSig
{
  return self->_permanentInfoSig;
}

- (void)setPermanentInfo:(id)a3
{
}

- (NSData)permanentInfo
{
  return self->_permanentInfo;
}

- (void)setPeerID:(id)a3
{
}

- (NSString)peerID
{
  return self->_peerID;
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

- (void)proceedWithKeys:(id)a3
{
  id v22 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4 = sub_10000B070("octagon");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [v22 count];
    *(_DWORD *)buf = 67109120;
    unsigned int v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "vouching with %d keysets", buf, 8u);
  }

  v21 = [(OTPairingVoucherOperation *)self operationDependencies];
  v19 = [v21 cuttlefishXPCWrapper];
  v20 = [(OTPairingVoucherOperation *)self operationDependencies];
  v18 = [v20 activeAccount];
  v17 = [(OTPairingVoucherOperation *)self peerID];
  v16 = [(OTPairingVoucherOperation *)self permanentInfo];
  v15 = [(OTPairingVoucherOperation *)self permanentInfoSig];
  v6 = [(OTPairingVoucherOperation *)self stableInfo];
  v7 = [(OTPairingVoucherOperation *)self stableInfoSig];
  v8 = [(OTPairingVoucherOperation *)self operationDependencies];
  v9 = [v8 flowID];
  v10 = [(OTPairingVoucherOperation *)self operationDependencies];
  v11 = [v10 deviceSessionID];
  v12 = [(OTPairingVoucherOperation *)self operationDependencies];
  unsigned __int8 v13 = [v12 permittedToSendMetrics];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10015D924;
  v23[3] = &unk_1003051E8;
  objc_copyWeak(&v24, &location);
  LOBYTE(v14) = v13;
  [v19 vouchWithSpecificUser:v18 peerID:v17 permanentInfo:v16 permanentInfoSig:v15 stableInfo:v6 stableInfoSig:v7 ckksKeys:v22 flowID:v9 deviceSessionID:v11 canSendMetrics:v14 reply:v23];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)groupStart
{
  v3 = sub_10000B070("octagon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "creating voucher", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)NSOperation);
  [(OTPairingVoucherOperation *)self setFinishedOp:v4];

  unsigned int v5 = [(OTPairingVoucherOperation *)self finishedOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v5];

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id v6 = objc_alloc((Class)AAFAnalyticsEventSecurity);
  v7 = [(OTPairingVoucherOperation *)self operationDependencies];
  v8 = [v7 activeAccount];
  v9 = [v8 altDSID];
  v10 = [(OTPairingVoucherOperation *)self operationDependencies];
  v11 = [v10 flowID];
  v12 = [(OTPairingVoucherOperation *)self operationDependencies];
  unsigned __int8 v13 = [v12 deviceSessionID];
  uint64_t v14 = [(OTPairingVoucherOperation *)self operationDependencies];
  LOBYTE(v22) = [v14 permittedToSendMetrics];
  id v15 = [v6 initWithKeychainCircleMetrics:0 altDSID:v9 flowID:v11 deviceSessionID:v13 eventName:kSecurityRTCEventNameCKKSTlkFetch testsAreEnabled:0 canSendMetrics:v22 category:kSecurityRTCEventCategoryAccountDataAccessRecovery];

  v16 = [OTFetchCKKSKeysOperation alloc];
  v17 = [(OTPairingVoucherOperation *)self operationDependencies];
  v18 = [(OTFetchCKKSKeysOperation *)v16 initWithDependencies:v17 refetchNeeded:0];

  [(CKKSGroupOperation *)self runBeforeGroupFinished:v18];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10015DD94;
  v23[3] = &unk_1003077C8;
  objc_copyWeak(&v26, (id *)buf);
  v19 = v18;
  id v24 = v19;
  id v20 = v15;
  id v25 = v20;
  v21 = +[CKKSResultOperation named:@"vouch-with-keys" withBlock:v23];
  [v21 addDependency:v19];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v21];

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

- (OTPairingVoucherOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 deviceInfo:(id)a6 peerID:(id)a7 permanentInfo:(id)a8 permanentInfoSig:(id)a9 stableInfo:(id)a10 stableInfoSig:(id)a11
{
  id v30 = a3;
  id v29 = a4;
  id v28 = a5;
  id obj = a6;
  id v27 = a6;
  id v26 = a7;
  id v25 = a8;
  id v24 = a9;
  id v23 = a10;
  id v18 = a11;
  v31.receiver = self;
  v31.super_class = (Class)OTPairingVoucherOperation;
  v19 = [(CKKSGroupOperation *)&v31 init];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_intendedState, a4);
    objc_storeStrong((id *)&v20->_nextState, a5);
    objc_storeStrong((id *)&v20->_operationDependencies, a3);
    objc_storeStrong((id *)&v20->_peerID, a7);
    objc_storeStrong((id *)&v20->_permanentInfo, a8);
    objc_storeStrong((id *)&v20->_permanentInfoSig, a9);
    objc_storeStrong((id *)&v20->_stableInfo, a10);
    objc_storeStrong((id *)&v20->_stableInfoSig, a11);
    objc_storeStrong((id *)&v20->_deviceInfo, obj);
  }

  return v20;
}

@end