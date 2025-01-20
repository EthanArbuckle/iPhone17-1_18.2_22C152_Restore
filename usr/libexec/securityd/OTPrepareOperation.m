@interface OTPrepareOperation
- (NSData)permanentInfo;
- (NSData)permanentInfoSig;
- (NSData)stableInfo;
- (NSData)stableInfoSig;
- (NSOperation)finishedOp;
- (NSString)peerID;
- (OTAccountSettings)accountSettings;
- (OTDeviceInformation)deviceInfo;
- (OTOperationDependencies)deps;
- (OTPrepareOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 deviceInfo:(id)a6 policyOverride:(id)a7 accountSettings:(id)a8 epoch:(unint64_t)a9;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (TPPolicyVersion)policyOverride;
- (unint64_t)epoch;
- (void)groupStart;
- (void)setAccountSettings:(id)a3;
- (void)setDeps:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setEpoch:(unint64_t)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPermanentInfo:(id)a3;
- (void)setPermanentInfoSig:(id)a3;
- (void)setPolicyOverride:(id)a3;
- (void)setStableInfo:(id)a3;
- (void)setStableInfoSig:(id)a3;
@end

@implementation OTPrepareOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_accountSettings, 0);
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

- (void)setFinishedOp:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 224, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 216, 1);
}

- (void)setAccountSettings:(id)a3
{
}

- (OTAccountSettings)accountSettings
{
  return (OTAccountSettings *)objc_getProperty(self, a2, 208, 1);
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

- (void)groupStart
{
  v3 = sub_10000B070("octagon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "preparing an identity", (uint8_t *)&buf, 2u);
  }

  id v4 = objc_alloc((Class)AAFAnalyticsEventSecurity);
  v5 = [(OTPrepareOperation *)self deps];
  v6 = [v5 activeAccount];
  v7 = [v6 altDSID];
  v8 = [(OTPrepareOperation *)self deps];
  v9 = [v8 flowID];
  v10 = [(OTPrepareOperation *)self deps];
  v11 = [v10 deviceSessionID];
  v12 = [(OTPrepareOperation *)self deps];
  LOBYTE(v55) = [v12 permittedToSendMetrics];
  id v72 = [v4 initWithKeychainCircleMetrics:0 altDSID:v7 flowID:v9 deviceSessionID:v11 eventName:kSecurityRTCEventNamePrepareIdentityInTPH testsAreEnabled:0 canSendMetrics:v55 category:kSecurityRTCEventCategoryAccountDataAccessRecovery];

  id v13 = objc_alloc_init((Class)NSOperation);
  [(OTPrepareOperation *)self setFinishedOp:v13];

  v14 = [(OTPrepareOperation *)self finishedOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v14];

  v15 = [(OTPrepareOperation *)self deps];
  v16 = [v15 activeAccount];
  v73 = [v16 altDSID];

  if (v73)
  {
    id v71 = v73;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v17 = [(OTPrepareOperation *)self deps];
    v18 = [v17 sosAdapter];
    unsigned int v19 = [v18 sosEnabled];

    if (!v19)
    {
      v63 = 0;
      v69 = 0;
LABEL_26:
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v83 = 0x3032000000;
      v84 = sub_10009D5C0;
      v85 = sub_10009D5D0;
      id v86 = 0;
      v36 = [(OTPrepareOperation *)self deps];
      v37 = [v36 stateHolder];
      id v77 = 0;
      v78[0] = _NSConcreteStackBlock;
      v78[1] = 3221225472;
      v78[2] = sub_10009D5D8;
      v78[3] = &unk_1002FA040;
      v78[4] = &buf;
      unsigned __int8 v38 = [v37 persistAccountChanges:v78 error:&v77];
      id v70 = v77;

      if (v70) {
        unsigned __int8 v39 = 0;
      }
      else {
        unsigned __int8 v39 = v38;
      }
      if ((v39 & 1) == 0)
      {
        v40 = sub_10000B070("SecError");
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v81 = 138412290;
          *(void *)&v81[4] = v70;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "octagon: failed to save 'attempted join' state: %@", v81, 0xCu);
        }
      }
      v41 = sub_10000B070("octagon");
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = [(OTPrepareOperation *)self accountSettings];
        *(_DWORD *)v81 = 138412290;
        *(void *)&v81[4] = v42;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "preparing identity with %@", v81, 0xCu);
      }
      v68 = [(OTPrepareOperation *)self deps];
      v62 = [v68 cuttlefishXPCWrapper];
      v67 = [(OTPrepareOperation *)self deps];
      v61 = [v67 activeAccount];
      unint64_t v57 = [(OTPrepareOperation *)self epoch];
      v66 = [(OTPrepareOperation *)self deviceInfo];
      v59 = [v66 machineID];
      v65 = +[NSUUID UUID];
      v58 = [v65 UUIDString];
      v64 = [(OTPrepareOperation *)self deviceInfo];
      v60 = [v64 modelID];
      v43 = [(OTPrepareOperation *)self deviceInfo];
      v44 = [v43 deviceName];
      v45 = [(OTPrepareOperation *)self deviceInfo];
      v46 = [v45 serialNumber];
      v47 = [(OTPrepareOperation *)self deviceInfo];
      v48 = [v47 osVersion];
      v49 = [(OTPrepareOperation *)self policyOverride];
      uint64_t v50 = *(void *)(*((void *)&buf + 1) + 40);
      v51 = [(OTPrepareOperation *)self accountSettings];
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_10009D63C;
      v74[3] = &unk_1002F8BB0;
      objc_copyWeak(&v76, &location);
      id v75 = v72;
      LODWORD(v56) = 3;
      objc_msgSend(v62, "prepareWithSpecificUser:epoch:machineID:bottleSalt:bottleID:modelID:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:setting:signingPrivKeyPersistentRef:encPrivKeyPersistentRef:reply:", v61, v57, v59, v71, v58, v60, v44, v46, v48, v49, 0, v56, v50, v51, v63,
        v69,
        v74);

      objc_destroyWeak(&v76);
      _Block_object_dispose(&buf, 8);

      objc_destroyWeak(&location);
      goto LABEL_36;
    }
    v20 = sub_10000B070("octagon-sos");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Investigating use of Octagon keys from SOS identity", (uint8_t *)&buf, 2u);
    }

    v21 = [(OTPrepareOperation *)self deps];
    v22 = [v21 sosAdapter];
    id v79 = 0;
    v23 = [v22 currentSOSSelf:&v79];
    id v24 = v79;

    if (!v23 || v24)
    {
      v34 = sub_10000B070("octagon-sos");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v24;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Failed to get the current SOS self: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      *(void *)&long long buf = 0;
      v25 = [v23 signingKey];
      [v25 _secKey];
      int v26 = SecKeyCopyPersistentRef();

      if (v26 || !(void)buf)
      {
        v35 = sub_10000B070("octagon-sos");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v81 = 67109120;
          *(_DWORD *)&v81[4] = v26;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Failed to get the persistent ref for our SOS signing key: %d", v81, 8u);
        }
      }
      else
      {
        *(void *)v81 = 0;
        v27 = [v23 encryptionKey];
        [v27 _secKey];
        int v28 = SecKeyCopyPersistentRef();

        if (!v28)
        {
          v69 = *(void **)v81;
          if (*(void *)v81)
          {
            v63 = (void *)buf;
LABEL_25:

            goto LABEL_26;
          }
        }
        v52 = sub_10000B070("octagon-sos");
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v87 = 67109120;
          int v88 = v28;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Failed to get the persistent ref for our SOS encryption key: %d", v87, 8u);
        }

        v53 = (const void *)buf;
        if ((void)buf)
        {
          *(void *)&long long buf = 0;
          CFRelease(v53);
        }
        v54 = *(const void **)v81;
        if (*(void *)v81)
        {
          *(void *)v81 = 0;
          CFRelease(v54);
          v63 = 0;
          v69 = 0;
          goto LABEL_25;
        }
      }
    }
    v63 = 0;
    v69 = 0;
    goto LABEL_25;
  }
  v29 = sub_10000B070("authkit");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = [(OTPrepareOperation *)self deps];
    v31 = [v30 activeAccount];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v31;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", (uint8_t *)&buf, 0xCu);
  }
  v32 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:59 description:@"No altDSID configured"];
  [(CKKSResultOperation *)self setError:v32];

  v33 = [(OTPrepareOperation *)self finishedOp];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v33];

  id v71 = [(CKKSResultOperation *)self error];
  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v72 success:0 error:v71];
LABEL_36:
}

- (OTPrepareOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 deviceInfo:(id)a6 policyOverride:(id)a7 accountSettings:(id)a8 epoch:(unint64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)OTPrepareOperation;
  unsigned int v19 = [(CKKSGroupOperation *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_deps, a3);
    objc_storeStrong((id *)&v20->_deviceInfo, a6);
    v20->_epoch = a9;
    objc_storeStrong((id *)&v20->_intendedState, a4);
    objc_storeStrong((id *)&v20->_nextState, a5);
    objc_storeStrong((id *)&v20->_policyOverride, a7);
    objc_storeStrong((id *)&v20->_accountSettings, a8);
  }

  return v20;
}

@end