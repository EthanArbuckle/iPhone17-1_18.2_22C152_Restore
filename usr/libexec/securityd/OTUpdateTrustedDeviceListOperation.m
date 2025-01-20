@interface OTUpdateTrustedDeviceListOperation
- (BOOL)logForUpgrade;
- (NSOperation)finishedOp;
- (OTOperationDependencies)deps;
- (OTUpdateTrustedDeviceListOperation)initWithDependencies:(id)a3 intendedState:(id)a4 listUpdatesState:(id)a5 errorState:(id)a6 retryFlag:(id)a7;
- (OctagonFlagString)retryFlag;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (OctagonStateString)stateIfListUpdates;
- (void)afterAuthKitFetch:(id)a3 userInitiatedRemovals:(id)a4 evictedRemovals:(id)a5 unknownReasonRemovals:(id)a6 trustedDeviceHash:(id)a7 deletedDeviceHash:(id)a8 trustedDevicesUpdateTimestamp:(id)a9 accountIsDemo:(BOOL)a10 version:(id)a11;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setLogForUpgrade:(BOOL)a3;
- (void)setNextState:(id)a3;
- (void)setRetryFlag:(id)a3;
- (void)setStateIfListUpdates:(id)a3;
@end

@implementation OTUpdateTrustedDeviceListOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_retryFlag + 6), 0);
  objc_storeStrong((id *)((char *)&self->_stateIfListUpdates + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);

  objc_storeStrong((id *)(&self->_logForUpgrade + 6), 0);
}

- (void)setFinishedOp:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 174, 1);
}

- (void)setRetryFlag:(id)a3
{
}

- (OctagonFlagString)retryFlag
{
  return (OctagonFlagString *)objc_getProperty(self, a2, 166, 1);
}

- (void)setStateIfListUpdates:(id)a3
{
}

- (OctagonStateString)stateIfListUpdates
{
  return (OctagonStateString *)objc_getProperty(self, a2, 158, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 150, 1);
}

- (void)setLogForUpgrade:(BOOL)a3
{
  self->_logForUpgrade = a3;
}

- (BOOL)logForUpgrade
{
  return self->_logForUpgrade;
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 142, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134, 1);
}

- (void)afterAuthKitFetch:(id)a3 userInitiatedRemovals:(id)a4 evictedRemovals:(id)a5 unknownReasonRemovals:(id)a6 trustedDeviceHash:(id)a7 deletedDeviceHash:(id)a8 trustedDevicesUpdateTimestamp:(id)a9 accountIsDemo:(BOOL)a10 version:(id)a11
{
  id v44 = a3;
  id v43 = a4;
  id v42 = a5;
  id v37 = a6;
  id v41 = a7;
  id v36 = a8;
  id v40 = a9;
  id v35 = a11;
  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  v17 = [(OTUpdateTrustedDeviceListOperation *)self deps];
  v18 = [v17 deviceInformationAdapter];
  unsigned int v19 = [v18 isMachineIDOverridden];

  v20 = [(OTUpdateTrustedDeviceListOperation *)self deps];
  v34 = [v20 cuttlefishXPCWrapper];
  v21 = [(OTUpdateTrustedDeviceListOperation *)self deps];
  v33 = [v21 activeAccount];
  v22 = [(OTUpdateTrustedDeviceListOperation *)self deps];
  v23 = [v22 flowID];
  v39 = [(OTUpdateTrustedDeviceListOperation *)self deps];
  v24 = [v39 deviceSessionID];
  v38 = [(OTUpdateTrustedDeviceListOperation *)self deps];
  unsigned __int8 v25 = [v38 permittedToSendMetrics];
  v26 = [(OTUpdateTrustedDeviceListOperation *)self deps];
  v27 = [v26 activeAccount];
  v28 = [v27 altDSID];
  v32 = v21;
  uint64_t v29 = (v19 | a10) ^ 1;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000876C4;
  v45[3] = &unk_1002F8900;
  objc_copyWeak(&v47, location);
  id v30 = v35;
  id v46 = v30;
  LOBYTE(v31) = v25;
  [v34 setAllowedMachineIDsWithSpecificUser:v33 allowedMachineIDs:v44 userInitiatedRemovals:v43 evictedRemovals:v42 unknownReasonRemovals:v37 honorIDMSListChanges:v29 version:v30 flowID:v23 deviceSessionID:v24 canSendMetrics:v31 altDSID:v28 trustedDeviceHash:v41 deletedDeviceHash:v36 trustedDevicesUpdateTimestamp:v40 reply:v45];

  objc_destroyWeak(&v47);
  objc_destroyWeak(location);
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = sub_10000B070("octagon-authkit");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Attempting to update trusted device list", buf, 2u);
  }

  id v4 = objc_alloc((Class)AAFAnalyticsEventSecurity);
  v5 = [(OTUpdateTrustedDeviceListOperation *)self deps];
  v6 = [v5 activeAccount];
  v7 = [v6 altDSID];
  v8 = [(OTUpdateTrustedDeviceListOperation *)self deps];
  v9 = [v8 flowID];
  v10 = [(OTUpdateTrustedDeviceListOperation *)self deps];
  v11 = [v10 deviceSessionID];
  v12 = [(OTUpdateTrustedDeviceListOperation *)self deps];
  LOBYTE(v34) = [v12 permittedToSendMetrics];
  id v13 = [v4 initWithKeychainCircleMetrics:0 altDSID:v7 flowID:v9 deviceSessionID:v11 eventName:kSecurityRTCEventNameUpdateTDL testsAreEnabled:0 canSendMetrics:v34 category:kSecurityRTCEventCategoryAccountDataAccessRecovery];

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100087E0C;
  v40[3] = &unk_100306AD0;
  objc_copyWeak(&v42, &location);
  id v35 = v13;
  id v41 = v35;
  v14 = +[NSBlockOperation blockOperationWithBlock:v40];
  [(OTUpdateTrustedDeviceListOperation *)self setFinishedOp:v14];

  v15 = [(OTUpdateTrustedDeviceListOperation *)self finishedOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v15];

  v16 = [(OTUpdateTrustedDeviceListOperation *)self deps];
  v17 = [v16 activeAccount];
  v18 = [v17 altDSID];

  if (v18)
  {
    unsigned int v19 = [(OTUpdateTrustedDeviceListOperation *)self deps];
    v20 = [v19 authKitAdapter];
    id v39 = 0;
    unsigned __int8 v21 = [v20 accountIsDemoAccountByAltDSID:v18 error:&v39];
    id v22 = v39;

    if (v22)
    {
      v23 = sub_10000B070("SecError");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "octagon-authkit: failed to fetch demo account flag: %@", buf, 0xCu);
      }
    }
    v24 = [(OTUpdateTrustedDeviceListOperation *)self deps];
    unsigned __int8 v25 = [v24 authKitAdapter];
    v26 = [(OTUpdateTrustedDeviceListOperation *)self deps];
    v27 = [v26 flowID];
    v28 = [(OTUpdateTrustedDeviceListOperation *)self deps];
    uint64_t v29 = [v28 deviceSessionID];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10008815C;
    v36[3] = &unk_1002F88D8;
    objc_copyWeak(&v37, &location);
    unsigned __int8 v38 = v21;
    [v25 fetchCurrentDeviceListByAltDSID:v18 flowID:v27 deviceSessionID:v29 reply:v36];

    objc_destroyWeak(&v37);
  }
  else
  {
    id v30 = sub_10000B070("authkit");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = [(OTUpdateTrustedDeviceListOperation *)self deps];
      v32 = [v31 activeAccount];
      *(_DWORD *)buf = 138412290;
      id v45 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);
    }
    v33 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:59 description:@"No altDSID configured"];
    [(CKKSResultOperation *)self setError:v33];

    id v22 = [(OTUpdateTrustedDeviceListOperation *)self finishedOp];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v22];
  }

  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);
}

- (OTUpdateTrustedDeviceListOperation)initWithDependencies:(id)a3 intendedState:(id)a4 listUpdatesState:(id)a5 errorState:(id)a6 retryFlag:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)OTUpdateTrustedDeviceListOperation;
  v17 = [(CKKSGroupOperation *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 150), a3);
    objc_storeStrong((id *)(v18 + 142), a4);
    objc_storeStrong((id *)(v18 + 134), a6);
    objc_storeStrong((id *)(v18 + 158), a5);
    objc_storeStrong((id *)(v18 + 166), a7);
  }

  return (OTUpdateTrustedDeviceListOperation *)v18;
}

@end