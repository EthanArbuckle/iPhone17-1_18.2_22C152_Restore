@interface OTCheckHealthOperation
- (BOOL)checkIfPasscodeIsSetForDevice;
- (BOOL)repair;
- (BOOL)reportRateLimitingError;
- (BOOL)requiresEscrowCheck;
- (BOOL)skipRateLimitingCheck;
- (NSOperation)finishOp;
- (OTCheckHealthOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 deviceInfo:(id)a6 skipRateLimitedCheck:(BOOL)a7 reportRateLimitingError:(BOOL)a8 repair:(BOOL)a9;
- (OTDeviceInformation)deviceInfo;
- (OTOperationDependencies)deps;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (TrustedPeersHelperHealthCheckResult)results;
- (void)groupStart;
- (void)handleRepairSuggestions:(id)a3;
- (void)setDeps:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setRequiresEscrowCheck:(BOOL)a3;
- (void)setResults:(id)a3;
@end

@implementation OTCheckHealthOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_results + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deviceInfo + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);

  objc_storeStrong((id *)(&self->_requiresEscrowCheck + 3), 0);
}

- (void)setRequiresEscrowCheck:(BOOL)a3
{
  self->_requiresEscrowCheck = a3;
}

- (BOOL)requiresEscrowCheck
{
  return self->_requiresEscrowCheck;
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

- (void)setResults:(id)a3
{
}

- (TrustedPeersHelperHealthCheckResult)results
{
  return (TrustedPeersHelperHealthCheckResult *)objc_getProperty(self, a2, 158, 1);
}

- (BOOL)repair
{
  return self->_repair;
}

- (BOOL)reportRateLimitingError
{
  return self->_reportRateLimitingError;
}

- (BOOL)skipRateLimitingCheck
{
  return self->_skipRateLimitingCheck;
}

- (void)setDeviceInfo:(id)a3
{
}

- (OTDeviceInformation)deviceInfo
{
  return (OTDeviceInformation *)objc_getProperty(self, a2, 150, 1);
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

- (void)handleRepairSuggestions:(id)a3
{
  [(OTCheckHealthOperation *)self setResults:a3];
  v4 = [(OTCheckHealthOperation *)self results];
  unsigned int v5 = [v4 resetOctagon];

  if (v5)
  {
    v6 = sub_10000B070("octagon-health");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Resetting Octagon as per Cuttlefish request", buf, 2u);
    }

    CFStringRef v7 = @"HealthCheckReset";
  }
  else
  {
    v8 = [(OTCheckHealthOperation *)self results];
    unsigned int v9 = [v8 leaveTrust];

    if (!v9)
    {
      v11 = [(OTCheckHealthOperation *)self intendedState];
      [(OTCheckHealthOperation *)self setNextState:v11];

      goto LABEL_11;
    }
    v10 = sub_10000B070("octagon-health");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Leaving clique as per Cuttlefish request", v13, 2u);
    }

    CFStringRef v7 = @"HealthCheckLeaveClique";
  }
  [(OTCheckHealthOperation *)self setNextState:v7];
LABEL_11:
  v12 = [(OTCheckHealthOperation *)self finishOp];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v12];
}

- (void)groupStart
{
  v3 = sub_10000B070("octagon-health");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Beginning cuttlefish health checkup", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)NSOperation);
  [(OTCheckHealthOperation *)self setFinishOp:v4];

  unsigned int v5 = [(OTCheckHealthOperation *)self finishOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v5];

  unsigned __int8 v6 = [(OTCheckHealthOperation *)self skipRateLimitingCheck];
  CFStringRef v7 = sub_10000B070("octagon-health");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NOT running rate limiting checks!", buf, 2u);
    }
    goto LABEL_6;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "running rate limiting checks!", buf, 2u);
  }

  [(CKKSResultOperation *)self setError:0];
  v17 = [(OTCheckHealthOperation *)self deps];
  v18 = [v17 stateHolder];
  id v54 = 0;
  CFStringRef v7 = [v18 lastHealthCheckupDate:&v54];
  id v19 = v54;

  v20 = [(OTCheckHealthOperation *)self deps];
  v21 = [v20 lockStateTracker];
  LODWORD(v18) = [v21 isLockedError:v19];

  v22 = sub_10000B070("octagon-health");
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (!v18)
  {
    if (v23)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "last health check timestamp: %@", buf, 0xCu);
    }

    id v25 = objc_alloc_init((Class)NSDateComponents);
    if (SecIsInternalRelease()) {
      uint64_t v26 = -23;
    }
    else {
      uint64_t v26 = -72;
    }
    [v25 setHour:v26];
    v27 = +[NSDate date];
    v28 = +[NSCalendar currentCalendar];
    v50 = [v28 dateByAddingComponents:v25 toDate:v27 options:0];

    if (v7 && [v7 compare:v50] != (id)-1)
    {
      v29 = sub_10000B070("octagon-health");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v7;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Last update is within 3 days (%@); rate-limiting this operation",
          buf,
          0xCu);
      }

      id v30 = +[NSString stringWithFormat:@"Rate-limited the OTCheckHealthOperation:%@", v7];
      NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
      id v56 = v30;
      v31 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      v32 = +[NSError errorWithDomain:@"securityd" code:-67671 userInfo:v31];

      v33 = sub_10000B070("octagon-health");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v32;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "rate limited! %@", buf, 0xCu);
      }

      if ([(OTCheckHealthOperation *)self reportRateLimitingError])
      {
        [(CKKSResultOperation *)self setError:v32];
      }
      else
      {
        v45 = [(OTCheckHealthOperation *)self intendedState];
        [(OTCheckHealthOperation *)self setNextState:v45];
      }
      v46 = [(OTCheckHealthOperation *)self finishOp];
      [(CKKSGroupOperation *)self runBeforeGroupFinished:v46];

      goto LABEL_42;
    }
    v34 = sub_10000B070("octagon-health");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v7;
      __int16 v58 = 2112;
      v59 = v50;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Not rate-limiting: last updated %@ vs %@", buf, 0x16u);
    }

    v35 = [(OTCheckHealthOperation *)self deps];
    uint64_t v36 = [v35 stateHolder];
    id v53 = 0;
    unsigned __int8 v37 = [(id)v36 persistLastHealthCheck:v27 error:&v53];
    id v30 = v53;

    v38 = [(OTCheckHealthOperation *)self deps];
    v39 = [v38 lockStateTracker];
    LOBYTE(v36) = [v39 isLockedError:v30];

    if (v36)
    {
      v40 = sub_10000B070("octagon-health");
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
LABEL_41:

        v32 = [(OTCheckHealthOperation *)self finishOp];
        [(CKKSGroupOperation *)self runBeforeGroupFinished:v32];
LABEL_42:

        return;
      }
      *(_WORD *)buf = 0;
      v41 = "device is locked, not performing cuttlefish check";
      v42 = v40;
      uint32_t v43 = 2;
    }
    else
    {
      if (v30) {
        unsigned __int8 v44 = 0;
      }
      else {
        unsigned __int8 v44 = v37;
      }
      if (v44)
      {

LABEL_6:
        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, self);
        v49 = [(OTCheckHealthOperation *)self deps];
        v47 = [v49 cuttlefishXPCWrapper];
        v48 = [(OTCheckHealthOperation *)self deps];
        unsigned int v9 = [v48 activeAccount];
        BOOL v10 = [(OTCheckHealthOperation *)self checkIfPasscodeIsSetForDevice];
        BOOL v11 = [(OTCheckHealthOperation *)self repair];
        v12 = +[SecureBackup knownICDPFederations:0];
        v13 = [(OTCheckHealthOperation *)self deps];
        v14 = [v13 flowID];
        v15 = [(OTCheckHealthOperation *)self deps];
        v16 = [v15 deviceSessionID];
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = sub_100051C44;
        v51[3] = &unk_1002F8398;
        objc_copyWeak(&v52, (id *)buf);
        [v47 requestHealthCheckWithSpecificUser:v9 requiresEscrowCheck:v10 repair:v11 knownFederations:v12 flowID:v14 deviceSessionID:v16 reply:v51];

        objc_destroyWeak(&v52);
        objc_destroyWeak((id *)buf);
        return;
      }
      v40 = sub_10000B070("SecError");
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_41;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v30;
      v41 = "octagon-health: failed to persist last health check value:%@";
      v42 = v40;
      uint32_t v43 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, v41, buf, v43);
    goto LABEL_41;
  }
  if (v23)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "device is locked, not performing cuttlefish check", buf, 2u);
  }

  v24 = [(OTCheckHealthOperation *)self finishOp];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v24];
}

- (BOOL)checkIfPasscodeIsSetForDevice
{
  __int16 v15 = -21846;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v13 = v2;
  long long v14 = v2;
  long long v11 = v2;
  long long v12 = v2;
  int v3 = sub_10001BBB4();
  if (v3)
  {
    BOOL v4 = v3;
    unsigned int v5 = sub_10000B070("SecError");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 67109120;
      BOOL v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "octagon-health: aks_get_device_state failed with: %d", (uint8_t *)&v9, 8u);
    }

    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = DWORD1(v11) != 3;
  }
  CFStringRef v7 = sub_10000B070("octagon-health");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 67109120;
    BOOL v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "checkIfPasscodeIsSetForDevice is %{BOOL}d", (uint8_t *)&v9, 8u);
  }

  return v6;
}

- (OTCheckHealthOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 deviceInfo:(id)a6 skipRateLimitedCheck:(BOOL)a7 reportRateLimitingError:(BOOL)a8 repair:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v22.receiver = self;
  v22.super_class = (Class)OTCheckHealthOperation;
  v18 = [(CKKSGroupOperation *)&v22 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)(v18 + 166), a3);
    objc_storeStrong((id *)(v19 + 134), a4);
    objc_storeStrong((id *)(v19 + 142), a5);
    v20 = *(void **)(v19 + 158);
    *(void *)(v19 + 158) = 0;

    v19[128] = a7;
    v19[129] = a8;
    v19[130] = a9;
  }

  return (OTCheckHealthOperation *)v19;
}

@end