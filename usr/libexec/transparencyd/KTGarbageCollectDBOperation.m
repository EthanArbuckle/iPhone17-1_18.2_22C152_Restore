@interface KTGarbageCollectDBOperation
- (KTGarbageCollectDBOperation)initWithDependencies:(id)a3;
- (KTOperationDependencies)deps;
- (void)garbageCollectHeads:(id)a3 error:(id *)a4;
- (void)groupStart;
- (void)setDeps:(id)a3;
@end

@implementation KTGarbageCollectDBOperation

- (KTGarbageCollectDBOperation)initWithDependencies:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KTGarbageCollectDBOperation;
  v6 = [(KTGroupOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_deps, a3);
  }

  return v7;
}

- (void)garbageCollectHeads:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(KTGarbageCollectDBOperation *)self deps];
  v8 = [v7 publicKeyStore];
  objc_super v9 = [v8 applicationPublicKeyStore:v6];

  id v10 = [v9 patLogBeginningMs];
  uint64_t v11 = kKTApplicationIdentifierTLT;
  if ([v6 isEqual:kKTApplicationIdentifierTLT])
  {
    v12 = [(KTGarbageCollectDBOperation *)self deps];
    v13 = [v12 publicKeyStore];
    v14 = [v13 tltKeyStore];

    id v10 = [v14 tltLogBeginningMs];
    objc_super v9 = v14;
  }
  v15 = +[NSDate dateWithTimeIntervalSinceNow:(double)(uint64_t)-kKTMaximumSTHLifetime];
  v16 = [(KTGarbageCollectDBOperation *)self deps];
  v17 = [v16 dataStore];
  [v17 garbageCollectSTHs:v6 logBeginMs:v10 olderThanDate:v15 error:a4];

  if (([v6 isEqual:v11] & 1) == 0)
  {
    v18 = [(KTGarbageCollectDBOperation *)self deps];
    v19 = [v18 dataStore];
    id v20 = [v19 newestMapRevision:v6 logBeginMs:[v9 patLogBeginningMs] error:a4];

    if (a4 && *a4)
    {
      if (qword_1003266D0 != -1) {
        dispatch_once(&qword_1003266D0, &stru_1002B7E50);
      }
      v21 = qword_1003266D8;
      if (os_log_type_enabled((os_log_t)qword_1003266D8, OS_LOG_TYPE_ERROR))
      {
        id v22 = *a4;
        int v26 = 138412546;
        id v27 = v6;
        __int16 v28 = 2112;
        id v29 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "garbageCollectHeads failed to get newest map revision for %@: %@", (uint8_t *)&v26, 0x16u);
      }
    }
    v23 = +[NSDate dateWithTimeIntervalSinceNow:(double)(uint64_t)-kKTMaximumSMHLifetime];
    v24 = [(KTGarbageCollectDBOperation *)self deps];
    v25 = [v24 dataStore];
    [v25 garbageCollectSMHs:v6 logBeginMs:[v9 patLogBeginningMs] olderThanRevision:v20 olderThanDate:v23 error:a4];
  }
}

- (void)groupStart
{
  if (qword_1003266D0 != -1) {
    dispatch_once(&qword_1003266D0, &stru_1002B7E70);
  }
  v3 = qword_1003266D8;
  if (os_log_type_enabled((os_log_t)qword_1003266D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "GarbageCollectDB: start", buf, 2u);
  }
  v4 = [(KTGarbageCollectDBOperation *)self deps];
  id v5 = [v4 dataStore];
  id v54 = 0;
  [v5 garbageCollectVerifications:&v54];
  id v6 = v54;

  if (v6)
  {
    if (qword_1003266D0 != -1) {
      dispatch_once(&qword_1003266D0, &stru_1002B7E90);
    }
    v7 = qword_1003266D8;
    if (os_log_type_enabled((os_log_t)qword_1003266D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "garbageCollectVerifications: %@", buf, 0xCu);
    }
  }
  v8 = [(KTGarbageCollectDBOperation *)self deps];
  objc_super v9 = [v8 dataStore];
  id v53 = 0;
  [v9 garbageCollectServerRPCs:&v53];
  id v10 = v53;

  if (v10)
  {
    if (qword_1003266D0 != -1) {
      dispatch_once(&qword_1003266D0, &stru_1002B7EB0);
    }
    uint64_t v11 = qword_1003266D8;
    if (os_log_type_enabled((os_log_t)qword_1003266D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "garbageCollectServerRPCs: %@", buf, 0xCu);
    }
  }
  v12 = [(KTGarbageCollectDBOperation *)self deps];
  v13 = [v12 dataStore];
  id v52 = 0;
  [v13 garbageCollectSMTs:&v52];
  id v14 = v52;

  if (v14)
  {
    if (qword_1003266D0 != -1) {
      dispatch_once(&qword_1003266D0, &stru_1002B7ED0);
    }
    v15 = qword_1003266D8;
    if (os_log_type_enabled((os_log_t)qword_1003266D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "garbageCollectSMTs: %@", buf, 0xCu);
    }
  }
  uint64_t v16 = kKTApplicationIdentifierIDS;
  id v51 = 0;
  [(KTGarbageCollectDBOperation *)self garbageCollectHeads:kKTApplicationIdentifierIDS error:&v51];
  id v17 = v51;
  if (v17)
  {
    v18 = v17;
    if (qword_1003266D0 != -1) {
      dispatch_once(&qword_1003266D0, &stru_1002B7EF0);
    }
    v19 = qword_1003266D8;
    if (os_log_type_enabled((os_log_t)qword_1003266D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "garbageCollectIDSHeads: %@", buf, 0xCu);
    }
  }
  id v50 = 0;
  [(KTGarbageCollectDBOperation *)self garbageCollectHeads:kKTApplicationIdentifierTLT error:&v50];
  id v20 = v50;
  if (v20)
  {
    v21 = v20;
    if (qword_1003266D0 != -1) {
      dispatch_once(&qword_1003266D0, &stru_1002B7F10);
    }
    id v22 = qword_1003266D8;
    if (os_log_type_enabled((os_log_t)qword_1003266D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "garbageCollectTLTHeads: %@", buf, 0xCu);
    }
  }
  v23 = +[NSDate dateWithTimeIntervalSinceNow:(double)(-2 * kKTMaximumCompletedRequestLifetime)];
  v24 = [(KTGarbageCollectDBOperation *)self deps];
  v25 = [v24 dataStore];
  id v49 = 0;
  [v25 garbageCollectRequests:v16 olderThan:v23 error:&v49];
  id v26 = v49;

  if (v26)
  {
    if (qword_1003266D0 != -1) {
      dispatch_once(&qword_1003266D0, &stru_1002B7F30);
    }
    id v27 = qword_1003266D8;
    if (os_log_type_enabled((os_log_t)qword_1003266D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "garbageCollectIDSRequests: %@", buf, 0xCu);
    }
  }
  uint64_t v28 = kKTApplicationIdentifierIDSMultiplex;
  id v48 = 0;
  [(KTGarbageCollectDBOperation *)self garbageCollectHeads:kKTApplicationIdentifierIDSMultiplex error:&v48];
  id v29 = v48;
  if (v29)
  {
    v30 = v29;
    if (qword_1003266D0 != -1) {
      dispatch_once(&qword_1003266D0, &stru_1002B7F50);
    }
    v31 = qword_1003266D8;
    if (os_log_type_enabled((os_log_t)qword_1003266D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v30;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "garbageCollectMPHeads: %@", buf, 0xCu);
    }
  }
  v32 = [(KTGarbageCollectDBOperation *)self deps];
  v33 = [v32 dataStore];
  id v47 = 0;
  [v33 garbageCollectRequests:v28 olderThan:v23 error:&v47];
  id v34 = v47;

  if (v34)
  {
    if (qword_1003266D0 != -1) {
      dispatch_once(&qword_1003266D0, &stru_1002B7F70);
    }
    v35 = qword_1003266D8;
    if (os_log_type_enabled((os_log_t)qword_1003266D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v34;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "garbageCollectMPRequests: %@", buf, 0xCu);
    }
  }
  uint64_t v36 = kKTApplicationIdentifierIDSFaceTime;
  id v46 = 0;
  [(KTGarbageCollectDBOperation *)self garbageCollectHeads:kKTApplicationIdentifierIDSFaceTime error:&v46];
  id v37 = v46;
  if (v37)
  {
    v38 = v37;
    if (qword_1003266D0 != -1) {
      dispatch_once(&qword_1003266D0, &stru_1002B7F90);
    }
    v39 = qword_1003266D8;
    if (os_log_type_enabled((os_log_t)qword_1003266D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v38;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "garbageCollectFTHeads: %@", buf, 0xCu);
    }
  }
  v40 = [(KTGarbageCollectDBOperation *)self deps];
  v41 = [v40 dataStore];
  id v45 = 0;
  [v41 garbageCollectRequests:v36 olderThan:v23 error:&v45];
  id v42 = v45;

  if (v42)
  {
    if (qword_1003266D0 != -1) {
      dispatch_once(&qword_1003266D0, &stru_1002B7FB0);
    }
    v43 = qword_1003266D8;
    if (os_log_type_enabled((os_log_t)qword_1003266D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v42;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "garbageCollectFTRequests: %@", buf, 0xCu);
    }
  }
  if (qword_1003266D0 != -1) {
    dispatch_once(&qword_1003266D0, &stru_1002B7FD0);
  }
  v44 = qword_1003266D8;
  if (os_log_type_enabled((os_log_t)qword_1003266D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "GarbageCollectDB: end", buf, 2u);
  }
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDeps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end