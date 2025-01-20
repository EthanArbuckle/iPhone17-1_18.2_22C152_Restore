@interface OTPrepareAndRecoverTLKSharesForInheritancePeerOperation
- (NSData)permanentInfo;
- (NSData)permanentInfoSig;
- (NSData)stableInfo;
- (NSData)stableInfoSig;
- (NSOperation)finishOp;
- (NSString)peerID;
- (NSString)salt;
- (OTDeviceInformation)deviceInfo;
- (OTInheritanceKey)ik;
- (OTOperationDependencies)deps;
- (OTPrepareAndRecoverTLKSharesForInheritancePeerOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 ik:(id)a6 deviceInfo:(id)a7 policyOverride:(id)a8 isInheritedAccount:(BOOL)a9 epoch:(unint64_t)a10;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (TPPolicyVersion)policyOverride;
- (TrustedPeersHelperCustodianRecoveryKey)tphcrk;
- (unint64_t)epoch;
- (void)groupStart;
- (void)proceedWithFilteredTLKShares:(id)a3;
- (void)setDeps:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setEpoch:(unint64_t)a3;
- (void)setFinishOp:(id)a3;
- (void)setIk:(id)a3;
- (void)setNextState:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPermanentInfo:(id)a3;
- (void)setPermanentInfoSig:(id)a3;
- (void)setPolicyOverride:(id)a3;
- (void)setSalt:(id)a3;
- (void)setStableInfo:(id)a3;
- (void)setStableInfoSig:(id)a3;
- (void)setTphcrk:(id)a3;
@end

@implementation OTPrepareAndRecoverTLKSharesForInheritancePeerOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tphcrk, 0);
  objc_storeStrong((id *)&self->_finishOp, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_ik, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_policyOverride, 0);
  objc_storeStrong((id *)&self->_stableInfoSig, 0);
  objc_storeStrong((id *)&self->_stableInfo, 0);
  objc_storeStrong((id *)&self->_permanentInfoSig, 0);
  objc_storeStrong((id *)&self->_permanentInfo, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
}

- (void)setTphcrk:(id)a3
{
}

- (TrustedPeersHelperCustodianRecoveryKey)tphcrk
{
  return (TrustedPeersHelperCustodianRecoveryKey *)objc_getProperty(self, a2, 240, 1);
}

- (void)setFinishOp:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 232, 1);
}

- (void)setSalt:(id)a3
{
}

- (NSString)salt
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setIk:(id)a3
{
}

- (OTInheritanceKey)ik
{
  return (OTInheritanceKey *)objc_getProperty(self, a2, 216, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 208, 1);
}

- (void)setPolicyOverride:(id)a3
{
}

- (TPPolicyVersion)policyOverride
{
  return (TPPolicyVersion *)objc_getProperty(self, a2, 200, 1);
}

- (void)setStableInfoSig:(id)a3
{
}

- (NSData)stableInfoSig
{
  return (NSData *)objc_getProperty(self, a2, 192, 1);
}

- (void)setStableInfo:(id)a3
{
}

- (NSData)stableInfo
{
  return (NSData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setPermanentInfoSig:(id)a3
{
}

- (NSData)permanentInfoSig
{
  return (NSData *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPermanentInfo:(id)a3
{
}

- (NSData)permanentInfo
{
  return (NSData *)objc_getProperty(self, a2, 168, 1);
}

- (void)setPeerID:(id)a3
{
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDeviceInfo:(id)a3
{
}

- (OTDeviceInformation)deviceInfo
{
  return (OTDeviceInformation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setEpoch:(unint64_t)a3
{
  self->_epoch = a3;
}

- (unint64_t)epoch
{
  return self->_epoch;
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

- (void)proceedWithFilteredTLKShares:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self deps];
  v6 = [v5 cuttlefishXPCWrapper];
  v7 = [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self deps];
  v8 = [v7 activeAccount];
  v9 = [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self tphcrk];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000FA4FC;
  v11[3] = &unk_1002FA090;
  objc_copyWeak(&v13, &location);
  id v10 = v4;
  id v12 = v10;
  [v6 recoverTLKSharesForInheritorWithSpecificUser:v8 crk:v9 tlkShares:v10 reply:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)groupStart
{
  v3 = sub_10000B070("octagon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "creating inheritance peer and recovering shares using an inheritance key", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)NSOperation);
  [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self setFinishOp:v4];

  v5 = [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self finishOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v5];

  v6 = [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self ik];
  v7 = [v6 recoveryKeyData];
  v40 = [v7 base64EncodedStringWithOptions:0];

  [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self setSalt:&stru_10030AA90];
  v8 = [TrustedPeersHelperCustodianRecoveryKey alloc];
  v9 = [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self ik];
  id v10 = [v9 uuid];
  v11 = [v10 UUIDString];
  id v12 = [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self salt];
  id v13 = [(TrustedPeersHelperCustodianRecoveryKey *)v8 initWithUUID:v11 encryptionKey:0 signingKey:0 recoveryString:v40 salt:v12 kind:2];
  [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self setTphcrk:v13];

  *(void *)buf = 0;
  v47 = buf;
  uint64_t v48 = 0x3032000000;
  v49 = sub_1000FAE4C;
  v50 = sub_1000FAE5C;
  id v51 = 0;
  v14 = [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self deps];
  v15 = [v14 stateHolder];
  id v44 = 0;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000FAE64;
  v45[3] = &unk_1002FA040;
  v45[4] = buf;
  unsigned __int8 v16 = [v15 persistAccountChanges:v45 error:&v44];
  id v41 = v44;

  if (v41) {
    unsigned __int8 v17 = 0;
  }
  else {
    unsigned __int8 v17 = v16;
  }
  if ((v17 & 1) == 0)
  {
    v18 = sub_10000B070("SecError");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v52 = 138412290;
      *(void *)&v52[4] = v41;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "octagon: failed to save 'se' state: %@", v52, 0xCu);
    }
  }
  *(void *)v52 = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)v52, self);
  v39 = [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self deps];
  v34 = [v39 cuttlefishXPCWrapper];
  v38 = [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self deps];
  v33 = [v38 activeAccount];
  unint64_t v29 = [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self epoch];
  v37 = [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self deviceInfo];
  v32 = [v37 machineID];
  v36 = +[NSUUID UUID];
  v31 = [v36 UUIDString];
  v35 = [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self deviceInfo];
  v30 = [v35 modelID];
  v19 = [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self deviceInfo];
  v20 = [v19 deviceName];
  v21 = [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self deviceInfo];
  v22 = [v21 serialNumber];
  v23 = [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self deviceInfo];
  v24 = [v23 osVersion];
  v25 = [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self policyOverride];
  uint64_t v26 = *((void *)v47 + 5);
  v27 = [(OTPrepareAndRecoverTLKSharesForInheritancePeerOperation *)self tphcrk];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000FAEBC;
  v42[3] = &unk_1002FA068;
  objc_copyWeak(&v43, (id *)v52);
  LODWORD(v28) = 0;
  objc_msgSend(v34, "prepareInheritancePeerWithSpecificUser:epoch:machineID:bottleSalt:bottleID:modelID:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:signingPrivKeyPersistentRef:encPrivKeyPersistentRef:crk:reply:", v33, v29, v32, &stru_10030AA90, v31, v30, v20, v22, v24, v25, 0, v28, v26, 0, 0,
    v27,
    v42);

  objc_destroyWeak(&v43);
  objc_destroyWeak((id *)v52);

  _Block_object_dispose(buf, 8);
}

- (OTPrepareAndRecoverTLKSharesForInheritancePeerOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 ik:(id)a6 deviceInfo:(id)a7 policyOverride:(id)a8 isInheritedAccount:(BOOL)a9 epoch:(unint64_t)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v25 = a6;
  id v24 = a7;
  id v23 = a8;
  v26.receiver = self;
  v26.super_class = (Class)OTPrepareAndRecoverTLKSharesForInheritancePeerOperation;
  v20 = [(CKKSGroupOperation *)&v26 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_deps, a3);
    objc_storeStrong((id *)&v21->_intendedState, a4);
    objc_storeStrong((id *)&v21->_nextState, a5);
    objc_storeStrong((id *)&v21->_ik, a6);
    objc_storeStrong((id *)&v21->_deviceInfo, a7);
    v21->_epoch = a10;
    objc_storeStrong((id *)&v21->_intendedState, a4);
    objc_storeStrong((id *)&v21->_nextState, a5);
    objc_storeStrong((id *)&v21->_policyOverride, a8);
  }

  return v21;
}

@end