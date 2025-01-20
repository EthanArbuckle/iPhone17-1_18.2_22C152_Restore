@interface KTIDSActualOperations
+ (BOOL)ktVerifyError:(id)a3 code:(int64_t)a4;
+ (id)healableError:(id)a3 selfValidationResult:(id)a4;
- (BOOL)haveIDSAccount:(id)a3;
- (BOOL)registeredDelegate;
- (IDSAccountControllerProtocol)accountController;
- (IDSKeyTransparencyManager)manager;
- (IDSSignInController)idsSignInController;
- (KTIDSActualOperations)initWithIDSAccountController:(id)a3 lockStateTracker:(id)a4;
- (KTIDSSignInServiceUserInfo)lastMessagesStatus;
- (KTIDSSignInServiceUserInfo)lastPhoneAccountStatus;
- (KTLockStateTracker)lockStateTracker;
- (KTNearFutureScheduler)checkAccountNFS;
- (KTVerificationInfoProvider)provider;
- (NSArray)idsAccounts;
- (NSDate)timeOfLastUpsell;
- (OS_dispatch_queue)idsControllerQueue;
- (OS_dispatch_queue)idsQueue;
- (OS_dispatch_queue)workQueue;
- (double)checkIDSTimeoutSeconds;
- (double)sleepTimeBetweenIDSCheckups;
- (id)idsObserver;
- (unint64_t)_serviceTypeForName:(id)a3;
- (unint64_t)idsAccountType;
- (void)accountController:(id)a3 accountAdded:(id)a4;
- (void)accountController:(id)a3 accountDisabled:(id)a4;
- (void)accountController:(id)a3 accountEnabled:(id)a4;
- (void)accountController:(id)a3 accountRemoved:(id)a4;
- (void)accountController:(id)a3 accountUpdated:(id)a4;
- (void)cacheClearRequest:(id)a3;
- (void)checkAccountChange;
- (void)dealloc;
- (void)drain;
- (void)fetchKTRegistrationStatus:(id)a3;
- (void)fetchPeerVerificationInfos:(id)a3 application:(id)a4 completionBlock:(id)a5;
- (void)fetchSelfVerificationInfo:(id)a3 completionBlock:(id)a4;
- (void)getKeyTransparencyOptInEligiblityForApplication:(id)a3 withCompletion:(id)a4;
- (void)onQueueDrain;
- (void)onQueueProcessStatus:(id)a3;
- (void)peerVerificationFinishedWithResults:(id)a3;
- (void)registrationDataNeedsUpdate:(id)a3;
- (void)sendOptInUpdateRequest:(id)a3 withCompletion:(id)a4;
- (void)setAccountController:(id)a3;
- (void)setCheckAccountNFS:(id)a3;
- (void)setCheckIDSTimeoutSeconds:(double)a3;
- (void)setIdsAccounts:(id)a3;
- (void)setIdsControllerQueue:(id)a3;
- (void)setIdsObserver:(id)a3;
- (void)setIdsQueue:(id)a3;
- (void)setIdsSignInController:(id)a3;
- (void)setLastMessagesStatus:(id)a3;
- (void)setLastPhoneAccountStatus:(id)a3;
- (void)setLockStateTracker:(id)a3;
- (void)setManager:(id)a3;
- (void)setProvider:(id)a3;
- (void)setRegisteredDelegate:(BOOL)a3;
- (void)setSleepTimeBetweenIDSCheckups:(double)a3;
- (void)setTimeOfLastUpsell:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)signInController:(id)a3 service:(unint64_t)a4 didChangeStatus:(id)a5;
- (void)triggerIDSCheck:(id)a3 selfValidationResult:(id)a4 complete:(id)a5;
@end

@implementation KTIDSActualOperations

- (KTIDSActualOperations)initWithIDSAccountController:(id)a3 lockStateTracker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)KTIDSActualOperations;
  v8 = [(KTIDSActualOperations *)&v31 init];
  if (v8)
  {
    id v9 = objc_alloc_init((Class)IDSKeyTransparencyManager);
    [(KTIDSActualOperations *)v8 setManager:v9];

    dispatch_queue_t v10 = dispatch_queue_create("KTIDSActualOperations", 0);
    [(KTIDSActualOperations *)v8 setIdsQueue:v10];

    dispatch_queue_t v11 = dispatch_queue_create("KTIDSActualOperations-idsController", 0);
    [(KTIDSActualOperations *)v8 setIdsControllerQueue:v11];

    dispatch_queue_t v12 = dispatch_queue_create("KTIDSActualOperations-work", 0);
    [(KTIDSActualOperations *)v8 setWorkQueue:v12];

    id v13 = objc_alloc((Class)IDSSignInController);
    v14 = [(KTIDSActualOperations *)v8 idsQueue];
    id v15 = [v13 initWithQueue:v14];
    [(KTIDSActualOperations *)v8 setIdsSignInController:v15];

    v16 = [(KTIDSActualOperations *)v8 idsSignInController];
    [v16 setDelegate:v8 forService:1];

    [(KTIDSActualOperations *)v8 setCheckIDSTimeoutSeconds:90.0];
    [(KTIDSActualOperations *)v8 setSleepTimeBetweenIDSCheckups:10.0];
    [(KTIDSActualOperations *)v8 setAccountController:v6];
    v17 = [(KTIDSActualOperations *)v8 accountController];
    v18 = [(KTIDSActualOperations *)v8 idsQueue];
    [v17 addDelegate:v8 queue:v18];

    [(KTIDSActualOperations *)v8 setRegisteredDelegate:1];
    v19 = +[NSArray array];
    [(KTIDSActualOperations *)v8 setIdsAccounts:v19];

    [(KTIDSActualOperations *)v8 setLockStateTracker:v7];
    id location = 0;
    objc_initWeak(&location, v8);
    v20 = [KTNearFutureScheduler alloc];
    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    v27 = sub_1001D69A8;
    v28 = &unk_1002B72D8;
    objc_copyWeak(&v29, &location);
    v21 = [(KTNearFutureScheduler *)v20 initWithName:@"KTIDSAccountChecker" initialDelay:1000000000 exponentialBackoff:60000000000 maximumDelay:0 keepProcessAlive:0 dependencyDescriptionCode:&v25 block:1.2];
    -[KTIDSActualOperations setCheckAccountNFS:](v8, "setCheckAccountNFS:", v21, v25, v26, v27, v28);

    v22 = [(KTIDSActualOperations *)v8 checkAccountNFS];
    [v22 trigger];

    v23 = v8;
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)drain
{
  v3 = [(KTIDSActualOperations *)self idsControllerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D6B00;
  block[3] = &unk_1002B6CF8;
  block[4] = self;
  dispatch_sync(v3, block);

  v4 = [(KTIDSActualOperations *)self idsQueue];
  dispatch_sync(v4, &stru_1002C7838);
}

- (void)onQueueDrain
{
  if ([(KTIDSActualOperations *)self registeredDelegate])
  {
    [(KTIDSActualOperations *)self setRegisteredDelegate:0];
    v3 = [(KTIDSActualOperations *)self checkAccountNFS];
    [v3 cancel];

    v4 = [(KTIDSActualOperations *)self accountController];
    [v4 removeDelegate:self];

    id v5 = [(KTIDSActualOperations *)self idsSignInController];
    [v5 removeDelegateForService:1];
  }
}

- (void)dealloc
{
  [(KTIDSActualOperations *)self onQueueDrain];
  v3.receiver = self;
  v3.super_class = (Class)KTIDSActualOperations;
  [(KTIDSActualOperations *)&v3 dealloc];
}

- (void)checkAccountChange
{
  id location = 0;
  objc_initWeak(&location, self);
  objc_super v3 = [(KTIDSActualOperations *)self idsControllerQueue];
  dispatch_assert_queue_V2(v3);

  v4 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(KTIDSActualOperations *)self accountController];
  id v6 = [v5 accounts];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        dispatch_queue_t v10 = [[KTIDSAccountHolder alloc] initWithIDSAccount:*(void *)(*((void *)&v14 + 1) + 8 * (void)v9)];
        if (v10) {
          [v4 addObject:v10];
        }

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }

  [(KTIDSActualOperations *)self setIdsAccounts:v4];
  dispatch_queue_t v11 = [(KTIDSActualOperations *)self idsSignInController];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001D6E58;
  v12[3] = &unk_1002C78A0;
  v12[4] = self;
  objc_copyWeak(&v13, &location);
  [v11 statusOfUsersOnService:1 withCompletion:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

+ (BOOL)ktVerifyError:(id)a3 code:(int64_t)a4
{
  id v5 = a3;
  id v6 = [v5 domain];
  if ([v6 isEqual:@"TransparencyErrorVerify"]) {
    BOOL v7 = [v5 code] == (id)a4;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)healableError:(id)a3 selfValidationResult:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)KTSelfVerificationHealableErrors);
  [v6 addHealableState:1];
  if (!v5) {
    [v6 addAccountHealableError:0];
  }
  BOOL v7 = [v5 resultError];
  unsigned __int8 v8 = [a1 ktVerifyError:v7 code:-271];

  if (v8)
  {
    uint64_t v9 = 2;
LABEL_7:
    [v6 addAccountHealableError:v9];
    goto LABEL_8;
  }
  dispatch_queue_t v10 = [v5 resultError];
  unsigned int v11 = [a1 ktVerifyError:v10 code:-289];

  if (v11)
  {
    uint64_t v9 = 7;
    goto LABEL_7;
  }
LABEL_8:
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  dispatch_queue_t v12 = [v5 loggableData:v5];
  id v13 = [v12 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v13) {
    goto LABEL_33;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v42;
  do
  {
    long long v16 = 0;
    do
    {
      if (*(void *)v42 != v15) {
        objc_enumerationMutation(v12);
      }
      long long v17 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v16);
      v18 = [v17 deviceID];

      if (v18)
      {
        uint64_t v19 = [v17 signature];
        if (!v19
          || (v20 = (void *)v19,
              [v17 failure],
              v21 = objc_claimAutoreleasedReturnValue(),
              id v22 = [v21 code],
              v21,
              v20,
              v22 == (id)-286))
        {
          v23 = [v17 deviceID];
          [v6 addDeviceHealableError:3 deviceId:v23];
        }
        v24 = [v17 failure];
        id v25 = [v24 code];

        if (v25 == (id)-272)
        {
          uint64_t v26 = [v17 deviceID];
          [v6 addDeviceHealableError:4 deviceId:v26];
        }
        v27 = [v17 failure];
        id v28 = [v27 code];

        if (v28 == (id)-101)
        {
          id v29 = [v17 deviceID];
          [v6 addDeviceHealableError:6 deviceId:v29];
        }
        v30 = [v17 failure];
        if ([v30 code] == (id)-94) {
          goto LABEL_26;
        }
        objc_super v31 = [v17 failure];
        if ([v31 code] == (id)-93) {
          goto LABEL_25;
        }
        v32 = [v17 failure];
        if ([v32 code] == (id)-95)
        {

LABEL_25:
LABEL_26:

LABEL_27:
          v33 = [v17 deviceID];
          [v6 addDeviceHealableError:5 deviceId:v33];

          goto LABEL_28;
        }
        [v17 failure];
        uint64_t v34 = v15;
        v36 = v35 = v12;
        id v40 = [v36 code];

        dispatch_queue_t v12 = v35;
        uint64_t v15 = v34;

        if (v40 == (id)-96) {
          goto LABEL_27;
        }
      }
LABEL_28:
      long long v16 = (char *)v16 + 1;
    }
    while (v14 != v16);
    id v37 = [v12 countByEnumeratingWithState:&v41 objects:v45 count:16];
    id v14 = v37;
  }
  while (v37);
LABEL_33:

  return v6;
}

- (void)triggerIDSCheck:(id)a3 selfValidationResult:(id)a4 complete:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unsigned int v11 = [(id)objc_opt_class() healableError:v10 selfValidationResult:v9];

  dispatch_queue_t v12 = [(KTIDSActualOperations *)self manager];
  id v13 = [v12 verificationInfoProviderIdForApplication:v10];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001D76DC;
  v15[3] = &unk_1002C78E8;
  id v16 = v8;
  id v14 = v8;
  [v13 healSelf:v11 completionBlock:v15];
}

- (void)fetchPeerVerificationInfos:(id)a3 application:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  unsigned int v11 = [(KTIDSActualOperations *)self manager];
  dispatch_queue_t v12 = [v11 verificationInfoProviderIdForApplication:v10];

  if (v12)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001D7920;
    v13[3] = &unk_1002B73B0;
    id v14 = v9;
    [v12 fetchPeerVerificationInfos:v8 completionBlock:v13];
  }
  else
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (void)fetchSelfVerificationInfo:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(KTIDSActualOperations *)self manager];
  id v9 = [v8 verificationInfoProviderIdForApplication:v7];

  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001D7A24;
    v10[3] = &unk_1002C7910;
    id v11 = v6;
    [v9 fetchSelfVerificationInfo:v10];
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)getKeyTransparencyOptInEligiblityForApplication:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(KTIDSActualOperations *)self manager];
  [v8 getKeyTransparencyOptInEligiblityForApplication:v7 withCompletion:v6];
}

- (void)sendOptInUpdateRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)IDSKTOptInOutRequest);
  +[NSMutableDictionary dictionary];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001D7BC0;
  v11[3] = &unk_1002C7938;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v12;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];

  [v8 setApplicationsToOptInStatusData:v9];
  id v10 = [(KTIDSActualOperations *)self manager];
  [v10 sendOptInUpdateRequest:v8 withCompletion:v6];
}

- (void)registrationDataNeedsUpdate:(id)a3
{
  id v4 = a3;
  if (qword_10032F168 != -1) {
    dispatch_once(&qword_10032F168, &stru_1002C7958);
  }
  id v5 = qword_10032F170;
  if (os_log_type_enabled((os_log_t)qword_10032F170, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "registrationDataNeedsUpdate reason: %@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(KTIDSActualOperations *)self manager];
  [v6 registrationDataNeedsUpdate];
}

- (void)fetchKTRegistrationStatus:(id)a3
{
  id v4 = a3;
  id v5 = [(KTIDSActualOperations *)self manager];
  [v5 fetchKTRegistrationStatusWithCompletion:v4];
}

- (void)peerVerificationFinishedWithResults:(id)a3
{
  id v4 = a3;
  id v5 = [(KTIDSActualOperations *)self manager];
  [v5 peerVerificationFinishedWithResults:v4];
}

- (void)cacheClearRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(KTIDSActualOperations *)self manager];
  [v5 cacheClearRequest:v4];
}

- (BOOL)haveIDSAccount:(id)a3
{
  id v4 = +[NSString stringWithFormat:@"D:%@", a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(KTIDSActualOperations *)self idsAccounts];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 accountType] == 1)
        {
          id v10 = [v9 idsDSID];
          unsigned __int8 v11 = [v10 isEqual:v4];

          if (v11)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v6;
}

- (unint64_t)idsAccountType
{
  uint64_t v3 = [(KTIDSActualOperations *)self messagesStatus];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(KTIDSActualOperations *)self messagesStatus];
    id v6 = [v5 status];

    if (v6 == (id)3) {
      return 3;
    }
  }
  unint64_t result = [(KTIDSActualOperations *)self lastPhoneAccountStatus];
  if (result)
  {
    id v8 = (void *)result;
    id v9 = [(KTIDSActualOperations *)self lastPhoneAccountStatus];
    id v10 = [v9 status];

    if (v10 == (id)3)
    {
      unsigned __int8 v11 = [(KTIDSActualOperations *)self messagesStatus];

      if (v11) {
        return 2;
      }
      else {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)onQueueProcessStatus:(id)a3
{
  id v4 = a3;
  id v5 = [(KTIDSActualOperations *)self idsQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 type])
  {
    if ([v4 type] == (id)1)
    {
      uint64_t v6 = [(KTIDSActualOperations *)self lastMessagesStatus];
      if (v6
        && (uint64_t v7 = (void *)v6,
            [(KTIDSActualOperations *)self lastMessagesStatus],
            id v8 = objc_claimAutoreleasedReturnValue(),
            id v9 = [v8 status],
            id v10 = [v4 status],
            v8,
            v7,
            v9 == v10))
      {
        if (qword_10032F168 != -1) {
          dispatch_once(&qword_10032F168, &stru_1002C7978);
        }
        unsigned __int8 v11 = qword_10032F170;
        if (os_log_type_enabled((os_log_t)qword_10032F170, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "no change", buf, 2u);
        }
      }
      else
      {
        [(KTIDSActualOperations *)self setLastMessagesStatus:v4];
        id v12 = [(KTIDSActualOperations *)self idsObserver];

        if (v12)
        {
          long long v13 = [(KTIDSActualOperations *)self workQueue];
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_1001D8340;
          v14[3] = &unk_1002B7D58;
          id v15 = v4;
          long long v16 = self;
          dispatch_async(v13, v14);
        }
      }
    }
  }
  else
  {
    [(KTIDSActualOperations *)self setLastPhoneAccountStatus:v4];
  }
}

- (void)signInController:(id)a3 service:(unint64_t)a4 didChangeStatus:(id)a5
{
  int v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (qword_10032F168 != -1) {
    dispatch_once(&qword_10032F168, &stru_1002C79B8);
  }
  id v10 = qword_10032F170;
  if (os_log_type_enabled((os_log_t)qword_10032F170, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109378;
    v12[1] = v6;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "signInController:service:didChangeStatus: %d/%@", (uint8_t *)v12, 0x12u);
  }
  unsigned __int8 v11 = [(KTIDSActualOperations *)self idsQueue];
  dispatch_assert_queue_V2(v11);
}

- (unint64_t)_serviceTypeForName:(id)a3
{
  return [a3 isEqualToString:IDSServiceNameFaceTime] ^ 1;
}

- (void)accountController:(id)a3 accountAdded:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10032F168 != -1) {
    dispatch_once(&qword_10032F168, &stru_1002C79D8);
  }
  id v8 = qword_10032F170;
  if (os_log_type_enabled((os_log_t)qword_10032F170, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "accountController:accountAdded: %@", (uint8_t *)&v12, 0xCu);
  }
  id v9 = [v7 serviceName];
  unint64_t v10 = [(KTIDSActualOperations *)self _serviceTypeForName:v9];

  if (v10 == 1)
  {
    unsigned __int8 v11 = [(KTIDSActualOperations *)self checkAccountNFS];
    [v11 trigger];
  }
}

- (void)accountController:(id)a3 accountUpdated:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10032F168 != -1) {
    dispatch_once(&qword_10032F168, &stru_1002C79F8);
  }
  id v8 = qword_10032F170;
  if (os_log_type_enabled((os_log_t)qword_10032F170, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "accountController:accountUpdated: %@", (uint8_t *)&v12, 0xCu);
  }
  id v9 = [v7 serviceName];
  unint64_t v10 = [(KTIDSActualOperations *)self _serviceTypeForName:v9];

  if (v10 == 1)
  {
    unsigned __int8 v11 = [(KTIDSActualOperations *)self checkAccountNFS];
    [v11 trigger];
  }
}

- (void)accountController:(id)a3 accountRemoved:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10032F168 != -1) {
    dispatch_once(&qword_10032F168, &stru_1002C7A18);
  }
  id v8 = qword_10032F170;
  if (os_log_type_enabled((os_log_t)qword_10032F170, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "accountController:accountRemoved: %@", (uint8_t *)&v12, 0xCu);
  }
  id v9 = [v7 serviceName];
  unint64_t v10 = [(KTIDSActualOperations *)self _serviceTypeForName:v9];

  if (v10 == 1)
  {
    unsigned __int8 v11 = [(KTIDSActualOperations *)self checkAccountNFS];
    [v11 trigger];
  }
}

- (void)accountController:(id)a3 accountEnabled:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10032F168 != -1) {
    dispatch_once(&qword_10032F168, &stru_1002C7A38);
  }
  id v8 = qword_10032F170;
  if (os_log_type_enabled((os_log_t)qword_10032F170, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "accountController:accountEnabled: %@", (uint8_t *)&v12, 0xCu);
  }
  id v9 = [v7 serviceName];
  unint64_t v10 = [(KTIDSActualOperations *)self _serviceTypeForName:v9];

  if (v10 == 1)
  {
    unsigned __int8 v11 = [(KTIDSActualOperations *)self checkAccountNFS];
    [v11 trigger];
  }
}

- (void)accountController:(id)a3 accountDisabled:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10032F168 != -1) {
    dispatch_once(&qword_10032F168, &stru_1002C7A58);
  }
  id v8 = qword_10032F170;
  if (os_log_type_enabled((os_log_t)qword_10032F170, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "accountController:accountDisabled: %@", (uint8_t *)&v12, 0xCu);
  }
  id v9 = [v7 serviceName];
  unint64_t v10 = [(KTIDSActualOperations *)self _serviceTypeForName:v9];

  if (v10 == 1)
  {
    unsigned __int8 v11 = [(KTIDSActualOperations *)self checkAccountNFS];
    [v11 trigger];
  }
}

- (double)checkIDSTimeoutSeconds
{
  return self->checkIDSTimeoutSeconds;
}

- (void)setCheckIDSTimeoutSeconds:(double)a3
{
  self->checkIDSTimeoutSeconds = a3;
}

- (double)sleepTimeBetweenIDSCheckups
{
  return self->sleepTimeBetweenIDSCheckups;
}

- (void)setSleepTimeBetweenIDSCheckups:(double)a3
{
  self->sleepTimeBetweenIDSCheckups = a3;
}

- (id)idsObserver
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setIdsObserver:(id)a3
{
}

- (NSDate)timeOfLastUpsell
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTimeOfLastUpsell:(id)a3
{
}

- (NSArray)idsAccounts
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIdsAccounts:(id)a3
{
}

- (KTIDSSignInServiceUserInfo)lastPhoneAccountStatus
{
  return (KTIDSSignInServiceUserInfo *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastPhoneAccountStatus:(id)a3
{
}

- (KTVerificationInfoProvider)provider
{
  return (KTVerificationInfoProvider *)objc_getProperty(self, a2, 64, 1);
}

- (void)setProvider:(id)a3
{
}

- (KTIDSSignInServiceUserInfo)lastMessagesStatus
{
  return (KTIDSSignInServiceUserInfo *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastMessagesStatus:(id)a3
{
}

- (KTLockStateTracker)lockStateTracker
{
  return (KTLockStateTracker *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLockStateTracker:(id)a3
{
}

- (IDSKeyTransparencyManager)manager
{
  return (IDSKeyTransparencyManager *)objc_getProperty(self, a2, 88, 1);
}

- (void)setManager:(id)a3
{
}

- (OS_dispatch_queue)idsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setIdsQueue:(id)a3
{
}

- (OS_dispatch_queue)idsControllerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setIdsControllerQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (IDSSignInController)idsSignInController
{
  return (IDSSignInController *)objc_getProperty(self, a2, 120, 1);
}

- (void)setIdsSignInController:(id)a3
{
}

- (BOOL)registeredDelegate
{
  return self->_registeredDelegate;
}

- (void)setRegisteredDelegate:(BOOL)a3
{
  self->_registeredDelegate = a3;
}

- (IDSAccountControllerProtocol)accountController
{
  return (IDSAccountControllerProtocol *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAccountController:(id)a3
{
}

- (KTNearFutureScheduler)checkAccountNFS
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCheckAccountNFS:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkAccountNFS, 0);
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong((id *)&self->_idsSignInController, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_idsControllerQueue, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_lastMessagesStatus, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->lastPhoneAccountStatus, 0);
  objc_storeStrong((id *)&self->idsAccounts, 0);
  objc_storeStrong((id *)&self->timeOfLastUpsell, 0);

  objc_storeStrong(&self->idsObserver, 0);
}

@end