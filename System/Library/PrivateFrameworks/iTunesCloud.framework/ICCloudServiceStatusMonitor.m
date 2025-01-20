@interface ICCloudServiceStatusMonitor
+ (BOOL)_hasEntitlementForStatusAccessExemptedFromUserConsentRequirement;
- (BOOL)_locked_isObservingCloudServiceStatus;
- (BOOL)isObservingCloudServiceStatus;
- (ICCloudServiceStatusMonitor)init;
- (id)_cloudServiceStatusMonitorConnectionForTransactionIdentifier:(id)a3 error:(id *)a4;
- (int64_t)authorizationStatusForScopes:(int64_t)a3;
- (int64_t)privacyAcknowledgementPolicy;
- (void)_beginObservingCloudServiceStatus;
- (void)_beginTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:(id)a3;
- (void)_cancelCloudServerLaunchedNotifyToken;
- (void)_cloudServiceStatusMonitorConnectionWasInterrupted;
- (void)_cloudServiceStatusMonitorConnectionWasInvalidated;
- (void)_didBeginObservingCloudServiceStatusWithToken:(id)a3 transactionIdentifier:(id)a4;
- (void)_didEndObservingCloudServiceStatusWithToken:(id)a3 transactionIdentifier:(id)a4;
- (void)_didEndRequestingTokenWithTransactionIdentifier:(id)a3;
- (void)_endObservingCloudServiceStatusWithToken:(id)a3;
- (void)_endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:(id)a3;
- (void)_invalidateCloudServerLaunchTimeoutTimer;
- (void)_invalidateTriggersForCloudServiceStatusObservationRecovery;
- (void)_performCloudServiceStatusMonitorRequestWithDescription:(id)a3 requestHandler:(id)a4 errorHandler:(id)a5;
- (void)_recoverObservingCloudServiceStatus;
- (void)_refreshCloudServiceStatus;
- (void)_registerCloudServerLaunchedNotifyToken;
- (void)_requestCapabilitiesWithPrivacyPromptPolicy:(id)a3 completionHandler:(id)a4;
- (void)_requestCapabilitiesWithPrivacyPromptPolicy:(int64_t)a3 requestCapabilitiesWithCompletionHandler:(id)a4;
- (void)_requestStorefrontCountryCodeWithCompletionHandler:(id)a3;
- (void)_requestStorefrontIdentifierWithCompletionHandler:(id)a3;
- (void)_resetCloudServiceStatusMonitorConnectionAllowingExplicitInvalidation:(BOOL)a3;
- (void)_scheduleCloudServerLaunchTimeoutTimer;
- (void)_scheduleTriggersForCloudServiceStatusObservationRecovery;
- (void)_updateWithCapabilities:(unint64_t)a3 hasValidCapabilities:(BOOL)a4 transactionIdentifier:(id)a5;
- (void)_updateWithStorefrontCountryCode:(id)a3 transactionIdentifier:(id)a4;
- (void)_updateWithStorefrontIdentifier:(id)a3 transactionIdentifier:(id)a4;
- (void)_validateAuthorizationExpiryWithCompletionHandler:(id)a3;
- (void)activeAccountDidChange;
- (void)beginObservingCloudServiceStatus;
- (void)capabilitiesDidChange:(unint64_t)a3;
- (void)dealloc;
- (void)endObservingCloudServiceStatus;
- (void)requestAuthorizationForScopes:(int64_t)a3 completionHandler:(id)a4;
- (void)requestCapabilitiesWithCompletionHandler:(id)a3;
- (void)requestCapabilitiesWithPrivacyPromptPolicy:(int64_t)a3 completionHandler:(id)a4;
- (void)requestDeveloperTokenWithOptions:(unint64_t)a3 completionHandler:(id)a4;
- (void)requestMusicKitTokensWithOptions:(unint64_t)a3 completionHandler:(id)a4;
- (void)requestStorefrontCountryCodeWithCompletionHandler:(id)a3;
- (void)requestStorefrontIdentifierWithCompletionHandler:(id)a3;
- (void)requestUserTokenForDeveloperToken:(id)a3 completionHandler:(id)a4;
- (void)requestUserTokenForDeveloperToken:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)revokeMusicKitUserTokensForAccountDSID:(id)a3 withCompletion:(id)a4;
- (void)setPrivacyAcknowledgementPolicy:(int64_t)a3;
- (void)storefrontCountryCodeDidChange:(id)a3;
- (void)storefrontIdentifierDidChange:(id)a3;
@end

@implementation ICCloudServiceStatusMonitor

- (int64_t)authorizationStatusForScopes:(int64_t)a3
{
  if ((a3 & 2) == 0
    && ([(id)objc_opt_class() _hasEntitlementForStatusAccessExemptedFromUserConsentRequirement] & 1) != 0)
  {
    return 3;
  }
  int v3 = TCCAccessPreflight();
  if (v3 == 2) {
    return 0;
  }
  if (!v3) {
    return 3;
  }
  if (TCCAccessRestricted()) {
    return 2;
  }
  else {
    return 1;
  }
}

- (ICCloudServiceStatusMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICCloudServiceStatusMonitor;
  v2 = [(ICCloudServiceStatusMonitor *)&v8 init];
  if (v2)
  {
    int v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeTransactionIdentifiersForCloudServiceStatusMonitorConnection = v2->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection;
    v2->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection = v3;

    v2->_cloudServerLaunchedNotifyToken = -1;
    v5 = objc_alloc_init(ICCloudServerListenerEndpointProvider);
    listenerEndpointProvider = v2->_listenerEndpointProvider;
    v2->_listenerEndpointProvider = v5;

    v2->_privacyAcknowledgementPolicy = 1;
    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

void __98__ICCloudServiceStatusMonitor__cloudServiceStatusMonitorConnectionForTransactionIdentifier_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cloudServiceStatusMonitorConnectionWasInvalidated];
}

- (void)_cloudServiceStatusMonitorConnectionWasInvalidated
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud service status monitor connection was invalidated.", (uint8_t *)&v5, 0xCu);
  }

  os_unfair_lock_lock(p_lock);
  [(ICCloudServiceStatusMonitor *)self _resetCloudServiceStatusMonitorConnectionAllowingExplicitInvalidation:0];
  os_unfair_lock_unlock(p_lock);
}

void __82__ICCloudServiceStatusMonitor__requestStorefrontCountryCodeWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7) {
    [*(id *)(a1 + 32) _updateWithStorefrontCountryCode:v7 transactionIdentifier:*(void *)(a1 + 40)];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

- (void)_updateWithStorefrontCountryCode:(id)a3 transactionIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (NSString *)a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (![(ICCloudServiceStatusMonitor *)self _locked_isObservingCloudServiceStatus])
  {
LABEL_4:
    BOOL v10 = 0;
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  objc_super v8 = self->_storefrontCountryCode;
  storefrontCountryCode = v6;
  BOOL v10 = v8 != v6;
  if (v8 != v6)
  {
    v11 = v8;
    char v12 = [(NSString *)v8 isEqual:v6];

    if (v12) {
      goto LABEL_4;
    }
    v15 = (NSString *)[(NSString *)v6 copy];
    storefrontCountryCode = self->_storefrontCountryCode;
    self->_storefrontCountryCode = v15;
  }

  if (v7) {
LABEL_5:
  }
    [(ICCloudServiceStatusMonitor *)self _endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:v7];
LABEL_6:
  os_unfair_lock_unlock(&self->_lock);
  if (v10)
  {
    v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543874;
      v17 = self;
      __int16 v18 = 2114;
      v19 = v6;
      __int16 v20 = 2114;
      v21 = @"ICCloudServiceStatusStorefrontCountryCodeDidChangeNotification";
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Storefront country code did change: \"%{public}@\". Posting %{public}@.", (uint8_t *)&v16, 0x20u);
    }

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:@"ICCloudServiceStatusStorefrontCountryCodeDidChangeNotification" object:self];
  }
}

- (void)_resetCloudServiceStatusMonitorConnectionAllowingExplicitInvalidation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  cloudServiceStatusMonitorConnection = self->_cloudServiceStatusMonitorConnection;
  if (cloudServiceStatusMonitorConnection)
  {
    if (v3)
    {
      [(NSXPCConnection *)cloudServiceStatusMonitorConnection invalidate];
      uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138543362;
        v13 = self;
        _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Did invalidate cloud service status monitor connection.", (uint8_t *)&v12, 0xCu);
      }

      cloudServiceStatusMonitorConnection = self->_cloudServiceStatusMonitorConnection;
    }
    self->_cloudServiceStatusMonitorConnection = 0;

    id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      v13 = self;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Did reset cloud service status monitor connection.", (uint8_t *)&v12, 0xCu);
    }
  }
  objc_super v8 = self->_observationToken;
  observationToken = self->_observationToken;
  self->_observationToken = 0;

  transactionIdentifierForActiveObservationToken = self->_transactionIdentifierForActiveObservationToken;
  self->_transactionIdentifierForActiveObservationToken = 0;

  [(NSMutableSet *)self->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection removeAllObjects];
  if ([(ICCloudServiceStatusMonitor *)self _locked_isObservingCloudServiceStatus])
  {
    v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Was previously observing cloud service status with token: %{public}@. Scheduling appropriate triggers to request begin observing cloud service status again.", (uint8_t *)&v12, 0x16u);
    }

    [(ICCloudServiceStatusMonitor *)self _scheduleTriggersForCloudServiceStatusObservationRecovery];
  }
}

- (BOOL)_locked_isObservingCloudServiceStatus
{
  return self->_observingCloudServiceStatusRequestsCount != 0;
}

- (void)_endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ([(NSMutableSet *)self->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection containsObject:v4])
  {
    [(NSMutableSet *)self->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection removeObject:v4];
    id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(NSMutableSet *)self->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection count];
      int v9 = 138543874;
      BOOL v10 = self;
      __int16 v11 = 2114;
      id v12 = v4;
      __int16 v13 = 2048;
      uint64_t v14 = v6;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Ended transaction with identifier %{public}@ for cloud service status monitor connection; updated nu"
        "mber of active transactions: %lu.",
        (uint8_t *)&v9,
        0x20u);
    }

    if (![(NSMutableSet *)self->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection count])
    {
      id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        BOOL v10 = self;
        _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: About to invalidate cloud service status monitor connection.", (uint8_t *)&v9, 0xCu);
      }

      [(ICCloudServiceStatusMonitor *)self _resetCloudServiceStatusMonitorConnectionAllowingExplicitInvalidation:1];
    }
  }
  else
  {
    objc_super v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543618;
      BOOL v10 = self;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Attempted to end transaction with unknown transaction identifier for cloud service status monitor connection: %{public}@. Ignoring.", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)requestStorefrontCountryCodeWithCompletionHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = (void (**)(id, NSString *, void))a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = self->_storefrontCountryCode;
  os_unfair_lock_unlock(p_lock);
  if (v6) {
    v5[2](v5, v6, 0);
  }
  else {
    [(ICCloudServiceStatusMonitor *)self _requestStorefrontCountryCodeWithCompletionHandler:v5];
  }
}

- (void)_requestStorefrontCountryCodeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__ICCloudServiceStatusMonitor__requestStorefrontCountryCodeWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5ACAA60;
  v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__ICCloudServiceStatusMonitor__requestStorefrontCountryCodeWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_1E5ACAC90;
  id v7 = v9;
  id v5 = v9;
  [(ICCloudServiceStatusMonitor *)self _performCloudServiceStatusMonitorRequestWithDescription:@"storefront country code" requestHandler:v8 errorHandler:v6];
}

- (void)_performCloudServiceStatusMonitorRequestWithDescription:(id)a3 requestHandler:(id)a4 errorHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *, id))a4;
  id v10 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  __int16 v11 = NSString;
  id v12 = [v8 stringByReplacingOccurrencesOfString:@" " withString:@"-"];
  __int16 v13 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v14 = [v13 UUIDString];
  uint64_t v15 = [v11 stringWithFormat:@"request-%@-%@", v12, v14];

  id v27 = 0;
  uint64_t v16 = [(ICCloudServiceStatusMonitor *)self _cloudServiceStatusMonitorConnectionForTransactionIdentifier:v15 error:&v27];
  id v17 = v27;
  if (v16)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __115__ICCloudServiceStatusMonitor__performCloudServiceStatusMonitorRequestWithDescription_requestHandler_errorHandler___block_invoke;
    v23[3] = &unk_1E5ACB550;
    v23[4] = self;
    id v18 = v15;
    id v24 = v18;
    id v25 = v8;
    id v26 = v10;
    v19 = [v16 remoteObjectProxyWithErrorHandler:v23];
    v9[2](v9, v19, v18);
  }
  else
  {
    __int16 v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = [v17 debugDescription];
      uint64_t v22 = objc_msgSend(v17, "msv_underlyingError");
      *(_DWORD *)buf = 138544130;
      v29 = self;
      __int16 v30 = 2114;
      id v31 = v8;
      __int16 v32 = 2114;
      v33 = v21;
      __int16 v34 = 2114;
      v35 = v22;
      _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Encountered error while requesting %{public}@. %{public}@ Underlying error: %{public}@.", buf, 0x2Au);
    }
    if (v10) {
      (*((void (**)(id, id))v10 + 2))(v10, v17);
    }
  }
}

void __82__ICCloudServiceStatusMonitor__requestStorefrontCountryCodeWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__ICCloudServiceStatusMonitor__requestStorefrontCountryCodeWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E5ACD0B0;
  uint64_t v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  [a2 requestStorefrontCountryCodeWithCompletionHandler:v8];
}

- (id)_cloudServiceStatusMonitorConnectionForTransactionIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  cloudServiceStatusMonitorConnection = self->_cloudServiceStatusMonitorConnection;
  if (!cloudServiceStatusMonitorConnection)
  {
    listenerEndpointProvider = self->_listenerEndpointProvider;
    id v33 = 0;
    id v9 = [(ICCloudServerListenerEndpointProvider *)listenerEndpointProvider listenerEndpointForService:4 error:&v33];
    id v10 = v33;
    if (v9)
    {
      __int16 v11 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v9];
      id v12 = self->_cloudServiceStatusMonitorConnection;
      self->_cloudServiceStatusMonitorConnection = v11;

      [(NSXPCConnection *)self->_cloudServiceStatusMonitorConnection setExportedObject:self];
      __int16 v13 = self->_cloudServiceStatusMonitorConnection;
      uint64_t v14 = +[ICCloudServiceStatusRemoteMonitoring clientInterface];
      [(NSXPCConnection *)v13 setExportedInterface:v14];

      uint64_t v15 = self->_cloudServiceStatusMonitorConnection;
      uint64_t v16 = +[ICCloudServiceStatusRemoteMonitoring serviceInterface];
      [(NSXPCConnection *)v15 setRemoteObjectInterface:v16];

      objc_initWeak(&location, self);
      id v17 = self->_cloudServiceStatusMonitorConnection;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __98__ICCloudServiceStatusMonitor__cloudServiceStatusMonitorConnectionForTransactionIdentifier_error___block_invoke;
      v30[3] = &unk_1E5ACD778;
      objc_copyWeak(&v31, &location);
      [(NSXPCConnection *)v17 setInterruptionHandler:v30];
      id v18 = self->_cloudServiceStatusMonitorConnection;
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      id v27 = __98__ICCloudServiceStatusMonitor__cloudServiceStatusMonitorConnectionForTransactionIdentifier_error___block_invoke_2;
      v28 = &unk_1E5ACD778;
      objc_copyWeak(&v29, &location);
      [(NSXPCConnection *)v18 setInvalidationHandler:&v25];
      [(NSXPCConnection *)self->_cloudServiceStatusMonitorConnection resume];
      cloudServiceStatusMonitorConnectionEstablishmentError = self->_cloudServiceStatusMonitorConnectionEstablishmentError;
      self->_cloudServiceStatusMonitorConnectionEstablishmentError = 0;

      objc_destroyWeak(&v29);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -7010, v10, @"Failed to get listener endpoint for cloud service status monitor.");
      __int16 v20 = (NSError *)objc_claimAutoreleasedReturnValue();
      v21 = self->_cloudServiceStatusMonitorConnectionEstablishmentError;
      self->_cloudServiceStatusMonitorConnectionEstablishmentError = v20;
    }
    cloudServiceStatusMonitorConnection = self->_cloudServiceStatusMonitorConnection;
  }
  uint64_t v22 = cloudServiceStatusMonitorConnection;
  v23 = self->_cloudServiceStatusMonitorConnectionEstablishmentError;
  if (v6 && v22) {
    [(ICCloudServiceStatusMonitor *)self _beginTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:v6];
  }
  os_unfair_lock_unlock(&self->_lock);
  if (a4) {
    *a4 = v23;
  }

  return v22;
}

- (void)_beginTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ([(NSMutableSet *)self->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection containsObject:v5])
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICCloudServiceStatusMonitor.m" lineNumber:557 description:@"Calling -_beginTransactionForCloudServiceStatusMonitorConnectionWithIdentifier: with the same transaction identifier more than once is invalid."];
  }
  [(NSMutableSet *)self->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection addObject:v5];
  id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(NSMutableSet *)self->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection count];
    int v9 = 138543874;
    id v10 = self;
    __int16 v11 = 2114;
    id v12 = v5;
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Began transaction with identifier %{public}@ for cloud service status monitor connection; updated numb"
      "er of active transactions: %lu.",
      (uint8_t *)&v9,
      0x20u);
  }
}

- (void)setPrivacyAcknowledgementPolicy:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  self->_privacyAcknowledgementPolicy = a3;
  os_unfair_lock_unlock(p_lock);
  id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"prompt-allowed";
    if (a3 != 1) {
      uint64_t v7 = 0;
    }
    if (!a3) {
      uint64_t v7 = @"prompt-prohibited";
    }
    int v8 = 138543618;
    int v9 = self;
    __int16 v10 = 2114;
    __int16 v11 = v7;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud service status monitor was configured with privacy acknowledgement policy: %{public}@.", (uint8_t *)&v8, 0x16u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokensCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_userTokenCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_developerTokenCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_storefrontCountryCode, 0);
  objc_storeStrong((id *)&self->_cloudServerLaunchTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_transactionIdentifierForActiveObservationToken, 0);
  objc_storeStrong((id *)&self->_observationToken, 0);
  objc_storeStrong((id *)&self->_listenerEndpointProvider, 0);
  objc_storeStrong((id *)&self->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection, 0);
  objc_storeStrong((id *)&self->_cloudServiceStatusMonitorConnectionEstablishmentError, 0);

  objc_storeStrong((id *)&self->_cloudServiceStatusMonitorConnection, 0);
}

- (void)_invalidateTriggersForCloudServiceStatusObservationRecovery
{
  os_unfair_lock_assert_owner(&self->_lock);
  [(ICCloudServiceStatusMonitor *)self _invalidateCloudServerLaunchTimeoutTimer];

  [(ICCloudServiceStatusMonitor *)self _cancelCloudServerLaunchedNotifyToken];
}

- (void)_scheduleTriggersForCloudServiceStatusObservationRecovery
{
  os_unfair_lock_assert_owner(&self->_lock);
  [(ICCloudServiceStatusMonitor *)self _registerCloudServerLaunchedNotifyToken];

  [(ICCloudServiceStatusMonitor *)self _scheduleCloudServerLaunchTimeoutTimer];
}

- (void)_refreshCloudServiceStatus
{
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(ICCloudServiceStatusMonitor *)self _requestCapabilitiesWithPrivacyPromptPolicy:0 requestCapabilitiesWithCompletionHandler:0];
  [(ICCloudServiceStatusMonitor *)self _requestStorefrontCountryCodeWithCompletionHandler:0];

  [(ICCloudServiceStatusMonitor *)self _requestStorefrontIdentifierWithCompletionHandler:0];
}

- (void)_recoverObservingCloudServiceStatus
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  [(ICCloudServiceStatusMonitor *)self _invalidateTriggersForCloudServiceStatusObservationRecovery];
  if ([(ICCloudServiceStatusMonitor *)self _locked_isObservingCloudServiceStatus])
  {
    observationToken = self->_observationToken;
    os_unfair_lock_unlock(p_lock);
    if (!observationToken)
    {
      id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138543362;
        uint64_t v7 = self;
        _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Missing cloud service status observation token despite the fact that the client asked to actively observe it.", (uint8_t *)&v6, 0xCu);
      }

      [(ICCloudServiceStatusMonitor *)self _beginObservingCloudServiceStatus];
      [(ICCloudServiceStatusMonitor *)self _refreshCloudServiceStatus];
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_invalidateCloudServerLaunchTimeoutTimer
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  cloudServerLaunchTimeoutTimer = self->_cloudServerLaunchTimeoutTimer;
  if (cloudServerLaunchTimeoutTimer)
  {
    dispatch_source_cancel(cloudServerLaunchTimeoutTimer);
    id v4 = self->_cloudServerLaunchTimeoutTimer;
    self->_cloudServerLaunchTimeoutTimer = 0;

    id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      uint64_t v7 = self;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidated timeout timer for cloud server launch.", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_scheduleCloudServerLaunchTimeoutTimer
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  [(ICCloudServiceStatusMonitor *)self _invalidateCloudServerLaunchTimeoutTimer];
  BOOL v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v13 = self;
    __int16 v14 = 2048;
    uint64_t v15 = 0x403E000000000000;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Scheduling timeout timer for cloud server launch for %.1f seconds.", buf, 0x16u);
  }

  id v4 = dispatch_get_global_queue(0, 0);
  id v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
  cloudServerLaunchTimeoutTimer = self->_cloudServerLaunchTimeoutTimer;
  self->_cloudServerLaunchTimeoutTimer = v5;

  uint64_t v7 = self->_cloudServerLaunchTimeoutTimer;
  dispatch_time_t v8 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak((id *)buf, self);
  int v9 = self->_cloudServerLaunchTimeoutTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __69__ICCloudServiceStatusMonitor__scheduleCloudServerLaunchTimeoutTimer__block_invoke;
  handler[3] = &unk_1E5ACD778;
  objc_copyWeak(&v11, (id *)buf);
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume((dispatch_object_t)self->_cloudServerLaunchTimeoutTimer);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __69__ICCloudServiceStatusMonitor__scheduleCloudServerLaunchTimeoutTimer__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138543362;
      id v4 = WeakRetained;
      _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud server launch timeout timer did fire.", (uint8_t *)&v3, 0xCu);
    }

    [WeakRetained _recoverObservingCloudServiceStatus];
  }
}

- (void)_cancelCloudServerLaunchedNotifyToken
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  int cloudServerLaunchedNotifyToken = self->_cloudServerLaunchedNotifyToken;
  if (cloudServerLaunchedNotifyToken != -1)
  {
    uint32_t v4 = notify_cancel(cloudServerLaunchedNotifyToken);
    uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    int v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138543874;
        uint64_t v12 = self;
        __int16 v13 = 2082;
        __int16 v14 = "com.apple.itunescloudd.launched";
        __int16 v15 = 2048;
        uint64_t v16 = v4;
        uint64_t v7 = "%{public}@: Failed to cancel notify token for notify topic named \"%{public}s\"; notifyCancelStatus = %lu.";
        dispatch_time_t v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_ERROR;
        uint32_t v10 = 32;
LABEL_7:
        _os_log_impl(&dword_1A2D01000, v8, v9, v7, (uint8_t *)&v11, v10);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      uint64_t v12 = self;
      __int16 v13 = 2082;
      __int16 v14 = "com.apple.itunescloudd.launched";
      uint64_t v7 = "%{public}@: Successfully cancelled notify token for notify topic named \"%{public}s\".";
      dispatch_time_t v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      uint32_t v10 = 22;
      goto LABEL_7;
    }

    self->_int cloudServerLaunchedNotifyToken = -1;
  }
}

- (void)_registerCloudServerLaunchedNotifyToken
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_cloudServerLaunchedNotifyToken == -1)
  {
    objc_initWeak(&location, self);
    self->_int cloudServerLaunchedNotifyToken = -1;
    int v3 = dispatch_get_global_queue(0, 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__ICCloudServiceStatusMonitor__registerCloudServerLaunchedNotifyToken__block_invoke;
    v11[3] = &unk_1E5ACC2F0;
    objc_copyWeak(&v12, &location);
    uint32_t v4 = notify_register_dispatch("com.apple.itunescloudd.launched", &self->_cloudServerLaunchedNotifyToken, v3, v11);

    uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    int v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        __int16 v15 = self;
        __int16 v16 = 2082;
        uint64_t v17 = "com.apple.itunescloudd.launched";
        __int16 v18 = 2048;
        uint64_t v19 = v4;
        uint64_t v7 = "%{public}@: Failed to register notify token for notify topic named \"%{public}s\"; notifyRegisterDispatchStatus = %lu.";
        dispatch_time_t v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_ERROR;
        uint32_t v10 = 32;
LABEL_7:
        _os_log_impl(&dword_1A2D01000, v8, v9, v7, buf, v10);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v15 = self;
      __int16 v16 = 2082;
      uint64_t v17 = "com.apple.itunescloudd.launched";
      uint64_t v7 = "%{public}@: Successfully registered notify token for notify topic named \"%{public}s\".";
      dispatch_time_t v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      uint32_t v10 = 22;
      goto LABEL_7;
    }

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __70__ICCloudServiceStatusMonitor__registerCloudServerLaunchedNotifyToken__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138543618;
      id v4 = WeakRetained;
      __int16 v5 = 2082;
      int v6 = "com.apple.itunescloudd.launched";
      _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling \"%{public}s\" notification: cloud server did launch.", (uint8_t *)&v3, 0x16u);
    }

    [WeakRetained _recoverObservingCloudServiceStatus];
  }
}

- (void)_updateWithStorefrontIdentifier:(id)a3 transactionIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v6 = (NSString *)a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (![(ICCloudServiceStatusMonitor *)self _locked_isObservingCloudServiceStatus])
  {
LABEL_4:
    BOOL v10 = 0;
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  dispatch_time_t v8 = self->_storefrontIdentifier;
  storefrontIdentifier = v6;
  BOOL v10 = v8 != v6;
  if (v8 != v6)
  {
    int v11 = v8;
    char v12 = [(NSString *)v8 isEqual:v6];

    if (v12) {
      goto LABEL_4;
    }
    __int16 v15 = (NSString *)[(NSString *)v6 copy];
    storefrontIdentifier = self->_storefrontIdentifier;
    self->_storefrontIdentifier = v15;
  }

  if (v7) {
LABEL_5:
  }
    [(ICCloudServiceStatusMonitor *)self _endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:v7];
LABEL_6:
  os_unfair_lock_unlock(&self->_lock);
  if (v10)
  {
    __int16 v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543874;
      uint64_t v17 = self;
      __int16 v18 = 2114;
      uint64_t v19 = v6;
      __int16 v20 = 2112;
      v21 = @"ICCloudServiceStatusStorefrontIdentifierDidChangeNotification";
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Storefront identifier did change: \"%{public}@\". Posting %@.", (uint8_t *)&v16, 0x20u);
    }

    __int16 v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:@"ICCloudServiceStatusStorefrontIdentifierDidChangeNotification" object:self];
  }
}

- (void)_updateWithCapabilities:(unint64_t)a3 hasValidCapabilities:(BOOL)a4 transactionIdentifier:(id)a5
{
  BOOL v5 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (![(ICCloudServiceStatusMonitor *)self _locked_isObservingCloudServiceStatus])
  {
LABEL_5:
    BOOL v5 = 0;
    if (!v8) {
      goto LABEL_10;
    }
LABEL_9:
    [(ICCloudServiceStatusMonitor *)self _endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:v8];
    goto LABEL_10;
  }
  if (self->_capabilities != a3)
  {
    self->_capabilities = a3;
    self->_hasValidCapabilities = v5;
    BOOL v5 = 1;
LABEL_8:
    if (!v8) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (!v5) {
    goto LABEL_8;
  }
  if (self->_hasValidCapabilities) {
    goto LABEL_5;
  }
  BOOL v5 = 1;
  self->_hasValidCapabilities = 1;
  if (v8) {
    goto LABEL_9;
  }
LABEL_10:
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    os_log_type_t v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = ICCloudServiceCapabilitiesGetDescription(a3);
      int v12 = 138543874;
      __int16 v13 = self;
      __int16 v14 = 2114;
      __int16 v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = @"ICCloudServiceStatusCapabilitiesDidChangeNotification";
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud service capabilities did change: %{public}@. Posting %@.", (uint8_t *)&v12, 0x20u);
    }
    int v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"ICCloudServiceStatusCapabilitiesDidChangeNotification" object:self];
  }
}

- (void)_didEndRequestingTokenWithTransactionIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  [(ICCloudServiceStatusMonitor *)self _endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)_didEndObservingCloudServiceStatusWithToken:(id)a3 transactionIdentifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v6 = (NSUUID *)a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v8 = self->_observationToken;
  os_log_type_t v9 = self->_observationToken;
  if (v9 == v6)
  {
  }
  else
  {
    BOOL v10 = v9;
    int v11 = [(NSUUID *)v9 isEqual:v6];

    if (!v11)
    {
      [(ICCloudServiceStatusMonitor *)self _endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:v7];
      os_unfair_lock_unlock(&self->_lock);
      int v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138543874;
        v21 = self;
        __int16 v22 = 2114;
        v23 = v6;
        __int16 v24 = 2114;
        uint64_t v25 = v8;
        __int16 v13 = "%{public}@: Observation token %{public}@ did not match with active observation token %{public}@. Did not e"
              "nd observing cloud service status.";
        __int16 v14 = v12;
        uint32_t v15 = 32;
LABEL_8:
        _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v20, v15);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  observationToken = self->_observationToken;
  transactionIdentifierForActiveObservationToken = self->_transactionIdentifierForActiveObservationToken;
  self->_observationToken = 0;
  uint64_t v18 = transactionIdentifierForActiveObservationToken;

  uint64_t v19 = self->_transactionIdentifierForActiveObservationToken;
  self->_transactionIdentifierForActiveObservationToken = 0;

  [(ICCloudServiceStatusMonitor *)self _endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:v18];
  [(ICCloudServiceStatusMonitor *)self _endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:v7];
  os_unfair_lock_unlock(&self->_lock);
  int v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543618;
    v21 = self;
    __int16 v22 = 2114;
    v23 = v6;
    __int16 v13 = "%{public}@: Ended observing cloud service status with token: %{public}@.";
    __int16 v14 = v12;
    uint32_t v15 = 22;
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_endObservingCloudServiceStatusWithToken:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    int v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Ending observing cloud service status with token: %{public}@.", buf, 0x16u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ICCloudServiceStatusMonitor__endObservingCloudServiceStatusWithToken___block_invoke;
  v7[3] = &unk_1E5ACAAD8;
  id v8 = v4;
  os_log_type_t v9 = self;
  id v6 = v4;
  [(ICCloudServiceStatusMonitor *)self _performCloudServiceStatusMonitorRequestWithDescription:@"relinquishment of cloud service status observation token" requestHandler:v7 errorHandler:0];
}

void __72__ICCloudServiceStatusMonitor__endObservingCloudServiceStatusWithToken___block_invoke(int8x16_t *a1, void *a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__ICCloudServiceStatusMonitor__endObservingCloudServiceStatusWithToken___block_invoke_2;
  v9[3] = &unk_1E5ACD5C8;
  int8x16_t v8 = a1[2];
  id v6 = (id)v8.i64[0];
  int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
  id v11 = v5;
  id v7 = v5;
  [a2 endObservingCloudServiceStatusWithToken:v6 completionHandler:v9];
}

uint64_t __72__ICCloudServiceStatusMonitor__endObservingCloudServiceStatusWithToken___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didEndObservingCloudServiceStatusWithToken:*(void *)(a1 + 40) transactionIdentifier:*(void *)(a1 + 48)];
}

- (void)_didBeginObservingCloudServiceStatusWithToken:(id)a3 transactionIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if ([(ICCloudServiceStatusMonitor *)self _locked_isObservingCloudServiceStatus])
  {
    os_log_type_t v9 = [NSString stringWithFormat:@"ongoing-observation-of-cloud-service-status-%@", v7];
    objc_storeStrong((id *)&self->_observationToken, a3);
    transactionIdentifierForActiveObservationToken = self->_transactionIdentifierForActiveObservationToken;
    self->_transactionIdentifierForActiveObservationToken = v9;
    id v11 = v9;

    [(ICCloudServiceStatusMonitor *)self _beginTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:self->_transactionIdentifierForActiveObservationToken];
    [(ICCloudServiceStatusMonitor *)self _endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:v8];
    os_unfair_lock_unlock(&self->_lock);
    __int16 v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint32_t v15 = self;
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Began observing cloud service status with token: %{public}@.", buf, 0x16u);
    }
  }
  else
  {
    [(ICCloudServiceStatusMonitor *)self _endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:v8];
    os_unfair_lock_unlock(&self->_lock);
    id v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint32_t v15 = self;
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Began observing cloud service status with token: %{public}@, despite the fact that the client requested to end observing it. Immediately cancelling this.", buf, 0x16u);
    }

    [(ICCloudServiceStatusMonitor *)self _endObservingCloudServiceStatusWithToken:v7];
  }
}

- (void)_beginObservingCloudServiceStatus
{
  os_unfair_lock_assert_not_owner(&self->_lock);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__ICCloudServiceStatusMonitor__beginObservingCloudServiceStatus__block_invoke;
  v3[3] = &unk_1E5ACAAB0;
  v3[4] = self;
  [(ICCloudServiceStatusMonitor *)self _performCloudServiceStatusMonitorRequestWithDescription:@"cloud service status observation token" requestHandler:v3 errorHandler:0];
}

void __64__ICCloudServiceStatusMonitor__beginObservingCloudServiceStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__ICCloudServiceStatusMonitor__beginObservingCloudServiceStatus__block_invoke_2;
  v7[3] = &unk_1E5ACAA88;
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  [a2 beginObservingCloudServiceStatusWithCompletionHandler:v7];
}

uint64_t __64__ICCloudServiceStatusMonitor__beginObservingCloudServiceStatus__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _didBeginObservingCloudServiceStatusWithToken:a2 transactionIdentifier:*(void *)(a1 + 40)];
}

- (void)_requestStorefrontIdentifierWithCompletionHandler:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__ICCloudServiceStatusMonitor__requestStorefrontIdentifierWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5ACAA60;
  v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__ICCloudServiceStatusMonitor__requestStorefrontIdentifierWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_1E5ACAC90;
  id v7 = v9;
  id v5 = v9;
  [(ICCloudServiceStatusMonitor *)self _performCloudServiceStatusMonitorRequestWithDescription:@"storefront identifier" requestHandler:v8 errorHandler:v6];
}

void __81__ICCloudServiceStatusMonitor__requestStorefrontIdentifierWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__ICCloudServiceStatusMonitor__requestStorefrontIdentifierWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E5ACD0B0;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  [a2 requestStorefrontIdentifierWithCompletionHandler:v8];
}

uint64_t __81__ICCloudServiceStatusMonitor__requestStorefrontIdentifierWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __81__ICCloudServiceStatusMonitor__requestStorefrontIdentifierWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7) {
    [*(id *)(a1 + 32) _updateWithStorefrontIdentifier:v7 transactionIdentifier:*(void *)(a1 + 40)];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

uint64_t __82__ICCloudServiceStatusMonitor__requestStorefrontCountryCodeWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)_requestCapabilitiesWithPrivacyPromptPolicy:(int64_t)a3 requestCapabilitiesWithCompletionHandler:(id)a4
{
  id v6 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __116__ICCloudServiceStatusMonitor__requestCapabilitiesWithPrivacyPromptPolicy_requestCapabilitiesWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E5ACA8F8;
  int64_t v12 = a3;
  v10[4] = self;
  id v11 = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __116__ICCloudServiceStatusMonitor__requestCapabilitiesWithPrivacyPromptPolicy_requestCapabilitiesWithCompletionHandler___block_invoke_3;
  v8[3] = &unk_1E5ACAC90;
  id v9 = v11;
  id v7 = v11;
  [(ICCloudServiceStatusMonitor *)self _performCloudServiceStatusMonitorRequestWithDescription:@"cloud service capabilities" requestHandler:v10 errorHandler:v8];
}

void __116__ICCloudServiceStatusMonitor__requestCapabilitiesWithPrivacyPromptPolicy_requestCapabilitiesWithCompletionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __116__ICCloudServiceStatusMonitor__requestCapabilitiesWithPrivacyPromptPolicy_requestCapabilitiesWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E5ACAA38;
  id v6 = (void *)a1[5];
  uint64_t v7 = a1[6];
  void v9[4] = a1[4];
  id v10 = v5;
  id v11 = v6;
  id v8 = v5;
  [a2 requestCapabilitiesWithPrivacyPromptPolicy:v7 completionHandler:v9];
}

uint64_t __116__ICCloudServiceStatusMonitor__requestCapabilitiesWithPrivacyPromptPolicy_requestCapabilitiesWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __116__ICCloudServiceStatusMonitor__requestCapabilitiesWithPrivacyPromptPolicy_requestCapabilitiesWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(a1 + 32) _updateWithCapabilities:a2 hasValidCapabilities:v6 == 0 transactionIdentifier:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

- (void)_validateAuthorizationExpiryWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  if ([MEMORY[0x1E4F77990] hasEntitlement:*MEMORY[0x1E4FA9AA0] inGroup:@"com.apple.private.tcc.allow" shouldLogForMissingEntitlement:0])
  {
    v4[2](v4, 1);
  }
  else
  {
    if (_validateAuthorizationExpiryWithCompletionHandler__onceToken != -1) {
      dispatch_once(&_validateAuthorizationExpiryWithCompletionHandler__onceToken, &__block_literal_global_170);
    }
    uint64_t v5 = (void *)_validateAuthorizationExpiryWithCompletionHandler____accessPermissionsQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_2;
    v6[3] = &unk_1E5ACD2F0;
    void v6[4] = self;
    uint64_t v7 = v4;
    [v5 addOperationWithBlock:v6];
  }
}

void __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.itunescloudd.tcchelper" options:0];
  int v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF67B9C0];
  [v2 setRemoteObjectInterface:v3];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_3;
  v18[3] = &unk_1E5ACD750;
  v18[4] = *(void *)(a1 + 32);
  [v2 setInterruptionHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_175;
  v17[3] = &unk_1E5ACD750;
  v17[4] = *(void *)(a1 + 32);
  [v2 setInvalidationHandler:v17];
  [v2 resume];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_176;
  v15[3] = &unk_1E5ACD8E0;
  id v4 = *(void **)(a1 + 40);
  v15[4] = *(void *)(a1 + 32);
  id v16 = v4;
  uint64_t v5 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v15];
  id v6 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v7 = [v6 bundleIdentifier];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_178;
  v11[3] = &unk_1E5ACC6E8;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v12 = v2;
  uint64_t v13 = v8;
  id v14 = v9;
  id v10 = v2;
  [v5 validateExpirationForBundleIdentifier:v7 withReplyBlock:v11];
}

void __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543618;
    uint64_t v5 = v3;
    __int16 v6 = 2114;
    uint64_t v7 = @"com.apple.itunescloudd.tcchelper";
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection to %{public}@ service interrupted.", (uint8_t *)&v4, 0x16u);
  }
}

void __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_175(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543618;
    uint64_t v5 = v3;
    __int16 v6 = 2114;
    uint64_t v7 = @"com.apple.itunescloudd.tcchelper";
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection to %{public}@ service invalidated.", (uint8_t *)&v4, 0x16u);
  }
}

void __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_176(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543874;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = @"com.apple.itunescloudd.tcchelper";
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Connection to %{public}@ failed to get remote object proxy: %{public}@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_178(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *(id *)(a1 + 32);
  if (v4)
  {
    int v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v4;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to validate authorization expiry: %{public}@.", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [v5 invalidate];
}

uint64_t __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)_validateAuthorizationExpiryWithCompletionHandler____accessPermissionsQueue;
  _validateAuthorizationExpiryWithCompletionHandler____accessPermissionsQueue = (uint64_t)v0;

  [(id)_validateAuthorizationExpiryWithCompletionHandler____accessPermissionsQueue setMaxConcurrentOperationCount:1];
  v2 = (void *)_validateAuthorizationExpiryWithCompletionHandler____accessPermissionsQueue;

  return [v2 setName:@"com.apple.iTunesCloud.AccessPermissionHelper.operationQueue"];
}

- (void)requestAuthorizationForScopes:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  int64_t v8 = [(ICCloudServiceStatusMonitor *)self authorizationStatusForScopes:a3];
  if (v8 == 1)
  {
    if (v7) {
      v7[2](v7, 1);
    }
  }
  else
  {
    int64_t v9 = v8;
    if ((a3 & 2) != 0
      || ![(id)objc_opt_class() _hasEntitlementForStatusAccessExemptedFromUserConsentRequirement])
    {
      id v10 = objc_alloc(MEMORY[0x1E4F77968]);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __79__ICCloudServiceStatusMonitor_requestAuthorizationForScopes_completionHandler___block_invoke;
      v20[3] = &unk_1E5ACCD30;
      v20[4] = self;
      v20[5] = a2;
      id v11 = (void *)[v10 initWithDeallocHandler:v20];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __79__ICCloudServiceStatusMonitor_requestAuthorizationForScopes_completionHandler___block_invoke_2;
      v13[3] = &unk_1E5ACAA08;
      id v14 = v11;
      uint32_t v15 = self;
      id v16 = v7;
      SEL v17 = a2;
      int64_t v18 = a3;
      int64_t v19 = v9;
      id v12 = v11;
      [(ICCloudServiceStatusMonitor *)self _validateAuthorizationExpiryWithCompletionHandler:v13];
    }
    else if (v7)
    {
      v7[2](v7, 3);
    }
  }
}

void __79__ICCloudServiceStatusMonitor_requestAuthorizationForScopes_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28B00] currentHandler];
  [v2 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"ICCloudServiceStatusMonitor.m" lineNumber:778 description:@"-validatePermissionsExpiry…'s completion handler was not called."];
}

void __79__ICCloudServiceStatusMonitor_requestAuthorizationForScopes_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) disarm];
  if (a2)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F77968]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__ICCloudServiceStatusMonitor_requestAuthorizationForScopes_completionHandler___block_invoke_158;
    v12[3] = &unk_1E5ACCD30;
    uint64_t v5 = *(void *)(a1 + 56);
    v12[4] = *(void *)(a1 + 40);
    v12[5] = v5;
    int v6 = (void *)[v4 initWithDeallocHandler:v12];
    id v11 = *(id *)(a1 + 48);
    id v7 = v6;
    TCCAccessRequest();
  }
  else
  {
    int64_t v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Application has expired authorization, and couldn't be renewed.", buf, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 48);
    if (v10) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, 1);
    }
  }
}

void __79__ICCloudServiceStatusMonitor_requestAuthorizationForScopes_completionHandler___block_invoke_158(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28B00] currentHandler];
  [v2 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"ICCloudServiceStatusMonitor.m" lineNumber:790 description:@"TCCAccessRequest completion handler was not called."];
}

void __79__ICCloudServiceStatusMonitor_requestAuthorizationForScopes_completionHandler___block_invoke_2_162(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) disarm];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    if (a2)
    {
      uint64_t v5 = 3;
    }
    else
    {
      uint64_t v5 = [*(id *)(a1 + 40) authorizationStatusForScopes:*(void *)(a1 + 56)];
      uint64_t v4 = *(void *)(a1 + 48);
    }
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v5);
  }
  if (a2 && *(void *)(a1 + 64) != 3)
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"ICCloudServiceStatusAuthorizationWasGrantedNotification" object:*(void *)(a1 + 40)];
  }
}

void __115__ICCloudServiceStatusMonitor__performCloudServiceStatusMonitorRequestWithDescription_requestHandler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (const os_unfair_lock *)(*(void *)(a1 + 32) + 144);
  id v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 144));
  [*(id *)(a1 + 32) _endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 144));
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -7011, v4, @"Encountered error while requesting %@.", *(void *)(a1 + 48));

  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
  }
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = objc_msgSend(v5, "msv_description");
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@.", buf, 0x16u);
  }
}

- (void)_cloudServiceStatusMonitorConnectionWasInterrupted
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    uint64_t v6 = self;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud service status monitor connection was interrupted.", (uint8_t *)&v5, 0xCu);
  }

  os_unfair_lock_lock(p_lock);
  [(ICCloudServiceStatusMonitor *)self _resetCloudServiceStatusMonitorConnectionAllowingExplicitInvalidation:0];
  os_unfair_lock_unlock(p_lock);
}

void __98__ICCloudServiceStatusMonitor__cloudServiceStatusMonitorConnectionForTransactionIdentifier_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cloudServiceStatusMonitorConnectionWasInterrupted];
}

- (void)storefrontIdentifierDidChange:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  [(ICCloudServiceStatusMonitor *)self _updateWithStorefrontIdentifier:v5 transactionIdentifier:0];
}

- (void)storefrontCountryCodeDidChange:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  [(ICCloudServiceStatusMonitor *)self _updateWithStorefrontCountryCode:v5 transactionIdentifier:0];
}

- (void)capabilitiesDidChange:(unint64_t)a3
{
  os_unfair_lock_assert_not_owner(&self->_lock);

  [(ICCloudServiceStatusMonitor *)self _updateWithCapabilities:a3 hasValidCapabilities:1 transactionIdentifier:0];
}

- (void)activeAccountDidChange
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543618;
    uint64_t v6 = self;
    __int16 v7 = 2112;
    uint64_t v8 = @"ICCloudServiceStatusActiveAccountDidChangeNotification";
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Active account did change. Posting %@.", (uint8_t *)&v5, 0x16u);
  }

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"ICCloudServiceStatusActiveAccountDidChangeNotification" object:self];
}

- (void)revokeMusicKitUserTokensForAccountDSID:(id)a3 withCompletion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = self;
    __int16 v26 = 2114;
    id v27 = v6;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Revoking music user tokens DSID %{public}@", buf, 0x16u);
  }

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.itunescloudd.tcchelper" options:0];
  uint64_t v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF67B9C0];
  [v9 setRemoteObjectInterface:v10];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __85__ICCloudServiceStatusMonitor_revokeMusicKitUserTokensForAccountDSID_withCompletion___block_invoke;
  v23[3] = &unk_1E5ACD750;
  v23[4] = self;
  [v9 setInterruptionHandler:v23];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __85__ICCloudServiceStatusMonitor_revokeMusicKitUserTokensForAccountDSID_withCompletion___block_invoke_123;
  v22[3] = &unk_1E5ACD750;
  v22[4] = self;
  [v9 setInvalidationHandler:v22];
  [v9 resume];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __85__ICCloudServiceStatusMonitor_revokeMusicKitUserTokensForAccountDSID_withCompletion___block_invoke_124;
  v20[3] = &unk_1E5ACD8E0;
  v20[4] = self;
  id v11 = v7;
  id v21 = v11;
  __int16 v12 = [v9 remoteObjectProxyWithErrorHandler:v20];
  if (v6) {
    +[ICUserIdentity specificAccountWithDSID:v6];
  }
  else {
  uint64_t v13 = +[ICUserIdentity activeAccount];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__ICCloudServiceStatusMonitor_revokeMusicKitUserTokensForAccountDSID_withCompletion___block_invoke_126;
  v16[3] = &unk_1E5ACB578;
  id v17 = v9;
  int64_t v18 = self;
  id v19 = v11;
  id v14 = v11;
  id v15 = v9;
  [v12 revokeMusicKitUserTokensForUserIdentity:v13 withCompletion:v16];
}

void __85__ICCloudServiceStatusMonitor_revokeMusicKitUserTokensForAccountDSID_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543618;
    uint64_t v5 = v3;
    __int16 v6 = 2114;
    id v7 = @"com.apple.itunescloudd.tcchelper";
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection to %{public}@ service interrupted.", (uint8_t *)&v4, 0x16u);
  }
}

void __85__ICCloudServiceStatusMonitor_revokeMusicKitUserTokensForAccountDSID_withCompletion___block_invoke_123(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543618;
    uint64_t v5 = v3;
    __int16 v6 = 2114;
    id v7 = @"com.apple.itunescloudd.tcchelper";
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection to %{public}@ service invalidated.", (uint8_t *)&v4, 0x16u);
  }
}

void __85__ICCloudServiceStatusMonitor_revokeMusicKitUserTokensForAccountDSID_withCompletion___block_invoke_124(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543874;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    uint64_t v9 = @"com.apple.itunescloudd.tcchelper";
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Connection to %{public}@ failed to get remote object proxy: %{public}@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __85__ICCloudServiceStatusMonitor_revokeMusicKitUserTokensForAccountDSID_withCompletion___block_invoke_126(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  int v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      __int16 v8 = objc_msgSend(v3, "msv_description");
      int v10 = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Revocation of music user tokens completed error=%{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Revocation of music user tokens completed", (uint8_t *)&v10, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [v4 invalidate];
}

- (void)requestMusicKitTokensWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  if (!self->_tokensCompletionHandlers)
  {
    __int16 v8 = (MSVDefaultDictionary *)[objc_alloc(MEMORY[0x1E4F77980]) initWithDefaultValue:&__block_literal_global_68_28897];
    tokensCompletionHandlers = self->_tokensCompletionHandlers;
    self->_tokensCompletionHandlers = v8;
  }
  int v10 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v11 = [(MSVDefaultDictionary *)self->_tokensCompletionHandlers objectForKey:v10];
  __int16 v12 = (void *)[v7 copy];

  uint64_t v13 = (void *)MEMORY[0x1A6240BF0](v12);
  [v11 addObject:v13];

  uint64_t v14 = [v11 count];
  id v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14 == 1)
  {
    if (!v16) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = self;
    id v17 = "%{public}@: Requesting MusicKit tokens from service.";
    int64_t v18 = v15;
    uint32_t v19 = 12;
  }
  else
  {
    if (!v16) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v11 count];
    id v17 = "%{public}@: Skipping redundant request for MusicKit tokens from service; appending completion handler to exist"
          "ing list (%lu completion handlers).";
    int64_t v18 = v15;
    uint32_t v19 = 22;
  }
  _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_9:

  os_unfair_lock_unlock(p_lock);
  if (v14 == 1)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __82__ICCloudServiceStatusMonitor_requestMusicKitTokensWithOptions_completionHandler___block_invoke_69;
    v22[3] = &unk_1E5ACA990;
    v22[4] = self;
    void v22[5] = a3;
    int v20 = v22;
    os_unfair_lock_assert_not_owner(p_lock);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __83__ICCloudServiceStatusMonitor__requestMusicKitTokensWithOptions_completionHandler___block_invoke;
    __int16 v26 = &unk_1E5ACA8F8;
    unint64_t v29 = a3;
    id v27 = self;
    uint64_t v28 = v20;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __83__ICCloudServiceStatusMonitor__requestMusicKitTokensWithOptions_completionHandler___block_invoke_3;
    v23[3] = &unk_1E5ACAC90;
    id v21 = v28;
    id v24 = v21;
    [(ICCloudServiceStatusMonitor *)self _performCloudServiceStatusMonitorRequestWithDescription:@"MusicKit tokens" requestHandler:buf errorHandler:v23];
  }
}

void __82__ICCloudServiceStatusMonitor_requestMusicKitTokensWithOptions_completionHandler___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = a3;
  if (v5)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(v5 + 144));
    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 144));
    __int16 v8 = [NSNumber numberWithUnsignedInteger:v4];
    uint64_t v9 = [*(id *)(v5 + 136) objectForKey:v8];
    int v10 = (void *)[v9 copy];

    [*(id *)(v5 + 136) removeObjectForKey:v8];
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 144));
    uint64_t v11 = [v10 count];
    __int16 v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    uint64_t v13 = v12;
    if (v7)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        if (v11 == 1) {
          uint64_t v14 = "";
        }
        else {
          uint64_t v14 = "s";
        }
        id v15 = objc_msgSend(v7, "msv_description");
        *(_DWORD *)buf = 138544130;
        uint64_t v27 = v5;
        __int16 v28 = 2048;
        uint64_t v29 = v11;
        __int16 v30 = 2080;
        id v31 = v14;
        __int16 v32 = 2114;
        id v33 = v15;
        _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Invoking %lu completion handler%s for MusicKit tokens. error=%{public}@", buf, 0x2Au);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = "s";
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v5;
      if (v11 == 1) {
        BOOL v16 = "";
      }
      __int16 v28 = 2048;
      uint64_t v29 = v11;
      __int16 v30 = 2080;
      id v31 = v16;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Invoking %lu completion handler%s for MusicKit tokens.", buf, 0x20u);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v17 = v10;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:buf count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v23;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v17);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v22 + 1) + 8 * v21) + 16))(*(void *)(*((void *)&v22 + 1) + 8 * v21));
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:buf count:16];
      }
      while (v19);
    }
  }
}

void __83__ICCloudServiceStatusMonitor__requestMusicKitTokensWithOptions_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = a1[6];
  id v7 = a2;
  __int16 v8 = +[ICClientInfo defaultInfo];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__ICCloudServiceStatusMonitor__requestMusicKitTokensWithOptions_completionHandler___block_invoke_2;
  v11[3] = &unk_1E5ACA9B8;
  uint64_t v9 = (void *)a1[5];
  void v11[4] = a1[4];
  id v12 = v5;
  id v13 = v9;
  id v10 = v5;
  [v7 requestMusicKitTokensWithOptions:v6 clientInfo:v8 completionHandler:v11];
}

uint64_t __83__ICCloudServiceStatusMonitor__requestMusicKitTokensWithOptions_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__ICCloudServiceStatusMonitor__requestMusicKitTokensWithOptions_completionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  id v7 = a3;
  id v8 = a2;
  [v5 _didEndRequestingTokenWithTransactionIdentifier:v6];
  (*(void (**)(void))(a1[6] + 16))();
}

id __82__ICCloudServiceStatusMonitor_requestMusicKitTokensWithOptions_completionHandler___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

  return v0;
}

- (void)requestUserTokenForDeveloperToken:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (!self->_userTokenCompletionHandlers)
  {
    id v10 = (MSVDefaultDictionary *)[objc_alloc(MEMORY[0x1E4F77980]) initWithDefaultValue:&__block_literal_global_61_28912];
    userTokenCompletionHandlers = self->_userTokenCompletionHandlers;
    self->_userTokenCompletionHandlers = v10;
  }
  id v12 = (void *)MEMORY[0x1E4F779D8];
  id v13 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v14 = [v12 pairWithFirst:v8 second:v13];

  id v15 = [(MSVDefaultDictionary *)self->_userTokenCompletionHandlers objectForKey:v14];
  BOOL v16 = (void *)[v9 copy];

  id v17 = (void *)MEMORY[0x1A6240BF0](v16);
  [v15 addObject:v17];

  uint64_t v18 = [v15 count];
  uint64_t v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18 == 1)
  {
    if (!v20) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = self;
    uint64_t v21 = "%{public}@: Requesting user token from service.";
    long long v22 = v19;
    uint32_t v23 = 12;
  }
  else
  {
    if (!v20) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v15 count];
    uint64_t v21 = "%{public}@: Skipping redundant request for user token from service; appending completion handler to existing l"
          "ist (%lu completion handlers).";
    long long v22 = v19;
    uint32_t v23 = 22;
  }
  _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
LABEL_9:

  os_unfair_lock_unlock(&self->_lock);
  if (v18 == 1)
  {
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    __int16 v30 = __91__ICCloudServiceStatusMonitor_requestUserTokenForDeveloperToken_options_completionHandler___block_invoke_63;
    id v31 = &unk_1E5ACA940;
    __int16 v32 = self;
    id v33 = v8;
    unint64_t v34 = a4;
    id v24 = v33;
    long long v25 = &v28;
    os_unfair_lock_assert_not_owner(&self->_lock);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __92__ICCloudServiceStatusMonitor__requestUserTokenForDeveloperToken_options_completionHandler___block_invoke;
    v38 = &unk_1E5ACA968;
    id v26 = v24;
    unint64_t v42 = a4;
    id v39 = v26;
    v40 = self;
    v41 = v25;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __92__ICCloudServiceStatusMonitor__requestUserTokenForDeveloperToken_options_completionHandler___block_invoke_3;
    v35[3] = &unk_1E5ACAC90;
    uint64_t v27 = v41;
    uint64_t v36 = v27;
    [(ICCloudServiceStatusMonitor *)self _performCloudServiceStatusMonitorRequestWithDescription:@"user token", buf, v35, v28, v29, v30, v31, v32 requestHandler errorHandler];
  }
}

void __91__ICCloudServiceStatusMonitor_requestUserTokenForDeveloperToken_options_completionHandler___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  id v8 = a2;
  id v9 = a3;
  if (v5)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(v5 + 144));
    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 144));
    id v10 = (void *)MEMORY[0x1E4F779D8];
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:v6];
    id v12 = [v10 pairWithFirst:v7 second:v11];

    id v13 = [*(id *)(v5 + 128) objectForKey:v12];
    uint64_t v14 = (void *)[v13 copy];

    [*(id *)(v5 + 128) removeObjectForKey:v12];
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 144));
    uint64_t v15 = [v14 count];
    BOOL v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    id v17 = v16;
    if (v9)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        if (v15 == 1) {
          uint64_t v18 = "";
        }
        else {
          uint64_t v18 = "s";
        }
        uint64_t v19 = objc_msgSend(v9, "msv_description");
        *(_DWORD *)buf = 138544130;
        uint64_t v31 = v5;
        __int16 v32 = 2048;
        uint64_t v33 = v15;
        __int16 v34 = 2080;
        v35 = v18;
        __int16 v36 = 2114;
        v37 = v19;
        _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Invoking %lu completion handler%s for user token. error=%{public}@", buf, 0x2Au);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v20 = "s";
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v5;
      if (v15 == 1) {
        BOOL v20 = "";
      }
      __int16 v32 = 2048;
      uint64_t v33 = v15;
      __int16 v34 = 2080;
      v35 = v20;
      _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Invoking %lu completion handler%s for user token.", buf, 0x20u);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v21 = v14;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:buf count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v27;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(v21);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v26 + 1) + 8 * v25) + 16))(*(void *)(*((void *)&v26 + 1) + 8 * v25));
          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [v21 countByEnumeratingWithState:&v26 objects:buf count:16];
      }
      while (v23);
    }
  }
}

void __92__ICCloudServiceStatusMonitor__requestUserTokenForDeveloperToken_options_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[7];
  id v8 = a2;
  id v9 = +[ICClientInfo defaultInfo];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__ICCloudServiceStatusMonitor__requestUserTokenForDeveloperToken_options_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5ACD0B0;
  id v10 = (void *)a1[6];
  v12[4] = a1[5];
  id v13 = v5;
  id v14 = v10;
  id v11 = v5;
  [v8 requestUserTokenForDeveloperToken:v6 options:v7 clientInfo:v9 completionHandler:v12];
}

uint64_t __92__ICCloudServiceStatusMonitor__requestUserTokenForDeveloperToken_options_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__ICCloudServiceStatusMonitor__requestUserTokenForDeveloperToken_options_completionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  id v7 = a3;
  id v8 = a2;
  [v5 _didEndRequestingTokenWithTransactionIdentifier:v6];
  (*(void (**)(void))(a1[6] + 16))();
}

id __91__ICCloudServiceStatusMonitor_requestUserTokenForDeveloperToken_options_completionHandler___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

  return v0;
}

- (void)requestUserTokenForDeveloperToken:(id)a3 completionHandler:(id)a4
{
}

- (void)_requestCapabilitiesWithPrivacyPromptPolicy:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, unint64_t, void))a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (v6) {
    int64_t privacyAcknowledgementPolicy = [v6 integerValue];
  }
  else {
    int64_t privacyAcknowledgementPolicy = self->_privacyAcknowledgementPolicy;
  }
  BOOL hasValidCapabilities = self->_hasValidCapabilities;
  if (self->_hasValidCapabilities) {
    unint64_t capabilities = self->_capabilities;
  }
  else {
    unint64_t capabilities = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_ICCloudServiceStatusPrivacyAcknowledgementPromptLock);
  int v11 = _ICCloudServiceStatusPrivacyAcknowledgementDidPromptOnce;
  os_unfair_lock_unlock((os_unfair_lock_t)&_ICCloudServiceStatusPrivacyAcknowledgementPromptLock);
  os_unfair_lock_unlock(&self->_lock);
  if (hasValidCapabilities)
  {
    v7[2](v7, capabilities, 0);
  }
  else
  {
    if (v11) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = privacyAcknowledgementPolicy;
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __93__ICCloudServiceStatusMonitor__requestCapabilitiesWithPrivacyPromptPolicy_completionHandler___block_invoke;
    v13[3] = &unk_1E5ACA8D0;
    id v14 = v7;
    [(ICCloudServiceStatusMonitor *)self _requestCapabilitiesWithPrivacyPromptPolicy:v12 requestCapabilitiesWithCompletionHandler:v13];
  }
}

void __93__ICCloudServiceStatusMonitor__requestCapabilitiesWithPrivacyPromptPolicy_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 code] == -7007)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_ICCloudServiceStatusPrivacyAcknowledgementPromptLock);
    _ICCloudServiceStatusPrivacyAcknowledgementDidPromptOnce = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)&_ICCloudServiceStatusPrivacyAcknowledgementPromptLock);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestDeveloperTokenWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  if (!self->_developerTokenCompletionHandlers)
  {
    id v8 = (MSVDefaultDictionary *)[objc_alloc(MEMORY[0x1E4F77980]) initWithDefaultValue:&__block_literal_global_28923];
    developerTokenCompletionHandlers = self->_developerTokenCompletionHandlers;
    self->_developerTokenCompletionHandlers = v8;
  }
  id v10 = [NSNumber numberWithUnsignedInteger:a3];
  int v11 = [(MSVDefaultDictionary *)self->_developerTokenCompletionHandlers objectForKey:v10];
  int64_t v12 = (void *)[v7 copy];

  id v13 = (void *)MEMORY[0x1A6240BF0](v12);
  [v11 addObject:v13];

  uint64_t v14 = [v11 count];
  uint64_t v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14 == 1)
  {
    if (!v16) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = self;
    id v17 = "%{public}@: Requesting developer token from service.";
    uint64_t v18 = v15;
    uint32_t v19 = 12;
  }
  else
  {
    if (!v16) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v11 count];
    id v17 = "%{public}@: Skipping redundant request for developer token from service; appending completion handler to exist"
          "ing list (%lu completion handlers).";
    uint64_t v18 = v15;
    uint32_t v19 = 22;
  }
  _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_9:

  os_unfair_lock_unlock(p_lock);
  if (v14 == 1)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __82__ICCloudServiceStatusMonitor_requestDeveloperTokenWithOptions_completionHandler___block_invoke_48;
    v22[3] = &unk_1E5ACA8A8;
    v22[4] = self;
    void v22[5] = a3;
    BOOL v20 = v22;
    os_unfair_lock_assert_not_owner(p_lock);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __83__ICCloudServiceStatusMonitor__requestDeveloperTokenWithOptions_completionHandler___block_invoke;
    long long v26 = &unk_1E5ACA8F8;
    unint64_t v29 = a3;
    long long v27 = self;
    long long v28 = v20;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __83__ICCloudServiceStatusMonitor__requestDeveloperTokenWithOptions_completionHandler___block_invoke_3;
    v23[3] = &unk_1E5ACAC90;
    id v21 = v28;
    id v24 = v21;
    [(ICCloudServiceStatusMonitor *)self _performCloudServiceStatusMonitorRequestWithDescription:@"developer token" requestHandler:buf errorHandler:v23];
  }
}

void __82__ICCloudServiceStatusMonitor_requestDeveloperTokenWithOptions_completionHandler___block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = a3;
  if (v5)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(v5 + 144));
    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 144));
    id v8 = [NSNumber numberWithUnsignedInteger:v4];
    id v9 = [*(id *)(v5 + 120) objectForKey:v8];
    id v10 = (void *)[v9 copy];

    [*(id *)(v5 + 120) removeObjectForKey:v8];
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 144));
    uint64_t v11 = [v10 count];
    int64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    id v13 = v12;
    if (v7)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        if (v11 == 1) {
          uint64_t v14 = "";
        }
        else {
          uint64_t v14 = "s";
        }
        uint64_t v15 = objc_msgSend(v7, "msv_description");
        *(_DWORD *)buf = 138544130;
        uint64_t v27 = v5;
        __int16 v28 = 2048;
        uint64_t v29 = v11;
        __int16 v30 = 2080;
        uint64_t v31 = v14;
        __int16 v32 = 2114;
        uint64_t v33 = v15;
        _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Invoking %lu completion handler%s for developer token. error=%{public}@", buf, 0x2Au);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = "s";
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v5;
      if (v11 == 1) {
        BOOL v16 = "";
      }
      __int16 v28 = 2048;
      uint64_t v29 = v11;
      __int16 v30 = 2080;
      uint64_t v31 = v16;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Invoking %lu completion handler%s for developer token.", buf, 0x20u);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v17 = v10;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:buf count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v23;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v17);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v22 + 1) + 8 * v21) + 16))(*(void *)(*((void *)&v22 + 1) + 8 * v21));
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:buf count:16];
      }
      while (v19);
    }
  }
}

void __83__ICCloudServiceStatusMonitor__requestDeveloperTokenWithOptions_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = a1[6];
  id v7 = a2;
  id v8 = +[ICClientInfo defaultInfo];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__ICCloudServiceStatusMonitor__requestDeveloperTokenWithOptions_completionHandler___block_invoke_2;
  v11[3] = &unk_1E5ACD0B0;
  id v9 = (void *)a1[5];
  void v11[4] = a1[4];
  id v12 = v5;
  id v13 = v9;
  id v10 = v5;
  [v7 requestDeveloperTokenWithOptions:v6 clientInfo:v8 completionHandler:v11];
}

uint64_t __83__ICCloudServiceStatusMonitor__requestDeveloperTokenWithOptions_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__ICCloudServiceStatusMonitor__requestDeveloperTokenWithOptions_completionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  id v7 = a3;
  id v8 = a2;
  [v5 _didEndRequestingTokenWithTransactionIdentifier:v6];
  (*(void (**)(void))(a1[6] + 16))();
}

id __82__ICCloudServiceStatusMonitor_requestDeveloperTokenWithOptions_completionHandler___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

  return v0;
}

- (void)requestStorefrontIdentifierWithCompletionHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = (void (**)(id, NSString *, void))a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = self->_storefrontIdentifier;
  os_unfair_lock_unlock(p_lock);
  if (v6) {
    v5[2](v5, v6, 0);
  }
  else {
    [(ICCloudServiceStatusMonitor *)self _requestStorefrontIdentifierWithCompletionHandler:v5];
  }
}

- (void)requestCapabilitiesWithPrivacyPromptPolicy:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [(ICCloudServiceStatusMonitor *)self _requestCapabilitiesWithPrivacyPromptPolicy:v8 completionHandler:v7];
}

- (void)requestCapabilitiesWithCompletionHandler:(id)a3
{
}

- (void)endObservingCloudServiceStatus
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  unint64_t observingCloudServiceStatusRequestsCount = self->_observingCloudServiceStatusRequestsCount;
  unint64_t v5 = observingCloudServiceStatusRequestsCount - 1;
  self->_unint64_t observingCloudServiceStatusRequestsCount = observingCloudServiceStatusRequestsCount - 1;
  if (observingCloudServiceStatusRequestsCount == 1)
  {
    uint64_t v6 = self->_observationToken;
    self->_unint64_t capabilities = 0;
    self->_BOOL hasValidCapabilities = 0;
    storefrontCountryCode = self->_storefrontCountryCode;
    self->_storefrontCountryCode = 0;

    storefrontIdentifier = self->_storefrontIdentifier;
    self->_storefrontIdentifier = 0;
  }
  else
  {
    uint64_t v6 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  id v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = "Will keep";
    int v11 = 138544130;
    __int16 v13 = 2048;
    id v12 = self;
    if (!v5) {
      id v10 = "Will end";
    }
    unint64_t v14 = v5;
    __int16 v15 = 2082;
    BOOL v16 = v10;
    __int16 v17 = 2114;
    uint64_t v18 = v6;
    _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud service status monitor decremented requests count for observing cloud service status to %lu. %{public}s observing cloud service status with token %{public}@.", (uint8_t *)&v11, 0x2Au);
  }

  if (!v5 && v6) {
    [(ICCloudServiceStatusMonitor *)self _endObservingCloudServiceStatusWithToken:v6];
  }
}

- (void)beginObservingCloudServiceStatus
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  unint64_t observingCloudServiceStatusRequestsCount = self->_observingCloudServiceStatusRequestsCount;
  self->_unint64_t observingCloudServiceStatusRequestsCount = observingCloudServiceStatusRequestsCount + 1;
  os_unfair_lock_unlock(p_lock);
  unint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = "Already";
    int v7 = 138543874;
    id v8 = self;
    if (!observingCloudServiceStatusRequestsCount) {
      uint64_t v6 = "Will begin";
    }
    __int16 v9 = 2048;
    unint64_t v10 = observingCloudServiceStatusRequestsCount + 1;
    __int16 v11 = 2082;
    id v12 = v6;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud service status monitor incremented requests count for observing cloud service status to %lu. %{public}s observing cloud service status.", (uint8_t *)&v7, 0x20u);
  }

  if (!observingCloudServiceStatusRequestsCount) {
    [(ICCloudServiceStatusMonitor *)self _beginObservingCloudServiceStatus];
  }
}

- (BOOL)isObservingCloudServiceStatus
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  LOBYTE(v2) = [(ICCloudServiceStatusMonitor *)v2 _locked_isObservingCloudServiceStatus];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (int64_t)privacyAcknowledgementPolicy
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  int64_t privacyAcknowledgementPolicy = self->_privacyAcknowledgementPolicy;
  os_unfair_lock_unlock(p_lock);
  return privacyAcknowledgementPolicy;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  [(ICCloudServiceStatusMonitor *)self _invalidateTriggersForCloudServiceStatusObservationRecovery];
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)ICCloudServiceStatusMonitor;
  [(ICCloudServiceStatusMonitor *)&v4 dealloc];
}

+ (BOOL)_hasEntitlementForStatusAccessExemptedFromUserConsentRequirement
{
  if (_hasEntitlementForStatusAccessExemptedFromUserConsentRequirement_sOnceToken != -1) {
    dispatch_once(&_hasEntitlementForStatusAccessExemptedFromUserConsentRequirement_sOnceToken, &__block_literal_global_181);
  }
  return _hasEntitlementForStatusAccessExemptedFromUserConsentRequirement_sHasEntitlementForStatusAccessExemptedFromUserConsentRequirement;
}

uint64_t __95__ICCloudServiceStatusMonitor__hasEntitlementForStatusAccessExemptedFromUserConsentRequirement__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F77990] hasBoolEntitlement:@"com.apple.storekit.cloud-service-exempted-from-tcc-access" shouldLogForMissingEntitlement:0];
  _hasEntitlementForStatusAccessExemptedFromUserConsentRequirement_sHasEntitlementForStatusAccessExemptedFromUserConsentRequirement = result;
  return result;
}

@end