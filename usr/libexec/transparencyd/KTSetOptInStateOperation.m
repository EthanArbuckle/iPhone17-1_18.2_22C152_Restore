@interface KTSetOptInStateOperation
- (KTOperationDependencies)deps;
- (KTOptInStateHolder)optInStates;
- (KTSetOptInStateOperation)initWithDependenics:(id)a3 intendedState:(id)a4 errorState:(id)a5 optinStates:(id)a6;
- (KTStateString)errorState;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSMutableDictionary)optInResult;
- (NSString)applicationId;
- (id)notificationKey;
- (id)optInKey;
- (id)verifyResponse:(id)a3 uri:(id)a4 expectedState:(BOOL)a5;
- (unint64_t)decodeAndVerifyOptInOutResponse:(id)a3 optInOutState:(BOOL)a4 optInOutTime:(id *)a5 error:(id *)a6;
- (unint64_t)decodeAndVerifySMT:(id)a3 optInOutState:(BOOL)a4 optInOutTime:(id *)a5 error:(id *)a6;
- (void)clearCoreFollowUp;
- (void)clearFailureEvents;
- (void)clearOptInStateAndPushToCloud;
- (void)groupStart;
- (void)notifyOptInStatusChanged;
- (void)processResponse:(id)a3 watcher:(id)a4 finishOp:(id)a5;
- (void)setApplicationId:(id)a3;
- (void)setDeps:(id)a3;
- (void)setErrorState:(id)a3;
- (void)setIntendedState:(id)a3;
- (void)setKVSSMTTime:(id)a3 forState:(BOOL)a4;
- (void)setNextState:(id)a3;
- (void)setOptInResult:(id)a3;
- (void)setOptInStates:(id)a3;
@end

@implementation KTSetOptInStateOperation

- (KTSetOptInStateOperation)initWithDependenics:(id)a3 intendedState:(id)a4 errorState:(id)a5 optinStates:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)KTSetOptInStateOperation;
  v14 = [(KTGroupOperation *)&v18 init];
  v15 = v14;
  if (v14)
  {
    [(KTSetOptInStateOperation *)v14 setDeps:v10];
    [(KTSetOptInStateOperation *)v15 setOptInStates:v13];
    [(KTSetOptInStateOperation *)v15 setIntendedState:v11];
    [(KTSetOptInStateOperation *)v15 setErrorState:v12];
    [(KTSetOptInStateOperation *)v15 setOptInStates:v13];
    v16 = v15;
  }

  return v15;
}

- (id)verifyResponse:(id)a3 uri:(id)a4 expectedState:(BOOL)a5
{
  BOOL v5 = a5;
  id v16 = 0;
  id v17 = 0;
  id v8 = a4;
  unint64_t v9 = [(KTSetOptInStateOperation *)self decodeAndVerifyOptInOutResponse:a3 optInOutState:v5 optInOutTime:&v17 error:&v16];
  id v10 = v17;
  id v11 = v16;
  id v12 = objc_alloc_init(KTSetOptInResult);
  [(KTSetOptInResult *)v12 setSuccess:v9 == 1];
  [(KTSetOptInResult *)v12 setUri:v8];

  id v13 = +[NSNumber numberWithBool:v5];
  [(KTSetOptInResult *)v12 setOptInStatus:v13];

  [(KTSetOptInResult *)v12 setOptInDate:v10];
  [(KTSetOptInResult *)v12 setError:v11];
  if (qword_10032F2B8 != -1) {
    dispatch_once(&qword_10032F2B8, &stru_1002C8FA8);
  }
  v14 = qword_10032F2C0;
  if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "verified response returned: %@", buf, 0xCu);
  }

  return v12;
}

- (void)groupStart
{
  v3 = [(KTSetOptInStateOperation *)self errorState];
  [(KTSetOptInStateOperation *)self setNextState:v3];

  v4 = [(KTSetOptInStateOperation *)self optInStates];
  BOOL v5 = [v4 currentTarget];
  [(KTSetOptInStateOperation *)self setApplicationId:v5];

  v6 = [(KTSetOptInStateOperation *)self optInStates];
  v7 = [v6 targetOptInStates];
  id v8 = [(KTSetOptInStateOperation *)self applicationId];
  unint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = +[NSBlockOperation blockOperationWithBlock:&stru_1002C8FE8];
    [(KTGroupOperation *)self dependOnBeforeGroupFinished:v10];
    id v11 = objc_alloc_init(KTIDSOpsOptInOutData);
    id v12 = [(KTSetOptInStateOperation *)self applicationId];
    [(KTIDSOpsOptInOutData *)v11 setKtApplication:v12];

    id v13 = [v9 targetState];
    if ((unint64_t)v13 <= 2) {
      [(KTIDSOpsOptInOutData *)v11 setOptInStatus:*(&off_1002C92F0 + (void)v13)];
    }
    v14 = [(KTSetOptInStateOperation *)self deps];
    v15 = [v14 cloudRecords];
    id v16 = [(KTSetOptInStateOperation *)self applicationId];
    id v17 = [(KTIDSOpsOptInOutData *)v11 optInStatus];
    id v52 = 0;
    v43 = [v15 storeOptInIntentForApplication:v16 state:[v17 BOOLValue] overwrite:1 error:&v52];
    id v41 = v52;

    objc_super v18 = [(KTSetOptInStateOperation *)self deps];
    v19 = [v18 cloudRecords];
    v20 = [(KTSetOptInStateOperation *)self applicationId];
    id v51 = 0;
    v21 = [v19 deleteOptInIntentForApplication:v20 error:&v51];
    id v39 = v51;

    v22 = [(KTSetOptInStateOperation *)self deps];
    v23 = [v22 accountKeyService];
    v24 = [(KTSetOptInStateOperation *)self applicationId];
    v44 = [v23 accountKeyService:v24];

    id v50 = 0;
    v25 = [v44 publicPublicKey:&v50];
    id v42 = v50;
    [(KTIDSOpsOptInOutData *)v11 setPublicAccountKey:v25];

    v26 = [(KTIDSOpsOptInOutData *)v11 publicAccountKey];
    LODWORD(v25) = v26 == 0;

    if (v25)
    {
      if (qword_10032F2B8 != -1) {
        dispatch_once(&qword_10032F2B8, &stru_1002C9008);
      }
      v27 = qword_10032F2C0;
      if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v44;
        __int16 v56 = 2112;
        id v57 = v42;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Cloud not get account key from service %@, this is not going to end well: %@", buf, 0x16u);
      }
    }
    v28 = [(KTSetOptInStateOperation *)self applicationId];
    v53 = v28;
    v54 = v11;
    v29 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];

    v30 = [SendOptInUpdateRequestOperation alloc];
    v31 = [(KTSetOptInStateOperation *)self deps];
    v32 = [(SendOptInUpdateRequestOperation *)v30 initWithDependenics:v31 optInRequest:v29];

    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1001F940C;
    v45[3] = &unk_1002BA410;
    objc_copyWeak(&v49, (id *)buf);
    v33 = v32;
    v46 = v33;
    id v47 = v9;
    id v34 = v10;
    id v48 = v34;
    v35 = +[KTResultOperation named:@"set-opt-io" withBlock:v45];
    [(KTResultOperation *)v33 addSuccessDependency:v43];
    [v35 addDependency:v33];
    [v21 addSuccessDependency:v35];
    [(KTGroupOperation *)self runBeforeGroupFinished:v43];
    [(KTGroupOperation *)self runBeforeGroupFinished:v33];
    [(KTGroupOperation *)self runBeforeGroupFinished:v35];
    [(KTGroupOperation *)self runBeforeGroupFinished:v21];

    objc_destroyWeak(&v49);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (qword_10032F2B8 != -1) {
      dispatch_once(&qword_10032F2B8, &stru_1002C8FC8);
    }
    v36 = (void *)qword_10032F2C0;
    if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_ERROR))
    {
      v37 = v36;
      v38 = [(KTSetOptInStateOperation *)self applicationId];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Warning: no target application available: %@", buf, 0xCu);
    }
    id v34 = [(KTSetOptInStateOperation *)self optInStates];
    [v34 setCurrentTarget:0];
  }
}

- (void)processResponse:(id)a3 watcher:(id)a4 finishOp:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSMutableDictionary dictionary];
  if ([v8 success])
  {
    id v12 = [v8 serverSMTByURI];
    id v13 = [v12 count];

    if (v13)
    {
      v14 = [v8 serverSMTByURI];
      v109[0] = _NSConcreteStackBlock;
      v109[1] = 3221225472;
      v109[2] = sub_1001FA43C;
      v109[3] = &unk_1002C9050;
      v109[4] = self;
      id v110 = v9;
      id v111 = v11;
      [v14 enumerateKeysAndObjectsUsingBlock:v109];
    }
    else
    {
      v24 = [v8 serverProvidedSMT];
      v25 = -[KTSetOptInStateOperation verifyResponse:uri:expectedState:](self, "verifyResponse:uri:expectedState:", v24, 0, [v9 targetState] != 0);

      [v11 setObject:v25 forKeyedSubscript:&stru_1002CE4C0];
    }
    if (qword_10032F2B8 != -1) {
      dispatch_once(&qword_10032F2B8, &stru_1002C9070);
    }
    v95 = v9;
    v26 = qword_10032F2C0;
    if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v113 = v11;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "OptIn result: %@", buf, 0xCu);
    }
    [(KTSetOptInStateOperation *)self setOptInResult:v11];
    v96 = +[NSMutableArray array];
    v97 = +[NSMutableArray array];
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    v27 = [v11 objectEnumerator];
    id v28 = [v27 countByEnumeratingWithState:&v105 objects:v119 count:16];
    v98 = self;
    if (v28)
    {
      id v29 = v28;
      char v30 = 0;
      uint64_t v31 = *(void *)v106;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v106 != v31) {
            objc_enumerationMutation(v27);
          }
          v33 = *(void **)(*((void *)&v105 + 1) + 8 * i);
          if (([v33 success] & 1) == 0)
          {
            id v34 = [v33 error];

            if (v34)
            {
              v35 = [v33 error];
              [v96 addObject:v35];
            }
            v36 = [v33 uri];

            if (v36)
            {
              v37 = [v33 uri];
              [v97 addObject:v37];
            }
            char v30 = 1;
          }
        }
        id v29 = [v27 countByEnumeratingWithState:&v105 objects:v119 count:16];
      }
      while (v29);

      self = v98;
      if (v30)
      {
        v38 = +[NSMutableDictionary dictionary];
        v15 = v96;
        [v38 setObject:v96 forKeyedSubscript:NSMultipleUnderlyingErrorsKey];
        [v38 setObject:v97 forKeyedSubscript:@"uris"];
        v99 = v38;
        id v39 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-361 underlyingError:0 userinfo:v38 description:@"Failed validation uri"];
        [(KTResultOperation *)v98 setError:v39];

        id v9 = v95;
        if (qword_10032F2B8 != -1) {
          dispatch_once(&qword_10032F2B8, &stru_1002C9090);
        }
        id v40 = (void *)qword_10032F2C0;
        if (!os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_ERROR)) {
          goto LABEL_78;
        }
        v23 = v40;
        id v41 = [(KTResultOperation *)v98 error];
        *(_DWORD *)buf = 138412290;
        id v113 = v41;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to change opt-in state due to IDS opt-in failure: %@", buf, 0xCu);

LABEL_34:
LABEL_78:

        goto LABEL_79;
      }
    }
    else
    {
    }
    id v42 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v95 targetState]);
    v43 = [(KTSetOptInStateOperation *)self optInStates];
    v44 = [v43 currentStates];
    v45 = [(KTSetOptInStateOperation *)self applicationId];
    [v44 setObject:v42 forKeyedSubscript:v45];

    [(KTSetOptInStateOperation *)self clearCoreFollowUp];
    [(KTSetOptInStateOperation *)self clearFailureEvents];
    if (qword_10032F2B8 != -1) {
      dispatch_once(&qword_10032F2B8, &stru_1002C90B0);
    }
    v46 = (void *)qword_10032F2C0;
    if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_DEFAULT))
    {
      id v47 = v46;
      id v48 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v95 targetState]);
      id v49 = [(KTSetOptInStateOperation *)self applicationId];
      *(_DWORD *)buf = 138543618;
      id v113 = v48;
      __int16 v114 = 2114;
      v115 = v49;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "changing opt-in state to %{public}@ for %{public}@", buf, 0x16u);
    }
    v94 = v10;
    id v92 = v8;
    v99 = +[NSMutableDictionary dictionary];
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    v93 = v11;
    id v50 = [v11 objectEnumerator];
    id v51 = [v50 countByEnumeratingWithState:&v101 objects:v118 count:16];
    if (v51)
    {
      id v52 = v51;
      v53 = 0;
      uint64_t v54 = *(void *)v102;
      do
      {
        for (j = 0; j != v52; j = (char *)j + 1)
        {
          if (*(void *)v102 != v54) {
            objc_enumerationMutation(v50);
          }
          __int16 v56 = *(void **)(*((void *)&v101 + 1) + 8 * (void)j);
          id v57 = [v56 uri];

          if (v57)
          {
            v58 = [(KTSetOptInStateOperation *)self applicationId];
            v59 = [v56 uri];
            v60 = +[TransparencyApplication addApplicationPrefixForIdentifier:v58 uri:v59];

            v61 = [v56 optInDate];
            [v99 setObject:v61 forKeyedSubscript:v60];

            if (!v53
              || ([v56 optInDate],
                  v62 = objc_claimAutoreleasedReturnValue(),
                  id v63 = [v62 compare:v53],
                  v62,
                  v63 == (id)-1))
            {
              uint64_t v64 = [v56 optInDate];

              v53 = (void *)v64;
            }

            self = v98;
          }
        }
        id v52 = [v50 countByEnumeratingWithState:&v101 objects:v118 count:16];
      }
      while (v52);
    }
    else
    {
      v53 = 0;
    }

    v65 = [(KTSetOptInStateOperation *)self deps];
    v66 = [v65 cloudRecords];

    id v8 = v92;
    if (v66)
    {
      v67 = [(KTSetOptInStateOperation *)self deps];
      v68 = [v67 cloudRecords];
      v69 = [(KTSetOptInStateOperation *)self applicationId];
      id v9 = v95;
      id v100 = 0;
      v70 = [v68 storeOptInForApplication:v69 uris:v99 state:objc_msgSend(v95, "targetState") != 0 error:&v100];
      id v71 = v100;

      if (v70)
      {
        [v94 addDependency:v70];
        [(KTGroupOperation *)self runBeforeGroupFinished:v70];
      }
      if (v71)
      {
        if (qword_10032F2B8 != -1) {
          dispatch_once(&qword_10032F2B8, &stru_1002C90D0);
        }
        v72 = qword_10032F2C0;
        if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v113 = v71;
          _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "storeOptInForApplication failed %@", buf, 0xCu);
        }
        [(KTResultOperation *)self setError:v71];
      }
    }
    else
    {
      id v71 = 0;
      id v9 = v95;
    }
    if (qword_10032F2B8 != -1) {
      dispatch_once(&qword_10032F2B8, &stru_1002C90F0);
    }
    v73 = (void *)qword_10032F2C0;
    if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_DEFAULT))
    {
      v74 = v73;
      v75 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 targetState]);
      v76 = [(KTSetOptInStateOperation *)self applicationId];
      v77 = [v99 allKeys];
      v78 = [v77 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543874;
      id v113 = v75;
      __int16 v114 = 2114;
      v115 = v76;
      __int16 v116 = 2112;
      v117 = v78;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "changing peer opt-in state to %{public}@ for %{public}@ for %@", buf, 0x20u);

      self = v98;
    }
    v79 = [(KTSetOptInStateOperation *)self deps];
    v80 = [v79 dataStore];
    BOOL v81 = [v9 targetState] != 0;
    v82 = [v99 allKeys];
    v83 = [(KTSetOptInStateOperation *)self applicationId];
    [v80 setCachedPeerOptInState:v81 uris:v82 application:v83];

    if ([v9 targetState] == (id)1)
    {
      v84 = [(KTSetOptInStateOperation *)v98 deps];
      v85 = [v84 dataStore];
      v86 = [(KTSetOptInStateOperation *)v98 applicationId];
      [v85 removeFailuresOnOptIn:v86];
    }
    if (v53)
    {
      -[KTSetOptInStateOperation setKVSSMTTime:forState:](v98, "setKVSSMTTime:forState:", v53, [v9 targetState] != 0);
    }
    else
    {
      if (qword_10032F2B8 != -1) {
        dispatch_once(&qword_10032F2B8, &stru_1002C9110);
      }
      v87 = qword_10032F2C0;
      if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v113 = v93;
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "no KVS smt timestamp: %@", buf, 0xCu);
      }
    }
    [(KTSetOptInStateOperation *)v98 notifyOptInStatusChanged];
    v88 = [[KTPendingFlag alloc] initWithFlag:@"StatusUpdate" delayInSeconds:0.0];
    v89 = [(KTSetOptInStateOperation *)v98 deps];
    v90 = [v89 flagHandler];
    [v90 handlePendingFlag:v88];

    v91 = [(KTSetOptInStateOperation *)v98 intendedState];
    [(KTSetOptInStateOperation *)v98 setNextState:v91];

    id v11 = v93;
    id v10 = v94;
    v15 = v96;
    goto LABEL_78;
  }
  v15 = [v8 error];
  if (qword_10032F2B8 != -1) {
    dispatch_once(&qword_10032F2B8, &stru_1002C9028);
  }
  id v16 = (void *)qword_10032F2C0;
  if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_ERROR))
  {
    id v17 = v16;
    objc_super v18 = [v8 error];
    *(_DWORD *)buf = 138412290;
    id v113 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "failed to change opt-in state due to IDS opt-in failure: %@", buf, 0xCu);
  }
  v19 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-290 underlyingError:v15 description:@"IDS failed to change opt-in state for KT"];
  [(KTResultOperation *)self setError:v19];

  if ([v15 code] == (id)-8101)
  {
    v20 = [v15 domain];
    unsigned int v21 = [v20 isEqual:IDSKeyTransparencyErrorDomain];

    if (v21)
    {
      v22 = [[KTPendingFlag alloc] initWithFlag:@"CheckAccountSignatures" conditions:2 delayInSeconds:1.0];
      v99 = [(KTSetOptInStateOperation *)self deps];
      v23 = [v99 flagHandler];
      v97 = v22;
      [v23 handlePendingFlag:v22];
      goto LABEL_34;
    }
  }
LABEL_79:
}

- (id)optInKey
{
  v2 = [(KTSetOptInStateOperation *)self applicationId];
  v3 = +[KTOptInManagerServer optInKeyForApplication:v2];

  return v3;
}

- (id)notificationKey
{
  v2 = [(KTSetOptInStateOperation *)self applicationId];
  v3 = +[KTOptInManager notificationKeyForApplication:v2];

  return v3;
}

- (void)clearOptInStateAndPushToCloud
{
  v3 = [(KTSetOptInStateOperation *)self deps];
  v4 = [v3 cloudRecords];
  BOOL v5 = [(KTSetOptInStateOperation *)self applicationId];
  id v11 = 0;
  [v4 clearOptInStateForURI:0 application:v5 error:&v11];
  id v6 = v11;

  if (v6)
  {
    if (qword_10032F2B8 != -1) {
      dispatch_once(&qword_10032F2B8, &stru_1002C9130);
    }
    v7 = qword_10032F2C0;
    if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Opt-in reset failed clear all states: error: %@", buf, 0xCu);
    }
  }
  id v8 = [[KTPendingFlag alloc] initWithFlag:@"CloudKitOutgoing" conditions:2];
  id v9 = [(KTSetOptInStateOperation *)self deps];
  id v10 = [v9 flagHandler];
  [v10 handlePendingFlag:v8];
}

- (void)setKVSSMTTime:(id)a3 forState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(KTSetOptInStateOperation *)self applicationId];
  id v8 = [(KTSetOptInStateOperation *)self deps];
  id v9 = [v8 kvs];
  id v28 = 0;
  id v10 = +[KTOptInManagerServer getOptInHistory:v7 store:v9 error:&v28];
  id v11 = v28;

  if (v11)
  {
    id v12 = [(KTSetOptInStateOperation *)self deps];
    id v13 = [v12 logger];
    [v13 logResultForEvent:@"optInHistory" hardFailure:1 result:v11];

    if (qword_10032F2B8 != -1) {
      dispatch_once(&qword_10032F2B8, &stru_1002C9150);
    }
    v14 = qword_10032F2C0;
    if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "getOptInHistory failed with %@", buf, 0xCu);
    }
  }
  else
  {
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    id v16 = +[NSMutableArray arrayWithArray:v10];
    v29[0] = v6;
    id v17 = +[NSNumber numberWithBool:v4];
    v29[1] = v17;
    objc_super v18 = +[NSArray arrayWithObjects:v29 count:2];
    [v16 addObject:v18];

    v19 = [(KTSetOptInStateOperation *)self deps];
    v20 = [v19 kvs];
    unsigned int v21 = [(KTSetOptInStateOperation *)self optInKey];
    [v20 setObject:v16 forKey:v21];

    v22 = [(KTSetOptInStateOperation *)self deps];
    v23 = [v22 kvs];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1001FAC58;
    v26[3] = &unk_1002B7340;
    v26[4] = self;
    dispatch_semaphore_t v27 = v15;
    v24 = v15;
    [v23 forceSync:v26];

    dispatch_time_t v25 = dispatch_time(0, 30000000000);
    dispatch_semaphore_wait(v24, v25);
  }
}

- (void)clearFailureEvents
{
  v3 = [(KTSetOptInStateOperation *)self deps];
  BOOL v4 = [v3 dataStore];
  BOOL v5 = [(KTSetOptInStateOperation *)self applicationId];
  id v9 = 0;
  unsigned __int8 v6 = [v4 clearAllFailureEvents:v5 error:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    if (qword_10032F2B8 != -1) {
      dispatch_once(&qword_10032F2B8, &stru_1002C9170);
    }
    id v8 = qword_10032F2C0;
    if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "failed to clear existing failure events: %@", buf, 0xCu);
    }
  }
}

- (void)clearCoreFollowUp
{
  v2 = [(KTSetOptInStateOperation *)self deps];
  v3 = [v2 followup];
  id v7 = 0;
  unsigned __int8 v4 = [v3 clearAllFollowups:&v7];
  id v5 = v7;

  if ((v4 & 1) == 0)
  {
    if (qword_10032F2B8 != -1) {
      dispatch_once(&qword_10032F2B8, &stru_1002C9190);
    }
    unsigned __int8 v6 = qword_10032F2C0;
    if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "failed to clear existing follow ups: %@", buf, 0xCu);
    }
  }
}

- (void)notifyOptInStatusChanged
{
  id v4 = +[NSDistributedNotificationCenter defaultCenter];
  v3 = [(KTSetOptInStateOperation *)self notificationKey];
  [v4 postNotificationName:v3 object:0 userInfo:0 deliverImmediately:1];
}

- (unint64_t)decodeAndVerifyOptInOutResponse:(id)a3 optInOutState:(BOOL)a4 optInOutTime:(id *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v27 = 0;
  id v10 = +[TransparencyGPBMessage parseFromData:a3 error:&v27];
  id v11 = v27;
  if (v10)
  {
    if ([v10 status] == 1 || objc_msgSend(v10, "status") == 3)
    {
      id v12 = [v10 smt];
      id v26 = 0;
      unint64_t v13 = [(KTSetOptInStateOperation *)self decodeAndVerifySMT:v12 optInOutState:v8 optInOutTime:a5 error:&v26];
      id v14 = v26;

      if (v13 != 1)
      {
        if (qword_10032F2B8 != -1) {
          dispatch_once(&qword_10032F2B8, &stru_1002C91F0);
        }
        dispatch_semaphore_t v15 = (void *)qword_10032F2C0;
        if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_ERROR))
        {
          id v16 = v15;
          id v17 = [v10 serverEventInfo];
          *(_DWORD *)buf = 138412546;
          *(void *)id v29 = v17;
          *(_WORD *)&v29[8] = 2112;
          *(void *)&v29[10] = v14;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "SMT verification failed for OptInOutResponse with %@: %@", buf, 0x16u);
        }
        if (a6 && v14) {
          *a6 = v14;
        }
      }

      id v18 = 0;
      goto LABEL_26;
    }
    if (qword_10032F2B8 != -1) {
      dispatch_once(&qword_10032F2B8, &stru_1002C91D0);
    }
    unsigned int v21 = (void *)qword_10032F2C0;
    if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_ERROR))
    {
      v22 = v21;
      unsigned int v23 = [v10 status];
      v24 = [v10 serverEventInfo];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)id v29 = v23;
      *(_WORD *)&v29[4] = 2112;
      *(void *)&v29[6] = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "optInOutResponse status failure: %d. ServerHint: %@", buf, 0x12u);
    }
    v20 = +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorServer, (int)[v10 status], @"optInOutResponse status failure: %d", [v10 status]);
  }
  else
  {
    if (qword_10032F2B8 != -1) {
      dispatch_once(&qword_10032F2B8, &stru_1002C91B0);
    }
    v19 = qword_10032F2C0;
    if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)id v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "failed to parse optInOutResponse from directory server: %@", buf, 0xCu);
    }
    v20 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-318 underlyingError:v11 description:@"failed to parse optInOutResponse from directory server"];
  }
  id v18 = v20;
  unint64_t v13 = 0;
  if (a6 && v20)
  {
    id v18 = v20;
    unint64_t v13 = 0;
    *a6 = v18;
  }
LABEL_26:

  return v13;
}

- (unint64_t)decodeAndVerifySMT:(id)a3 optInOutState:(BOOL)a4 optInOutTime:(id *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = [(KTSetOptInStateOperation *)self deps];
  id v12 = [v11 publicKeyStore];
  unint64_t v13 = [(KTSetOptInStateOperation *)self applicationId];
  id v14 = [v12 applicationPublicKeyStore:v13];

  if (v14)
  {
    dispatch_semaphore_t v15 = [v14 appSmtKeyStore];
    uint64_t v16 = [v15 signatureVerifier];

    id v17 = [(KTSetOptInStateOperation *)self deps];
    id v18 = [v17 dataStore];
    v19 = (void *)v16;
    v20 = +[SignedMutationTimestamp signedTypeWithObject:v10 verifier:v16 dataStore:v18];

    id v59 = 0;
    unint64_t v21 = (unint64_t)[v20 verifyWithError:&v59];
    id v22 = v59;
    if (v21 != 1)
    {
      if (qword_10032F2B8 != -1) {
        dispatch_once(&qword_10032F2B8, &stru_1002C9230);
      }
      id v34 = qword_10032F2C0;
      if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v63 = v22;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "failed to verify optInOut SMT from directory server: %@", buf, 0xCu);
      }
      v35 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-316 underlyingError:v22 description:@"failed to verify optInOut SMT from directory server"];
      id v36 = v35;
      v37 = 0;
      if (a6 && v35)
      {
        id v36 = v35;
        v37 = 0;
        *a6 = v36;
      }
      goto LABEL_60;
    }
    id v58 = 0;
    unsigned int v23 = [v20 parsedMutationWithError:&v58];
    id v56 = v58;
    id v57 = v23;
    if (!v23)
    {
      if (qword_10032F2B8 != -1) {
        dispatch_once(&qword_10032F2B8, &stru_1002C9250);
      }
      v37 = v56;
      v38 = qword_10032F2C0;
      if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v63 = v56;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "failed to parse mutation from SMT from directory server: %@", buf, 0xCu);
      }
      id v39 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-316 underlyingError:v56 description:@"failed to parse mutation from SMT from directory server"];
      id v36 = v39;
      unint64_t v21 = 0;
      if (a6 && v39)
      {
        id v36 = v39;
        unint64_t v21 = 0;
        *a6 = v36;
      }
      goto LABEL_59;
    }
    unsigned int v24 = [v23 mutationType];
    if (v24 == 6)
    {
      v55 = v19;
      if (qword_10032F2B8 != -1) {
        dispatch_once(&qword_10032F2B8, &stru_1002C9290);
      }
      id v40 = (void *)qword_10032F2C0;
      if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_DEBUG))
      {
        id v41 = v40;
        id v42 = [v23 optInOutMutation];
        v43 = [v42 description];
        *(_DWORD *)buf = 138412290;
        id v63 = v43;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "decodeAndVerifySMT OptInOut_Sync: %@", buf, 0xCu);

        unsigned int v23 = v57;
      }
      v44 = [v23 optInOutMutation];
      +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)((unint64_t)[v44 timestampMs] / 0x3E8));
      v45 = v23;
      id v31 = (id)objc_claimAutoreleasedReturnValue();

      v32 = [v45 optInOutMutation];
    }
    else
    {
      if (v24 != 3)
      {
        if (qword_10032F2B8 != -1) {
          dispatch_once(&qword_10032F2B8, &stru_1002C92B0);
        }
        v37 = v56;
        v53 = qword_10032F2C0;
        if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "mutation from directory server not optInOut", buf, 2u);
        }
        id v51 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-314 description:@"mutation from directory server not optInOut"];

        id v31 = 0;
        if (a6 && v51)
        {
          id v51 = v51;
          id v31 = 0;
          unint64_t v21 = 0;
          *a6 = v51;
        }
        else
        {
          unint64_t v21 = 0;
        }
        goto LABEL_58;
      }
      v55 = v19;
      if (qword_10032F2B8 != -1) {
        dispatch_once(&qword_10032F2B8, &stru_1002C9270);
      }
      dispatch_time_t v25 = (void *)qword_10032F2C0;
      if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_DEBUG))
      {
        id v26 = v25;
        id v27 = [v23 optInOut];
        id v28 = [v27 description];
        *(_DWORD *)buf = 138412290;
        id v63 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "decodeAndVerifySMT OptInOutMutation: %@", buf, 0xCu);

        unsigned int v23 = v57;
      }
      id v29 = [v23 optInOut];
      +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)((unint64_t)[v29 timestampMs] / 0x3E8));
      char v30 = v23;
      id v31 = (id)objc_claimAutoreleasedReturnValue();

      v32 = [v30 optInOut];
    }
    v46 = v32;
    id v47 = [v32 optIn];

    if (v47 == v8)
    {
      unint64_t v21 = 1;
      if (a5)
      {
        v19 = v55;
        if (v31)
        {
          id v31 = v31;
          *a5 = v31;
          unint64_t v21 = 1;
        }
        id v51 = v22;
      }
      else
      {
        id v51 = v22;
        v19 = v55;
      }
      v37 = v56;
    }
    else
    {
      v60[0] = @"mutation";
      id v48 = +[NSNumber numberWithBool:v47];
      v60[1] = @"expected";
      v61[0] = v48;
      id v49 = +[NSNumber numberWithBool:v8];
      v61[1] = v49;
      id v50 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];

      id v51 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-315 underlyingError:0 userinfo:v50 description:@"mutation from directory server has wrong optInOut state"];

      if (qword_10032F2B8 != -1) {
        dispatch_once(&qword_10032F2B8, &stru_1002C92D0);
      }
      v37 = v56;
      id v52 = qword_10032F2C0;
      v19 = v55;
      if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v63 = v51;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "mutation from directory server has wrong optInOut %@", buf, 0xCu);
      }
      if (a6 && v51) {
        *a6 = v51;
      }

      unint64_t v21 = 0;
    }
LABEL_58:

    id v36 = 0;
    id v22 = v51;
LABEL_59:

LABEL_60:
    goto LABEL_61;
  }
  if (qword_10032F2B8 != -1) {
    dispatch_once(&qword_10032F2B8, &stru_1002C9210);
  }
  v33 = qword_10032F2C0;
  if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "could not get KTApplicationPublicKeyStore", buf, 2u);
  }
  unint64_t v21 = 0;
LABEL_61:

  return v21;
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setNextState:(id)a3
{
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setIntendedState:(id)a3
{
}

- (NSMutableDictionary)optInResult
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setOptInResult:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDeps:(id)a3
{
}

- (KTOptInStateHolder)optInStates
{
  return (KTOptInStateHolder *)objc_getProperty(self, a2, 152, 1);
}

- (void)setOptInStates:(id)a3
{
}

- (NSString)applicationId
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setApplicationId:(id)a3
{
}

- (KTStateString)errorState
{
  return (KTStateString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setErrorState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorState, 0);
  objc_storeStrong((id *)&self->_applicationId, 0);
  objc_storeStrong((id *)&self->_optInStates, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_optInResult, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);

  objc_storeStrong((id *)&self->_nextState, 0);
}

@end