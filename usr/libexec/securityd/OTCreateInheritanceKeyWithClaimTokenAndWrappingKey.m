@interface OTCreateInheritanceKeyWithClaimTokenAndWrappingKey
- (NSData)claimTokenData;
- (NSData)wrappingKeyData;
- (NSOperation)finishOp;
- (NSUUID)uuid;
- (OTCreateInheritanceKeyWithClaimTokenAndWrappingKey)initWithUUID:(id)a3 claimTokenData:(id)a4 wrappingKeyData:(id)a5 dependencies:(id)a6;
- (OTInheritanceKey)ik;
- (OTInheritanceKey)oldIK;
- (OTOperationDependencies)deps;
- (void)groupStart;
- (void)proceedWithKeys:(id)a3 salt:(id)a4;
- (void)setClaimTokenData:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setIk:(id)a3;
- (void)setOldIK:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWrappingKeyData:(id)a3;
@end

@implementation OTCreateInheritanceKeyWithClaimTokenAndWrappingKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishOp, 0);
  objc_storeStrong((id *)&self->_oldIK, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_ik, 0);
  objc_storeStrong((id *)&self->_wrappingKeyData, 0);

  objc_storeStrong((id *)&self->_claimTokenData, 0);
}

- (void)setFinishOp:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 176, 1);
}

- (void)setOldIK:(id)a3
{
}

- (OTInheritanceKey)oldIK
{
  return (OTInheritanceKey *)objc_getProperty(self, a2, 168, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 152, 1);
}

- (void)setIk:(id)a3
{
}

- (OTInheritanceKey)ik
{
  return (OTInheritanceKey *)objc_getProperty(self, a2, 144, 1);
}

- (void)setWrappingKeyData:(id)a3
{
}

- (NSData)wrappingKeyData
{
  return (NSData *)objc_getProperty(self, a2, 136, 1);
}

- (void)setClaimTokenData:(id)a3
{
}

- (NSData)claimTokenData
{
  return (NSData *)objc_getProperty(self, a2, 128, 1);
}

- (void)proceedWithKeys:(id)a3 salt:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v7 = objc_alloc((Class)OTInheritanceKey);
  v8 = [(OTCreateInheritanceKeyWithClaimTokenAndWrappingKey *)self uuid];
  v9 = [(OTCreateInheritanceKeyWithClaimTokenAndWrappingKey *)self claimTokenData];
  v10 = [(OTCreateInheritanceKeyWithClaimTokenAndWrappingKey *)self wrappingKeyData];
  id v27 = 0;
  id v11 = [v7 initWithUUID:v8 claimTokenData:v9 wrappingKeyData:v10 error:&v27];
  id v12 = v27;
  [(OTCreateInheritanceKeyWithClaimTokenAndWrappingKey *)self setIk:v11];

  v13 = [(OTCreateInheritanceKeyWithClaimTokenAndWrappingKey *)self ik];
  BOOL v14 = v13 == 0;

  if (v14)
  {
    v23 = sub_10000B070("SecError");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "octagon: failed to create inheritance key (w/claimtoken+wrappingkey): %@", buf, 0xCu);
    }

    [(CKKSResultOperation *)self setError:v12];
    v17 = [(OTCreateInheritanceKeyWithClaimTokenAndWrappingKey *)self finishOp];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v17];
  }
  else
  {
    v15 = [(OTCreateInheritanceKeyWithClaimTokenAndWrappingKey *)self ik];
    v16 = [v15 recoveryKeyData];
    v17 = [v16 base64EncodedStringWithOptions:0];

    v18 = [(OTCreateInheritanceKeyWithClaimTokenAndWrappingKey *)self deps];
    v19 = [v18 cuttlefishXPCWrapper];
    v20 = [(OTCreateInheritanceKeyWithClaimTokenAndWrappingKey *)self deps];
    v21 = [v20 activeAccount];
    v22 = [(OTCreateInheritanceKeyWithClaimTokenAndWrappingKey *)self uuid];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000AC3C4;
    v25[3] = &unk_1002F8E10;
    objc_copyWeak(&v26, &location);
    [v19 createCustodianRecoveryKeyWithSpecificUser:v21 recoveryKey:v17 salt:v6 ckksKeys:v24 uuid:v22 kind:2 reply:v25];

    objc_destroyWeak(&v26);
  }

  objc_destroyWeak(&location);
}

- (void)groupStart
{
  id v3 = objc_alloc_init((Class)NSOperation);
  [(OTCreateInheritanceKeyWithClaimTokenAndWrappingKey *)self setFinishOp:v3];

  v4 = [(OTCreateInheritanceKeyWithClaimTokenAndWrappingKey *)self finishOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v4];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [OTFetchCKKSKeysOperation alloc];
  id v6 = [(OTCreateInheritanceKeyWithClaimTokenAndWrappingKey *)self deps];
  id v7 = [(OTFetchCKKSKeysOperation *)v5 initWithDependencies:v6 refetchNeeded:0];

  [(CKKSGroupOperation *)self runBeforeGroupFinished:v7];
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_1000AC7B8;
  v13 = &unk_1003077C8;
  objc_copyWeak(&v16, &location);
  v8 = v7;
  BOOL v14 = v8;
  v15 = &stru_10030AA90;
  v9 = +[CKKSResultOperation named:@"setting-recovery-tlks" withBlock:&v10];
  [v9 addDependency:v8, v10, v11, v12, v13];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v9];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (OTCreateInheritanceKeyWithClaimTokenAndWrappingKey)initWithUUID:(id)a3 claimTokenData:(id)a4 wrappingKeyData:(id)a5 dependencies:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)OTCreateInheritanceKeyWithClaimTokenAndWrappingKey;
  BOOL v14 = [(CKKSGroupOperation *)&v17 init];
  if (v14)
  {
    id v15 = v10;
    if (!v10) {
      id v15 = objc_alloc_init((Class)NSUUID);
    }
    objc_storeStrong((id *)&v14->_uuid, v15);
    if (!v10) {

    }
    objc_storeStrong((id *)&v14->_claimTokenData, a4);
    objc_storeStrong((id *)&v14->_wrappingKeyData, a5);
    objc_storeStrong((id *)&v14->_deps, a6);
  }

  return v14;
}

@end