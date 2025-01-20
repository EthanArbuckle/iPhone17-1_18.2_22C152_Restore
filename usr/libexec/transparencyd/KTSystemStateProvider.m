@interface KTSystemStateProvider
- (BOOL)newServerOptInRequests;
- (BOOL)pendingChanges;
- (BOOL)treeStateUnstable:(id)a3 logBeginTime:(unint64_t)a4;
- (KTCondition)statusFilled;
- (KTNSDistributedNotificationCenter)dnc;
- (KTSelfStatusResult)ktStatus;
- (KTSystemStateProvider)initWithDataStore:(id)a3 notificationCenter:(id)a4;
- (TransparencyManagedDataStore)dataStore;
- (void)reset;
- (void)setAccountStatus:(unint64_t)a3;
- (void)setDataStore:(id)a3;
- (void)setDnc:(id)a3;
- (void)setIDSAccountStatus:(unint64_t)a3;
- (void)setKTAccountKey:(id)a3;
- (void)setKtStatus:(id)a3;
- (void)setNewServerOptInRequests:(BOOL)a3;
- (void)setOptInState:(unint64_t)a3 everOptIn:(BOOL)a4;
- (void)setPendingChanges:(BOOL)a3;
- (void)setSelfDevices:(id)a3;
- (void)setSelfStatus:(unint64_t)a3;
- (void)setServerOptInState:(unint64_t)a3;
- (void)setStatusFilled:(id)a3;
- (void)setSystemStatus:(unint64_t)a3;
@end

@implementation KTSystemStateProvider

- (KTSystemStateProvider)initWithDataStore:(id)a3 notificationCenter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)KTSystemStateProvider;
  v8 = [(KTSystemStateProvider *)&v14 init];
  v9 = v8;
  if (v8)
  {
    [(KTSystemStateProvider *)v8 setDataStore:v6];
    id v10 = objc_alloc_init((Class)KTSelfStatusResult);
    [(KTSystemStateProvider *)v9 setKtStatus:v10];

    [(KTSystemStateProvider *)v9 setDnc:v7];
    v11 = objc_alloc_init(KTCondition);
    [(KTSystemStateProvider *)v9 setStatusFilled:v11];

    v12 = v9;
  }

  return v9;
}

- (BOOL)treeStateUnstable:(id)a3 logBeginTime:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(KTSystemStateProvider *)self dataStore];
  id v12 = 0;
  unsigned __int8 v8 = [v7 isMapStillPopulating:v6 logBeginMs:a4 error:&v12];

  id v9 = v12;
  if (v9)
  {
    if (qword_10032EFE8 != -1) {
      dispatch_once(&qword_10032EFE8, &stru_1002C5A98);
    }
    id v10 = qword_10032EFF0;
    if (os_log_type_enabled((os_log_t)qword_10032EFF0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "KTSystemStateProvider could not fetch tree state: %@", buf, 0xCu);
    }
  }

  return v8;
}

- (void)setPendingChanges:(BOOL)a3
{
  int v3 = a3;
  v5 = [(KTSystemStateProvider *)self ktStatus];
  unsigned int v6 = [v5 pendingStatusChanges];

  if (v6 != v3)
  {
    id v7 = [(KTSystemStateProvider *)self ktStatus];
    unsigned __int8 v8 = v7;
    if (v3)
    {
      [v7 setPendingStatusChanges:1];

      id v9 = objc_alloc_init(KTCondition);
      -[KTSystemStateProvider setStatusFilled:](self, "setStatusFilled:");
    }
    else
    {
      [v7 setPendingStatusChanges:0];

      id v9 = [(KTSystemStateProvider *)self statusFilled];
      [(KTCondition *)v9 fulfill];
    }
  }
}

- (BOOL)pendingChanges
{
  v2 = [(KTSystemStateProvider *)self ktStatus];
  unsigned __int8 v3 = [v2 pendingStatusChanges];

  return v3;
}

- (void)reset
{
  id v3 = objc_alloc_init((Class)KTSelfStatusResult);
  [(KTSystemStateProvider *)self setKtStatus:v3];
}

- (void)setOptInState:(unint64_t)a3 everOptIn:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(KTSystemStateProvider *)self ktStatus];
  [v7 setEverOptIn:v4];

  unsigned __int8 v8 = [(KTSystemStateProvider *)self ktStatus];
  id v9 = [v8 optIn];

  if (v9 != (id)a3)
  {
    id v10 = [(KTSystemStateProvider *)self ktStatus];
    [v10 setOptIn:a3];

    v11 = [(KTSystemStateProvider *)self dnc];
    uint64_t v12 = kTransparencyNotificationStatusChanged;
    uint64_t v15 = kKTStatusOptInState;
    v13 = +[NSNumber numberWithUnsignedInteger:a3];
    v16 = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    [v11 postNotificationName:v12 object:0 userInfo:v14 deliverImmediately:1];
  }
}

- (void)setServerOptInState:(unint64_t)a3
{
  v5 = [(KTSystemStateProvider *)self ktStatus];
  id v6 = [v5 serverOptIn];

  if (v6 != (id)a3)
  {
    id v7 = [(KTSystemStateProvider *)self ktStatus];
    [v7 setServerOptIn:a3];

    unsigned __int8 v8 = [(KTSystemStateProvider *)self dnc];
    uint64_t v9 = kTransparencyNotificationStatusChanged;
    uint64_t v12 = kKTStatusServerOptInState;
    id v10 = +[NSNumber numberWithUnsignedInteger:a3];
    v13 = v10;
    v11 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [v8 postNotificationName:v9 object:0 userInfo:v11 deliverImmediately:1];
  }
}

- (void)setAccountStatus:(unint64_t)a3
{
  v5 = [(KTSystemStateProvider *)self ktStatus];
  id v6 = [v5 accountStatus];

  if (v6 != (id)a3)
  {
    id v7 = [(KTSystemStateProvider *)self ktStatus];
    [v7 setAccountStatus:a3];

    unsigned __int8 v8 = [(KTSystemStateProvider *)self dnc];
    uint64_t v9 = kTransparencyNotificationAccountStatusChanged;
    uint64_t v10 = kKTStatusAccountStatus;
    uint64_t v19 = kKTStatusAccountStatus;
    v11 = +[NSNumber numberWithUnsignedInteger:a3];
    v20 = v11;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    [v8 postNotificationName:v9 object:0 userInfo:v12 deliverImmediately:1];

    v13 = [(KTSystemStateProvider *)self dnc];
    uint64_t v14 = kTransparencyNotificationStatusChanged;
    uint64_t v17 = v10;
    uint64_t v15 = +[NSNumber numberWithUnsignedInteger:a3];
    v18 = v15;
    v16 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    [v13 postNotificationName:v14 object:0 userInfo:v16 deliverImmediately:1];
  }
}

- (void)setSelfStatus:(unint64_t)a3
{
  v5 = [(KTSystemStateProvider *)self ktStatus];
  id v6 = [v5 selfStatus];

  if (v6 != (id)a3)
  {
    id v7 = [(KTSystemStateProvider *)self ktStatus];
    [v7 setSelfStatus:a3];

    unsigned __int8 v8 = [(KTSystemStateProvider *)self dnc];
    uint64_t v9 = kTransparencyNotificationStatusChanged;
    uint64_t v12 = kKTStatusSelfStatus;
    uint64_t v10 = +[NSNumber numberWithUnsignedInteger:a3];
    v13 = v10;
    v11 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [v8 postNotificationName:v9 object:0 userInfo:v11 deliverImmediately:1];
  }
}

- (void)setSelfDevices:(id)a3
{
  id v4 = a3;
  id v5 = [(KTSystemStateProvider *)self ktStatus];
  [v5 setSelfDevices:v4];
}

- (void)setSystemStatus:(unint64_t)a3
{
  id v5 = [(KTSystemStateProvider *)self ktStatus];
  id v6 = [v5 systemStatus];

  if (v6 != (id)a3)
  {
    id v7 = [(KTSystemStateProvider *)self ktStatus];
    [v7 setSystemStatus:a3];

    unsigned __int8 v8 = [(KTSystemStateProvider *)self dnc];
    uint64_t v9 = kTransparencyNotificationStatusChanged;
    uint64_t v12 = kKTStatusSystemStatus;
    uint64_t v10 = +[NSNumber numberWithUnsignedInteger:a3];
    v13 = v10;
    v11 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [v8 postNotificationName:v9 object:0 userInfo:v11 deliverImmediately:1];
  }
}

- (void)setKTAccountKey:(id)a3
{
  id v4 = a3;
  id v5 = [(KTSystemStateProvider *)self ktStatus];
  id v6 = [v5 accountKey];
  unsigned __int8 v7 = [v6 isEqual:v4];

  if ((v7 & 1) == 0)
  {
    unsigned __int8 v8 = [(KTSystemStateProvider *)self ktStatus];
    [v8 setAccountKey:v4];

    uint64_t v9 = [(KTSystemStateProvider *)self dnc];
    uint64_t v10 = kTransparencyNotificationStatusChanged;
    uint64_t v12 = kKTStatusAccountKey;
    v13 = &__kCFBooleanTrue;
    v11 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [v9 postNotificationName:v10 object:0 userInfo:v11 deliverImmediately:1];
  }
}

- (void)setIDSAccountStatus:(unint64_t)a3
{
  id v5 = [(KTSystemStateProvider *)self ktStatus];
  id v6 = [v5 idsAccountStatus];

  if (v6 != (id)a3)
  {
    unsigned __int8 v7 = [(KTSystemStateProvider *)self ktStatus];
    [v7 setIdsAccountStatus:a3];

    unsigned __int8 v8 = [(KTSystemStateProvider *)self dnc];
    uint64_t v9 = kTransparencyNotificationStatusChanged;
    uint64_t v12 = kKTStatusIDSAccount;
    uint64_t v10 = +[NSNumber numberWithUnsignedInteger:a3];
    v13 = v10;
    v11 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [v8 postNotificationName:v9 object:0 userInfo:v11 deliverImmediately:1];
  }
}

- (KTCondition)statusFilled
{
  return (KTCondition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStatusFilled:(id)a3
{
}

- (BOOL)newServerOptInRequests
{
  return self->newServerOptInRequests;
}

- (void)setNewServerOptInRequests:(BOOL)a3
{
  self->newServerOptInRequests = a3;
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDataStore:(id)a3
{
}

- (KTSelfStatusResult)ktStatus
{
  return (KTSelfStatusResult *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKtStatus:(id)a3
{
}

- (KTNSDistributedNotificationCenter)dnc
{
  return (KTNSDistributedNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDnc:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnc, 0);
  objc_storeStrong((id *)&self->_ktStatus, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);

  objc_storeStrong((id *)&self->statusFilled, 0);
}

@end