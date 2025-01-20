@interface OTResetOperation
- (BOOL)isGuitarfish;
- (BOOL)notifyIdMS;
- (CuttlefishXPCWrapper)cuttlefishXPCWrapper;
- (NSOperation)finishedOp;
- (NSString)containerName;
- (NSString)contextID;
- (NSString)idmsCuttlefishPassword;
- (NSString)idmsTargetContext;
- (OTOperationDependencies)deps;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (id)init:(id)a3 contextID:(id)a4 reason:(int64_t)a5 idmsTargetContext:(id)a6 idmsCuttlefishPassword:(id)a7 notifyIdMS:(BOOL)a8 isGuitarfish:(BOOL)a9 accountType:(int64_t)a10 intendedState:(id)a11 dependencies:(id)a12 errorState:(id)a13 cuttlefishXPCWrapper:(id)a14;
- (int64_t)accountType;
- (int64_t)resetReason;
- (void)groupStart;
- (void)setAccountType:(int64_t)a3;
- (void)setContainerName:(id)a3;
- (void)setContextID:(id)a3;
- (void)setCuttlefishXPCWrapper:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setIdmsCuttlefishPassword:(id)a3;
- (void)setIdmsTargetContext:(id)a3;
- (void)setIsGuitarfish:(BOOL)a3;
- (void)setNextState:(id)a3;
- (void)setNotifyIdMS:(BOOL)a3;
- (void)setResetReason:(int64_t)a3;
@end

@implementation OTResetOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_cuttlefishXPCWrapper + 6), 0);
  objc_storeStrong((id *)((char *)&self->_contextID + 6), 0);
  objc_storeStrong((id *)((char *)&self->_containerName + 6), 0);
  objc_storeStrong((id *)((char *)&self->_accountType + 6), 0);
  objc_storeStrong((id *)((char *)&self->_idmsTargetContext + 6), 0);
  objc_storeStrong((id *)((char *)&self->_resetReason + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);

  objc_storeStrong((id *)(&self->_isGuitarfish + 5), 0);
}

- (void)setFinishedOp:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 214, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 206, 1);
}

- (void)setCuttlefishXPCWrapper:(id)a3
{
}

- (CuttlefishXPCWrapper)cuttlefishXPCWrapper
{
  return (CuttlefishXPCWrapper *)objc_getProperty(self, a2, 198, 1);
}

- (void)setContextID:(id)a3
{
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 190, 1);
}

- (void)setContainerName:(id)a3
{
}

- (NSString)containerName
{
  return (NSString *)objc_getProperty(self, a2, 182, 1);
}

- (void)setAccountType:(int64_t)a3
{
  *(NSString **)((char *)&self->_idmsCuttlefishPassword + 6) = (NSString *)a3;
}

- (int64_t)accountType
{
  return *(int64_t *)((char *)&self->_idmsCuttlefishPassword + 6);
}

- (void)setIsGuitarfish:(BOOL)a3
{
  self->_isGuitarfish = a3;
}

- (BOOL)isGuitarfish
{
  return self->_isGuitarfish;
}

- (void)setNotifyIdMS:(BOOL)a3
{
  self->_notifyIdMS = a3;
}

- (BOOL)notifyIdMS
{
  return self->_notifyIdMS;
}

- (void)setIdmsCuttlefishPassword:(id)a3
{
}

- (NSString)idmsCuttlefishPassword
{
  return (NSString *)objc_getProperty(self, a2, 166, 1);
}

- (void)setIdmsTargetContext:(id)a3
{
}

- (NSString)idmsTargetContext
{
  return (NSString *)objc_getProperty(self, a2, 158, 1);
}

- (void)setResetReason:(int64_t)a3
{
  *(OctagonStateString **)((char *)&self->_nextState + 6) = (OctagonStateString *)a3;
}

- (int64_t)resetReason
{
  return *(int64_t *)((char *)&self->_nextState + 6);
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

- (void)groupStart
{
  v3 = sub_10000B070("octagon-authkit");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Attempting to reset octagon", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)NSOperation);
  [(OTResetOperation *)self setFinishedOp:v4];

  v5 = [(OTResetOperation *)self finishedOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v5];

  v6 = [(OTResetOperation *)self deps];
  v7 = [v6 activeAccount];
  v28 = [v7 altDSID];

  if (v28)
  {
    v8 = [(OTResetOperation *)self deps];
    v9 = [v8 authKitAdapter];
    id v31 = 0;
    unsigned __int8 v25 = [v9 accountIsDemoAccountByAltDSID:v28 error:&v31];
    id v27 = v31;

    if (v27)
    {
      v10 = sub_10000B070("SecError");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v27;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "octagon-authkit: failed to fetch demo account flag: %@", buf, 0xCu);
      }
    }
    unsigned int IsInternalRelease = SecIsInternalRelease();
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v26 = [(OTResetOperation *)self cuttlefishXPCWrapper];
    v11 = [(OTResetOperation *)self deps];
    v12 = [v11 activeAccount];
    int64_t v13 = [(OTResetOperation *)self resetReason];
    v14 = [(OTResetOperation *)self idmsTargetContext];
    v15 = [(OTResetOperation *)self idmsCuttlefishPassword];
    BOOL v16 = [(OTResetOperation *)self notifyIdMS];
    unsigned __int8 v17 = [(OTResetOperation *)self isGuitarfish];
    int64_t v18 = [(OTResetOperation *)self accountType];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1001D9BB0;
    v29[3] = &unk_100307258;
    objc_copyWeak(&v30, (id *)buf);
    BYTE1(v23) = v17;
    LOBYTE(v23) = v25;
    [v26 resetWithSpecificUser:v12 resetReason:v13 idmsTargetContext:v14 idmsCuttlefishPassword:v15 notifyIdMS:IsInternalRelease internalAccount:v23 demoAccount:v18 isGuitarfish:v29 accountType:v23 reply:v18];

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v19 = sub_10000B070("authkit");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [(OTResetOperation *)self deps];
      v21 = [v20 activeAccount];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);
    }
    v22 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:59 description:@"No altDSID configured"];
    [(CKKSResultOperation *)self setError:v22];

    id v27 = [(OTResetOperation *)self finishedOp];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v27];
  }
}

- (id)init:(id)a3 contextID:(id)a4 reason:(int64_t)a5 idmsTargetContext:(id)a6 idmsCuttlefishPassword:(id)a7 notifyIdMS:(BOOL)a8 isGuitarfish:(BOOL)a9 accountType:(int64_t)a10 intendedState:(id)a11 dependencies:(id)a12 errorState:(id)a13 cuttlefishXPCWrapper:(id)a14
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a6;
  id v28 = a7;
  id v27 = a11;
  id v26 = a12;
  id v25 = a13;
  id v19 = a14;
  v32.receiver = self;
  v32.super_class = (Class)OTResetOperation;
  v20 = [(CKKSGroupOperation *)&v32 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)(v20 + 134), a11);
    objc_storeStrong((id *)(v21 + 142), a13);
    objc_storeStrong((id *)(v21 + 182), a3);
    objc_storeStrong((id *)(v21 + 190), a4);
    objc_storeStrong((id *)(v21 + 198), a14);
    *(void *)(v21 + 150) = a5;
    objc_storeStrong((id *)(v21 + 158), a6);
    objc_storeStrong((id *)(v21 + 166), a7);
    v21[128] = a8;
    objc_storeStrong((id *)(v21 + 206), a12);
    v21[129] = a9;
    *(void *)(v21 + 174) = a10;
  }

  return v21;
}

@end