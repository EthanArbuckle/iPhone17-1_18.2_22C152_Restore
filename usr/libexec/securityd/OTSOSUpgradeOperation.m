@interface OTSOSUpgradeOperation
- (AAFAnalyticsEventSecurity)eventS;
- (NSArray)peerPreapprovedSPKIs;
- (NSOperation)finishedOp;
- (OTDeviceInformation)deviceInfo;
- (OTOperationDependencies)deps;
- (OTSOSUpgradeOperation)initWithDependencies:(id)a3 intendedState:(id)a4 ckksConflictState:(id)a5 errorState:(id)a6 deviceInfo:(id)a7 policyOverride:(id)a8;
- (OTUpdateTrustedDeviceListOperation)updateOp;
- (OctagonStateString)ckksConflictState;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (TPPolicyVersion)policyOverride;
- (id)persistentKeyRef:(__SecKey *)a3 error:(id *)a4;
- (void)afterPreflight;
- (void)afterPrepare;
- (void)afterSuccessfulAllowList;
- (void)afterUpdate;
- (void)groupStart;
- (void)handlePrepareErrors:(id)a3 nextExpectedState:(id)a4;
- (void)proceedWithKeys:(id)a3 pendingTLKShares:(id)a4;
- (void)requestSilentEscrowUpdate;
- (void)setCkksConflictState:(id)a3;
- (void)setDeps:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setEventS:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setPeerPreapprovedSPKIs:(id)a3;
- (void)setUpdateOp:(id)a3;
@end

@implementation OTSOSUpgradeOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPreapprovedSPKIs, 0);
  objc_storeStrong((id *)&self->_updateOp, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_eventS, 0);
  objc_storeStrong((id *)&self->_ckksConflictState, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_policyOverride, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);

  objc_storeStrong((id *)&self->_nextState, 0);
}

- (void)setPeerPreapprovedSPKIs:(id)a3
{
}

- (NSArray)peerPreapprovedSPKIs
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setUpdateOp:(id)a3
{
}

- (OTUpdateTrustedDeviceListOperation)updateOp
{
  return (OTUpdateTrustedDeviceListOperation *)objc_getProperty(self, a2, 192, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 184, 1);
}

- (void)setEventS:(id)a3
{
}

- (AAFAnalyticsEventSecurity)eventS
{
  return self->_eventS;
}

- (void)setCkksConflictState:(id)a3
{
}

- (OctagonStateString)ckksConflictState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setDeviceInfo:(id)a3
{
}

- (OTDeviceInformation)deviceInfo
{
  return (OTDeviceInformation *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 152, 1);
}

- (TPPolicyVersion)policyOverride
{
  return (TPPolicyVersion *)objc_getProperty(self, a2, 144, 1);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)proceedWithKeys:(id)a3 pendingTLKShares:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = sub_10000B070("octagon-sos");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [v6 count];
    v10 = [(OTSOSUpgradeOperation *)self peerPreapprovedSPKIs];
    unsigned int v11 = [v10 count];
    *(_DWORD *)buf = 67109376;
    unsigned int v21 = v9;
    __int16 v22 = 1024;
    unsigned int v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Beginning SOS upgrade with %d key sets and %d SOS peers", buf, 0xEu);
  }
  v12 = [(OTSOSUpgradeOperation *)self deps];
  v13 = [v12 cuttlefishXPCWrapper];
  v14 = [(OTSOSUpgradeOperation *)self deps];
  v15 = [v14 activeAccount];
  v16 = [(OTSOSUpgradeOperation *)self peerPreapprovedSPKIs];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100126860;
  v17[3] = &unk_1002FAF10;
  objc_copyWeak(&v18, &location);
  [v13 attemptPreapprovedJoinWithSpecificUser:v15 ckksKeys:v6 tlkShares:v7 preapprovedKeys:v16 reply:v17];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)afterSuccessfulAllowList
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [OTFetchCKKSKeysOperation alloc];
  v4 = [(OTSOSUpgradeOperation *)self deps];
  v5 = [(OTFetchCKKSKeysOperation *)v3 initWithDependencies:v4 refetchNeeded:0];

  [(CKKSGroupOperation *)self runBeforeGroupFinished:v5];
  id v6 = sub_10000B070("octagon-sos");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fetching keys from CKKS", buf, 2u);
  }

  unsigned int v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  unsigned int v11 = sub_100126F0C;
  v12 = &unk_100306AD0;
  objc_copyWeak(&v14, &location);
  id v7 = v5;
  v13 = v7;
  v8 = +[CKKSResultOperation named:@"sos-upgrade-with-keys" withBlock:&v9];
  [v8 addDependency:v7, v9, v10, v11, v12];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v8];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)requestSilentEscrowUpdate
{
  v2 = [(OTSOSUpgradeOperation *)self deps];
  id v10 = 0;
  v3 = [objc_msgSend(objc_msgSend(v2, "escrowRequestClass"), "request:", &v10];
  v4 = v10;

  if (!v3 || v4)
  {
    id v6 = sub_10000B070("octagon-sos");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      v8 = "Unable to acquire a EscrowRequest object: %@";
      goto LABEL_8;
    }
LABEL_9:

    goto LABEL_10;
  }
  id v9 = 0;
  [v3 triggerEscrowUpdate:@"octagon-sos" error:&v9];
  v4 = v9;
  v5 = +[CKKSAnalytics logger];
  [v5 logResultForEvent:@"OctagonEventUpgradeSilentEscrow" hardFailure:1 result:v4];

  id v6 = sub_10000B070("octagon-sos");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      v8 = "Unable to request silent escrow update: %@";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requested silent escrow update", buf, 2u);
  }
  v4 = v6;
LABEL_10:
}

- (void)afterUpdate
{
  v3 = [(OTSOSUpgradeOperation *)self updateOp];
  v4 = [v3 error];

  if (v4)
  {
    v5 = [(OTSOSUpgradeOperation *)self updateOp];
    id v6 = [v5 error];
    BOOL v7 = [(OTSOSUpgradeOperation *)self nextState];
    [(OTSOSUpgradeOperation *)self handlePrepareErrors:v6 nextExpectedState:v7];

    id v9 = [(OTSOSUpgradeOperation *)self finishedOp];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v9];
  }
  else
  {
    v8 = sub_10000B070("octagon-sos");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully saved machineID allow-list", buf, 2u);
    }

    [(OTSOSUpgradeOperation *)self afterSuccessfulAllowList];
  }
}

- (void)handlePrepareErrors:(id)a3 nextExpectedState:(id)a4
{
  id v6 = a3;
  BOOL v7 = (__CFString *)a4;
  v8 = sub_10000B070("octagon-sos");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "handling prepare error: %@", (uint8_t *)&v13, 0xCu);
  }

  id v9 = [(OTSOSUpgradeOperation *)self deps];
  id v10 = [v9 lockStateTracker];
  unsigned int v11 = [v10 isLockedError:v6];

  if (v11) {
    CFStringRef v12 = @"WaitForUnlock";
  }
  else {
    CFStringRef v12 = v7;
  }
  [(OTSOSUpgradeOperation *)self setNextState:v12];
  [(CKKSResultOperation *)self setError:v6];
}

- (void)afterPreflight
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [OTUpdateTrustedDeviceListOperation alloc];
  v4 = [(OTSOSUpgradeOperation *)self deps];
  v5 = [(OTUpdateTrustedDeviceListOperation *)v3 initWithDependencies:v4 intendedState:@"Ready" listUpdatesState:@"Ready" errorState:@"Error" retryFlag:0];
  [(OTSOSUpgradeOperation *)self setUpdateOp:v5];

  id v6 = [(OTSOSUpgradeOperation *)self updateOp];
  [v6 setLogForUpgrade:1];

  BOOL v7 = [(OTSOSUpgradeOperation *)self updateOp];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v7];

  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  CFStringRef v12 = sub_100127568;
  int v13 = &unk_1003077A0;
  objc_copyWeak(&v14, &location);
  v8 = +[CKKSResultOperation named:@"after-update" withBlock:&v10];
  id v9 = [(OTSOSUpgradeOperation *)self updateOp];
  [v8 addDependency:v9];

  [(CKKSGroupOperation *)self runBeforeGroupFinished:v8];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)afterPrepare
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [(OTSOSUpgradeOperation *)self deps];
  v4 = [v3 cuttlefishXPCWrapper];
  v5 = [(OTSOSUpgradeOperation *)self deps];
  id v6 = [v5 activeAccount];
  BOOL v7 = [(OTSOSUpgradeOperation *)self peerPreapprovedSPKIs];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001276EC;
  v8[3] = &unk_1002FAEC0;
  objc_copyWeak(&v9, &location);
  [v4 preflightPreapprovedJoinWithSpecificUser:v6 preapprovedKeys:v7 reply:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)AAFAnalyticsEventSecurity);
  v4 = [(OTSOSUpgradeOperation *)self deps];
  uint64_t v5 = [v4 activeAccount];
  id v6 = [(id)v5 altDSID];
  BOOL v7 = [(OTSOSUpgradeOperation *)self deps];
  v8 = [v7 flowID];
  id v9 = [(OTSOSUpgradeOperation *)self deps];
  id v10 = [v9 deviceSessionID];
  uint64_t v11 = [(OTSOSUpgradeOperation *)self deps];
  LOBYTE(v76) = [v11 permittedToSendMetrics];
  id v12 = [v3 initWithKeychainCircleMetrics:0 altDSID:v6 flowID:v8 deviceSessionID:v10 eventName:kSecurityRTCEventNamePreApprovedJoin testsAreEnabled:0 canSendMetrics:v76 category:kSecurityRTCEventCategoryAccountDataAccessRecovery];
  [(OTSOSUpgradeOperation *)self setEventS:v12];

  int v13 = [(OTSOSUpgradeOperation *)self deps];
  id v14 = [v13 sosAdapter];
  LOBYTE(v5) = [v14 sosEnabled];

  v15 = sub_10000B070("octagon-sos");
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Attempting SOS upgrade", buf, 2u);
    }

    v17 = [(OTSOSUpgradeOperation *)self deps];
    id v18 = [v17 sosAdapter];
    id v112 = 0;
    unsigned int v19 = [v18 circleStatus:&v112];
    v20 = (__CFString *)v112;

    if (v20 || v19 == -1)
    {
      v29 = sub_10000B070("octagon-sos");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v115 = v20;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Error fetching circle status: %@", buf, 0xCu);
      }

      [(OTSOSUpgradeOperation *)self setNextState:@"BecomeUntrusted"];
      v24 = [(OTSOSUpgradeOperation *)self eventS];
      v30 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:71 description:@"Device not in SOS circle"];
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v24 success:0 error:v30];
    }
    else
    {
      unsigned int v21 = [(OTSOSUpgradeOperation *)self deps];
      __int16 v22 = [v21 stateHolder];
      id v111 = 0;
      unsigned __int8 v23 = [v22 persistAccountChanges:&stru_1002FAE70 error:&v111];
      v24 = (__CFString *)v111;

      if (v24) {
        unsigned __int8 v25 = 0;
      }
      else {
        unsigned __int8 v25 = v23;
      }
      if ((v25 & 1) == 0)
      {
        v26 = sub_10000B070("SecError");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v115 = v24;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "octagon: failed to save 'attempted join' state: %@", buf, 0xCu);
        }
      }
      if (v19)
      {
        v27 = sub_10000B070("octagon-sos");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          if (v19 + 1 > 4) {
            CFStringRef v28 = @"kSOSCCError";
          }
          else {
            CFStringRef v28 = off_1003079C8[v19 + 1];
          }
          *(_DWORD *)buf = 138412290;
          CFStringRef v115 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Device is not in SOS circle (state: %@), quitting SOS upgrade", buf, 0xCu);
        }

        [(OTSOSUpgradeOperation *)self setNextState:@"BecomeUntrusted"];
        v30 = [(OTSOSUpgradeOperation *)self eventS];
        v34 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:71 description:@"Device not in SOS circle"];
        +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v30 success:0 error:v34];
        v20 = 0;
      }
      else
      {
        v31 = [(OTSOSUpgradeOperation *)self deps];
        v32 = [v31 sosAdapter];
        id v110 = 0;
        v30 = [v32 currentSOSSelf:&v110];
        v20 = (__CFString *)v110;

        if (!v30 || v20)
        {
          v66 = sub_10000B070("octagon-sos");
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v115 = v20;
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Failed to get the current SOS self: %@", buf, 0xCu);
          }

          [(OTSOSUpgradeOperation *)self handlePrepareErrors:v20 nextExpectedState:@"BecomeUntrusted"];
          v34 = [(OTSOSUpgradeOperation *)self eventS];
          +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v34 success:0 error:v20];
        }
        else
        {
          v33 = [v30 signingKey];
          id v109 = 0;
          v34 = -[OTSOSUpgradeOperation persistentKeyRef:error:](self, "persistentKeyRef:error:", [v33 _secKey], &v109);
          v20 = (__CFString *)v109;

          if (v34)
          {
            v35 = [v30 encryptionKey];
            v108 = v20;
            v36 = -[OTSOSUpgradeOperation persistentKeyRef:error:](self, "persistentKeyRef:error:", [v35 _secKey], &v108);
            CFStringRef v100 = v108;

            if (v36)
            {
              v106[0] = _NSConcreteStackBlock;
              v106[1] = 3221225472;
              v106[2] = sub_10012896C;
              v106[3] = &unk_1003077A0;
              objc_copyWeak(&v107, &location);
              v37 = +[NSBlockOperation blockOperationWithBlock:v106];
              [(OTSOSUpgradeOperation *)self setFinishedOp:v37];

              v38 = [(OTSOSUpgradeOperation *)self finishedOp];
              [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v38];

              v39 = [(OTSOSUpgradeOperation *)self deps];
              v40 = [v39 stateHolder];
              id v105 = 0;
              v98 = [v40 loadOrCreateAccountMetadata:&v105];
              v99 = (__CFString *)v105;

              if (v98)
              {
                uint64_t v96 = [v98 parsedSecureElementIdentity];
                v41 = sub_10000B070("octagon-sos");
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Fetching trusted peers from SOS", buf, 2u);
                }

                v42 = [(OTSOSUpgradeOperation *)self deps];
                v43 = [v42 sosAdapter];
                id v104 = 0;
                v44 = +[OTSOSAdapterHelpers peerPublicSigningKeySPKIsForCircle:v43 error:&v104];
                v97 = (__CFString *)v104;
                [(OTSOSUpgradeOperation *)self setPeerPreapprovedSPKIs:v44];

                v45 = [(OTSOSUpgradeOperation *)self peerPreapprovedSPKIs];

                v46 = sub_10000B070("octagon-sos");
                BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
                if (v45)
                {
                  if (v47)
                  {
                    v48 = [(OTSOSUpgradeOperation *)self peerPreapprovedSPKIs];
                    *(_DWORD *)buf = 138412290;
                    CFStringRef v115 = v48;
                    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "SOS preapproved keys are %@", buf, 0xCu);
                  }
                  v49 = [(OTSOSUpgradeOperation *)self deps];
                  v50 = [v49 activeAccount];
                  v51 = [v50 altDSID];

                  if (v51)
                  {
                    id v87 = v51;
                    v52 = [(OTSOSUpgradeOperation *)self deps];
                    v53 = [v52 sosAdapter];
                    id v103 = 0;
                    unsigned int v80 = [v53 safariViewSyncingEnabled:&v103];
                    v95 = (__CFString *)v103;

                    if (v95)
                    {
                      v54 = sub_10000B070("octagon-sos");
                      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        CFStringRef v115 = v95;
                        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Unable to check safari view status: %@", buf, 0xCu);
                      }
                    }
                    v55 = sub_10000B070("octagon-sos");
                    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                    {
                      CFStringRef v56 = @"disabled";
                      if (v80) {
                        CFStringRef v56 = @"enabled";
                      }
                      *(_DWORD *)buf = 138412290;
                      CFStringRef v115 = v56;
                      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Safari view is: %@", buf, 0xCu);
                    }

                    v57 = [(OTSOSUpgradeOperation *)self deps];
                    v85 = [v57 cuttlefishXPCWrapper];
                    v58 = [(OTSOSUpgradeOperation *)self deps];
                    v86 = [v58 activeAccount];
                    v94 = [(OTSOSUpgradeOperation *)self deviceInfo];
                    id v79 = [v94 epoch];
                    v93 = [(OTSOSUpgradeOperation *)self deviceInfo];
                    v83 = [v93 machineID];
                    v92 = +[NSUUID UUID];
                    v82 = [v92 UUIDString];
                    v91 = [(OTSOSUpgradeOperation *)self deviceInfo];
                    v84 = [v91 modelID];
                    v90 = [(OTSOSUpgradeOperation *)self deviceInfo];
                    v81 = [v90 deviceName];
                    v89 = self;
                    v88 = [v89 deviceInfo];
                    v59 = [v88 serialNumber];
                    v60 = [(OTSOSUpgradeOperation *)self deviceInfo];
                    v61 = [v60 osVersion];
                    v62 = [(OTSOSUpgradeOperation *)self policyOverride];
                    v78 = v57;
                    if (v80) {
                      int v63 = 2;
                    }
                    else {
                      int v63 = 1;
                    }
                    v101[0] = _NSConcreteStackBlock;
                    v101[1] = 3221225472;
                    v101[2] = sub_100128BD4;
                    v101[3] = &unk_1002FAE98;
                    objc_copyWeak(&v102, &location);
                    LODWORD(v77) = v63;
                    objc_msgSend(v85, "prepareWithSpecificUser:epoch:machineID:bottleSalt:bottleID:modelID:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:setting:signingPrivKeyPersistentRef:encPrivKeyPersistentRef:reply:", v86, v79, v83, v87, v82, v84, v81, v59, v61, v62, 0, v77, v96, 0, v34,
                      v36,
                      v101);

                    objc_destroyWeak(&v102);
                    v64 = v87;
                    v65 = v87;
                  }
                  else
                  {
                    v72 = sub_10000B070("authkit");
                    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                    {
                      v73 = [(OTSOSUpgradeOperation *)self deps];
                      v74 = [v73 activeAccount];
                      *(_DWORD *)buf = 138412290;
                      CFStringRef v115 = v74;
                      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);
                    }
                    v75 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:59 description:@"No altDSID configured"];
                    [(CKKSResultOperation *)self setError:v75];

                    v64 = [(OTSOSUpgradeOperation *)self finishedOp];
                    [(CKKSGroupOperation *)self runBeforeGroupFinished:v64];
                    v65 = 0;
                  }
                }
                else
                {
                  if (v47)
                  {
                    *(_DWORD *)buf = 138412290;
                    CFStringRef v115 = v97;
                    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Unable to fetch SOS preapproved keys: %@", buf, 0xCu);
                  }

                  [(CKKSResultOperation *)self setError:v97];
                  v65 = [(OTSOSUpgradeOperation *)self finishedOp];
                  [(CKKSGroupOperation *)self runBeforeGroupFinished:v65];
                }

                v71 = (void *)v96;
              }
              else
              {
                if (!v99)
                {
                  v99 = +[NSError errorWithDomain:kCFErrorDomainOSStatus code:-67671 userInfo:0];
                }
                v70 = sub_10000B070("SecError");
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  CFStringRef v115 = v99;
                  _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "failed to retrieve account object: %@", buf, 0xCu);
                }

                [(CKKSResultOperation *)self setError:v99];
                v71 = [(OTSOSUpgradeOperation *)self finishedOp];
                [(CKKSGroupOperation *)self runBeforeGroupFinished:v71];
              }

              objc_destroyWeak(&v107);
            }
            else
            {
              v68 = sub_10000B070("octagon-sos");
              if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                CFStringRef v115 = v100;
                _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Failed to get the persistent ref for our SOS encryption key: %@", buf, 0xCu);
              }

              [(OTSOSUpgradeOperation *)self handlePrepareErrors:v100 nextExpectedState:@"BecomeUntrusted"];
              v69 = [(OTSOSUpgradeOperation *)self eventS];
              +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v69 success:0 error:v100];

              v36 = 0;
            }
            v20 = (__CFString *)v100;
          }
          else
          {
            v67 = sub_10000B070("octagon-sos");
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v115 = v20;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Failed to get the persistent ref for our SOS signing key: %@", buf, 0xCu);
            }

            [(OTSOSUpgradeOperation *)self handlePrepareErrors:v20 nextExpectedState:@"BecomeUntrusted"];
            v36 = [(OTSOSUpgradeOperation *)self eventS];
            +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v36 success:0 error:v20];
          }
        }
      }
    }
  }
  else
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SOS not enabled on this platform?", buf, 2u);
    }

    [(OTSOSUpgradeOperation *)self setNextState:@"BecomeUntrusted"];
    v20 = [(OTSOSUpgradeOperation *)self eventS];
    v24 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:70 description:@"SOS not enabled on this platform"];
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v20 success:0 error:v24];
  }

  objc_destroyWeak(&location);
}

- (id)persistentKeyRef:(__SecKey *)a3 error:(id *)a4
{
  int v5 = SecKeyCopyPersistentRef();
  if (v5 && a4)
  {
    *a4 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v5 userInfo:0];
  }

  return 0;
}

- (OTSOSUpgradeOperation)initWithDependencies:(id)a3 intendedState:(id)a4 ckksConflictState:(id)a5 errorState:(id)a6 deviceInfo:(id)a7 policyOverride:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)OTSOSUpgradeOperation;
  id v18 = [(CKKSGroupOperation *)&v24 init];
  unsigned int v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_deps, a3);
    objc_storeStrong((id *)&v19->_intendedState, a4);
    objc_storeStrong((id *)&v19->_nextState, a6);
    objc_storeStrong((id *)&v19->_ckksConflictState, a5);
    objc_storeStrong((id *)&v19->_deviceInfo, a7);
    objc_storeStrong((id *)&v19->_policyOverride, a8);
  }

  return v19;
}

@end