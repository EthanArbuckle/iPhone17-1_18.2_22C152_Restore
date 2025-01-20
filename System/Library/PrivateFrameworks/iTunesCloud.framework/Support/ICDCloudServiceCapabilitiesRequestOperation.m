@interface ICDCloudServiceCapabilitiesRequestOperation
- (ICDCloudServiceCapabilitiesRequestOperation)initWithIdentity:(id)a3;
- (NSXPCConnection)originatingClientConnection;
- (id)completionHandler;
- (int64_t)privacyAcknowledgementPolicy;
- (void)_didCompleteAllCapabilitiesAsynchronousRequests;
- (void)_didCompletePrivacyPromptOperation:(id)a3 withStatus:(int64_t)a4 error:(id)a5;
- (void)_handlePrivacyAcknowledgementErrorWithMessage:(id)a3 underlyingError:(id)a4;
- (void)_performPrivacyPromptOperation;
- (void)_requestBagWithAsynchronousRequestsGroup:(id)a3;
- (void)_requestCapabilities;
- (void)_requestIdentityPropertiesWithAsynchronousRequestsGroup:(id)a3;
- (void)_requestSubscriptionStatusWithAsynchronousRequestsGroup:(id)a3;
- (void)_updateWithBag:(id)a3 error:(id)a4;
- (void)_updateWithIdentityProperties:(id)a3 error:(id)a4;
- (void)_updateWithSubscriptionStatusResponse:(id)a3 error:(id)a4;
- (void)cancel;
- (void)execute;
- (void)setCompletionHandler:(id)a3;
- (void)setOriginatingClientConnection:(id)a3;
- (void)setPrivacyAcknowledgementPolicy:(int64_t)a3;
@end

@implementation ICDCloudServiceCapabilitiesRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_subscriptionStatusResponse, 0);
  objc_storeStrong((id *)&self->_identityProperties, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_privacyPromptOperation, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_originatingClientConnection, 0);
  objc_storeStrong((id *)&self->_identityStore, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

- (void)_didCompleteAllCapabilitiesAsynchronousRequests
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v4 = self->_bag;
  v5 = self->_identityProperties;
  v6 = self->_subscriptionStatusResponse;
  v7 = self->_error;
  v8 = (void (**)(id, void, NSError *))objc_retainBlock(self->_completionHandler);
  if (self->_hasInvokedCompletionHandler)
  {
    os_unfair_lock_unlock(p_lock);
    v9 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Request is already finished. Skipping running completion logic a second time.", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    self->_hasInvokedCompletionHandler = 1;
    os_unfair_lock_unlock(p_lock);
    if (v7)
    {
      v10 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138543618;
        v16 = self;
        __int16 v17 = 2114;
        v18 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@: Did complete request with error: %{public}@.", (uint8_t *)&v15, 0x16u);
      }
      uint64_t v11 = 0;
    }
    else
    {
      v10 = [(ICMusicSubscriptionStatusResponse *)v6 subscriptionStatus];
      uint64_t v11 = [v10 hasCapability:1];
      if ((([v10 hasCapability:512] & 1) != 0
         || [v10 hasCapability:256])
        && [(ICUserIdentityProperties *)v5 isActiveLocker])
      {
        v11 |= 0x100uLL;
      }
      if (([v10 hasCapability:1] & 1) == 0
        && ([(ICUserIdentityProperties *)v5 isManagedAppleID] & 1) == 0)
      {
        v12 = [(ICURLBag *)v4 dictionaryForBagKey:ICURLBagKeyMusicSubscription];

        if (v12) {
          v11 |= 2uLL;
        }
      }
      v13 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        ICCloudServiceCapabilitiesGetDescription();
        v14 = (NSError *)objc_claimAutoreleasedReturnValue();
        int v15 = 138543618;
        v16 = self;
        __int16 v17 = 2114;
        v18 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Did complete request; capabilities: %{public}@.",
          (uint8_t *)&v15,
          0x16u);
      }
    }

    if (v8) {
      v8[2](v8, v11, v7);
    }
    [(ICDCloudServiceCapabilitiesRequestOperation *)self finishWithError:v7];
  }
}

- (void)_requestCapabilities
{
  os_unfair_lock_assert_not_owner(&self->_lock);
  v3 = dispatch_group_create();
  [(ICDCloudServiceCapabilitiesRequestOperation *)self _requestBagWithAsynchronousRequestsGroup:v3];
  [(ICDCloudServiceCapabilitiesRequestOperation *)self _requestIdentityPropertiesWithAsynchronousRequestsGroup:v3];
  [(ICDCloudServiceCapabilitiesRequestOperation *)self _requestSubscriptionStatusWithAsynchronousRequestsGroup:v3];
  qos_class_t v4 = qos_class_self();
  v5 = dispatch_get_global_queue(v4, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011FA50;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_group_notify(v3, v5, block);
}

- (void)_updateWithSubscriptionStatusResponse:(id)a3 error:(id)a4
{
  id v9 = a3;
  v7 = (NSError *)a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (v7)
  {
    if (self->_error) {
      error = self->_error;
    }
    else {
      error = v7;
    }
    objc_storeStrong((id *)&self->_error, error);

    os_unfair_lock_unlock(&self->_lock);
    [(ICDCloudServiceCapabilitiesRequestOperation *)self _didCompleteAllCapabilitiesAsynchronousRequests];
  }
  else
  {
    objc_storeStrong((id *)&self->_subscriptionStatusResponse, a3);
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_requestSubscriptionStatusWithAsynchronousRequestsGroup:(id)a3
{
  qos_class_t v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_identity;
  v6 = self->_identityStore;
  int64_t privacyAcknowledgementPolicy = self->_privacyAcknowledgementPolicy;
  os_unfair_lock_unlock(&self->_lock);
  dispatch_group_enter(v4);
  id v8 = objc_alloc((Class)ICStoreRequestContext);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10011FDDC;
  v20[3] = &unk_1001BEB38;
  id v9 = v6;
  v21 = v9;
  v10 = v5;
  v22 = v10;
  id v11 = [v8 initWithBlock:v20];
  id v12 = [objc_alloc((Class)ICMusicSubscriptionStatusRequest) initWithStoreRequestContext:v11];
  [v12 setAllowsFallbackToExpiredStatus:1];
  [v12 setAllowsFallbackToStatusNeedingReload:1];
  [v12 setCarrierBundleProvisioningStyle:1];
  [v12 setShouldBypassEnforcementOfPrivacyAcknowledgement:privacyAcknowledgementPolicy == 2];
  v13 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = self;
    __int16 v25 = 2114;
    id v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting subscription status using %{public}@.", buf, 0x16u);
  }

  v14 = +[ICMusicSubscriptionStatusController sharedStatusController];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10011FE74;
  v17[3] = &unk_1001BEB88;
  v17[4] = self;
  id v18 = v12;
  v19 = v4;
  int v15 = v4;
  id v16 = v12;
  [v14 performSubscriptionStatusRequest:v16 withCompletionHandler:v17];
}

- (void)_updateWithIdentityProperties:(id)a3 error:(id)a4
{
  id v9 = a3;
  v7 = (NSError *)a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (v7)
  {
    if (self->_error) {
      error = self->_error;
    }
    else {
      error = v7;
    }
    objc_storeStrong((id *)&self->_error, error);

    os_unfair_lock_unlock(&self->_lock);
    [(ICDCloudServiceCapabilitiesRequestOperation *)self _didCompleteAllCapabilitiesAsynchronousRequests];
  }
  else
  {
    objc_storeStrong((id *)&self->_identityProperties, a3);
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_requestIdentityPropertiesWithAsynchronousRequestsGroup:(id)a3
{
  qos_class_t v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_identity;
  v6 = self->_identityStore;
  os_unfair_lock_unlock(&self->_lock);
  dispatch_group_enter(v4);
  v7 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    identity = self->_identity;
    *(_DWORD *)buf = 138543618;
    v13 = self;
    __int16 v14 = 2114;
    int v15 = identity;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting properties for %{public}@.", buf, 0x16u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100120228;
  v10[3] = &unk_1001BEB60;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [(ICUserIdentityStore *)v6 getPropertiesForUserIdentity:v5 completionHandler:v10];
}

- (void)_updateWithBag:(id)a3 error:(id)a4
{
  id v9 = a3;
  v7 = (NSError *)a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (v7)
  {
    if (self->_error) {
      error = self->_error;
    }
    else {
      error = v7;
    }
    objc_storeStrong((id *)&self->_error, error);

    os_unfair_lock_unlock(&self->_lock);
    [(ICDCloudServiceCapabilitiesRequestOperation *)self _didCompleteAllCapabilitiesAsynchronousRequests];
  }
  else
  {
    objc_storeStrong((id *)&self->_bag, a3);
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_requestBagWithAsynchronousRequestsGroup:(id)a3
{
  qos_class_t v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_identity;
  v6 = self->_identityStore;
  os_unfair_lock_unlock(&self->_lock);
  dispatch_group_enter(v4);
  id v7 = objc_alloc((Class)ICStoreRequestContext);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100120674;
  v16[3] = &unk_1001BEB38;
  id v8 = v6;
  __int16 v17 = v8;
  id v9 = v5;
  id v18 = v9;
  id v10 = [v7 initWithBlock:v16];
  id v11 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    __int16 v21 = 2114;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting bag using %{public}@.", buf, 0x16u);
  }

  id v12 = +[ICURLBagProvider sharedBagProvider];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10012070C;
  v14[3] = &unk_1001BF210;
  v14[4] = self;
  int v15 = v4;
  v13 = v4;
  [v12 getBagForRequestContext:v10 withCompletionHandler:v14];
}

- (void)_handlePrivacyAcknowledgementErrorWithMessage:(id)a3 underlyingError:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  id v9 = (void (**)(id, void, void *))objc_retainBlock(self->_completionHandler);
  os_unfair_lock_unlock(p_lock);
  id v10 = +[NSError msv_errorWithDomain:ICErrorDomain, -7007, v7, @"%@", v8 code underlyingError debugDescription];

  id v11 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = objc_msgSend(v10, "msv_description");
    *(_DWORD *)buf = 138543618;
    __int16 v14 = self;
    __int16 v15 = 2114;
    id v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);
  }
  if (v9) {
    v9[2](v9, 0, v10);
  }
  [(ICDCloudServiceCapabilitiesRequestOperation *)self finishWithError:v10];
}

- (void)_didCompletePrivacyPromptOperation:(id)a3 withStatus:(int64_t)a4 error:(id)a5
{
  id v12 = (ICDPrivacyPromptOperation *)a3;
  id v8 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (self->_privacyPromptOperation == v12)
  {
    self->_privacyPromptOperation = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  switch(a4)
  {
    case 0:
    case 2:
      [(ICDCloudServiceCapabilitiesRequestOperation *)self _requestCapabilities];
      break;
    case 1:
      CFStringRef v9 = @"Privacy acknowledgement required, but user did not accept latest privacy policy.";
      id v10 = self;
      id v11 = 0;
      goto LABEL_7;
    case 3:
      CFStringRef v9 = @"Encountered error while performing privacy prompt operation.";
      id v10 = self;
      id v11 = v8;
LABEL_7:
      [(ICDCloudServiceCapabilitiesRequestOperation *)v10 _handlePrivacyAcknowledgementErrorWithMessage:v9 underlyingError:v11];
      break;
    default:
      break;
  }
}

- (void)_performPrivacyPromptOperation
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  qos_class_t v4 = [ICDPrivacyPromptOperation alloc];
  v5 = [(ICDPrivacyPromptOperation *)v4 initWithPrivacyIdentifier:ICPrivacyIdentifierMusic];
  objc_initWeak(&location, v5);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100120DE0;
  v9[3] = &unk_1001BEB10;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  [(ICDPrivacyPromptOperation *)v5 setCompletionHandler:v9];
  os_unfair_lock_lock(p_lock);
  if (self->_wasCancelled)
  {
    os_unfair_lock_unlock(p_lock);
    v6 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      __int16 v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Operation was cancelled right before enqueuing privacy prompt operation: %{public}@. Aborting.", buf, 0x16u);
    }

    id v7 = +[NSError errorWithDomain:ICErrorDomain code:-7004 userInfo:0];
    [(ICDCloudServiceCapabilitiesRequestOperation *)self finishWithError:v7];
  }
  else
  {
    objc_storeStrong((id *)&self->_privacyPromptOperation, v5);
    os_unfair_lock_unlock(p_lock);
    id v8 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      __int16 v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Performing %{public}@.", buf, 0x16u);
    }

    [(ICDCloudServiceCapabilitiesRequestOperation *)self enqueueChildOperation:v5];
  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)setCompletionHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  id v6 = [v5 copy];

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)completionHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v4 = objc_retainBlock(self->_completionHandler);
  os_unfair_lock_unlock(p_lock);
  id v5 = objc_retainBlock(v4);

  return v5;
}

- (void)setOriginatingClientConnection:(id)a3
{
  id v4 = (NSXPCConnection *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  originatingClientConnection = self->_originatingClientConnection;
  self->_originatingClientConnection = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSXPCConnection)originatingClientConnection
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v4 = self->_originatingClientConnection;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setPrivacyAcknowledgementPolicy:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_int64_t privacyAcknowledgementPolicy = a3;

  os_unfair_lock_unlock(p_lock);
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

- (void)execute
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  int64_t privacyAcknowledgementPolicy = self->_privacyAcknowledgementPolicy;
  BOOL wasCancelled = self->_wasCancelled;
  os_unfair_lock_unlock(p_lock);
  if (wasCancelled)
  {
    id v6 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Operation was cancelled upon beginning execution. Aborting.", (uint8_t *)&v11, 0xCu);
    }

    id v7 = +[NSError errorWithDomain:ICErrorDomain code:-7004 userInfo:0];
    [(ICDCloudServiceCapabilitiesRequestOperation *)self finishWithError:v7];
  }
  else if (privacyAcknowledgementPolicy)
  {
    if (privacyAcknowledgementPolicy == 1)
    {
      [(ICDCloudServiceCapabilitiesRequestOperation *)self _performPrivacyPromptOperation];
    }
    else if (privacyAcknowledgementPolicy == 2)
    {
      id v8 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Bypassing enforcement of privacy acknowledgement.", (uint8_t *)&v11, 0xCu);
      }

      [(ICDCloudServiceCapabilitiesRequestOperation *)self _requestCapabilities];
    }
  }
  else
  {
    CFStringRef v9 = +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:self->_identity];
    unsigned int v10 = [v9 privacyAcknowledgementRequiredForIdentifier:ICPrivacyIdentifierMusic];

    if (v10)
    {
      [(ICDCloudServiceCapabilitiesRequestOperation *)self _handlePrivacyAcknowledgementErrorWithMessage:@"Privacy acknowledgement required, but presenting the privacy prompt is not allowed." underlyingError:0];
    }
    else
    {
      [(ICDCloudServiceCapabilitiesRequestOperation *)self _requestCapabilities];
    }
  }
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v6.receiver = self;
  v6.super_class = (Class)ICDCloudServiceCapabilitiesRequestOperation;
  [(ICDCloudServiceCapabilitiesRequestOperation *)&v6 cancel];
  os_unfair_lock_lock(p_lock);
  id v4 = self->_privacyPromptOperation;
  self->_BOOL wasCancelled = 1;
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    id v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v8 = self;
      __int16 v9 = 2114;
      unsigned int v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Cancelling %{public}@.", buf, 0x16u);
    }

    [(ICDPrivacyPromptOperation *)v4 cancel];
  }
}

- (ICDCloudServiceCapabilitiesRequestOperation)initWithIdentity:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICDCloudServiceCapabilitiesRequestOperation;
  objc_super v6 = [(ICDCloudServiceCapabilitiesRequestOperation *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identity, a3);
    uint64_t v8 = +[ICUserIdentityStore defaultIdentityStore];
    identityStore = v7->_identityStore;
    v7->_identityStore = (ICUserIdentityStore *)v8;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

@end