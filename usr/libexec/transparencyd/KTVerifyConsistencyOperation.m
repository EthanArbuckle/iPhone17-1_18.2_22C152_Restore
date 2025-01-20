@interface KTVerifyConsistencyOperation
- (BOOL)downloadConsistencyProofRequest:(id)a3 lastVerifiedRevision:(id)a4 application:(id)a5 error:(id *)a6;
- (BOOL)verifyConsistency:(id)a3 error:(id *)a4;
- (KTOperationDependencies)deps;
- (KTVerifyConsistencyOperation)initWithDependencies:(id)a3 opId:(id)a4;
- (NSMutableDictionary)errors;
- (NSMutableDictionary)failedRevs;
- (NSMutableDictionary)serverHints;
- (NSOperation)finishedOp;
- (NSUUID)backgroundOpId;
- (OS_dispatch_group)fetchGroup;
- (OS_dispatch_queue)fetchQueue;
- (void)groupStart;
- (void)setBackgroundOpId:(id)a3;
- (void)setDeps:(id)a3;
- (void)setErrors:(id)a3;
- (void)setFailedRevs:(id)a3;
- (void)setFetchGroup:(id)a3;
- (void)setFetchQueue:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setServerHints:(id)a3;
@end

@implementation KTVerifyConsistencyOperation

- (KTVerifyConsistencyOperation)initWithDependencies:(id)a3 opId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)KTVerifyConsistencyOperation;
  v9 = [(KTGroupOperation *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deps, a3);
    [(KTVerifyConsistencyOperation *)v10 setBackgroundOpId:v8];
    v11 = +[NSMutableDictionary dictionary];
    [(KTVerifyConsistencyOperation *)v10 setErrors:v11];

    v12 = +[NSMutableDictionary dictionary];
    [(KTVerifyConsistencyOperation *)v10 setFailedRevs:v12];

    v13 = +[NSMutableDictionary dictionary];
    [(KTVerifyConsistencyOperation *)v10 setServerHints:v13];

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("VerifyConsistency_FetchWaiter", v14);
    [(KTVerifyConsistencyOperation *)v10 setFetchQueue:v15];

    [(KTGroupOperation *)v10 setName:@"Consistency"];
  }

  return v10;
}

- (void)groupStart
{
  if (qword_100326640 != -1) {
    dispatch_once(&qword_100326640, &stru_1002B6BF0);
  }
  v3 = qword_100326648;
  if (os_log_type_enabled((os_log_t)qword_100326648, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "VerifyConsistency: start", buf, 2u);
  }
  dispatch_group_t v4 = dispatch_group_create();
  [(KTVerifyConsistencyOperation *)self setFetchGroup:v4];

  id v5 = objc_alloc_init((Class)NSOperation);
  [(KTVerifyConsistencyOperation *)self setFinishedOp:v5];

  uint64_t v6 = [(KTVerifyConsistencyOperation *)self finishedOp];
  [(KTGroupOperation *)self dependOnBeforeGroupFinished:v6];

  id v26 = 0;
  LOBYTE(v6) = [(KTVerifyConsistencyOperation *)self verifyConsistency:kKTApplicationIdentifierIDS error:&v26];
  id v7 = v26;
  id v8 = v7;
  if ((v6 & 1) == 0)
  {
    if (v7)
    {
      if (qword_100326640 != -1) {
        dispatch_once(&qword_100326640, &stru_1002B6C10);
      }
      v9 = qword_100326648;
      if (os_log_type_enabled((os_log_t)qword_100326648, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Verify IDS consistency failed: %@", buf, 0xCu);
      }
    }

    id v8 = 0;
  }
  id v25 = v8;
  unsigned __int8 v10 = [(KTVerifyConsistencyOperation *)self verifyConsistency:kKTApplicationIdentifierTLT error:&v25];
  id v11 = v25;

  if ((v10 & 1) == 0)
  {
    if (v11)
    {
      if (qword_100326640 != -1) {
        dispatch_once(&qword_100326640, &stru_1002B6C30);
      }
      v12 = qword_100326648;
      if (os_log_type_enabled((os_log_t)qword_100326648, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Verify TLT consistency failed: %@", buf, 0xCu);
      }
    }

    id v11 = 0;
  }
  id v24 = v11;
  unsigned __int8 v13 = [(KTVerifyConsistencyOperation *)self verifyConsistency:kKTApplicationIdentifierIDSFaceTime error:&v24];
  id v14 = v24;

  if ((v13 & 1) == 0)
  {
    if (v14)
    {
      if (qword_100326640 != -1) {
        dispatch_once(&qword_100326640, &stru_1002B6C50);
      }
      dispatch_queue_t v15 = qword_100326648;
      if (os_log_type_enabled((os_log_t)qword_100326648, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Verify FT consistency failed: %@", buf, 0xCu);
      }
    }

    id v14 = 0;
  }
  id v23 = v14;
  unsigned __int8 v16 = [(KTVerifyConsistencyOperation *)self verifyConsistency:kKTApplicationIdentifierIDSMultiplex error:&v23];
  id v17 = v23;

  if ((v16 & 1) == 0)
  {
    if (v17)
    {
      if (qword_100326640 != -1) {
        dispatch_once(&qword_100326640, &stru_1002B6C70);
      }
      v18 = qword_100326648;
      if (os_log_type_enabled((os_log_t)qword_100326648, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Verify MP consistency failed: %@", buf, 0xCu);
      }
    }

    id v17 = 0;
  }
  if (qword_100326640 != -1) {
    dispatch_once(&qword_100326640, &stru_1002B6C90);
  }
  v19 = qword_100326648;
  if (os_log_type_enabled((os_log_t)qword_100326648, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "VerifyConsistency: waiting for fetches to finish validating", buf, 2u);
  }
  v20 = [(KTVerifyConsistencyOperation *)self fetchGroup];
  v21 = [(KTVerifyConsistencyOperation *)self fetchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000064F0;
  block[3] = &unk_1002B6CF8;
  block[4] = self;
  dispatch_group_notify(v20, v21, block);
}

- (BOOL)verifyConsistency:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(KTVerifyConsistencyOperation *)self deps];
  id v8 = [v7 publicKeyStore];
  v9 = [v8 applicationPublicKeyStore:v6];

  id v10 = [v9 patLogBeginningMs];
  if ([v6 isEqual:kKTApplicationIdentifierTLT])
  {
    id v11 = [(KTVerifyConsistencyOperation *)self deps];
    v12 = [v11 publicKeyStore];
    unsigned __int8 v13 = [v12 tltKeyStore];

    id v10 = [v13 tltLogBeginningMs];
    v9 = v13;
  }
  id v14 = [(KTVerifyConsistencyOperation *)self deps];
  dispatch_queue_t v15 = [v14 dataStore];
  id v54 = 0;
  uint64_t v16 = [v15 latestConsistencyVerifiedTreeHeadRevision:v6 logBeginMs:v10 error:&v54];
  id v17 = v54;

  v47 = (void *)v16;
  if (v16)
  {
    v46 = a4;
    v18 = [(KTVerifyConsistencyOperation *)self deps];
    v19 = [v18 dataStore];
    id v53 = v17;
    v20 = [v19 unverifiedRevisions:v6 isMapHead:0 inclusion:0 logBeginMs:v10 error:&v53];
    id v21 = v53;

    if (v20 && [v20 count])
    {
      id v22 = [v20 mutableCopy];
      v45 = v9;
      if ([v22 count]
        && (![v22 containsObject:v47] || (unint64_t)objc_msgSend(v22, "count") > 1))
      {
        [v22 sortUsingSelector:"compare:"];
        v27 = [(KTVerifyConsistencyOperation *)self deps];
        id v28 = [v27 logClient];
        id v44 = v22;
        v29 = +[KTContext chunkArray:chunkSize:](KTContext, "chunkArray:chunkSize:", v22, [v28 consistencyMaxProofs]);

        if (qword_100326640 != -1) {
          dispatch_once(&qword_100326640, &stru_1002B6D78);
        }
        v43 = v20;
        v30 = (void *)qword_100326648;
        if (os_log_type_enabled((os_log_t)qword_100326648, OS_LOG_TYPE_DEFAULT))
        {
          v31 = v30;
          id v32 = [v29 count];
          *(_DWORD *)buf = 138543874;
          id v57 = v6;
          __int16 v58 = 2114;
          id v59 = v22;
          __int16 v60 = 2048;
          id v61 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "fetching consistency proof for %{public}@ %{public}@ in %lu chunks", buf, 0x20u);
        }
        id v33 = v6;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v34 = v29;
        id v35 = [v34 countByEnumeratingWithState:&v49 objects:v55 count:16];
        if (v35)
        {
          id v36 = v35;
          uint64_t v37 = *(void *)v50;
          char v24 = 1;
          do
          {
            for (i = 0; i != v36; i = (char *)i + 1)
            {
              v39 = v21;
              if (*(void *)v50 != v37) {
                objc_enumerationMutation(v34);
              }
              uint64_t v40 = *(void *)(*((void *)&v49 + 1) + 8 * i);
              id v48 = v21;
              unsigned __int8 v41 = -[KTVerifyConsistencyOperation downloadConsistencyProofRequest:lastVerifiedRevision:application:error:](self, "downloadConsistencyProofRequest:lastVerifiedRevision:application:error:", v40, v47, v33, &v48, v43);
              id v21 = v48;

              if ((v41 & 1) == 0)
              {
                char v24 = 0;
                if (v46)
                {
                  if (v21)
                  {
                    char v24 = 0;
                    id *v46 = v21;
                  }
                }
              }
            }
            id v36 = [v34 countByEnumeratingWithState:&v49 objects:v55 count:16];
          }
          while (v36);
        }
        else
        {
          char v24 = 1;
        }

        id v6 = v33;
        v20 = v43;
        id v22 = v44;
      }
      else
      {
        if (qword_100326640 != -1) {
          dispatch_once(&qword_100326640, &stru_1002B6D58);
        }
        id v23 = qword_100326648;
        char v24 = 1;
        if (os_log_type_enabled((os_log_t)qword_100326648, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Skipping consistency proof request -- only one revision", buf, 2u);
        }
      }

      v9 = v45;
    }
    else if (v21)
    {
      if (qword_100326640 != -1) {
        dispatch_once(&qword_100326640, &stru_1002B6D38);
      }
      id v25 = qword_100326648;
      if (os_log_type_enabled((os_log_t)qword_100326648, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        id v57 = v6;
        __int16 v58 = 2112;
        id v59 = v21;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "failed to get consistency unverified STH revisions for %{public}@: %@", buf, 0x16u);
      }
      if (v46)
      {
        id v21 = v21;
        char v24 = 0;
        id *v46 = v21;
      }
      else
      {
        char v24 = 0;
      }
    }
    else
    {
      char v24 = 1;
    }

    id v17 = v21;
  }
  else
  {
    if (!v17) {
      goto LABEL_27;
    }
    if (qword_100326640 != -1) {
      dispatch_once(&qword_100326640, &stru_1002B6D18);
    }
    id v26 = qword_100326648;
    if (os_log_type_enabled((os_log_t)qword_100326648, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v57 = v6;
      __int16 v58 = 2112;
      id v59 = v17;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "failed to get latest verified STH revision for %{public}@: %@", buf, 0x16u);
    }
    if (a4)
    {
      id v17 = v17;
      char v24 = 0;
      *a4 = v17;
    }
    else
    {
LABEL_27:
      char v24 = 0;
    }
  }

  return v24 & 1;
}

- (BOOL)downloadConsistencyProofRequest:(id)a3 lastVerifiedRevision:(id)a4 application:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unsigned __int8 v13 = +[NSMutableArray arrayWithArray:v10];
  if (([v13 containsObject:v11] & 1) == 0)
  {
    [v13 addObject:v11];
    [v13 sortUsingSelector:"compare:"];
  }
  id v14 = +[TransparencyRPCRequestBuilder buildConsistencyProofRequest:v12 revisions:v13 error:a6];
  id v25 = v10;
  if (v14)
  {
    *(void *)buf = 0;
    v39 = buf;
    uint64_t v40 = 0x3032000000;
    unsigned __int8 v41 = sub_10000758C;
    v42 = sub_10000759C;
    id v43 = 0;
    dispatch_queue_t v15 = [(KTVerifyConsistencyOperation *)self fetchGroup];
    dispatch_group_enter(v15);

    uint64_t v16 = [(KTVerifyConsistencyOperation *)self deps];
    id v17 = [v16 dataStore];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000075A4;
    v32[3] = &unk_1002B6DE0;
    v32[4] = self;
    id v18 = v12;
    id v33 = v18;
    id v34 = v11;
    id v35 = v10;
    id v19 = v13;
    id v36 = v19;
    uint64_t v37 = buf;
    [v17 performBlockAndWaitWithMoc:v32];

    id location = 0;
    objc_initWeak(&location, self);
    v20 = [(KTVerifyConsistencyOperation *)self deps];
    id v21 = [v20 logClient];
    uint64_t v22 = *((void *)v39 + 5);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000780C;
    v26[3] = &unk_1002B6ED0;
    objc_copyWeak(&v30, &location);
    id v27 = v18;
    v29 = buf;
    id v28 = v19;
    [v21 fetchConsistencyProof:v14 uuid:v22 completionHandler:v26];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (qword_100326640 != -1) {
      dispatch_once(&qword_100326640, &stru_1002B6D98);
    }
    id v23 = qword_100326648;
    if (os_log_type_enabled((os_log_t)qword_100326648, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "failed to create consistency proof request", buf, 2u);
    }
  }

  return v14 != 0;
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

- (OS_dispatch_group)fetchGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFetchGroup:(id)a3
{
}

- (OS_dispatch_queue)fetchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFetchQueue:(id)a3
{
}

- (NSMutableDictionary)errors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setErrors:(id)a3
{
}

- (NSMutableDictionary)failedRevs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setFailedRevs:(id)a3
{
}

- (NSMutableDictionary)serverHints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setServerHints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHints, 0);
  objc_storeStrong((id *)&self->_failedRevs, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_fetchGroup, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_backgroundOpId, 0);

  objc_storeStrong((id *)&self->_deps, 0);
}

@end