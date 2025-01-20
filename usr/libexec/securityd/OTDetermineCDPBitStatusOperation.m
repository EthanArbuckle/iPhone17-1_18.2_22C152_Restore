@interface OTDetermineCDPBitStatusOperation
- (OTDetermineCDPBitStatusOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OTOperationDependencies)deps;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation OTDetermineCDPBitStatusOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
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
  v3 = sub_10000B070("octagon-cdp-status");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking CDP status", (uint8_t *)&buf, 2u);
  }

  v4 = [(OTDetermineCDPBitStatusOperation *)self deps];
  v5 = [v4 stateHolder];
  id v32 = 0;
  v6 = [v5 loadOrCreateAccountMetadata:&v32];
  id v7 = v32;

  if (v7)
  {
    v8 = [(OTDetermineCDPBitStatusOperation *)self deps];
    v9 = [v8 lockStateTracker];
    unsigned int v10 = [v9 isLockedError:v7];

    v11 = sub_10000B070("octagon-cdp-status");
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Device is locked! restarting on unlock", (uint8_t *)&buf, 2u);
      }

      [(OTDetermineCDPBitStatusOperation *)self setNextState:@"WaitForClassCUnlock"];
      [(CKKSResultOperation *)self setError:v7];
    }
    else
    {
      if (v12)
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to load account metadata: %@", (uint8_t *)&buf, 0xCu);
      }

      [(CKKSResultOperation *)self setError:v7];
    }
  }
  else
  {
    v13 = sub_10000B070("octagon-cdp-status");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v6 cdpState];
      if (v14 >= 3)
      {
        v15 = +[NSString stringWithFormat:@"(unknown: %i)", v14];
      }
      else
      {
        v15 = *(&off_1002F86C0 + v14);
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CDP is %@", (uint8_t *)&buf, 0xCu);
    }
    if ([v6 cdpState] == 2)
    {
      v16 = [(OTDetermineCDPBitStatusOperation *)self intendedState];
      [(OTDetermineCDPBitStatusOperation *)self setNextState:v16];
    }
    else
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v36 = 0x2020000000;
      int v37 = 0;
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v17 = [(OTDetermineCDPBitStatusOperation *)self deps];
      v18 = [v17 cuttlefishXPCWrapper];
      v19 = [(OTDetermineCDPBitStatusOperation *)self deps];
      v20 = [v19 activeAccount];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10006E7B0;
      v29[3] = &unk_1002F86A0;
      objc_copyWeak(&v30, &location);
      v29[4] = &buf;
      [v18 trustStatusWithSpecificUser:v20 reply:v29];

      unsigned int v21 = [v6 cdpState];
      if (v21 != *(_DWORD *)(*((void *)&buf + 1) + 24))
      {
        v22 = [(OTDetermineCDPBitStatusOperation *)self deps];
        v23 = [v22 stateHolder];
        id v27 = 0;
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10006EBBC;
        v28[3] = &unk_1002FA040;
        v28[4] = &buf;
        [v23 persistAccountChanges:v28 error:&v27];
        id v24 = v27;

        if (v24)
        {
          v25 = sub_10000B070("octagon-cdp-status");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v33 = 138412290;
            id v34 = v24;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Failed to load account metadata: %@", v33, 0xCu);
          }

          [(CKKSResultOperation *)self setError:v24];
        }

        unsigned int v21 = *(_DWORD *)(*((void *)&buf + 1) + 24);
      }
      if (v21 == 2)
      {
        v26 = [(OTDetermineCDPBitStatusOperation *)self intendedState];
        [(OTDetermineCDPBitStatusOperation *)self setNextState:v26];
      }
      else
      {
        [(OTDetermineCDPBitStatusOperation *)self setNextState:@"WaitForCDP"];
      }
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
      _Block_object_dispose(&buf, 8);
    }
  }
}

- (OTDetermineCDPBitStatusOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OTDetermineCDPBitStatusOperation;
  BOOL v12 = [(CKKSGroupOperation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deps, a3);
    objc_storeStrong((id *)&v13->_intendedState, a4);
    objc_storeStrong((id *)&v13->_nextState, a5);
  }

  return v13;
}

@end