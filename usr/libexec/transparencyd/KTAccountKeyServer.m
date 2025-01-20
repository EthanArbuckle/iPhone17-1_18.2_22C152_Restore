@interface KTAccountKeyServer
+ (BOOL)verifyData:(id)a3 signature:(id)a4 accountPublicKeyInfo:(id)a5 error:(id *)a6;
+ (_PCSPublicIdentityData)decodePublicKeyInfo:(id)a3 error:(id *)a4;
+ (id)applicationToService:(id)a3;
+ (id)publicKeyInfoFromIdentity:(_PCSIdentityData *)a3 error:(id *)a4;
+ (id)sharedKeyService:(id)a3;
+ (id)sharedKeyServiceForApplication:(id)a3;
+ (void)clearCachedPCSIdentities;
+ (void)startMetrics:(id)a3 services:(id)a4;
- (BOOL)haveIdentity;
- (BOOL)isAccountIdentity:(id)a3 error:(id *)a4;
- (BOOL)outstandingCreationSignal;
- (KTAccountKeyServer)initWithService:(id)a3;
- (NSDate)_pcsIdentityCachedTime;
- (OS_dispatch_group)creationGroup;
- (OS_dispatch_queue)creationQueue;
- (PCSCurrentIdentity)_pcsIdentity;
- (_PCSIdentitySetData)copyPCSIdentitySet:(id *)a3;
- (__CFString)service;
- (id)copyCachedPCSIdentity;
- (id)initKeyServiceWithApplication:(id)a3;
- (id)pcsOptions:(id *)a3;
- (id)publicPublicKey:(id *)a3;
- (os_unfair_lock_s)identityCacheLock;
- (void)cachePCSIdentity:(id)a3;
- (void)clearCachedPCSIdentity;
- (void)createIdentityForSet:(_PCSIdentitySetData *)a3 roll:(BOOL)a4 completionBlock:(id)a5;
- (void)getPCSIdentity:(id)a3;
- (void)rollKey:(id)a3;
- (void)setCreationGroup:(id)a3;
- (void)setCreationQueue:(id)a3;
- (void)setIdentityCacheLock:(os_unfair_lock_s)a3;
- (void)setOutstandingCreationSignal:(BOOL)a3;
- (void)set_pcsIdentity:(id)a3;
- (void)set_pcsIdentityCachedTime:(id)a3;
- (void)signData:(id)a3 completionBlock:(id)a4;
- (void)wrapperPCSIdentitySetCreateManatee:(_PCSIdentitySetData *)a3 service:(__CFString *)a4 options:(id)a5 block:(id)a6;
@end

@implementation KTAccountKeyServer

- (void)clearCachedPCSIdentity
{
  p_identityCacheLock = &self->_identityCacheLock;
  os_unfair_lock_lock(&self->_identityCacheLock);
  [(KTAccountKeyServer *)self set_pcsIdentity:0];
  [(KTAccountKeyServer *)self set_pcsIdentityCachedTime:0];

  os_unfair_lock_unlock(p_identityCacheLock);
}

- (id)copyCachedPCSIdentity
{
  p_identityCacheLock = &self->_identityCacheLock;
  os_unfair_lock_lock(&self->_identityCacheLock);
  v4 = [(KTAccountKeyServer *)self _pcsIdentity];
  if (v4)
  {
    v5 = [(KTAccountKeyServer *)self _pcsIdentityCachedTime];
    [v5 timeIntervalSinceNow];
    double v7 = v6;
    double v8 = (double)(uint64_t)-kKTAuthenticationLifetime;

    v4 = 0;
    if (v7 > v8)
    {
      v4 = [(KTAccountKeyServer *)self _pcsIdentity];
    }
  }
  os_unfair_lock_unlock(p_identityCacheLock);
  return v4;
}

- (void)cachePCSIdentity:(id)a3
{
  p_identityCacheLock = &self->_identityCacheLock;
  id v5 = a3;
  os_unfair_lock_lock(p_identityCacheLock);
  [(KTAccountKeyServer *)self set_pcsIdentity:v5];

  double v6 = +[NSDate date];
  [(KTAccountKeyServer *)self set_pcsIdentityCachedTime:v6];

  os_unfair_lock_unlock(p_identityCacheLock);
}

+ (id)applicationToService:(id)a3
{
  uint64_t v3 = qword_10032F018;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10032F018, &stru_1002C5CF0);
  }
  id v5 = [(id)qword_10032F020 objectForKeyedSubscript:v4];

  return v5;
}

+ (id)sharedKeyServiceForApplication:(id)a3
{
  id v3 = a3;
  id v4 = +[TransparencyApplication applicationValueForIdentifier:v3];

  if (v4)
  {
    id v5 = [(id)objc_opt_class() applicationToService:v3];
    if (v5)
    {
      double v6 = [(id)objc_opt_class() sharedKeyService:v5];
    }
    else
    {
      if (qword_10032F028 != -1) {
        dispatch_once(&qword_10032F028, &stru_1002C5D30);
      }
      double v8 = qword_10032F030;
      if (os_log_type_enabled((os_log_t)qword_10032F030, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        id v11 = v3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unknown application mapping: %@", (uint8_t *)&v10, 0xCu);
      }
      double v6 = 0;
    }
  }
  else
  {
    if (qword_10032F028 != -1) {
      dispatch_once(&qword_10032F028, &stru_1002C5D10);
    }
    double v7 = qword_10032F030;
    if (os_log_type_enabled((os_log_t)qword_10032F030, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unknown application identifier: %@", (uint8_t *)&v10, 0xCu);
    }
    double v6 = 0;
  }

  return v6;
}

+ (void)clearCachedPCSIdentities
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10032F038);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = [[(id)qword_10032F040 allValues];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      double v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) clearCachedPCSIdentity];
        double v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10032F038);
}

+ (id)sharedKeyService:(id)a3
{
  id v4 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B81A0;
  block[3] = &unk_1002C4C38;
  block[4] = a1;
  if (qword_10032F048 != -1) {
    dispatch_once(&qword_10032F048, block);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10032F038);
  id v5 = [(id)qword_10032F040 objectForKeyedSubscript:v4];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10032F038);
  if (!v5)
  {
    id v5 = [objc_alloc((Class)objc_opt_class()) initWithService:v4];
    if (v5)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_10032F038);
      double v6 = [(id)qword_10032F040 objectForKeyedSubscript:v4];

      if (v6)
      {
        uint64_t v7 = [(id)qword_10032F040 objectForKeyedSubscript:v4];

        id v5 = (id)v7;
      }
      else
      {
        [(id)qword_10032F040 setObject:v5 forKeyedSubscript:v4];
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_10032F038);
    }
  }

  return v5;
}

- (id)initKeyServiceWithApplication:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() applicationToService:v4];
  if (v5)
  {
    self = [(KTAccountKeyServer *)self initWithService:v4];
    double v6 = self;
  }
  else
  {
    if (qword_10032F028 != -1) {
      dispatch_once(&qword_10032F028, &stru_1002C5D90);
    }
    uint64_t v7 = qword_10032F030;
    if (os_log_type_enabled((os_log_t)qword_10032F030, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unknown application mapping: %@", (uint8_t *)&v9, 0xCu);
    }
    double v6 = 0;
  }

  return v6;
}

- (KTAccountKeyServer)initWithService:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)KTAccountKeyServer;
  id v3 = [(KTAccountKeyServer *)&v12 init];
  id v4 = v3;
  if (v3)
  {
    v3->_identityCacheLock._os_unfair_lock_opaque = 0;
    dispatch_group_t v5 = dispatch_group_create();
    creationGroup = v4->_creationGroup;
    v4->_creationGroup = (OS_dispatch_group *)v5;

    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.transparencyd.AccountKeyCreate", v7);
    creationQueue = v4->_creationQueue;
    v4->_creationQueue = (OS_dispatch_queue *)v8;

    id v10 = v4;
  }

  return v4;
}

+ (void)startMetrics:(id)a3 services:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id location = 0;
  objc_initWeak(&location, v5);
  double v7 = SFAnalyticsSamplerIntervalOncePerReport;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001B8688;
  v9[3] = &unk_1002C5DE0;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [v5 addMultiSamplerForName:@"KTAccountKeyMultiSampler" withTimeInterval:v9 block:v7];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)pcsOptions:(id *)a3
{
  id v14 = 0;
  id v4 = +[TransparencyAccount primaryAccount:&v14];
  id v5 = v14;
  if (v4)
  {
    uint64_t v6 = [v4 aa_personID];
    double v7 = (void *)v6;
    if (v6)
    {
      uint64_t v15 = kPCSSetupDSID;
      uint64_t v16 = v6;
      id v8 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    }
    else
    {
      if (qword_10032F028 != -1) {
        dispatch_once(&qword_10032F028, &stru_1002C5E20);
      }
      id v10 = (void *)qword_10032F030;
      if (os_log_type_enabled((os_log_t)qword_10032F030, OS_LOG_TYPE_ERROR))
      {
        id v11 = v10;
        objc_super v12 = [v4 identifier];
        *(_DWORD *)buf = 138412290;
        v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to get primary account dsid, returning nil PCS options: %@", buf, 0xCu);
      }
      id v8 = 0;
    }
  }
  else
  {
    if (qword_10032F028 != -1) {
      dispatch_once(&qword_10032F028, &stru_1002C5E00);
    }
    int v9 = qword_10032F030;
    if (os_log_type_enabled((os_log_t)qword_10032F030, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to get primary account, returning nil PCS options", buf, 2u);
    }
    id v8 = 0;
    if (a3 && v5)
    {
      id v8 = 0;
      *a3 = v5;
    }
  }

  return v8;
}

- (__CFString)service
{
  return @"com.apple.KTAccountKey";
}

- (_PCSIdentitySetData)copyPCSIdentitySet:(id *)a3
{
  id v11 = 0;
  objc_super v12 = 0;
  id v5 = [(KTAccountKeyServer *)self pcsOptions:&v11];
  id v6 = v11;
  if (v5)
  {
    [(KTAccountKeyServer *)self service];
    double v7 = (_PCSIdentitySetData *)PCSIdentitySetCreate();
    if (v7 && !v12) {
      goto LABEL_15;
    }
    if (qword_10032F028 != -1) {
      dispatch_once(&qword_10032F028, &stru_1002C5E40);
    }
    id v8 = qword_10032F030;
    if (os_log_type_enabled((os_log_t)qword_10032F030, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "failed to create account key identity set: %@", buf, 0xCu);
    }
    int v9 = v12;

    id v6 = v9;
    if (!v9)
    {
      id v6 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-267 description:@"failed to create account key identity set"];
    }
    if (v7) {
      CFRelease(v7);
    }
  }
  double v7 = 0;
  if (a3 && v6)
  {
    id v6 = v6;
    double v7 = 0;
    *a3 = v6;
  }
LABEL_15:

  return v7;
}

- (void)createIdentityForSet:(_PCSIdentitySetData *)a3 roll:(BOOL)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = [(KTAccountKeyServer *)self creationGroup];
  objc_sync_enter(v9);
  if ([(KTAccountKeyServer *)self outstandingCreationSignal])
  {
    id v10 = [(KTAccountKeyServer *)self creationGroup];
    id v11 = [(KTAccountKeyServer *)self creationQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001B9020;
    block[3] = &unk_1002BA140;
    block[4] = self;
    id v20 = v8;
    id v12 = v8;
    dispatch_group_notify(v10, v11, block);

    objc_sync_exit(v9);
  }
  else
  {
    objc_sync_exit(v9);

    v13 = [(KTAccountKeyServer *)self creationGroup];
    id v14 = [(KTAccountKeyServer *)self creationQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001B902C;
    v15[3] = &unk_1002C5EB0;
    v15[4] = self;
    id v16 = v8;
    BOOL v18 = a4;
    v17 = a3;
    id v9 = v8;
    dispatch_group_async(v13, v14, v15);
  }
}

- (void)wrapperPCSIdentitySetCreateManatee:(_PCSIdentitySetData *)a3 service:(__CFString *)a4 options:(id)a5 block:(id)a6
{
  id v7 = a6;
  id v6 = v7;
  PCSIdentitySetCreateManatee();
}

- (BOOL)haveIdentity
{
  id v3 = [(KTAccountKeyServer *)self copyCachedPCSIdentity];
  if (v3)
  {
    id v4 = v3;
    BOOL v5 = 1;
  }
  else
  {
    id v9 = 0;
    id v6 = [(KTAccountKeyServer *)self copyPCSIdentitySet:&v9];
    id v7 = v9;
    if (v6)
    {
      [(KTAccountKeyServer *)self service];
      id v4 = PCSIdentitySetCopyCurrentIdentityPointer();
      BOOL v5 = v4 != 0;
      CFRelease(v6);
    }
    else
    {
      id v4 = 0;
      BOOL v5 = 0;
    }
  }
  return v5;
}

- (void)getPCSIdentity:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  BOOL v5 = +[TransparencyAnalytics logger];
  id v6 = [(KTAccountKeyServer *)self copyCachedPCSIdentity];
  if (v6)
  {
    id v7 = v6;
    v4[2](v4, v6, 0);
  }
  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
    id v22 = 0;
    id v9 = [(KTAccountKeyServer *)self copyPCSIdentitySet:&v22];
    id v10 = v22;
    if (v9)
    {
      [(KTAccountKeyServer *)self service];
      id v11 = PCSIdentitySetCopyCurrentIdentityPointer();
      id v7 = v11;
      if (v11)
      {
        [v11 identity];
        id v12 = (void *)PCSIdentityCopyPublicKeyInfo();
        if (qword_10032F028 != -1) {
          dispatch_once(&qword_10032F028, &stru_1002C5F18);
        }
        v13 = (void *)qword_10032F030;
        if (os_log_type_enabled((os_log_t)qword_10032F030, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = v13;
          uint64_t v15 = [v12 kt_hexString];
          *(_DWORD *)buf = 138412290;
          v24 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Caching PCS identity: %@", buf, 0xCu);
        }
        [(KTAccountKeyServer *)self cachePCSIdentity:v7];
        CFAbsoluteTime v16 = CFAbsoluteTimeGetCurrent() - Current;
        v17 = +[TransparencyAnalytics logger];
        BOOL v18 = +[NSNumber numberWithDouble:v16];
        [v17 logMetric:v18 withName:@"KTAccountKeyFetchTime"];

        v19 = +[TransparencyAnalytics logger];
        [v19 logSuccessForEventNamed:@"KTAccountKeyFetch"];

        if (qword_10032F028 != -1) {
          dispatch_once(&qword_10032F028, &stru_1002C5F38);
        }
        id v20 = qword_10032F030;
        if (os_log_type_enabled((os_log_t)qword_10032F030, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "copied current account key identity", buf, 2u);
        }
        v4[2](v4, v7, 0);
        CFRelease(v9);
      }
      else
      {
        if (qword_10032F028 != -1) {
          dispatch_once(&qword_10032F028, &stru_1002C5EF8);
        }
        v21 = qword_10032F030;
        if (os_log_type_enabled((os_log_t)qword_10032F030, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v24 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "failed to copy account key identity: %@", buf, 0xCu);
        }
        [v5 logResultForEvent:@"KTAccountKeyFetch" hardFailure:0 result:0];
        v4[2](v4, 0, 0);
        CFRelease(v9);
      }
    }
    else
    {
      [v5 logResultForEvent:@"KTAccountKeyFetch" hardFailure:1 result:v10];
      ((void (**)(id, id, id))v4)[2](v4, 0, v10);
      id v7 = 0;
    }
  }
}

+ (id)publicKeyInfoFromIdentity:(_PCSIdentityData *)a3 error:(id *)a4
{
  id v6 = (void *)PCSIdentityCopyPublicKeyInfo();
  if (!v6)
  {
    if (qword_10032F028 != -1) {
      dispatch_once(&qword_10032F028, &stru_1002C5F58);
    }
    id v7 = qword_10032F030;
    if (os_log_type_enabled((os_log_t)qword_10032F030, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "failed to get PCS public key info from identity: %@", (uint8_t *)&v9, 0xCu);
    }
    if (a4)
    {
      *a4 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-268 description:@"failed to get PCS public key info from identity"];
    }
  }

  return v6;
}

+ (_PCSPublicIdentityData)decodePublicKeyInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!v5)
  {
    id v6 = 0;
    BOOL v7 = 1;
LABEL_5:
    if (qword_10032F028 != -1) {
      dispatch_once(&qword_10032F028, &stru_1002C5F78);
    }
    int v9 = qword_10032F030;
    if (os_log_type_enabled((os_log_t)qword_10032F030, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "failed to create public key from data: %@", buf, 0xCu);
    }
    id v8 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-269 description:@"failed to create public key from data"];
    if (v7)
    {
      if (a4) {
        goto LABEL_14;
      }
    }
    else
    {
      CFRelease(v6);
      if (a4)
      {
LABEL_14:
        if (v8) {
          *a4 = v8;
        }
      }
    }
    id v10 = +[TransparencyAnalytics logger];
    [v10 logResultForEvent:@"KTAccountKeyPublicDecode" hardFailure:1 result:v8];

    id v6 = 0;
    goto LABEL_17;
  }
  id v6 = (_PCSPublicIdentityData *)PCSPublicIdentityCreateWithPublicKeyInfo();
  BOOL v7 = v6 == 0;
  if (!v6) {
    goto LABEL_5;
  }
  id v8 = +[TransparencyAnalytics logger];
  [v8 logSuccessForEventNamed:@"KTAccountKeyPublicDecode"];
LABEL_17:

  return v6;
}

- (void)rollKey:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  CFAbsoluteTime v16 = &v15;
  uint64_t v17 = 0x2020000000;
  BOOL v18 = 0;
  id v14 = 0;
  id v5 = [(KTAccountKeyServer *)self copyPCSIdentitySet:&v14];
  id v6 = v14;
  BOOL v18 = v5;
  if (v16[3])
  {
    if (qword_10032F028 != -1) {
      dispatch_once(&qword_10032F028, &stru_1002C5F98);
    }
    BOOL v7 = qword_10032F030;
    if (os_log_type_enabled((os_log_t)qword_10032F030, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "attempting to roll account key identity", buf, 2u);
    }
    uint64_t v8 = v16[3];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001BA108;
    v10[3] = &unk_1002C6000;
    id v11 = v4;
    id v12 = &v15;
    [(KTAccountKeyServer *)self createIdentityForSet:v8 roll:1 completionBlock:v10];
  }
  else
  {
    int v9 = +[TransparencyAnalytics logger];
    [v9 logResultForEvent:@"KTAccountKeyRoll" hardFailure:1 result:v6];

    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v6);
  }
  _Block_object_dispose(&v15, 8);
}

- (BOOL)isAccountIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v17 = 0;
  BOOL v7 = [(KTAccountKeyServer *)self copyPCSIdentitySet:&v17];
  id v8 = v17;
  int v9 = v8;
  if (!v7)
  {
    BOOL v13 = 0;
    if (!a4 || !v8)
    {
      id v11 = v8;
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  id v16 = v8;
  id v10 = +[KTAccountKeyServer decodePublicKeyInfo:v6 error:&v16];
  id v11 = v16;

  if (!v10)
  {
    CFRelease(v7);
    BOOL v13 = 0;
    if (!a4 || !v11) {
      goto LABEL_22;
    }
    id v8 = v11;
LABEL_20:
    id v11 = v8;
    BOOL v13 = 0;
    *a4 = v11;
    goto LABEL_22;
  }
  PCSPublicIdentityGetPublicID();
  id v12 = (const void *)PCSIdentitySetCopyIdentityWithError();
  BOOL v13 = v12 != 0;
  if (v12)
  {
    CFRelease(v12);
  }
  else
  {
    if (qword_10032F028 != -1) {
      dispatch_once(&qword_10032F028, &stru_1002C6020);
    }
    id v14 = qword_10032F030;
    if (os_log_type_enabled((os_log_t)qword_10032F030, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "failed to get identity for public identity: %@", buf, 0xCu);
    }

    id v11 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-271 description:@"failed to find identity for public identity"];
    if (a4 && v11) {
      *a4 = v11;
    }
  }
  CFRelease(v10);
  CFRelease(v7);
LABEL_22:

  return v13;
}

- (void)signData:(id)a3 completionBlock:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001BA750;
  v8[3] = &unk_1002C60A8;
  id v9 = a3;
  id v10 = a4;
  id v6 = v9;
  id v7 = v10;
  [(KTAccountKeyServer *)self getPCSIdentity:v8];
}

- (id)publicPublicKey:(id *)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_1001BADDC;
  BOOL v18 = sub_1001BADEC;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_1001BADDC;
  id v12 = sub_1001BADEC;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001BADF4;
  v7[3] = &unk_1002C60D0;
  v7[4] = &v8;
  v7[5] = &v14;
  [(KTAccountKeyServer *)self getPCSIdentity:v7];
  if (a3)
  {
    id v4 = (void *)v9[5];
    if (v4) {
      *a3 = v4;
    }
  }
  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);

  return v5;
}

+ (BOOL)verifyData:(id)a3 signature:(id)a4 accountPublicKeyInfo:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (!v9)
  {
    uint64_t v17 = -346;
LABEL_17:
    id v14 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:v17 description:@"missing data or signature or accountKey"];
    if (qword_10032F028 != -1) {
      dispatch_once(&qword_10032F028, &stru_1002C60F0);
    }
    BOOL v18 = qword_10032F030;
    if (os_log_type_enabled((os_log_t)qword_10032F030, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "PCS signature verify failed due to missing data or signature or accountKey", buf, 2u);
    }
    goto LABEL_21;
  }
  if (!v10)
  {
    uint64_t v17 = -347;
    goto LABEL_17;
  }
  if (!v11)
  {
    uint64_t v17 = -348;
    goto LABEL_17;
  }
  id v20 = 0;
  id v13 = +[KTAccountKeyServer decodePublicKeyInfo:v11 error:&v20];
  id v14 = v20;
  if (v13)
  {
    char v15 = PCSValidateSignature();
    if ((v15 & 1) == 0)
    {
      if (qword_10032F028 != -1) {
        dispatch_once(&qword_10032F028, &stru_1002C6110);
      }
      uint64_t v16 = qword_10032F030;
      if (os_log_type_enabled((os_log_t)qword_10032F030, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "failed to verify data: %@", buf, 0xCu);
      }

      id v14 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-270 description:@"failed to verify data with account key"];
      if (a6 && v14)
      {
        id v14 = v14;
        *a6 = v14;
      }
    }
    CFRelease(v13);
    goto LABEL_24;
  }
LABEL_21:
  char v15 = 0;
  if (a6 && v14)
  {
    id v14 = v14;
    char v15 = 0;
    *a6 = v14;
  }
LABEL_24:

  return v15;
}

- (NSDate)_pcsIdentityCachedTime
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)set_pcsIdentityCachedTime:(id)a3
{
}

- (PCSCurrentIdentity)_pcsIdentity
{
  return (PCSCurrentIdentity *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_pcsIdentity:(id)a3
{
}

- (os_unfair_lock_s)identityCacheLock
{
  return self->_identityCacheLock;
}

- (void)setIdentityCacheLock:(os_unfair_lock_s)a3
{
  self->_identityCacheLock = a3;
}

- (BOOL)outstandingCreationSignal
{
  return self->_outstandingCreationSignal;
}

- (void)setOutstandingCreationSignal:(BOOL)a3
{
  self->_outstandingCreationSignal = a3;
}

- (OS_dispatch_queue)creationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCreationQueue:(id)a3
{
}

- (OS_dispatch_group)creationGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCreationGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationGroup, 0);
  objc_storeStrong((id *)&self->_creationQueue, 0);
  objc_storeStrong((id *)&self->__pcsIdentity, 0);

  objc_storeStrong((id *)&self->__pcsIdentityCachedTime, 0);
}

@end