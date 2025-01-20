@interface MZKeyValueStoreClampsController
+ (BOOL)supportsSecureCoding;
+ (id)_classesForTransactionClampsValues;
+ (id)sharedClampsController;
- (BOOL)_canScheduleTransactionBasedOfNetworkingBlocked:(id)a3 error:(id *)a4;
- (BOOL)_canScheduleTransactionBasedOnBackOff:(id)a3 error:(id *)a4;
- (BOOL)_canScheduleTransactionBasedOnDSIDCheck:(id)a3 error:(id *)a4;
- (BOOL)_canScheduleTransactionBasedOnType:(id)a3 error:(id *)a4;
- (BOOL)_canScheduleTransactionBasedOnUserCancelledSignIn:(id)a3 error:(id *)a4;
- (BOOL)canScheduleTransaction:(id)a3 error:(id *)a4;
- (BOOL)hasAuthenticatedTooRecentlyForTransaction:(id)a3 error:(id *)a4;
- (BOOL)hasUserRecentlyAcceptedSync;
- (BOOL)isNetworkingBlocked;
- (MZKeyValueStoreClampsController)init;
- (MZKeyValueStoreClampsController)initWithCoder:(id)a3;
- (NSData)pendingUserDefaultArchivedData;
- (NSDictionary)transactionClamps;
- (OS_dispatch_queue)queue;
- (double)_rightNow;
- (double)authenticationNeededTimestamp;
- (double)backOffUntil;
- (double)dsidCheckTimestamp;
- (double)networkingBlockedUntil;
- (double)nextUserCancelBackOffInterval;
- (double)userAcceptedSyncTimestamp;
- (double)userCancelledSignInBackOffUntil;
- (id)_keyForTransaction:(id)a3;
- (id)description;
- (void)accessTransactionClampsWithBlock:(id)a3;
- (void)backOffForTimeInterval:(double)a3;
- (void)clearAuthenticationRequest;
- (void)clearBackOff;
- (void)clearDSIDCheckTimestamp;
- (void)clearNetworkingBlocked;
- (void)clearTimestampForTransaction:(id)a3;
- (void)clearUserAcceptedSyncTimestamp;
- (void)clearUserCancelledSignIn;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)saveToUserDefaults;
- (void)setAuthenticationNeededTimestamp:(double)a3;
- (void)setAuthenticationRequest;
- (void)setBackOffUntil:(double)a3;
- (void)setDSIDCheckTimestamp;
- (void)setDsidCheckTimestamp:(double)a3;
- (void)setNetworkingBlocked;
- (void)setNetworkingBlockedUntil:(double)a3;
- (void)setNextUserCancelBackOffInterval:(double)a3;
- (void)setPendingUserDefaultArchivedData:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimestampForTransaction:(id)a3;
- (void)setTransactionClamps:(id)a3;
- (void)setUserAcceptedSyncTimestamp;
- (void)setUserAcceptedSyncTimestamp:(double)a3;
- (void)setUserCancelledSignIn;
- (void)setUserCancelledSignInBackOffUntil:(double)a3;
@end

@implementation MZKeyValueStoreClampsController

- (MZKeyValueStoreClampsController)init
{
  v8.receiver = self;
  v8.super_class = (Class)MZKeyValueStoreClampsController;
  v2 = [(MZKeyValueStoreClampsController *)&v8 init];
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    transactionClamps = v2->_transactionClamps;
    v2->_transactionClamps = v3;

    v2->_nextUserCancelBackOffInterval = 300.0;
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MZKeyValueStoreClampsController", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  transactionClamps = self->_transactionClamps;
  id v6 = v4;
  if (transactionClamps)
  {
    [v4 encodeObject:transactionClamps forKey:@"MZTransactionClamps"];
    id v4 = v6;
  }
  if (fabs(self->_dsidCheckTimestamp) > 2.22044605e-16)
  {
    [v6 encodeDouble:@"MZDSIDCheckTimestamp" forKey:@"MZDSIDCheckTimestamp"];
    id v4 = v6;
  }
  if (fabs(self->_authenticationNeededTimestamp) > 2.22044605e-16)
  {
    [v6 encodeDouble:@"MZAuthenticationNeededTimestamp" forKey:@"MZAuthenticationNeededTimestamp"];
    id v4 = v6;
  }
  if (fabs(self->_userAcceptedSyncTimestamp) > 2.22044605e-16)
  {
    [v6 encodeDouble:@"MZUserAcceptedSyncTimestamp" forKey:];
    id v4 = v6;
  }
  if (fabs(self->_networkingBlockedUntil) > 2.22044605e-16)
  {
    [v6 encodeDouble:@"MZNetworkingBlockedUntil" forKey:];
    id v4 = v6;
  }
  if (fabs(self->_userCancelledSignInBackOffUntil) > 2.22044605e-16)
  {
    [v6 encodeDouble:@"MZUserCancelledSignInBackOffUntil" forKey:];
    id v4 = v6;
  }
}

- (NSDictionary)transactionClamps
{
  return self->_transactionClamps;
}

- (MZKeyValueStoreClampsController)initWithCoder:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(MZKeyValueStoreClampsController *)self init];
  if (v5)
  {
    id v6 = [(id)objc_opt_class() _classesForTransactionClampsValues];
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"MZTransactionClamps"];
    id v8 = [v7 mutableCopy];

    if (v8)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000590D8;
      v15[3] = &unk_10054EBD8;
      id v16 = v8;
      [(MZKeyValueStoreClampsController *)v5 accessTransactionClampsWithBlock:v15];
    }
    [v4 decodeDoubleForKey:@"MZDSIDCheckTimestamp"];
    v5->_dsidCheckTimestamp = v9;
    [v4 decodeDoubleForKey:@"MZAuthenticationNeededTimestamp"];
    v5->_authenticationNeededTimestamp = v10;
    [v4 decodeDoubleForKey:@"MZUserAcceptedSyncTimestamp"];
    v5->_userAcceptedSyncTimestamp = v11;
    [v4 decodeDoubleForKey:@"MZNetworkingBlockedUntil"];
    v5->_networkingBlockedUntil = v12;
    [v4 decodeDoubleForKey:@"MZUserCancelledSignInBackOffUntil"];
    v5->_userCancelledSignInBackOffUntil = v13;
  }
  return v5;
}

- (void)setPendingUserDefaultArchivedData:(id)a3
{
}

- (NSData)pendingUserDefaultArchivedData
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)accessTransactionClampsWithBlock:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(MZKeyValueStoreClampsController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E888;
  v7[3] = &unk_10054D738;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)reset
{
  [(MZKeyValueStoreClampsController *)self accessTransactionClampsWithBlock:&stru_10054EC18];
  [(MZKeyValueStoreClampsController *)self clearDSIDCheckTimestamp];
  [(MZKeyValueStoreClampsController *)self clearAuthenticationRequest];
  [(MZKeyValueStoreClampsController *)self clearBackOff];
  [(MZKeyValueStoreClampsController *)self clearNetworkingBlocked];
  [(MZKeyValueStoreClampsController *)self clearUserAcceptedSyncTimestamp];
  [(MZKeyValueStoreClampsController *)self clearUserCancelledSignIn];

  [(MZKeyValueStoreClampsController *)self saveToUserDefaults];
}

- (void)saveToUserDefaults
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v3 = [(MZKeyValueStoreClampsController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025BCC;
  block[3] = &unk_10054E2A8;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(v3, block);

  if (*((unsigned char *)v8 + 24))
  {
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100084F88;
    v5[3] = &unk_10054D570;
    v5[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v5);
  }
  _Block_object_dispose(&v7, 8);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setUserCancelledSignInBackOffUntil:(double)a3
{
  self->_userCancelledSignInBackOffUntil = a3;
}

- (void)setUserAcceptedSyncTimestamp:(double)a3
{
  self->_userAcceptedSyncTimestamp = a3;
}

- (void)setNetworkingBlockedUntil:(double)a3
{
  self->_networkingBlockedUntil = a3;
}

- (void)setDsidCheckTimestamp:(double)a3
{
  self->_dsidCheckTimestamp = a3;
}

- (void)setBackOffUntil:(double)a3
{
  self->_backOffUntil = a3;
}

- (void)setAuthenticationNeededTimestamp:(double)a3
{
  self->_authenticationNeededTimestamp = a3;
}

- (void)clearUserCancelledSignIn
{
  self->_nextUserCancelBackOffInterval = 300.0;
  [(MZKeyValueStoreClampsController *)self setUserCancelledSignInBackOffUntil:0.0];

  [(MZKeyValueStoreClampsController *)self saveToUserDefaults];
}

- (void)clearUserAcceptedSyncTimestamp
{
  [(MZKeyValueStoreClampsController *)self setUserAcceptedSyncTimestamp:0.0];

  [(MZKeyValueStoreClampsController *)self saveToUserDefaults];
}

- (void)clearNetworkingBlocked
{
}

- (void)clearDSIDCheckTimestamp
{
  [(MZKeyValueStoreClampsController *)self setDsidCheckTimestamp:0.0];

  [(MZKeyValueStoreClampsController *)self saveToUserDefaults];
}

- (void)clearBackOff
{
  [(MZKeyValueStoreClampsController *)self setBackOffUntil:0.0];

  [(MZKeyValueStoreClampsController *)self saveToUserDefaults];
}

- (void)clearAuthenticationRequest
{
  [(MZKeyValueStoreClampsController *)self setAuthenticationNeededTimestamp:0.0];

  [(MZKeyValueStoreClampsController *)self saveToUserDefaults];
}

+ (id)sharedClampsController
{
  if (qword_10060A6A8 != -1) {
    dispatch_once(&qword_10060A6A8, &stru_10054EBB0);
  }
  v2 = (void *)qword_10060A6B0;

  return v2;
}

+ (id)_classesForTransactionClampsValues
{
  if (qword_10060A6C0 != -1) {
    dispatch_once(&qword_10060A6C0, &stru_10054EC38);
  }
  v2 = (void *)qword_10060A6B8;

  return v2;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  dispatch_time_t v4 = NSStringFromClass(v3);
  dispatch_queue_t v5 = +[NSDate date];
  id v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:self->_dsidCheckTimestamp];
  uint64_t v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:self->_authenticationNeededTimestamp];
  id v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:self->_userAcceptedSyncTimestamp];
  uint64_t v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:self->_networkingBlockedUntil];
  char v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:self->_backOffUntil];
  double v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:self->_userCancelledSignInBackOffUntil];
  double v12 = +[NSString stringWithFormat:@"<%@:%p>\n                             Current Date = %@\n                             dsidCheckTimestamp = %@\n                             authenticationNeededTimestamp = %@\n                             userAcceptedSyncTimestamp = %@\n                             networkingBlockedUntil = %@\n                             backOffUntil= %@\n                             userCancelledSignInBackOffUntil = %@", v4, self, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (BOOL)canScheduleTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(MZKeyValueStoreClampsController *)self _canScheduleTransactionBasedOfNetworkingBlocked:v6 error:a4]&& [(MZKeyValueStoreClampsController *)self _canScheduleTransactionBasedOnBackOff:v6 error:a4]&& [(MZKeyValueStoreClampsController *)self _canScheduleTransactionBasedOnUserCancelledSignIn:v6 error:a4]&& [(MZKeyValueStoreClampsController *)self _canScheduleTransactionBasedOnDSIDCheck:v6 error:a4])
  {
    BOOL v7 = [(MZKeyValueStoreClampsController *)self _canScheduleTransactionBasedOnType:v6 error:a4];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)setTimestampForTransaction:(id)a3
{
  [(MZKeyValueStoreClampsController *)self _keyForTransaction:a3];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100085398;
  v5[3] = &unk_10054EBD8;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v6;
  [(MZKeyValueStoreClampsController *)self accessTransactionClampsWithBlock:v5];
}

- (void)clearTimestampForTransaction:(id)a3
{
  [(MZKeyValueStoreClampsController *)self _keyForTransaction:a3];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000854B0;
  v5[3] = &unk_10054EBD8;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v6;
  [(MZKeyValueStoreClampsController *)self accessTransactionClampsWithBlock:v5];
  [(MZKeyValueStoreClampsController *)self saveToUserDefaults];
}

- (void)setDSIDCheckTimestamp
{
  [(MZKeyValueStoreClampsController *)self _rightNow];
  -[MZKeyValueStoreClampsController setDsidCheckTimestamp:](self, "setDsidCheckTimestamp:");

  [(MZKeyValueStoreClampsController *)self saveToUserDefaults];
}

- (void)setAuthenticationRequest
{
  [(MZKeyValueStoreClampsController *)self _rightNow];
  -[MZKeyValueStoreClampsController setAuthenticationNeededTimestamp:](self, "setAuthenticationNeededTimestamp:");

  [(MZKeyValueStoreClampsController *)self saveToUserDefaults];
}

- (BOOL)hasAuthenticatedTooRecentlyForTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(MZKeyValueStoreClampsController *)self _rightNow];
  double v8 = v7;
  [(MZKeyValueStoreClampsController *)self authenticationNeededTimestamp];
  double v10 = v8 - v9;
  if (a4 && v10 < 1.0)
  {
    *a4 = +[MZKeyValueStoreError userClampErrorWithTransaction:v6 retrySeconds:0 underlyingError:1.0 - v10];
  }

  return v10 < 1.0;
}

- (void)setUserAcceptedSyncTimestamp
{
  [(MZKeyValueStoreClampsController *)self _rightNow];
  -[MZKeyValueStoreClampsController setUserAcceptedSyncTimestamp:](self, "setUserAcceptedSyncTimestamp:");

  [(MZKeyValueStoreClampsController *)self saveToUserDefaults];
}

- (BOOL)hasUserRecentlyAcceptedSync
{
  [(MZKeyValueStoreClampsController *)self userAcceptedSyncTimestamp];
  if (fabs(v3) > 2.22044605e-16
    && ([(MZKeyValueStoreClampsController *)self _rightNow],
        double v5 = v4,
        [(MZKeyValueStoreClampsController *)self userAcceptedSyncTimestamp],
        v5 - v6 <= 60.0))
  {
    BOOL v7 = 1;
  }
  else
  {
    [(MZKeyValueStoreClampsController *)self setUserAcceptedSyncTimestamp:0.0];
    BOOL v7 = 0;
  }
  [(MZKeyValueStoreClampsController *)self saveToUserDefaults];
  return v7;
}

- (void)setUserCancelledSignIn
{
  [(MZKeyValueStoreClampsController *)self _rightNow];
  [(MZKeyValueStoreClampsController *)self setUserCancelledSignInBackOffUntil:v3 + self->_nextUserCancelBackOffInterval];
  self->_nextUserCancelBackOffInterval = fmin(self->_nextUserCancelBackOffInterval * 12.0, 18000.0);
  double v4 = +[NSDate date];
  [v4 timeIntervalSinceReferenceDate];

  [(MZKeyValueStoreClampsController *)self saveToUserDefaults];
}

- (void)backOffForTimeInterval:(double)a3
{
  [(MZKeyValueStoreClampsController *)self _rightNow];
  [(MZKeyValueStoreClampsController *)self setBackOffUntil:v5 + a3];

  [(MZKeyValueStoreClampsController *)self saveToUserDefaults];
}

- (void)setNetworkingBlocked
{
  [(MZKeyValueStoreClampsController *)self _rightNow];
  [(MZKeyValueStoreClampsController *)self setNetworkingBlockedUntil:v3 + 31536000.0];

  [(MZKeyValueStoreClampsController *)self saveToUserDefaults];
}

- (BOOL)isNetworkingBlocked
{
  [(MZKeyValueStoreClampsController *)self networkingBlockedUntil];
  if (fabs(v3) > 2.22044605e-16)
  {
    [(MZKeyValueStoreClampsController *)self networkingBlockedUntil];
    double v5 = v4;
    [(MZKeyValueStoreClampsController *)self _rightNow];
    if (v5 > v6) {
      return 1;
    }
    [(MZKeyValueStoreClampsController *)self clearNetworkingBlocked];
  }
  return 0;
}

- (double)_rightNow
{
  v2 = +[NSDate date];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

- (id)_keyForTransaction:(id)a3
{
  id v3 = a3;
  id v4 = [v3 type];
  double v5 = [v3 processor];
  double v6 = (objc_class *)objc_opt_class();
  BOOL v7 = NSStringFromClass(v6);
  double v8 = [v3 keys];

  double v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d-%@-%lu", v4, v7, [v8 count]);

  return v9;
}

- (BOOL)_canScheduleTransactionBasedOnType:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(MZKeyValueStoreClampsController *)self _keyForTransaction:v6];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100056EB0;
  v22 = sub_100057230;
  id v23 = 0;
  double v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_100085AE8;
  v15 = &unk_10054EC60;
  v17 = &v18;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v7;
  [(MZKeyValueStoreClampsController *)self accessTransactionClampsWithBlock:&v12];
  double v8 = (void *)v19[5];
  if (!v8) {
    goto LABEL_6;
  }
  [v8 timeIntervalSinceNow:v12, v13, v14, v15];
  if (v9 < 0.0) {
    double v9 = -v9;
  }
  if (v9 > 5.0)
  {
    [(MZKeyValueStoreClampsController *)self clearTimestampForTransaction:v6];
LABEL_6:
    BOOL v10 = 1;
    goto LABEL_10;
  }
  if (a4)
  {
    +[MZKeyValueStoreError clientClampErrorWithTransaction:v6 retrySeconds:0 underlyingError:5.0 - v9];
    BOOL v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_10:

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (BOOL)_canScheduleTransactionBasedOfNetworkingBlocked:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [(MZKeyValueStoreClampsController *)self isNetworkingBlocked];
  if (v7)
  {
    *a4 = +[MZKeyValueStoreError networkingBlockedErrorWithTransaction:v6 underlyingError:0];
  }

  return v7 ^ 1;
}

- (BOOL)_canScheduleTransactionBasedOnDSIDCheck:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(MZKeyValueStoreClampsController *)self dsidCheckTimestamp];
  double v8 = v7;
  if (a4 && v7 != 0.0)
  {
    *a4 = +[MZKeyValueStoreError userClampErrorWithTransaction:v6 retrySeconds:0 underlyingError:0.0];
  }

  return v8 == 0.0;
}

- (BOOL)_canScheduleTransactionBasedOnBackOff:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(MZKeyValueStoreClampsController *)self backOffUntil];
  if (fabs(v7) <= 2.22044605e-16) {
    goto LABEL_4;
  }
  [(MZKeyValueStoreClampsController *)self _rightNow];
  double v9 = v8;
  [(MZKeyValueStoreClampsController *)self backOffUntil];
  if (v9 > v10)
  {
    [(MZKeyValueStoreClampsController *)self clearBackOff];
LABEL_4:
    BOOL v11 = 1;
    goto LABEL_5;
  }
  [(MZKeyValueStoreClampsController *)self backOffUntil];
  if (a4)
  {
    +[MZKeyValueStoreError serverClampErrorWithTransaction:v6 retrySeconds:0 underlyingError:v13 - v9];
    BOOL v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_5:

  return v11;
}

- (BOOL)_canScheduleTransactionBasedOnUserCancelledSignIn:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(MZKeyValueStoreClampsController *)self userCancelledSignInBackOffUntil];
  if (fabs(v7) <= 2.22044605e-16) {
    goto LABEL_4;
  }
  [(MZKeyValueStoreClampsController *)self _rightNow];
  double v9 = v8;
  [(MZKeyValueStoreClampsController *)self userCancelledSignInBackOffUntil];
  if (v9 > v10)
  {
    [(MZKeyValueStoreClampsController *)self clearUserCancelledSignIn];
LABEL_4:
    BOOL v11 = 1;
    goto LABEL_5;
  }
  [(MZKeyValueStoreClampsController *)self userAcceptedSyncTimestamp];
  if (a4)
  {
    +[MZKeyValueStoreError userClampErrorWithTransaction:v6 retrySeconds:0 underlyingError:v13 - v9];
    BOOL v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_5:

  return v11;
}

- (void)setTransactionClamps:(id)a3
{
}

- (double)dsidCheckTimestamp
{
  return self->_dsidCheckTimestamp;
}

- (double)authenticationNeededTimestamp
{
  return self->_authenticationNeededTimestamp;
}

- (double)userAcceptedSyncTimestamp
{
  return self->_userAcceptedSyncTimestamp;
}

- (double)networkingBlockedUntil
{
  return self->_networkingBlockedUntil;
}

- (double)backOffUntil
{
  return self->_backOffUntil;
}

- (double)userCancelledSignInBackOffUntil
{
  return self->_userCancelledSignInBackOffUntil;
}

- (double)nextUserCancelBackOffInterval
{
  return self->_nextUserCancelBackOffInterval;
}

- (void)setNextUserCancelBackOffInterval:(double)a3
{
  self->_nextUserCancelBackOffInterval = a3;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pendingUserDefaultArchivedData, 0);

  objc_storeStrong((id *)&self->_transactionClamps, 0);
}

@end