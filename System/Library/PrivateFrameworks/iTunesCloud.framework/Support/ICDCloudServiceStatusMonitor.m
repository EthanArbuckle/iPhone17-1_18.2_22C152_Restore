@interface ICDCloudServiceStatusMonitor
+ (BOOL)_isClientAllowedToRequestCapabilitiesForConnection:(id)a3;
+ (BOOL)_isClientAllowedToRequestRestrictedInformationForConnection:(id)a3;
+ (BOOL)_shouldBypassEnforcementOfPrivacyAcknowledgementForClientConnection:(id)a3 forIncomingCloudServiceCapabilitiesRequest:(BOOL)a4;
+ (id)_clientInfoForDeveloperTokenRequestWithRequestingApplicationBundleIdentifier:(id)a3;
+ (id)_clientInfoForUserTokenRequestWithRequestingApplicationBundleIdentifier:(id)a3;
+ (id)_requestingBundleIdentifierForOriginatingClientConnection:(id)a3 clientInfo:(id)a4 error:(id *)a5;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ICDCloudServiceStatusMonitor)init;
- (void)_beginObservingCloudServiceStatus;
- (void)_endObservingCloudServiceStatus;
- (void)_handleActiveUserIdentityDidChangeNotification:(id)a3;
- (void)_handleClientConnectionInterrupted:(id)a3;
- (void)_handleClientConnectionInvalidated:(id)a3;
- (void)_handleClientConnectionSevered:(id)a3;
- (void)_handleUpdatedBag:(id)a3;
- (void)_handleUpdatedSubscriptionStatus:(id)a3;
- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3;
- (void)_handleUserIdentityStoreLocalStoreAccountPropertiesDidChangeNotification:(id)a3;
- (void)_notifyObserversForActiveUserIdentityChanged;
- (void)_refreshCapabilitiesWithPrivacyAcknowledgementPolicy:(int64_t)a3;
- (void)_refreshCloudServiceStatus;
- (void)_refreshStorefrontCountryCode;
- (void)_refreshStorefrontIdentifier;
- (void)_updateWithBag:(id)a3 error:(id)a4;
- (void)_updateWithCapabilities:(unint64_t)a3 error:(id)a4 privacyAcknowledgementPolicy:(int64_t)a5 capabilitiesRequestOperation:(id)a6;
- (void)_updateWithStorefrontIdentifier:(id)a3 error:(id)a4;
- (void)beginObservingCloudServiceStatusWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)endObservingCloudServiceStatusWithToken:(id)a3 completionHandler:(id)a4;
- (void)requestCapabilitiesWithPrivacyPromptPolicy:(int64_t)a3 completionHandler:(id)a4;
- (void)requestDeveloperTokenWithOptions:(unint64_t)a3 clientInfo:(id)a4 completionHandler:(id)a5;
- (void)requestMusicKitTokensWithOptions:(unint64_t)a3 clientInfo:(id)a4 completionHandler:(id)a5;
- (void)requestStorefrontCountryCodeWithCompletionHandler:(id)a3;
- (void)requestStorefrontIdentifierWithCompletionHandler:(id)a3;
- (void)requestUserTokenForDeveloperToken:(id)a3 options:(unint64_t)a4 clientInfo:(id)a5 completionHandler:(id)a6;
@end

@implementation ICDCloudServiceStatusMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionStatusObservationToken, 0);
  objc_storeStrong((id *)&self->_bagObservationToken, 0);
  objc_storeStrong((id *)&self->_storefrontIdentifierRequestCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_storefrontCountryCodeRequestCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_storefrontCountryCode, 0);
  objc_storeStrong((id *)&self->_capabilitiesRequestContexts, 0);
  objc_storeStrong((id *)&self->_cancellableCapabilitiesRequestOperations, 0);

  objc_storeStrong((id *)&self->_activeObservationTokenToClientConnectionMapping, 0);
}

- (void)_updateWithStorefrontIdentifier:(id)a3 error:(id)a4
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  if (!(v7 | v8))
  {
    v33 = +[NSAssertionHandler currentHandler];
    [v33 handleFailureInMethod:a2, self, @"ICDCloudServiceStatusMonitor.m", 946, @"%@: Either storefrontIdentifier or error are expected to be non-nil at this point.", self object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  id v9 = [(NSMutableArray *)self->_storefrontIdentifierRequestCompletionHandlers copy];
  storefrontIdentifierRequestCompletionHandlers = self->_storefrontIdentifierRequestCompletionHandlers;
  self->_storefrontIdentifierRequestCompletionHandlers = 0;

  id v11 = [(NSMutableDictionary *)self->_activeObservationTokenToClientConnectionMapping count];
  id v12 = v11;
  id v13 = 0;
  char v14 = 0;
  if (!v8 && v11)
  {
    v15 = self->_storefrontIdentifier;
    if (v15 == (NSString *)v7)
    {
    }
    else
    {
      v16 = v15;
      unsigned __int8 v17 = [(NSString *)v15 isEqual:v7];

      if ((v17 & 1) == 0)
      {
        v18 = (NSString *)[(id)v7 copy];
        storefrontIdentifier = self->_storefrontIdentifier;
        self->_storefrontIdentifier = v18;

        id v13 = [(NSMutableDictionary *)self->_activeObservationTokenToClientConnectionMapping copy];
        char v14 = 1;
        goto LABEL_10;
      }
    }
    char v14 = 0;
    id v13 = 0;
  }
LABEL_10:
  os_unfair_lock_unlock(&self->_lock);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v20 = v9;
  id v21 = [v20 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v37;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(v20);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v36 + 1) + 8 * i) + 16))();
      }
      id v22 = [v20 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v22);
  }

  if (v8)
  {
    os_log_t v25 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
LABEL_21:

      goto LABEL_22;
    }
    *(_DWORD *)buf = 138543618;
    v41 = self;
    __int16 v42 = 2114;
    unint64_t v43 = v8;
    v26 = "%{public}@: Could not find valid storefront identifier; error: %{public}@.";
    v27 = v25;
    os_log_type_t v28 = OS_LOG_TYPE_ERROR;
    uint32_t v29 = 22;
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v27, v28, v26, buf, v29);
    goto LABEL_21;
  }
  if (!v12) {
    goto LABEL_22;
  }
  if ((v14 & 1) == 0)
  {
    os_log_t v25 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 138543362;
    v41 = self;
    v26 = "%{public}@: Storefront identifier did not change. Skipping invoking observation handlers.";
    v27 = v25;
    os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
    uint32_t v29 = 12;
    goto LABEL_20;
  }
  id v30 = [v13 count];
  v31 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = "s";
    *(_DWORD *)buf = 138544130;
    __int16 v42 = 2114;
    v41 = self;
    if (v30 == (id)1) {
      v32 = "";
    }
    unint64_t v43 = v7;
    __int16 v44 = 2048;
    id v45 = v30;
    __int16 v46 = 2080;
    v47 = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: Storefront identifier did change: \"%{public}@\". About to notify %llu observer%s.", buf, 0x2Au);
  }

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100043620;
  v34[3] = &unk_1001BA670;
  v34[4] = self;
  id v35 = (id)v7;
  [v13 enumerateKeysAndObjectsUsingBlock:v34];

LABEL_22:
}

- (void)_updateWithCapabilities:(unint64_t)a3 error:(id)a4 privacyAcknowledgementPolicy:(int64_t)a5 capabilitiesRequestOperation:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v12 = [v10 domain];
  if ([v12 isEqualToString:ICErrorDomain]) {
    BOOL v13 = [v10 code] == (id)-7007;
  }
  else {
    BOOL v13 = 0;
  }

  id v58 = objc_alloc_init((Class)NSMutableDictionary);
  id v14 = [(NSMutableDictionary *)self->_activeObservationTokenToClientConnectionMapping count];
  id v15 = v14;
  char v16 = 0;
  BOOL v17 = a5 != 2 && v13;
  if (a5 != 2 && v14)
  {
    if (self->_capabilities == a3)
    {
      char v16 = 0;
      if (!v10) {
        self->_hasValidCapabilities = 1;
      }
    }
    else
    {
      self->_capabilities = a3;
      self->_hasValidCapabilities = v10 == 0;
      activeObservationTokenToClientConnectionMapping = self->_activeObservationTokenToClientConnectionMapping;
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_100043F7C;
      v70[3] = &unk_1001BA670;
      v70[4] = self;
      id v71 = v58;
      [(NSMutableDictionary *)activeObservationTokenToClientConnectionMapping enumerateKeysAndObjectsUsingBlock:v70];

      char v16 = 1;
    }
    BOOL v17 = v13;
  }
  id v52 = v15;
  os_unfair_lock_t lock = &self->_lock;
  if (v17 || !v15)
  {
    char v51 = v16;
  }
  else if (self->_privilegedCapabilities == a3)
  {
    char v51 = v16;
    if (!v10) {
      self->_hasValidPrivilegedCapabilities = 1;
    }
  }
  else
  {
    self->_privilegedCapabilities = a3;
    self->_hasValidPrivilegedCapabilities = v10 == 0;
    v19 = self->_activeObservationTokenToClientConnectionMapping;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_100043FF8;
    v68[3] = &unk_1001BA670;
    v68[4] = self;
    id v69 = v58;
    [(NSMutableDictionary *)v19 enumerateKeysAndObjectsUsingBlock:v68];

    char v51 = 1;
  }
  v56 = v11;
  id v20 = objc_alloc_init((Class)NSMutableArray);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v57 = self;
  location = (id *)&self->_capabilitiesRequestContexts;
  id v21 = self->_capabilitiesRequestContexts;
  id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v64 objects:v81 count:16];
  v54 = v10;
  if (!v22)
  {
    os_log_t v25 = 0;
    goto LABEL_41;
  }
  id v23 = v22;
  BOOL v24 = v13;
  os_log_t v25 = 0;
  uint64_t v26 = *(void *)v65;
  do
  {
    for (i = 0; i != v23; i = (char *)i + 1)
    {
      if (*(void *)v65 != v26) {
        objc_enumerationMutation(v21);
      }
      os_log_type_t v28 = *(void **)(*((void *)&v64 + 1) + 8 * i);
      id v29 = [v28 privacyAcknowledgementPolicy];
      if (a5 == 2)
      {
        if (v29 == (id)2) {
          goto LABEL_33;
        }
      }
      else if (a5 == 1 || !a5 && (v29 ? (BOOL v30 = v24) : (BOOL v30 = 0), !v30))
      {
LABEL_33:
        id v31 = v20;
        goto LABEL_37;
      }
      id v31 = v25;
      if (!v25)
      {
        id v31 = objc_alloc_init((Class)NSMutableArray);
        os_log_t v25 = v31;
      }
LABEL_37:
      [v31 addObject:v28];
    }
    id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v64 objects:v81 count:16];
  }
  while (v23);
LABEL_41:

  objc_storeStrong(location, v25);
  id v32 = [v20 copy];
  id v33 = [v58 copy];
  if (v56) {
    [(NSMutableArray *)v57->_cancellableCapabilitiesRequestOperations removeObject:v56];
  }

  os_unfair_lock_unlock(lock);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v34 = v32;
  id v35 = [v34 countByEnumeratingWithState:&v60 objects:v80 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v61;
    do
    {
      for (j = 0; j != v36; j = (char *)j + 1)
      {
        if (*(void *)v61 != v37) {
          objc_enumerationMutation(v34);
        }
        long long v39 = [*(id *)(*((void *)&v60 + 1) + 8 * (void)j) completionHandler];
        v40 = objc_msgSend(v54, "msv_errorByRemovingUnsafeUserInfo");
        ((void (**)(void, unint64_t, void *))v39)[2](v39, a3, v40);
      }
      id v36 = [v34 countByEnumeratingWithState:&v60 objects:v80 count:16];
    }
    while (v36);
  }

  if (v54)
  {
    v41 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v73 = v57;
      __int16 v74 = 2114;
      uint64_t v75 = (uint64_t)v54;
      __int16 v42 = "%{public}@: Could not find valid cloud service capabilities; error: %{public}@.";
      unint64_t v43 = v41;
      os_log_type_t v44 = OS_LOG_TYPE_ERROR;
      uint32_t v45 = 22;
      goto LABEL_53;
    }
    goto LABEL_54;
  }
  if (v52)
  {
    if (v51)
    {
      id v46 = [v33 count];
      v47 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v48 = ICCloudServiceCapabilitiesGetDescription();
        v49 = (void *)v48;
        v50 = "s";
        *(_DWORD *)buf = 138544130;
        __int16 v74 = 2114;
        v73 = v57;
        if (v46 == (id)1) {
          v50 = "";
        }
        uint64_t v75 = v48;
        __int16 v76 = 2048;
        id v77 = v46;
        __int16 v78 = 2080;
        v79 = v50;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud service capabilities did change: %{public}@. About to notify %llu observer%s.", buf, 0x2Au);
      }
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_100044074;
      v59[3] = &unk_1001BA698;
      v59[4] = v57;
      v59[5] = a3;
      [v33 enumerateKeysAndObjectsUsingBlock:v59];
    }
    else
    {
      v41 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v73 = v57;
        __int16 v42 = "%{public}@: Cloud service capabilities did not change. Skipping invoking observation handlers.";
        unint64_t v43 = v41;
        os_log_type_t v44 = OS_LOG_TYPE_DEFAULT;
        uint32_t v45 = 12;
LABEL_53:
        _os_log_impl((void *)&_mh_execute_header, v43, v44, v42, buf, v45);
      }
LABEL_54:
    }
  }
}

- (void)_updateWithBag:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v40 = v8;
  id v41 = v7;
  if (v8)
  {
    uint64_t v9 = objc_msgSend(v8, "msv_errorByRemovingUnsafeUserInfo");
  }
  else
  {
    uint64_t v13 = [v7 stringForBagKey:ICURLBagKeyCountryCode];
    if (v13)
    {
      id v12 = (NSString *)v13;
LABEL_7:
      id v10 = 0;
      int v11 = 1;
      goto LABEL_8;
    }
    uint64_t v9 = +[NSError errorWithDomain:ICErrorDomain code:-7201 userInfo:0];
  }
  id v10 = (void *)v9;
  if (!v9)
  {
    long long v38 = +[NSAssertionHandler currentHandler];
    [v38 handleFailureInMethod:a2, self, @"ICDCloudServiceStatusMonitor.m", 761, @"%@: Either storefrontCountryCode or finalError are expected to be non-nil at this point.", self object file lineNumber description];

    id v12 = 0;
    goto LABEL_7;
  }
  int v11 = 0;
  id v12 = 0;
LABEL_8:
  os_unfair_lock_lock(&self->_lock);
  id v14 = [(NSMutableArray *)self->_storefrontCountryCodeRequestCompletionHandlers copy];
  storefrontCountryCodeRequestCompletionHandlers = self->_storefrontCountryCodeRequestCompletionHandlers;
  self->_storefrontCountryCodeRequestCompletionHandlers = 0;

  id v16 = [(NSMutableDictionary *)self->_activeObservationTokenToClientConnectionMapping count];
  id v17 = 0;
  char v18 = 0;
  id v39 = v16;
  if (v11 && v16)
  {
    v19 = self->_storefrontCountryCode;
    if (v19 == v12)
    {
    }
    else
    {
      id v20 = v19;
      unsigned __int8 v21 = [(NSString *)v19 isEqual:v12];

      if ((v21 & 1) == 0)
      {
        id v22 = (NSString *)[(NSString *)v12 copy];
        storefrontCountryCode = self->_storefrontCountryCode;
        self->_storefrontCountryCode = v22;

        id v17 = [(NSMutableDictionary *)self->_activeObservationTokenToClientConnectionMapping copy];
        char v18 = 1;
        goto LABEL_15;
      }
    }
    char v18 = 0;
    id v17 = 0;
  }
LABEL_15:
  os_unfair_lock_unlock(&self->_lock);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v24 = v14;
  id v25 = [v24 countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v45;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v45 != v27) {
          objc_enumerationMutation(v24);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v44 + 1) + 8 * i) + 16))();
      }
      id v26 = [v24 countByEnumeratingWithState:&v44 objects:v56 count:16];
    }
    while (v26);
  }

  if ((v11 & 1) == 0)
  {
    id v33 = os_log_create("com.apple.amp.itunescloudd", "Default");
    id v29 = v41;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v49 = self;
      __int16 v50 = 2114;
      char v51 = (NSString *)v41;
      __int16 v52 = 2114;
      id v53 = v10;
      id v34 = "%{public}@: Could not find storefront country code from bag %{public}@; error: %{public}@.";
      id v35 = v33;
      os_log_type_t v36 = OS_LOG_TYPE_ERROR;
      uint32_t v37 = 32;
LABEL_34:
      _os_log_impl((void *)&_mh_execute_header, v35, v36, v34, buf, v37);
    }
LABEL_35:

    goto LABEL_36;
  }
  id v29 = v41;
  if (!v39) {
    goto LABEL_36;
  }
  if ((v18 & 1) == 0)
  {
    id v33 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v49 = self;
      id v34 = "%{public}@: Storefront country code did not change. Skipping invoking observation handlers.";
      id v35 = v33;
      os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
      uint32_t v37 = 12;
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  id v30 = [v17 count];
  id v31 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    id v32 = "s";
    *(_DWORD *)buf = 138544130;
    __int16 v50 = 2114;
    v49 = self;
    if (v30 == (id)1) {
      id v32 = "";
    }
    char v51 = v12;
    __int16 v52 = 2048;
    id v53 = v30;
    __int16 v54 = 2080;
    v55 = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: Storefront country code did change: \"%{public}@\". About to notify %llu observer%s.", buf, 0x2Au);
  }

  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000447D8;
  v42[3] = &unk_1001BA670;
  v42[4] = self;
  unint64_t v43 = v12;
  [v17 enumerateKeysAndObjectsUsingBlock:v42];

LABEL_36:
}

- (void)_refreshStorefrontIdentifier
{
  os_unfair_lock_assert_not_owner(&self->_lock);
  v3 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Refreshing storefront identifier.", buf, 0xCu);
  }

  v4 = +[ICUserIdentityStore defaultIdentityStore];
  v5 = +[ICUserIdentity activeAccount];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100044BD4;
  v6[3] = &unk_1001BC960;
  v6[4] = self;
  [v4 getPropertiesForUserIdentity:v5 completionHandler:v6];
}

- (void)_refreshStorefrontCountryCode
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v4 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Refreshing storefront country code.", buf, 0xCu);
  }

  os_unfair_lock_lock(p_lock);
  if (self->_bagObservationToken)
  {
    v5 = +[ICURLBagMonitor sharedBagMonitor];
    id v6 = [v5 bag];

    if (v6)
    {
      os_unfair_lock_unlock(p_lock);
      [(ICDCloudServiceStatusMonitor *)self _updateWithBag:v6 error:0];
      goto LABEL_12;
    }
    id v7 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: No bag was present on the bag monitor.", buf, 0xCu);
    }
  }
  os_unfair_lock_unlock(p_lock);
  id v8 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting bag directly.", buf, 0xCu);
  }

  id v9 = objc_alloc((Class)ICStoreRequestContext);
  id v10 = +[ICUserIdentity activeAccount];
  id v6 = [v9 initWithIdentity:v10];

  int v11 = +[ICURLBagProvider sharedBagProvider];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100045064;
  v12[3] = &unk_1001BC8C0;
  v12[4] = self;
  [v11 getBagForRequestContext:v6 withCompletionHandler:v12];

LABEL_12:
}

- (void)_refreshCapabilitiesWithPrivacyAcknowledgementPolicy:(int64_t)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v6 = [ICDCloudServiceCapabilitiesRequestOperation alloc];
  id v7 = +[ICUserIdentity activeAccount];
  id v8 = [(ICDCloudServiceCapabilitiesRequestOperation *)v6 initWithIdentity:v7];

  [(ICDCloudServiceCapabilitiesRequestOperation *)v8 setPrivacyAcknowledgementPolicy:a3];
  if (a3 == 1)
  {
    id v9 = +[NSXPCConnection currentConnection];
    [(ICDCloudServiceCapabilitiesRequestOperation *)v8 setOriginatingClientConnection:v9];
    os_unfair_lock_lock(p_lock);
    cancellableCapabilitiesRequestOperations = self->_cancellableCapabilitiesRequestOperations;
    if (!cancellableCapabilitiesRequestOperations)
    {
      int v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      id v12 = self->_cancellableCapabilitiesRequestOperations;
      self->_cancellableCapabilitiesRequestOperations = v11;

      cancellableCapabilitiesRequestOperations = self->_cancellableCapabilitiesRequestOperations;
    }
    [(NSMutableArray *)cancellableCapabilitiesRequestOperations addObject:v8];
    os_unfair_lock_unlock(p_lock);
  }
  objc_initWeak(&location, v8);
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_10004531C;
  id v17 = &unk_1001BA648;
  objc_copyWeak(v19, &location);
  char v18 = self;
  v19[1] = (id)a3;
  [(ICDCloudServiceCapabilitiesRequestOperation *)v8 setCompletionHandler:&v14];
  uint64_t v13 = +[NSOperationQueue ic_sharedRequestOperationQueueWithQualityOfService:](NSOperationQueue, "ic_sharedRequestOperationQueueWithQualityOfService:", 25, v14, v15, v16, v17);
  [v13 addOperation:v8];

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

- (void)_refreshCloudServiceStatus
{
  os_unfair_lock_assert_not_owner(&self->_lock);
  [(ICDCloudServiceStatusMonitor *)self _refreshCapabilitiesWithPrivacyAcknowledgementPolicy:0];
  [(ICDCloudServiceStatusMonitor *)self _refreshStorefrontIdentifier];

  [(ICDCloudServiceStatusMonitor *)self _refreshStorefrontCountryCode];
}

- (void)_notifyObserversForActiveUserIdentityChanged
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v4 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Notifying observers of active account changed.", buf, 0xCu);
  }

  os_unfair_lock_lock(p_lock);
  id v5 = [(NSMutableDictionary *)self->_activeObservationTokenToClientConnectionMapping copy];
  os_unfair_lock_unlock(p_lock);
  id v6 = [v5 count];
  id v7 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = "s";
    *(_DWORD *)buf = 138543874;
    int v11 = self;
    if (v6 == (id)1) {
      id v8 = "";
    }
    __int16 v12 = 2048;
    id v13 = v6;
    __int16 v14 = 2080;
    uint64_t v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Active account did change. About to notify %llu observer%s.", buf, 0x20u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000455B8;
  v9[3] = &unk_1001BA620;
  v9[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];
}

- (void)_endObservingCloudServiceStatus
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = ICActiveUserIdentityDidChangeNotification;
  id v5 = +[ICUserIdentityStore defaultIdentityStore];
  [v3 removeObserver:self name:v4 object:v5];

  uint64_t v6 = ICUserIdentityStoreDidChangeNotification;
  id v7 = +[ICUserIdentityStore defaultIdentityStore];
  [v3 removeObserver:self name:v6 object:v7];

  uint64_t v8 = ICUserIdentityStoreLocalStoreAccountPropertiesDidChangeNotification;
  id v9 = +[ICUserIdentityStore defaultIdentityStore];
  [v3 removeObserver:self name:v8 object:v9];

  if (self->_bagObservationToken)
  {
    id v10 = +[ICURLBagMonitor sharedBagMonitor];
    [v10 endObservingBagWithToken:self->_bagObservationToken];

    bagObservationToken = self->_bagObservationToken;
    self->_bagObservationToken = 0;
  }
  if (self->_subscriptionStatusObservationToken)
  {
    __int16 v12 = +[ICUserIdentity autoupdatingActiveAccount];
    id v13 = +[ICMusicSubscriptionStatusMonitor sharedMonitorForIdentity:v12];

    [v13 endObservingSubscriptionStatusWithToken:self->_subscriptionStatusObservationToken];
    subscriptionStatusObservationToken = self->_subscriptionStatusObservationToken;
    self->_subscriptionStatusObservationToken = 0;
  }
  self->_capabilities = 0;
  self->_hasValidCapabilities = 0;
  self->_privilegedCapabilities = 0;
  self->_hasValidPrivilegedCapabilities = 0;
  storefrontCountryCode = self->_storefrontCountryCode;
  self->_storefrontCountryCode = 0;

  storefrontIdentifier = self->_storefrontIdentifier;
  self->_storefrontIdentifier = 0;

  id v17 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543362;
    v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopped observing cloud service status.", (uint8_t *)&v18, 0xCu);
  }
}

- (void)_beginObservingCloudServiceStatus
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning to observe cloud service status.", buf, 0xCu);
  }

  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  id v5 = +[ICUserIdentityStore defaultIdentityStore];
  [v4 addObserver:self selector:"_handleActiveUserIdentityDidChangeNotification:" name:ICActiveUserIdentityDidChangeNotification object:v5];

  uint64_t v6 = +[ICUserIdentityStore defaultIdentityStore];
  [v4 addObserver:self selector:"_handleUserIdentityStoreDidChangeNotification:" name:ICUserIdentityStoreDidChangeNotification object:v6];

  id v7 = +[ICUserIdentityStore defaultIdentityStore];
  [v4 addObserver:self selector:"_handleUserIdentityStoreLocalStoreAccountPropertiesDidChangeNotification:" name:ICUserIdentityStoreLocalStoreAccountPropertiesDidChangeNotification object:v7];

  objc_initWeak((id *)buf, self);
  uint64_t v8 = +[ICURLBagMonitor sharedBagMonitor];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100045D3C;
  v17[3] = &unk_1001BA5D0;
  objc_copyWeak(&v18, (id *)buf);
  id v9 = [v8 beginObservingBagWithHandler:v17];
  bagObservationToken = self->_bagObservationToken;
  self->_bagObservationToken = v9;

  int v11 = +[ICUserIdentity autoupdatingActiveAccount];
  __int16 v12 = +[ICMusicSubscriptionStatusMonitor sharedMonitorForIdentity:v11];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100045D98;
  v15[3] = &unk_1001BA5F8;
  objc_copyWeak(&v16, (id *)buf);
  id v13 = [v12 beginObservingSubscriptionStatusWithHandler:v15];
  subscriptionStatusObservationToken = self->_subscriptionStatusObservationToken;
  self->_subscriptionStatusObservationToken = v13;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (void)_handleUpdatedSubscriptionStatus:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Subscription status was updated: %{public}@.", (uint8_t *)&v6, 0x16u);
  }

  [(ICDCloudServiceStatusMonitor *)self _refreshCapabilitiesWithPrivacyAcknowledgementPolicy:0];
}

- (void)_handleUpdatedBag:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Bag was updated: %{public}@.", (uint8_t *)&v6, 0x16u);
  }

  [(ICDCloudServiceStatusMonitor *)self _updateWithBag:v4 error:0];
  [(ICDCloudServiceStatusMonitor *)self _refreshCapabilitiesWithPrivacyAcknowledgementPolicy:0];
}

- (void)_handleUserIdentityStoreLocalStoreAccountPropertiesDidChangeNotification:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 name];
    int v16 = 138543618;
    id v17 = self;
    __int16 v18 = 2114;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling %{public}@.", (uint8_t *)&v16, 0x16u);
  }
  id v7 = +[ICUserIdentityStore defaultIdentityStore];
  __int16 v8 = [v7 localStoreAccountProperties];

  id v9 = [v8 propertyListRepresentation];
  id v10 = +[ICDefaults standardDefaults];
  id v11 = [v10 lastKnownLocalStoreAccountProperties];
  if (v9 == v11)
  {
  }
  else
  {
    __int16 v12 = v11;
    unsigned __int8 v13 = [v9 isEqual:v11];

    if ((v13 & 1) == 0)
    {
      __int16 v14 = +[ICDefaults standardDefaults];
      uint64_t v15 = [v8 propertyListRepresentation];
      [v14 setLastKnownLocalStoreAccountProperties:v15];

      [(ICDCloudServiceStatusMonitor *)self _refreshStorefrontIdentifier];
    }
  }
}

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 name];
    int v7 = 138543618;
    __int16 v8 = self;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling %{public}@.", (uint8_t *)&v7, 0x16u);
  }
  [(ICDCloudServiceStatusMonitor *)self _refreshStorefrontIdentifier];
}

- (void)_handleActiveUserIdentityDidChangeNotification:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 name];
    int v7 = 138543618;
    __int16 v8 = self;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling %{public}@.", (uint8_t *)&v7, 0x16u);
  }
  [(ICDCloudServiceStatusMonitor *)self _notifyObserversForActiveUserIdentityChanged];
  [(ICDCloudServiceStatusMonitor *)self _refreshCapabilitiesWithPrivacyAcknowledgementPolicy:0];
}

- (void)_handleClientConnectionSevered:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  cancellableCapabilitiesRequestOperations = self->_cancellableCapabilitiesRequestOperations;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000466F8;
  v20[3] = &unk_1001BA588;
  id v6 = v4;
  id v21 = v6;
  id v22 = buf;
  [(NSMutableArray *)cancellableCapabilitiesRequestOperations enumerateObjectsUsingBlock:v20];
  if (*(void *)(*(void *)&buf[8] + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v7 = 0;
  }
  else
  {
    int v7 = -[NSMutableArray objectAtIndex:](self->_cancellableCapabilitiesRequestOperations, "objectAtIndex:");
    [(NSMutableArray *)self->_cancellableCapabilitiesRequestOperations removeObjectAtIndex:*(void *)(*(void *)&buf[8] + 24)];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  __int16 v8 = self->_activeObservationTokenToClientConnectionMapping;
  id v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        __int16 v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unsigned __int8 v13 = -[NSMutableDictionary objectForKey:](self->_activeObservationTokenToClientConnectionMapping, "objectForKey:", v12, (void)v16);
        if ([v13 isEqual:v6])
        {
          id v9 = v12;

          goto LABEL_14;
        }
      }
      id v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v16 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  _Block_object_dispose(buf, 8);
  os_unfair_lock_unlock(&self->_lock);
  if (v7)
  {
    __int16 v14 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v25 = (uint64_t)v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Found capabilities request operation for severed client connection %{public}@: %{public}@. Cancelling that operation.", buf, 0x20u);
    }

    [v7 cancel];
  }
  if (v9)
  {
    uint64_t v15 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v25 = (uint64_t)v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Found observation token for severed client connection %{public}@: %{public}@. Forcibly ending observing cloud service status for this observation token.", buf, 0x20u);
    }

    [(ICDCloudServiceStatusMonitor *)self endObservingCloudServiceStatusWithToken:v9 completionHandler:&stru_1001BA5A8];
  }
}

- (void)_handleClientConnectionInvalidated:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    int v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Client connection was invalidated: %{public}@.", (uint8_t *)&v6, 0x16u);
  }

  [(ICDCloudServiceStatusMonitor *)self _handleClientConnectionSevered:v4];
}

- (void)_handleClientConnectionInterrupted:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    int v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Client connection was interrupted: %{public}@.", (uint8_t *)&v6, 0x16u);
  }

  [(ICDCloudServiceStatusMonitor *)self _handleClientConnectionSevered:v4];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  unsigned int v8 = objc_msgSend(v7, "icd_isConnectionAllowedForService:", 4);
  if (v8)
  {
    [v7 setExportedObject:self];
    id v9 = +[ICCloudServiceStatusRemoteMonitoring serviceInterface];
    [v7 setExportedInterface:v9];

    uint64_t v10 = +[ICCloudServiceStatusRemoteMonitoring clientInterface];
    [v7 setRemoteObjectInterface:v10];

    objc_initWeak(&location, self);
    objc_initWeak(&from, v7);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    id v19[2] = sub_100046C14;
    v19[3] = &unk_1001BA560;
    objc_copyWeak(&v20, &location);
    objc_copyWeak(&v21, &from);
    [v7 setInterruptionHandler:v19];
    unsigned __int8 v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    uint64_t v15 = sub_100046C7C;
    long long v16 = &unk_1001BA560;
    objc_copyWeak(&v17, &location);
    objc_copyWeak(&v18, &from);
    [v7 setInvalidationHandler:&v13];
    objc_msgSend(v7, "resume", v13, v14, v15, v16);
    id v11 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = self;
      __int16 v26 = 2114;
      id v27 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Accepted new client connection: %{public}@.", buf, 0x16u);
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)requestMusicKitTokensWithOptions:(unint64_t)a3 clientInfo:(id)a4 completionHandler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v11 = +[NSXPCConnection currentConnection];
  if ([(id)objc_opt_class() _isClientAllowedToRequestRestrictedInformationForConnection:v11])
  {
    id v23 = 0;
    uint64_t v12 = [(id)objc_opt_class() _requestingBundleIdentifierForOriginatingClientConnection:v11 clientInfo:v9 error:&v23];
    uint64_t v13 = (uint64_t)v23;
    if (v12 | v13)
    {
      if (v12)
      {
        uint64_t v14 = [(id)objc_opt_class() _clientInfoForDeveloperTokenRequestWithRequestingApplicationBundleIdentifier:v12];
        id v15 = [objc_alloc((Class)ICDeveloperTokenFetchRequest) initWithClientInfo:v14 options:a3 & 1];
        [v15 setClientType:1];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        id v19[2] = sub_100046FD4;
        v19[3] = &unk_1001BA538;
        id v21 = v10;
        void v19[4] = self;
        id v20 = (id)v12;
        unint64_t v22 = a3;
        [v15 performRequestWithResponseHandler:v19];

LABEL_10:
        goto LABEL_11;
      }
    }
    else
    {
      id v18 = +[NSAssertionHandler currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"ICDCloudServiceStatusMonitor.m" lineNumber:336 description:@"Both requestingApplicationBundleIdentifier and error are nil. This is unexpected."];
    }
    (*((void (**)(id, void, uint64_t))v10 + 2))(v10, 0, v13);
    goto LABEL_10;
  }
  uint64_t v13 = +[NSError msv_errorWithDomain:ICErrorDomain code:-7009 debugDescription:@"Client is not allowed to request MusicKit tokens."];
  long long v16 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = objc_msgSend((id)v13, "msv_description");
    *(_DWORD *)buf = 138543874;
    uint64_t v25 = self;
    __int16 v26 = 2114;
    id v27 = v17;
    __int16 v28 = 2114;
    id v29 = v11;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ originatingClientConnection = %{public}@.", buf, 0x20u);
  }
  (*((void (**)(id, void, uint64_t))v10 + 2))(v10, 0, v13);
LABEL_11:
}

- (void)requestUserTokenForDeveloperToken:(id)a3 options:(unint64_t)a4 clientInfo:(id)a5 completionHandler:(id)a6
{
  char v8 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  os_unfair_lock_assert_not_owner(&self->_lock);
  uint64_t v14 = +[NSXPCConnection currentConnection];
  if ([(id)objc_opt_class() _isClientAllowedToRequestRestrictedInformationForConnection:v14])
  {
    id v24 = 0;
    uint64_t v15 = [(id)objc_opt_class() _requestingBundleIdentifierForOriginatingClientConnection:v14 clientInfo:v12 error:&v24];
    uint64_t v16 = (uint64_t)v24;
    if (v15 | v16)
    {
      if (v15)
      {
        id v17 = [(id)objc_opt_class() _clientInfoForUserTokenRequestWithRequestingApplicationBundleIdentifier:v15];
        id v18 = [objc_alloc((Class)ICMusicUserTokenFetchRequest) initWithDeveloperToken:v11 clientInfo:v17 options:v8 & 1];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100047520;
        v22[3] = &unk_1001BA4E8;
        id v23 = v13;
        [v18 performRequestWithResponseHandler:v22];

LABEL_10:
        goto LABEL_11;
      }
    }
    else
    {
      id v21 = +[NSAssertionHandler currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"ICDCloudServiceStatusMonitor.m" lineNumber:306 description:@"Both requestingApplicationBundleIdentifier and error are nil. This is unexpected."];
    }
    (*((void (**)(id, void, uint64_t))v13 + 2))(v13, 0, v16);
    goto LABEL_10;
  }
  uint64_t v16 = +[NSError msv_errorWithDomain:ICErrorDomain code:-7009 debugDescription:@"Client is not allowed to request user token."];
  long long v19 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = objc_msgSend((id)v16, "msv_description");
    *(_DWORD *)buf = 138543874;
    __int16 v26 = self;
    __int16 v27 = 2114;
    __int16 v28 = v20;
    __int16 v29 = 2114;
    id v30 = v14;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ originatingClientConnection = %{public}@.", buf, 0x20u);
  }
  (*((void (**)(id, void, uint64_t))v13 + 2))(v13, 0, v16);
LABEL_11:
}

- (void)requestDeveloperTokenWithOptions:(unint64_t)a3 clientInfo:(id)a4 completionHandler:(id)a5
{
  char v6 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v11 = +[NSXPCConnection currentConnection];
  if ([(id)objc_opt_class() _isClientAllowedToRequestRestrictedInformationForConnection:v11])
  {
    id v21 = 0;
    uint64_t v12 = [(id)objc_opt_class() _requestingBundleIdentifierForOriginatingClientConnection:v11 clientInfo:v9 error:&v21];
    uint64_t v13 = (uint64_t)v21;
    if (v12 | v13)
    {
      if (v12)
      {
        uint64_t v14 = [(id)objc_opt_class() _clientInfoForDeveloperTokenRequestWithRequestingApplicationBundleIdentifier:v12];
        id v15 = [objc_alloc((Class)ICDeveloperTokenFetchRequest) initWithClientInfo:v14 options:v6 & 1];
        [v15 setClientType:1];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        id v19[2] = sub_100047800;
        v19[3] = &unk_1001BA4E8;
        id v20 = v10;
        [v15 performRequestWithResponseHandler:v19];

LABEL_10:
        goto LABEL_11;
      }
    }
    else
    {
      id v18 = +[NSAssertionHandler currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"ICDCloudServiceStatusMonitor.m" lineNumber:275 description:@"Both requestingApplicationBundleIdentifier and error are nil. This is unexpected."];
    }
    (*((void (**)(id, void, uint64_t))v10 + 2))(v10, 0, v13);
    goto LABEL_10;
  }
  uint64_t v13 = +[NSError msv_errorWithDomain:ICErrorDomain code:-7009 debugDescription:@"Client is not allowed to request developer token."];
  uint64_t v16 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = objc_msgSend((id)v13, "msv_description");
    *(_DWORD *)buf = 138543874;
    id v23 = self;
    __int16 v24 = 2114;
    uint64_t v25 = v17;
    __int16 v26 = 2114;
    __int16 v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ originatingClientConnection = %{public}@.", buf, 0x20u);
  }
  (*((void (**)(id, void, uint64_t))v10 + 2))(v10, 0, v13);
LABEL_11:
}

- (void)requestStorefrontIdentifierWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, NSString *, void))a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v5 = +[NSXPCConnection currentConnection];
  if ([(id)objc_opt_class() _isClientAllowedToRequestRestrictedInformationForConnection:v5])
  {
    os_unfair_lock_lock(&self->_lock);
    char v6 = self->_storefrontIdentifier;
    if (v6)
    {
      os_unfair_lock_unlock(&self->_lock);
      v4[2](v4, v6, 0);
    }
    else
    {
      storefrontIdentifierRequestCompletionHandlers = self->_storefrontIdentifierRequestCompletionHandlers;
      if (!storefrontIdentifierRequestCompletionHandlers)
      {
        id v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        uint64_t v12 = self->_storefrontIdentifierRequestCompletionHandlers;
        self->_storefrontIdentifierRequestCompletionHandlers = v11;

        storefrontIdentifierRequestCompletionHandlers = self->_storefrontIdentifierRequestCompletionHandlers;
      }
      uint64_t v13 = objc_retainBlock(v4);
      [(NSMutableArray *)storefrontIdentifierRequestCompletionHandlers addObject:v13];

      os_unfair_lock_unlock(&self->_lock);
      [(ICDCloudServiceStatusMonitor *)self _refreshStorefrontIdentifier];
    }
  }
  else
  {
    id v7 = +[NSError msv_errorWithDomain:ICErrorDomain code:-7009 debugDescription:@"Client is not allowed to request storefront identifier."];
    char v8 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_msgSend(v7, "msv_description");
      int v14 = 138543874;
      id v15 = self;
      __int16 v16 = 2114;
      id v17 = v9;
      __int16 v18 = 2114;
      long long v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ originatingClientConnection = %{public}@.", (uint8_t *)&v14, 0x20u);
    }
    ((void (**)(id, NSString *, void *))v4)[2](v4, 0, v7);
  }
}

- (void)requestStorefrontCountryCodeWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, NSString *, void))a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v5 = +[NSXPCConnection currentConnection];
  if ([(id)objc_opt_class() _isClientAllowedToRequestRestrictedInformationForConnection:v5])
  {
    os_unfair_lock_lock(&self->_lock);
    char v6 = self->_storefrontCountryCode;
    if (v6)
    {
      os_unfair_lock_unlock(&self->_lock);
      v4[2](v4, v6, 0);
    }
    else
    {
      storefrontCountryCodeRequestCompletionHandlers = self->_storefrontCountryCodeRequestCompletionHandlers;
      if (!storefrontCountryCodeRequestCompletionHandlers)
      {
        id v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        uint64_t v12 = self->_storefrontCountryCodeRequestCompletionHandlers;
        self->_storefrontCountryCodeRequestCompletionHandlers = v11;

        storefrontCountryCodeRequestCompletionHandlers = self->_storefrontCountryCodeRequestCompletionHandlers;
      }
      uint64_t v13 = objc_retainBlock(v4);
      [(NSMutableArray *)storefrontCountryCodeRequestCompletionHandlers addObject:v13];

      os_unfair_lock_unlock(&self->_lock);
      [(ICDCloudServiceStatusMonitor *)self _refreshStorefrontCountryCode];
    }
  }
  else
  {
    id v7 = +[NSError msv_errorWithDomain:ICErrorDomain code:-7009 debugDescription:@"Client is not allowed to request storefront country code."];
    char v8 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_msgSend(v7, "msv_description");
      int v14 = 138543874;
      id v15 = self;
      __int16 v16 = 2114;
      id v17 = v9;
      __int16 v18 = 2114;
      long long v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ originatingClientConnection = %{public}@.", (uint8_t *)&v14, 0x20u);
    }
    ((void (**)(id, NSString *, void *))v4)[2](v4, 0, v7);
  }
}

- (void)requestCapabilitiesWithPrivacyPromptPolicy:(int64_t)a3 completionHandler:(id)a4
{
  char v6 = (void (**)(id, uint64_t, void))a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  char v8 = +[NSXPCConnection currentConnection];
  if ([(id)objc_opt_class() _isClientAllowedToRequestCapabilitiesForConnection:v8])
  {
    uint64_t v9 = a3 == 1;
    unsigned int v10 = [(id)objc_opt_class() _shouldBypassEnforcementOfPrivacyAcknowledgementForClientConnection:v8 forIncomingCloudServiceCapabilitiesRequest:1];
    if (v10) {
      uint64_t v9 = 2;
    }
    os_unfair_lock_lock(&self->_lock);
    if (v10)
    {
      if (self->_hasValidPrivilegedCapabilities)
      {
        uint64_t v11 = 48;
LABEL_12:
        uint64_t v15 = *(uint64_t *)((char *)&self->super.isa + v11);
        os_unfair_lock_unlock(p_lock);
        v6[2](v6, v15, 0);
        goto LABEL_16;
      }
    }
    else if (self->_hasValidCapabilities)
    {
      uint64_t v11 = 24;
      goto LABEL_12;
    }
    __int16 v16 = objc_alloc_init(ICDCloudServiceCapabilitiesRequestContext);
    [(ICDCloudServiceCapabilitiesRequestContext *)v16 setCompletionHandler:v6];
    [(ICDCloudServiceCapabilitiesRequestContext *)v16 setPrivacyAcknowledgementPolicy:v9];
    capabilitiesRequestContexts = self->_capabilitiesRequestContexts;
    if (!capabilitiesRequestContexts)
    {
      __int16 v18 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      long long v19 = self->_capabilitiesRequestContexts;
      self->_capabilitiesRequestContexts = v18;

      capabilitiesRequestContexts = self->_capabilitiesRequestContexts;
    }
    [(NSMutableArray *)capabilitiesRequestContexts addObject:v16];

    os_unfair_lock_unlock(&self->_lock);
    [(ICDCloudServiceStatusMonitor *)self _refreshCapabilitiesWithPrivacyAcknowledgementPolicy:v9];
  }
  else
  {
    uint64_t v12 = +[NSError msv_errorWithDomain:ICErrorDomain code:-7009 debugDescription:@"Client is not allowed to request cloud service capabilities."];
    uint64_t v13 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = objc_msgSend(v12, "msv_description");
      int v20 = 138543874;
      id v21 = self;
      __int16 v22 = 2114;
      id v23 = v14;
      __int16 v24 = 2114;
      uint64_t v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ originatingClientConnection = %{public}@.", (uint8_t *)&v20, 0x20u);
    }
    ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v12);
  }
LABEL_16:
}

- (void)endObservingCloudServiceStatusWithToken:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  char v8 = [(NSMutableDictionary *)self->_activeObservationTokenToClientConnectionMapping objectForKey:v6];

  if (v8)
  {
    [(NSMutableDictionary *)self->_activeObservationTokenToClientConnectionMapping removeObjectForKey:v6];
    id v9 = [(NSMutableDictionary *)self->_activeObservationTokenToClientConnectionMapping count];
    unsigned int v10 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      uint64_t v13 = self;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Removed cloud service status observer with token: %{public}@.", (uint8_t *)&v12, 0x16u);
    }

    if (!v9) {
      [(ICDCloudServiceStatusMonitor *)self _endObservingCloudServiceStatus];
    }
  }
  else
  {
    uint64_t v11 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      uint64_t v13 = self;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Tried to remove unknown cloud service status observer with token: %{public}@. Ignoring.", (uint8_t *)&v12, 0x16u);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  v7[2](v7);
}

- (void)beginObservingCloudServiceStatusWithCompletionHandler:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = (void (**)(id, void *))a3;
  os_unfair_lock_assert_not_owner(p_lock);
  id v6 = +[NSUUID UUID];
  id v7 = +[NSXPCConnection currentConnection];
  os_unfair_lock_lock(p_lock);
  [(NSMutableDictionary *)self->_activeObservationTokenToClientConnectionMapping setObject:v7 forKey:v6];
  id v8 = [(NSMutableDictionary *)self->_activeObservationTokenToClientConnectionMapping count];
  id v9 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Registered new cloud service status observer with token: %{public}@.", (uint8_t *)&v10, 0x16u);
  }

  if (v8 == (id)1)
  {
    [(ICDCloudServiceStatusMonitor *)self _beginObservingCloudServiceStatus];
    os_unfair_lock_unlock(p_lock);
    [(ICDCloudServiceStatusMonitor *)self _refreshCloudServiceStatus];
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
  v5[2](v5, v6);
}

- (void)dealloc
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  [(ICDCloudServiceStatusMonitor *)self _endObservingCloudServiceStatus];
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)ICDCloudServiceStatusMonitor;
  [(ICDCloudServiceStatusMonitor *)&v4 dealloc];
}

- (ICDCloudServiceStatusMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICDCloudServiceStatusMonitor;
  v2 = [(ICDCloudServiceStatusMonitor *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    activeObservationTokenToClientConnectionMapping = v2->_activeObservationTokenToClientConnectionMapping;
    v2->_activeObservationTokenToClientConnectionMapping = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (id)_requestingBundleIdentifierForOriginatingClientConnection:(id)a3 clientInfo:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v39 = 0u;
  long long v40 = 0u;
  if (v8) {
    [v8 auditToken];
  }
  *(_OWORD *)buf = v39;
  *(_OWORD *)&buf[16] = v40;
  int v10 = MSVBundleIDForAuditToken();
  if (!v10)
  {
    int v10 = [v9 bundleIdentifier];
    if (v10)
    {
      uint64_t v11 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v9;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&unsigned char buf[24] = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to retrieve bundle identifier of the requesting application from the audit_token_t; instead"
          ", using bundle identifier from %{public}@, i.e. %{public}@.",
          buf,
          0x20u);
      }
    }
  }
  id v38 = 0;
  *(_OWORD *)buf = v39;
  *(_OWORD *)&buf[16] = v40;
  __int16 v12 = +[LSBundleRecord bundleRecordForAuditToken:buf error:&v38];
  id v13 = v38;
  if (v13)
  {
    __int16 v14 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_msgSend(v13, "msv_description");
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve bundle extension record with error: %{public}@.", buf, 0x16u);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_23;
    }
    __int16 v14 = v12;
    __int16 v16 = [v14 containingBundleRecord];
    objc_opt_class();
    os_log_type_t v36 = v16;
    id v37 = a1;
    if (objc_opt_isKindOfClass())
    {
      id v17 = v16;
    }
    else
    {
      __int16 v18 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        long long v19 = (objc_class *)objc_opt_class();
        int v20 = NSStringFromClass(v19);
        id v21 = (objc_class *)objc_opt_class();
        uint64_t v22 = NSStringFromClass(v21);
        *(_DWORD *)buf = 138544386;
        *(void *)&uint8_t buf[4] = v37;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&unsigned char buf[24] = v20;
        __int16 v42 = 2114;
        unint64_t v43 = v36;
        __int16 v44 = 2114;
        uint64_t v45 = v22;
        id v23 = (void *)v22;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@: Requesting application extension %{public}@ (%{public}@) has a containing bundle which is not an application: %{public}@ (%{public}@).", buf, 0x34u);
      }
      id v17 = 0;
    }
    __int16 v24 = [v17 bundleIdentifier];
    if (v24)
    {
      uint64_t v25 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v26 = (objc_class *)objc_opt_class();
        id v35 = NSStringFromClass(v26);
        __int16 v27 = (objc_class *)objc_opt_class();
        id v34 = NSStringFromClass(v27);
        *(_DWORD *)buf = 138544642;
        *(void *)&uint8_t buf[4] = v37;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&unsigned char buf[24] = v35;
        __int16 v42 = 2114;
        unint64_t v43 = v24;
        __int16 v44 = 2114;
        uint64_t v45 = (uint64_t)v17;
        __int16 v46 = 2114;
        long long v47 = v34;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Client is an application extension: %{public}@ (%{public}@). Using bundle identifier \"%{public}@\" from containing application: %{public}@ (%{public}@).", buf, 0x3Eu);
      }
      id v28 = v24;

      int v10 = v28;
    }

    a1 = v37;
  }

LABEL_23:
  if (v10)
  {
    __int16 v29 = 0;
    if (!a5) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  __int16 v29 = +[NSError msv_errorWithDomain:ICErrorDomain, -7009, @"Failed to retrieve bundle identifier of the requesting application. The requesting application is likely missing the \"%@\" entitlement.", @"application-identifier" code debugDescription];
  id v32 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    id v33 = objc_msgSend(v29, "msv_description");
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v33;
    *(_WORD *)&buf[22] = 2114;
    *(void *)&unsigned char buf[24] = v8;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ originatingClientConnection = %{public}@.", buf, 0x20u);
  }
  if (a5) {
LABEL_25:
  }
    *a5 = v29;
LABEL_26:
  id v30 = v10;

  return v30;
}

+ (id)_clientInfoForUserTokenRequestWithRequestingApplicationBundleIdentifier:(id)a3
{
  return +[ICClientInfo _clientInfoForCloudDaemonOriginatedMusicKitRequestWithRequestingBundleIdentifier:a3];
}

+ (id)_clientInfoForDeveloperTokenRequestWithRequestingApplicationBundleIdentifier:(id)a3
{
  return +[ICClientInfo clientInfoForMusicKitRequestWithClientIdentifier:a3 clientVersion:@"1" bundleIdentifier:a3];
}

+ (BOOL)_shouldBypassEnforcementOfPrivacyAcknowledgementForClientConnection:(id)a3 forIncomingCloudServiceCapabilitiesRequest:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v6 = [a3 valueForEntitlement:@"com.apple.itunesstored.privacy-acknowledged"];
  if (objc_opt_respondsToSelector())
  {
    unsigned int v7 = [v6 BOOLValue];
    if (v7 && v4)
    {
      id v8 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543618;
        id v11 = a1;
        __int16 v12 = 2114;
        CFStringRef v13 = @"com.apple.itunesstored.privacy-acknowledged";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Client has %{public}@ entitlement. No need to enforce privacy acknowledgement for cloud service capabilities request.", (uint8_t *)&v10, 0x16u);
      }

      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (BOOL)_isClientAllowedToRequestRestrictedInformationForConnection:(id)a3
{
  return _objc_msgSend(a3, "icd_isConnectionAllowedForService:validationReason:", 3, 1);
}

+ (BOOL)_isClientAllowedToRequestCapabilitiesForConnection:(id)a3
{
  return _objc_msgSend(a3, "icd_isConnectionAllowedForService:validationReason:", 4, 1);
}

@end