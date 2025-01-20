@interface ICLiveLinkQRConnectionDataSource
+ (id)dataSourceForExistingSharedListeningSession:(id)a3 identity:(id)a4;
+ (id)dataSourceForNewSharedListeningSessionWithIdentity:(id)a3;
- (ICLiveLinkQRConnectionDataSource)initWithSharedListeningSessionIdentifier:(id)a3 identity:(id)a4;
- (ICSharedListeningConnectionReport)report;
- (IDSAccount)account;
- (IDSPseudonym)pseudonym;
- (IDSService)service;
- (MSVTimer)pseudonymRenewalTimer;
- (NSDictionary)groupSessionOptions;
- (NSString)applicationProtocol;
- (NSString)externalIdentifier;
- (NSString)pluginIdentifier;
- (NSString)rpcPath;
- (NSString)sharedListeningSessionIdentifier;
- (NSString)sharedSessionToken;
- (NSURL)sharedListeningSessionInviteURL;
- (NSUUID)groupSessionIdentifier;
- (OS_dispatch_queue)queue;
- (id)dataSourceErrorHandler;
- (id)sessionURLForBag:(id)a3 error:(id *)a4;
- (id)trustHandler;
- (void)_beginPseudonymAutoRenewal;
- (void)_joinSharedListeningSessionWithCompletion:(id)a3;
- (void)_provisionUserPseudonymWithCompletion:(id)a3;
- (void)_renewUserPseudonym;
- (void)_revokeUserPseudonymWithCompletion:(id)a3;
- (void)dealloc;
- (void)populateWithCompletion:(id)a3;
- (void)setAccount:(id)a3;
- (void)setDataSourceErrorHandler:(id)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setGroupSessionIdentifier:(id)a3;
- (void)setGroupSessionOptions:(id)a3;
- (void)setPseudonym:(id)a3;
- (void)setPseudonymRenewalTimer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReport:(id)a3;
- (void)setService:(id)a3;
- (void)setSharedListeningSessionIdentifier:(id)a3;
- (void)setSharedListeningSessionInviteURL:(id)a3;
- (void)setSharedSessionToken:(id)a3;
@end

@implementation ICLiveLinkQRConnectionDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pseudonymRenewalTimer, 0);
  objc_storeStrong((id *)&self->_pseudonym, 0);
  objc_storeStrong(&self->_dataSourceErrorHandler, 0);
  objc_destroyWeak((id *)&self->_report);
  objc_storeStrong((id *)&self->_sharedSessionToken, 0);
  objc_storeStrong((id *)&self->_sharedListeningSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedListeningSessionInviteURL, 0);
  objc_storeStrong((id *)&self->_groupSessionOptions, 0);
  objc_storeStrong((id *)&self->_groupSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

- (void)setExternalIdentifier:(id)a3
{
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setPseudonymRenewalTimer:(id)a3
{
}

- (MSVTimer)pseudonymRenewalTimer
{
  return self->_pseudonymRenewalTimer;
}

- (void)setPseudonym:(id)a3
{
}

- (IDSPseudonym)pseudonym
{
  return self->_pseudonym;
}

- (void)setDataSourceErrorHandler:(id)a3
{
}

- (id)dataSourceErrorHandler
{
  return self->_dataSourceErrorHandler;
}

- (void)setReport:(id)a3
{
}

- (ICSharedListeningConnectionReport)report
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_report);

  return (ICSharedListeningConnectionReport *)WeakRetained;
}

- (void)setSharedSessionToken:(id)a3
{
}

- (NSString)sharedSessionToken
{
  return self->_sharedSessionToken;
}

- (void)setSharedListeningSessionIdentifier:(id)a3
{
}

- (NSString)sharedListeningSessionIdentifier
{
  return self->_sharedListeningSessionIdentifier;
}

- (void)setSharedListeningSessionInviteURL:(id)a3
{
}

- (NSURL)sharedListeningSessionInviteURL
{
  return self->_sharedListeningSessionInviteURL;
}

- (void)setGroupSessionOptions:(id)a3
{
}

- (NSDictionary)groupSessionOptions
{
  return self->_groupSessionOptions;
}

- (void)setGroupSessionIdentifier:(id)a3
{
}

- (NSUUID)groupSessionIdentifier
{
  return self->_groupSessionIdentifier;
}

- (void)setAccount:(id)a3
{
}

- (void)setService:(id)a3
{
}

- (IDSService)service
{
  return self->_service;
}

- (id)trustHandler
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__ICLiveLinkQRConnectionDataSource_trustHandler__block_invoke;
  v4[3] = &unk_1E5ACB9C8;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x1A6240BF0](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

void __48__ICLiveLinkQRConnectionDataSource_trustHandler__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!MSVDeviceOSIsInternalInstall())
  {
    v16 = 0;
    v18 = @"music-colistening.itunes.apple.com";
LABEL_14:
    if ([(__CFString *)v16 isEqualToString:@"QA2"])
    {
      v10[2](v10, 1, 0);
    }
    else
    {
      uint64_t AppleSSLPinned = SecPolicyCreateAppleSSLPinned();
      if (AppleSSLPinned)
      {
        v20 = (const void *)AppleSSLPinned;
        v21 = sec_trust_copy_ref(v8);
        SecTrustSetPolicies(v21, v20);
        CFRelease(v20);
        result[0] = MEMORY[0x1E4F143A8];
        result[1] = 3221225472;
        result[2] = __48__ICLiveLinkQRConnectionDataSource_trustHandler__block_invoke_236;
        result[3] = &unk_1E5ACB9A0;
        v26 = v10;
        SecTrustEvaluateAsyncWithError(v21, v9, result);
      }
      else
      {
        v22 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          id v28 = WeakRetained;
          _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_ERROR, "[ICQRConnectionLLDS] <%p> Failed to create pinning policy.", buf, 0xCu);
        }

        v10[2](v10, 0, 0);
      }
    }
    goto LABEL_30;
  }
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobileipod"];
  uint64_t v13 = [v12 stringForKey:@"PotluckEnvironment"];
  v14 = (void *)v13;
  v15 = @"Default";
  if (v13) {
    v15 = (__CFString *)v13;
  }
  v16 = v15;

  v17 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218243;
    id v28 = WeakRetained;
    __int16 v29 = 2113;
    v30 = v16;
    _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Selected environment %{private}@.", buf, 0x16u);
  }

  if (([(__CFString *)v16 isEqualToString:@"Default"] & 1) != 0
    || ([(__CFString *)v16 isEqualToString:@"Production"] & 1) != 0
    || ([(__CFString *)v16 isEqualToString:@"Carry"] & 1) != 0
    || ([(__CFString *)v16 isEqualToString:@"QA2"] & 1) != 0)
  {
    v18 = @"music-colistening.itunes.apple.com";
  }
  else if ([(__CFString *)v16 isEqualToString:@"Sandbox"])
  {
    v18 = @"music-colistening-sandbox.itunes.apple.com";
  }
  else
  {
    if (![(__CFString *)v16 isEqualToString:@"Custom"])
    {
      v18 = 0;
      goto LABEL_27;
    }
    v18 = [v12 stringForKey:@"PotluckCustomHostName"];
    if (!v18) {
      goto LABEL_27;
    }
  }
  if ([(__CFString *)v18 length])
  {

    goto LABEL_14;
  }
LABEL_27:
  v23 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    id v28 = WeakRetained;
    _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_ERROR, "[ICQRConnectionLLDS] <%p> Cannot determine environment.", buf, 0xCu);
  }

  v24 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x1E4F77900], 300, @"Cannot determine environment.");
  ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v24);

LABEL_30:
}

uint64_t __48__ICLiveLinkQRConnectionDataSource_trustHandler__block_invoke_236(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)applicationProtocol
{
  return (NSString *)@"qrp-01";
}

- (NSString)rpcPath
{
  return (NSString *)@"/SharedListening/stream";
}

- (NSString)pluginIdentifier
{
  return (NSString *)@"SharedListening";
}

- (IDSAccount)account
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_account = &self->_account;
  account = self->_account;
  if (!account)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(ICLiveLinkQRConnectionDataSource *)self service];
    id v5 = [v4 accounts];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v10 accountType] == 1 && objc_msgSend(v10, "isActive"))
          {
            objc_storeStrong((id *)p_account, v10);
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    account = *p_account;
  }

  return account;
}

- (id)sessionURLForBag:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 dictionaryForBagKey:@"ampMusicAPIDomains"];
  if ((_NSIsNSDictionary() & 1) == 0)
  {
    v16 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v25 = self;
      _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_ERROR, "[ICQRConnectionLLDS] <%p> Missing music API domains.", buf, 0xCu);
    }

    if (a4)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F77900];
      v19 = @"Missing music API domains.";
LABEL_11:
      objc_msgSend(v17, "msv_errorWithDomain:code:debugDescription:", v18, 102, v19);
      long long v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
LABEL_21:
    long long v15 = 0;
    goto LABEL_24;
  }
  uint64_t v8 = [v7 objectForKeyedSubscript:@"sharedListening"];
  if (!v8)
  {
    uint64_t v8 = [v7 objectForKeyedSubscript:@"default"];
    if (!v8)
    {
      v22 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v25 = self;
        _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_ERROR, "[ICQRConnectionLLDS] <%p> Missing default music API domain.", buf, 0xCu);
      }

      if (a4)
      {
        uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v18 = *MEMORY[0x1E4F77900];
        v19 = @"Missing default music API domain.";
        goto LABEL_11;
      }
      goto LABEL_21;
    }
  }
  v9 = [v6 stringForBagKey:@"countryCode"];
  if (v9)
  {
    v10 = [(ICLiveLinkQRConnectionDataSource *)self sharedListeningSessionIdentifier];

    v11 = (void *)MEMORY[0x1E4F1CB10];
    long long v12 = NSString;
    if (v10)
    {
      long long v13 = [(ICLiveLinkQRConnectionDataSource *)self sharedListeningSessionIdentifier];
      long long v14 = [v12 stringWithFormat:@"https://%@/v1/shared-media/%@/join/media-sessions/%@", v8, v9, v13];
      long long v15 = [v11 URLWithString:v14];
    }
    else
    {
      v21 = [NSString stringWithFormat:@"https://%@/v1/shared-media/%@/create/media-sessions", v8, v9];
      long long v15 = [v11 URLWithString:v21];
    }
  }
  else
  {
    v20 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v25 = self;
      _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_ERROR, "[ICQRConnectionLLDS] <%p> bag is missing country code", buf, 0xCu);
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x1E4F77900], 102, @"Bag is missing country code.");
      long long v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v15 = 0;
    }
  }

LABEL_24:

  return v15;
}

- (void)_joinSharedListeningSessionWithCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICLiveLinkQRConnectionDataSource *)self sharedListeningSessionIdentifier];

  id v6 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = [(ICLiveLinkQRConnectionDataSource *)self sharedListeningSessionIdentifier];
      v9 = [(ICLiveLinkQRConnectionDataSource *)self pseudonym];
      v10 = [v9 URI];
      v11 = [v10 prefixedURI];
      *(_DWORD *)buf = 134218498;
      __int16 v29 = self;
      __int16 v30 = 2114;
      uint64_t v31 = v8;
      __int16 v32 = 2114;
      v33 = v11;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Joining shared listening session %{public}@ with handle %{public}@", buf, 0x20u);
    }
    long long v12 = @"Join Request";
  }
  else
  {
    if (v7)
    {
      long long v13 = [(ICLiveLinkQRConnectionDataSource *)self pseudonym];
      long long v14 = [v13 URI];
      long long v15 = [v14 prefixedURI];
      *(_DWORD *)buf = 134218242;
      __int16 v29 = self;
      __int16 v30 = 2114;
      uint64_t v31 = v15;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Creating shared listening session with handle %{public}@", buf, 0x16u);
    }
    long long v12 = @"Create Request";
  }

  v16 = [ICStoreRequestContext alloc];
  uint64_t v17 = +[ICUserIdentity activeAccount];
  uint64_t v18 = [(ICStoreRequestContext *)v16 initWithIdentity:v17];

  v19 = [(ICLiveLinkQRConnectionDataSource *)self report];
  [v19 startEvent:@"Get Bag" withParentEvent:@"Session Discovery"];
  v20 = +[ICURLBagProvider sharedBagProvider];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __78__ICLiveLinkQRConnectionDataSource__joinSharedListeningSessionWithCompletion___block_invoke;
  v23[3] = &unk_1E5ACCC08;
  id v24 = v19;
  v25 = self;
  uint64_t v26 = v12;
  id v27 = v4;
  id v21 = v4;
  id v22 = v19;
  [v20 getBagForRequestContext:v18 withCompletionHandler:v23];
}

void __78__ICLiveLinkQRConnectionDataSource__joinSharedListeningSessionWithCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [a1[4] endEvent:@"Get Bag" withError:v6];
  if (!v6)
  {
    id v9 = a1[5];
    id v49 = 0;
    v45 = [v9 sessionURLForBag:v5 error:&v49];
    id v10 = v49;
    if (v10)
    {
      (*((void (**)(void))a1[7] + 2))();
LABEL_22:

      goto LABEL_23;
    }
    v11 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = a1[5];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v45;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> resolved session discovery URL %{public}@", buf, 0x16u);
    }

    long long v13 = [MEMORY[0x1E4F18D50] requestWithURL:v45];
    [v13 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [v13 setHTTPMethod:@"POST"];
    v44 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v14 = [a1[5] pseudonym];
    long long v15 = [v14 URI];
    v16 = [v15 prefixedURI];
    [v44 setObject:v16 forKeyedSubscript:@"anonymousHandle"];

    uint64_t v17 = [a1[5] externalIdentifier];
    [v44 setObject:v17 forKeyedSubscript:@"externalParticipantId"];

    uint64_t v18 = (void *)MEMORY[0x1E4F28D90];
    v58 = @"parameters";
    v59 = v44;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    v20 = [v18 dataWithJSONObject:v19 options:0 error:0];
    [v13 setHTTPBody:v20];

    v43 = [[ICMusicKitRequestContext alloc] initWithBlock:&__block_literal_global_32912];
    id v21 = [[ICMusicKitURLRequest alloc] initWithURLRequest:v13 requestContext:v43];
    id v22 = [a1[5] sharedListeningSessionIdentifier];
    v23 = @"sharedListening/join";
    if (!v22) {
      v23 = @"sharedListening/create";
    }
    v42 = v23;

    [(ICURLRequest *)v21 enableLoadURLMetricsWithRequestName:v42];
    id v24 = [getMCProfileConnectionClass() sharedConnection];
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x2020000000;
    v25 = (void *)getMCFeatureExplicitContentAllowedSymbolLoc_ptr;
    uint64_t v53 = getMCFeatureExplicitContentAllowedSymbolLoc_ptr;
    if (!getMCFeatureExplicitContentAllowedSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getMCFeatureExplicitContentAllowedSymbolLoc_block_invoke;
      v61 = &unk_1E5ACD4F0;
      v62 = &v50;
      uint64_t v26 = ManagedConfigurationLibrary();
      id v27 = dlsym(v26, "MCFeatureExplicitContentAllowed");
      *(void *)(v62[1] + 24) = v27;
      getMCFeatureExplicitContentAllowedSymbolLoc_ptr = *(void *)(v62[1] + 24);
      v25 = (void *)v51[3];
    }
    _Block_object_dispose(&v50, 8);
    if (v25)
    {
      BOOL v28 = [v24 effectiveBoolValueForSetting:*v25] == 1;

      if (!v28)
      {
        v56 = @"itre";
        v57 = @"1";
        __int16 v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        [(ICMusicKitURLRequest *)v21 setAdditionalHTTPCookies:v29];
      }
      __int16 v30 = [getMCProfileConnectionClass() sharedConnection];
      uint64_t v50 = 0;
      v51 = &v50;
      uint64_t v52 = 0x2020000000;
      uint64_t v31 = (void *)getMCFeatureMusicVideosAllowedSymbolLoc_ptr;
      uint64_t v53 = getMCFeatureMusicVideosAllowedSymbolLoc_ptr;
      if (!getMCFeatureMusicVideosAllowedSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getMCFeatureMusicVideosAllowedSymbolLoc_block_invoke;
        v61 = &unk_1E5ACD4F0;
        v62 = &v50;
        __int16 v32 = ManagedConfigurationLibrary();
        v33 = dlsym(v32, "MCFeatureMusicVideosAllowed");
        *(void *)(v62[1] + 24) = v33;
        getMCFeatureMusicVideosAllowedSymbolLoc_ptr = *(void *)(v62[1] + 24);
        uint64_t v31 = (void *)v51[3];
      }
      _Block_object_dispose(&v50, 8);
      if (v31)
      {
        BOOL v34 = [v30 effectiveBoolValueForSetting:*v31] == 1;

        if (!v34)
        {
          v54 = @"itrv";
          v55 = @"1";
          v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
          [(ICMusicKitURLRequest *)v21 setAdditionalHTTPCookies:v35];
        }
        v36 = [a1[5] report];
        [v36 startEvent:a1[6] withParentEvent:@"Session Discovery"];

        v37 = +[ICURLSessionManager highPrioritySession];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __78__ICLiveLinkQRConnectionDataSource__joinSharedListeningSessionWithCompletion___block_invoke_2;
        v46[3] = &unk_1E5ACB978;
        v46[4] = a1[5];
        id v47 = a1[6];
        id v48 = a1[7];
        [v37 enqueueDataRequest:v21 withCompletionHandler:v46];

        goto LABEL_22;
      }
      v40 = [MEMORY[0x1E4F28B00] currentHandler];
      v41 = [NSString stringWithUTF8String:"NSString *getMCFeatureMusicVideosAllowed(void)"];
      objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, @"ICLiveLinkQRConnectionDataSource.m", 35, @"%s", dlerror());
    }
    else
    {
      v38 = [MEMORY[0x1E4F28B00] currentHandler];
      v39 = [NSString stringWithUTF8String:"NSString *getMCFeatureExplicitContentAllowed(void)"];
      objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, @"ICLiveLinkQRConnectionDataSource.m", 34, @"%s", dlerror());
    }
    __break(1u);
  }
  BOOL v7 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = a1[5];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "[ICQRConnectionLLDS] <%p> Failed to load bag with error %{public}@", buf, 0x16u);
  }

  (*((void (**)(void))a1[7] + 2))();
LABEL_23:
}

void __78__ICLiveLinkQRConnectionDataSource__joinSharedListeningSessionWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = [*(id *)(a1 + 32) report];
  [v7 endEvent:*(void *)(a1 + 40) withError:v6];

  if (v5 || !v6)
  {
    id v10 = [v5 urlResponse];
    v11 = [v10 valueForHTTPHeaderField:@"x-responding-instance"];
    v73 = [v10 valueForHTTPHeaderField:@"x-apple-jingle-correlation-key"];
    v74 = [v5 parsedBodyDictionary];
    if (v74)
    {
      id v12 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        uint64_t v78 = v13;
        __int16 v79 = 2112;
        id v80 = v74;
        _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEBUG, "[ICQRConnectionLLDS] <%p> Session discovery response %@", buf, 0x16u);
      }

      long long v14 = [v74 objectForKeyedSubscript:@"errors"];
      v71 = v11;
      if (_NSIsNSArray() && [v14 count])
      {
        long long v15 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay_Oversize");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 134218754;
          uint64_t v78 = v16;
          __int16 v79 = 2114;
          id v80 = v11;
          __int16 v81 = 2114;
          v82 = v73;
          __int16 v83 = 2114;
          v84 = v74;
          _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_ERROR, "<%p> response contains errors: instance=%{public}@ correlationKey=%{public}@ body=%{public}@", buf, 0x2Au);
        }

        v72 = [v14 firstObject];
        uint64_t v17 = [v72 objectForKeyedSubscript:@"code"];
        if (_NSIsNSString())
        {
          uint64_t v18 = [v72 objectForKeyedSubscript:@"code"];
          uint64_t v19 = [v18 integerValue];
        }
        else
        {
          uint64_t v19 = 0;
        }

        id v48 = [v72 objectForKeyedSubscript:@"messageForDisplay"];
        id v49 = v48;
        uint64_t v63 = v14;
        if (v48)
        {
          id v50 = v48;
        }
        else
        {
          v51 = [v72 objectForKeyedSubscript:@"detail"];
          uint64_t v52 = v51;
          if (v51)
          {
            id v53 = v51;
          }
          else
          {
            objc_msgSend(NSString, "stringWithFormat:", @"Server Error [%ld]", v19);
            id v53 = (id)objc_claimAutoreleasedReturnValue();
          }
          id v66 = v53;

          id v50 = v66;
        }

        uint64_t v54 = *(void *)(a1 + 48);
        v67 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v55 = *MEMORY[0x1E4F77908];
        uint64_t v56 = *MEMORY[0x1E4F28568];
        v75[0] = @"serverError";
        v75[1] = v56;
        v76[0] = v72;
        v76[1] = v50;
        v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:2];
        uint64_t v57 = [v72 objectForKeyedSubscript:@"title"];
        v58 = [v72 objectForKeyedSubscript:@"detail"];
        v59 = objc_msgSend(v67, "msv_errorWithDomain:code:userInfo:debugDescription:", v55, v19, v57, v58);
        (*(void (**)(uint64_t, void, void, void *))(v54 + 16))(v54, 0, 0, v59);

        uint64_t v26 = (void *)v57;
        long long v14 = v63;
        id v22 = v50;
      }
      else
      {
        v20 = [v74 objectForKeyedSubscript:@"results"];
        id v21 = [v20 objectForKeyedSubscript:@"session"];

        id v22 = [v21 objectForKeyedSubscript:@"attributes"];
        v23 = [v74 objectForKeyedSubscript:@"results"];
        uint64_t v24 = [v23 objectForKeyedSubscript:@"joinParams"];

        v25 = (void *)v24;
        v72 = v21;
        if (v21 && v22 && v24)
        {
          uint64_t v26 = [v21 objectForKeyedSubscript:@"id"];
          uint64_t v65 = [v22 objectForKeyedSubscript:@"groupId"];
          uint64_t v64 = [v25 objectForKeyedSubscript:@"anonymousHandles"];
          uint64_t v27 = [v25 objectForKeyedSubscript:@"joinToken"];
          uint64_t v28 = [v22 objectForKeyedSubscript:@"url"];
          if (v28)
          {
            [MEMORY[0x1E4F1CB10] URLWithString:v28];
            v68 = v25;
            uint64_t v29 = v27;
            uint64_t v30 = v28;
            uint64_t v31 = v22;
            __int16 v32 = v14;
            BOOL v34 = v33 = v26;
            [*(id *)(a1 + 32) setSharedListeningSessionInviteURL:v34];

            uint64_t v26 = v33;
            long long v14 = v32;
            id v22 = v31;
            uint64_t v28 = v30;
            uint64_t v27 = v29;
            v25 = v68;
          }
          v61 = (void *)v28;
          if (v26 && v65 && v64 && v27)
          {
            [*(id *)(a1 + 32) setSharedListeningSessionIdentifier:v26];
            [*(id *)(a1 + 32) setSharedSessionToken:v27];
            v35 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
            v36 = (void *)v65;
            v37 = (void *)v27;
            v38 = (void *)v64;
            v35();
          }
          else
          {
            v60 = (void *)v27;
            v70 = v26;
            v62 = v14;
            v45 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay_Oversize");
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              uint64_t v46 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 134218754;
              uint64_t v78 = v46;
              __int16 v79 = 2114;
              id v80 = v71;
              __int16 v81 = 2114;
              v82 = v73;
              __int16 v83 = 2114;
              v84 = v74;
              _os_log_impl(&dword_1A2D01000, v45, OS_LOG_TYPE_ERROR, "<%p> Response is missing required information. instance=%{public}@ correlationKey=%{public}@ body=%{public}@", buf, 0x2Au);
            }

            id v47 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", *MEMORY[0x1E4F77900], 102, v6, @"Session response is missing required fields.");
            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

            long long v14 = v62;
            v38 = (void *)v64;
            v36 = (void *)v65;
            uint64_t v26 = v70;
            v37 = v60;
          }
        }
        else
        {
          v69 = (void *)v24;
          v42 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay_Oversize");
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            uint64_t v43 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 134218754;
            uint64_t v78 = v43;
            __int16 v79 = 2114;
            id v80 = v71;
            __int16 v81 = 2114;
            v82 = v73;
            __int16 v83 = 2114;
            v84 = v74;
            _os_log_impl(&dword_1A2D01000, v42, OS_LOG_TYPE_ERROR, "<%p> response is missing required fields: instance=%{public}@ correlationKey=%{public}@ body=%{public}@", buf, 0x2Au);
          }

          uint64_t v44 = *(void *)(a1 + 48);
          uint64_t v26 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", *MEMORY[0x1E4F77900], 102, v6, @"Session response is missing required fields.");
          (*(void (**)(uint64_t, void, void, void *))(v44 + 16))(v44, 0, 0, v26);
          v25 = v69;
        }
      }

      v11 = v71;
    }
    else
    {
      v39 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay_Oversize");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = *(void *)(a1 + 32);
        v41 = [v5 parsedBody];
        *(_DWORD *)buf = 134218754;
        uint64_t v78 = v40;
        __int16 v79 = 2114;
        id v80 = v11;
        __int16 v81 = 2114;
        v82 = v73;
        __int16 v83 = 2114;
        v84 = v41;
        _os_log_impl(&dword_1A2D01000, v39, OS_LOG_TYPE_ERROR, "<%p> unexpected response instance=%{public}@ correlationKey=%{public}@ body=%{public}@", buf, 0x2Au);
      }
      long long v14 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", *MEMORY[0x1E4F77900], 102, v6, @"Session data did not form dictionary.");
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      uint64_t v78 = v9;
      __int16 v79 = 2114;
      id v80 = v6;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "[ICQRConnectionLLDS] <%p> Response error %{public}@", buf, 0x16u);
    }

    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", *MEMORY[0x1E4F77900], 102, v6, @"Received error from session discovery.");
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __78__ICLiveLinkQRConnectionDataSource__joinSharedListeningSessionWithCompletion___block_invoke_94(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v6 = (id)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  v3 = +[ICClientInfo clientInfoForMusicKitRequestWithClientIdentifier:v6 clientVersion:@"1"];
  [v2 setClientInfo:v3];
  id v4 = +[ICUserIdentityStore defaultIdentityStore];
  [v2 setIdentityStore:v4];

  id v5 = +[ICUserIdentity activeAccount];
  [v2 setIdentity:v5];
}

- (void)_revokeUserPseudonymWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ICLiveLinkQRConnectionDataSource *)self pseudonymRenewalTimer];
  [v5 invalidate];

  [(ICLiveLinkQRConnectionDataSource *)self setPseudonymRenewalTimer:0];
  id v6 = [(ICLiveLinkQRConnectionDataSource *)self pseudonym];

  if (v6)
  {
    BOOL v7 = [(ICLiveLinkQRConnectionDataSource *)self service];
    id v8 = [(ICLiveLinkQRConnectionDataSource *)self pseudonym];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__ICLiveLinkQRConnectionDataSource__revokeUserPseudonymWithCompletion___block_invoke;
    v9[3] = &unk_1E5ACB920;
    id v10 = v4;
    [v7 revokePseudonym:v8 completion:v9];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

uint64_t __71__ICLiveLinkQRConnectionDataSource__revokeUserPseudonymWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_renewUserPseudonym
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(ICLiveLinkQRConnectionDataSource *)self pseudonym];
    id v5 = [v4 URI];
    id v6 = [v5 prefixedURI];
    *(_DWORD *)buf = 134218242;
    v11 = self;
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Will renew pseudonym %{public}@", buf, 0x16u);
  }
  BOOL v7 = [(ICLiveLinkQRConnectionDataSource *)self service];
  id v8 = [(ICLiveLinkQRConnectionDataSource *)self pseudonym];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__ICLiveLinkQRConnectionDataSource__renewUserPseudonym__block_invoke;
  v9[3] = &unk_1E5ACB8F8;
  void v9[4] = self;
  [v7 renewPseudonym:v8 forUpdatedDuration:v9 completion:43200.0];
}

void __55__ICLiveLinkQRConnectionDataSource__renewUserPseudonym__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__ICLiveLinkQRConnectionDataSource__renewUserPseudonym__block_invoke_2;
  block[3] = &unk_1E5ACD5C8;
  block[4] = *(void *)(a1 + 32);
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

void __55__ICLiveLinkQRConnectionDataSource__renewUserPseudonym__block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) pseudonym];

  if (!v2)
  {
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v25 = 134217984;
      uint64_t v26 = v13;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Cleared while renewing pseudonym.", (uint8_t *)&v25, 0xCu);
    }
    goto LABEL_9;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      BOOL v7 = *(void **)(a1 + 40);
      int v25 = 134218242;
      uint64_t v26 = v6;
      __int16 v27 = 2114;
      uint64_t v28 = v7;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "[ICQRConnectionLLDS] <%p> Failed to renew pseudonym with error: %{public}@", (uint8_t *)&v25, 0x16u);
    }

    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", *MEMORY[0x1E4F77900], 101, *(void *)(a1 + 40), @"Failed to renew pseudonym.");
    id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v9 removeObjectForKey:@"ICLiveLinkQRConnectionDataSourcePseudonymURI"];

    id v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v10 removeObjectForKey:@"ICLiveLinkQRConnectionDataSourcePseudonymURIExpirationTimestamp"];

    id v11 = [*(id *)(a1 + 32) dataSourceErrorHandler];

    if (v11)
    {
      id v12 = [*(id *)(a1 + 32) dataSourceErrorHandler];
      ((void (**)(void, NSObject *))v12)[2](v12, v8);
    }
LABEL_9:

    return;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    long long v15 = [*(id *)(a1 + 48) URI];
    uint64_t v16 = [v15 prefixedURI];
    uint64_t v17 = [*(id *)(a1 + 48) properties];
    uint64_t v18 = [v17 expirationDate];
    int v25 = 134218498;
    uint64_t v26 = v14;
    __int16 v27 = 2114;
    uint64_t v28 = v16;
    __int16 v29 = 2114;
    uint64_t v30 = v18;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Renewed pseudonym: %{public}@ with expiry: %{public}@", (uint8_t *)&v25, 0x20u);
  }
  uint64_t v19 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v20 = [*(id *)(a1 + 48) URI];
  id v21 = [v20 prefixedURI];
  [v19 setObject:v21 forKey:@"ICLiveLinkQRConnectionDataSourcePseudonymURI"];

  id v22 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v23 = [*(id *)(a1 + 48) properties];
  uint64_t v24 = [v23 expirationDate];
  [v24 timeIntervalSinceReferenceDate];
  objc_msgSend(v22, "setDouble:forKey:", @"ICLiveLinkQRConnectionDataSourcePseudonymURIExpirationTimestamp");

  [*(id *)(a1 + 32) setPseudonym:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _beginPseudonymAutoRenewal];
}

- (void)_beginPseudonymAutoRenewal
{
  uint64_t v3 = [(ICLiveLinkQRConnectionDataSource *)self pseudonym];
  id v4 = [v3 properties];
  id v5 = [v4 expirationDate];
  [v5 timeIntervalSinceNow];
  double v7 = v6 + -120.0;

  if (v7 < 0.0) {
    double v7 = 0.0;
  }
  objc_initWeak(&location, self);
  id v8 = objc_alloc(MEMORY[0x1E4F77A30]);
  id v9 = [(ICLiveLinkQRConnectionDataSource *)self queue];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __62__ICLiveLinkQRConnectionDataSource__beginPseudonymAutoRenewal__block_invoke;
  uint64_t v14 = &unk_1E5ACD778;
  objc_copyWeak(&v15, &location);
  id v10 = (void *)[v8 initWithInterval:v9 queue:&v11 block:v7];
  -[ICLiveLinkQRConnectionDataSource setPseudonymRenewalTimer:](self, "setPseudonymRenewalTimer:", v10, v11, v12, v13, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __62__ICLiveLinkQRConnectionDataSource__beginPseudonymAutoRenewal__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained pseudonymRenewalTimer];
  [v1 invalidate];

  [WeakRetained _renewUserPseudonym];
}

- (void)_provisionUserPseudonymWithCompletion:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICLiveLinkQRConnectionDataSource *)self account];

  if (v5)
  {
    double v6 = [(ICLiveLinkQRConnectionDataSource *)self account];
    double v7 = [v6 accountRegisteredURIs];
    id v8 = [v7 firstObject];

    if (v8)
    {
      id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v10 = [v9 stringForKey:@"ICLiveLinkQRConnectionDataSourcePseudonymURI"];

      uint64_t v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v11 doubleForKey:@"ICLiveLinkQRConnectionDataSourcePseudonymURIExpirationTimestamp"];
      double v13 = v12;

      uint64_t v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v13];
      id v15 = v14;
      id v48 = (void *)v10;
      if (v10)
      {
        [v14 timeIntervalSinceNow];
        if (v16 >= 120.0)
        {
          uint64_t v17 = [(ICLiveLinkQRConnectionDataSource *)self service];
          uint64_t v18 = [v17 pseudonymURIMap];
          uint64_t v19 = [v18 objectForKeyedSubscript:v8];

          if ([v19 count])
          {
            uint64_t v44 = self;
            v45 = v15;
            uint64_t v46 = v8;
            id v47 = v4;
            long long v53 = 0u;
            long long v54 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            uint64_t v43 = v19;
            id v20 = v19;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v51 objects:v61 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v52;
              while (2)
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v52 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  int v25 = *(void **)(*((void *)&v51 + 1) + 8 * i);
                  uint64_t v26 = objc_msgSend(v25, "properties", v43);
                  __int16 v27 = [v26 expirationDate];
                  [v27 timeIntervalSinceNow];
                  if (v28 >= 120.0)
                  {
                    [v25 URI];
                    v30 = id v29 = v20;
                    uint64_t v31 = [v30 prefixedURI];
                    int v32 = [v31 isEqualToString:v48];

                    id v20 = v29;
                    if (v32)
                    {
                      v38 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                      {
                        v39 = [v25 URI];
                        uint64_t v40 = [v39 prefixedURI];
                        v41 = [v25 properties];
                        v42 = [v41 expirationDate];
                        *(_DWORD *)buf = 134218498;
                        uint64_t v56 = v44;
                        __int16 v57 = 2114;
                        v58 = v40;
                        __int16 v59 = 2114;
                        v60 = v42;
                        _os_log_impl(&dword_1A2D01000, v38, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Using existing pseudonym: %{public}@ with expiry: %{public}@", buf, 0x20u);

                        id v20 = v29;
                      }

                      id v4 = v47;
                      (*((void (**)(id, void *, void))v47 + 2))(v47, v25, 0);

                      id v15 = v45;
                      id v8 = v46;
                      goto LABEL_21;
                    }
                  }
                  else
                  {
                  }
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v51 objects:v61 count:16];
                if (v22) {
                  continue;
                }
                break;
              }
            }

            id v8 = v46;
            id v4 = v47;
            self = v44;
            id v15 = v45;
            uint64_t v19 = v43;
          }
        }
      }
      v33 = [(ICLiveLinkQRConnectionDataSource *)self service];
      id v20 = [v33 pseudonymPropertiesWithFeatureID:@"SharedListening" scopeID:0 expiryDurationInSeconds:43200.0];

      BOOL v34 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218243;
        uint64_t v56 = self;
        __int16 v57 = 2113;
        v58 = v8;
        _os_log_impl(&dword_1A2D01000, v34, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Provisioning pseudonym for uri: %{private}@.", buf, 0x16u);
      }

      v35 = [(ICLiveLinkQRConnectionDataSource *)self service];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __74__ICLiveLinkQRConnectionDataSource__provisionUserPseudonymWithCompletion___block_invoke;
      v49[3] = &unk_1E5ACB8D0;
      v49[4] = self;
      id v50 = v4;
      [v35 provisionPseudonymForURI:v8 withProperties:v20 completion:v49];

LABEL_21:
    }
    else
    {
      v37 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x1E4F77900], 101, @"User account has no registered URIs.");
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v37);
    }
  }
  else
  {
    v36 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x1E4F77900], 100, @"No account found on service.");
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v36);
  }
}

void __74__ICLiveLinkQRConnectionDataSource__provisionUserPseudonymWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [v5 URI];
    uint64_t v10 = [v9 prefixedURI];
    uint64_t v11 = [v5 properties];
    double v12 = [v11 expirationDate];
    int v20 = 134218754;
    uint64_t v21 = v8;
    __int16 v22 = 2114;
    uint64_t v23 = v10;
    __int16 v24 = 2114;
    int v25 = v12;
    __int16 v26 = 2114;
    id v27 = v6;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Provisioned pseudonym: %{public}@ with expiry: %{public}@, error: %{public}@", (uint8_t *)&v20, 0x2Au);
  }
  if (v6)
  {
    double v13 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", *MEMORY[0x1E4F77900], 101, v6, @"Failed to provision pseudonym.");
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v15 = [v5 URI];
    double v16 = [v15 prefixedURI];
    [v14 setObject:v16 forKey:@"ICLiveLinkQRConnectionDataSourcePseudonymURI"];

    uint64_t v17 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v18 = [v5 properties];
    uint64_t v19 = [v18 expirationDate];
    [v19 timeIntervalSinceReferenceDate];
    objc_msgSend(v17, "setDouble:forKey:", @"ICLiveLinkQRConnectionDataSourcePseudonymURIExpirationTimestamp");

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)populateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ICLiveLinkQRConnectionDataSource *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ICLiveLinkQRConnectionDataSource_populateWithCompletion___block_invoke;
  v7[3] = &unk_1E5ACD2F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__ICLiveLinkQRConnectionDataSource_populateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__ICLiveLinkQRConnectionDataSource_populateWithCompletion___block_invoke_2;
  v12[3] = &unk_1E5ACB858;
  id v2 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v2;
  uint64_t v3 = (void *)MEMORY[0x1A6240BF0](v12);
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = @"com.apple.private.alloy.itunes";
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] Creating service %@", buf, 0xCu);
  }

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.itunes"];
  [*(id *)(a1 + 32) setService:v5];

  id v6 = [*(id *)(a1 + 32) report];
  [v6 startEvent:@"Provision Pseudonym"];

  double v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__ICLiveLinkQRConnectionDataSource_populateWithCompletion___block_invoke_39;
  v9[3] = &unk_1E5ACB8A8;
  void v9[4] = v7;
  id v10 = *(id *)(a1 + 40);
  id v11 = v3;
  id v8 = v3;
  [v7 _provisionUserPseudonymWithCompletion:v9];
}

void __59__ICLiveLinkQRConnectionDataSource_populateWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  v28[5] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [*(id *)(a1 + 32) report];
  [v10 endEvent:@"Session Discovery" withError:v9];
  if (v9)
  {
    id v11 = [*(id *)(a1 + 32) pseudonymRenewalTimer];
    [v11 invalidate];

    double v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    [v10 setGroupSessionIdentifier:v7];
    id v13 = [*(id *)(a1 + 32) sharedListeningSessionIdentifier];
    [v10 setSharedListeningSessionIdentifier:v13];

    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
    [*(id *)(a1 + 32) setGroupSessionIdentifier:v14];

    uint64_t v15 = *MEMORY[0x1E4F6AA98];
    v27[0] = *MEMORY[0x1E4F6AAB8];
    v27[1] = v15;
    v28[0] = &unk_1EF640AF8;
    v28[1] = MEMORY[0x1E4F1CC38];
    uint64_t v16 = *MEMORY[0x1E4F6A898];
    v27[2] = *MEMORY[0x1E4F6AAB0];
    v27[3] = v16;
    v28[2] = MEMORY[0x1E4F1CC38];
    v28[3] = v8;
    v27[4] = *MEMORY[0x1E4F6A890];
    uint64_t v17 = [*(id *)(a1 + 32) groupSessionIdentifier];
    uint64_t v18 = [v17 UUIDString];
    v28[4] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
    [*(id *)(a1 + 32) setGroupSessionOptions:v19];

    int v20 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void **)(a1 + 32);
      __int16 v22 = [v21 sharedListeningSessionIdentifier];
      int v23 = 134218242;
      __int16 v24 = v21;
      __int16 v25 = 2114;
      __int16 v26 = v22;
      _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Populated with shared listening identifier: %{public}@", (uint8_t *)&v23, 0x16u);
    }
    double v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v12();
}

void __59__ICLiveLinkQRConnectionDataSource_populateWithCompletion___block_invoke_39(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] report];
  [v7 endEvent:@"Provision Pseudonym" withError:v6];

  id v8 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ICLiveLinkQRConnectionDataSource_populateWithCompletion___block_invoke_2_40;
  block[3] = &unk_1E5ACB880;
  id v13 = v6;
  id v9 = a1[5];
  id v15 = v5;
  id v16 = v9;
  id v14 = a1[4];
  id v17 = a1[6];
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, block);
}

uint64_t __59__ICLiveLinkQRConnectionDataSource_populateWithCompletion___block_invoke_2_40(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v2();
  }
  else
  {
    [*(id *)(a1 + 40) setPseudonym:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) _beginPseudonymAutoRenewal];
    id v4 = [*(id *)(a1 + 40) report];
    [v4 startEvent:@"Session Discovery"];

    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 64);
    return [v5 _joinSharedListeningSessionWithCompletion:v6];
  }
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v6 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Deallocating.", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)ICLiveLinkQRConnectionDataSource;
  [(ICLiveLinkQRConnectionDataSource *)&v4 dealloc];
}

- (ICLiveLinkQRConnectionDataSource)initWithSharedListeningSessionIdentifier:(id)a3 identity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICLiveLinkQRConnectionDataSource;
  id v8 = [(ICLiveLinkQRConnectionDataSource *)&v17 init];
  if (v8)
  {
    uint64_t v9 = [v7 externalIdentifier];
    externalIdentifier = v8->_externalIdentifier;
    v8->_externalIdentifier = (NSString *)v9;

    uint64_t v11 = [v6 copy];
    sharedListeningSessionIdentifier = v8->_sharedListeningSessionIdentifier;
    v8->_sharedListeningSessionIdentifier = (NSString *)v11;

    id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.amp.mediaservices.MSVQRConnectionLiveLinkDataSource.serialQueue", v13);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v14;
  }
  return v8;
}

+ (id)dataSourceForExistingSharedListeningSession:(id)a3 identity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[ICLiveLinkQRConnectionDataSource alloc] initWithSharedListeningSessionIdentifier:v6 identity:v5];

  return v7;
}

+ (id)dataSourceForNewSharedListeningSessionWithIdentity:(id)a3
{
  id v3 = a3;
  objc_super v4 = [[ICLiveLinkQRConnectionDataSource alloc] initWithSharedListeningSessionIdentifier:0 identity:v3];

  return v4;
}

@end