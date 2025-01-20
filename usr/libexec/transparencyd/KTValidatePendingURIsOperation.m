@interface KTValidatePendingURIsOperation
- (KTOperationDependencies)deps;
- (KTValidatePendingURIsOperation)initWithApplication:(id)a3 opId:(id)a4 dependencies:(id)a5;
- (NSOperation)finishedOp;
- (NSString)application;
- (NSUUID)opUUID;
- (OS_os_transaction)transaction;
- (void)groupStart;
- (void)setApplication:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setOpUUID:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation KTValidatePendingURIsOperation

- (KTValidatePendingURIsOperation)initWithApplication:(id)a3 opId:(id)a4 dependencies:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)KTValidatePendingURIsOperation;
  v11 = [(KTGroupOperation *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(KTValidatePendingURIsOperation *)v11 setDeps:v10];
    [(KTValidatePendingURIsOperation *)v12 setApplication:v8];
    [(KTValidatePendingURIsOperation *)v12 setOpUUID:v9];
  }

  return v12;
}

- (void)groupStart
{
  v3 = [(KTValidatePendingURIsOperation *)self deps];
  v4 = [v3 dew];
  id v5 = [v4 validatePendingURILimit];

  v6 = [(KTValidatePendingURIsOperation *)self deps];
  v7 = [v6 dew];
  id v8 = [v7 validatePendingSMTLimit];

  if (qword_100326680 != -1) {
    dispatch_once(&qword_100326680, &stru_1002B7250);
  }
  id v9 = qword_100326688;
  if (os_log_type_enabled((os_log_t)qword_100326688, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "ValidatePendingURIs: start", buf, 2u);
  }
  id v10 = (void *)os_transaction_create();
  [(KTValidatePendingURIsOperation *)self setTransaction:v10];

  v11 = [(KTValidatePendingURIsOperation *)self deps];
  v12 = [v11 dataStore];
  v13 = [(KTValidatePendingURIsOperation *)self application];
  id v44 = 0;
  v37 = [v12 pendingVerificationURIs:v13 fetchLimit:v5 error:&v44];
  id v14 = v44;

  if (v14)
  {
    if (qword_100326680 != -1) {
      dispatch_once(&qword_100326680, &stru_1002B7270);
    }
    v15 = (void *)qword_100326688;
    if (os_log_type_enabled((os_log_t)qword_100326688, OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      v17 = [(KTValidatePendingURIsOperation *)self application];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v17;
      __int16 v46 = 2112;
      id v47 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "ValidatePendingURIs: failed to get pending peer uris for %@ from data store: %@", buf, 0x16u);
    }
  }
  v18 = [(KTValidatePendingURIsOperation *)self deps];
  v19 = [v18 dataStore];
  v20 = [(KTValidatePendingURIsOperation *)self application];
  id v43 = 0;
  v21 = [v19 getPendingSmtUris:v20 fetchLimit:v8 error:&v43];
  id v22 = v43;

  if (!v22) {
    goto LABEL_17;
  }
  if (qword_100326680 != -1) {
    dispatch_once(&qword_100326680, &stru_1002B7290);
  }
  v23 = (void *)qword_100326688;
  if (os_log_type_enabled((os_log_t)qword_100326688, OS_LOG_TYPE_ERROR))
  {
    v24 = v23;
    v25 = [(KTValidatePendingURIsOperation *)self application];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v25;
    __int16 v46 = 2112;
    id v47 = v22;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "ValidatePendingURIs: failed to get pending SMT uris for %@ from data store: %@", buf, 0x16u);
  }
  if (v14)
  {
    [(KTResultOperation *)self setError:v14];
    [(KTValidatePendingURIsOperation *)self setTransaction:0];
  }
  else
  {
LABEL_17:
    v26 = +[NSMutableSet set];
    [v26 addObjectsFromArray:v37];
    [v26 addObjectsFromArray:v21];
    if (v26 && [v26 count])
    {
      *(void *)buf = 0;
      objc_initWeak((id *)buf, self);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_10000D744;
      v41[3] = &unk_1002B72D8;
      objc_copyWeak(&v42, (id *)buf);
      v27 = +[NSBlockOperation blockOperationWithBlock:v41];
      [(KTValidatePendingURIsOperation *)self setFinishedOp:v27];

      v28 = [(KTValidatePendingURIsOperation *)self finishedOp];
      [(KTGroupOperation *)self dependOnBeforeGroupFinished:v28];

      v29 = [(KTValidatePendingURIsOperation *)self deps];
      v30 = [v29 contextStore];
      v31 = [(KTValidatePendingURIsOperation *)self application];
      v32 = [(KTValidatePendingURIsOperation *)self deps];
      v33 = [v32 logClient];
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_10000D788;
      v38[3] = &unk_1002B7368;
      objc_copyWeak(&v40, (id *)buf);
      id v39 = v26;
      [v30 contextForApplication:v31 logClient:v33 fetchState:1 completionHandler:v38];

      objc_destroyWeak(&v40);
      objc_destroyWeak(&v42);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (qword_100326680 != -1) {
        dispatch_once(&qword_100326680, &stru_1002B72B0);
      }
      v34 = (void *)qword_100326688;
      if (os_log_type_enabled((os_log_t)qword_100326688, OS_LOG_TYPE_INFO))
      {
        v35 = v34;
        v36 = [(KTValidatePendingURIsOperation *)self application];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "ValidatePendingURIs: No pending URIs for %@", buf, 0xCu);
      }
      [(KTValidatePendingURIsOperation *)self setTransaction:0];
    }
  }
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setApplication:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTransaction:(id)a3
{
}

- (NSUUID)opUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 152, 1);
}

- (void)setOpUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opUUID, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_application, 0);

  objc_storeStrong((id *)&self->_deps, 0);
}

@end