@interface KTFillStatusOperation
+ (id)memoizedKTSelfStatusResult:(id)a3;
- (BOOL)initialFill;
- (KTFillStatusOperation)initWithApplication:(id)a3 initialFill:(BOOL)a4 dependencies:(id)a5 intendedState:(id)a6 errorState:(id)a7;
- (KTOperationDependencies)deps;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSOperation)finishedOp;
- (NSString)application;
- (void)fillBackgroundStatus;
- (void)fillOptInState;
- (void)fillSelfStatus;
- (void)fillSystemStatus;
- (void)groupStart;
- (void)setApplication:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setInitialFill:(BOOL)a3;
- (void)setNextState:(id)a3;
@end

@implementation KTFillStatusOperation

- (KTFillStatusOperation)initWithApplication:(id)a3 initialFill:(BOOL)a4 dependencies:(id)a5 intendedState:(id)a6 errorState:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)KTFillStatusOperation;
  v17 = [(KTGroupOperation *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 142), a5);
    objc_storeStrong((id *)(v18 + 150), a3);
    objc_storeStrong((id *)(v18 + 126), a6);
    objc_storeStrong((id *)(v18 + 134), a7);
    v18[120] = a4;
  }

  return (KTFillStatusOperation *)v18;
}

+ (id)memoizedKTSelfStatusResult:(id)a3
{
  v3 = [a3 smDataStore];
  v4 = [v3 getSettingsData:@"KTSelfStatusResult"];

  if (v4)
  {
    v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)groupStart
{
  if (qword_100326750 != -1) {
    dispatch_once(&qword_100326750, &stru_1002B9180);
  }
  v3 = qword_100326758;
  if (os_log_type_enabled((os_log_t)qword_100326758, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "FillStatus: start", (uint8_t *)&v13, 2u);
  }
  v4 = [(KTFillStatusOperation *)self deps];
  v5 = [v4 stateMonitor];

  v6 = [v5 ktStatus];
  id v7 = [v6 accountStatus];

  if (v7)
  {
    [(KTFillStatusOperation *)self fillOptInState];
    [(KTFillStatusOperation *)self fillSystemStatus];
    if ([(KTFillStatusOperation *)self initialFill]) {
      [(KTFillStatusOperation *)self fillSelfStatus];
    }
    [v5 setPendingChanges:0];
    v8 = [v5 ktStatus];
    if (v8)
    {
      v9 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
    }
    else
    {
      v9 = 0;
    }
    v10 = [(KTFillStatusOperation *)self deps];
    v11 = [v10 smDataStore];
    [v11 setSettingsData:@"KTSelfStatusResult" data:v9];

    if (qword_100326750 != -1) {
      dispatch_once(&qword_100326750, &stru_1002B91A0);
    }
    v12 = qword_100326758;
    if (os_log_type_enabled((os_log_t)qword_100326758, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "FillStatus: filled: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    [(KTFillStatusOperation *)self setNextState:@"Initializing"];
  }
}

- (void)fillBackgroundStatus
{
  v3 = [(KTFillStatusOperation *)self deps];
  v4 = [v3 stateMonitor];

  v5 = [(KTFillStatusOperation *)self deps];
  v6 = [v5 smDataStore];
  id v7 = [v6 getSettingsNumber:off_10031E2A8];

  if (v7)
  {
    if (qword_100326750 != -1) {
      dispatch_once(&qword_100326750, &stru_1002B91E0);
    }
    v8 = qword_100326758;
    if (os_log_type_enabled((os_log_t)qword_100326758, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "FillStatus: last background verification result %{public}@", (uint8_t *)&v11, 0xCu);
    }
    if ([v7 BOOLValue]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 2;
    }
  }
  else
  {
    if (qword_100326750 != -1) {
      dispatch_once(&qword_100326750, &stru_1002B91C0);
    }
    v10 = qword_100326758;
    if (os_log_type_enabled((os_log_t)qword_100326758, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "FillStatus: no stored background result, defaulting to OK", (uint8_t *)&v11, 2u);
    }
    uint64_t v9 = 0;
  }
  [v4 setSystemStatus:v9];
}

- (void)fillSystemStatus
{
  v3 = [(KTFillStatusOperation *)self deps];
  v4 = [v3 stateMonitor];

  v5 = [v4 ktStatus];
  id v6 = [v5 systemStatus];

  if (v6 != (id)5)
  {
    id v7 = [(KTFillStatusOperation *)self deps];
    v8 = [v7 publicKeyStore];
    uint64_t v9 = [(KTFillStatusOperation *)self application];
    v10 = [v8 applicationPublicKeyStore:v9];

    if (v10)
    {
      if ([v10 ready])
      {
        int v11 = [(KTFillStatusOperation *)self application];
        unsigned int v12 = [v4 treeStateUnstable:v11 logBeginTime:[v10 patLogBeginningMs]];

        if (v12)
        {
          if (qword_100326750 != -1) {
            dispatch_once(&qword_100326750, &stru_1002B9240);
          }
          int v13 = qword_100326758;
          if (os_log_type_enabled((os_log_t)qword_100326758, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FillStatus: system status is tree reset populating", buf, 2u);
          }
          if ((_os_feature_enabled_impl() & 1) == 0)
          {
            v21 = v4;
            uint64_t v22 = 3;
            goto LABEL_31;
          }
          if (qword_100326750 != -1) {
            dispatch_once(&qword_100326750, &stru_1002B9260);
          }
          id v14 = qword_100326758;
          if (os_log_type_enabled((os_log_t)qword_100326758, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v24 = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FillStatus: overriding tree reset system status", v24, 2u);
          }
        }
        if (_os_feature_enabled_impl())
        {
          id v15 = [v4 ktStatus];
          id v16 = [v15 optIn];

          if (v16)
          {
            if (qword_100326750 != -1) {
              dispatch_once(&qword_100326750, &stru_1002B9280);
            }
            v17 = qword_100326758;
            if (os_log_type_enabled((os_log_t)qword_100326758, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v23 = 0;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FillStatus: reading background verification status", v23, 2u);
            }
            [(KTFillStatusOperation *)self fillBackgroundStatus];
            goto LABEL_32;
          }
        }
        v21 = v4;
        uint64_t v22 = 0;
LABEL_31:
        [v21 setSystemStatus:v22];
LABEL_32:

        goto LABEL_33;
      }
      if (qword_100326750 != -1) {
        dispatch_once(&qword_100326750, &stru_1002B9220);
      }
      v18 = qword_100326758;
      if (!os_log_type_enabled((os_log_t)qword_100326758, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:
        v21 = v4;
        uint64_t v22 = 4;
        goto LABEL_31;
      }
      *(_WORD *)v26 = 0;
      v19 = "FillStatus: key store not ready";
      objc_super v20 = v26;
    }
    else
    {
      if (qword_100326750 != -1) {
        dispatch_once(&qword_100326750, &stru_1002B9200);
      }
      v18 = qword_100326758;
      if (!os_log_type_enabled((os_log_t)qword_100326758, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      __int16 v27 = 0;
      v19 = "FillStatus: no key store";
      objc_super v20 = (uint8_t *)&v27;
    }
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, v20, 2u);
    goto LABEL_30;
  }
LABEL_33:
}

- (void)fillSelfStatus
{
  v3 = [(KTFillStatusOperation *)self deps];
  v4 = [v3 stateMonitor];

  v5 = [(KTFillStatusOperation *)self deps];
  id v6 = [v5 accountKeyService];
  id v7 = [(KTFillStatusOperation *)self application];
  v8 = [v6 accountKeyService:v7];

  id v18 = 0;
  uint64_t v9 = [v8 publicPublicKey:&v18];
  id v10 = v18;
  if (v9)
  {
    int v11 = [(KTFillStatusOperation *)self deps];
    unsigned int v12 = [v11 dataStore];
    int v13 = [(KTFillStatusOperation *)self application];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002C8F8;
    v16[3] = &unk_1002B9388;
    id v17 = v4;
    [v12 performAndWaitForLatestSelfRequest:v13 accountKey:v9 block:v16];
  }
  else
  {
    if (qword_100326750 != -1) {
      dispatch_once(&qword_100326750, &stru_1002B93A8);
    }
    id v14 = qword_100326758;
    if (os_log_type_enabled((os_log_t)qword_100326758, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "FillStatus: unable to get account key for latest self status", v15, 2u);
    }
    [v4 setSelfStatus:2];
  }
}

- (void)fillOptInState
{
  v3 = [(KTFillStatusOperation *)self deps];
  v4 = [v3 stateMonitor];

  v5 = [(KTFillStatusOperation *)self deps];
  id v6 = [v5 cloudRecords];

  if (v6)
  {
    id v7 = [(KTFillStatusOperation *)self application];
    id v18 = 0;
    v8 = [v6 getAggregateOptInStateForApplication:v7 error:&v18];
    id v9 = v18;

    if (v8)
    {
      id v10 = [v8 state];
      id v11 = [v8 everOptIn];
      unsigned int v12 = v4;
      uint64_t v13 = (uint64_t)v10;
LABEL_19:
      [v12 setOptInState:v13 everOptIn:v11];

      goto LABEL_20;
    }
    id v15 = [v9 domain];
    if ([v15 isEqual:@"com.apple.Transparency"])
    {
      id v16 = [v9 code];

      if (v16 == (id)9)
      {
        unsigned int v12 = v4;
        uint64_t v13 = 0;
LABEL_18:
        id v11 = 0;
        goto LABEL_19;
      }
    }
    else
    {
    }
    if (qword_100326750 != -1) {
      dispatch_once(&qword_100326750, &stru_1002B93C8);
    }
    id v17 = qword_100326758;
    if (os_log_type_enabled((os_log_t)qword_100326758, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "FillStatus: unable to get opt-in for status: %@", buf, 0xCu);
    }
    unsigned int v12 = v4;
    uint64_t v13 = 2;
    goto LABEL_18;
  }
  if (qword_100326750 != -1) {
    dispatch_once(&qword_100326750, &stru_1002B93E8);
  }
  id v14 = qword_100326758;
  if (os_log_type_enabled((os_log_t)qword_100326758, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "FillStatus: No cloud records to fill status", buf, 2u);
  }
  [v4 setOptInState:2 everOptIn:0];
LABEL_20:
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 126, 1);
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 134, 1);
}

- (void)setNextState:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 142, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 150, 1);
}

- (void)setApplication:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 158, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (BOOL)initialFill
{
  return self->_initialFill;
}

- (void)setInitialFill:(BOOL)a3
{
  self->_initialFill = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_application + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);

  objc_storeStrong((id *)(&self->_initialFill + 6), 0);
}

@end