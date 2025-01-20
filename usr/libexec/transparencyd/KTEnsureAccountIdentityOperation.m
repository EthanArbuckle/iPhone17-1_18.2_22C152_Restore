@interface KTEnsureAccountIdentityOperation
- (BOOL)identityCreated;
- (KTEnsureAccountIdentityOperation)initWithDependencies:(id)a3 pcsOperation:(id)a4;
- (KTOperationDependencies)deps;
- (KTPCSOperationDependency)pcsOperation;
- (NSOperation)finishedOp;
- (NSString)identity;
- (OS_os_transaction)transaction;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setIdentityCreated:(BOOL)a3;
- (void)setPcsOperation:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation KTEnsureAccountIdentityOperation

- (KTEnsureAccountIdentityOperation)initWithDependencies:(id)a3 pcsOperation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KTEnsureAccountIdentityOperation;
  v9 = [(KTGroupOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)(v9 + 134), a4);
    objc_storeStrong((id *)(v10 + 142), a3);
    v10[120] = 0;
  }

  return (KTEnsureAccountIdentityOperation *)v10;
}

- (void)groupStart
{
  v3 = [(KTEnsureAccountIdentityOperation *)self pcsOperation];
  id v25 = 0;
  v4 = [v3 getCurrentKTPCSIdentity:off_100325BD8 error:&v25];
  id v5 = v25;

  if (v4)
  {
    [v4 identity];
    [(KTEnsureAccountIdentityOperation *)self setIdentity:PCSIdentityGetPublicKey()];
    goto LABEL_20;
  }
  if ([v5 code] == (id)-25300)
  {
    if (qword_1003267F0 != -1) {
      dispatch_once(&qword_1003267F0, &stru_1002BB618);
    }
    v6 = qword_1003267F8;
    if (os_log_type_enabled((os_log_t)qword_1003267F8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "There is no identity, ok to continue creating one", buf, 2u);
    }
    goto LABEL_10;
  }
  if ([v5 code] == (id)27)
  {
    id v7 = [v5 domain];
    unsigned __int8 v8 = [v7 isEqual:kPCSErrorDomain];

    if (v8)
    {
LABEL_10:
      v9 = (void *)os_transaction_create();
      [(KTEnsureAccountIdentityOperation *)self setTransaction:v9];

      id v10 = objc_alloc_init((Class)NSOperation);
      [(KTEnsureAccountIdentityOperation *)self setFinishedOp:v10];

      v11 = [(KTEnsureAccountIdentityOperation *)self finishedOp];
      [(KTGroupOperation *)self dependOnBeforeGroupFinished:v11];

      objc_super v12 = [(KTEnsureAccountIdentityOperation *)self pcsOperation];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100056F54;
      v24[3] = &unk_1002BB6C0;
      v24[4] = self;
      [v12 createManateeIdentity:0 service:off_100325BD8 complete:v24];
LABEL_11:

      goto LABEL_20;
    }
  }
  v13 = [(KTEnsureAccountIdentityOperation *)self deps];
  v14 = [v13 lockStateTracker];
  unsigned int v15 = [v14 isLockedError:v5];

  if (v15)
  {
    [(KTResultOperation *)self setError:v5];
    goto LABEL_20;
  }
  v16 = [(KTEnsureAccountIdentityOperation *)self deps];
  v17 = [v16 reachabilityTracker];
  unsigned int v18 = [(id)objc_opt_class() isNetworkError:v5];

  if (v18)
  {
    [(KTResultOperation *)self setError:v5];
    v19 = [(KTEnsureAccountIdentityOperation *)self deps];
    v20 = [v19 networkTimeout];
    [v20 networkWithFeedback:1];

    goto LABEL_20;
  }
  v21 = +[TransparencyError errorWithDomain:kTransparencyErrorInterface code:-350 errorLevel:4 underlyingError:v5 description:@"Identity creation failed"];
  [(KTResultOperation *)self setError:v21];

  if (qword_1003267F0 != -1) {
    dispatch_once(&qword_1003267F0, &stru_1002BB638);
  }
  v22 = (void *)qword_1003267F8;
  if (os_log_type_enabled((os_log_t)qword_1003267F8, OS_LOG_TYPE_ERROR))
  {
    objc_super v12 = v22;
    v23 = [(KTResultOperation *)self error];
    *(_DWORD *)buf = 138412290;
    v27 = v23;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "createManateeIdentity no identity returned: %@", buf, 0xCu);

    goto LABEL_11;
  }
LABEL_20:
}

- (BOOL)identityCreated
{
  return self->_identityCreated;
}

- (void)setIdentityCreated:(BOOL)a3
{
  self->_identityCreated = a3;
}

- (NSString)identity
{
  return (NSString *)objc_getProperty(self, a2, 126, 1);
}

- (void)setIdentity:(id)a3
{
}

- (KTPCSOperationDependency)pcsOperation
{
  return (KTPCSOperationDependency *)objc_getProperty(self, a2, 134, 1);
}

- (void)setPcsOperation:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 142, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 150, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 158, 1);
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_finishedOp + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_pcsOperation + 6), 0);
  objc_storeStrong((id *)((char *)&self->_identity + 6), 0);

  objc_storeStrong((id *)(&self->_identityCreated + 6), 0);
}

@end