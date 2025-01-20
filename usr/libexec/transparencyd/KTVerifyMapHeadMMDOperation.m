@interface KTVerifyMapHeadMMDOperation
- (BOOL)handlePendingMapHeadMMDs:(id)a3 error:(id *)a4;
- (KTOperationDependencies)deps;
- (KTVerifyMapHeadMMDOperation)initWithDependencies:(id)a3 opId:(id)a4;
- (NSMutableDictionary)errors;
- (NSMutableDictionary)failedSMHs;
- (NSOperation)finishedOp;
- (NSUUID)backgroundOpId;
- (id)verifyMapHeadMMDs:(id)a3 application:(id)a4 error:(id *)a5;
- (void)groupStart;
- (void)setBackgroundOpId:(id)a3;
- (void)setDeps:(id)a3;
- (void)setErrors:(id)a3;
- (void)setFailedSMHs:(id)a3;
- (void)setFinishedOp:(id)a3;
@end

@implementation KTVerifyMapHeadMMDOperation

- (KTVerifyMapHeadMMDOperation)initWithDependencies:(id)a3 opId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)KTVerifyMapHeadMMDOperation;
  v9 = [(KTGroupOperation *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deps, a3);
    [(KTVerifyMapHeadMMDOperation *)v10 setBackgroundOpId:v8];
    v11 = +[NSMutableDictionary dictionary];
    [(KTVerifyMapHeadMMDOperation *)v10 setErrors:v11];

    v12 = +[NSMutableDictionary dictionary];
    [(KTVerifyMapHeadMMDOperation *)v10 setFailedSMHs:v12];

    [(KTGroupOperation *)v10 setName:@"SmhMMD"];
  }

  return v10;
}

- (void)groupStart
{
  if (qword_100326770 != -1) {
    dispatch_once(&qword_100326770, &stru_1002B9538);
  }
  v3 = qword_100326778;
  if (os_log_type_enabled((os_log_t)qword_100326778, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "VerifyMapHeadMMD: start", buf, 2u);
  }
  id v60 = 0;
  unsigned __int8 v4 = [(KTVerifyMapHeadMMDOperation *)self handlePendingMapHeadMMDs:kKTApplicationIdentifierIDS error:&v60];
  id v5 = v60;
  v6 = v5;
  if ((v4 & 1) == 0)
  {
    if (v5)
    {
      if (qword_100326770 != -1) {
        dispatch_once(&qword_100326770, &stru_1002B9558);
      }
      id v7 = qword_100326778;
      if (os_log_type_enabled((os_log_t)qword_100326778, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v66 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Verify IDS Map Head MMDs failed: %@", buf, 0xCu);
      }
    }
    [(KTResultOperation *)self setError:v6];
  }
  id v59 = v6;
  unsigned __int8 v8 = [(KTVerifyMapHeadMMDOperation *)self handlePendingMapHeadMMDs:kKTApplicationIdentifierIDSMultiplex error:&v59];
  id v9 = v59;

  if ((v8 & 1) == 0)
  {
    if (v9)
    {
      if (qword_100326770 != -1) {
        dispatch_once(&qword_100326770, &stru_1002B9578);
      }
      v10 = qword_100326778;
      if (os_log_type_enabled((os_log_t)qword_100326778, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v66 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Verify MP Map Head MMDs failed: %@", buf, 0xCu);
      }
    }

    id v9 = 0;
  }
  id v58 = v9;
  unsigned __int8 v11 = [(KTVerifyMapHeadMMDOperation *)self handlePendingMapHeadMMDs:kKTApplicationIdentifierIDSFaceTime error:&v58];
  id v12 = v58;

  if ((v11 & 1) == 0)
  {
    if (v12)
    {
      if (qword_100326770 != -1) {
        dispatch_once(&qword_100326770, &stru_1002B9598);
      }
      v13 = qword_100326778;
      if (os_log_type_enabled((os_log_t)qword_100326778, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v66 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Verify FT Map Head MMDs failed: %@", buf, 0xCu);
      }
    }

    id v12 = 0;
  }
  objc_super v14 = [(KTVerifyMapHeadMMDOperation *)self errors];
  id v15 = [v14 count];

  if (v15)
  {
    id v47 = v12;
    v16 = [(KTVerifyMapHeadMMDOperation *)self errors];
    v17 = [v16 allKeys];

    v46 = v17;
    v18 = [v17 componentsJoinedByString:@","];
    uint64_t v19 = +[NSString stringWithFormat:@"SMH MMDs failed for applications: %@", v18];

    v63[0] = NSMultipleUnderlyingErrorsKey;
    v20 = [(KTVerifyMapHeadMMDOperation *)self errors];
    v21 = [v20 allValues];
    v63[1] = NSLocalizedDescriptionKey;
    v64[0] = v21;
    v45 = (void *)v19;
    v64[1] = v19;
    uint64_t v22 = +[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];

    v44 = (void *)v22;
    v23 = +[NSError errorWithDomain:@"TransparencyErrorVerify" code:-383 userInfo:v22];
    [(KTResultOperation *)self setError:v23];

    v24 = +[NSMutableString string];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = [(KTVerifyMapHeadMMDOperation *)self failedSMHs];
    id v25 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v49 = *(void *)v55;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v55 != v49) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v54 + 1) + 8 * i);
          [v24 appendFormat:@"%@:", v28];
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          v29 = self;
          v30 = [(KTVerifyMapHeadMMDOperation *)self failedSMHs];
          v31 = [v30 objectForKeyedSubscript:v28];

          id v32 = [v31 countByEnumeratingWithState:&v50 objects:v61 count:16];
          if (v32)
          {
            id v33 = v32;
            uint64_t v34 = *(void *)v51;
            do
            {
              for (j = 0; j != v33; j = (char *)j + 1)
              {
                if (*(void *)v51 != v34) {
                  objc_enumerationMutation(v31);
                }
                v36 = [*(id *)(*((void *)&v50 + 1) + 8 * (void)j) base64EncodedStringWithOptions:0];
                [v24 appendFormat:@"%@;", v36];
              }
              id v33 = [v31 countByEnumeratingWithState:&v50 objects:v61 count:16];
            }
            while (v33);
          }

          self = v29;
        }
        id v26 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
      }
      while (v26);
    }

    v37 = [(KTVerifyMapHeadMMDOperation *)self backgroundOpId];
    v38 = [(KTVerifyMapHeadMMDOperation *)self deps];
    [v38 smDataStore];
    v40 = v39 = self;
    v41 = [(KTVerifyMapHeadMMDOperation *)v39 name];
    v42 = [(KTResultOperation *)v39 error];
    +[KTBackgroundSystemValidationOperation addErrorToBackgroundOp:v37 smDataStore:v40 failureDataString:v24 type:v41 serverHint:0 failure:v42];

    id v12 = v47;
  }
  if (qword_100326770 != -1) {
    dispatch_once(&qword_100326770, &stru_1002B95B8);
  }
  v43 = qword_100326778;
  if (os_log_type_enabled((os_log_t)qword_100326778, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "VerifyMapHeadMMD: end", buf, 2u);
  }
}

- (BOOL)handlePendingMapHeadMMDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_10002ED98;
  v21 = sub_10002EDA8;
  id v22 = 0;
  id location = 0;
  objc_initWeak(&location, self);
  id v7 = [(KTVerifyMapHeadMMDOperation *)self deps];
  unsigned __int8 v8 = [v7 dataStore];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002EDB0;
  v12[3] = &unk_1002B9600;
  objc_copyWeak(&v15, &location);
  id v9 = v6;
  id v13 = v9;
  objc_super v14 = &v17;
  [v8 performForSMHsWithUnverifiedMMD:v9 error:a4 block:v12];

  if (a4)
  {
    v10 = (void *)v18[5];
    if (v10) {
      *a4 = v10;
    }
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v17, 8);

  return 0;
}

- (id)verifyMapHeadMMDs:(id)a3 application:(id)a4 error:(id *)a5
{
  v42 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = +[NSMutableArray array];
  v45 = +[NSMutableArray array];
  v48 = self;
  v10 = [(KTVerifyMapHeadMMDOperation *)self deps];
  unsigned __int8 v11 = [v10 publicKeyStore];
  v43 = v8;
  v46 = [v11 applicationPublicKeyStore:v8];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v7;
  id v12 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v47 = *(void *)v53;
    do
    {
      objc_super v14 = 0;
      do
      {
        if (*(void *)v53 != v47) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v52 + 1) + 8 * (void)v14);
        uint64_t v17 = [v15 sth];
        id v51 = 0;
        v18 = +[SignedObjectHolder parseFromData:v17 error:&v51];
        id v19 = v51;

        if (v18)
        {
          v20 = [v46 appSthKeyStore];
          v21 = [v20 signatureVerifier];
          [v18 setVerifier:v21];

          [v15 receiptTime];
          id v50 = v19;
          id v22 = [v18 verifyMMD:&v50];
          id v23 = v50;

          [v15 setUnsigned:"mmdVerified" value:v22];
          if (!v22)
          {
            v24 = [v15 sth];
            [v45 addObject:v24];

            [v9 addObject:v23];
          }
          id v25 = v9;
          id v26 = [(KTVerifyMapHeadMMDOperation *)v48 deps];
          v27 = [v26 dataStore];
          id v49 = v23;
          unsigned __int8 v28 = [v27 persistAndRefaultObject:v15 error:&v49];
          id v19 = v49;

          if (v28) {
            goto LABEL_16;
          }
          if (qword_100326770 != -1) {
            dispatch_once(&qword_100326770, &stru_1002B9620);
          }
          v29 = qword_100326778;
          if (os_log_type_enabled((os_log_t)qword_100326778, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v59 = v19;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "VerifyMapHeadMMD: failed to save MMD verified SMHs: %@", buf, 0xCu);
          }
          if (!v19)
          {
LABEL_16:
            id v9 = v25;
            goto LABEL_19;
          }
          v30 = [(KTVerifyMapHeadMMDOperation *)v48 deps];
          v31 = [v30 dataStore];
          [v31 reportCoreDataPersistEventForLocation:@"verifyMapHeadMMDs" underlyingError:v19];

          id v9 = v25;
          id v32 = v25;
        }
        else
        {
          id v33 = [v15 sth];
          [v45 addObject:v33];

          uint64_t v34 = [(KTVerifyMapHeadMMDOperation *)v48 deps];
          v35 = [v34 dataStore];
          [v35 deleteObject:v15];

          id v32 = v9;
        }
        [v32 addObject:v19, v42];
LABEL_19:

        objc_super v14 = (char *)v14 + 1;
      }
      while (v13 != v14);
      id v13 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v13);
  }

  if ([v9 count])
  {
    NSErrorUserInfoKey v56 = NSMultipleUnderlyingErrorsKey;
    long long v57 = v9;
    v36 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    v37 = +[NSError errorWithDomain:@"TransparencyErrorVerify" code:-383 userInfo:v36];
    v38 = v37;
    if (v42 && v37) {
      id *v42 = v37;
    }
  }
  if (objc_msgSend(v45, "count", v42)) {
    v39 = v45;
  }
  else {
    v39 = 0;
  }
  id v40 = v39;

  return v40;
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSUUID)backgroundOpId
{
  return (NSUUID *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBackgroundOpId:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (NSMutableDictionary)errors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setErrors:(id)a3
{
}

- (NSMutableDictionary)failedSMHs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFailedSMHs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedSMHs, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_backgroundOpId, 0);

  objc_storeStrong((id *)&self->_deps, 0);
}

@end