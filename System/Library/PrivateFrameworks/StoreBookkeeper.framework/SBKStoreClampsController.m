@interface SBKStoreClampsController
+ (BOOL)supportsSecureCoding;
+ (id)sharedClampsController;
- (BOOL)_canScheduleTransactionBasedOfNetworkingBlocked:(id)a3 error:(id *)a4;
- (BOOL)_canScheduleTransactionBasedOnAccountIdentifierCheck:(id)a3 error:(id *)a4;
- (BOOL)_canScheduleTransactionBasedOnBackOff:(id)a3 error:(id *)a4;
- (BOOL)_canScheduleTransactionBasedOnType:(id)a3 error:(id *)a4;
- (BOOL)_canScheduleTransactionBasedOnUserCancelledSignIn:(id)a3 error:(id *)a4;
- (BOOL)canScheduleTransaction:(id)a3 error:(id *)a4;
- (BOOL)hasAuthenticatedTooRecentlyForTransaction:(id)a3 error:(id *)a4;
- (BOOL)hasUserRecentlyAcceptedSync;
- (BOOL)isNetworkingBlocked;
- (NSData)pendingUserDefaultArchivedData;
- (NSDictionary)transactionClamps;
- (OS_dispatch_queue)queue;
- (SBKStoreClampsController)init;
- (SBKStoreClampsController)initWithCoder:(id)a3;
- (double)_rightNow;
- (double)accountIdentifierCheckTimestamp;
- (double)authenticationNeededTimestamp;
- (double)backOffUntil;
- (double)networkingBlockedUntil;
- (double)nextUserCancelBackOffInterval;
- (double)userAcceptedSyncTimestamp;
- (double)userCancelledSignInBackOffUntil;
- (id)_keyForTransaction:(id)a3;
- (id)description;
- (void)accessTransactionClampsWithBlock:(id)a3;
- (void)backOffForTimeInterval:(double)a3;
- (void)clearAccountIdentifierCheckTimestamp;
- (void)clearAuthenticationRequest;
- (void)clearBackOff;
- (void)clearNetworkingBlocked;
- (void)clearTimestampForTransaction:(id)a3;
- (void)clearUserAcceptedSyncTimestamp;
- (void)clearUserCancelledSignIn;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)saveToUserDefaults;
- (void)setAccountIdentifierCheckTimestamp;
- (void)setAccountIdentifierCheckTimestamp:(double)a3;
- (void)setAuthenticationNeededTimestamp:(double)a3;
- (void)setAuthenticationRequest;
- (void)setBackOffUntil:(double)a3;
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

@implementation SBKStoreClampsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingUserDefaultArchivedData, 0);
  objc_storeStrong((id *)&self->_transactionClamps, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setPendingUserDefaultArchivedData:(id)a3
{
}

- (NSData)pendingUserDefaultArchivedData
{
  return self->_pendingUserDefaultArchivedData;
}

- (void)setNextUserCancelBackOffInterval:(double)a3
{
  self->_nextUserCancelBackOffInterval = a3;
}

- (double)nextUserCancelBackOffInterval
{
  return self->_nextUserCancelBackOffInterval;
}

- (void)setUserCancelledSignInBackOffUntil:(double)a3
{
  self->_userCancelledSignInBackOffUntil = a3;
}

- (double)userCancelledSignInBackOffUntil
{
  return self->_userCancelledSignInBackOffUntil;
}

- (void)setBackOffUntil:(double)a3
{
  self->_backOffUntil = a3;
}

- (double)backOffUntil
{
  return self->_backOffUntil;
}

- (void)setNetworkingBlockedUntil:(double)a3
{
  self->_networkingBlockedUntil = a3;
}

- (double)networkingBlockedUntil
{
  return self->_networkingBlockedUntil;
}

- (void)setUserAcceptedSyncTimestamp:(double)a3
{
  self->_userAcceptedSyncTimestamp = a3;
}

- (double)userAcceptedSyncTimestamp
{
  return self->_userAcceptedSyncTimestamp;
}

- (void)setAuthenticationNeededTimestamp:(double)a3
{
  self->_authenticationNeededTimestamp = a3;
}

- (double)authenticationNeededTimestamp
{
  return self->_authenticationNeededTimestamp;
}

- (void)setAccountIdentifierCheckTimestamp:(double)a3
{
  self->_accountIdentifierCheckTimestamp = a3;
}

- (double)accountIdentifierCheckTimestamp
{
  return self->_accountIdentifierCheckTimestamp;
}

- (void)setTransactionClamps:(id)a3
{
}

- (NSDictionary)transactionClamps
{
  return self->_transactionClamps;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)_canScheduleTransactionBasedOnUserCancelledSignIn:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(SBKStoreClampsController *)self userCancelledSignInBackOffUntil];
  if (fabs(v7) <= 0.00000011920929) {
    goto LABEL_4;
  }
  [(SBKStoreClampsController *)self _rightNow];
  double v9 = v8;
  [(SBKStoreClampsController *)self userCancelledSignInBackOffUntil];
  if (v9 > v10)
  {
    [(SBKStoreClampsController *)self clearUserCancelledSignIn];
LABEL_4:
    BOOL v11 = 1;
    goto LABEL_5;
  }
  [(SBKStoreClampsController *)self userAcceptedSyncTimestamp];
  double v14 = v13 - v9;
  v15 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)MEMORY[0x263EFF910];
    [(SBKStoreClampsController *)self userCancelledSignInBackOffUntil];
    v17 = objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
    int v18 = 134218498;
    id v19 = v6;
    __int16 v20 = 2112;
    v21 = v17;
    __int16 v22 = 2048;
    double v23 = v14;
    _os_log_impl(&dword_22B807000, v15, OS_LOG_TYPE_DEFAULT, "Drop transaction: <%p> -- userCancelledBackOff until: %@ [%fs]", (uint8_t *)&v18, 0x20u);
  }
  if (a4)
  {
    +[SBKStoreError userClampErrorWithTransaction:v6 retrySeconds:0 underlyingError:v14];
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

- (BOOL)_canScheduleTransactionBasedOnBackOff:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(SBKStoreClampsController *)self backOffUntil];
  if (fabs(v7) <= 0.00000011920929) {
    goto LABEL_4;
  }
  [(SBKStoreClampsController *)self _rightNow];
  double v9 = v8;
  [(SBKStoreClampsController *)self backOffUntil];
  if (v9 > v10)
  {
    [(SBKStoreClampsController *)self clearBackOff];
LABEL_4:
    BOOL v11 = 1;
    goto LABEL_5;
  }
  [(SBKStoreClampsController *)self backOffUntil];
  double v14 = v13 - v9;
  v15 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)MEMORY[0x263EFF910];
    [(SBKStoreClampsController *)self backOffUntil];
    v17 = objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
    int v18 = 134218498;
    id v19 = v6;
    __int16 v20 = 2112;
    v21 = v17;
    __int16 v22 = 2048;
    double v23 = v14;
    _os_log_impl(&dword_22B807000, v15, OS_LOG_TYPE_DEFAULT, "Drop transaction: <%p> -- BackOff until: %@ [%fs]", (uint8_t *)&v18, 0x20u);
  }
  if (a4)
  {
    +[SBKStoreError serverClampErrorWithTransaction:v6 retrySeconds:0 underlyingError:v14];
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

- (BOOL)_canScheduleTransactionBasedOnAccountIdentifierCheck:(id)a3 error:(id *)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(SBKStoreClampsController *)self accountIdentifierCheckTimestamp];
  double v8 = v7;
  if (v7 != 0.0)
  {
    double v9 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      id v12 = v6;
      _os_log_impl(&dword_22B807000, v9, OS_LOG_TYPE_DEFAULT, "Drop transaction: <%p> -- AccountIdentifierCheck != 0", (uint8_t *)&v11, 0xCu);
    }

    if (a4)
    {
      *a4 = +[SBKStoreError userClampErrorWithTransaction:v6 retrySeconds:0 underlyingError:0.0];
    }
  }

  return v8 == 0.0;
}

- (BOOL)_canScheduleTransactionBasedOfNetworkingBlocked:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [(SBKStoreClampsController *)self isNetworkingBlocked];
  if (v7)
  {
    double v8 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = (void *)MEMORY[0x263EFF910];
      [(SBKStoreClampsController *)self networkingBlockedUntil];
      double v10 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
      int v12 = 134218242;
      id v13 = v6;
      __int16 v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_22B807000, v8, OS_LOG_TYPE_DEFAULT, "Drop transaction: <%p> -- Networking BlockedUntil: %@", (uint8_t *)&v12, 0x16u);
    }
    *a4 = +[SBKStoreError networkingBlockedErrorWithTransaction:v6 underlyingError:0];
  }

  return !v7;
}

- (BOOL)_canScheduleTransactionBasedOnType:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x3032000000;
  __int16 v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__SBKStoreClampsController__canScheduleTransactionBasedOnType_error___block_invoke;
  v14[3] = &unk_2648AEFB0;
  uint64_t v16 = &v17;
  v14[4] = self;
  id v7 = v6;
  id v15 = v7;
  [(SBKStoreClampsController *)self accessTransactionClampsWithBlock:v14];
  double v8 = (void *)v18[5];
  if (!v8) {
    goto LABEL_7;
  }
  [v8 timeIntervalSinceNow];
  if (v9 >= 0.0) {
    double v10 = v9;
  }
  else {
    double v10 = -v9;
  }
  if (v10 > 5.0)
  {
    [(SBKStoreClampsController *)self clearTimestampForTransaction:v7];
LABEL_7:
    BOOL v11 = 1;
    goto LABEL_13;
  }
  int v12 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v24 = v7;
    __int16 v25 = 2048;
    double v26 = v10;
    __int16 v27 = 2048;
    double v28 = 5.0 - v10;
    _os_log_impl(&dword_22B807000, v12, OS_LOG_TYPE_DEFAULT, "Drop transaction: %@ -- Interval since last request: %f [%fs]", buf, 0x20u);
  }

  if (a4)
  {
    +[SBKStoreError serverClampErrorWithTransaction:v7 retrySeconds:0 underlyingError:5.0 - v10];
    BOOL v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_13:

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __69__SBKStoreClampsController__canScheduleTransactionBasedOnType_error___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  id v9 = [v3 _keyForTransaction:v4];
  uint64_t v6 = [v5 valueForKey:v9];

  uint64_t v7 = *(void *)(a1[6] + 8);
  double v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)_keyForTransaction:(id)a3
{
  return (id)[a3 clampsKey];
}

- (double)_rightNow
{
  v2 = [MEMORY[0x263EFF910] date];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

- (BOOL)isNetworkingBlocked
{
  [(SBKStoreClampsController *)self networkingBlockedUntil];
  if (v3 != 0.0)
  {
    [(SBKStoreClampsController *)self networkingBlockedUntil];
    double v5 = v4;
    [(SBKStoreClampsController *)self _rightNow];
    if (v5 > v6) {
      return 1;
    }
  }
  [(SBKStoreClampsController *)self clearNetworkingBlocked];
  return 0;
}

- (void)clearNetworkingBlocked
{
}

- (void)setNetworkingBlocked
{
  [(SBKStoreClampsController *)self _rightNow];
  [(SBKStoreClampsController *)self setNetworkingBlockedUntil:v3 + 31536000.0];
  [(SBKStoreClampsController *)self saveToUserDefaults];
}

- (void)clearBackOff
{
  [(SBKStoreClampsController *)self setBackOffUntil:0.0];
  [(SBKStoreClampsController *)self saveToUserDefaults];
}

- (void)backOffForTimeInterval:(double)a3
{
  [(SBKStoreClampsController *)self _rightNow];
  [(SBKStoreClampsController *)self setBackOffUntil:v5 + a3];
  [(SBKStoreClampsController *)self saveToUserDefaults];
}

- (void)clearUserCancelledSignIn
{
  self->_nextUserCancelBackOffInterval = 300.0;
  [(SBKStoreClampsController *)self setUserCancelledSignInBackOffUntil:0.0];
  [(SBKStoreClampsController *)self saveToUserDefaults];
}

- (void)setUserCancelledSignIn
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(SBKStoreClampsController *)self _rightNow];
  [(SBKStoreClampsController *)self setUserCancelledSignInBackOffUntil:v3 + self->_nextUserCancelBackOffInterval];
  double userCancelledSignInBackOffUntil = self->_userCancelledSignInBackOffUntil;
  self->_nextUserCancelBackOffInterval = fmin(self->_nextUserCancelBackOffInterval * 12.0, 18000.0);
  double v5 = [MEMORY[0x263EFF910] date];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  double v8 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    double v9 = userCancelledSignInBackOffUntil
       - v7
       - (double)(3600 * (unint64_t)((userCancelledSignInBackOffUntil - v7) / 3600.0));
    int v10 = 134218496;
    unint64_t v11 = (unint64_t)((userCancelledSignInBackOffUntil - v7) / 3600.0);
    __int16 v12 = 2048;
    unint64_t v13 = (unint64_t)(v9 / 60.0);
    __int16 v14 = 2048;
    double v15 = v9 - (double)(60 * v13);
    _os_log_impl(&dword_22B807000, v8, OS_LOG_TYPE_ERROR, "[StoreBookkeeper] SBKStoreClampsController - will avoid presenting authentication for %02llu:%02llu:%2f", (uint8_t *)&v10, 0x20u);
  }

  [(SBKStoreClampsController *)self saveToUserDefaults];
}

- (BOOL)hasUserRecentlyAcceptedSync
{
  [(SBKStoreClampsController *)self userAcceptedSyncTimestamp];
  if (fabs(v3) > 0.00000011920929
    && ([(SBKStoreClampsController *)self _rightNow],
        double v5 = v4,
        [(SBKStoreClampsController *)self userAcceptedSyncTimestamp],
        v5 - v6 <= 60.0))
  {
    BOOL v7 = 1;
  }
  else
  {
    [(SBKStoreClampsController *)self setUserAcceptedSyncTimestamp:0.0];
    BOOL v7 = 0;
  }
  [(SBKStoreClampsController *)self saveToUserDefaults];
  return v7;
}

- (void)clearUserAcceptedSyncTimestamp
{
  [(SBKStoreClampsController *)self setUserAcceptedSyncTimestamp:0.0];
  [(SBKStoreClampsController *)self saveToUserDefaults];
}

- (void)setUserAcceptedSyncTimestamp
{
  [(SBKStoreClampsController *)self _rightNow];
  -[SBKStoreClampsController setUserAcceptedSyncTimestamp:](self, "setUserAcceptedSyncTimestamp:");
  [(SBKStoreClampsController *)self saveToUserDefaults];
}

- (BOOL)hasAuthenticatedTooRecentlyForTransaction:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(SBKStoreClampsController *)self _rightNow];
  double v8 = v7;
  [(SBKStoreClampsController *)self authenticationNeededTimestamp];
  double v10 = v8 - v9;
  if (v8 - v9 < 1.0)
  {
    unint64_t v11 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412802;
      id v14 = v6;
      __int16 v15 = 2048;
      double v16 = v10;
      __int16 v17 = 2048;
      double v18 = 1.0 - v10;
      _os_log_impl(&dword_22B807000, v11, OS_LOG_TYPE_DEFAULT, "Drop transaction: %@ -- Too soon since last authentication: %f [%fs]", (uint8_t *)&v13, 0x20u);
    }

    if (a4)
    {
      *a4 = +[SBKStoreError userClampErrorWithTransaction:v6 retrySeconds:0 underlyingError:1.0 - v10];
    }
  }

  return v10 < 1.0;
}

- (void)clearAuthenticationRequest
{
  [(SBKStoreClampsController *)self setAuthenticationNeededTimestamp:0.0];
  [(SBKStoreClampsController *)self saveToUserDefaults];
}

- (void)setAuthenticationRequest
{
  [(SBKStoreClampsController *)self _rightNow];
  -[SBKStoreClampsController setAuthenticationNeededTimestamp:](self, "setAuthenticationNeededTimestamp:");
  [(SBKStoreClampsController *)self saveToUserDefaults];
}

- (void)clearAccountIdentifierCheckTimestamp
{
  [(SBKStoreClampsController *)self setAccountIdentifierCheckTimestamp:0.0];
  [(SBKStoreClampsController *)self saveToUserDefaults];
}

- (void)setAccountIdentifierCheckTimestamp
{
  [(SBKStoreClampsController *)self _rightNow];
  -[SBKStoreClampsController setAccountIdentifierCheckTimestamp:](self, "setAccountIdentifierCheckTimestamp:");
  [(SBKStoreClampsController *)self saveToUserDefaults];
}

- (void)clearTimestampForTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  double v8 = __57__SBKStoreClampsController_clearTimestampForTransaction___block_invoke;
  double v9 = &unk_2648AEF88;
  double v10 = self;
  id v11 = v4;
  id v5 = v4;
  [(SBKStoreClampsController *)self accessTransactionClampsWithBlock:&v6];
  [(SBKStoreClampsController *)self saveToUserDefaults];
}

void __57__SBKStoreClampsController_clearTimestampForTransaction___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v2 _keyForTransaction:v3];
  [v4 setValue:0 forKey:v5];
}

- (void)setTimestampForTransaction:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__SBKStoreClampsController_setTimestampForTransaction___block_invoke;
  v6[3] = &unk_2648AEF88;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBKStoreClampsController *)self accessTransactionClampsWithBlock:v6];
}

void __55__SBKStoreClampsController_setTimestampForTransaction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a2;
  id v6 = [v3 date];
  id v5 = [*(id *)(a1 + 32) _keyForTransaction:*(void *)(a1 + 40)];
  [v4 setValue:v6 forKey:v5];
}

- (void)reset
{
  uint64_t v3 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22B807000, v3, OS_LOG_TYPE_DEFAULT, "Reseting Clamps", v4, 2u);
  }

  [(SBKStoreClampsController *)self accessTransactionClampsWithBlock:&__block_literal_global_52];
  [(SBKStoreClampsController *)self clearAccountIdentifierCheckTimestamp];
  [(SBKStoreClampsController *)self clearAuthenticationRequest];
  [(SBKStoreClampsController *)self clearBackOff];
  [(SBKStoreClampsController *)self clearNetworkingBlocked];
  [(SBKStoreClampsController *)self clearUserAcceptedSyncTimestamp];
  [(SBKStoreClampsController *)self clearUserCancelledSignIn];
  [(SBKStoreClampsController *)self saveToUserDefaults];
}

uint64_t __33__SBKStoreClampsController_reset__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

- (BOOL)canScheduleTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(SBKStoreClampsController *)self _canScheduleTransactionBasedOfNetworkingBlocked:v6 error:a4]&& [(SBKStoreClampsController *)self _canScheduleTransactionBasedOnBackOff:v6 error:a4]&& [(SBKStoreClampsController *)self _canScheduleTransactionBasedOnUserCancelledSignIn:v6 error:a4]&& [(SBKStoreClampsController *)self _canScheduleTransactionBasedOnAccountIdentifierCheck:v6 error:a4]
    && [(SBKStoreClampsController *)self _canScheduleTransactionBasedOnType:v6 error:a4];

  return v7;
}

- (void)accessTransactionClampsWithBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__SBKStoreClampsController_accessTransactionClampsWithBlock___block_invoke;
  v7[3] = &unk_2648AF858;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __61__SBKStoreClampsController_accessTransactionClampsWithBlock___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) transactionClamps];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v4)
    {
      uint64_t v2 = [v4 mutableCopy];

      id v3 = (id)v2;
    }
    else
    {
      id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    id v4 = v3;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v3);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)saveToUserDefaults
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SBKStoreClampsController_saveToUserDefaults__block_invoke;
  block[3] = &unk_2648AF7F8;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v8 + 24))
  {
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __46__SBKStoreClampsController_saveToUserDefaults__block_invoke_49;
    v5[3] = &unk_2648AF920;
    v5[4] = self;
    dispatch_after(v4, MEMORY[0x263EF83A0], v5);
  }
  _Block_object_dispose(&v7, 8);
}

void __46__SBKStoreClampsController_saveToUserDefaults__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) pendingUserDefaultArchivedData];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 == 0;

  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = 0;
  dispatch_time_t v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v8];
  id v5 = v8;
  [*(id *)(a1 + 32) setPendingUserDefaultArchivedData:v4];

  if (v5)
  {
    if (os_variant_has_internal_content())
    {
      id v6 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[SBKStoreClampsController saveToUserDefaults]_block_invoke"];
      [v6 handleFailureInFunction:v7, @"SBKStoreClampsController.m", 149, @"Archiving SBKStoreClampsController resulted in error:%@", v5 file lineNumber description];
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_error_impl(&dword_22B807000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Archiving SBKStoreClampsController resulted in error:%@", buf, 0xCu);
    }
  }
}

void __46__SBKStoreClampsController_saveToUserDefaults__block_invoke_49(uint64_t a1)
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy_;
  uint64_t v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 8);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__SBKStoreClampsController_saveToUserDefaults__block_invoke_50;
  v4[3] = &unk_2648AF7F8;
  v4[4] = v1;
  v4[5] = &v5;
  dispatch_sync(v2, v4);
  uint64_t v3 = +[SBKPreferences storeBookkeeperPreferences];
  [v3 setObject:v6[5] forKey:@"SBKSyncClamps"];

  _Block_object_dispose(&v5, 8);
}

uint64_t __46__SBKStoreClampsController_saveToUserDefaults__block_invoke_50(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pendingUserDefaultArchivedData];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_time_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 setPendingUserDefaultArchivedData:0];
}

- (SBKStoreClampsController)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBKStoreClampsController *)self init];
  if (!v5)
  {
LABEL_7:
    id v6 = v5;
    goto LABEL_8;
  }
  if (![v4 decodeIntegerForKey:@"SBKVersion"])
  {
    uint64_t v7 = [v4 decodePropertyListForKey:@"SBKTransactionClamps"];
    id v8 = (void *)[v7 mutableCopy];

    if (v8)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __42__SBKStoreClampsController_initWithCoder___block_invoke;
      v15[3] = &unk_2648AEF40;
      id v16 = v8;
      [(SBKStoreClampsController *)v5 accessTransactionClampsWithBlock:v15];
    }
    [v4 decodeDoubleForKey:@"SBAccountIdentifierCheckTimestamp"];
    v5->_accountIdentifierCheckTimestamp = v9;
    [v4 decodeDoubleForKey:@"SBKAuthenticationNeededTimestamp"];
    v5->_authenticationNeededTimestamp = v10;
    [v4 decodeDoubleForKey:@"SBKUserAcceptedSyncTimestamp"];
    v5->_userAcceptedSyncTimestamp = v11;
    [v4 decodeDoubleForKey:@"SBKNetworkingBlockedUntil"];
    v5->_networkingBlockedUntil = v12;
    [v4 decodeDoubleForKey:@"SBKUserCancelledSignInBackOffUntil"];
    v5->_double userCancelledSignInBackOffUntil = v13;

    goto LABEL_7;
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

void __42__SBKStoreClampsController_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 removeAllObjects];
  [v3 setValuesForKeysWithDictionary:*(void *)(a1 + 32)];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  transactionClamps = self->_transactionClamps;
  id v6 = v4;
  if (transactionClamps)
  {
    [v4 encodeObject:transactionClamps forKey:@"SBKTransactionClamps"];
    id v4 = v6;
  }
  if (fabs(self->_accountIdentifierCheckTimestamp) > 0.00000011920929)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", @"SBAccountIdentifierCheckTimestamp");
    id v4 = v6;
  }
  if (fabs(self->_authenticationNeededTimestamp) > 0.00000011920929)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", @"SBKAuthenticationNeededTimestamp");
    id v4 = v6;
  }
  if (fabs(self->_userAcceptedSyncTimestamp) > 0.00000011920929)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", @"SBKUserAcceptedSyncTimestamp");
    id v4 = v6;
  }
  if (fabs(self->_networkingBlockedUntil) > 0.00000011920929)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", @"SBKNetworkingBlockedUntil");
    id v4 = v6;
  }
  if (fabs(self->_userCancelledSignInBackOffUntil) > 0.00000011920929)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", @"SBKUserCancelledSignInBackOffUntil");
    id v4 = v6;
  }
  [v4 encodeInteger:2 forKey:@"Version"];
}

- (id)description
{
  id v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)SBKStoreClampsController;
  id v4 = [(SBKStoreClampsController *)&v14 description];
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  id v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:self->_accountIdentifierCheckTimestamp];
  uint64_t v7 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:self->_authenticationNeededTimestamp];
  id v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:self->_userAcceptedSyncTimestamp];
  double v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:self->_networkingBlockedUntil];
  double v10 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:self->_backOffUntil];
  double v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:self->_userCancelledSignInBackOffUntil];
  double v12 = [v3 stringWithFormat:@"%@\n\tCurrent Date = %@,\n\taccountIdentifierCheckTimestamp = %@,\n\tauthenticationNeededTimestamp = %@,\n\tuserAcceptedSyncTimestamp = %@,\n\tnetworkingBlockedUntil = %@,\n\tbackOffUntil= %@,\n\tuserCancelledSignInBackOffUntil = %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (SBKStoreClampsController)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBKStoreClampsController;
  uint64_t v2 = [(SBKStoreClampsController *)&v8 init];
  if (v2)
  {
    id v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    transactionClamps = v2->_transactionClamps;
    v2->_transactionClamps = v3;

    v2->_nextUserCancelBackOffInterval = 300.0;
    dispatch_queue_t v5 = dispatch_queue_create(0, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sharedClampsController
{
  if (sharedClampsController_onceToken != -1) {
    dispatch_once(&sharedClampsController_onceToken, &__block_literal_global);
  }
  uint64_t v2 = (void *)sharedClampsController_sharedInstance;
  return v2;
}

void __50__SBKStoreClampsController_sharedClampsController__block_invoke()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v0 = +[SBKPreferences storeBookkeeperPreferences];
  uint64_t v1 = [v0 objectForKey:@"SBKSyncClamps" withDefaultValue:0];

  if (v1)
  {
    id v9 = 0;
    uint64_t v2 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v1 error:&v9];
    id v3 = v9;
    id v4 = (void *)sharedClampsController_sharedInstance;
    sharedClampsController_sharedInstance = v2;

    if (v3)
    {
      if (os_variant_has_internal_content())
      {
        dispatch_queue_t v5 = [MEMORY[0x263F08690] currentHandler];
        id v6 = [NSString stringWithUTF8String:"+[SBKStoreClampsController sharedClampsController]_block_invoke"];
        [v5 handleFailureInFunction:v6, @"SBKStoreClampsController.m", 65, @"Unarchiving SBKStoreClampsController resulted in error:%@", v3 file lineNumber description];
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v3;
        _os_log_error_impl(&dword_22B807000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unarchiving SBKStoreClampsController resulted in error:%@", buf, 0xCu);
      }
    }
  }
  if (!sharedClampsController_sharedInstance)
  {
    uint64_t v7 = objc_alloc_init(SBKStoreClampsController);
    objc_super v8 = (void *)sharedClampsController_sharedInstance;
    sharedClampsController_sharedInstance = (uint64_t)v7;
  }
}

@end